Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3D4FA8BC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 15:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbGfj3KPQz3bd3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 23:48:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H7vIF/G2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H7vIF/G2; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbGf038kbz2xgY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 23:47:50 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id i20so3633083wrb.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 Apr 2022 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TZnfb759HcwuaB/QZMKlQAK+6O+n7loBzLhhlmus6gs=;
 b=H7vIF/G27Hb6PDC+XWb3XPpcoZBNY/irr7saMr4Zzlv5//du4N1f4HWZLbOWfv0jTq
 a44ju6+giDo4O5i/KS05RizAKoUgDneAPyv8/KlFcuq0gPCRcv6QMskaQ0yUJwO152Re
 r5ASmG1hCZL7cBbxK9UUun0AT5QM00LfacVecnJuVvmhSCih965lzBUrCmkLfeJ9EGww
 gNg/BuWh8NtHwm3CRjDnm7BqrnnpPFu+Wb8YRHXZ8aMKJ5KwAzOdgto9jq2Q+LOHF+qG
 mz1DWFdO+dNLVcpPuPSPKw+VwXCRwGjaVUyQ1R7ew8XYdaVcbOMzfdWN23xISVjd2lWw
 bEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TZnfb759HcwuaB/QZMKlQAK+6O+n7loBzLhhlmus6gs=;
 b=Klw+TzNzDi6W4JFKhO7DHf8tVYj9Ei6i5WabrC0uVfYfpEbrptU1gYa8w622rtFQ/B
 kbs6eyqqtAPkElzynllgW3s1BZBte1FXlzlWRJJkRA6Y0bUBnc5w3m0F/xWUliV5s6ad
 7sPMYQwv65E7XrP70eHkqvZx9sU08pMq2pH1vAyiUl2VqLY8nX2QNz13pKlbANzer7HA
 SgXmqpRBn9cs0e70pollXg/xIJR0bp/njwg/NCPaNODJk6IuWP8JgpABFWbOjpFzPoHh
 M+GDtkDplRuY3Rc4z8iwD3BdtYfr57d27xy2tGDnjs398DPLLIhu+lO2i8yeS/ASSq3A
 V26w==
X-Gm-Message-State: AOAM53250c/D4BVQ//uWs2J4LSS3U6t049Tc/L8vTPx9QPTjFFiYNC2+
 BKLpW1BzZ2W9gdPOIYAQJyA=
X-Google-Smtp-Source: ABdhPJwrL3Dl96oeoWT5B/P+SB57tnPGQx93a7n+LxBl5FdnJIbzMvl2fFRXw3C/s6T5nE4qrEVLHg==
X-Received: by 2002:adf:dec7:0:b0:207:a119:3fe3 with SMTP id
 i7-20020adfdec7000000b00207a1193fe3mr1410346wrn.591.1649512062339; 
 Sat, 09 Apr 2022 06:47:42 -0700 (PDT)
Received: from ?IPV6:2a00:a040:197:458f:54dd:de54:82a2:f69a?
 ([2a00:a040:197:458f:54dd:de54:82a2:f69a])
 by smtp.gmail.com with ESMTPSA id
 bk1-20020a0560001d8100b002061d6bdfd0sm14317959wrb.63.2022.04.09.06.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 06:47:42 -0700 (PDT)
Message-ID: <2603cae9-3b75-cd13-1d41-2f1bed6ca32e@gmail.com>
Date: Sat, 9 Apr 2022 16:47:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: False positive kmemleak report for dtb properties names on powerpc
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
References: <9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com>
 <YjtXXlnbEp64eL0T@arm.com> <Yjtvtkn+CishCef6@kernel.org>
From: Ariel Marcovitch <arielmarcovitch@gmail.com>
In-Reply-To: <Yjtvtkn+CishCef6@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, paulus@samba.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe, did you get the chance to look at this?

On 23/03/2022 21:06, Mike Rapoport wrote:
> Hi Catalin,
>
> On Wed, Mar 23, 2022 at 05:22:38PM +0000, Catalin Marinas wrote:
>> Hi Ariel,
>>
>> On Fri, Feb 18, 2022 at 09:45:51PM +0200, Ariel Marcovitch wrote:
>>> I was running a powerpc 32bit kernel (built using
>>> qemu_ppc_mpc8544ds_defconfig
>>> buildroot config, with enabling DEBUGFS+KMEMLEAK+HIGHMEM in the kernel
>>> config)
>>> on qemu and invoked the kmemleak scan (twice. for some reason the first time
>>> wasn't enough).
>> [...]
>>> I got 97 leak reports, all similar to the following:
>> [...]
>>> memblock_alloc lets kmemleak know about the allocated memory using
>>> kmemleak_alloc_phys (in mm/memblock.c:memblock_alloc_range_nid()).
>>>
>>> The problem is with the following code (mm/kmemleak.c):
>>>
>>> ```c
>>>
>>> void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
>>>                                 gfp_t gfp)
>>> {
>>>          if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
>>>                  kmemleak_alloc(__va(phys), size, min_count, gfp);
>>> }
>>>
>>> ```
>>>
>>> When CONFIG_HIGHMEM is enabled, the pfn of the allocated memory is checked
>>> against max_low_pfn, to make sure it is not in the HIGHMEM zone.
>>>
>>> However, when called through unflatten_device_tree(), max_low_pfn is not yet
>>> initialized in powerpc.
>>>
>>> max_low_pfn is initialized (when NUMA is disabled) in
>>> arch/powerpc/mm/mem.c:mem_topology_setup() which is called only after
>>> unflatten_device_tree() is called in the same function (setup_arch()).
>>>
>>> Because max_low_pfn is global it is 0 before initialization, so as far as
>>> kmemleak_alloc_phys() is concerned, every memory is HIGHMEM (: and the
>>> allocated memory is not tracked by kmemleak, causing references to objects
>>> allocated later with kmalloc() to be ignored and these objects are marked as
>>> leaked.
>> Thanks for digging into this. It looks like the logic doesn't work (not
>> sure whether it ever worked).
>>
>>> I actually tried to find out whether this happen on other arches as well,
>>> and it seems like arm64 also have this problem when dtb is used instead of
>>> acpi, although I haven't had the chance to confirm this.
>> arm64 doesn't enable CONFIG_HIGHMEM, so it's not affected.
>>
>>> I don't suppose I can just shuffle the calls in setup_arch() around, so I
>>> wanted to hear your opinions first
>> I think it's better if we change the logic than shuffling the calls.
>> IIUC MEMBLOCK_ALLOC_ACCESSIBLE means that __va() works on the phys
>> address return by memblock, so something like below (untested):
> MEMBLOCK_ALLOC_ACCESSIBLE means "anywhere", see commit e63075a3c937
> ("memblock: Introduce default allocation limit and use it to replace
> explicit ones"), so it won't help to detect high memory.
>
> If I remember correctly, ppc initializes memblock *very* early, so setting
> max_low_pfn along with lowmem_end_addr in
> arch/powerpc/mm/init_32::MMU_init() makes sense to me.
>
> Maybe ppc folks have other ideas...
> I've added Christophe who works on ppc32 these days.
>   
>> -------------8<----------------------
>> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
>> index 7580baa76af1..f3599e857c13 100644
>> --- a/mm/kmemleak.c
>> +++ b/mm/kmemleak.c
>> @@ -1127,8 +1127,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
>>   void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
>>   			       gfp_t gfp)
>>   {
>> -	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
>> -		kmemleak_alloc(__va(phys), size, min_count, gfp);
>> +	kmemleak_alloc(__va(phys), size, min_count, gfp);
>>   }
>>   EXPORT_SYMBOL(kmemleak_alloc_phys);
>>   
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index b12a364f2766..2515bd4331e8 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1397,7 +1397,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>>   	 * Skip kmemleak for those places like kasan_init() and
>>   	 * early_pgtable_alloc() due to high volume.
>>   	 */
>> -	if (end != MEMBLOCK_ALLOC_NOLEAKTRACE)
>> +	if (end == MEMBLOCK_ALLOC_ACCESSIBLE)
> This change would enable kmemleak for KASAN on arm and arm64 that AFAIR
> caused OOM in kmemleak and it also will limit tracking only to allocations
> that do not specify 'end' explicitly ;-)
>
>>   		/*
>>   		 * The min_count is set to 0 so that memblock allocated
>>   		 * blocks are never reported as leaks. This is because many
>> -------------8<----------------------
>>
>> But I'm not sure whether we'd now miss some genuine allocations where
>> the memblock limit is different from MEMBLOCK_ALLOC_ACCESSIBLE but still
>> within the lowmem limit. If the above works, we can probably get rid of
>> some other kmemleak callbacks in the kernel.
>>
>> Adding Mike for any input on memblock.
>>
>> -- 
>> Catalin
