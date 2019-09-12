Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D14B1265
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 17:46:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TjmS5XwzzF4gB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 01:46:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ncacx61M"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tjhw26YLzF4fn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 01:43:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Tjhm75TvzB09bB;
 Thu, 12 Sep 2019 17:43:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ncacx61M; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EHJt8SoSX6rY; Thu, 12 Sep 2019 17:43:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Tjhm5y7RzB09b0;
 Thu, 12 Sep 2019 17:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568302984; bh=jwkiVsyu4qTpGbjgj9zvg2L17cG+LcedXjD4KVOR3aw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ncacx61MTw9l0fH/aIN33QEKzpSS37GIo1Lm+DGhNEzBVZV+7lFzpZzU+VCDpQl/A
 WOqGmEfhk+9ei5DYC46N5dLAhENVhnQ3UIcz+0p1JwxO3/OPWizlfaNThFFGeAlizK
 0uFIyrZiBjrpSM2th7RKnmV5luDabUtVWeKDSZC8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 701D58B941;
 Thu, 12 Sep 2019 17:43:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Cg95q0QX3o1e; Thu, 12 Sep 2019 17:43:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 730808B933;
 Thu, 12 Sep 2019 17:43:05 +0200 (CEST)
Subject: Re: [PATCH v1 3/4] powerpc: Add support for GENERIC_EARLY_IOREMAP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com, hch@infradead.org
References: <cover.1568295907.git.christophe.leroy@c-s.fr>
 <412c7eaa6a373d8f82a3c3ee01e6a65a1a6589de.1568295907.git.christophe.leroy@c-s.fr>
 <87ftl1seyr.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <cab82255-7353-1435-08cb-6732d429b17d@c-s.fr>
Date: Thu, 12 Sep 2019 17:43:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87ftl1seyr.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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



Le 12/09/2019 à 17:37, Aneesh Kumar K.V a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> Add support for GENERIC_EARLY_IOREMAP.
>>
>> Let's define 16 slots of 256Kbytes each for early ioremap.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/Kconfig              |  1 +
>>   arch/powerpc/include/asm/Kbuild   |  1 +
>>   arch/powerpc/include/asm/fixmap.h | 12 ++++++++++++
>>   arch/powerpc/kernel/setup_32.c    |  3 +++
>>   arch/powerpc/kernel/setup_64.c    |  3 +++
>>   5 files changed, 20 insertions(+)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 6a7c797fa9d2..8fe252962518 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -161,6 +161,7 @@ config PPC
>>   	select GENERIC_CMOS_UPDATE
>>   	select GENERIC_CPU_AUTOPROBE
>>   	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
>> +	select GENERIC_EARLY_IOREMAP
>>   	select GENERIC_IRQ_SHOW
>>   	select GENERIC_IRQ_SHOW_LEVEL
>>   	select GENERIC_PCI_IOMAP		if PCI
>> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
>> index 9a1d2fc6ceb7..30829120659c 100644
>> --- a/arch/powerpc/include/asm/Kbuild
>> +++ b/arch/powerpc/include/asm/Kbuild
>> @@ -12,3 +12,4 @@ generic-y += preempt.h
>>   generic-y += vtime.h
>>   generic-y += msi.h
>>   generic-y += simd.h
>> +generic-y += early_ioremap.h
>> diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
>> index 722289a1d000..d5c4d357bd33 100644
>> --- a/arch/powerpc/include/asm/fixmap.h
>> +++ b/arch/powerpc/include/asm/fixmap.h
>> @@ -15,6 +15,7 @@
>>   #define _ASM_FIXMAP_H
>>   
>>   #ifndef __ASSEMBLY__
>> +#include <linux/sizes.h>
>>   #include <asm/page.h>
>>   #include <asm/pgtable.h>
>>   #ifdef CONFIG_HIGHMEM
>> @@ -64,6 +65,14 @@ enum fixed_addresses {
>>   		       FIX_IMMR_SIZE,
>>   #endif
>>   	/* FIX_PCIE_MCFG, */
>> +	__end_of_permanent_fixed_addresses,
>> +
>> +#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
>> +#define FIX_BTMAPS_SLOTS	16
>> +#define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
>> +
>> +	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
>> +	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
>>   	__end_of_fixed_addresses
>>   };
>>   
>> @@ -71,6 +80,7 @@ enum fixed_addresses {
>>   #define FIXADDR_START		(FIXADDR_TOP - __FIXADDR_SIZE)
>>   
>>   #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NCG
>> +#define FIXMAP_PAGE_IO	PAGE_KERNEL_NCG
>>   
>>   #include <asm-generic/fixmap.h>
>>   
>> @@ -85,5 +95,7 @@ static inline void __set_fixmap(enum fixed_addresses idx,
>>   	map_kernel_page(__fix_to_virt(idx), phys, flags);
>>   }
>>   
>> +#define __early_set_fixmap	__set_fixmap
>> +
>>   #endif /* !__ASSEMBLY__ */
>>   #endif
>> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
>> index a7541edf0cdb..dcffe927f5b9 100644
>> --- a/arch/powerpc/kernel/setup_32.c
>> +++ b/arch/powerpc/kernel/setup_32.c
>> @@ -44,6 +44,7 @@
>>   #include <asm/asm-prototypes.h>
>>   #include <asm/kdump.h>
>>   #include <asm/feature-fixups.h>
>> +#include <asm/early_ioremap.h>
>>   
>>   #include "setup.h"
>>   
>> @@ -80,6 +81,8 @@ notrace void __init machine_init(u64 dt_ptr)
>>   	/* Configure static keys first, now that we're relocated. */
>>   	setup_feature_keys();
>>   
>> +	early_ioremap_setup();
>> +
>>   	/* Enable early debugging if any specified (see udbg.h) */
>>   	udbg_early_init();
>>   
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>> index 44b4c432a273..b85f6a1cc3a1 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -65,6 +65,7 @@
>>   #include <asm/hw_irq.h>
>>   #include <asm/feature-fixups.h>
>>   #include <asm/kup.h>
>> +#include <asm/early_ioremap.h>
>>   
>>   #include "setup.h"
>>   
>> @@ -338,6 +339,8 @@ void __init early_setup(unsigned long dt_ptr)
>>   	apply_feature_fixups();
>>   	setup_feature_keys();
>>   
>> +	early_ioremap_setup();
>> +
>>   	/* Initialize the hash table or TLB handling */
>>   	early_init_mmu();
>>   
> 
> Can we remove early_ioremap_range() after this?
> 

Yes, once all early callers of ioremap functions are converted to using 
early_ioremap()

Christophe
