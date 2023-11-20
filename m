Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A57F1FFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 23:08:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iU6FAGtP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ1py1kCHz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 09:08:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iU6FAGtP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ1p70npkz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 09:07:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 349C6CE17B5;
	Mon, 20 Nov 2023 22:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49FBC433C7;
	Mon, 20 Nov 2023 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700518042;
	bh=VgevGQRE0DkW5gNXBJLRH1C9nvApnpFXwehmDOXU/q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iU6FAGtPzvf4n9aM9W0QY4oudQh44SjSKBAI7GZnP37lx9b4Ur3Mj65H4PbTVlJe1
	 K830TcCwVhF4na4SXXAjtuai+L+A4G0Z1VWcmlq7Rf5al1z2bgJiwIVL70UoAy60JP
	 woqqwzLVJtmflPxfvt8pEjG9+CU6dhobQk6kSlU/BwIslM2g2r0yTlNK+lMPACTjuE
	 SMPQGHtftu7E7I7YS2d/topBuO0JD4U+ptQ0vcLMCJUPTkZd4ECtI99oWD5qN1mrOF
	 Em6PZDSrO8QmYMfZ0HBjZs5I19UKiw24kyVI9YIuY/WfdXmp8xYZmKtlBXOW1J85vA
	 e4Go+Gv3eNASg==
Date: Mon, 20 Nov 2023 22:07:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v4 2/2] ASoC: imx-rpmsg: Force codec power on in low
 power audio mode
Message-ID: <edd348ea-ef95-453a-9838-636769ab569f@sirena.org.uk>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
 <20231023020718.1276000-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ys7+XtCcLmb6Czww"
Content-Disposition: inline
In-Reply-To: <20231023020718.1276000-2-chancel.liu@nxp.com>
X-Cookie: The meek don't want it.
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ys7+XtCcLmb6Czww
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 10:07:18AM +0800, Chancel Liu wrote:
> Low power audio mode requires binding codec still power on while Acore
> enters into suspend so Mcore can continue playback music.
>=20
> ASoC machine driver acquires DAPM endpoints through reading
> "ignore-suspend-widgets" property from DT and then forces the path
> between these endpoints ignoring suspend.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/fsl/imx-rpmsg.c: In function =E2=80=98imx_rpms=
g_late_probe=E2=80=99
:
/build/stage/linux/sound/soc/fsl/imx-rpmsg.c:60:46: error: implicit declara=
tion=20
of function =E2=80=98of_find_device_by_node=E2=80=99; did you mean =E2=80=
=98of_find_i2c_device_by_node=E2=80=99?
 [-Werror=3Dimplicit-function-declaration]
   60 |                                 codec_pdev =3D of_find_device_by_no=
de(code
c_np);
      |                                              ^~~~~~~~~~~~~~~~~~~~~~
      |                                              of_find_i2c_device_by_=
node
/build/stage/linux/sound/soc/fsl/imx-rpmsg.c:60:44: error: assignment to =
=E2=80=98struct
 platform_device *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werro
r=3Dint-conversion]
   60 |                                 codec_pdev =3D of_find_device_by_no=
de(codec_np);
      |                                            ^
cc1: all warnings being treated as errors

--ys7+XtCcLmb6Czww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVb2JIACgkQJNaLcl1U
h9D5Ygf/Ur0x116afGwToupSLPOlWheujkRjuYUrg95VQwQ3SkvnrgRzVCJ+GIst
9GzXEnzHorx+Vw4NzSNtzA5TF94TOOf+9GuRz5LQrl5hUJFhOnF0lz+0FGrXbXNE
yTD3a0tuYY7uSXyxFAZEszj3kHhUFZYg9SMAsJXVkpzej8rP7PiiJ2CyjnrkX0hY
lt6a8UmWNeNDaxS/8PMAXsraltapBbMjgxKYUCrbRXG8eRwZuKM1FBUyTkk5rER3
81ZfNxk2+8f5PDf9pX7mmjQXnPjDmumPU5HWn4Oz0cfEXeUG8xopxm50UwxLvhBk
Jj4TQkMAEWCmlRaVVi8MKepQqzhNig==
=sif7
-----END PGP SIGNATURE-----

--ys7+XtCcLmb6Czww--
