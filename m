Return-Path: <linuxppc-dev+bounces-14015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D971AC48B53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 19:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4zJH35cFz2xqj;
	Tue, 11 Nov 2025 05:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762800639;
	cv=none; b=nGnRQFR78eZbl9Zq5gByw5I4xbfkNWyuVxH7F4EO5PhoW1u/l5uQgHDElHn5nzlXiY3y2aBZxnbp2oBONTnW5ef1qvbEzpUo2Xe6BLomt30YO0V3IppwrxiqXrgQ8Q5fbnrDboNnh/ihb9w4TdzUHcx85AVSsF+2p88mqkR331ob037R4epjGe0ZRwVM+XsLugNqt0pExZIcKZd4v+YLuJ5BxHmWAMEk7H87dt29Av9Poldd5N9sMtpUkvAvxxLk12YHK+LycYZlL3ewI3UxgOee/Sg7PK/LO+U7zzIN+TPsKjWBbWDmJNAU5x0egX8LEeTF+Ii3prALJKj5/cU1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762800639; c=relaxed/relaxed;
	bh=tW4Z7vBmJS3+20VMVp/EYtARePtDFl1FuBe3k4IDkag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KC9/gQF43kRF47xgoeEwa1GFlZym53Bo8yT6ZzNzk3wipv4TkOUK0Gvv6BE7lsjYNqY3ctPokGIzKI62wcYOcy9ZGLeJ9TYkvv+LgfASivcfhYODC40a3gBXf3KwriXlivm8qwH7cYojtdSAGgaA0JfpFJHCTH4LB+shANiYqFm5Ow5tGePP37YbWyb1Ovr0Q/oKqdmZy5+UvDXiA7aMWA4jecbmrlPiFuf5bAZ1fbN1+p75LNtimYElV3x+w5zvjim5QRN7iIaUUy+bVC2876qJz1uQaR966+QcfV161Qeo4oZFofhHRt4Bbhza2gMzGOtV8yhm/CC+FVDdEDCDDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4zJG0zQpz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 05:50:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d4ysg5m93z9sS7;
	Mon, 10 Nov 2025 19:31:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzBT5Q9h5BQM; Mon, 10 Nov 2025 19:31:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d4ysg4sDrz9sRy;
	Mon, 10 Nov 2025 19:31:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 93B108B764;
	Mon, 10 Nov 2025 19:31:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hflliSFPBIpY; Mon, 10 Nov 2025 19:31:03 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5512F8B763;
	Mon, 10 Nov 2025 19:31:02 +0100 (CET)
Message-ID: <1463bcd5-c47b-4c7f-bb13-2664e2e8226e@csgroup.eu>
Date: Mon, 10 Nov 2025 19:31:01 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
 <cdd23dd6-5444-4000-ac68-a72b22bf6a57@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cdd23dd6-5444-4000-ac68-a72b22bf6a57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/11/2025 à 12:27, David Hildenbrand (Red Hat) a écrit :
> Thanks for the review!
> 
>>
>> So I think what you want instead is:
>>
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype
>> b/arch/powerpc/platforms/Kconfig.cputype
>> index 7b527d18aa5ee..1f5a1e587740c 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -276,6 +276,7 @@ config PPC_E500
>>           select FSL_EMB_PERFMON
>>           bool
>>           select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>           select PPC_SMP_MUXED_IPI
>>           select PPC_DOORBELL
>>           select PPC_KUEP
>>
>>
>>
>>>        select ARCH_HAS_KCOV
>>>        select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>>        select ARCH_HAS_MEMBARRIER_CALLBACKS
>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/
>>> platforms/Kconfig.cputype
>>> index 7b527d18aa5ee..4c321a8ea8965 100644
>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>>>    config PPC_RADIX_MMU
>>>        bool "Radix MMU Support"
>>>        depends on PPC_BOOK3S_64
>>> -    select ARCH_HAS_GIGANTIC_PAGE
>>
>> Should remain I think.
>>
>>>        default y
>>>        help
>>>          Enable support for the Power ISA 3.0 Radix style MMU. Currently
> 
> 
> We also have PPC_8xx do a
> 
>      select ARCH_SUPPORTS_HUGETLBFS
> 
> And of course !PPC_RADIX_MMU (e.g., PPC_64S_HASH_MMU) through 
> PPC_BOOK3S_64.
> 
> Are we sure they cannot end up with gigantic folios through hugetlb?
> 

Yes indeed. My PPC_8xx is OK because I set CONFIG_ARCH_FORCE_MAX_ORDER=9 
(largest hugepage is 8M) but I do get the warning with the default value 
which is 8 (with 16k pages).

For PPC_64S_HASH_MMU, max page size is 16M, we get no warning with 
CONFIG_ARCH_FORCE_MAX_ORDER=8 which is the default value but get the 
warning with CONFIG_ARCH_FORCE_MAX_ORDER=7

Should CONFIG_ARCH_HAS_GIGANTIC_PAGE be set unconditionaly as soon as 
hugepages are selected, or should it depend on 
CONFIG_ARCH_FORCE_MAX_ORDER ? What is the cost of selecting 
CONFIG_ARCH_HAS_GIGANTIC_PAGE ?

Christophe

