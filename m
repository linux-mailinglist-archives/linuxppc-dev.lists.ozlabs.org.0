Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FF931C4C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 02:07:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfjVg42lXz3bPZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 12:07:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=mk0vEPDi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mk0vEPDi; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfjVD1Bkbz30H5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 12:06:41 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id nm1so4702009pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 17:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S89oRlzJ/1w2BkB55wzpc2SGFf/iKcM5h+mx0/4JkkY=;
 b=mk0vEPDid16yftygKO1yQfZvSj2bn6droWPRo2nHtdi89fsEA9GKU6qRuBdVzySYa3
 nPubersJp/V0N9CNpuzI0hXSkjx9vtXoVMWe50v2F4EMsh9xcRRFjpC6tAoVBzbBDp+3
 iSx8du5E5W95VeNn7iHDK38BVooqvsmKdj9RNhDWa6JLuMHEHG4+Aa/UMpjuxZVdwsSp
 G0mtWunwIs115tjoxJJWGoEopQqzRuC1RgxBHFs8whXXYi00VW/l2nuoS3yUX+SK0LwB
 XRgVlNoohii/pYeN9Q8aLRY2XsBzvMOJ0CWnDpk32gbRbFNDBjeOm22TCTIMwE90tmgJ
 MIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S89oRlzJ/1w2BkB55wzpc2SGFf/iKcM5h+mx0/4JkkY=;
 b=MNCYx6ayKl8J/UaxdtG2m6ImcbF6+sP5oQa3kCiKOEqYd5lgpIPnnXjVeOP7xxZmdK
 5eOug7Eo2RYsYs4EwgL6i4QreJXUfSUP1tDI04Oqes6OduLY84e955OQtL6bZtcdwQtp
 oJMjkjqdixGuwjG4NGJdS+0O2VGeUOol3m9HIzRbJ84B9QmIdp/pvezzjUdGF9kMlpZI
 EX9XJzDhE1+0Omzk2cR+9WTVOJ76MTXnSPR2GKnuQ8LCKcAWdLYZyfZvViyx/s601ynD
 VbLC9u/9oT6ll/jQC0KBeueWidb8qdeRMFLKUo+dRY4+E7aOQZ+4MfONSJx03rj16eYD
 frkw==
X-Gm-Message-State: AOAM532qQbOD3sHoVysW+RIHi3OU0t9uZt/AVdezyvobCQxDj2P3OEtw
 wYIoo1+SJBE3FxJW2IWlvKI3hg==
X-Google-Smtp-Source: ABdhPJwCgaduJIvb7ZJTX9g5TfjK/3FF9GwyA59BRNK5JiB+qqDbDvVmlcDQ+HHAlcWMP2W48sP/xA==
X-Received: by 2002:a17:90b:17c7:: with SMTP id
 me7mr1501876pjb.205.1613437596858; 
 Mon, 15 Feb 2021 17:06:36 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id y3sm18013107pfn.191.2021.02.15.17.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 17:06:36 -0800 (PST)
Subject: Re: [PATCH kernel] powerpc/perf: Stop crashing with generic_compat_pmu
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200602025612.62707-1-aik@ozlabs.ru>
 <c3852667-210c-48de-7f89-a06250b4df05@linux.ibm.com>
 <848255d6-5c8f-d4c2-a865-e3a7ffce7fdb@ozlabs.ru>
 <b7b928ed-f338-cc5d-9045-d783bc85cfec@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <740f72dd-4abf-cbe7-f6c7-3b312d04b005@ozlabs.ru>
Date: Tue, 16 Feb 2021 12:06:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <b7b928ed-f338-cc5d-9045-d783bc85cfec@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/12/2020 16:27, Madhavan Srinivasan wrote:
> 
> On 12/2/20 8:31 AM, Alexey Kardashevskiy wrote:
>> Hi Maddy,
>>
>> I just noticed that I still have "powerpc/perf: Add checks for 
>> reserved values" in my pile (pushed here 
>> https://github.com/aik/linux/commit/61e1bc3f2e19d450e2e2d39174d422160b21957b 
>> ), do we still need it? The lockups I saw were fixed by 
>> https://github.com/aik/linux/commit/17899eaf88d689 but it is hardly a 
>> replacement. Thanks,
> 
> sorry missed this. Will look at this again. Since we will need 
> generation specific checks for the reserve field.


So any luck with this? Cheers,




> 
> Maddy
> 
>>
>>
>> On 04/06/2020 02:34, Madhavan Srinivasan wrote:
>>>
>>>
>>> On 6/2/20 8:26 AM, Alexey Kardashevskiy wrote:
>>>> The bhrb_filter_map ("The  Branch History  Rolling  Buffer") 
>>>> callback is
>>>> only defined in raw CPUs' power_pmu structs. The "architected" CPUs use
>>>> generic_compat_pmu which does not have this callback and crashed occur.
>>>>
>>>> This add a NULL pointer check for bhrb_filter_map() which behaves as if
>>>> the callback returned an error.
>>>>
>>>> This does not add the same check for config_bhrb() as the only caller
>>>> checks for cpuhw->bhrb_users which remains zero if bhrb_filter_map==0.
>>>
>>> Changes looks fine.
>>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>
>>> The commit be80e758d0c2e ('powerpc/perf: Add generic compat mode pmu 
>>> driver')
>>> which introduced generic_compat_pmu was merged in v5.2.  So we need to
>>> CC stable starting from 5.2 :( .  My bad,  sorry.
>>>
>>> Maddy
>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>   arch/powerpc/perf/core-book3s.c | 19 ++++++++++++++-----
>>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/perf/core-book3s.c 
>>>> b/arch/powerpc/perf/core-book3s.c
>>>> index 3dcfecf858f3..36870569bf9c 100644
>>>> --- a/arch/powerpc/perf/core-book3s.c
>>>> +++ b/arch/powerpc/perf/core-book3s.c
>>>> @@ -1515,9 +1515,16 @@ static int power_pmu_add(struct perf_event 
>>>> *event, int ef_flags)
>>>>       ret = 0;
>>>>    out:
>>>>       if (has_branch_stack(event)) {
>>>> -        power_pmu_bhrb_enable(event);
>>>> -        cpuhw->bhrb_filter = ppmu->bhrb_filter_map(
>>>> -                    event->attr.branch_sample_type);
>>>> +        u64 bhrb_filter = -1;
>>>> +
>>>> +        if (ppmu->bhrb_filter_map)
>>>> +            bhrb_filter = ppmu->bhrb_filter_map(
>>>> +                event->attr.branch_sample_type);
>>>> +
>>>> +        if (bhrb_filter != -1) {
>>>> +            cpuhw->bhrb_filter = bhrb_filter;
>>>> +            power_pmu_bhrb_enable(event); /* Does bhrb_users++ */
>>>> +        }
>>>>       }
>>>>
>>>>       perf_pmu_enable(event->pmu);
>>>> @@ -1839,7 +1846,6 @@ static int power_pmu_event_init(struct 
>>>> perf_event *event)
>>>>       int n;
>>>>       int err;
>>>>       struct cpu_hw_events *cpuhw;
>>>> -    u64 bhrb_filter;
>>>>
>>>>       if (!ppmu)
>>>>           return -ENOENT;
>>>> @@ -1945,7 +1951,10 @@ static int power_pmu_event_init(struct 
>>>> perf_event *event)
>>>>       err = power_check_constraints(cpuhw, events, cflags, n + 1);
>>>>
>>>>       if (has_branch_stack(event)) {
>>>> -        bhrb_filter = ppmu->bhrb_filter_map(
>>>> +        u64 bhrb_filter = -1;
>>>> +
>>>> +        if (ppmu->bhrb_filter_map)
>>>> +            bhrb_filter = ppmu->bhrb_filter_map(
>>>>                       event->attr.branch_sample_type);
>>>>
>>>>           if (bhrb_filter == -1) {
>>>
>>

-- 
Alexey
