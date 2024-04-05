FROM alpine AS build

RUN apk add --no-cache gcc git libc-dev \
  && git clone https://git.sr.ht/~rabbits/modal
RUN mkdir /build
RUN cd modal \
  && cc src/modal.c -o /build/modal

COPY eval /build/eval

# /build



FROM alpine

COPY --from=build /build /bin

ENTRYPOINT ["eval"]
