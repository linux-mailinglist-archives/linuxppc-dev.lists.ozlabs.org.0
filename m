Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC31333342
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 03:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwGk43BTmz3cRy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 13:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.173;
 helo=mail-il1-f173.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwGjl5V9lz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 13:48:41 +1100 (AEDT)
Received: by mail-il1-f173.google.com with SMTP id f10so14146834ilq.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 18:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tEOOZPHDEcY0BRs13eDY3wS0u+L4s5FzuNZ5kGdjLNs=;
 b=mIBqKI/F7U2WXYM5YZ8uadQ+ceIbStrT8xt/VQf1+oV8wJOS2DhlTPbKFxWma+uoc2
 PtjuNWX9gRqVrUIr3hxw+Dk9goOuyr17foEnZk1p7CPwTauiveFydognIaCiqlKJ9GQj
 NW6yRZaSaT2MDE/1p1FCnUiNtpl6wI91MeyL6tLkRZrnD/3v5x7OfO6ZZWBy0XrRKG2V
 ev0XoGzYpoOSXb2j2XcGx3VCDiUrTHioocVszGnyJofktSVOCuXkxi+CPB97OIPdalrl
 B/BgWGPRzpaLgqQnNBnobzvYPBs1osdOJOibpxWSwc99CItOImqI9EZ7KbIJzTYRKgSM
 hZLw==
X-Gm-Message-State: AOAM533JIbwgKZlHluyvjcp3wGN6oibZb/hG5agDB1ipm8aS0raEG5y9
 B/87f6rSk0h6cONujYlojg==
X-Google-Smtp-Source: ABdhPJxlxbdsnOqUBKBvn9roAYNjrX2t5RPeImFkLklYb3N4N/Nb+GkhzCBE7xUxdgoLpquCONAlmw==
X-Received: by 2002:a05:6e02:685:: with SMTP id o5mr998162ils.39.1615344518240; 
 Tue, 09 Mar 2021 18:48:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x6sm8397734ioh.19.2021.03.09.18.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:48:37 -0800 (PST)
Received: (nullmailer pid 1645357 invoked by uid 1000);
 Wed, 10 Mar 2021 02:48:34 -0000
Date: Tue, 9 Mar 2021 19:48:34 -0700
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
Message-ID: <20210310024834.GA1623179@robh.at.kernel.org>
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
 <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
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

On Mon, Mar 08, 2021 at 09:22:27PM +0800, Shengjiu Wang wrote:
> fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used

Bindings describe h/w blocks, not drivers.

> for getting the user's configuration from device tree and configure the
> clocks which is used by Cortex-M core. So in this document define the
> needed property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> new file mode 100644
> index 000000000000..5731c1fbc0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -0,0 +1,118 @@
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
> +description: |
> +  fsl_rpmsg cpu dai driver is virtual driver for rpmsg audio, which doesn't
> +  touch hardware. It is mainly used for getting the user's configuration
> +  from device tree and configure the clocks which is used by Cortex-M core.
> +  So in this document define the needed property.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7ulp-rpmsg
> +      - fsl,imx8mn-rpmsg
> +      - fsl,imx8mm-rpmsg
> +      - fsl,imx8mp-rpmsg
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock for register access
> +      - description: Master clock
> +      - description: DMA clock for DMA register access
> +      - description: Parent clock for multiple of 8kHz sample rates
> +      - description: Parent clock for multiple of 11kHz sample rates
> +    minItems: 5

If this doesn't touch hardware, what are these clocks for?

You don't need 'minItems' unless it's less than the number of 'items'.

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
> +    enum: [0, 1]
> +    default: 0
> +    description: Instance index for sound card in
> +                 M core side, which share one rpmsg
> +                 channel.

We don't do indexes in DT. What's this numbering tied to?

> +
> +  fsl,version:

version of what?

This seems odd at best.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]

You're going to update this with every new firmware version?

> +    default: 2
> +    description: The version of M core image, which is
> +                 to make driver compatible with different image.
> +
> +  fsl,buffer-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: pre allocate dma buffer size

How can you have DMA, this doesn't touch h/w?

> +
> +  fsl,enable-lpa:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: enable low power audio path.
> +
> +  fsl,rpmsg-out:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present, the transmitting function
> +      will be enabled.
> +
> +  fsl,rpmsg-in:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present, the receiving function
> +      will be enabled.
> +
> +  fsl,codec-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    default: 0
> +    description: Sometimes the codec is registered by
> +                 driver not by the device tree, this items
> +                 can be used to distinguish codecs.

How does one decide what value to use?

> +
> +  audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the audio codec

The codec is controlled from the Linux side?

> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the reserved memory nodes
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

How does this work? Don't you need somewhere to put the 'rpmsg' data?

> +    };
> -- 
> 2.27.0
> 
