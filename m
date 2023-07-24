Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5775FF14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 20:30:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K/+eBnLY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8pd55Hbzz30dw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 04:30:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K/+eBnLY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8pcB5V13z2yDC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 04:30:02 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OI9pxm027849;
	Mon, 24 Jul 2023 18:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=9/snV+UYJWoXPQZDxdWAl+22Y+mCN6ZtcUcqghwXTBs=;
 b=K/+eBnLYKBgd1hLJ76d+IGFlEONO65fwIYrppNvTekZwn95NtnlHXETu9INkGWpQd7E8
 Th21dOiBMn2C836CC82/EGMpSrqKV253ngZWydP+i3L2M8C1ecTulSeRpE0fLI06pKsX
 KkkHSegdd2m5FWmKRDltQEUNTwdE5XaZHsg2kBd/7mMyFzRr757yary8V4wfe6nc6fVu
 H8Nnw9ozsq7Ncsjtvyrq/kXTTF9FpA180Nc5X8nauLVVqw2AaXmfLWxpQt5VwFl3kFpL
 mvx95miGzl7maCQa2bPywbCEvuav8pRgJNhGRV6Cm6Mv6VFYydEg81yqvPlZOkThLKZi dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1w6whtn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:29:36 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OIEJqY010536;
	Mon, 24 Jul 2023 18:29:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1w6whtmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:29:35 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OHa2mw002068;
	Mon, 24 Jul 2023 18:29:35 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0temnh1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:29:35 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OITYuB35783232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 18:29:34 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6A3858064;
	Mon, 24 Jul 2023 18:29:34 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AF9158054;
	Mon, 24 Jul 2023 18:29:30 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.177.66.22])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 18:29:29 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH v5 10/13] powerpc/book3s64/vmemmap: Switch radix to use
 a different vmemmap handling function
In-Reply-To: <20230718022934.90447-11-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
 <20230718022934.90447-11-aneesh.kumar@linux.ibm.com>
Date: Mon, 24 Jul 2023 23:59:27 +0530
Message-ID: <87edkx2mew.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m1P27k0cn28FaHqYyKEnyTmS-AD9-3FF
X-Proofpoint-ORIG-GUID: CesAgIYhIgfxjyzF8QkaThATS6u8jJqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_14,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307240161
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This is in preparation to update radix to implement vmemmap optimization
> for devdax. Below are the rules w.r.t radix vmemmap mapping
>
> 1. First try to map things using PMD (2M)
> 2. With altmap if altmap cross-boundary check returns true, fall back to
>    PAGE_SIZE
> 3. If we can't allocate PMD_SIZE backing memory for vmemmap, fallback to
>    PAGE_SIZE
>
> On removing vmemmap mapping, check if every subsection that is using the
> vmemmap area is invalid. If found to be invalid, that implies we can safely
> free the vmemmap area. We don't use the PAGE_UNUSED pattern used by x86
> because with 64K page size, we need to do the above check even at the
> PAGE_SIZE granularity.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/radix.h |   2 +
>  arch/powerpc/include/asm/pgtable.h         |   4 +
>  arch/powerpc/mm/book3s64/radix_pgtable.c   | 326 +++++++++++++++++++--
>  arch/powerpc/mm/init_64.c                  |  26 +-
>  4 files changed, 327 insertions(+), 31 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 2ef92f36340f..f1461289643a 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -331,6 +331,8 @@ extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
>  					     unsigned long phys);
>  int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end,
>  				      int node, struct vmem_altmap *altmap);
> +void __ref radix__vmemmap_free(unsigned long start, unsigned long end,
> +			       struct vmem_altmap *altmap);
>  extern void radix__vmemmap_remove_mapping(unsigned long start,
>  				    unsigned long page_size);
>  
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 6a88bfdaa69b..68817ea7f994 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -165,6 +165,10 @@ static inline bool is_ioremap_addr(const void *x)
>  
>  	return addr >= IOREMAP_BASE && addr < IOREMAP_END;
>  }
> +
> +int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
> +bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
> +			   unsigned long page_size);
>  #endif /* CONFIG_PPC64 */
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 227fea53c217..9a7f3707b6fb 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -744,8 +744,59 @@ static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
>  	p4d_clear(p4d);
>  }
>  
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +static bool __meminit vmemmap_pmd_is_unused(unsigned long addr, unsigned long end)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PMD_SIZE);
> +
> +	return !vmemmap_populated(start, PMD_SIZE);
> +}
> +
> +static bool __meminit vmemmap_page_is_unused(unsigned long addr, unsigned long end)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +
> +	return !vmemmap_populated(start, PAGE_SIZE);
> +
> +}
> +#endif
> +
> +static void __meminit free_vmemmap_pages(struct page *page,
> +					 struct vmem_altmap *altmap,
> +					 int order)
> +{
> +	unsigned int nr_pages = 1 << order;
> +
> +	if (altmap) {
> +		unsigned long alt_start, alt_end;
> +		unsigned long base_pfn = page_to_pfn(page);
> +
> +		/*
> +		 * with 2M vmemmap mmaping we can have things setup
> +		 * such that even though atlmap is specified we never
> +		 * used altmap.
> +		 */
> +		alt_start = altmap->base_pfn;
> +		alt_end = altmap->base_pfn + altmap->reserve +
> +			altmap->free + altmap->alloc + altmap->align;
> +
> +		if (base_pfn >= alt_start && base_pfn < alt_end) {
> +			vmem_altmap_free(altmap, nr_pages);
> +			return;
> +		}
> +	}
> +

Please take this diff on top of this patch when adding this series to
-mm .

commit 613569d9517be60611a86bf4b9821b150c4c4954
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Mon Jul 24 22:49:29 2023 +0530

    powerpc/mm/altmap: Fix altmap boundary check
    
    altmap->free includes the entire free space from which altmap blocks
    can be allocated. So when checking whether the kernel is doing altmap
    block free, compute the boundary correctly.
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 7761c2e93bff..ed63c2953b54 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -766,8 +766,7 @@ static void __meminit free_vmemmap_pages(struct page *page,
 		 * used altmap.
 		 */
 		alt_start = altmap->base_pfn;
-		alt_end = altmap->base_pfn + altmap->reserve +
-			altmap->free + altmap->alloc + altmap->align;
+		alt_end = altmap->base_pfn + altmap->reserve + altmap->free;
 
 		if (base_pfn >= alt_start && base_pfn < alt_end) {
 			vmem_altmap_free(altmap, nr_pages);
