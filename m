Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E394F35ECA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 07:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKsHX6J5Zz3c06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 15:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FKsHC1L5vz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 15:59:00 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4E4B106F;
 Tue, 13 Apr 2021 22:58:57 -0700 (PDT)
Received: from [10.163.72.181] (unknown [10.163.72.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76123F694;
 Tue, 13 Apr 2021 22:58:50 -0700 (PDT)
Subject: Re: [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
 <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
Date: Wed, 14 Apr 2021 11:29:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
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



On 4/14/21 10:52 AM, Christophe Leroy wrote:
> 
> 
> Le 14/04/2021 à 04:54, Anshuman Khandual a écrit :
>> Currently most platforms define FIRST_USER_ADDRESS as 0UL duplicating the
>> same code all over. Instead define a new option ARCH_HAS_FIRST_USER_ADDRESS
>> for those platforms which would override generic default FIRST_USER_ADDRESS
>> value 0UL. This makes it much cleaner with reduced code.
>>
>> Cc: linux-alpha@vger.kernel.org
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-csky@vger.kernel.org
>> Cc: linux-hexagon@vger.kernel.org
>> Cc: linux-ia64@vger.kernel.org
>> Cc: linux-m68k@lists.linux-m68k.org
>> Cc: linux-mips@vger.kernel.org
>> Cc: openrisc@lists.librecores.org
>> Cc: linux-parisc@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-um@lists.infradead.org
>> Cc: linux-xtensa@linux-xtensa.org
>> Cc: x86@kernel.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/alpha/include/asm/pgtable.h             | 1 -
>>   arch/arc/include/asm/pgtable.h               | 6 ------
>>   arch/arm/Kconfig                             | 1 +
>>   arch/arm64/include/asm/pgtable.h             | 2 --
>>   arch/csky/include/asm/pgtable.h              | 1 -
>>   arch/hexagon/include/asm/pgtable.h           | 3 ---
>>   arch/ia64/include/asm/pgtable.h              | 1 -
>>   arch/m68k/include/asm/pgtable_mm.h           | 1 -
>>   arch/microblaze/include/asm/pgtable.h        | 2 --
>>   arch/mips/include/asm/pgtable-32.h           | 1 -
>>   arch/mips/include/asm/pgtable-64.h           | 1 -
>>   arch/nds32/Kconfig                           | 1 +
>>   arch/nios2/include/asm/pgtable.h             | 2 --
>>   arch/openrisc/include/asm/pgtable.h          | 1 -
>>   arch/parisc/include/asm/pgtable.h            | 2 --
>>   arch/powerpc/include/asm/book3s/pgtable.h    | 1 -
>>   arch/powerpc/include/asm/nohash/32/pgtable.h | 1 -
>>   arch/powerpc/include/asm/nohash/64/pgtable.h | 2 --
>>   arch/riscv/include/asm/pgtable.h             | 2 --
>>   arch/s390/include/asm/pgtable.h              | 2 --
>>   arch/sh/include/asm/pgtable.h                | 2 --
>>   arch/sparc/include/asm/pgtable_32.h          | 1 -
>>   arch/sparc/include/asm/pgtable_64.h          | 3 ---
>>   arch/um/include/asm/pgtable-2level.h         | 1 -
>>   arch/um/include/asm/pgtable-3level.h         | 1 -
>>   arch/x86/include/asm/pgtable_types.h         | 2 --
>>   arch/xtensa/include/asm/pgtable.h            | 1 -
>>   include/linux/mm.h                           | 4 ++++
>>   mm/Kconfig                                   | 4 ++++
>>   29 files changed, 10 insertions(+), 43 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 8ba434287387..47098ccd715e 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -46,6 +46,10 @@ extern int sysctl_page_lock_unfairness;
>>     void init_mm_internals(void);
>>   +#ifndef ARCH_HAS_FIRST_USER_ADDRESS
> 
> I guess you didn't test it ..... :)

In fact I did :) Though just booted it on arm64 and cross compiled on
multiple others platforms.

> 
> should be #ifndef CONFIG_ARCH_HAS_FIRST_USER_ADDRESS

Right, meant that instead.

> 
>> +#define FIRST_USER_ADDRESS    0UL
>> +#endif
> 
> But why do we need a config option at all for that ?
> 
> Why not just:
> 
> #ifndef FIRST_USER_ADDRESS
> #define FIRST_USER_ADDRESS    0UL
> #endif

This sounds simpler. But just wondering, would not there be any possibility
of build problems due to compilation sequence between arch and generic code ?
