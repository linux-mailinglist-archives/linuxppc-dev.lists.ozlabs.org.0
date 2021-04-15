Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4FE36012C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 06:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLRTx07M7z3byP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FLRTY3TFsz300C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 14:39:58 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0098113E;
 Wed, 14 Apr 2021 21:39:55 -0700 (PDT)
Received: from [10.163.73.114] (unknown [10.163.73.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6073F73B;
 Wed, 14 Apr 2021 21:39:49 -0700 (PDT)
Subject: Re: [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
 <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
 <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
 <ec7bbb30-dbbd-197b-4d65-eb3600fe6413@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <e9d1a342-b444-efd5-d11f-79aa4d11fabc@arm.com>
Date: Thu, 15 Apr 2021 10:10:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec7bbb30-dbbd-197b-4d65-eb3600fe6413@csgroup.eu>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/14/21 11:40 AM, Christophe Leroy wrote:
> 
> 
> Le 14/04/2021 à 07:59, Anshuman Khandual a écrit :
>>
>>
>> On 4/14/21 10:52 AM, Christophe Leroy wrote:
>>>
>>>
>>> Le 14/04/2021 à 04:54, Anshuman Khandual a écrit :
>>>> Currently most platforms define FIRST_USER_ADDRESS as 0UL duplicating the
>>>> same code all over. Instead define a new option ARCH_HAS_FIRST_USER_ADDRESS
>>>> for those platforms which would override generic default FIRST_USER_ADDRESS
>>>> value 0UL. This makes it much cleaner with reduced code.
>>>>
>>>> Cc: linux-alpha@vger.kernel.org
>>>> Cc: linux-snps-arc@lists.infradead.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-csky@vger.kernel.org
>>>> Cc: linux-hexagon@vger.kernel.org
>>>> Cc: linux-ia64@vger.kernel.org
>>>> Cc: linux-m68k@lists.linux-m68k.org
>>>> Cc: linux-mips@vger.kernel.org
>>>> Cc: openrisc@lists.librecores.org
>>>> Cc: linux-parisc@vger.kernel.org
>>>> Cc: linuxppc-dev@lists.ozlabs.org
>>>> Cc: linux-riscv@lists.infradead.org
>>>> Cc: linux-s390@vger.kernel.org
>>>> Cc: linux-sh@vger.kernel.org
>>>> Cc: sparclinux@vger.kernel.org
>>>> Cc: linux-um@lists.infradead.org
>>>> Cc: linux-xtensa@linux-xtensa.org
>>>> Cc: x86@kernel.org
>>>> Cc: linux-mm@kvack.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> ---
>>>>    arch/alpha/include/asm/pgtable.h             | 1 -
>>>>    arch/arc/include/asm/pgtable.h               | 6 ------
>>>>    arch/arm/Kconfig                             | 1 +
>>>>    arch/arm64/include/asm/pgtable.h             | 2 --
>>>>    arch/csky/include/asm/pgtable.h              | 1 -
>>>>    arch/hexagon/include/asm/pgtable.h           | 3 ---
>>>>    arch/ia64/include/asm/pgtable.h              | 1 -
>>>>    arch/m68k/include/asm/pgtable_mm.h           | 1 -
>>>>    arch/microblaze/include/asm/pgtable.h        | 2 --
>>>>    arch/mips/include/asm/pgtable-32.h           | 1 -
>>>>    arch/mips/include/asm/pgtable-64.h           | 1 -
>>>>    arch/nds32/Kconfig                           | 1 +
>>>>    arch/nios2/include/asm/pgtable.h             | 2 --
>>>>    arch/openrisc/include/asm/pgtable.h          | 1 -
>>>>    arch/parisc/include/asm/pgtable.h            | 2 --
>>>>    arch/powerpc/include/asm/book3s/pgtable.h    | 1 -
>>>>    arch/powerpc/include/asm/nohash/32/pgtable.h | 1 -
>>>>    arch/powerpc/include/asm/nohash/64/pgtable.h | 2 --
>>>>    arch/riscv/include/asm/pgtable.h             | 2 --
>>>>    arch/s390/include/asm/pgtable.h              | 2 --
>>>>    arch/sh/include/asm/pgtable.h                | 2 --
>>>>    arch/sparc/include/asm/pgtable_32.h          | 1 -
>>>>    arch/sparc/include/asm/pgtable_64.h          | 3 ---
>>>>    arch/um/include/asm/pgtable-2level.h         | 1 -
>>>>    arch/um/include/asm/pgtable-3level.h         | 1 -
>>>>    arch/x86/include/asm/pgtable_types.h         | 2 --
>>>>    arch/xtensa/include/asm/pgtable.h            | 1 -
>>>>    include/linux/mm.h                           | 4 ++++
>>>>    mm/Kconfig                                   | 4 ++++
>>>>    29 files changed, 10 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>> index 8ba434287387..47098ccd715e 100644
>>>> --- a/include/linux/mm.h
>>>> +++ b/include/linux/mm.h
>>>> @@ -46,6 +46,10 @@ extern int sysctl_page_lock_unfairness;
>>>>      void init_mm_internals(void);
>>>>    +#ifndef ARCH_HAS_FIRST_USER_ADDRESS
>>>
>>> I guess you didn't test it ..... :)
>>
>> In fact I did :) Though just booted it on arm64 and cross compiled on
>> multiple others platforms.

I guess for all platforms, ARCH_HAS_FIRST_USER_ADDRESS would have just
evaluated to be false hence falling back on the generic definition. So
this never complained during build any where or during boot on arm64.

>>
>>>
>>> should be #ifndef CONFIG_ARCH_HAS_FIRST_USER_ADDRESS
>>
>> Right, meant that instead.
>>
>>>
>>>> +#define FIRST_USER_ADDRESS    0UL
>>>> +#endif
>>>
>>> But why do we need a config option at all for that ?
>>>
>>> Why not just:
>>>
>>> #ifndef FIRST_USER_ADDRESS
>>> #define FIRST_USER_ADDRESS    0UL
>>> #endif
>>
>> This sounds simpler. But just wondering, would not there be any possibility
>> of build problems due to compilation sequence between arch and generic code ?
>>
> 
> For sure it has to be addresses carefully, but there are already a lot of stuff like that around pgtables.h
> 
> For instance, pte_offset_kernel() has a generic definition in linux/pgtables.h based on whether it is already defined or not.
> 
> Taking into account that FIRST_USER_ADDRESS is today in the architectures's asm/pgtables.h, I think putting the fallback definition in linux/pgtable.h would do the trick.

Agreed, <linux/pgtable.h> includes <asm/pgtable.h> at the beginning and
if the arch defines FIRST_USER_ADDRESS, the generic one afterwards would
be skipped. The following change builds on multiple platforms.

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ad086e6d7155..5da96f5df48f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -7,7 +7,6 @@ config ARM
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
 	select ARCH_HAS_ELF_RANDOMIZE
-	select ARCH_HAS_FIRST_USER_ADDRESS
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index 23ec4fcc0d0f..62313902d75d 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -8,7 +8,6 @@ config NDS32
 	def_bool y
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_DMA_PREP_COHERENT
-	select ARCH_HAS_FIRST_USER_ADDRESS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_WANT_FRAME_POINTERS if FTRACE
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 47098ccd715e..8ba434287387 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -46,10 +46,6 @@ extern int sysctl_page_lock_unfairness;
 
 void init_mm_internals(void);
 
-#ifndef ARCH_HAS_FIRST_USER_ADDRESS
-#define FIRST_USER_ADDRESS	0UL
-#endif
-
 #ifndef CONFIG_NEED_MULTIPLE_NODES	/* Don't use mapnrs, do it properly */
 extern unsigned long max_mapnr;
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5e772392a379..f3da6a5cc35a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -28,6 +28,10 @@
 #define USER_PGTABLES_CEILING	0UL
 #endif
 
+#ifndef FIRST_USER_ADDRESS
+#define FIRST_USER_ADDRESS	0UL
+#endif
+
 /*
  * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
  *
diff --git a/mm/Kconfig b/mm/Kconfig
index 373fbe377075..4494501aa403 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -807,9 +807,6 @@ config VMAP_PFN
 config ARCH_USES_HIGH_VMA_FLAGS
 	bool
 
-config ARCH_HAS_FIRST_USER_ADDRESS
-	bool
-
 config ARCH_HAS_PKEYS
 	bool
 
-- 
2.20.1
