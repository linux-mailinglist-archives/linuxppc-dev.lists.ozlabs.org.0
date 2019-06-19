Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 483DF4B8AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:35:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TPYH6Kz7zDqp5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 22:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TPV55FPszDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:32:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45TPV12z93z9sNC;
 Wed, 19 Jun 2019 22:32:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH] powerpc: enable a 30-bit ZONE_DMA for 32-bit pmac
In-Reply-To: <20190619105039.GA10118@lst.de>
References: <20190613082446.18685-1-hch@lst.de> <20190619105039.GA10118@lst.de>
Date: Wed, 19 Jun 2019 22:32:24 +1000
Message-ID: <87tvcldacn.fsf@concordia.ellerman.id.au>
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
Cc: aaro.koskinen@iki.fi, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> Any chance this could get picked up to fix the regression?

Was hoping Ben would Ack it. He's still powermac maintainer :)

I guess he OK'ed it in the other thread, will add it to my queue.

cheers

> On Thu, Jun 13, 2019 at 10:24:46AM +0200, Christoph Hellwig wrote:
>> With the strict dma mask checking introduced with the switch to
>> the generic DMA direct code common wifi chips on 32-bit powerbooks
>> stopped working.  Add a 30-bit ZONE_DMA to the 32-bit pmac builds
>> to allow them to reliably allocate dma coherent memory.
>> 
>> Fixes: 65a21b71f948 ("powerpc/dma: remove dma_nommu_dma_supported")
>> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  arch/powerpc/include/asm/page.h         | 7 +++++++
>>  arch/powerpc/mm/mem.c                   | 3 ++-
>>  arch/powerpc/platforms/powermac/Kconfig | 1 +
>>  3 files changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
>> index b8286a2013b4..0d52f57fca04 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -319,6 +319,13 @@ struct vm_area_struct;
>>  #endif /* __ASSEMBLY__ */
>>  #include <asm/slice.h>
>>  
>> +/*
>> + * Allow 30-bit DMA for very limited Broadcom wifi chips on many powerbooks.
>> + */
>> +#ifdef CONFIG_PPC32
>> +#define ARCH_ZONE_DMA_BITS 30
>> +#else
>>  #define ARCH_ZONE_DMA_BITS 31
>> +#endif
>>  
>>  #endif /* _ASM_POWERPC_PAGE_H */
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index cba29131bccc..2540d3b2588c 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -248,7 +248,8 @@ void __init paging_init(void)
>>  	       (long int)((top_of_ram - total_ram) >> 20));
>>  
>>  #ifdef CONFIG_ZONE_DMA
>> -	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn, 0x7fffffffUL >> PAGE_SHIFT);
>> +	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
>> +			((1UL << ARCH_ZONE_DMA_BITS) - 1) >> PAGE_SHIFT);
>>  #endif
>>  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>>  #ifdef CONFIG_HIGHMEM
>> diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
>> index f834a19ed772..c02d8c503b29 100644
>> --- a/arch/powerpc/platforms/powermac/Kconfig
>> +++ b/arch/powerpc/platforms/powermac/Kconfig
>> @@ -7,6 +7,7 @@ config PPC_PMAC
>>  	select PPC_INDIRECT_PCI if PPC32
>>  	select PPC_MPC106 if PPC32
>>  	select PPC_NATIVE
>> +	select ZONE_DMA if PPC32
>>  	default y
>>  
>>  config PPC_PMAC64
>> -- 
>> 2.20.1
> ---end quoted text---
