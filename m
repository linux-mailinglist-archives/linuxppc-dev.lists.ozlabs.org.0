Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940165BB274
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 20:51:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTjp83Qxmz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 04:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.182; helo=mail-oi1-f182.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTjnm6PRfz3bc3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 04:50:52 +1000 (AEST)
Received: by mail-oi1-f182.google.com with SMTP id m130so7202972oif.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 11:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3UB7ATwI4jkvN5dfzXoHTLYFFznwA2fYTP5Sp8m3D6A=;
        b=rrChRWr9RMu+YHVHMcJ1VMoj63j+q8B2e659OHd41GKKsvAenmMd/88F7vXH1slRAn
         SvmPhFFcmPHPJErkANg407/2S920m6WR+Iw6pubVTvWCK/AoIDvN3xJPRT4RFJchGtKZ
         UuCVXFo4e6Y5NMivuiZhgCMzJVBN1E/AnvKrFgM1+PiPJjf0M1B24tliC+KjaxIJS+cJ
         uwH8cYbF9YVKyWVNL8e4gFdqzvcct/3CCYfYT+OTCuKdH4oZozn3nTQnJigcTidQ7v/r
         KIAbIMLGeZuYqzf+oo77Zbl2v0qP07PjVV11xgDjllg2+/9dxvavzqAQyDSuykBeKQ5Y
         pAiQ==
X-Gm-Message-State: ACgBeo3rEvcm3u8a6uazNWcEIAL628ecydXKCGjS06OzW1T+/tYPjy4+
	+a3PnbglVl6aDCGSDVOPkA==
X-Google-Smtp-Source: AA6agR710WjH2qECtnOYp/b/ibt2BmM7PlV30E4FBE3nldt1uSx9BidvH6yyuvSYQNT0OEBJvdRZbw==
X-Received: by 2002:a05:6808:1148:b0:344:e58d:7449 with SMTP id u8-20020a056808114800b00344e58d7449mr7495734oiu.209.1663354249346;
        Fri, 16 Sep 2022 11:50:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k26-20020a056808069a00b0033a11fcb23bsm9346668oig.27.2022.09.16.11.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:50:48 -0700 (PDT)
Received: (nullmailer pid 1065156 invoked by uid 1000);
	Fri, 16 Sep 2022 18:50:48 -0000
Date: Fri, 16 Sep 2022 13:50:48 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign the rpmsg channel
Message-ID: <20220916185048.GA1061412-robh@kernel.org>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
 <20220914105145.2543646-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914105145.2543646-2-chancel.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, festevam@gmail.com, shengjiu.wang@nxp.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 14, 2022 at 06:51:39PM +0800, Chancel Liu wrote:
> Add a string property to assign the rpmsg channel this sound card sits
> on. It also represents the name of ASoC platform driver. This property
> can be omitted if there is only one sound card and it sits on
> "rpmsg-audio-channel".
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> index d370c98a62c7..3744ae794c00 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -11,8 +11,11 @@ maintainers:
>  
>  description: |
>    fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
> -  are SAI, DMA controlled by Cortex M core. What we see from Linux
> -  side is a device which provides audio service by rpmsg channel.
> +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
> +  Linux side is a device which provides audio service by rpmsg channel.
> +  We can create different sound cards which access different hardwares
> +  such as SAI, MICFIL, .etc through building rpmsg channels between
> +  Cortex-A and Cortex-M.
>  
>  properties:
>    compatible:
> @@ -85,6 +88,17 @@ properties:
>        This is a boolean property. If present, the receiving function
>        will be enabled.
>  
> +  fsl,rpmsg-channel-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      A string property to assign rpmsg channel this sound card sits on.
> +      It also represents the name of ASoC platform driver. This property

That's a Linux detail which doesn't belong in DT.

> +      can be omitted if there is only one sound card and it sits on
> +      "rpmsg-audio-channel".
> +    enum:
> +      - rpmsg-audio-channel
> +      - rpmsg-micfil-channel
> +
>  required:
>    - compatible
>    - model
> @@ -107,3 +121,22 @@ examples:
>                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
>          clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +
> +    rpmsg_micfil: audio-controller {
> +        compatible = "fsl,imx8mm-rpmsg-audio";
> +        model = "micfil-audio";
> +        fsl,rpmsg-channel-name = "rpmsg-micfil-channel";
> +        fsl,enable-lpa;
> +        fsl,rpmsg-in;
> +        clocks = <&clk IMX8MM_CLK_PDM_IPG>,
> +                 <&clk IMX8MM_CLK_PDM_ROOT>,
> +                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
> +                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
> +                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
> +        clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> 
