# prueba_a_kasa

A new Flutter project.

## Getting Started

this project is a login for some people, who have some disability.

### permission_handler:

es necesario tener acceso a microfono e internet Android

`$ android.useAndroidX=true`
`$ android.enableJetifier=true`

> android {
> compileSdkVersion 28
> ...
> }

> defaultConfig {
> minSdkVersion 21
> ...
> }

## permisos andorid Manifest

`$ <uses-permission android:name="android.permission.INTERNET" />`
`$ <uses-permission android:name="android.permission.RECORD_AUDIO" />`

(https://github.com/skaad102/akasa/blob/master/lib/doc/app2.jpeg)
Presionando el icono del microfono se dice telefono seguido del numero, contraseña seguido del pin

(https://github.com/skaad102/akasa/blob/master/lib/doc/app1.png)
