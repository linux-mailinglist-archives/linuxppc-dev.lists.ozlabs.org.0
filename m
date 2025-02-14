Return-Path: <linuxppc-dev+bounces-6182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3EEA35913
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 09:40:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvQVK1zVhz30VV;
	Fri, 14 Feb 2025 19:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739522425;
	cv=none; b=Fy8oEsFmY2Ac1EMgriC5UD0axGTAemchskZ8zi7vLBmSZDC486cB35ucJHz+KpEkBAlZ6zMNysGY9iCyClwGjGBJSeb9QDFNiJdL7i6iIEXwSVj416Tr1gHpfHvaBjAH1A+0fgg5XOUcl5INtmMxJGonBTff/thstCZ5oC8KyPbt1YvdaAFTj8Cbt2lGb0VH83YLkbhW407lbs8gSLzDobLNKX7f7enmof/UpAQ+vdqzyZt4LvevvViL5/+2GoCx25Wwgircxer1W+QLRB3i7MdRxtjWFgqnbg3MBqzTLIVTeDfvQUqFkE6HTxuj2GmgXZXE5Ppkerx11kjsZHnefA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739522425; c=relaxed/relaxed;
	bh=fVDQzYkE6ZMDTPdcEAsdWvbM3Lw9DOF/Ac6Pw6a0tsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwH4G0udeQiEewygvAX+C/8JkWX2uBPTH+yVNjjaay3IZBuSFV2y+8ZiYyvkMKYarHNnnWXJkd9xl1kT27Kh+rkF+5tpBZgbWjHVOIesW6csxK3DHDHGiYZnMRDElF2bMHlrWaW/DLZItafVEgGM467ltPU35643hNeLTB9RtBkQPUXvUNVNAD7JQoLqxt7+KPCjDqYPyLRH+H03lX8wN0voXt5O+fN1gbAGikCnyRXeJ3MBzLZ75WV9JGcJcnQE8Fk3i8eEXsT0ZiU4DYA7F5cJLTA6U8F5ij8ZW4TxohtyoFDRCj2su/uZEPk+bT6EWzXjk5OQsOAHkxAaxxfoOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sxINyX1n; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sxINyX1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvQVJ3VLZz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 19:40:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D31D5C58FC;
	Fri, 14 Feb 2025 08:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6005C4CED1;
	Fri, 14 Feb 2025 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522420;
	bh=YE4l8V3UVTEVbSPXutJ4j6Y6NMn523OYmOJG5yYkcjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxINyX1nsva9oK8xaDH5WHmRvU01UOW+REYlhjfVDrEpNU6+U56EAL9RwOXo95DNB
	 7XBTBPaSi0G7m/Xs0liBIg4I+e06vkyyR2ealXUjZkTkwLZWYOF318xBUOJyytKNdF
	 cjNehgtBM61B9JadQkJiimYpwpzWNke42cqAUXi+aM8ZVfBH7lS7n6MyywYjwwZX2D
	 75LlyJhFchFWEMQH9boTW6UAptsFmDLqaudauFkPFIZiq1X+ADDIwL+c07xDoq0IH2
	 SGHv/PJHYTS8VqT3p3NNcHrpIqheXwleoSgmispXJxDb32yPv7KY/7ih+J3QkYiCjQ
	 tKz++T9bnGklw==
Date: Fri, 14 Feb 2025 09:40:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: imx-card: Add playback-only
 and capture-only property
Message-ID: <20250214-honest-puzzling-bear-b8060d@krzk-bin>
References: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
 <20250214070533.2808496-2-shengjiu.wang@nxp.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214070533.2808496-2-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 03:05:32PM +0800, Shengjiu Wang wrote:
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index f7ad5ea2491e..86571fa930f6 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -46,6 +46,14 @@ patternProperties:
>          description: see tdm-slot.txt.
>          $ref: /schemas/types.yaml#/definitions/uint32
>  
> +      playback-only:
> +        description: link is used only for playback
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      capture-only:

Aren't these mutually exclusive? If so, you need proper schema for this.

https://lore.kernel.org/all/20230118163208.GA117919-robh@kernel.org/

Best regards,
Krzysztof


