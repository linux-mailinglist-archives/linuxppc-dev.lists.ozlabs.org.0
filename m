Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C947AD64F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:45:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oKJmAHGi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvKK86qrmz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oKJmAHGi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvKJF2w4lz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 20:44:43 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-533f193fc8dso2562123a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638679; x=1696243479; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPKwu29nswr19PRfxmThaRgCyfVAPPnrF03AJDF6RVE=;
        b=oKJmAHGi40mbKgGXGoNOwvE1JAuwAH/j5ch42srvSTDFOc5lZhTO3G4J3pXEDPIeFW
         8PCj4IhLy0Zid3FECSuVUPTkonT2jeeEASEueWv3DK8WLwfW6U+shfRRDLGIXH6QLqTR
         hdXWnRQVykge3XAMwbTb70cQXhhwPdGH8c50iNTZM1EJNPKtkp9PcoxtrkxUqMv+scAc
         k/Ozj1iN7Onb52COmtKrroAJd+9T+4NWuEvxL57ZowvucO0BKTftOk+O0hNtQFjbTKbK
         kEB4rEoTzoO6wWHyfKfpeLDRgR+Pp9iuqaBWYs1K10O5/Y83MLF2cpte1xUDzSPi39aH
         XKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638679; x=1696243479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPKwu29nswr19PRfxmThaRgCyfVAPPnrF03AJDF6RVE=;
        b=h72mSDIWsHf2NG5LHRDXeNrygU8eMknptkygM8W1k1SXO0sp9jH3yIJrL5/e5Hrg9u
         DZydL9WZDWcBvJd/fTx1R3Ofsnv1M9Qx1DQHs4+P5BrEyI9fEKX4fJ1+NsA5mbaUzZC8
         0pGnQJyNOcenEuHVXRGTdNqIwcEPmgav4XL6Z9ejqZE4LmTs9tDwKNn3cCQpYxC6zi0W
         M/YrvNghozFXMPiOL3SElIroa1PH/RiYY6728Y7ChFyR8++SOAfTOiUjtXxBuinaIiYF
         /tqLPMj7rAkCHmYXRUDUun7R8km9PIBQ/juB9Whwi/L4fz3D2Ov5gN76bbI49tLIxlOo
         v+iQ==
X-Gm-Message-State: AOJu0YwrWVIZpl3F9SG1FtfUTXkky9JZBmJuxr5Bv4jOK160iU5Niwdh
	KGgMMn5ml3lz9u7DY4Ox55Tr6g==
X-Google-Smtp-Source: AGHT+IFdMo5I5c373VJKI1Qiq+6RT/IKdTELM18C3QX5YTHa873Vh8IoMEaubO6qaZj1vsmpa+IZ6Q==
X-Received: by 2002:a05:6402:b5b:b0:533:d1cd:62c5 with SMTP id bx27-20020a0564020b5b00b00533d1cd62c5mr3976542edb.17.1695638679365;
        Mon, 25 Sep 2023 03:44:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7cace000000b0053331f9094dsm5356947edt.52.2023.09.25.03.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 03:44:38 -0700 (PDT)
Message-ID: <e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
Date: Mon, 25 Sep 2023 12:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add
 support for QMC HDLC
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
 <20230922075913.422435-9-herve.codina@bootlin.com>
 <5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
 <20230925101703.1bf083f1@bootlin.com>
 <5b804a1a-6bfd-429d-ad84-696b7ecef72d@linaro.org>
 <20230925122758.43963736@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20230925122758.43963736@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Si
 mon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/09/2023 12:27, Herve Codina wrote:
> On Mon, 25 Sep 2023 10:21:15 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 25/09/2023 10:17, Herve Codina wrote:
>>> Hi Krzysztof,
>>>
>>> On Sat, 23 Sep 2023 19:39:49 +0200
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>   
>>>> On 22/09/2023 09:58, Herve Codina wrote:  
>>>>> The QMC (QUICC mutichannel controller) is a controller present in some
>>>>> PowerQUICC SoC such as MPC885.
>>>>> The QMC HDLC uses the QMC controller to transfer HDLC data.
>>>>>
>>>>> Additionally, a framer can be connected to the QMC HDLC.
>>>>> If present, this framer is the interface between the TDM bus used by the
>>>>> QMC HDLC and the E1/T1 line.
>>>>> The QMC HDLC can use this framer to get information about the E1/T1 line
>>>>> and configure the E1/T1 line.
>>>>>
>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>> ---
>>>>>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 24 +++++++++++++++++++
>>>>>  1 file changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>>>>> index 82d9beb48e00..61dfd5ef7407 100644
>>>>> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>>>>> @@ -101,6 +101,27 @@ patternProperties:
>>>>>            Channel assigned Rx time-slots within the Rx time-slots routed by the
>>>>>            TSA to this cell.
>>>>>  
>>>>> +      compatible:
>>>>> +        const: fsl,qmc-hdlc    
>>>>
>>>> Why this is not a device/SoC specific compatible?  
>>>
>>> This compatible is present in a QMC channel.
>>> The parent node (the QMC itself) contains a compatible with device/SoC:
>>> --- 8< ---
>>>   compatible:
>>>     items:
>>>       - enum:
>>>           - fsl,mpc885-scc-qmc
>>>           - fsl,mpc866-scc-qmc
>>>       - const: fsl,cpm1-scc-qmc
>>> --- 8< ---
>>>
>>> At the child level (ie QMC channel), I am not sure that adding device/SoC
>>> makes sense. This compatible indicates that the QMC channel is handled by
>>> the QMC HDLC driver.
>>> At this level, whatever the device/SoC, we have to be QMC compliant.
>>>
>>> With these details, do you still think I need to change the child (channel)
>>> compatible ?  
>>
>> From OS point of view, you have a driver binding to this child-level
>> compatible. How do you enforce Linux driver binding based on parent
>> compatible? I looked at your next patch and I did not see it.
> 
> We do not need to have the child driver binding based on parent.

Exactly, that's what I said.

> We have to ensure that the child handles a QMC channel and the parent provides
> a QMC channel.
> 
> A QMC controller (parent) has to implement the QMC API (include/soc/fsl/qe/qmc.h)
> and a QMC channel driver (child) has to use the QMC API.

How does this solve my concerns? Sorry, I do not understand. Your driver
is a platform driver and binds to the generic compatible. How do you
solve regular compatibility issues (need for quirks) if parent
compatible is not used?

How does being QMC compliant affects driver binding and
compatibility/quirks?

We are back to my original question and I don't think you answered to
any of the concerns.

Best regards,
Krzysztof

