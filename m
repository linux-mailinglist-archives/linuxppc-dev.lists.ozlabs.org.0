Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9D91B186
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 23:26:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mqrAhONa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9BSj6rtWz3cWr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 07:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mqrAhONa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9BS14kv2z3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 07:25:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2289DCE1B5F;
	Thu, 27 Jun 2024 21:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D25C2BBFC;
	Thu, 27 Jun 2024 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719523520;
	bh=sw6QJkUOx6dnvHnOUYkmwDviR+5bis7nK5kklIGe8B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqrAhONa3b8WIQ5LFtilKlUEIBKRc58ZejXGCuDCIhhNavv15R6ocbrxAtJdukAq3
	 FaqCGgq5D79cWs7DpsS+7Dt9z+vMkhEkIv9NTJ1tc7U3z/LVPxmwONgM+sqOEZP+Se
	 IrGOAiEUFtUcGpGg/2u5TXujcynjDQc3mJ2yY2PXRd3vTKnuSXgSGlu5HXcPWpNpwC
	 gCU+kumkVWCX/RNvlXnBhnDwiszNVrbQaBPuZCAxxpFSqAoO275PVFEzqXvv/NdqfX
	 Tt17cLoclyJ5KHzaBcD6uGse95ob/oOeubV3ic+nWUAhu6H2Dy0oTXl87QuTF5COsB
	 KQeM8DU5j5zGg==
Date: Thu, 27 Jun 2024 15:25:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 09/10] dt-bindings: sound: fsl,qmc-audio: Add support for
 multiple QMC channels per DAI
Message-ID: <171952351643.593434.7474652355291518276.robh@kernel.org>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
 <20240620084300.397853-10-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620084300.397853-10-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 20 Jun 2024 10:42:56 +0200, Herve Codina wrote:
> The QMC audio uses one QMC channel per DAI and uses this QMC channel to
> transmit interleaved audio channel samples.
> 
> In order to work in non-interleave mode, a QMC audio DAI needs to use
> multiple QMC channels. In that case, the DAI maps each QMC channel to
> exactly one audio channel.
> 
> Allow QMC audio DAIs with multiple QMC channels attached.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/fsl,qmc-audio.yaml         | 41 ++++++++++++++++---
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

