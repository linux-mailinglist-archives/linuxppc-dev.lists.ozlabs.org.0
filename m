Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCEAB125C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 17:40:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tjdg1jHWzF405
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 01:40:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TjZw6Qx9zF4Ys
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 01:38:00 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CFXnVO121175; Thu, 12 Sep 2019 11:37:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyqkyud71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 11:37:39 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8CFYAgU124640;
 Thu, 12 Sep 2019 11:37:38 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uyqkyud6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 11:37:38 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8CFZlwr019516;
 Thu, 12 Sep 2019 15:37:38 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 2uyqd8rsdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 15:37:38 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8CFbbXN40501738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 15:37:37 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 190BBB2067;
 Thu, 12 Sep 2019 15:37:37 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B3E2B2064;
 Thu, 12 Sep 2019 15:37:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.32.243])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 15:37:34 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com, hch@infradead.org
Subject: Re: [PATCH v1 3/4] powerpc: Add support for GENERIC_EARLY_IOREMAP
In-Reply-To: <412c7eaa6a373d8f82a3c3ee01e6a65a1a6589de.1568295907.git.christophe.leroy@c-s.fr>
References: <cover.1568295907.git.christophe.leroy@c-s.fr>
 <412c7eaa6a373d8f82a3c3ee01e6a65a1a6589de.1568295907.git.christophe.leroy@c-s.fr>
Date: Thu, 12 Sep 2019 21:07:32 +0530
Message-ID: <87ftl1seyr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120160
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Add support for GENERIC_EARLY_IOREMAP.
>
> Let's define 16 slots of 256Kbytes each for early ioremap.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/Kconfig              |  1 +
>  arch/powerpc/include/asm/Kbuild   |  1 +
>  arch/powerpc/include/asm/fixmap.h | 12 ++++++++++++
>  arch/powerpc/kernel/setup_32.c    |  3 +++
>  arch/powerpc/kernel/setup_64.c    |  3 +++
>  5 files changed, 20 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6a7c797fa9d2..8fe252962518 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -161,6 +161,7 @@ config PPC
>  	select GENERIC_CMOS_UPDATE
>  	select GENERIC_CPU_AUTOPROBE
>  	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
> +	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_IRQ_SHOW
>  	select GENERIC_IRQ_SHOW_LEVEL
>  	select GENERIC_PCI_IOMAP		if PCI
> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
> index 9a1d2fc6ceb7..30829120659c 100644
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -12,3 +12,4 @@ generic-y += preempt.h
>  generic-y += vtime.h
>  generic-y += msi.h
>  generic-y += simd.h
> +generic-y += early_ioremap.h
> diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
> index 722289a1d000..d5c4d357bd33 100644
> --- a/arch/powerpc/include/asm/fixmap.h
> +++ b/arch/powerpc/include/asm/fixmap.h
> @@ -15,6 +15,7 @@
>  #define _ASM_FIXMAP_H
>  
>  #ifndef __ASSEMBLY__
> +#include <linux/sizes.h>
>  #include <asm/page.h>
>  #include <asm/pgtable.h>
>  #ifdef CONFIG_HIGHMEM
> @@ -64,6 +65,14 @@ enum fixed_addresses {
>  		       FIX_IMMR_SIZE,
>  #endif
>  	/* FIX_PCIE_MCFG, */
> +	__end_of_permanent_fixed_addresses,
> +
> +#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
> +#define FIX_BTMAPS_SLOTS	16
> +#define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
> +
> +	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
> +	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
>  	__end_of_fixed_addresses
>  };
>  
> @@ -71,6 +80,7 @@ enum fixed_addresses {
>  #define FIXADDR_START		(FIXADDR_TOP - __FIXADDR_SIZE)
>  
>  #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NCG
> +#define FIXMAP_PAGE_IO	PAGE_KERNEL_NCG
>  
>  #include <asm-generic/fixmap.h>
>  
> @@ -85,5 +95,7 @@ static inline void __set_fixmap(enum fixed_addresses idx,
>  	map_kernel_page(__fix_to_virt(idx), phys, flags);
>  }
>  
> +#define __early_set_fixmap	__set_fixmap
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif
> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
> index a7541edf0cdb..dcffe927f5b9 100644
> --- a/arch/powerpc/kernel/setup_32.c
> +++ b/arch/powerpc/kernel/setup_32.c
> @@ -44,6 +44,7 @@
>  #include <asm/asm-prototypes.h>
>  #include <asm/kdump.h>
>  #include <asm/feature-fixups.h>
> +#include <asm/early_ioremap.h>
>  
>  #include "setup.h"
>  
> @@ -80,6 +81,8 @@ notrace void __init machine_init(u64 dt_ptr)
>  	/* Configure static keys first, now that we're relocated. */
>  	setup_feature_keys();
>  
> +	early_ioremap_setup();
> +
>  	/* Enable early debugging if any specified (see udbg.h) */
>  	udbg_early_init();
>  
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 44b4c432a273..b85f6a1cc3a1 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -65,6 +65,7 @@
>  #include <asm/hw_irq.h>
>  #include <asm/feature-fixups.h>
>  #include <asm/kup.h>
> +#include <asm/early_ioremap.h>
>  
>  #include "setup.h"
>  
> @@ -338,6 +339,8 @@ void __init early_setup(unsigned long dt_ptr)
>  	apply_feature_fixups();
>  	setup_feature_keys();
>  
> +	early_ioremap_setup();
> +
>  	/* Initialize the hash table or TLB handling */
>  	early_init_mmu();
>  

Can we remove early_ioremap_range() after this?

-aneesh
