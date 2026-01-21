Return-Path: <linuxppc-dev+bounces-16098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDzJBHaIcGkEYQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 09:04:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0491953393
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 09:04:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwxXy2T4yz2yFg;
	Wed, 21 Jan 2026 19:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768982642;
	cv=none; b=nB178CHL3B/jmL7Bz1Ha5st7wicPwaiqr5/OFJNgLwV2bYyeWPKD27VR/OdAE4AwR6IfsiTM3+5pr3f8onlC+z2auBP02i6yxSUyg87Ys1Ju/E1XcuZmaM/rZKDZQjPNDrZ6CllU+RsdExj5qLdnjNLa2nKQ4bSHLcEPwVR7bpT6osa6rrXiYEO3tHtD+S5IHZ6pb6LkIvd2Id4g7RwoAZ8uc3FEdgoByrhqGpruRmydUYNaRV4gNnr1475ppWMvYGgpUB96MqRHZrvydRjdSoTvjYp0ceEAuCIfARSjkf2dkBT6bsYgVLlIAwnZ3wQ4JVBhtqMhfYdh8Kr/nLui4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768982642; c=relaxed/relaxed;
	bh=Xv3xSS/bdGOprgZ1T80+vXW0tSiJgpNOTTOrjvC+KbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0bx8hKj7c+L6clQPH1YDkS+csQ3czTlClKpi4ElERCr5ZyBUXAViX8lV1Ekh+UI/q505T5Gxbxw9kxdOM+wiyTYp3LHgG3F6FmW/pWX8gonTjlix2BVWHWUs1bc2smj9obKJPqIRi9sd6E1UtD86+wZ6ExguGe+6phJz9wS4uwh8q3r60m94uvZRjW/BaogFhym73FfcInTSGL+M1XJnponzvTahd4QrrMd8qB/LS+D5Bv+JHxeIAjylln3IaGl/321LJLjfEjlw92fhL/W4jjCDNlJuWv6FZYwKiieN8y7M8rd+qJFdJQTTdZkoZGt7FIazyXwf7zpwgt8q36LtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nZ1vmbG+; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nZ1vmbG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwxXx32lgz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 19:04:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCC4540871;
	Wed, 21 Jan 2026 08:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E830C116D0;
	Wed, 21 Jan 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982638;
	bh=PsqDsmtUvSMoAGPchw0ANb9blEgv2FuLIEh2Q6T95uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ1vmbG+beB2iwfhyj3XVTL2l++mCmI6l5ZmExwsa68lW58lTMGsTDs6Xs+ZkM6oy
	 Og7ixvumC6seNlVkVoEBb/17yi/LiSgNvXmuCkRw6rtwKL+atFAfvaPCNZpzLog7q1
	 YDFBy3X69Liig5y8ZQy8ResbG6BcbU21IVgsfcLmDSjvmI/cQ3g02sqjxZpguNdKjC
	 OndH9JSnSqgOMh7/uw7/5d3igi6NzPxuluvUmUkxQQJyoKVrpR35g3GbSaDGQzOiFx
	 ItIpu/Qn7FJrpCpj+xKt7Xbhlkgk2ODhP6QDdS1xSDJeyfhExvHl77ubmICS9ntTE+
	 0pCtHucBM4DcA==
Date: Wed, 21 Jan 2026 09:03:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
Message-ID: <20260121-careful-beige-iguana-c32bbd@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com>
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
In-Reply-To: <20260120035210.1593742-3-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[krzk@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16098-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,nxp.com:email]
X-Rspamd-Queue-Id: 0491953393
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> this property present, then SAI driver will try to config the setting,

I am still not sure this is hardware static property. You say "can be
bypassed", so I imagine same board could have it bypassed or not,
depending on use case (so mixers).

> fsl,sai-amix-mode = <0> is bypass mode, fsl,sai-amix-mode = <1> is
> the AUDMIX mode.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> index d838ee0b61cb..7808c324eebc 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -133,6 +133,13 @@ properties:
>          - description: dataline mask for 'rx'
>          - description: dataline mask for 'tx'
>  
> +  fsl,sai-amix-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Anyway, string is more readable.

> +    description:
> +      The audmix module is bypassed from hardware or not.
> +      Bypass AUDMIX(0), AUDMIX mode(1)

Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]

> +    enum: [0, 1]

What is the default? What is the meaning of lack of this property?

> +
>    fsl,sai-mclk-direction-output:
>      description: SAI will output the SAI MCLK clock.
>      type: boolean
> @@ -180,6 +187,15 @@ allOf:
>        properties:
>          fsl,sai-synchronous-rx: false
>  
> +  - if:
> +      required:
> +        - fsl,sai-amix-mode
> +    then:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx952-sai

There is no such compatible.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

