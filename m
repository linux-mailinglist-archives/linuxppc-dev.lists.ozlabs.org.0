Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC276C518
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 05:01:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pzS82LDKzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 13:01:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="npmRIXOD"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pzQB38TlzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 13:00:01 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id 4so6085808pld.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 20:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RQqrTbzQMISaKjuQmm9+Qv56WqPYVhp+wa8BJs+k8TE=;
 b=npmRIXOD240LnYaCqkM/F93ew+pL6muT3Vjivv7/TBQHo3SF4y5Scd2swkqDSYwOLc
 tRBirw5/R5HM85bB6q/JHErHvLDNJp7H+sycoCU66ozfGV7clg4UmrZqjORD0wvBqhRU
 Z5FcvCTzugrLgVhJfZN5d808N8oqmf61bLCodLJ9B3dHDRVKmgEMZ0FScsVSyITY2rHk
 7iOZfpChJNQhpyqe190tQcYilf1FbGaKnOrVIP19Bt0anFF/euFo1YXiYSHsfRTh5m8l
 9T2F6zrUk9Oxk3M10+KK93qmHpRaQKm2yQ2S+OikJBEwxK4cw73+TW1eO8xxd6hzO3+N
 5n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RQqrTbzQMISaKjuQmm9+Qv56WqPYVhp+wa8BJs+k8TE=;
 b=t0EN5SZDCKtu0M3D8gTbRyCZrW9FyoSSo6HqvmrH/wGqkOZjlbwdevpdflA2tFUhUf
 hqf3Vm9Kc7qSs+zKtFhd71eb+8BPeV+j0eouetNVl62rYjXHpi1wJeECeQbtVrUlA/KG
 ZKmDUnfDbxvb1iMQTb6WFtV82BN906+wo3RSPcrEu6t4VfS0WBYw9zAcoAymdzq7h+18
 hZoRn9p/IU7DAMZuOKTVTPqMzTtj9blE9NnNjnmcEnWNPIgAzwW6ycBWZ8qFfFtdJ7bV
 DP5YMa7VBBxApBNGUJm1UEM0qNBEpGDjybDgCSqd5xuRCPOB7BqX9un+T5I1rgqgOZCZ
 DAmw==
X-Gm-Message-State: APjAAAWfUatWFz7fIJgrhvDZnGVcXxPzZXE37MCDO4XvfGsUkX3kVujq
 MErK92rJvreqRl0bnJY69O0=
X-Google-Smtp-Source: APXvYqzVpPq9hdTlIQL7/U4kkCNEDpxlBvufjH2ySQ/yLAd5AP5oxf2i5CVnqTEMS/SsyIVMBxk6hw==
X-Received: by 2002:a17:902:4222:: with SMTP id
 g31mr48988277pld.41.1563418799526; 
 Wed, 17 Jul 2019 19:59:59 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id r2sm35647575pfl.67.2019.07.17.19.59.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 19:59:58 -0700 (PDT)
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Shawn Anastasio <shawn@anastas.io>, linuxppc-dev@lists.ozlabs.org
References: <20190717235437.12908-1-shawn@anastas.io>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
Date: Thu, 18 Jul 2019 12:59:54 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717235437.12908-1-shawn@anastas.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 18/07/2019 09:54, Shawn Anastasio wrote:
> The refactor of powerpc DMA functions in commit 6666cc17d780
> ("powerpc/dma: remove dma_nommu_mmap_coherent") incorrectly
> changes the way DMA mappings are handled on powerpc.
> Since this change, all mapped pages are marked as cache-inhibited
> through the default implementation of arch_dma_mmap_pgprot.
> This differs from the previous behavior of only marking pages
> in noncoherent mappings as cache-inhibited and has resulted in
> sporadic system crashes in certain hardware configurations and
> workloads (see Bugzilla).
> 
> This commit restores the previous correct behavior by providing
> an implementation of arch_dma_mmap_pgprot that only marks
> pages in noncoherent mappings as cache-inhibited. As this behavior
> should be universal for all powerpc platforms a new file,
> dma-generic.c, was created to store it.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204145
> Fixes: 6666cc17d780 ("powerpc/dma: remove dma_nommu_mmap_coherent")
> Signed-off-by: Shawn Anastasio <shawn@anastas.io>


Is this the default one?

include/linux/dma-noncoherent.h
# define arch_dma_mmap_pgprot(dev, prot, attrs) pgprot_noncached(prot)

Out of curiosity - do not we want to fix this one for everyone?

Either way, the patch is correct. I'm glad to know it was not my " 
powerpc/ioda2: Yet another attempt to allow DMA masks between 32 and 59" 
which broke it :)

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> ---
>   arch/powerpc/Kconfig             |  1 +
>   arch/powerpc/kernel/Makefile     |  3 ++-
>   arch/powerpc/kernel/dma-common.c | 17 +++++++++++++++++
>   3 files changed, 20 insertions(+), 1 deletion(-)
>   create mode 100644 arch/powerpc/kernel/dma-common.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d8dcd8820369..77f6ebf97113 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -121,6 +121,7 @@ config PPC
>   	select ARCH_32BIT_OFF_T if PPC32
>   	select ARCH_HAS_DEBUG_VIRTUAL
>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
> +	select ARCH_HAS_DMA_MMAP_PGPROT
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 56dfa7a2a6f2..ea0c69236789 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -49,7 +49,8 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
>   				   signal.o sysfs.o cacheinfo.o time.o \
>   				   prom.o traps.o setup-common.o \
>   				   udbg.o misc.o io.o misc_$(BITS).o \
> -				   of_platform.o prom_parse.o
> +				   of_platform.o prom_parse.o \
> +				   dma-common.o
>   obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
>   				   signal_64.o ptrace32.o \
>   				   paca.o nvram_64.o firmware.o
> diff --git a/arch/powerpc/kernel/dma-common.c b/arch/powerpc/kernel/dma-common.c
> new file mode 100644
> index 000000000000..5a15f99f4199
> --- /dev/null
> +++ b/arch/powerpc/kernel/dma-common.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Contains common dma routines for all powerpc platforms.
> + *
> + * Copyright (C) 2019 Shawn Anastasio (shawn@anastas.io)
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/dma-noncoherent.h>
> +
> +pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
> +		unsigned long attrs)
> +{
> +	if (!dev_is_dma_coherent(dev))
> +		return pgprot_noncached(prot);
> +	return prot;
> +}
> 

-- 
Alexey
