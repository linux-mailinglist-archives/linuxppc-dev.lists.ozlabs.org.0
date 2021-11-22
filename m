Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA5458A71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 09:21:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyKwr56CHz301g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 19:21:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iZuH8N02;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=jgross@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=iZuH8N02; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyKwB1mnZz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 19:20:40 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E06D212C9;
 Mon, 22 Nov 2021 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1637569236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ff3sFJnwHj4g47uQQ2WaQKizkxdoi19uAVGPOc0LUYk=;
 b=iZuH8N02ke6VpWOFbNvwci86IpLj6WoPAcypg/xzyuEndH5+rn0W4QbabTkCYJtWYJ8Dfz
 3X32MQcKvBCvmgo02rIihHMrRKOrt6rbI0RLss5Mci8NdQoXldX6ee71bluqqXIbUh+Rw6
 1uSX+eEVIgasLIjLP2aITuWCi2w0vaM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F03F313ACC;
 Mon, 22 Nov 2021 08:20:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ye0DOdNSm2HEMQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 Nov 2021 08:20:35 +0000
Subject: Re: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
To: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20211022064800.14978-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bf5a4749-0216-53db-a022-ef4f84d823c5@suse.com>
Date: Mon, 22 Nov 2021 09:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211022064800.14978-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XEaNfdRUT9nxGyjL4aqukte3olVamRRGk"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XEaNfdRUT9nxGyjL4aqukte3olVamRRGk
Content-Type: multipart/mixed; boundary="OWjDMMJSeGZf17EglbIPG7kS4okiXpxXj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Message-ID: <bf5a4749-0216-53db-a022-ef4f84d823c5@suse.com>
Subject: Re: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
References: <20211022064800.14978-1-jgross@suse.com>
In-Reply-To: <20211022064800.14978-1-jgross@suse.com>

--OWjDMMJSeGZf17EglbIPG7kS4okiXpxXj
Content-Type: multipart/mixed;
 boundary="------------2CA7EB0B620BD414B5FABDC4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2CA7EB0B620BD414B5FABDC4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.10.21 08:47, Juergen Gross wrote:
> Today the non-essential pv devices are hard coded in the xenbus driver
> and this list is lacking multiple entries.
>=20
> This series reworks the detection logic of non-essential devices by
> adding a flag for that purpose to struct xenbus_driver.
>=20
> Juergen Gross (5):
>    xen: add "not_essential" flag to struct xenbus_driver
>    xen: flag xen_drm_front to be not essential for system boot
>    xen: flag hvc_xen to be not essential for system boot
>    xen: flag pvcalls-front to be not essential for system boot
>    xen: flag xen_snd_front to be not essential for system boot
>=20
>   drivers/gpu/drm/xen/xen_drm_front.c        |  1 +
>   drivers/input/misc/xen-kbdfront.c          |  1 +
>   drivers/tty/hvc/hvc_xen.c                  |  1 +
>   drivers/video/fbdev/xen-fbfront.c          |  1 +
>   drivers/xen/pvcalls-front.c                |  1 +
>   drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
>   include/xen/xenbus.h                       |  1 +
>   sound/xen/xen_snd_front.c                  |  1 +
>   8 files changed, 10 insertions(+), 11 deletions(-)
>=20

Any further comments?


Juergen

--------------2CA7EB0B620BD414B5FABDC4
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2CA7EB0B620BD414B5FABDC4--

--OWjDMMJSeGZf17EglbIPG7kS4okiXpxXj--

--XEaNfdRUT9nxGyjL4aqukte3olVamRRGk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGbUtMFAwAAAAAACgkQsN6d1ii/Ey8C
1Qf/YfoBv1l6Tq2f0wMBQKsAOR+FYHvpwvebr7MgEpYdc2q31N7iFloujufNoVMHVVzMT1ALCHr6
cQEwSvk+X0mXidxvXBLYi/ZMMJ5F/fKtK8M151B9E6XJ7rBikW71qu/3QbVbhqrVEw/nx73zyk3v
OFc78wOoxCjYlkYffnub22qaVhnpYgrO3lka2nNEditpGCbIvKNcINTUp0exBLMTQxc3xZyvyNwR
ZllRNBQrQacpDXFKr6mrmdLY1EYIejtoPaauTMBi7c/RBJCiLoNE4sxmV5u473jVZ8T9003BQ8qr
9fWvu96QdIKHjAmdrdYobCzxRddVjj+QhYzqrDiFTQ==
=GTer
-----END PGP SIGNATURE-----

--XEaNfdRUT9nxGyjL4aqukte3olVamRRGk--
