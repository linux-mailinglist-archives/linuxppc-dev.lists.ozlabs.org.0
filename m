Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6237F586
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 12:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgnkC5QRlz301J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 20:21:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=jUliB6QB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=jgross@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=jUliB6QB; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgnjh373Yz2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 20:20:38 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620901236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gv3oECQ46RpkqjsSmVdu+DBDmUv5de8Z0G7uM0jmSok=;
 b=jUliB6QB+yR8m7zRmYNUYKDKJ3/1vxpyky3PJGw3F93zhwBoHSkhylkgwQb1Vaq7l1dlm1
 2KogYYZd78ZTwfzoJSBPcNNs5osgvCANhvLt7vleAdSAVPhIeb3n8SETjdMtUSokPWGDd5
 Ownp3SVZ9wWKrhXoIPaI4X6u/QbH9/0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47268B15E;
 Thu, 13 May 2021 10:20:36 +0000 (UTC)
Subject: Re: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-9-jgross@suse.com>
 <6da4cc91-ccde-fce8-707c-e7544783c2fa@csgroup.eu>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e62b12e7-6dbe-3d26-2196-9cbc2c0d4160@suse.com>
Date: Thu, 13 May 2021 12:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6da4cc91-ccde-fce8-707c-e7544783c2fa@csgroup.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PNhWaVfjD0otdP9RzGGQdOMphOo0bj07j"
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PNhWaVfjD0otdP9RzGGQdOMphOo0bj07j
Content-Type: multipart/mixed; boundary="yyRuUPzqcs5EAOdYBXLJTxPGRA5Ebq4bt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Message-ID: <e62b12e7-6dbe-3d26-2196-9cbc2c0d4160@suse.com>
Subject: Re: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-9-jgross@suse.com>
 <6da4cc91-ccde-fce8-707c-e7544783c2fa@csgroup.eu>
In-Reply-To: <6da4cc91-ccde-fce8-707c-e7544783c2fa@csgroup.eu>

--yyRuUPzqcs5EAOdYBXLJTxPGRA5Ebq4bt
Content-Type: multipart/mixed;
 boundary="------------8C09C99EF5386C5A52D248BD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8C09C99EF5386C5A52D248BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.05.21 12:16, Christophe Leroy wrote:
>=20
>=20
> Le 13/05/2021 =C3=A0 12:03, Juergen Gross a =C3=A9crit=C2=A0:
>> Xen frontends shouldn't BUG() in case of illegal data received from
>> their backends. So replace the BUG_ON()s when reading illegal data fro=
m
>> the ring page with negative return values.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> =C2=A0 drivers/tty/hvc/hvc_xen.c | 15 +++++++++++++--
>> =C2=A0 1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
>> index 92c9a476defc..30d7ffb1e04c 100644
>> --- a/drivers/tty/hvc/hvc_xen.c
>> +++ b/drivers/tty/hvc/hvc_xen.c
>> @@ -86,6 +86,11 @@ static int __write_console(struct xencons_info=20
>> *xencons,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cons =3D intf->out_cons;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prod =3D intf->out_prod;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mb();=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* update queue values before going on */
>> +
>> +=C2=A0=C2=A0=C2=A0 if (WARN_ONCE((prod - cons) > sizeof(intf->out),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "Illegal ring page indices"))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON((prod - cons) > sizeof(intf->out=
));
>=20
> Why keep the BUG_ON() ?

Oh, failed to delete it. Thanks for noticing.


Juergen

--------------8C09C99EF5386C5A52D248BD
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------8C09C99EF5386C5A52D248BD--

--yyRuUPzqcs5EAOdYBXLJTxPGRA5Ebq4bt--

--PNhWaVfjD0otdP9RzGGQdOMphOo0bj07j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCc/XMFAwAAAAAACgkQsN6d1ii/Ey/C
FQf+OD+N3eBcm476rbHE/SMrRCrdPemYIIfTIa5eniRP163hc8D1XpMWlkcy5Im93pdCIpKY0tTp
2W2b04SywD+i6CehGWJ+nKEvRh1wNiJdGF+EWyf5QQGdmixgOhHzWEcOdn+uI770XafZTPT2w3x2
Ki7nKgGa7Gjr6xCJhexpnMYtQe4uo1SXTRT9j+W10jA6ppaG8zB4pE8ONyHG2c+CN7Ue354XBM4X
QVNLngs5PFy8LbNyhfU1IU1kG/0rrFmwsd2+CRRx0iCgtlcxaVwkPsIEF0e17l2rXGj0+aniQXW8
NcRQ00qw+18DPctnaLB1OU2GUgEJnuLWGzEuR6NdDg==
=tAfr
-----END PGP SIGNATURE-----

--PNhWaVfjD0otdP9RzGGQdOMphOo0bj07j--
