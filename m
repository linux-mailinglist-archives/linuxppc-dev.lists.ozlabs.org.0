Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7292A50C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 16:48:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jc5AjsVs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHn6Y27bxz3cVm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 00:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jc5AjsVs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHn5s3pJHz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 00:47:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D103BCE0DA3;
	Mon,  8 Jul 2024 14:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C65C116B1;
	Mon,  8 Jul 2024 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720450046;
	bh=+vH5Wl2pf2rKsw1/NxNTENPBRL2nLneoS1IPUz/ojvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc5AjsVsDc+SYPNGAWZ3Ost1NVoAo4ADtJwYBoKm7KKgJebfDvDfxFGeKFx+u0w4X
	 ocJDEfZ749lyVO+vQE8+bqZRP3iiZGaVm7WJYbngnkqmwIrqZquE89a72M+NiNAp0l
	 zJUAWN2pUilGM8R7aFaKUK4b88rYnXtjYSZXTs/mwhAAjx4YCVfFfKbQUYdDNg24ah
	 ukJlyiV8d5UM2gxY3ReeqGsGtREqYr1vXBR/N0mSsCGoAT5NHhQcnCdzk+ucMEpwHC
	 ljesqdK27ntzO+EPHiQjNnpnOFV9wdL68scZxZm1v6XjHSYWe9eblBVPXSBKxlyPtP
	 c73m3wWsUDSsQ==
Date: Mon, 8 Jul 2024 08:47:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCH v6 5/7] ASoC: dt-bindings: update fsl-asoc-card bindings
 after imx-spdif merge
Message-ID: <172045004389.3168553.9456011538931000974.robh@kernel.org>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
 <20240627083104.123357-6-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627083104.123357-6-elinor.montmasson@savoirfairelinux.com>
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Jaroslav Kysela <perex@perex.cz>, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Will Deacon <will@kernel.org>, Takashi Iwai <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 27 Jun 2024 10:31:02 +0200, Elinor Montmasson wrote:
> The S/PDIF audio card support with compatible "fsl,imx-audio-spdif"
> was merged from imx-spdif into the fsl-asoc-card driver.
> It makes possible to use an S/PDIF with an ASRC.
> 
> This merge introduces new DT bindings to use with compatible
> "fsl,imx-audio-spdif" to follow the way fsl-asoc-card works:
> * the "spdif-controller" property from imx-spdif is named "audio-cpu"
>   in fsl-asoc-card.
> * fsl-asoc-card uses codecs explicitly declared in DT
>   with "audio-codec".
>   With an SPDIF, codec drivers spdif_transmitter and
>   spdif_receiver should be used.
>   Driver imx-spdif used instead the dummy codec and a pair of
>   boolean properties, "spdif-in" and "spdif-out".
> 
> In an upcoming commit, in-tree DTs will be modified to follow these new
> properties:
> * Property "spdif-controller" will be renamed "audio-cpu".
> * spdif_transmitter and spdif_receiver nodes will be declared
>   and linked to the fsl-asoc-card node with the property "audio-codec".
> 
> To keep backward compatibility with other DTs, support for
> "spdif-controller", "spdif-in" and "spdif-out" properties is kept.
> However, it is recommended to use the new properties if possible.
> It is better to declare transmitter and/or receiver
> in DT than using the dummy codec.
> 
> DTs using compatible "fsl,imx-audio-spdif" are still supported, and
> fsl-asoc-card will behave the same as imx-spdif for these DTs.
> 
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> ---
>  .../bindings/sound/fsl,imx-audio-spdif.yaml   | 66 -------------------
>  .../bindings/sound/fsl-asoc-card.yaml         | 53 +++++++++++++--
>  2 files changed, 49 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

