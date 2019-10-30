Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AECE9D70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 15:27:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4739kj251lzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 01:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="qwVsaT6C"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4739cK1BqRzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 01:21:20 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id x6so1066647pln.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lLBDwfjg5YnQXNE+xQ4JmNR71OHaPXxKWZ+MT4DW3/A=;
 b=qwVsaT6Cw4Ycn/P/j7rzKjSzfApSkeaGvKWAkHM/AoJ0x7w8gndNK3s7Etg8RRAxdM
 dJrZ61KmDDSt6pgTwvga1te1T0yseF+wo8rR0CZAnXvXPZmyS0ogKROK46Oehne5rc//
 DMWh8+9qmkJfrb4qW2K18Bcyf+/n6OHl40DOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=lLBDwfjg5YnQXNE+xQ4JmNR71OHaPXxKWZ+MT4DW3/A=;
 b=fTwKCC7B6PYq4U6TWbYaYRHqXa8o06ZdvNrqKluveGuLTCnT6qiStgT5vT/3dSL2Tc
 Er0LvNHU9N0HzuBo7U6rquzlwcJJHSzY5/CY48VYSiHh6B/iX++QFYYfG+DkVNVDZIL1
 Qj/VevXeSUP8y83aIw0N7gxxBaRf0gj16wrbvmZC/JeDdGvqxVLFobdc9d+sD+AEPYMi
 LzjNw80ueNgGgPjOKO8HqvZWfyW0kmUQ0C4VSB7bY4u90mk0nhmzRgQWZ9z2kuREypA1
 WmkRvuxF/VmMXh4nry5ZnnjcF1nFSh95uoEG9rg6KW+hdrt5fZRq6sq1kfq+X+hSdC4Q
 7Yqg==
X-Gm-Message-State: APjAAAWAxb74NeKXwHst+1AEoLdmbcW7JGlvKT08Uesp9HP1UMc5XRAB
 9xWYQOlJiNPUzdwWvdSKlrlW9g==
X-Google-Smtp-Source: APXvYqwMC7s8c7Hz5nvb/Nz/tGRMlobeX2sZ75mjj1c4WbVrvDU+HedG/Uqdzo2fEk41IYyK90rWig==
X-Received: by 2002:a17:902:44d:: with SMTP id 71mr241216ple.274.1572445277919; 
 Wed, 30 Oct 2019 07:21:17 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-783a-2bb9-f7cb-7c3c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id q6sm75232pgn.44.2019.10.30.07.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 07:21:17 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: Re: [PATCH v10 4/5] x86/kasan: support KASAN_VMALLOC
In-Reply-To: <ff1c2089-9404-21f6-dac6-661917e47181@virtuozzo.com>
References: <20191029042059.28541-1-dja@axtens.net>
 <20191029042059.28541-5-dja@axtens.net>
 <a144eaca-d7e1-1a18-5975-bd0bfdb9450e@virtuozzo.com>
 <87sgnamjg2.fsf@dja-thinkpad.axtens.net>
 <ff1c2089-9404-21f6-dac6-661917e47181@virtuozzo.com>
Date: Thu, 31 Oct 2019 01:21:13 +1100
Message-ID: <87mudimi06.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrey Ryabinin <aryabinin@virtuozzo.com> writes:

> On 10/30/19 4:50 PM, Daniel Axtens wrote:
>> Andrey Ryabinin <aryabinin@virtuozzo.com> writes:
>> 
>>> On 10/29/19 7:20 AM, Daniel Axtens wrote:
>>>> In the case where KASAN directly allocates memory to back vmalloc
>>>> space, don't map the early shadow page over it.
>>>>
>>>> We prepopulate pgds/p4ds for the range that would otherwise be empty.
>>>> This is required to get it synced to hardware on boot, allowing the
>>>> lower levels of the page tables to be filled dynamically.
>>>>
>>>> Acked-by: Dmitry Vyukov <dvyukov@google.com>
>>>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>>>
>>>> ---
>>>
>>>> +static void __init kasan_shallow_populate_pgds(void *start, void *end)
>>>> +{
>>>> +	unsigned long addr, next;
>>>> +	pgd_t *pgd;
>>>> +	void *p;
>>>> +	int nid = early_pfn_to_nid((unsigned long)start);
>>>
>>> This doesn't make sense. start is not even a pfn. With linear mapping 
>>> we try to identify nid to have the shadow on the same node as memory. But 
>>> in this case we don't have memory or the corresponding shadow (yet),
>>> we only install pgd/p4d.
>>> I guess we could just use NUMA_NO_NODE.
>> 
>> Ah wow, that's quite the clanger on my part.
>> 
>> There are a couple of other invocations of early_pfn_to_nid in that file
>> that use an address directly, but at least they reference actual memory.
>> I'll send a separate patch to fix those up.
>
> I see only one incorrect, in kasan_init(): early_pfn_to_nid(__pa(_stext))
> It should be wrapped with PFN_DOWN().
> Other usages in map_range() seems to be correct, range->start,end is pfns.
>

Oh, right, I didn't realise map_range was already using pfns.

>
>> 
>>> The rest looks ok, so with that fixed:
>>>
>>> Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> 
>> Thanks heaps! I've fixed up the nit you identifed in the first patch,
>> and I agree that the last patch probably isn't needed. I'll respin the
>> series shortly.
>> 
>
> Hold on a sec, just spotted another thing to fix.
>
>> @@ -352,9 +397,24 @@ void __init kasan_init(void)
>>  	shadow_cpu_entry_end = (void *)round_up(
>>  			(unsigned long)shadow_cpu_entry_end, PAGE_SIZE);
>>  
>> +	/*
>> +	 * If we're in full vmalloc mode, don't back vmalloc space with early
>> +	 * shadow pages. Instead, prepopulate pgds/p4ds so they are synced to
>> +	 * the global table and we can populate the lower levels on demand.
>> +	 */
>> +#ifdef CONFIG_KASAN_VMALLOC
>> +	kasan_shallow_populate_pgds(
>> +		kasan_mem_to_shadow((void *)PAGE_OFFSET + MAXMEM),
>
> This should be VMALLOC_START, there is no point to allocate pgds for the hole between linear mapping
> and vmalloc, just waste of memory. It make sense to map early shadow for that hole, because if code
> dereferences address in that hole we will see the page fault on that address instead of fault on the shadow.
>
> So something like this might work:
>
> 	kasan_populate_early_shadow(
> 		kasan_mem_to_shadow((void *)PAGE_OFFSET + MAXMEM),
> 		kasan_mem_to_shadow((void *)VMALLOC_START));
>
> 	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)
> 		kasan_shallow_populate_pgds(kasan_mem_to_shadow(VMALLOC_START), kasan_mem_to_shadow((void *)VMALLOC_END))
> 	else
> 		kasan_populate_early_shadow(kasan_mem_to_shadow(VMALLOC_START), kasan_mem_to_shadow((void *)VMALLOC_END));
>
> 	kasan_populate_early_shadow(
> 		kasan_mem_to_shadow((void *)VMALLOC_END + 1),
> 		shadow_cpu_entry_begin);

Sounds good. It's getting late for me so I'll change and test that and
send a respin tomorrow my time.

Regards,
Daniel
