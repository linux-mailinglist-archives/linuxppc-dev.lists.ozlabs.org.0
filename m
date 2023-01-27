Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8CF67EA97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 17:16:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3N4848MSz3fHR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 03:16:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ort+m9Tb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ort+m9Tb;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3N3D38pPz303P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 03:15:35 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso5892368wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 08:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgZz+6PWFo4uW0VORVf3OBAL6wZ6DYjbjKUyaSSYmLM=;
        b=Ort+m9TbQelr2tInwYyQ8i8qHQ9blNIDw8TmQjGTYoR4bUs7fMU1NnbQrZhKPmY7OY
         bnGaPQLEplLrNuPt25RBJHdyb55D63iCHX2SOipQ5m2HVMHZFV1vsn+vdQxU3ZFuFOjv
         3ggvXdOihf0ZvuO7ZituWSGczgLzkhUcp4AdTYssg9RFpXJZg6WqnkyaHR7GzfOzDO6Z
         uZtGy2pVmhKEFQnUtBTDX8Rja8TwXTShtIEIWgM21CKC1YsVaY9gPdQ6wKAZFqgeiMoj
         pADxQ3X+LeP1plXK4RroYiQbxr473gHm9Q3suLR68ArUmJN5R61LknbGQP1KSdt6dNqo
         O8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgZz+6PWFo4uW0VORVf3OBAL6wZ6DYjbjKUyaSSYmLM=;
        b=dfuy9Pl82trqgBcgmqmSs/1+n4I9u11KA4SPZqInzpE24T02sYV4mtKGtp6ofG48PM
         W4Qv9LL0CMJerIm3/WwMCVwtrwG5XFC7rY8synQhiFklUlYnyHP4wDIz85aFYBSTk0Dq
         2/DX13zcjO0tZGeTSOIk4VVCH5Zy5aE3gWYs/E137PuHghKj4lzbC/4Lj4x//4EWjTyf
         GuVCkS/19s2cuIZaFNKQNm15a+nzVnQhCcoBrS6xnlArY9Xc0VAlGV8kskhFaac93NOS
         SARstK+0z9Iylc1F8w44gUV9mBMmvwV9rdIIMVkCAs3yRm1RCQv47ah0rXBOh2DLEPUn
         LEwQ==
X-Gm-Message-State: AO0yUKUmRwWST57byb/GJtUqM8ALYAwNQ7FVoeJjMTQoIYuvZiTlGvxk
	mT6xSx/RLISXdC+E0VJrucJHww==
X-Google-Smtp-Source: AK7set8XGssyTqlV8J4exzGzcFmE8vvc7miQvlQUvYrj/PoNPn4D2LcsEEXmO53TfG7v3RdzI+/L8Q==
X-Received: by 2002:a05:600c:4f4a:b0:3dc:16d4:a99f with SMTP id m10-20020a05600c4f4a00b003dc16d4a99fmr13556737wmq.8.1674836127152;
        Fri, 27 Jan 2023 08:15:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ip7-20020a05600ca68700b003dc433bb5e1sm427854wmb.9.2023.01.27.08.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:15:26 -0800 (PST)
Message-ID: <a3c3603f-7401-aeb2-4b58-86c3ca778c6c@linaro.org>
Date: Fri, 27 Jan 2023 17:15:24 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20a9070f-9673-2f51-97df-68e78c37d894@seco.com>
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

On 27/01/2023 17:11, Sean Anderson wrote:
>>>>>
>>>>>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
>>>>>  drivers/phy/freescale/Kconfig                 |   1 +
>>>>
>>>> The phy driver Kconfig change shouldn't be part of this patch.
>>>
>>> I put it here for bisectability, since this is the point where we need
>>> to enable it. But I can do this in a separate patch if you want.
>>
>> From DT ABI perspective, it's already broken anyway if you need to change
>> kernel and DT atomically.
> 
> AIUI new kernels must work with old device trees, but new device trees need not
> work with old kernels. So a change like this is fine, since the kernel won't
> touch the serdes if it isn't supplied.

You used the argument "bisectability". If the patchset is not
bisectable, the ABI is broken.

Best regards,
Krzysztof

