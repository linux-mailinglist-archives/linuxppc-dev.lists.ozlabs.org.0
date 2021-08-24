Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 810843F5849
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 08:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtzmw2Jgmz2ybB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 16:32:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=RKNta29d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=RKNta29d; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtzmC1zstz2xXr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 16:31:52 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so1629313pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RJLKyp38KKp0MOjglAw2SCG7gTfsR3oHk7zotek8Wt0=;
 b=RKNta29d8EnjicCdSrII2r5VS4AAV/eVWQ1h9PJjjEFOmKyLAo/dsS1HL3JjePxsAa
 2MWTtvY7NtDSZseLkkkgG9HSVZUxCjPl7x4MrZmjKMFl2qGvkq2XK8pQDoJ7ZYRtEAhG
 45I2x1InnOvlWmnE3CPqFwgFMC3bU95MkTaXbjQiQojtav7q70401LKRESKibqrvlM6c
 5w/a2HCw47LD8psdzg5hkrdf7AEuhlDQpwkf98hSrHiNWzE5tMLrfeM7/imY2HCD1ymb
 RZzFCEeo+FjtSGOfU0ZBmUjvwwH3alQOaXmfbH0PDczyDOLr8CoY0wO148USU83G5MAZ
 bQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RJLKyp38KKp0MOjglAw2SCG7gTfsR3oHk7zotek8Wt0=;
 b=LrY3CNthMQ3h+OJFT+PUKGfyGXs1IyFJ/NJoKfxIkNMFMQdMIxAOj0Ey4i3BloarOI
 G9EaeHSRsJE9wyLceBEQPkJ52DNnT6WNHRSa0gaZ9Z4kGbBxkRCRmRfTYnq6KnY8Cbhw
 w6Y/NwWOVI2kTISlDJkBUkz60wDQOvOq27ZnGHDaS2VvfNUllw9Q2W63dLvN+6QMHAnW
 VjpZLiFivpvsJLe4dBYjEbOTY22sREyFkUhLKjloCWEEEPlC3nzp1cSPApmZeSQuaGMg
 5PUXFS9DVetaxNP4XkrRjeCHgqHUI7irY+lfZ5rq5PgHZ2JwtrelcfJK91adNmaeX8Zp
 Iv+A==
X-Gm-Message-State: AOAM531fCGc9cVZ2I2pKs2+h+wJTSghq5cCXs0Q1uBG77xOla3gl+k5I
 m7AeLMLy4tiBf8PKtcWXkRtbrQ==
X-Google-Smtp-Source: ABdhPJwEUsqkdyZvUbiqMXccroIdnfyzORvPfxNam8AKJQFPuftiTWDAWi7umArFvE/gf9wzNAdq3w==
X-Received: by 2002:a17:902:ff0f:b0:132:3793:3b0e with SMTP id
 f15-20020a170902ff0f00b0013237933b0emr13824766plj.57.1629786708244; 
 Mon, 23 Aug 2021 23:31:48 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with UTF8SMTPSA id z12sm7328887pfe.79.2021.08.23.23.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 23:31:47 -0700 (PDT)
Message-ID: <ec7a7443-9896-decd-9757-0cbe9740b237@ozlabs.ru>
Date: Tue, 24 Aug 2021 16:31:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [PATCH v5 08/11] powerpc/pseries/iommu: Update
 remove_dma_window() to accept property name
Content-Language: en-US
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, David Gibson
 <david@gibson.dropbear.id.au>, kernel test robot <lkp@intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-9-leobras.c@gmail.com>
 <8dbd08fb-375c-9f21-f8ab-bec163b157bf@linux.ibm.com>
 <2653ee3e582ba181651e4842821e64d3323fa566.camel@gmail.com>
 <f9f7bcd75d534ebde7cc83c4138176da4680e30f.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <f9f7bcd75d534ebde7cc83c4138176da4680e30f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/08/2021 16:12, Leonardo Brás wrote:
> On Tue, 2021-08-17 at 02:59 -0300, Leonardo Brás wrote:
>> Hello Fred, thanks for the feedback!
>>
>> On Tue, 2021-07-20 at 19:51 +0200, Frederic Barrat wrote:
>>>
>>>
>>> On 16/07/2021 10:27, Leonardo Bras wrote:
>>>> Update remove_dma_window() so it can be used to remove DDW with a
>>>> given
>>>> property name.
>>>>
>>>> This enables the creation of new property names for DDW, so we
>>>> can
>>>> have different usage for it, like indirect mapping.
>>>>
>>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>    arch/powerpc/platforms/pseries/iommu.c | 21 +++++++++++--------
>>>> --
>>>>    1 file changed, 11 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c
>>>> b/arch/powerpc/platforms/pseries/iommu.c
>>>> index 108c3dcca686..17c6f4706e76 100644
>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>> @@ -830,31 +830,32 @@ static void remove_dma_window(struct
>>>> device_node *np, u32 *ddw_avail,
>>>>                          np, ret,
>>>> ddw_avail[DDW_REMOVE_PE_DMA_WIN],
>>>> liobn);
>>>>    }
>>>>    
>>>> -static void remove_ddw(struct device_node *np, bool remove_prop)
>>>> +static int remove_ddw(struct device_node *np, bool remove_prop,
>>>> const char *win_name)
>>>>    {
>>>
>>>
>>> Why switch to returning an int? None of the callers check it.
>>
>> IIRC, in a previous version it did make sense, which is not the case
>> anymore. I will revert this.
>>
>> Thanks!
> 
> Oh, sorry about that, it is in fact still needed:


Then you should have added it in 10/11.

> 
> It will make sense in patch v5 10/11:
> On iommu_reconfig_notifier(), if (action == OF_RECONFIG_DETACH_NODE),
> we need to remove a DDW if it exists.
> 
> As there may be different window names, it tests for DIRECT64_PROPNAME,
> and if it's not found, it tests for DMA64_PROPNAME.
> 
> This approach will skip scanning for DMA64_PROPNAME if
> DIRECT64_PROPNAME was found, as both may not exist in the same node.
> But for this approach to work we need remove_ddw() to return error if
> the property is not found.
> 
> Does it make sense? or should I just test for both?

Or you could just try removing both without checking the return code, it 
is one extra of_find_property in very rare code path. Not worth 
reposting though imho. (sorry I was off last week, catching up). Thanks,



-- 
Alexey
