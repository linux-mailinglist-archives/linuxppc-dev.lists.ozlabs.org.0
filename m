Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048E5E7861
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:31:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYpMy3Xm0z3cdb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 20:31:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PiyEHGgC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PiyEHGgC;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYpMJ2tBMz3c6B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 20:30:33 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id b6so14106663ljr.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=I7e7inRGZJBBrCxWPf4VaG+f6kEpOQsdfxaR6MXxAk4=;
        b=PiyEHGgCKoygApaBJYQHYg/kBKkhs9/+zycl/WsVJbpxF9ZqAtwPwgNbbc8rir7qvc
         S2EQXUP0LwJVFyS/1ewNiUVYBwQJPeNlmWq7XUp74KDxEiJ3ZMqUciOiFX4dqVFPjvPZ
         0kPJnpgaECDcVhKiRpzU2qcIan4qzQ8a/cUdm5m2mGzvungWfpPllAtMfQ8fgKUeyVj0
         OU0rpxHHtmuUfMqvx/C1mJ2vZz4+nEzDKXFx9G9TqfZVoP4ZdZoiGHPq2VTpgrIIdhV0
         gB8LUCZlYZIBQxyOi2dYxTx96QfoVomXj6Ul83rLvBCCBiyaDss3j3GmVRguX68z+By5
         RvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=I7e7inRGZJBBrCxWPf4VaG+f6kEpOQsdfxaR6MXxAk4=;
        b=5bCiJmz0xfEDbBlupBSu9683UyGQlHI0iHO0db0jR+cdpzTYAT7IgIRH522K0zGNMo
         3JPri8IIGcln7h+8SymdtlBLi3Cj4Pwz9g+6Kf88EhtMXeg/F0BI4CYr9BfmbEdDIY66
         7y2Lzu98ZLuAaJmV2Fl+ZiXdDbj9ls8emyRJ0t5Pu9OmFHWJxRiA4Mxw+pBl2HfweXyq
         Po3v0H8t7qGhDxWZBFlDD+5J8lIONnBWOGUz3/iF9+R5DalECKgWApi71xaBA1A/n91v
         Dh2fEdtMa4HG/qcA56fxkBVp/tEWrPRsE7DM3lFj97gfzOFzKeMrVtd4olb8F7Rel+0M
         XaLA==
X-Gm-Message-State: ACrzQf2qugAHfQ0o7U+C1+w8zZZwNr8vUgps6KVmLp75X6ubvl7ICkL1
	Kg2P8WJzWtcqKw2HgJ8NSVlzCw==
X-Google-Smtp-Source: AMsMyM4qX9eM1McoAFz/vkeBKtYPlXtNk3BWIHaS4QHrJQN/+tsnpIR0MUKpVPKb4Wfv3WTnHNtCjQ==
X-Received: by 2002:a05:651c:a05:b0:26c:5010:39d1 with SMTP id k5-20020a05651c0a0500b0026c501039d1mr2768953ljq.115.1663929029776;
        Fri, 23 Sep 2022 03:30:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f16-20020a2ea0d0000000b00268335eaa8asm1317133ljm.51.2022.09.23.03.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 03:30:29 -0700 (PDT)
Message-ID: <eba9df27-cf91-b20d-bdc1-5acc5f02753a@linaro.org>
Date: Fri, 23 Sep 2022 12:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign the rpmsg channel
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, Rob Herring <robh@kernel.org>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
 <20220914105145.2543646-2-chancel.liu@nxp.com>
 <20220916185048.GA1061412-robh@kernel.org>
 <VI1PR04MB4222BDB1378A01E99DFC6211E3519@VI1PR04MB4222.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1PR04MB4222BDB1378A01E99DFC6211E3519@VI1PR04MB4222.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "S.J. Wang" <shengjiu.wang@nxp.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "perex@perex.cz" <perex@perex.cz>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/09/2022 11:56, Chancel Liu wrote:
>>> Add a string property to assign the rpmsg channel this sound card sits
>>> on. It also represents the name of ASoC platform driver. This property
>>> can be omitted if there is only one sound card and it sits on
>>> "rpmsg-audio-channel".
>>>
>>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
>>>  1 file changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> index d370c98a62c7..3744ae794c00 100644
>>> --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> @@ -11,8 +11,11 @@ maintainers:
>>>
>>>  description: |
>>>    fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
>>> -  are SAI, DMA controlled by Cortex M core. What we see from Linux
>>> -  side is a device which provides audio service by rpmsg channel.
>>> +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
>>> +  Linux side is a device which provides audio service by rpmsg channel.
>>> +  We can create different sound cards which access different hardwares
>>> +  such as SAI, MICFIL, .etc through building rpmsg channels between
>>> +  Cortex-A and Cortex-M.
>>>
>>>  properties:
>>>    compatible:
>>> @@ -85,6 +88,17 @@ properties:
>>>        This is a boolean property. If present, the receiving function
>>>        will be enabled.
>>>
>>> +  fsl,rpmsg-channel-name:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: |
>>> +      A string property to assign rpmsg channel this sound card sits on.
>>> +      It also represents the name of ASoC platform driver. This property
>>
>> That's a Linux detail which doesn't belong in DT.
>>
> 
> We pass hardware parameters in dts node to set up clocks or other
> configurations. These configurations are finally sent to Cortex-M by
> rpmsg channel because Cortex-M actually controls real hardware devices.
> If there's only one sound card sits on one rpmsg channel we will not
> need this property. But if there are several sound cards we need to
> specify correct rpmsg channel. Thus hardware configurations can be
> properly sent to Cortex-M. From this level to speak, this property is
> hardware-related since rpmsg channel represents the real hardware audio
> controller.
> 
> Here I attach the discussion in version 1 patches for your information:
> ---
> This property aims to tell the ASoC driver which rpmsg channel the
> sound card depends on. If there are several sound cards sit on rpmsg,
> we should pass correct information in dts node to specify the name of
> rpmsg channel. That is why I meant to add this property. 
> 
> Actually this property is hardware-related. As we discussed before,
> this kind of sound card based on rpmsg works under this mechanism
> Cortex-A core tells the Cortex-M core configuration of the PCM
> parameters then Cortex-M controls real hardware devices. This property
> specifying rpmsg channel represents the real hardware audio controller.
> ---
> 
> That's my idea adding this property. Do you have any suggstion?

I think you misunderstood the comment. Rob's comment was directly below
a line which he referred to. That line contained a statement referring
to Linux drivers. Anything related to Linux drivers does not belong to DT.


Best regards,
Krzysztof

