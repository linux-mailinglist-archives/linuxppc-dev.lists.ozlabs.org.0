Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60C3B5089
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 01:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC9FP2CZMz309s
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 09:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=G0rvLrMD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de;
 envelope-from=j.ne@posteo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=G0rvLrMD; dkim-atps=neutral
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC9Dx4CmTz2yXc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 09:34:07 +1000 (AEST)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 4B6C1240026
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 01:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1624750444; bh=JeORn0wzi/Pu/QO65imy4jO5dUBCfYL8bqgtjgUWze0=;
 h=Date:From:To:Cc:Subject:From;
 b=G0rvLrMD8U9cmFSF3dhOSHQs8Sgk7c12GaCw+B/FnCBkw/dbRDY87FMP8s58A0yP7
 f7OQfF5t3lGh+vq5BcPML3l+5onT+kVHskAZEtsanYWU11+AZdzLl5syf7m80iqh+o
 I+Ae0rIh7kO71qPbZnBsDNGmC4TmIplCA0kLMLTLMxajevZK5nXQIZSQ2elwtfAbzM
 RdyfZPNk3xF/YuWPO5O8fyhwCzHCbLSZq9eBG6bngnGrZT7euEUTQj6YHZ0Y7oplt+
 hq2Ob7QbrPLfBvR6Lr8N1nxfJbOiuDXN2lAYNvCz2NkxfZ10c0nY67cf8UdO01XHww
 Bdq3AYzwFttjA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GC9Dp28q1z9rxH;
 Sun, 27 Jun 2021 01:34:02 +0200 (CEST)
Date: Sat, 26 Jun 2021 23:34:01 +0000
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v2 3/4] powerpc: wii.dts: Expose the OTP on this platform
Message-ID: <YNe5aW55SrXFGKFV@latitude>
References: <20210519095044.4109-1-linkmauve@linkmauve.fr>
 <20210519095044.4109-4-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AdirIyIEOXEflO+W"
Content-Disposition: inline
In-Reply-To: <20210519095044.4109-4-linkmauve@linkmauve.fr>
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


--AdirIyIEOXEflO+W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 11:50:43AM +0200, Emmanuel Gil Peyrot wrote:
> This can be used by the newly-added nintendo-otp nvmem module.
>=20
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  arch/powerpc/boot/dts/wii.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
> index aaa381da1906..7837c4a3f09c 100644
> --- a/arch/powerpc/boot/dts/wii.dts
> +++ b/arch/powerpc/boot/dts/wii.dts
> @@ -219,6 +219,11 @@ control@d800100 {
>  			reg =3D <0x0d800100 0x300>;
>  		};
> =20
> +		otp@d8001ec {
> +			compatible =3D "nintendo,hollywood-otp";
> +			reg =3D <0x0d8001ec 0x8>;

The OTP registers overlap with the previous node, control@d800100.
Not sure what's the best way to structure the devicetree in this case,
maybe something roughly like the following (untested, unverified):

	control@d800100 {
		compatible =3D "nintendo,hollywood-control", "simple-mfd";
		reg =3D <0x0d800100 0x300>;
		ranges;

		otp@d8001ec {
			compatible =3D "nintendo,hollywood-otp";
			reg =3D <0x0d8001ec 0x8>;
		};
	};



Thanks,
Jonathan Neusch=C3=A4fer

--AdirIyIEOXEflO+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDXuWkACgkQCDBEmo7z
X9tvzBAAhBVGIh0LX0XckUdyK/Mf844H2Sz6NoqeJvEeiEAgrqri2Lu+4fCoeXER
d8Ll/zsvx97oEN7D5zpJd8OkDTVAJm/Mi+wGxJpEoAA9YpcwUgy6u6iHOGDne0Ad
XObW1M5WEIoui+A520Rc4HWU8L18gAnGXS8gy8Ekh7SFkr7S+hQECo+x8ssLEX6d
pct1h4Z5kPHvj38nTmIzNUhi8WWPihvVvlE+zhrhR+FOpFFQTBPBqe950/1tGic6
qOpPa1eeuQIk7T9NDlF5a7i3eMoPwL9OMfz8i/jhb5ALM45trbEo/A09GD1kjtLE
fx1G86a4QidPN4ps64eMQbHgeE6ciI+nTtZl5ntXwFm+6N5lWxZRN52Kh0ibpUQK
F8oFj+2i3eNA+KjO12TD3ZKpAGQiZhTx4JIrGni6STRPnvYrNwSJ9TfpiEzs0wJ0
L6ZLMf/yLzoLyHqk8N6DvZmQN79ZbvvF6tqAHg0qX/EIbx1k7kLuqJ3gd1spOtsh
UE/3WQfqbZBxfFJIDewzCHtCWcFA22e1HSPgevKZXFL+fe2ePIiO4Q/c8MmXTY1P
bpLjTyaFDrZ1mG9K3x5PwHOlBI3uOmpCzSm9zIysu5rOKVQo96CaNGhkHUOAdJNK
MALu5woA7Chz0z4P9G7+pAuqOJBHzcqRaqLpdXZ/S0BHJibHLSQ=
=EH1y
-----END PGP SIGNATURE-----

--AdirIyIEOXEflO+W--
