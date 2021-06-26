Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 911983B5063
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 00:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC8L83Tl7z3c4h
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 08:53:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=YKidPBzj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de;
 envelope-from=j.ne@posteo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=YKidPBzj; dkim-atps=neutral
X-Greylist: delayed 459 seconds by postgrey-1.36 at boromir;
 Sun, 27 Jun 2021 07:35:14 AEST
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6bk5lC4z301K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 07:35:12 +1000 (AEST)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 180C32400E5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 23:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1624742846; bh=41rpbSn2Uyn0qALHKbYOc9/feymQyErjP+9elyuLFbA=;
 h=Date:From:To:Cc:Subject:From;
 b=YKidPBzjA63zz30yQIi00yBJHnHM2jl9JcmbnCDrfgbA+YpcIE9q3+cWOGZ078BBc
 AeMH1m2poKW9mZWUUrH7s6E56UaoryDtH41SPpH3Nyf7AlS3zmas+fflpJtCiQQ9eO
 spOMMOS0Bq4kwfK0uPcNejTXGSVZojw6HKaUSiLjic+YoMaNH2Zsro2KItHIN+Cnf2
 0rssMMNFjalndR2wCpp5//fo9OJxTVrl/P0EJM6sWcx3tjOP4H8rrWQCcRhu3SXL1E
 A18sHONTca/zhF2Uc2a23Up2nImqEdZZOQ1ymdXYquDXToqTbpwPcDPNn/KROJv92v
 5fsaWqbqbcaPw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GC6Qg0r7lz9rxL;
 Sat, 26 Jun 2021 23:27:23 +0200 (CEST)
Date: Sat, 26 Jun 2021 21:27:22 +0000
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v2 2/4] dt-bindings: nintendo-otp: Document the Wii and
 Wii U OTP support
Message-ID: <YNebuj3J51FbWC1n@latitude>
References: <20210519095044.4109-1-linkmauve@linkmauve.fr>
 <20210519095044.4109-3-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7j5plNaFnrRdIOyG"
Content-Disposition: inline
In-Reply-To: <20210519095044.4109-3-linkmauve@linkmauve.fr>
X-Mailman-Approved-At: Sun, 27 Jun 2021 08:53:13 +1000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7j5plNaFnrRdIOyG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello and sorry for the delay,

On Wed, May 19, 2021 at 11:50:42AM +0200, Emmanuel Gil Peyrot wrote:
> Both of these consoles use the exact same two registers, even at the
> same address, but the Wii=C2=A0U has eight banks of 128=C2=A0bytes memory=
 while
> the Wii only has one, hence the two compatible strings.
>=20
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

A link to the (third-party) documentation for the OTP device would be nice.


Best regards,
Jonathan Neusch=C3=A4fer

> ---
>  .../devicetree/bindings/nvmem/nintendo-otp.txt     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/nintendo-otp.txt b/D=
ocumentation/devicetree/bindings/nvmem/nintendo-otp.txt
> new file mode 100644
> index 000000000000..b26d705ec52d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nintendo-otp.txt
> @@ -0,0 +1,14 @@
> +Nintendo Wii and Wii=C2=A0U OTP
> +
> +Required Properties:
> +- compatible: depending on the console this should be one of:
> +	- "nintendo,hollywood-otp" for the Wii
> +	- "nintendo,latte-otp" for the Wii=C2=A0U
> +- reg: base address and size of the OTP registers
> +
> +
> +Example:
> +	otp@d8001ec {
> +		compatible =3D "nintendo,latte-otp";
> +		reg =3D <0x0d8001ec 0x8>;
> +	};
> --=20
> 2.31.1
>=20

--7j5plNaFnrRdIOyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDXm4sACgkQCDBEmo7z
X9veGhAAy2IY+Vkls/q+6+hkbYXDroy+O6Ogd0JYudibYnde3Y0McY0c+7nRHSBP
jFIcSJfAEzdBk1X+g18nVJsB/ysvDZ3eMbWjGoOb2e5nNhT+G/Xhvpl0bSInHpel
SqhHoCj3iSCzmZGlUiyKewjGEVboi1/iQR7Wq5gFctNgpDmwapb8w6RRYY8vjg/E
+iI4gSDqgWLkWkDqQengP9AP3X+IKYgs2Xg+ZbXyGl1kx3ZRwxT2G1UEao1T2l1o
WKlUAAdlB30+qigZVuCkFkuGTMUn7eSLVyWm3gAzu1toHtMChz3faac4ZnYIxcjl
1kJKnu3dcMySRO8ITQIPsbIxwweWoSoRST0kEGueFylSzo5Kgh93DCBeChoGIcCG
WeyP7gspFkcm3c6iR4yG+7W+VdKmO3nhSMlMNnttH8mRIO66quV8qV9k0tfVD6DH
litoyTLmNT4f34T1+kTo0lzo3sRDRcRYt4ZikEqFXVQOHCCAylo6MLjvXLbaFAFd
3PGKz9tYf7RtT82DDuvnVje1S13hTZ10eOO6HDvSGWPB5zbTks15zNEAE6H2Un3Y
Xy1Jewlg/9EgaQTM6JzQjz9DG5/z3v26QpfJYo3Kpqg0ssCr9TXkJ/SPSCtq5w7e
Qmf5ZZpL5hbPj32UremiOB9lLHloav3l8w8E7HS0lVv6tszVyk8=
=CJPN
-----END PGP SIGNATURE-----

--7j5plNaFnrRdIOyG--
