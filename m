Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE26C67F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 05:17:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pzpL2ScbzDqL8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 13:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="HEQrhReD"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pzl71GpjzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 13:14:42 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 740237F923;
 Wed, 17 Jul 2019 22:14:39 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1563419680; bh=+6gaa9KvLPHj/EF31qw3hkLL8BVwj5iD+Y5m0fg92HQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HEQrhReDnE4IjpkXiQSA/Y+TpGj6UbV+iRhskA8brxUYPDsrA4fq2GPzH5u9mVT0M
 6/fo6VsOOwRyePGYET8O0u2OcilHg7YilxYUNEfeZKC6bttfYHy9UotjXDzLGdu5LM
 2346INkzsxoOnsAH937hig3+LUJp3fvuKWmJb/MoDxGVVjtlOBf3qpTEN1A6KE/ArA
 qL1XYwGsICa/sVndludxsOacwEuS93Wr0CndS+sQ9883kUlsmHuKqh6LQjdb4jifsL
 RWPhky8+zdK7LzRt1VMgHzEelY0hthwGzLYWrbITYoROVu/XF/GMwndNvmbk7076OF
 mFkKR5QU8gWYw==
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
Date: Wed, 17 Jul 2019 22:14:36 -0500
MIME-Version: 1.0
In-Reply-To: <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: sbobroff@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/17/19 9:59 PM, Alexey Kardashevskiy wrote:
> 
> 
> On 18/07/2019 09:54, Shawn Anastasio wrote:
>> The refactor of powerpc DMA functions in commit 6666cc17d780
>> ("powerpc/dma: remove dma_nommu_mmap_coherent") incorrectly
>> changes the way DMA mappings are handled on powerpc.
>> Since this change, all mapped pages are marked as cache-inhibited
>> through the default implementation of arch_dma_mmap_pgprot.
>> This differs from the previous behavior of only marking pages
>> in noncoherent mappings as cache-inhibited and has resulted in
>> sporadic system crashes in certain hardware configurations and
>> workloads (see Bugzilla).
>>
>> This commit restores the previous correct behavior by providing
>> an implementation of arch_dma_mmap_pgprot that only marks
>> pages in noncoherent mappings as cache-inhibited. As this behavior
>> should be universal for all powerpc platforms a new file,
>> dma-generic.c, was created to store it.
>>
>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204145
>> Fixes: 6666cc17d780 ("powerpc/dma: remove dma_nommu_mmap_coherent")
>> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> 
> 
> Is this the default one?
> 
> include/linux/dma-noncoherent.h
> # define arch_dma_mmap_pgprot(dev, prot, attrs) pgprot_noncached(prot)

Yep, that's the one.

> Out of curiosity - do not we want to fix this one for everyone?

Other than m68k, mips, and arm64, everybody else that doesn't have
ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
I assume this behavior is acceptable on those architectures.

> Either way, the patch is correct. I'm glad to know it was not my " 
> powerpc/ioda2: Yet another attempt to allow DMA masks between 32 and 59" 
> which broke it :)

Yeah, turns out it was just bad luck that I happened to run into these
crashes right after deciding to try out your patch :)

> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks!

> 
> 
> 
>> ---
>>   arch/powerpc/Kconfig             |  1 +
>>   arch/powerpc/kernel/Makefile     |  3 ++-
>>   arch/powerpc/kernel/dma-common.c | 17 +++++++++++++++++
>>   3 files changed, 20 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/powerpc/kernel/dma-common.c
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index d8dcd8820369..77f6ebf97113 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -121,6 +121,7 @@ config PPC
>>       select ARCH_32BIT_OFF_T if PPC32
>>       select ARCH_HAS_DEBUG_VIRTUAL
>>       select ARCH_HAS_DEVMEM_IS_ALLOWED
>> +    select ARCH_HAS_DMA_MMAP_PGPROT
>>       select ARCH_HAS_ELF_RANDOMIZE
>>       select ARCH_HAS_FORTIFY_SOURCE
>>       select ARCH_HAS_GCOV_PROFILE_ALL
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index 56dfa7a2a6f2..ea0c69236789 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -49,7 +49,8 @@ obj-y                := cputable.o ptrace.o 
>> syscalls.o \
>>                      signal.o sysfs.o cacheinfo.o time.o \
>>                      prom.o traps.o setup-common.o \
>>                      udbg.o misc.o io.o misc_$(BITS).o \
>> -                   of_platform.o prom_parse.o
>> +                   of_platform.o prom_parse.o \
>> +                   dma-common.o
>>   obj-$(CONFIG_PPC64)        += setup_64.o sys_ppc32.o \
>>                      signal_64.o ptrace32.o \
>>                      paca.o nvram_64.o firmware.o
>> diff --git a/arch/powerpc/kernel/dma-common.c 
>> b/arch/powerpc/kernel/dma-common.c
>> new file mode 100644
>> index 000000000000..5a15f99f4199
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/dma-common.c
>> @@ -0,0 +1,17 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Contains common dma routines for all powerpc platforms.
>> + *
>> + * Copyright (C) 2019 Shawn Anastasio (shawn@anastas.io)
>> + */
>> +
>> +#include <linux/mm.h>
>> +#include <linux/dma-noncoherent.h>
>> +
>> +pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
>> +        unsigned long attrs)
>> +{
>> +    if (!dev_is_dma_coherent(dev))
>> +        return pgprot_noncached(prot);
>> +    return prot;
>> +}
>>
> 
