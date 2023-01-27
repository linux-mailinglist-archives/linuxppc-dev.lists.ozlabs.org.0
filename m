Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281C67EB12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 17:42:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Ndp2H1rz3fHn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 03:42:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QD9NvE+U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QD9NvE+U;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Ncr1Blrz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 03:41:13 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id k16so3871490wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPTLAfBem8mtkfVwVTNDx60U15RuMcp3dwLzsVvyzDo=;
        b=QD9NvE+UGIkiNiazx9lO8r/37MxQac1JOfi9Z2KZF7v38RZ7prhqxckpZtEoG9c6Wm
         AZNJOXCUv+RG3yU5HPga028/r0ml/w7lHFeV8J/cQzWl4t4lBBBypMg+mLTLNUWX8vPN
         IqAMrm0pDKgwkkxi8uW3F8wLfzLBQhUL4Gb3KP/Cl/tF1P2jI+HVTJYetrvA2sPD7Rzt
         VVHFc4JxMO6k/IujHA1xrEbih6D70fUvoc4EJkMTUrkagSNMAZ1OAyUyL1r3OMBEsgkM
         ttU8ZBDX/NlmkZgB8YB0KO4KpbwbJ7f1DdwClTzm2GaCrE/aS1r/WCV2CdR+8usr/f+x
         IsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPTLAfBem8mtkfVwVTNDx60U15RuMcp3dwLzsVvyzDo=;
        b=VzjP5COWNIBQUIgolmMzdCWOdD8gX1lIxyI1DtCA7uI+N/78daPW7qWrDUXXlVZfEk
         rhPOvAqC7hwpWrhyMvGtKPUS+HS4WQZHj2E95fS5wflaHy04cPiaRqFsePHkbKmy89k/
         giNEPp69SJvpJgKUFlECtJE8idv3Md8kZ0Pxz+22agWit/sKlLlzBOTMdqV0YqslXO/8
         IVOydOtgCWT9fFKePoinh8aZqcLHnj9cn5cmH8ovjnNqJ4mNC1KtmjROp5qslcVlKLfa
         hXOhgLCwU3bgAEf0ZXPjiHBZj0d6JGLGJvGm4mc5uN8Y71FV52PXiXBdFeq5Qv5IVrQu
         E4+A==
X-Gm-Message-State: AFqh2krjb2++kROP9IJ/5Z0hqUj7WhujkIvhdbvNY4gVJqwHWa4yUwEc
	/gZQNgMbTJmEsJqMiVqJfwKcCg==
X-Google-Smtp-Source: AMrXdXvpTlskISiXIz63zCo5frc4zDQHnrmnnE8j0WWxaXqqFSFUfPkasP/5CcopaEa+UL6M7xsYRA==
X-Received: by 2002:a05:600c:1c8b:b0:3db:fe:f84e with SMTP id k11-20020a05600c1c8b00b003db00fef84emr39328237wms.1.1674837670367;
        Fri, 27 Jan 2023 08:41:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d44c4000000b002bfcc9d9607sm3370040wrr.68.2023.01.27.08.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:41:09 -0800 (PST)
Message-ID: <8da6b154-f799-4a33-d455-f42e30ad8940@linaro.org>
Date: Fri, 27 Jan 2023 17:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-8-sean.anderson@seco.com>
 <20230125234335.GC20713@T480> <8074f0be-8a70-a937-49f2-123e0bfc6218@seco.com>
 <20230127075248.GL20713@T480> <20a9070f-9673-2f51-97df-68e78c37d894@seco.com>
 <a3c3603f-7401-aeb2-4b58-86c3ca778c6c@linaro.org>
 <6ad9bc2a-910a-357c-fd7a-cf4ffe13ddb0@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6ad9bc2a-910a-357c-fd7a-cf4ffe13ddb0@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/01/2023 17:22, Sean Anderson wrote:
> On 1/27/23 11:15, Krzysztof Kozlowski wrote:
>> On 27/01/2023 17:11, Sean Anderson wrote:
>>>>>>>
>>>>>>>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>>>>>>>  drivers/phy/freescale/Kconfig                 |   1 +
>>>>>>
>>>>>> The phy driver Kconfig change shouldn't be part of this patch.
>>>>>
>>>>> I put it here for bisectability, since this is the point where we need
>>>>> to enable it. But I can do this in a separate patch if you want.
>>>>
>>>> From DT ABI perspective, it's already broken anyway if you need to change
>>>> kernel and DT atomically.
>>>
>>> AIUI new kernels must work with old device trees, but new device trees need not
>>> work with old kernels. So a change like this is fine, since the kernel won't
>>> touch the serdes if it isn't supplied.
>>
>> You used the argument "bisectability". If the patchset is not
>> bisectable, the ABI is broken.
> 
> Well, because Shawn wants it in a separate patch I am just going to enable
> the driver by default on Layerscape before adding the device nodes. That way we have
> 
> 1. Base state, driver not enabled and node is disabled
> 2. Driver enabled but not used because the node is disabled
> 3. Driver enabled and bound to node
> 
> So there is never a case where the node is bound but the driver isn't enabled
> (which would cause the ethernet drivers to fail to probe).

Then there is no bisectability issues and the Kconfig patch should have
been squashed here... Mentioning bisectability and that squash just
confuses.

Best regards,
Krzysztof

