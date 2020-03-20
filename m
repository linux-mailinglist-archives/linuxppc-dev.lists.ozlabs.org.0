Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1A18D63B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 18:50:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kWWq2vpNzF0Vk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 04:50:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kWTb2l8lzDrf6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 04:48:17 +1100 (AEDT)
Received: by mail-io1-f65.google.com with SMTP id q128so6811959iof.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sdZ8Fz0NTe2Z8mbny4b+ZzHCT+owc9QawbF3H7/fFjQ=;
 b=bsr3Z47Vz28zcCURuTuw4kMzq7jABfwpFnZk3Fazahi55E7RMTjyUbHfSTvKodNgyv
 5o4XCu74P830HlYPTtQUCIecK+UFrxKU6i00uUzlm4r87ut+cMUkd9rFb+qeGmOgIWrW
 X8ddJor4rnforEPW+GgWX8J6Oo1gdlABqebdg0Yrgl9ZxFSvUZxwcxP/G1lJl/mswHXq
 C+MSzDcnzqq9oD3kR2bBhMDc05KO4mPDGgGwZsSbgv0d8Maa5ps64K1Fqs1P1ZUA+Wis
 er7+Mhbmo6iKf7xu89DMsoBV04Po2bwHPLnVz/3oS3OE8AWU9z5KLi1+ZXgIjkaPWS7w
 cyew==
X-Gm-Message-State: ANhLgQ3eHJCmJ2LDEyToDTFhWrlucuzYoZLuq/61OFk1m6wi9CVe9ade
 ulZNd8T0IxmzmTKtwZXQNg==
X-Google-Smtp-Source: ADFU+vvwo0sFRpgMy8S/+VmmSzmDzKFlPryLvd9OSadfOfVEWtEg1diSdrBlcDY6qZflMYnDgSLyOw==
X-Received: by 2002:a6b:7a07:: with SMTP id h7mr8385084iom.47.1584726495070;
 Fri, 20 Mar 2020 10:48:15 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id t86sm2201336ili.82.2020.03.20.10.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 10:48:14 -0700 (PDT)
Received: (nullmailer pid 10514 invoked by uid 1000);
 Fri, 20 Mar 2020 17:48:12 -0000
Date: Fri, 20 Mar 2020 11:48:12 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200320174812.GA27070@bogus>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <71b6ad3d0ea79076fded2373490ec1eb8c418d21.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71b6ad3d0ea79076fded2373490ec1eb8c418d21.1583725533.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 09, 2020 at 11:58:33AM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> new file mode 100644
> index 000000000000..ff22f8056a63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^easrc@.*"
> +
> +  compatible:
> +    const: fsl,imx8mn-easrc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +
> +  clock-names:
> +    items:
> +      - const: mem
> +
> +  dmas:
> +    maxItems: 8
> +
> +  dma-names:
> +    items:
> +      - const: ctx0_rx
> +      - const: ctx0_tx
> +      - const: ctx1_rx
> +      - const: ctx1_tx
> +      - const: ctx2_rx
> +      - const: ctx2_tx
> +      - const: ctx3_rx
> +      - const: ctx3_tx
> +
> +  fsl,easrc-ram-script-name:

'firmware-name' is the established property name for this.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - const: imx/easrc/easrc-imx8mn.bin

Though if there's only 1 possible value, why does this need to be in DT?

> +    description: The coefficient table for the filters

If the firmware is only 1 thing, then perhaps this should just be a DT 
property rather than a separate file. It depends on who owns/creates 
this file. If fixed for the platform, then DT is a good fit. If updated 
separately from DT and boot firmware, then keeping it separate makes 
sense.

> +
> +  fsl,asrc-rate:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 8000
> +      - maximum: 192000
> +    description: Defines a mutual sample rate used by DPCM Back Ends
> +
> +  fsl,asrc-format:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [2, 6, 10, 32, 36]
> +        default: 2
> +    description:
> +      Defines a mutual sample format used by DPCM Back Ends
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - fsl,easrc-ram-script-name
> +  - fsl,asrc-rate
> +  - fsl,asrc-format
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mn-clock.h>
> +
> +    easrc: easrc@300C0000 {
> +           compatible = "fsl,imx8mn-easrc";
> +           reg = <0x0 0x300C0000 0x0 0x10000>;
> +           interrupts = <0x0 122 0x4>;
> +           clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
> +           clock-names = "mem";
> +           dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
> +                  <&sdma2 18 23 0> , <&sdma2 19 23 0>,
> +                  <&sdma2 20 23 0> , <&sdma2 21 23 0>,
> +                  <&sdma2 22 23 0> , <&sdma2 23 23 0>;
> +           dma-names = "ctx0_rx", "ctx0_tx",
> +                       "ctx1_rx", "ctx1_tx",
> +                       "ctx2_rx", "ctx2_tx",
> +                       "ctx3_rx", "ctx3_tx";
> +           fsl,easrc-ram-script-name = "imx/easrc/easrc-imx8mn.bin";
> +           fsl,asrc-rate  = <8000>;
> +           fsl,asrc-format = <2>;
> +    };
> -- 
> 2.21.0
> 
