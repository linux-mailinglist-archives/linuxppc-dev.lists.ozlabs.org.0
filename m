Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BB5A5F6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 11:29:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH27f06Dyz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 19:29:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l/RBizF6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l/RBizF6;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH26y4BxYz2xkr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 19:28:39 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id m7so5771504lfq.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=FmzIDD4Pa7+MmcfVJAwljvGaSQDMssbd6GqQpiHG2xs=;
        b=l/RBizF6kzePEfcYyZqRb6nMeIozE3Plc6MK0BE1z9FSW6eEoTADB7lH50rjVtKVQq
         aTqmCKBtnm6wV5Kxht5W+Ewwq+uFCzHlcHlgGiTPkWOJdSETsWYLh61oYlnGg5owVOt4
         gTgRcao62+Di9UQGpr8ywKs/U7T16LOlJPS3gfiRUCGgQ1t+mGhWOrabo3LCkRdrlRhV
         LGOm4OsQsPsCD1yoyrc1650LghtiO8wVRy/t2PRKP/bbZ8GUCFO4sCcWknY7m03qo9ei
         zhMZEP9GT1iqij0GtA82IvCC+xLVClsJgUcZzL92rTS+HteejrYHKWXXwNnafYTLpewu
         Yppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FmzIDD4Pa7+MmcfVJAwljvGaSQDMssbd6GqQpiHG2xs=;
        b=m8lzxqZ56OMkN1FbAymCYn55fpWaWIGRh2EtdjX2ORjOQJl5b7WTq2qm1VooVSLfXJ
         U+z+Vdn94IYfIVI/vsLRsYYyA2vuy39fPTR55hBN2+co6WBlt4zSmvBsGFXgBOuMrn7U
         64DuYEz50A62ex5VMaLlGOVVhfsIWpW0v5BoEua/lv1DVPXy9S6EvgdgO2sed7wASwjg
         xIXrCqGGrDTxg4mrrC7QSapKiDhwqZ5D0oCoq4nmvw3rTZMSxBIKWx7fKmc779aH/v/O
         NoWqDHd3JFJ9GL6KqlAn7UfyH/5GmmajbwG6OeHGuBthgyDQ5ixhcnwHjXonby6COpIh
         SixA==
X-Gm-Message-State: ACgBeo0Se0v5ecLHlhXqZ8JNu+EJYOc88aS7uah0j2L9bsCK6ETGlAPZ
	oVMUSV1hpwS9Odo0PM/1GACoTg==
X-Google-Smtp-Source: AA6agR4+KSqYDLnziLnnQeT1r6I0LXNAxazi5IGv/j87wuVt+YLGrV9a67iwU0YcX+hsxrZFnxmBBw==
X-Received: by 2002:a05:6512:10d4:b0:492:ede1:ec75 with SMTP id k20-20020a05651210d400b00492ede1ec75mr7014503lfg.146.1661851713946;
        Tue, 30 Aug 2022 02:28:33 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id t28-20020a056512031c00b00492e4c97ca3sm85446lfp.246.2022.08.30.02.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:28:33 -0700 (PDT)
Message-ID: <f614f968-baf4-6b4d-507e-29221e1469bc@linaro.org>
Date: Tue, 30 Aug 2022 12:28:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
 <20220829075144.2405000-2-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829075144.2405000-2-chancel.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/08/2022 10:51, Chancel Liu wrote:
> Add a string property to assign ASoC platform driver name. It also
> represents the rpmsg channel this sound card sits on. This property
> can be omitted if there is only one sound card and it sits on
> "rpmsg-audio-channel".
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> index d370c98a62c7..35e3cb9f768b 100644
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
> @@ -85,6 +88,14 @@ properties:
>        This is a boolean property. If present, the receiving function
>        will be enabled.
>  
> +  fsl,platform:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      A string property to assign ASoC platform driver name. 

No, this is not a property of hardware. Naming of some drivers in some
systems does not fit DTS and bindings.

> It also
> +      represents the rpmsg channel this sound card sits on. This property
> +      can be omitted if there is only one sound card and it sits on
> +      "rpmsg-audio-channel".
> +
>  required:
>    - compatible
>    - model
> @@ -107,3 +118,22 @@ examples:
>                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
>          clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +
> +    rpmsg_micfil: rpmsg_micfil {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Also: no underscores in node names.

Best regards,
Krzysztof
