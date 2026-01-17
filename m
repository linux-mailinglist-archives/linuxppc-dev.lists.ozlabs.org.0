Return-Path: <linuxppc-dev+bounces-15941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7CD38E4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 12:44:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtZcv0s0Yz2y7c;
	Sat, 17 Jan 2026 22:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768650254;
	cv=none; b=iVbf4UM1sN+YfpLHKmVRk4D1AzkLRdE8/17zOImFyANBZny2aeSbpxM+CGVoQWawybboz5ftKecJzj9423ASwzZBdMHv//Wq+8g7F5Rv3Aav9oC2TUDmKDmGBOUvNvna+uK46KZjMSUqdnVgR+CeGV3FiREM8XT9SbNysNjaaIUMEA+RC0BGihrAVkpB2srdubbmHyNyruiXfWhgQqMRfacXuODFoGiUVkTR07yvf7aB6hezFh7QVQ2b5ZmBuNOnlm1AR+lVbZjBbCmwHLwJ+vf0tZzG5Zbu0pTE0i6IKPqmCGYsLO95+O15xs42dhPq363WMhYGCQHCSQoOox0uCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768650254; c=relaxed/relaxed;
	bh=bIlCLy3H9h7XtPhvsaV8aA4QnxgU7tAWxH9CgTKOEW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQ8kNXeGZx5U5kxTCZkkhP+cn3Ocm0H5UNboJ7yO1RSktizuDynH8hl1bJuOxl5q635BqHL29UAzodz1dq9HvJeeZ1cW7RswR5rdcRj7mKAbeVqpvmuEyYRurvmZDcCTcVbZi+E0X7tDH16EBsaeaLZK8y9iT2RldSfNdTwYX22uBKdEtsEvUONTyr3WSAkTJkZ9mVPxkSTX7vy/j6jVYBackBAEgZ+K0hkIxQSVKc+j8M22YgrjscxWf/puKLl6bF0K+BL9SlVV699i2jEsH0bc2aI/uC1V8wM9Ua/wKnDUen6gGQldPsYNVqJlJGuw7tqUUxj6aXawTVq4PUCFSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cUrkHI3T; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cUrkHI3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtZcs66Wbz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 22:44:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5886438D0;
	Sat, 17 Jan 2026 11:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1EEC4CEF7;
	Sat, 17 Jan 2026 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768650249;
	bh=7lknc6FIsN8kTaQ3hRHqL8L6jIldGI7xwi+wz3k2pVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUrkHI3TVz80ah/2V2OAa3YVWKUKlfBKTjrVaFB4AvpYJLenjYw9sIIbogSR970f8
	 cvGB31uAzYakxyaHsj1BFcCz55w8Mz/hymC0nr0RrfpvsMeLZdfb5ZxTU2A9814g5j
	 t1loXK3qayAfqBwBD4uwBn/HIh14LsGlngm/Wwm7DzHcqI8DGBM3giqP1+TjCTwFEX
	 SqlVmei7xQ2O9BMJZFQXZQ75mvE1uaGLhMEdvvTUHmRXhSM7CovoKwl/Hi4f4WaWEO
	 MGLT1KHJBv3T7Wk0UQgD5CBJ84TbxroJ9OcVHNYDcH4QkIx2XPUzMCWo0FHWVuIaQQ
	 wK0e+49RC5ceA==
Date: Sat, 17 Jan 2026 12:44:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-2-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> so add fsl,amix-bypass property for this feature, besides this there is
> no power domain defined on i.MX952, so make power-domains to be
> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> index 3ad197b3c82c..50fb08460b4f 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> @@ -34,7 +34,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: fsl,imx8qm-audmix
> +    enum:
> +      - fsl,imx8qm-audmix
> +      - fsl,imx952-audmix
>  
>    reg:
>      maxItems: 1
> @@ -75,12 +77,41 @@ properties:
>          unevaluatedProperties: false
>          description: Output port to SAI RX
>  
> +  fsl,amix-bypass:
> +    type: boolean
> +    description:
> +      The audmix module is bypassed from hardware.

I don't understand why device AUDMIX would have property saying AUDMIX
(so itself) can by bypassed. If you bypass the device itself, what do
you configure here?


> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-audmix
> +    then:
> +      required:
> +        - power-domains
> +      not:
> +        required:
> +          - fsl,amix-bypass

fsl,amix-bypass: false

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx952-audmix
> +    then:
> +      not:
> +        required:
> +          - power-domains

Not sure what you want to say here, but disallowing properties is shown
in example-schema (:false).

Best regards,
Krzysztof


