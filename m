Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBA2851AC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 20:36:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5R596kNTzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:36:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5R2z3R27zDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 05:34:47 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id 60so13233497otw.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Oct 2020 11:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T/nFz+O76MoZAtkSPqoZ0ETSJ6m02PU0D0DZHAvgJEQ=;
 b=rLBTMXdzrYmYIsakVH38Dx7CTtLqs+aTw484Dns/huFT8uUhSXk6jxqIwa8T8d4nO+
 KgvsUB8THXreT23njnuCBMXd04DlJj3yooMms752NbCxuDbKWIYI/kqLLTPo4f41GiOg
 JZ10VqVZeT45WFO2waq/kbuiCQxlyOrKnc3sEZ3BRbHLOO4LJVW1kzwymxmnXT+1Bb65
 aLL1IxoPLJ/5oAwvQY7vh0Bjk59yODwM2aD/5quG1fSe0hmxcqr+iIdoFMpoEDicIudZ
 UMhe8V1kZupVoMd1FUuRR7YpbE2ytkm6TDrZH2pxufN3RxRddcKh1RQ/iPu4RIy0oVoW
 QmYw==
X-Gm-Message-State: AOAM532xmm6y+DoPlms2aDz//y6QqKC1tjOv0VRDrZUI9rB6MlzSQVaC
 6T8TgAxohpFZe1fXKGn+MA==
X-Google-Smtp-Source: ABdhPJx1phcZuRuWBcr3gfWZUoekTD2tydrcY/GXETjtFdoxVappQeymuyeEy49v7QhaTXJ8YJ0LpQ==
X-Received: by 2002:a9d:67c3:: with SMTP id c3mr4065466otn.9.1602009284472;
 Tue, 06 Oct 2020 11:34:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m25sm1339206otl.71.2020.10.06.11.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:34:43 -0700 (PDT)
Received: (nullmailer pid 2597692 invoked by uid 1000);
 Tue, 06 Oct 2020 18:34:42 -0000
Date: Tue, 6 Oct 2020 13:34:42 -0500
From: Rob Herring <robh@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Message-ID: <20201006183442.GA2591611@bogus>
References: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
 <1601371167-32239-3-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601371167-32239-3-git-send-email-viorel.suman@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 29, 2020 at 12:19:27PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml        | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> new file mode 100644
> index 00000000..8abab2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Audio Transceiver (XCVR) Controller
> +
> +maintainers:
> +  - Viorel Suman <viorel.suman@nxp.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^xcvr@.*"
> +
> +  compatible:
> +    const: fsl,imx8mp-xcvr
> +
> +  reg:
> +    items:
> +      - description: 20K RAM for code and data
> +      - description: registers space
> +      - description: RX FIFO address
> +      - description: TX FIFO address
> +
> +  reg-names:
> +    items:
> +      - const: ram
> +      - const: regs
> +      - const: rxfifo
> +      - const: txfifo
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: PHY clock
> +      - description: SPBA clock
> +      - description: PLL clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: phy
> +      - const: spba
> +      - const: pll_ipg
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    const: imx/xcvr/xcvr-imx8mp.bin
> +    description: |
> +      Should contain the name of the default firmware image
> +      file located on the firmware search path

We generally only have this if the name/path can't be fixed (per 
compatible) in the driver. Given you only have 1 possible value, that 
doesn't seem to be the case here.

> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - firmware-name
> +  - resets

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/reset/imx8mp-reset.h>
> +
> +    xcvr: xcvr@30cc0000 {
> +           compatible = "fsl,imx8mp-xcvr";
> +           reg = <0x30cc0000 0x800>,
> +                 <0x30cc0800 0x400>,
> +                 <0x30cc0c00 0x080>,
> +                 <0x30cc0e00 0x080>;
> +           reg-names = "ram", "regs", "rxfifo", "txfifo";
> +           interrupts = <0x0 128 IRQ_TYPE_LEVEL_HIGH>;
> +           clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
> +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
> +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
> +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
> +           clock-names = "ipg", "phy", "spba", "pll_ipg";
> +           dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
> +           dma-names = "rx", "tx";
> +           firmware-name = "imx/xcvr/xcvr-imx8mp.bin";
> +           resets = <&audiomix_reset 0>;
> +    };
> -- 
> 2.7.4
> 
