Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35E2CB31A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 04:05:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm3jq2KqLzDqVm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 14:05:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=x/xWjdSV; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm3fS6MX6zDqCg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 14:02:08 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id c79so23871pfc.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 19:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8AFHSRdY4+ohCijei8wJTWKibWBcSU1aLPlX/HlgYs0=;
 b=x/xWjdSVbZScak4rhXQERubEQrlzaZYoOZrYcdXGzYKy7bjnom2Fk5fZLW2aAMbmrZ
 4yCpgsaZd9nEI/5G7ickdJ+pKPK/O8ItB9TNZF/PEbYQaEnMGtUSOrPhZHp3nC4Aw3cN
 mjBMDN3owwy9epaMPNGuhvoNjfOlj7ZGncQfgL0l9RTt2fiAvz9nukU+oYWwigXJBiHb
 I226d68KoqR1j6cdYb6u7q/IV4szN9droYWTs4YEiaix2RxWihkBw5Rj6g9EY/B514A0
 pdo8jmnHnCQR6dFYTdnHerKisgDLPBnxrysPOyvVgNUmfBi+A0NqA+QviR4G+aTReXfL
 6EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8AFHSRdY4+ohCijei8wJTWKibWBcSU1aLPlX/HlgYs0=;
 b=k9d4I7ROarpWn6s51uxwYOa3j4bojNFD1zpXjlcwHFcF5BixJL2VGD89/KKUY5eezA
 0kTajQu+6Xh4PqL0KHatV1ko5JMHanHwcm5BS+Dk/wc53J8wC98OafJy4gCKP89YrSeH
 TmZAMVqmVwuKSjBvd8nARbj20BlsHFGV+Ntyh4hncYL7zneKqut0oHspwm4hQ+30L7ym
 VqyREARysFKjEcA+3E3cyJ+g6qx3J0o3DAFGcWABUClfvYlwytIUBzMJ+A5fxcA6Jxuk
 37y9MSMeS60RXtuwbcJcxF7bbuwUk93yumpS3V6iIHodktEN/Qs5IcbumGtKHAyOGf6G
 je6A==
X-Gm-Message-State: AOAM533wCYSb2WLJxfHuvy07OyIs1iWfkdl1PwietK7/ot40MFTh2eYW
 QHYyT3i9NbAlQYgX5m/qWMpX/Umm4gM/tg==
X-Google-Smtp-Source: ABdhPJyZNRjmkYscdwJ+hc/J98SijibBWCjgT+08zUQW/jQvFYuuVtOgwYWvpsCnNRwxRLoapt0VhQ==
X-Received: by 2002:aa7:9414:0:b029:18c:23f6:bc6d with SMTP id
 x20-20020aa794140000b029018c23f6bc6dmr492401pfo.21.1606878120208; 
 Tue, 01 Dec 2020 19:02:00 -0800 (PST)
Received: from [0.0.0.0] (124-171-134-245.dyn.iinet.net.au. [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id
 y22sm277028pfm.169.2020.12.01.19.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 19:01:59 -0800 (PST)
Subject: Re: [PATCH kernel] powerpc/perf: Stop crashing with generic_compat_pmu
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200602025612.62707-1-aik@ozlabs.ru>
 <c3852667-210c-48de-7f89-a06250b4df05@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <848255d6-5c8f-d4c2-a865-e3a7ffce7fdb@ozlabs.ru>
Date: Wed, 2 Dec 2020 14:01:55 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <c3852667-210c-48de-7f89-a06250b4df05@linux.ibm.com>
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

Hi Maddy,

I just noticed that I still have "powerpc/perf: Add checks for reserved 
values" in my pile (pushed here 
https://github.com/aik/linux/commit/61e1bc3f2e19d450e2e2d39174d422160b21957b 
), do we still need it? The lockups I saw were fixed by 
https://github.com/aik/linux/commit/17899eaf88d689 but it is hardly a 
replacement. Thanks,


On 04/06/2020 02:34, Madhavan Srinivasan wrote:
> 
> 
> On 6/2/20 8:26 AM, Alexey Kardashevskiy wrote:
>> The bhrb_filter_map ("The  Branch  History  Rolling  Buffer") callback is
>> only defined in raw CPUs' power_pmu structs. The "architected" CPUs use
>> generic_compat_pmu which does not have this callback and crashed occur.
>>
>> This add a NULL pointer check for bhrb_filter_map() which behaves as if
>> the callback returned an error.
>>
>> This does not add the same check for config_bhrb() as the only caller
>> checks for cpuhw->bhrb_users which remains zero if bhrb_filter_map==0.
> 
> Changes looks fine.
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> 
> The commit be80e758d0c2e ('powerpc/perf: Add generic compat mode pmu 
> driver')
> which introduced generic_compat_pmu was merged in v5.2.  So we need to
> CC stable starting from 5.2 :( .  My bad,  sorry.
> 
> Maddy
> 
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   arch/powerpc/perf/core-book3s.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/perf/core-book3s.c 
>> b/arch/powerpc/perf/core-book3s.c
>> index 3dcfecf858f3..36870569bf9c 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1515,9 +1515,16 @@ static int power_pmu_add(struct perf_event 
>> *event, int ef_flags)
>>       ret = 0;
>>    out:
>>       if (has_branch_stack(event)) {
>> -        power_pmu_bhrb_enable(event);
>> -        cpuhw->bhrb_filter = ppmu->bhrb_filter_map(
>> -                    event->attr.branch_sample_type);
>> +        u64 bhrb_filter = -1;
>> +
>> +        if (ppmu->bhrb_filter_map)
>> +            bhrb_filter = ppmu->bhrb_filter_map(
>> +                event->attr.branch_sample_type);
>> +
>> +        if (bhrb_filter != -1) {
>> +            cpuhw->bhrb_filter = bhrb_filter;
>> +            power_pmu_bhrb_enable(event); /* Does bhrb_users++ */
>> +        }
>>       }
>>
>>       perf_pmu_enable(event->pmu);
>> @@ -1839,7 +1846,6 @@ static int power_pmu_event_init(struct 
>> perf_event *event)
>>       int n;
>>       int err;
>>       struct cpu_hw_events *cpuhw;
>> -    u64 bhrb_filter;
>>
>>       if (!ppmu)
>>           return -ENOENT;
>> @@ -1945,7 +1951,10 @@ static int power_pmu_event_init(struct 
>> perf_event *event)
>>       err = power_check_constraints(cpuhw, events, cflags, n + 1);
>>
>>       if (has_branch_stack(event)) {
>> -        bhrb_filter = ppmu->bhrb_filter_map(
>> +        u64 bhrb_filter = -1;
>> +
>> +        if (ppmu->bhrb_filter_map)
>> +            bhrb_filter = ppmu->bhrb_filter_map(
>>                       event->attr.branch_sample_type);
>>
>>           if (bhrb_filter == -1) {
> 

-- 
Alexey
