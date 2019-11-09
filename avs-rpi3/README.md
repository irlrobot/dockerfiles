# WIP Not yet functional

# Building avs-device-sdk binaries for the Raspberry Pi 3
Tested using a Pi 3 B+

```
docker build --build-arg clientid=your_client_id \
    --build-arg productid=your_product_id \
    --build-arg serialnumber=123456 \
    --build-arg numbuildjobs=1 \
    -t avs-rpi3 \
    .
```
