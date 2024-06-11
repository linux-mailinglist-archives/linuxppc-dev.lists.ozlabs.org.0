Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D963903905
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 12:37:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gqnSTrD7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz4qY0TsWz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 20:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gqnSTrD7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz4pq5q1pz30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 20:36:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7243A60C71;
	Tue, 11 Jun 2024 10:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985F7C2BD10;
	Tue, 11 Jun 2024 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718102194;
	bh=GRiJHJeBxHjjSrVuUZQEjtAnkrsyVP3YUixQ0bIDogY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqnSTrD70/+vXgJD/5znDSFJoVnc7K8K6uckcQ3lWeVRuhL/70lTfzEN+6ZMRR5lU
	 QpQDparoIxqKCPK+ccn2ON/mf/aml+H+R07RM2rKDM74OfVrDpDvb32r1jk0nCddBM
	 bEfy3OIM2u+OlkNS0DYGtBXRG4SSa3ywLYgv06ekYWDSRayaANzBun4myW4uzyDWYw
	 4Mx+j0Y5GL1WQv//PFcyjnu7Mzd7jbs82fy0aK74PKm+R1B6eB+DKMasNzMylER/jO
	 KnUJJ0KBuxv00TT2P5DjcpJSoOIepMikp0zRLYUGJ4KdtBh5MMNf+FY8B/l+0rbXFa
	 E1M3eM9xJvUEw==
Date: Tue, 11 Jun 2024 11:36:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
References: <[PATCH]ASoC:fsl:Addi2sandpcmdriversforLPC32xxCPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WW949k97zQLQvi69"
Content-Disposition: inline
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
X-Cookie: Your love life will be... interesting.
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--WW949k97zQLQvi69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 11:47:51AM +0200, Piotr Wojtaszczyk wrote:

>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi |   4 +
>  arch/arm/mach-lpc32xx/phy3250.c        |  60 ++++

These architecture changes are separate and should at least be separate
commits, copied to the architecture maintainers.

> +FREESCALE SOC LPC32XX SOUND DRIVERS
> +M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linuxppc-dev@lists.ozlabs.org
> +S:	Orphan
> +F:	sound/soc/fsl/lpc3xxx-*
> +

It seems a bit odd to add yourself as a maintainer while also marking
the driver as orphan?

> +config SND_SOC_FSL_LPC3XXX
> +	tristate "SoC Audio for NXP LPC32XX CPUs"
> +	depends on ARCH_LPC32XX && SND_SOC

On a quick scan I can't see any architecture dependency for build,
please add an || COMPILE_TEST for improved coverage.  As for all the
other things enabled in this Kconfig file there is no need to explicitly
depend on SND_SOC.

> @@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_FSL_XCVR) +=3D snd-soc-fsl-xcvr.o
>  obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) +=3D snd-soc-fsl-aud2htx.o
>  obj-$(CONFIG_SND_SOC_FSL_RPMSG) +=3D snd-soc-fsl-rpmsg.o
>  obj-$(CONFIG_SND_SOC_POWERPC_QMC_AUDIO) +=3D snd-soc-fsl-qmc-audio.o
> +obj-$(CONFIG_SND_SOC_FSL_LPC3XXX) +=3D snd-soc-fsl-lpc3xxx.o
> =20
Please try to keep these files sorted alphabetically (it's not 100% at
the minute but no need to make it worse).

> --- /dev/null
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -0,0 +1,383 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Author: Kevin Wells <kevin.wells@nxp.com>
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static u32 absd32(u32 v1, u32 v2)
> +{
> +	if (v1 > v2)
> +		return v1 - v2;
> +	return v2 - v1;
> +}

Just use abs()?

> +static int lpc3xxx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned=
 int fmt)
> +{
> +	struct lpc3xxx_i2s_info *i2s_info_p =3D snd_soc_dai_get_drvdata(cpu_dai=
);
> +	struct device *dev =3D i2s_info_p->dev;
> +
> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) !=3D SND_SOC_DAIFMT_I2S) {
> +		dev_warn(dev, "unsupported bus format %d\n", fmt);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}

If we're validating for I2S we should probably validate for clock
provider too.  Or just remove the function, it's not really needed?

> +	i2s_info_p->clk =3D devm_clk_get(dev, "i2s_clk");
> +	if (IS_ERR(i2s_info_p->clk))
> +		return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can't get clock\n=
");
> +
> +	i2s_info_p->clkrate =3D clk_get_rate(i2s_info_p->clk);
> +	if (i2s_info_p->clkrate =3D=3D 0)
> +		return dev_err_probe(dev, -EINVAL, "Invalid returned clock rate\n");

Nothing ever enables this clock.

> +static int lpc32xx_i2s_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

Remove empty functions, if they can legitimately be empty the framework
will support them being absent.

> +#define _SBF(f, v) ((v) << (f))

FIELD_PREP()

> +#define _BIT(n) _SBF(n, 1)

BIT().

> +/* I2S controller register offsets */
> +#define I2S_DAO		0x00
> +#define I2S_DAI		0x04
> +#define I2S_TX_FIFO	0x08
> +#define I2S_RX_FIFO	0x0C
> +#define I2S_STAT	0x10
> +#define I2S_DMA0	0x14
> +#define I2S_DMA1	0x18
> +#define I2S_IRQ		0x1C
> +#define I2S_TX_RATE	0x20
> +#define I2S_RX_RATE	0x24

Add a prefix to all these I2S_ names in case of collisions.

--WW949k97zQLQvi69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoKKsACgkQJNaLcl1U
h9DNgQf/bVmcCufP8jvhRnYGwhJ74PYfe8uGNqVDcvOPBqyxwbAHEcBkY4os9h6R
GoQMz21Qh+ZtEks0KjHFDl3Lnd51Kac5YBeyl5s/WRciIBOxe+jSqmW0GpRYZwZ+
YEMXUIyS6zA8Tik8onJLOtFrl4wLHXafkWOOPulK5v8+mZXYqPypwKq87c43IkrI
MviOLdW4TB0CVCKvk590+1YPY+ZBBAELM6eO/D9du/AyvN+BkUnZLO/VOwQ4enRQ
r2xnb2uSXMbDtKZKr4PbNw+9NbNaw9axfSzHbwXCu1Z0y+eOEKS1Vu2613VY9Al0
VKMHNg0tTYcWMk0XTzihz60mgPSf0A==
=srbB
-----END PGP SIGNATURE-----

--WW949k97zQLQvi69--
