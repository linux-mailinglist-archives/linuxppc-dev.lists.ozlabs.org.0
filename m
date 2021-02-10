Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F05317302
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 23:14:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbYvz3LpfzDwk9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 09:14:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbYt75MLXzDwj8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 09:13:00 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id r21so3327134otk.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 14:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DTXg6CwDth7i/nqcv+euFr50pt7fVzpIfVZ9mbO1Zq0=;
 b=LBTAE9CznU3EbIw4UmnR9jUYf+kqlpTj0aKkFrh9EqKTHVVHZ6YF+cRCJFSo/2ZAA/
 uZU1VzHPntBjkJZDEaY33DVnxx16ZzlWrwc9NT2bp09qQ6dpYNjALkcw0yGlB26mKAD6
 zdLNkZRMKq1UZUF8d4D/HoP/w7T/sKH9jeYUY93vBGO6m3qCo+9BqBHnd6eZkFJYM6Ik
 i6UWHvy6/OWHBxOjCkr1i5FQvFballvMtkhkETu7B7UHFbArJxiZhpJRYdIdhAdVKqp3
 zo54c/Jy4QC2SnM3ViOpZGXNB4RZOzI7xG8FwICrFNtx8I+Du4/Z6YHHazNlqfNyaJk9
 D3dw==
X-Gm-Message-State: AOAM532FvrPnuQuSUF73zVLgiVC7CTQcjlp4Z3pcsKRwWbKVgSDTnOc/
 8tbmaFn20Qy+0iUHKUNQTQ==
X-Google-Smtp-Source: ABdhPJzi/+7SeOHhZnHUBL4PJ6P0lIk8i2F6Ep3p3sFUaaO0qUGBJ/J5giqeNfq2byHxecLoX+o25A==
X-Received: by 2002:a9d:6b1a:: with SMTP id g26mr3792095otp.49.1612995174877; 
 Wed, 10 Feb 2021 14:12:54 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z8sm613408oon.10.2021.02.10.14.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:12:54 -0800 (PST)
Received: (nullmailer pid 2893717 invoked by uid 1000);
 Wed, 10 Feb 2021 22:12:52 -0000
Date: Wed, 10 Feb 2021 16:12:52 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
Message-ID: <20210210221252.GA2885308@robh.at.kernel.org>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612693435-31418-4-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 07, 2021 at 06:23:51PM +0800, Shengjiu Wang wrote:
> fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
> for getting the user's configuration from device tree and configure the
> clocks which is used by Cortex-M core. So in this document define the
> needed property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> new file mode 100644
> index 000000000000..2d3ce10d42fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Audio RPMSG CPU DAI Controller
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7ulp-rpmsg
> +      - fsl,imx8mn-rpmsg
> +      - fsl,imx8mm-rpmsg
> +      - fsl,imx8mp-rpmsg

rpmsg is a protocol. What's the h/w block?

> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock for register access
> +      - description: Master clock
> +      - description: DMA clock for DMA register access
> +      - description: Parent clock for multiple of 8kHz sample rates
> +      - description: Parent clock for multiple of 11kHz sample rates
> +    minItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: mclk
> +      - const: dma
> +      - const: pll8k
> +      - const: pll11k
> +    minItems: 5
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  fsl,audioindex:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: instance index for rpmsg image
> +
> +  fsl,version:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: rpmsg image version index

What are these 2 used for?

> +
> +  fsl,buffer-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: pre allocate dma buffer size
> +
> +  fsl,enable-lpa:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: enable low power audio path.
> +
> +  fsl,codec-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Sometimes the codec is registered by
> +                 driver not the device tree, this items
> +                 can be used to distinguish codecs

0-2^32 are valid values?

> +
> +required:
> +  - compatible
> +  - fsl,audioindex
> +  - fsl,version
> +  - fsl,buffer-size
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rpmsg_audio: rpmsg_audio {
> +        compatible = "fsl,imx8mn-rpmsg";
> +        fsl,audioindex = <0> ;
> +        fsl,version = <2>;
> +        fsl,buffer-size = <0x6000000>;
> +        fsl,enable-lpa;
> +        status = "okay";

Don't show status in examples.

> +    };
> -- 
> 2.27.0
> 
