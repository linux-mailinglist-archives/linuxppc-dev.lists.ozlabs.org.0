Return-Path: <linuxppc-dev+bounces-13995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4E3C45D2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4llv22r8z2xqZ;
	Mon, 10 Nov 2025 21:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762769419;
	cv=none; b=C6hk/KXOdBgmFygMenG0vlIGIeHdt7grZPdp5vTs06PqI4TM4XnP28hDjWYulBJTn/u/Mp7xmYXp/shK5muxNzt6CsERgvj8sExbcDP8ISr/AZ8e7WVtmBOwoBRzdvmJG0r7BX8pSHzQvQBQITTXVUCkA8c8VQSKJsEOUk2fcF9hm48BskSMkbyrE3Hqb4n5SGw3w/vxHhoV1yApm6vwxSjr4ytggYfV2fEPyIupTZmaZavr9zwGCWqL23ZPesKjwjy4WXDbZAmyxh8Nx25IS+iuhFCinBsIqopwPSG4g5hJE/R2QN/Y9tLfNsRtRwjHEqQUI1zXNXhOx2Wygso6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762769419; c=relaxed/relaxed;
	bh=YVcgaD8+N95koJB2rPQamWDWG0IPq2Sth6UISeHKGec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEYauL5QbqrWmGYzpZ9zW5xDGM9LkJzR+vHAvVWpShzouCDJnrXhoPoTuKooa7XwV1HdiY7vvRlRQDXn4FqktIoPA4dRnYFb0Hyp73NOFuU4fB4V0hoybbGYv8/AKtN2EgOszi7j/iPv/BEBHjeLLKyw6EkPJ6U3xN1ljWesXNwGKzWqcFT9+bflE6+j4d5/74Dp6TXI/cV5he4o2tcjHuLRHO8cWCzmzX+OQetN5NebXvvmUDSp4xBYX57ggMsy/i31YIDK61dwuboH2BSQ3zzZJy8L9Ta1SkYYxqrdVMxn4URytjQn+G2Bq11ShlNSP3RJirwNtTrhNL0pHNwJrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ksrztFmB; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ksrztFmB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4llt14kPz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:10:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C896443A3B;
	Mon, 10 Nov 2025 10:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1A4C116D0;
	Mon, 10 Nov 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762769414;
	bh=YyV99R1iIefxYCXPH1pILjVHpoAR5fuQ7nVMgufduF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ksrztFmBAW+PRORYpLmsYppHDzOxwrx0fXgAbi68vY0YiWVjqv0G2dtwIBFBG3rQC
	 Ef5SaKZQSGaa1q/qVNdMoAfT/X32ID4KE4o7a70yY2cI+/SdgsLqeSmx0ZsJ9LHf/c
	 573P9UdGFIi3/Qgq2exvMjK1hhhgDli4d0ggsD36arN5koe8hnbeXc98gT2aB7P6L3
	 1dFGuO1a3pKjUqc8Vkr/kKdecZSMzGLFQtfwKq87upyAY3Ojg/ayZ2t+KbbUyglyPW
	 tRIpTfKqrC0cbfoQST9O+ead7h7XfkVkP8vGl+FV3leug3Q/uSgbOrWyYKhjchiyGH
	 ybIPbVKO5ut+A==
Message-ID: <944be49c-aea4-4160-a010-1d4ce7bcf542@kernel.org>
Date: Mon, 10 Nov 2025 11:10:10 +0100
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
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
 <87ecq952pe.ritesh.list@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <87ecq952pe.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[fighting with mail transitioning, for some reason I did not receive
the mails from Christophe, so replying here]

>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index e24f4d88885ae..55c3626c86273 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -137,6 +137,7 @@ config PPC
>>>        select ARCH_HAS_DMA_OPS            if PPC64
>>>        select ARCH_HAS_FORTIFY_SOURCE
>>>        select ARCH_HAS_GCOV_PROFILE_ALL
>>> +    select ARCH_HAS_GIGANTIC_PAGE        if PPC64
> 
> 
> The patch looks good from PPC64 perspective, it also fixes the problem
> reported on corenet64_smp_defconfig...
> 
>>
>> Problem is not only on PPC64, it is on PPC32 as well, for instance
>> corenet32_smp_defconfig has the problem as well.
>>
> 
> However on looking deeper into it - I agree with Christophe that this
> problem might still exist on PPC32.

Ah, I missed that. I thought it would be a ppc64 thing. :(

> 
> I did try the patch on corenet32_smp_defconfig and I can see the WARN_ON
> still triggering. You can check the logs here..
> 
> https://github.com/riteshharjani/linux-ci/actions/runs/19169468405/job/54799498288
> 
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
>>           select FSL_EMB_PERFMON
>>           bool
>>           select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>           select PPC_SMP_MUXED_IPI
>>           select PPC_DOORBELL
>>           select PPC_KUEP
>>
>>
>>
> 
> @Christophe,
> 
> I don't think even the above diff will fix the warning on PPC32.
> The patch defines MAX_FOLIO_ORDER as P4D_ORDER...
> 
> +#define MAX_FOLIO_ORDER        P4D_ORDER
> +#define P4D_ORDER              (P4D_SHIFT - PAGE_SHIFT)
> 
> and for ppc32 in..
> include/asm-generic/pgtable-nop4d.h
>      #define P4D_SHIFT		PGDIR_SHIFT
> 
> Then in..
> arch/powerpc/include/asm/nohash/32/pgtable.h
>      #define PGDIR_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
>      #define PTE_INDEX_SIZE	PTE_SHIFT
> 
> in...
> arch/powerpc/include/asm/page_32.h
>      #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2)	/* full page */
> 
>      #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
> 
> 
> So if you see from above P4D_ORDER is coming down to PTE_INDEX_SIZE
> 
> IIUC, that will cause MAX_FOLIO_ORDER to be 9 in case of e500mc machine type right?
> 
> Can you please confirm if the above analysis looks correct to you?

Cristophe wrote

"
Ah you are right, that's not enough. I was thinking that PGDIR_ORDER was
the highest possible value ever but in fact not. PGDIR_SIZE is 4Mbytes
so any page larger than that still triggers the warning. Here are the
warnings I get on QEMU with corenet32_smp_defconfig
"

And then we get

HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page


How could any of these larger sizes possibly ever get mapped into a page 
table on 32bit? I'm probably missing something important :)

-- 
Cheers

David

