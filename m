Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF35B69B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 10:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRcNc6W5kz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IqhQhQ7V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IqhQhQ7V;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRcN16cLpz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 18:39:43 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id b5so19529947wrr.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 01:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uXn2kJmSnOy/skqD13Z6q/Bm/edUDnU+xZ+VxBn/tq8=;
        b=IqhQhQ7VlpeOfvp3Gjx1Jcswtb9IN9La2TCB/B6Ps/qALDH7gISIMKnvskAfLI6vKi
         LazyuZYo/rapSrf/MnH4Y69v24Q/3UV0iGMxpkZ/l3zAk/93Z+yzUXuuAfW5M49dLXzy
         d1mGbjxif3uXKOQHxc/+jzCkFYEyHe+NZzH4QkloJgVHyLM4FKs509jw+v+ZMQCWUQ+h
         5w5RGsYJ1FQZVJN8aQ294C4SafBWv037zj2MISDbzb27woZbF8Cv9Q24HHFWL+HW3HHf
         uIIThnOhiNcpve3kl0zOCN41VN386ct5qS1YBOg1y//Jr+C0JfQvcft31yY29yGv/9LG
         tOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uXn2kJmSnOy/skqD13Z6q/Bm/edUDnU+xZ+VxBn/tq8=;
        b=2ovvcQVKcgm/n7lWU9ClY5NgIlm1mGN0vlYL5F7SJH0w2Z5kEoegpu4EhoDFkzp8ud
         fYTNeGKHV2WFbcklITZ6eFpk26D+f5ksqnkEyWO1e3xIPVPf1DiX9oFzWxyINNMjcAWH
         Pa80RvczunDlPR4NTO3TmrQn8YbZJ8zVzEUF5uzWW+rlv/3bydqRx5WCT1qraGK9dco6
         v2TK+frQMVhotatdneWFLCgQ1w3kBqs7peUpEXqA+/KD3O+CKr5Ebza5VV7DXZ4WPh9U
         EKIOlBv9BBRfFlhzVupBzO7izwpDb3McJM3aGafuTCvdj9pHRPGK0ElyNT3m95/tu58U
         WXNw==
X-Gm-Message-State: ACgBeo30OnCUfoRM9Q4OKmqk7UNgAuybQsh5Q/Qfr40ReTJ7piYCDEQ/
	DB9E97s0PGVYdpZUOE/S1qEbuw==
X-Google-Smtp-Source: AA6agR6xDP8YhUAqPRV2B1RS5sMRp8HTP1cLkkOYlHerD1lbSH3yDIQOMd8tXRMgT1B4nqloLOQuGw==
X-Received: by 2002:a05:6000:2a6:b0:22a:baa9:3103 with SMTP id l6-20020a05600002a600b0022abaa93103mr2430328wry.376.1663058375003;
        Tue, 13 Sep 2022 01:39:35 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d5085000000b002253d865715sm9870008wrt.87.2022.09.13.01.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 01:39:34 -0700 (PDT)
Message-ID: <e160baf1-cca9-46b6-eaf7-129b1b1eb9c3@linaro.org>
Date: Tue, 13 Sep 2022 10:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "S.J. Wang" <shengjiu.wang@nxp.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <VI1PR04MB4222EAA244F7A7F179E85500E3479@VI1PR04MB4222.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1PR04MB4222EAA244F7A7F179E85500E3479@VI1PR04MB4222.eurprd04.prod.outlook.com>
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

On 13/09/2022 09:14, Chancel Liu wrote:
>>> Add a string property to assign ASoC platform driver name. It also
>>> represents the rpmsg channel this sound card sits on. This property
>>> can be omitted if there is only one sound card and it sits on
>>> "rpmsg-audio-channel".
>>>
>>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
>>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> index d370c98a62c7..35e3cb9f768b 100644
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
>>> @@ -85,6 +88,14 @@ properties:
>>>        This is a boolean property. If present, the receiving function
>>>        will be enabled.
>>>
>>> +  fsl,platform:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: |
>>> +      A string property to assign ASoC platform driver name.
>>
>> No, this is not a property of hardware. Naming of some drivers in some
>> systems does not fit DTS and bindings.
>>
> 
> This property aims to tell the ASoC driver which rpmsg channel the
> sound card depends on. If there are several sound cards sit on rpmsg,
> we should pass correct information in dts node to specify the name of
> rpmsg channel. That is why I meant to add this property. I just want to
> use a string property to distinguish different names of rpmsg channel.
> 
> Actually this property is hardware-related. As we discussed before,
> this kind of sound card based on rpmsg works under this mechanism
> Cortex-A core tells the Cortex-M core configuration of the PCM
> parameters then Cortex-M controls real hardware devices. This property
> specifying rpmsg channel represents the real hardware audio controller.
> 
> That's my idea adding this property. Do you have any better suggestion?

Any reason why not using phandle to sound card node? If your property is
about rpmsg channel name, use something like that, e.g.
"fsl,rpmsg-channel-name" or What you wrote in property description and
here are quite different things...

Best regards,
Krzysztof
