Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2C350E2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 06:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9r5Q3BkSz3bq8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:37:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZEYmFM2Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZEYmFM2Q; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9r4x4Zmqz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 15:37:20 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1314Y4BM067523; Thu, 1 Apr 2021 00:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=OJskjXQlmi3Lr59NGffAIPcNlo8Tx4ZySUQw3Jcmito=;
 b=ZEYmFM2Qs88PYM3FDKGRzbCx2mdG8w2gIC3zVKL1DgclQQJPq4oBBluLkBnSX7xruLS1
 zVUNhrC1/ZnGbpXl0/YOKtv0QnleNyGqZI5/pbAqsmFlkKyd7QoN2mYtDCHjy/5vpIkg
 NKeACTrVdfRdLRlq5Kko5xBqO+CAiuA0RBVzNCtBu7zFN6lf++fP0pq62DRq3GDebCgJ
 eDIMoDylcovmDALuYdF2tg6ZCeXD4GPE+VrQaW8M4HXkMCF5WeSn4M739b5+JrU48FD2
 JbnDOzIrw9Zr9j5cBTXxgOt4hxlHKL0nbxwmAqtx1EvgA5qXmso/bIVaDxJd4kFdcs12 SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37n2ehehus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 00:37:15 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1314Ydp6070954;
 Thu, 1 Apr 2021 00:37:14 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37n2ehehuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 00:37:14 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1314XwuU024560;
 Thu, 1 Apr 2021 04:37:14 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 37n293smt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 04:37:14 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1314bDNG14680388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 04:37:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E3CD28064;
 Thu,  1 Apr 2021 04:37:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E10962805C;
 Thu,  1 Apr 2021 04:37:10 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.77.200.186])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  1 Apr 2021 04:37:10 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
In-Reply-To: <20210330045132.722243-2-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
Date: Thu, 01 Apr 2021 10:07:08 +0530
Message-ID: <87czve7h8r.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kKkjeg1CqpEPpUQbF3gcGrEIyhN4wL5S
X-Proofpoint-ORIG-GUID: W-hXwzBnKmypHeWHbQhlwk5kwCcFBUOn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_02:2021-03-31,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010031
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
Cc: ajd@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 cmr@codefail.de, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:

> From: Russell Currey <ruscur@russell.cc>
>
> The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
> and are generally useful primitives to have.  This implementation is
> designed to be completely generic across powerpc's many MMUs.
>
> It's possible that this could be optimised to be faster for specific
> MMUs, but the focus is on having a generic and safe implementation for
> now.
>
> This implementation does not handle cases where the caller is attempting
> to change the mapping of the page it is executing from, or if another
> CPU is concurrently using the page being altered.  These cases likely
> shouldn't happen, but a more complex implementation with MMU-specific code
> could safely handle them, so that is left as a TODO for now.
>
> On hash the linear mapping is not kept in the linux pagetable, so this
> will not change the protection if used on that range. Currently these
> functions are not used on the linear map so just WARN for now.
>
> These functions do nothing if STRICT_KERNEL_RWX is not enabled.
>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> [jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX again"
>       - WARN on hash linear map]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: WARN if trying to change the hash linear map
> ---
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
>  arch/powerpc/mm/Makefile              |  2 +-
>  arch/powerpc/mm/pageattr.c            | 88 +++++++++++++++++++++++++++
>  4 files changed, 122 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/set_memory.h
>  create mode 100644 arch/powerpc/mm/pageattr.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fc7f5c5933e6..4498a27ac9db 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -135,6 +135,7 @@ config PPC
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> +	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> new file mode 100644
> index 000000000000..64011ea444b4
> --- /dev/null
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_SET_MEMORY_H
> +#define _ASM_POWERPC_SET_MEMORY_H
> +
> +#define SET_MEMORY_RO	0
> +#define SET_MEMORY_RW	1
> +#define SET_MEMORY_NX	2
> +#define SET_MEMORY_X	3
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action);
> +
> +static inline int set_memory_ro(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
> +}
> +
> +static inline int set_memory_rw(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
> +}
> +
> +static inline int set_memory_nx(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
> +}
> +
> +static inline int set_memory_x(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_X);
> +}
> +
> +#endif
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 3b4e9e4e25ea..d8a08abde1ae 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -5,7 +5,7 @@
>  
>  ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
>  
> -obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o \
> +obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
>  				   init_$(BITS).o pgtable_$(BITS).o \
>  				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
>  				   init-common.o mmu_context.o drmem.o
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..9efcb01088da
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * MMU-generic set_memory implementation for powerpc
> + *
> + * Copyright 2019, IBM Corporation.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/set_memory.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +
> +
> +/*
> + * Updates the attributes of a page in three steps:
> + *
> + * 1. invalidate the page table entry
> + * 2. flush the TLB
> + * 3. install the new entry with the updated attributes
> + *
> + * This is unsafe if the caller is attempting to change the mapping of the
> + * page it is executing from, or if another CPU is concurrently using the
> + * page being altered.
> + *
> + * TODO make the implementation resistant to this.
> + *
> + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
> + */
> +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	long action = (long)data;
> +	pte_t pte;
> +
> +	spin_lock(&init_mm.page_table_lock);
> +
> +	/* invalidate the PTE so it's safe to modify */
> +	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	/* modify the PTE bits as desired, then apply */
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte = pte_wrprotect(pte);
> +		break;
> +	case SET_MEMORY_RW:
> +		pte = pte_mkwrite(pte);
> +		break;
> +	case SET_MEMORY_NX:
> +		pte = pte_exprotect(pte);
> +		break;
> +	case SET_MEMORY_X:
> +		pte = pte_mkexec(pte);
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		break;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte);
> +	spin_unlock(&init_mm.page_table_lock);
> +
> +	return 0;
> +}
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long sz = numpages * PAGE_SIZE;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;

What restrictions imposed by that config are we dependent on here? 


> +
> +	if (numpages <= 0)
> +		return 0;
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (WARN_ON_ONCE(!radix_enabled() &&
> +		     get_region_id(addr) == LINEAR_MAP_REGION_ID)) {
> +		return -1;
> +	}
> +#endif

What about VMEMMAP_REGIOND_ID

> +
> +	return apply_to_existing_page_range(&init_mm, start, sz,
> +					    change_page_attr, (void *)action);


That handles on 64K mapping. What about linear map? Also there is a
patchset implementing hugepage for vmalloc mapping. 

> +}
> -- 
> 2.25.1
