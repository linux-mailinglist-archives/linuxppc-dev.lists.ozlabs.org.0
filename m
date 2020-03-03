Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F0176A30
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 02:48:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wg0D6f24zDqcj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 12:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wfxy3J8vzDqcM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 12:46:46 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id a22so1319636oid.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 17:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0fZprhK1W/+54HzE9JKB5hhmjgGt264/Y236IBMlW68=;
 b=dgQbsi2oQ1h/oI4Gs+UnvQPh/QADbDVWPBJSSybH2dMLmazkFQBpS0oGxGdb1iDIzm
 yswVfph8U/ukLJ3FSN13vgKdhjsJRuDZA4K0JxiGy6xh+c+TqknCucnJmusUl0EgDWEF
 2jd23YvtpB2CbfRPUEZs1foTo+Kge9jl9lorzCNraiklLtXuO6dZxLO+vv+KP9amkykj
 PUv7J85Dggh4UdGRtIZwrGCcRXIO+no5LP7I2Q+HIqjNeTLJL5b2EqakYsBh1BFQbXAm
 rkAJ+3q0W1bGhVH+P3YM6M+oGMdrzHsbTZL/DJkFoouxd7L0TCF7e6uPc+sCo/jYv38t
 J2Sg==
X-Gm-Message-State: ANhLgQ3sVsE+AGVRhU2sznavheHpI6EtH0MiwSpP30EN2NDVk2ZGTj5k
 5ZoUBOj/aNm4QckIv+o7ZA==
X-Google-Smtp-Source: ADFU+vtMKankA5j2TyBMep5zxakZ/gSxHjO96dpd6H9OgS/zdaStVrFVHEAotLCrZcCrix4ZjMErJQ==
X-Received: by 2002:aca:bfc2:: with SMTP id p185mr936911oif.57.1583200002745; 
 Mon, 02 Mar 2020 17:46:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m19sm7258226otn.47.2020.03.02.17.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 17:46:42 -0800 (PST)
Received: (nullmailer pid 467 invoked by uid 1000);
 Tue, 03 Mar 2020 01:46:40 -0000
Date: Mon, 2 Mar 2020 19:46:40 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 7/8] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200303014640.GA26270@bogus>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <2aa0b446c3e2af59e3472d8f7706298691ec4a5c.1583039752.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa0b446c3e2af59e3472d8f7706298691ec4a5c.1583039752.git.shengjiu.wang@nxp.com>
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
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 01, 2020 at 01:24:18PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.yaml  | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> new file mode 100644
> index 000000000000..500af8f0c8f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

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
> +    oneOf:
> +      - items:

You can drop oneOf and items here.

> +        - enum:
> +          - fsl,imx8mn-easrc

Blank line between properties please.

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
> +    oneOf:

Drop oneOf as there is only one.

> +      - items:
> +          - const: ctx0_rx
> +          - const: ctx0_tx
> +          - const: ctx1_rx
> +          - const: ctx1_tx
> +          - const: ctx2_rx
> +          - const: ctx2_tx
> +          - const: ctx3_rx
> +          - const: ctx3_tx
> +
> +  fsl,easrc-ram-script-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The coefficient table for the filters

Need to define the exact string(s).

> +
> +  fsl,asrc-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Defines a mutual sample rate used by DPCM Back Ends

Constraints?

> +
> +  fsl,asrc-format:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Defines a mutual sample format used by DPCM Back Ends

Constraints?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-name

dma-names

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
> +           status = "disabled";

Don't show status in examples.

> +    };
> -- 
> 2.21.0
> 
