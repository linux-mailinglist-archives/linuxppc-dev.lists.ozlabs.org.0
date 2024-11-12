Return-Path: <linuxppc-dev+bounces-3119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30819C58CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 14:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xnn86440lz2yR3;
	Wed, 13 Nov 2024 00:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731417590;
	cv=none; b=j8jZOd1apmPreQZ6uV41i2qK97/Pstz2jgSunY0jqlFEiTZth6L+fCwrEcDjmfMQRmL0ETr2I+tj6U9+2EaAV3ozsrAXVIa0paxAaPMT/KfPEL/rRinjYl0g19/ypqFfh545A9yeXt+YUbmHydAvpsBCNvf1Wqehq/HNSEMN5tG5oGfOu3614nT4dEYCigPx0xkaZLdvR0sADAuYqc3tXWxX3AU3eQNWlUyE8weLTPI3ddUSf0hA4a9SwCyKjMe72GOB5UK1fQ8zskx0/DQUdSmlps5ZeubVNyUKIB3zdGAeGF/8clALhLWIDTm1P9Wh+rjfaDsWqoJ10jwYhKzoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731417590; c=relaxed/relaxed;
	bh=uBPHcDmkuyQ/Rolm4Ec+lf1hQ63yXy4srbvVAOfOfRY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=GQePd0twq5AnMQE8ADAUtip71X5nQCRRWbd1UfG31USQHw6ZPu4PoF/ymsJBOyRljxozRGnH9xXOtXS+lL7iNP70klQ9mcm6Mb8dLNUxgcCFbJorf9lL8kNC+bZQUFNVzIAAjfdAxZRrhak5Do5p3ovHk3/hVUc190Iy/0lRC9tdVJ/kHPy+014GyquK0jNrcoYAj/+lMrrOELUo92o1QL/ITLTXLIX0/yZo4i/iX4atjmWbe1gMSKNcppTkl2/r6hH3raJ3Ulwr49MMxJqZtuuhy2rvVC5/oRhZwUSK5voG+35T4TyS3/3x+eLrFoDr0BqdXyXSBZK46JzpmnaXPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No5wNCrt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No5wNCrt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnn845D18z2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 00:19:47 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3e6005781c0so3275746b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 05:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731417585; x=1732022385; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uBPHcDmkuyQ/Rolm4Ec+lf1hQ63yXy4srbvVAOfOfRY=;
        b=No5wNCrtpk4hp1emGe5MqCQ6HAV1MW+i8m8M53jbZOnSgN1hAo/goXdpJr2T+6FD/x
         ZRpU4oejuABVpgROY0TsBCFtxqk/M7lT/bV1mWw/tznLCj+ejBnB9fV8YxL9pMtqvvbo
         WEtlV6mMZCnUIwoRkLRUFsarw1phqmJzYKG4v9K2r9X53BH4eD6HJeyp7S+UZe3Ah5iY
         iPLpJdjw0IoZ11rwy5iDo1wsmh8+Jf6k7M8CFw8l0gR66KkH6nrVzro8AUNVpW24DY4y
         6F4VVL3jVavu0zQJzpVlVQZpCSfS/D8M4VHJ4jotbJ3fSHFVpdjy4aJOPRmzwepj78jD
         65Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731417585; x=1732022385;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBPHcDmkuyQ/Rolm4Ec+lf1hQ63yXy4srbvVAOfOfRY=;
        b=YXY7DU/c+ImhS55s9zoPjojjOhkV3RS3JpKUzhjEO0DhpaMlHl0hlimoikUKqKhEL6
         /lPVup0SOs1yaL2PreuiBVZNtzg07H7ezQaNLVbUkO+eVk/Mv8xbZtej67UHKKKBHDfh
         XtORS775aHB1XWnhFUJDuuyxwO+1uFF9HdqEyFbtZKR/P/g8W9R54jT0NERTGgBkouOz
         Z8NIjAmxzSNhviSlPNlPXvPjajbpDU3WPnoG7UH1+Kb+ekkIpPoY0FjWrbqhAOOn7ETd
         MbvY8Jg/BB/mHg6XCZuSc47S3kmUWXQpNslH1+HNjNTBnKgWBzjz7n14ReO07H0a8wkv
         /Oyw==
X-Forwarded-Encrypted: i=1; AJvYcCWstP04EOe9CKDG/K4lAj6PzYFuVSmJTfNN66nyM4TYisQ9x1aqSi0/A5qZyCUFh4/bIv1CdPIqXdJz9fI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuZyM9LV+pUQ3LncgY+rzaHOafssiolykzmrxT2lNGljTPPuwd
	n9p3GT0/c/NfUdEfjbG9guplIhMLZYTc7xeBVabgSh9lI796UT7n
X-Google-Smtp-Source: AGHT+IHzPEKrQe77f0MKUeE96s4CHS2esesW2xOMKRRspCsDbio4uIXqDy77McxWBCKjWKpuCdfyJg==
X-Received: by 2002:a05:6808:1494:b0:3e6:580b:d7d7 with SMTP id 5614622812f47-3e7aae07987mr2475129b6e.36.1731417584750;
        Tue, 12 Nov 2024 05:19:44 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f48abbdsm10510511a12.10.2024.11.12.05.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:19:44 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
In-Reply-To: <34d3e468-b867-4567-9d39-47b27409a2a8@linux.ibm.com>
Date: Tue, 12 Nov 2024 18:40:54 +0530
Message-ID: <87r07gmwbl.fsf@gmail.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com> <20241107055817.489795-2-sourabhjain@linux.ibm.com> <87zfm5m0p5.fsf@gmail.com> <b2047c3b-ec84-456f-8f95-734bcb9a0cd1@linux.ibm.com> <87ttccn0oz.fsf@gmail.com> <87serwmzvv.fsf@gmail.com> <34d3e468-b867-4567-9d39-47b27409a2a8@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Hello Ritesh,
>
>
> On 12/11/24 17:23, Ritesh Harjani (IBM) wrote:
>> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>>
>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>
>>>> Hello Ritesh,
>>>>
>>>>
>>>> On 12/11/24 11:51, Ritesh Harjani (IBM) wrote:
>>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>>
>>>>>> The param area is a memory region where the kernel places additional
>>>>>> command-line arguments for fadump kernel. Currently, the param memory
>>>>>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>>>>>> it should be reserved if it is below boot_mem_top because the fadump
>>>>>> kernel already reserves memory from boot_mem_top to the end of DRAM.
>>>>> did you mean s/reserves/preserves ?
>>>> Yeah, preserves is better.
>>>>
>>>>>> Currently, there is no impact from not reserving param memory if it is
>>>>>> below boot_mem_top, as it is not used after the early boot phase of the
>>>>>> fadump kernel. However, if this changes in the future, it could lead to
>>>>>> issues in the fadump kernel.
>>>>> This will only affect Hash and not radix correct? Because for radix your
>>>>> param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
>>>>> which is anyway above boot_mem_top so it is anyway preserved as is...
>>>> Yes.
>>>>
>>>>> ... On second thoughts since param_area during normal kernel boot anyway
>>>>> comes from memblock now. And irrespective of where it falls (above or below
>>>>> boot_mem_top), we anyway append the bootargs to that. So we don't really
>>>>> preserve the original contents :) right?
>>>> Sorry I didn't get it. We append strings from param_area to
>>>> boot_command_line
>>>> not the other way.
>>>>
>>>>
>>> Right. My bad.
>>>
>>>>> So why not just always call for
>>>>> memblock_reserve() on param_area during capture kernel run?
>>>>>
>>>>> Thoughts?
>>>> Yes, there is no harm in calling memblock_reserve regardless of whether
>>>> param_area
>>>> is below or above boot_mem_top. However, calling it when param_area is
>>>> higher than
>>>> boot_mem_top is redundant, as we know fadump preserves memory from
>>>> boot_mem_top
>>>> to the end of DRAM during early boot.
>>> So if we don't reserve the param_area then the kernel may use it for
>>> some other purposes once memory is released to buddy, right. But I guess,
>>> given we anyway copied the param_area in fadump_append_bootargs() during
>>> early boot to cmdline (before parse_early_param()), we anyway don't need
>>> it for later, right?
>>>
>>> In that case we don't need for Hash too (i.e when param_area falls under
>>> boot_mem_top), right? Since we anyway copied the param_area before
>>> parse_early_param() in fadump_append_bootargs. So what is the point in
>>> calling memblock_reserve() on that? Maybe I am missing something, can
>>> you please help explain.
>>>
>> Ok. I think I got it now. You did mention in the changelog -
>>
>> "Currently, there is no impact from not reserving param memory if it is
>> below boot_mem_top, as it is not used after the early boot phase of the
>> fadump kernel. However, if this changes in the future, it could lead to
>> issues in the fadump kernel."
>>
>>
>> So it is not an issue now, since the param area is not used after the
>> contents is copied over. So I think today we anyway don't need to call
>> memblock_reserve() on the param area - but if we are making it future
>> proof then we might as well just call memblock_reserve() on param_area
>> irrespective because otherwise once the kernel starts up it might re-use
>> that area for other purposes. So isn't it better to reserve for fadump
>> use of the param_area for either during early boot or during late kernel
>> boot phase of the capture kernel?
>
> Seems like there is some confusion. Here is the full picture with the 
> current patch:
>
> First kernel boot: Reserve param_area during early boot and let it 
> remain reserved.
>
> First kernel crashed
>
> Fadump/second kernel boot
>
> fadump_reserve_mem() does memblock_reserve() from boot_mem_top to 
> end_of_dram().
> This covers param_area if it is above boot_mem_top.
>
> fadump_setup_param_area() does memblock_reserve() for param_area only if 
> it falls below
> boot_mem_top. This ensures it is covered if param_area falls below 
> boot_mem_top.
>
> This way, we make sure that param_area is preserved during the fadump 
> kernel's early boot in both cases.
>
> Note: fadump_reserve_mem() is executed before fadump_setup_param_area().
>

Ohk. I think I missd to look into the dump_active portion of the code
which is where the fadump calls fadump_reserve_mem() -> fadump_reserve_crash_area().
I will be pay more attention to these details the next time :) 

> IIUC, you are suggesting doing memblock_reserve() for param_area in 
> fadump_setup_param_area() regardless
> of its location. If we do this, memblock_reserve() will be called twice 
> for the case where it falls above
> boot_mem_top. I agree there is no harm in doing so, but do we have to?
>
> Again, I don't have a strong opinion on this but just wanted to put 
> things forward to make sure we are on the
> same page. Let me know your opinion.

No. The current patch is doing the right thing. Thanks for taking time
and answering my queries. I agree with the approach and logic taken in
this patch including that of the "Fixes" tag. 

The patch looks good to me. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

