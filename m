Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3CC371D28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYq4C0FSPz30C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 03:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYq3n6ppMz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 03:00:35 +1000 (AEST)
Received: by mail-ot1-f44.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso5733354otl.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 10:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MpWS97nnXbRs49r1fForFBwiCI3FlCAOFGO2IucCbgI=;
 b=pNArBc/IyPC6U+fhHzSnU8Tz2Gc5Nk6HyHJd47HMa0mztCkrWsGp4qs8r+EJVmcVcp
 RSXfvx64Terzg0rklXjJdNXpVdOOmyGZTQ4lCauDbDoJtwuhfOtS9uZ93Mtbt6mTok1n
 ikfy5BBYf5ho3gR6fIZoFB7XOFDOMKfj6J4cqlq/Dp6iLyLLJ54AhyS0PU4UcxgOnQJa
 2Gww+/33TBE7yAaltEulrLXmrprEL/mgoWGfgAyr14UX6i6dcg0lfxJ9Af7vdx4ES53Q
 KZvkJXzkOtQIxqw95ywaOVi9G/LfQ0ie/zbVG098upC7anDa+cMNc3hZVd9EfjEFxuCd
 xTgg==
X-Gm-Message-State: AOAM5317QvMPm6uWEfQuX8Iwr1LhEdf8VvdjwqX/9e8bTs0Jamz/jq2X
 SGNs4v6MewYsBnuhQ/Ki1Q==
X-Google-Smtp-Source: ABdhPJz3axdorHwGCwuPSEqF9Bw80gZAqMDgQOmNpRuGn93hjcvSZSCtx5vibHriB9CdGrpMOJJZig==
X-Received: by 2002:a9d:7085:: with SMTP id l5mr15416541otj.345.1620061233291; 
 Mon, 03 May 2021 10:00:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t25sm71651oic.23.2021.05.03.10.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:00:32 -0700 (PDT)
Received: (nullmailer pid 2008247 invoked by uid 1000);
 Mon, 03 May 2021 17:00:30 -0000
Date: Mon, 3 May 2021 12:00:30 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc for
 akcodec machine driver
Message-ID: <20210503170030.GA1987906@robh.at.kernel.org>
References: <1619157107-3734-1-git-send-email-shengjiu.wang@nxp.com>
 <1619157107-3734-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619157107-3734-2-git-send-email-shengjiu.wang@nxp.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, perex@perex.cz,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 01:51:47PM +0800, Shengjiu Wang wrote:
> Imx-akcodec is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../bindings/sound/imx-audio-akcodec.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> new file mode 100644
> index 000000000000..7419bf7224e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec

Looks like the existing fsl-asoc-card.txt? You should convert to schema 
and use that. Otherwise, my comments are based on this all being 'new'.

> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-audio-ak4458
> +      - fsl,imx8mq-audio-ak4497
> +      - fsl,imx8mq-audio-ak5558
> +      - fsl,imx-audio-ak4497
> +      - fsl,imx-audio-ak4458
> +      - fsl,imx-audio-ak5558
> +      - fsl,imx-audio-ak5552

I continue to not understand why audio bindings need the codec(s) in the 
compatible strings. Can't you look up the codec thru the audio-codec 
property?

> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-cpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of a CPU DAI controller
> +
> +  audio-codec:
> +    description: The phandle of Codec DAI controllers, there are two
> +                 controllers maximum.

We have the common 'sound-dai' property. See the simple-card.yaml 
binding. 

> +
> +  audio-asrc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of ASRC. It can be absent if there's no
> +                 need to add ASRC support via DPCM.

Needs a vendor prefix.

> +
> +  fsl,tdm:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present, the TDM mode is enabled.

But this one seems like something that could or should be common.

> +
> +required:
> +  - compatible
> +  - model
> +  - audio-cpu
> +  - audio-codec
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound-ak4458 {
> +        compatible = "fsl,imx-audio-ak4458";
> +        model = "ak4458-audio";
> +        audio-cpu = <&sai1>;
> +        audio-codec = <&ak4458_1>, <&ak4458_2>;
> +    };
> -- 
> 2.17.1
> 
