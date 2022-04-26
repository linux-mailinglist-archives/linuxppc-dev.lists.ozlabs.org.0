Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B8510271
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 18:00:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knmmr4JDJz3bqm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 02:00:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uAJmI3Pj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uAJmI3Pj; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnmmD5jJHz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 01:59:40 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id l7so37057493ejn.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IE5WdDoFR9vCBN7dCO3EiE00nBi4kE/GvRYTPFuengA=;
 b=uAJmI3Pj5Ngxs35JNs0qJ/cLsAm6ZoUCdy76uRTYT9+Z1/KhgAaieAS8CSZNRJdiGC
 4icruyLaS2b3j68ffd1FQii1CRcoKYiGEsi1WkjqyCQEST0CeCVJputyIDElvsb0MIvL
 ZZUFcuTf1rogLT79mSdLkCMMwfBd1LoMFDVRvduF9/wjNBPtaI5Ef/uK4PHTPU181ZxI
 JOT9lurbEVBv68bOo/IT+AKBxBBhQEktpdyCp/8MfkCZ8yhP39IUls/sfEKYogPU00+n
 RMi3N2n0pPksskrRF0l5AL0/Z8YSuaL9P2DmZsw3MvuYRexm3WsKL3bvIu3O4KinMIqL
 vhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IE5WdDoFR9vCBN7dCO3EiE00nBi4kE/GvRYTPFuengA=;
 b=KKh0O1ZVk4Ish5oNwkb8MLdpyR4QqF7HhBUxEne7RXxnK8hEDmYSawSHNepvM4BtaJ
 jYyrBKqxCGA1s1X9pOVIw8adCPbh8FhaIo4iB7ASpI43kL4gDmdziM8XVEAFWmZLGxfP
 JHIEYNFVOJinxDFeU34j0/IWxxeueywjpBGcjhsnNIIXMf4ZIlG6lAUEnk3qZ2Yn02DK
 GSw68QC4Rv2DCeepB6y3hHzJ4HsNacOP2fhctcqaY+neuyZzXaQUmBj3CbufUEr+kyDK
 dDtSsitlpP2WyzPiAvnu7WrIq1lakWGFb8mVoagiUKDHKGfSpD9b/4MMRIK4L0lSDK2f
 valw==
X-Gm-Message-State: AOAM5314HHhQH9/n6LvS29Cf7lcDmW3nwhAExCKx5vfDQ/se0BReKgun
 enFGGJeV5LSbHGFqHXivyoc6Rw==
X-Google-Smtp-Source: ABdhPJyD555vYRh8BhSe3kVw/JNEcQgwHjOkSDdSDmnLNaL5jq9Crlx6eOVDsZNck52443oEXklXCw==
X-Received: by 2002:a17:906:7c5:b0:6e8:7c6f:4f49 with SMTP id
 m5-20020a17090607c500b006e87c6f4f49mr22050294ejc.378.1650988777608; 
 Tue, 26 Apr 2022 08:59:37 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q16-20020a056402519000b00425f60d7109sm1294360edd.54.2022.04.26.08.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:59:36 -0700 (PDT)
Message-ID: <3171818a-82c2-3f29-03e4-fd2b7d8947fc@linaro.org>
Date: Tue, 26 Apr 2022 17:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220425140214.32448-1-michael@walle.cc>
 <658851ed-33fd-8e2b-7db7-ef1ca9e31c33@linaro.org>
 <83b596d0570c779c61c3c37c6f512679@walle.cc>
 <c324eec7-79b1-33da-c38e-4a480fe23126@linaro.org>
 <6fec63c911c88a375fc024f6ca0e946d@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6fec63c911c88a375fc024f6ca0e946d@walle.cc>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/04/2022 09:28, Michael Walle wrote:
> Am 2022-04-26 08:53, schrieb Krzysztof Kozlowski:
>> On 25/04/2022 23:58, Michael Walle wrote:
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +    description:
>>>>> +      Specifies the Interrupt Polarity Control Register (INTPCR) in
>>>>> the
>>>>> +      SCFG or the External Interrupt Control Register (IRQCR) in 
>>>>> the
>>>>> ISC.
>>>>> +
>>>>> +  interrupt-map:
>>>
>>> btw.
>>>
>>> minItems: 12
>>> maxItems: 12
>>>
>>> Isn't working here, is that expected? The validator seem to get the
>>> count
>>> of the elements of one tuple wrong.
>>>
>>> I.e.
>>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb:
>>> interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1,
>>> 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5,
>>> 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 
>>> 8,
>>> 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is 
>>> too
>>> short
>>
>>
>> Works for me (in different schema)... maybe update your dtschema?
> 
> Just updated to the latest one. But I'm still getting the same errors.
> 
> $ dt-validate -V
> 2022.4
> 
> /home/mwalle/repos/b-linux-arm64/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: 
> interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 
> 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 
> 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 
> 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too 
> short
> 	From schema: 
> /home/mwalle/repos/linux-mw/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
> 
> How is the length of one entry calculated?

If you add maxItems to your original v2 binding example, it works. If
you replace your example with ls1088a and use maxItems:12, it works.

So maybe something is wrong in your modified patch (which we do not have
so we cannot test it)?

Best regards,
Krzysztof
