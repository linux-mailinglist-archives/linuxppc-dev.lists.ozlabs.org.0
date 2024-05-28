Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E1F398D2040
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 17:21:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cUCcJuLj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpbh25R6dz79th
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 01:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cUCcJuLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpbgK5bt3z3vdv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 01:15:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B7ADCE1140;
	Tue, 28 May 2024 15:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942F9C3277B;
	Tue, 28 May 2024 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716909337;
	bh=xpk0Yqw/VN8ddEnECwmM/UpM6KoNoPvI14IHu2eBrJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUCcJuLjneqe7FsY8PDzBO8l6FMtnMWAfv87RASRNOn7ANCjpyTOCQZHUK1hT0ig2
	 6B8fVVMjnGid5Z1MERtu5+/uuCMrqzvGKzWVgyuK7/U7zOtQH5qc+wywSAG3cokDKX
	 yv20Iz5vrXsx1n19nf9LXAx1T/uoIJA9hWwBrHU19WulFHEsUnTLyUZ1CABB+XaZzC
	 2d/GYyyoaPLkTIkHMFf6WVDQ5y0ScYlfjJbkGlTNXzAJ1+ZnT2F0F+lj2jZ+BYIV8E
	 gBq03xNbxHelWp5K2URHJuTM6b/mG6uRgHfrEUhHnOlx2fS1p1a3sY/0AY5GiTNnjJ
	 wlbxl/nHstHPg==
Date: Tue, 28 May 2024 10:15:36 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible
 string for i.MX95
Message-ID: <20240528151536.GA275498-robh@kernel.org>
References: <1716286416-17621-1-git-send-email-shengjiu.wang@nxp.com>
 <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2024 at 06:13:35PM +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
> 
> The difference between each platform is in below table.
> 
> +---------+--------+----------+--------+
> |  SOC	  |  PHY   | eARC/ARC | SPDIF  |
> +---------+--------+----------+--------+
> | i.MX8MP |  V1    |  Yes     |  Yes   |
> +---------+--------+----------+--------+
> | i.MX93  |  N/A   |  N/A     |  Yes   |
> +---------+--------+----------+--------+
> | i.MX95  |  V2    |  N/A     |  Yes   |
> +---------+--------+----------+--------+
> 
> On i.MX95, there are two PLL clock sources, they are the parent
> clocks of the XCVR root clock. one is for 8kHz series rates, named
> as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
> They are optional clocks, if there are such clocks, then the driver
> can switch between them to support more accurate sample rates.
> 
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> clocks and clock-names properties.
> 
> On i.MX95, the 'interrupts' configuration has the same constraint
> as i.MX93.
> 
> Only on i.MX8MP, the 'resets' is required, but for i.MX95 and i.MX93
> there is no such hardware setting.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 37 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 0eb0c1ba8710..d1dcc27655eb 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -22,6 +22,7 @@ properties:
>      enum:
>        - fsl,imx8mp-xcvr
>        - fsl,imx93-xcvr
> +      - fsl,imx95-xcvr
>  
>    reg:
>      items:
> @@ -49,6 +50,9 @@ properties:
>        - description: PHY clock
>        - description: SPBA clock
>        - description: PLL clock
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +    minItems: 4
>  
>    clock-names:
>      items:
> @@ -56,6 +60,9 @@ properties:
>        - const: phy
>        - const: spba
>        - const: pll_ipg
> +      - const: pll8k
> +      - const: pll11k
> +    minItems: 4
>  
>    dmas:
>      items:
> @@ -79,15 +86,24 @@ required:
>    - clock-names
>    - dmas
>    - dma-names
> -  - resets
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mp-xcvr
> +    then:
> +      required:
> +        - resets
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx93-xcvr
> +              - fsl,imx95-xcvr
>      then:
>        properties:
>          interrupts:
> @@ -98,6 +114,25 @@ allOf:
>          interrupts:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-xcvr
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          maxItems: 6

6 is already the max. Drop these and add a 'not' into the if schema (or 
list out the other compatibles).

> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
