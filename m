Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959062104
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:01:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j7tz2b4VzDqBM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 01:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j7l00D0qzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 00:54:18 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68EqKBk077870
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jul 2019 10:54:15 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tm7cw1td9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 10:54:15 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 8 Jul 2019 15:54:13 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 8 Jul 2019 15:54:12 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68EsBwE42402038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 14:54:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40022A405D;
 Mon,  8 Jul 2019 14:54:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48022A4055;
 Mon,  8 Jul 2019 14:54:10 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.86.140])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 14:54:10 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/mm: Implement STRICT_MODULE_RWX
In-Reply-To: <20190614055013.21014-1-ruscur@russell.cc>
References: <20190614055013.21014-1-ruscur@russell.cc>
Date: Mon, 08 Jul 2019 20:24:08 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19070814-4275-0000-0000-0000034A3B3A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070814-4276-0000-0000-0000385A6307
Message-Id: <87y318wp9r.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080186
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> Strict module RWX is just like strict kernel RWX, but for modules - so
> loadable modules aren't marked both writable and executable at the same
> time.  This is handled by the generic code in kernel/module.c, and
> simply requires the architecture to implement the set_memory() set of
> functions, declared with ARCH_HAS_SET_MEMORY.
>
> There's nothing other than these functions required to turn
> ARCH_HAS_STRICT_MODULE_RWX on, so turn that on too.
>
> With STRICT_MODULE_RWX enabled, there are as many W+X pages at runtime
> as there are with CONFIG_MODULES=n (none), so in Russel's testing it works
> well on both Hash and Radix book3s64.
>
> There's a TODO in the code for also applying the page permission changes
> to the backing pages in the linear mapping: this is pretty simple for
> Radix and (seemingly) a lot harder for Hash, so I've left it for now
> since there's still a notable security benefit for the patch as-is.
>
> Technically can be enabled without STRICT_KERNEL_RWX, but
> that doesn't gets you a whole lot, so we should leave it off by default
> until we can get STRICT_KERNEL_RWX to the point where it's enabled by
> default.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> Changes from v1 (sent by Christophe):
>  - return if VM_FLUSH_RESET_PERMS is set
>
>  arch/powerpc/Kconfig                  |  2 +
>  arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
>  arch/powerpc/mm/Makefile              |  2 +-
>  arch/powerpc/mm/pageattr.c            | 85 +++++++++++++++++++++++++++
>  4 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/set_memory.h
>  create mode 100644 arch/powerpc/mm/pageattr.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..3d98240ce965 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -131,7 +131,9 @@ config PPC
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
> +	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
> +	select ARCH_HAS_STRICT_MODULE_RWX	if PPC_BOOK3S_64 || PPC32
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> new file mode 100644
> index 000000000000..4b9683f3b3dd
> --- /dev/null
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef _ASM_POWERPC_SET_MEMORY_H
> +#define _ASM_POWERPC_SET_MEMORY_H
> +
> +#define SET_MEMORY_RO	1
> +#define SET_MEMORY_RW	2
> +#define SET_MEMORY_NX	3
> +#define SET_MEMORY_X	4
> +
> +int change_memory(unsigned long addr, int numpages, int action);
> +
> +static inline int set_memory_ro(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages, SET_MEMORY_RO);
> +}
> +
> +static inline int set_memory_rw(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages, SET_MEMORY_RW);
> +}
> +
> +static inline int set_memory_nx(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages, SET_MEMORY_NX);
> +}
> +
> +static inline int set_memory_x(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages, SET_MEMORY_X);
> +}
> +
> +#endif
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 0f499db315d6..b683d1c311b3 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -7,7 +7,7 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
>  
>  obj-y				:= fault.o mem.o pgtable.o mmap.o \
>  				   init_$(BITS).o pgtable_$(BITS).o \
> -				   pgtable-frag.o \
> +				   pgtable-frag.o pageattr.o \
>  				   init-common.o mmu_context.o drmem.o
>  obj-$(CONFIG_PPC_MMU_NOHASH)	+= nohash/
>  obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s32/
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..41baf92f632b
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Page attribute and set_memory routines
> + *
> + * Derived from the arm64 implementation.
> + *
> + * Author: Russell Currey <ruscur@russell.cc>
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/set_memory.h>
> +#include <linux/vmalloc.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +
> +static int change_page_ro(pte_t *ptep, pgtable_t token, unsigned long addr, void *data)
> +{
> +	set_pte_at(&init_mm, addr, ptep, pte_wrprotect(READ_ONCE(*ptep)));
> +	return 0;
> +}

We can't use set_pte_at when updating a valid pte entry. This should have
triggered 

	/*
	 * Make sure hardware valid bit is not set. We don't do
	 * tlb flush for this update.
	 */
	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));

The details are explained as part of

56eecdb912b536a4fa97fb5bfe5a940a54d79be6

-aneesh

