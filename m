Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52BAFA1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 12:14:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SySH47RPzDqBl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:14:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="u0FZLYzm"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyPx3yz7zF2DW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 20:12:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ep0j7m5xNfG4CR6HHkPWK2kdBVsDxedxi47kQTEiChI=; b=u0FZLYzmH84kRI/HHbIR4jvdR
 2C4c+MORLpTVFvfvtpOgUR72Ie81FZ0WI5cT7wZG/H0kPOJsJao2htnaEBzSIc9+GXIkGonEV1BjC
 cLWQEUlhORQUEIAUl9+71DDfz8HTcGXwmNVmObPsLP8BfRtYNie3TebUrcKAv5NOAhB7M=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7zbz-0007as-AB; Wed, 11 Sep 2019 10:12:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6E4F0D02A53; Wed, 11 Sep 2019 11:12:30 +0100 (BST)
Date: Wed, 11 Sep 2019 11:12:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_mqs: Add MQS component driver
Message-ID: <20190911101230.GT2036@sirena.org.uk>
References: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
 <08524f143c18521680b724ab98375828fc18ab2b.1568169346.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HywJcj55HbA57jnN"
Content-Disposition: inline
In-Reply-To: <08524f143c18521680b724ab98375828fc18ab2b.1568169346.git.shengjiu.wang@nxp.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--HywJcj55HbA57jnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2019 at 10:42:39AM -0400, Shengjiu Wang wrote:

This looks good, a few minor comments below but nothing major -
it's mostly nits with the DT binding.

> --- /dev/null
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ALSA SoC IMX MQS driver
> + *
> + * Copyright (C) 2014-2019 Freescale Semiconductor, Inc.
> + *

Please make the entire comment block a C++ comment so things look
neater.

> +	/* On i.MX6sx the MQS control register is in GPR domain
> +	 * But in i.MX8QM/i.MX8QXP the control register is moved
> +	 * to its own domain.
> +	 */
> +	if (of_device_is_compatible(np, "fsl,imx8qm-mqs"))
> +		mqs_priv->use_gpr = false;
> +	else
> +		mqs_priv->use_gpr = true;

The GPR was listed as a required property in the binding document
but it is only needed here so the binding document should say
"required if compatible is...".

> +	} else {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		regs = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(regs))

You can use devm_platform_ioremap_resource() here.

> +		mqs_priv->ipg = devm_clk_get(&pdev->dev, "core");
> +		if (IS_ERR(mqs_priv->ipg)) {
> +			dev_err(&pdev->dev, "failed to get the clock: %ld\n",
> +				PTR_ERR(mqs_priv->ipg));
> +			goto out;
> +		}

The core clock wasn't listed in the bindings document.

--HywJcj55HbA57jnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl14yI0ACgkQJNaLcl1U
h9BO/Af/aIFQPppNc8K51nmTQbe5/qlY6KawrXb2O2vnWrT0cZMpaXII/WfVHarC
N5tQrIStSR99l5V93WUkKolVo3SJS2Gg5Opo4XLHTFt9vHlhOYX8iRt0xz5B+UF9
qKo8AHuR0kOSAsRy2w9lEFq07cRPSFR9bQH3axNxUybh7v6YEbo473gX0rRf3qUL
HRfeAMEzjuK5CQz74088qfUQmfiDoVbCC+cbvkUeWhR0/VbZA3zdeos3wbUDRqrA
KJGMzwAyQISn8+uXAEUNzmepdcKl/tec9JJCjZHh/lSTnMQwAwj6/NPhDhIZwCmy
5GYinXK/xsebKn2yLidfvP2yyzICdw==
=GpDq
-----END PGP SIGNATURE-----

--HywJcj55HbA57jnN--
