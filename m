Return-Path: <linuxppc-dev+bounces-14003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B738C460E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mfQ1M8Gz2yv3;
	Mon, 10 Nov 2025 21:50:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762771838;
	cv=none; b=N3KndMHPyiGqFiARDdzXADnWKXH4Cl7u9XhTkV1mEzeYJnTn6tXcC0V+tTZ9n4wyoRMxcyKysO/E1I6D2z1IpiZeyCu+uVg3vK+aMH2r3RXymD13XNRmBaPRfIJr78yJmwDCtWAPgAxUnR8yd7eAExA1jTK6ZJ0Ezh4p5YPCxl3ozB2FmnXyhR7f/R378VtJ1bQ6HxCFu7+/2w54opIgZkChTjTwyEDS9Fh3hb/98yg+IxlI+bfow64ErftUOFMhMIpRCmvzutw/iCYy3cKIch99O2PlRQjGC5GgSo+Zw8CGbfT0hdiBEB1CUn7i+KMn2jnp9fzUWLvwIxvMghXbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762771838; c=relaxed/relaxed;
	bh=wOLT3CpIyrZm867yqwz9XFcQ4ubf1pY5/apCXmyDR+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nr4tICi08RCPcbEOzajF1kIcaDMgsEseoa4/IiOXXVW+CwiDFPLQYPqtdWrSjp1R1uVfjPRPDK+7zrYnFpyie8/bs7CHSstcHPedhvBABtS+ymh6KIy5d2wA31/voZ+8oOUw08BUdeMfJTg0xIs4o99FiUZyTJXVPuI6OR81lLLexjlmVUNu6qWpDLwkaDbbX+/dlLuUCdta3hCLOIrLuPhRzk74AZN+co42SK7a3Y/MQ7XtfvhttnNNDDdmita4wN/mVQ4qGzHAJ/tm07F4ChvciOTaBHy2Jq/yMr0nwBEmxZ01gPuQRXQhgF5DdtYIrX6sPpniF6een+xZF4V6Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mfP37t5z2y5T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:50:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d4mGD19h8z9sSS;
	Mon, 10 Nov 2025 11:33:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0-qf3NY7FEr; Mon, 10 Nov 2025 11:33:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d4mGC2cBDz9sSR;
	Mon, 10 Nov 2025 11:33:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AE858B764;
	Mon, 10 Nov 2025 11:33:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id IiWCXwxqszrF; Mon, 10 Nov 2025 11:33:07 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C8FC48B763;
	Mon, 10 Nov 2025 11:33:06 +0100 (CET)
Message-ID: <5cfbd9d4-de4a-4e3b-acc7-c640434de209@csgroup.eu>
Date: Mon, 10 Nov 2025 11:33:06 +0100
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
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Hildenbrand <dhildenb@redhat.com>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
 <87ecq952pe.ritesh.list@gmail.com>
 <944be49c-aea4-4160-a010-1d4ce7bcf542@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <944be49c-aea4-4160-a010-1d4ce7bcf542@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/11/2025 à 11:10, David Hildenbrand (Red Hat) a écrit :
> [fighting with mail transitioning, for some reason I did not receive
> the mails from Christophe, so replying here]
> 
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index e24f4d88885ae..55c3626c86273 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -137,6 +137,7 @@ config PPC
>>>>        select ARCH_HAS_DMA_OPS            if PPC64
>>>>        select ARCH_HAS_FORTIFY_SOURCE
>>>>        select ARCH_HAS_GCOV_PROFILE_ALL
>>>> +    select ARCH_HAS_GIGANTIC_PAGE        if PPC64
>>
>>
>> The patch looks good from PPC64 perspective, it also fixes the problem
>> reported on corenet64_smp_defconfig...
>>
>>>
>>> Problem is not only on PPC64, it is on PPC32 as well, for instance
>>> corenet32_smp_defconfig has the problem as well.
>>>
>>
>> However on looking deeper into it - I agree with Christophe that this
>> problem might still exist on PPC32.
> 
> Ah, I missed that. I thought it would be a ppc64 thing. :(
> 
>>
>> I did try the patch on corenet32_smp_defconfig and I can see the WARN_ON
>> still triggering. You can check the logs here..
>>
>> https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fgithub.com%2Friteshharjani%2Flinux- 
>> ci%2Factions%2Fruns%2F19169468405%2Fjob%2F54799498288&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cf2e19b221ba740b2034e08de204158de%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638983662203106300%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=UKQnlJWDKPfNCiYL8W7d2%2FTAhMhGbmxx8IDvy8jTbNQ%3D&reserved=0
>>
>>
>>>
>>> So I think what you want instead is:
>>>
>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype
>>> b/arch/powerpc/platforms/Kconfig.cputype
>>> index 7b527d18aa5ee..1f5a1e587740c 100644
>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>> @@ -276,6 +276,7 @@ config PPC_E500
>>>           select FSL_EMB_PERFMON
>>>           bool
>>>           select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>>           select PPC_SMP_MUXED_IPI
>>>           select PPC_DOORBELL
>>>           select PPC_KUEP
>>>
>>>
>>>
>>
>> @Christophe,
>>
>> I don't think even the above diff will fix the warning on PPC32.
>> The patch defines MAX_FOLIO_ORDER as P4D_ORDER...
>>
>> +#define MAX_FOLIO_ORDER        P4D_ORDER
>> +#define P4D_ORDER              (P4D_SHIFT - PAGE_SHIFT)
>>
>> and for ppc32 in..
>> include/asm-generic/pgtable-nop4d.h
>>      #define P4D_SHIFT        PGDIR_SHIFT
>>
>> Then in..
>> arch/powerpc/include/asm/nohash/32/pgtable.h
>>      #define PGDIR_SHIFT    (PAGE_SHIFT + PTE_INDEX_SIZE)
>>      #define PTE_INDEX_SIZE    PTE_SHIFT
>>
>> in...
>> arch/powerpc/include/asm/page_32.h
>>      #define PTE_SHIFT    (PAGE_SHIFT - PTE_T_LOG2)    /* full page */
>>
>>      #define PTE_T_LOG2    (__builtin_ffs(sizeof(pte_t)) - 1)
>>
>>
>> So if you see from above P4D_ORDER is coming down to PTE_INDEX_SIZE
>>
>> IIUC, that will cause MAX_FOLIO_ORDER to be 9 in case of e500mc 
>> machine type right?
>>
>> Can you please confirm if the above analysis looks correct to you?
> 
> Cristophe wrote
> 
> "
> Ah you are right, that's not enough. I was thinking that PGDIR_ORDER was
> the highest possible value ever but in fact not. PGDIR_SIZE is 4Mbytes
> so any page larger than that still triggers the warning. Here are the
> warnings I get on QEMU with corenet32_smp_defconfig
> "
> 
> And then we get
> 
> HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
> HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
> HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
> HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
> 
> 
> How could any of these larger sizes possibly ever get mapped into a page 
> table on 32bit? I'm probably missing something important :)
> 

Using contiguous entries in a table to describe larger pages.

See commit 7c44202e3609 ("powerpc/e500: use contiguous PMD instead of 
hugepd")

That's similar to what ARM64 does as far as I understand, see commit 
66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")

Christophe

