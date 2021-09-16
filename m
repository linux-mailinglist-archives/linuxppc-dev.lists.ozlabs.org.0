Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D571440D9AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 14:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9GMg5gc2z2ywh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 22:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:828:c7c0:49:5ff:fe41:d261;
 helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr;
 receiver=<UNKNOWN>)
X-Greylist: delayed 322 seconds by postgrey-1.36 at boromir;
 Thu, 16 Sep 2021 22:18:14 AEST
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:49:5ff:fe41:d261])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9GMB16VFz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 22:18:14 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 256ABF40B33; Thu, 16 Sep 2021 14:12:41 +0200 (CEST)
Date: Thu, 16 Sep 2021 14:12:40 +0200
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] nvmem: NVMEM_NINTENDO_OTP should depend on WII
Message-ID: <20210916121240.okknaglns4bjmczp@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <01318920709dddc4d85fe895e2083ca0eee234d8.1631611652.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4qla4vdo44bvrd6u"
Content-Disposition: inline
In-Reply-To: <01318920709dddc4d85fe895e2083ca0eee234d8.1631611652.git.geert+renesas@glider.be>
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4qla4vdo44bvrd6u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, thanks for this patch, once the Wii=A0U platform will be added it will
need an additional test for WIIU, but for now this is:

Reviewed-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

On Tue, Sep 14, 2021 at 11:29:49AM +0200, Geert Uytterhoeven wrote:
> The Nintendo Wii and Wii U OTP is only present on Nintendo Wii and Wii U
> consoles.  Hence add a dependency on WII, to prevent asking the user
> about this driver when configuring a kernel without Nintendo Wii and Wii
> U console support.
>=20
> Fixes: 3683b761fe3a10ad ("nvmem: nintendo-otp: Add new driver for the Wii=
 and Wii U OTP")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/nvmem/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 39854d43758be3fb..da414617a54d4b99 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -109,6 +109,7 @@ config MTK_EFUSE
> =20
>  config NVMEM_NINTENDO_OTP
>  	tristate "Nintendo Wii and Wii U OTP Support"
> +	depends on WII || COMPILE_TEST
>  	help
>  	  This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
> =20
> --=20
> 2.25.1

--=20
Emmanuel Gil Peyrot

--4qla4vdo44bvrd6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmFDNLQACgkQOWgfYkb2
LpA6OQgAqnp5vZBBdcMfXSA8IEnqzcZRa0PHdW/d3FK7bczJocUPNc4mvQFexP0t
7AuWaXNMOEWq2xOd05eggwhSQgB2OMZ/wtA63fKOrP5gq1QdzSN5hDzM2ew1MnyR
x8x/CoMc4JOk/mmbZFSTiYx8wC3M37uCkfugZdS0actXv/2kuiWfPhUIvvlrZG92
ebYlFUQMhQX43c62Au0DUCwRy0VQJW2+lRVlIHghtrSUfey1m79qfICnt5+g5Llv
DA0kchTFuBpyO2s3pGAmKnd3fCOQ8jBtqLgg3ZJNrqbfwnl3ezoS7f0tw8qQeBQy
4VVzKdfPm7I3b9Od3GDm8Suv9HIvtg==
=6DDx
-----END PGP SIGNATURE-----

--4qla4vdo44bvrd6u--
