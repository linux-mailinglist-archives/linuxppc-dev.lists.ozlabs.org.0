Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 582978CA0B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 18:26:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZVIH+1ZK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjjPZ35cJz3fwv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 02:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZVIH+1ZK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjjNp0PvDz3clf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 02:16:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AC13CE0B1C;
	Mon, 20 May 2024 16:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BCFC2BD10;
	Mon, 20 May 2024 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716221763;
	bh=UOi1n2UYMr/FQbVKWQcyqklCKnrURV8Jm+y0d+1xmXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVIH+1ZKPc7nCIgzITvynSYYWTuhtNjvapabvfzI39kdCUv/cP4aImgHpSanyEI85
	 fc0TB8ke+DtxyB2CtlKbVnrDZ+ddR8fPUrDgiu1uANtDlzM7XYr/LabR/5B7Owbk9B
	 4hWwZd/6EdR6d5bT8cObim94znIZbhwjsgTCCHrNHbap8pX+INKZ4MMCPgO7PIan7o
	 hDxrSRyQfKhn+fdEOfUX72EyR2VWY0B4ikj9one8DIBkv4VQ6jLc7h/YSffPOXtIrt
	 0+kuwP0OcIO4tSATpnsSyiEcc58emRDd1LfmGCTInzD7GPHZ57rqhnUe52uXrVT0eP
	 VBwc46NopDv5A==
Date: Mon, 20 May 2024 11:16:02 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible
 string for i.MX95
Message-ID: <20240520161602.GA733483-robh@kernel.org>
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
 <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, May 14, 2024 at 11:12:08AM +0800, Shengjiu Wang wrote:
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
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4'
> for clocks and clock-names properties.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 55 +++++++++++++++----
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 0eb0c1ba8710..70bcde33e986 100644
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
> @@ -44,18 +45,12 @@ properties:
>      minItems: 1
>  
>    clocks:
> -    items:
> -      - description: Peripheral clock
> -      - description: PHY clock
> -      - description: SPBA clock
> -      - description: PLL clock

Leave these here and add pll8k and pll11k.

> +    minItems: 4

Keep this.

> +    maxItems: 6
>  
>    clock-names:
> -    items:
> -      - const: ipg
> -      - const: phy
> -      - const: spba
> -      - const: pll_ipg
> +    minItems: 4
> +    maxItems: 6

Same here.

>  
>    dmas:
>      items:
> @@ -97,6 +92,46 @@ allOf:
>        properties:
>          interrupts:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-xcvr
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Peripheral clock
> +            - description: PHY clock
> +            - description: SPBA clock
> +            - description: PLL clock
> +            - description: PLL clock source for 8kHz series
> +            - description: PLL clock source for 11kHz series
> +          minItems: 4
> +        clock-names:
> +          items:
> +            - const: ipg
> +            - const: phy
> +            - const: spba
> +            - const: pll_ipg
> +            - const: pll8k
> +            - const: pll11k
> +          minItems: 4

Drop all this.

> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Peripheral clock
> +            - description: PHY clock
> +            - description: SPBA clock
> +            - description: PLL clock
> +        clock-names:
> +          items:
> +            - const: ipg
> +            - const: phy
> +            - const: spba
> +            - const: pll_ipg

And for this case, you just need 'maxItems: 4'.

Rob
