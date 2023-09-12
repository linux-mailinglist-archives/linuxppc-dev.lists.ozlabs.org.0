Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C608F79D833
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ithTbuEX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlWYn53qtz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 03:59:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ithTbuEX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=xm+6=e4=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlWXy1mz8z3c1V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 03:58:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48931B81F65;
	Tue, 12 Sep 2023 17:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2528FC433C7;
	Tue, 12 Sep 2023 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694541516;
	bh=JEv/PdS67apPPBjdgQMt1j8LrthrJDQTeiNjt0wyv5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ithTbuEXHG9CuKyDzU3aAaCHAG1P5uJ5YZbd/qweVdrPAF5pV7q7RtR/HDfMyoDOP
	 H822WkrV5CX4Fq+iFeCsXJMz6BnLIRGwSZYcP9aLlnEZn+VGPTqWZwMDnA/4VTCMhL
	 RLWVZq784lcSovlKvyvzkikfqvqSPOGJ2kBqOc4ciFw49KfsGmoqipaSJf7O28ZeN6
	 Ec3DP2VTHfvStE6eYO90HFNMGgq5SSVEeaOppqUqVhAZP+STV1pZJ398noPJDUdqFX
	 fLqH+2Mch4T41Qw/5FTmWDbezjrCBXuiZlwAyQ23NO0J1w9sN0D4Ywp4Vq4VtwwhJR
	 pREO8HFu0mPfA==
Received: (nullmailer pid 998213 invoked by uid 1000);
	Tue, 12 Sep 2023 17:58:32 -0000
Date: Tue, 12 Sep 2023 12:58:32 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 06/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Fix example property name
Message-ID: <20230912175832.GA995540-robh@kernel.org>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912081527.208499-7-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.org>, lin
 uxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 12, 2023 at 10:14:57AM +0200, Herve Codina wrote:
> The given example mentions the 'fsl,mode' property whereas the
> correct property name, the one described, is 'fsl,operational-mode'.
> 
> Fix the example to use the correct property name.
> 
> Fixes: a9b121327c93 ("dt-bindings: soc: fsl: cpm_qe: Add QMC controller")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml           | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I have this same fix in my tree, but you missed something. Please add 
additionalProperties or unevaluatedProperties to the child node schema 
so that this error is flagged.

> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> index ec888f48cac8..450a0354cb1d 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> @@ -137,7 +137,7 @@ examples:
>          channel@16 {
>              /* Ch16 : First 4 even TS from all routed from TSA */
>              reg = <16>;
> -            fsl,mode = "transparent";
> +            fsl,operational-mode = "transparent";
>              fsl,reverse-data;
>              fsl,tx-ts-mask = <0x00000000 0x000000aa>;
>              fsl,rx-ts-mask = <0x00000000 0x000000aa>;
> @@ -146,7 +146,7 @@ examples:
>          channel@17 {
>              /* Ch17 : First 4 odd TS from all routed from TSA */
>              reg = <17>;
> -            fsl,mode = "transparent";
> +            fsl,operational-mode = "transparent";
>              fsl,reverse-data;
>              fsl,tx-ts-mask = <0x00000000 0x00000055>;
>              fsl,rx-ts-mask = <0x00000000 0x00000055>;
> @@ -155,7 +155,7 @@ examples:
>          channel@19 {
>              /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
>              reg = <19>;
> -            fsl,mode = "hdlc";
> +            fsl,operational-mode = "hdlc";
>              fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
>              fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
>          };
> -- 
> 2.41.0
> 
