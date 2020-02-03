Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B15150E70
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 18:13:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BDtY1nQ4zDqBm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 04:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDpD1ZKJzDqMF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 04:09:40 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013H9MU0071947; Mon, 3 Feb 2020 12:09:29 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxjdecfjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 12:09:29 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 013H9Sh0072561;
 Mon, 3 Feb 2020 12:09:28 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxjdecfgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 12:09:28 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 013GxxiU014986;
 Mon, 3 Feb 2020 17:09:27 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2xw0y6f5de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 17:09:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 013H9PT536503820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 17:09:25 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ECDCBE04F;
 Mon,  3 Feb 2020 17:09:25 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E758DBE053;
 Mon,  3 Feb 2020 17:09:20 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.92.150])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 17:09:20 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Subject: Re: [PATCH 2/5] mm/memremap_pages: Introduce memremap_compat_align()
In-Reply-To: <158041476763.3889308.13149849631980018039.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158041475480.3889308.655103391935006598.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158041476763.3889308.13149849631980018039.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Mon, 03 Feb 2020 22:39:18 +0530
Message-ID: <87v9onfvi9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_06:2020-02-02,
 2020-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002030128
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
Cc: linux-kernel@vger.kernel.org, Jeff Moyer <jmoyer@redhat.com>,
 Paul Mackerras <paulus@samba.org>, vishal.l.verma@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> The "sub-section memory hotplug" facility allows memremap_pages() users
> like libnvdimm to compensate for hardware platforms like x86 that have a
> section size larger than their hardware memory mapping granularity.  The
> compensation that sub-section support affords is being tolerant of
> physical memory resources shifting by units smaller (64MiB on x86) than
> the memory-hotplug section size (128 MiB). Where the platform
> physical-memory mapping granularity is limited by the number and
> capability of address-decode-registers in the memory controller.
>
> While the sub-section support allows memremap_pages() to operate on
> sub-section (2MiB) granularity, the Power architecture may still
> require 16MiB alignment on "!radix_enabled()" platforms.
>
> In order for libnvdimm to be able to detect and manage this per-arch
> limitation, introduce memremap_compat_align() as a common minimum
> alignment across all driver-facing memory-mapping interfaces, and let
> Power override it to 16MiB in the "!radix_enabled()" case.
>
> The assumption / requirement for 16MiB to be a viable
> memremap_compat_align() value is that Power does not have platforms
> where its equivalent of address-decode-registers never hardware remaps a
> persistent memory resource on smaller than 16MiB boundaries.
>
> Based on an initial patch by Aneesh.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

>
> Link: http://lore.kernel.org/r/CAPcyv4gBGNP95APYaBcsocEa50tQj9b5h__83vgngjq3ouGX_Q@mail.gmail.com
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/powerpc/include/asm/io.h |   10 ++++++++++
>  drivers/nvdimm/pfn_devs.c     |    2 +-
>  include/linux/io.h            |   23 +++++++++++++++++++++++
>  include/linux/mmzone.h        |    1 +
>  4 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index a63ec938636d..0fa2dc483008 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -734,6 +734,16 @@ extern void __iomem * __ioremap_at(phys_addr_t pa, void *ea,
>  				   unsigned long size, pgprot_t prot);
>  extern void __iounmap_at(void *ea, unsigned long size);
>  
> +#ifdef CONFIG_SPARSEMEM
> +static inline unsigned long memremap_compat_align(void)
> +{
> +	if (radix_enabled())
> +		return SUBSECTION_SIZE;
> +	return (1UL << mmu_psize_defs[mmu_linear_psize].shift);
> +}
> +#define memremap_compat_align memremap_compat_align
> +#endif
> +
>  /*
>   * When CONFIG_PPC_INDIRECT_PIO is set, we use the generic iomap implementation
>   * which needs some additional definitions here. They basically allow PIO
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index b94f7a7e94b8..a5c25cb87116 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -750,7 +750,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>  	start = nsio->res.start;
>  	size = resource_size(&nsio->res);
>  	npfns = PHYS_PFN(size - SZ_8K);
> -	align = max(nd_pfn->align, (1UL << SUBSECTION_SHIFT));
> +	align = max(nd_pfn->align, SUBSECTION_SIZE);
>  	end_trunc = start + size - ALIGN_DOWN(start + size, align);
>  	if (nd_pfn->mode == PFN_MODE_PMEM) {
>  		/*
> diff --git a/include/linux/io.h b/include/linux/io.h
> index 35e8d84935e0..ccd34519fad3 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -6,6 +6,7 @@
>  #ifndef _LINUX_IO_H
>  #define _LINUX_IO_H
>  
> +#include <linux/mmzone.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
>  #include <linux/bug.h>
> @@ -79,6 +80,28 @@ void *devm_memremap(struct device *dev, resource_size_t offset,
>  		size_t size, unsigned long flags);
>  void devm_memunmap(struct device *dev, void *addr);
>  
> +#ifndef memremap_compat_align
> +#ifdef CONFIG_SPARSEMEM
> +/*
> + * Minimum compatible alignment of the resource (start, end) across
> + * memremap interfaces (i.e. memremap + memremap_pages)
> + */
> +static inline unsigned long memremap_compat_align(void)
> +{
> +	return SUBSECTION_SIZE;
> +}
> +#else /* CONFIG_SPARSEMEM */
> +/*
> + * No ZONE_DEVICE / memremap_pages() support so the minimum mapping
> + * granularity is a single page.
> + */
> +static inline unsigned long memremap_compat_align(void)
> +{
> +	return PAGE_SIZE;
> +}
> +#endif /* CONFIG_SPARSEMEM */
> +#endif /* memremap_compat_align */
> +
>  #ifdef CONFIG_PCI
>  /*
>   * The PCI specifications (Rev 3.0, 3.2.5 "Transaction Ordering and
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 89d8ff06c9ce..b0de83620cd7 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1171,6 +1171,7 @@ static inline unsigned long section_nr_to_pfn(unsigned long sec)
>  #define SECTION_ALIGN_DOWN(pfn)	((pfn) & PAGE_SECTION_MASK)
>  
>  #define SUBSECTION_SHIFT 21
> +#define SUBSECTION_SIZE (1UL << SUBSECTION_SHIFT)
>  
>  #define PFN_SUBSECTION_SHIFT (SUBSECTION_SHIFT - PAGE_SHIFT)
>  #define PAGES_PER_SUBSECTION (1UL << PFN_SUBSECTION_SHIFT)
