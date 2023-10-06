Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F07BC20B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 00:09:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lqqUlsyH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2Myh728Jz3vZn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 09:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lqqUlsyH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2Mxp6mTmz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 09:08:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A041A60BB8;
	Fri,  6 Oct 2023 22:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CD3C433C7;
	Fri,  6 Oct 2023 22:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696630092;
	bh=S/N63H4X+QPAGfS1YS/mBfx58DuAbwAsy+1fq8W1EuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lqqUlsyH7HQbKjX6+5MZaW5p3Joc5/jp6VffbnbSi4frEd/pPhmgULRdlX5REnhpP
	 BK2xli8u32zh+fkxpuHUOLaTi6MD1PXmD4uaT4ger+hlNVtAIdfLCOrFRtKzFzQdQz
	 2sQXEvvtRBzYF6TTKxDU1a+OboOZzIkfFfzieoDXlciUuulj9kl61ww0wJPKsFKgrl
	 bG0J56gOoLjF3VNIh6eD3ijl/+KNdaIHPaK1qZBx8m+Qm/Nj6jA1it1GsSd/KDmDTO
	 8t97yI7Q9ito8x5R+7R8OzvwKOZlUfEqCdWiEARsL6pB/CF8A3b9DgN6yKbMV0niw2
	 jzXwcskBcwReg==
Date: Fri, 6 Oct 2023 15:08:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 24/30] net: wan: Add framer framework support
Message-ID: <20231006150810.09e2c1a9@kernel.org>
In-Reply-To: <20230928070652.330429-25-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-25-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Sep 2023 09:06:42 +0200 Herve Codina wrote:
> +menu "Framer Subsystem"
> +
> +config GENERIC_FRAMER
> +	bool "Framer Core"
> +	help
> +	  Generic Framer support.
> +	  A framer is a component in charge of an E1/T1 line interface.
> +	  Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> +	  frames. It also provides information related to the E1/T1 line.
> +	  Used with HDLC, the network can be reached through the E1/T1 line.
> +
> +	  This framework is designed to provide a generic interface for framer
> +	  devices present in the kernel. This layer will have the generic
> +	  API by which framer drivers can create framer using the framer
> +	  framework and framer users can obtain reference to the framer.
> +	  All the users of this framework should select this config.

maybe make the menu a menuconfig with info about framers but hide 
the GENERIC_FRAMER symbol? The driver 'select' it anyway, what's
the point of prompting the user..

> +	if (WARN_ON(!dev))
> +		return ERR_PTR(-EINVAL);

no defensive programming, let the kernel crash

> +	ret = framer_pm_runtime_get_sync(framer);
> +	if (ret < 0 && ret != -EOPNOTSUPP)
> +		goto err_pm_sync;
> +
> +	ret = 0; /* Override possible ret == -EOPNOTSUPP */

This looks pointless given that ret is either overwritten or not used
later on

> +	mutex_lock(&framer->mutex);
> +	if (framer->power_count == 0 && framer->ops->power_on) {
> +		ret = framer->ops->power_on(framer);
> +		if (ret < 0) {
> +			dev_err(&framer->dev, "framer poweron failed --> %d\n", ret);
> +			goto err_pwr_on;
> +		}
> +	}
> +	++framer->power_count;
> +	mutex_unlock(&framer->mutex);
> +	return 0;
