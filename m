Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244F20379F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 15:14:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r8xd4mYVzDqJ5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 23:13:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r8rd4ZypzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 23:09:37 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MD2Sqt105495
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 09:09:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31t02g2kxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 09:09:30 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05MD2d57106262
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 09:09:01 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31t02g2kfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 09:08:59 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MD5E4D000897;
 Mon, 22 Jun 2020 13:08:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 31sa38kmec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 13:08:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05MD81DZ53018914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 13:08:01 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C40A124052;
 Mon, 22 Jun 2020 13:08:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F6C1124053;
 Mon, 22 Jun 2020 13:07:59 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.210.147])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 13:07:58 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v0 5/5] powerpc/mm/radix: Remove split_kernel_mapping()
In-Reply-To: <20200406034925.22586-6-bharata@linux.ibm.com>
References: <20200406034925.22586-1-bharata@linux.ibm.com>
 <20200406034925.22586-6-bharata@linux.ibm.com>
Date: Mon, 22 Jun 2020 18:37:57 +0530
Message-ID: <87a70v45aq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_07:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 cotscore=-2147483648 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=2 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220098
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
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> With hot-plugged memory getting mapped with 2M mappings always,
> there will be no need to split any mappings during unplug.
>
> Hence remove split_kernel_mapping() and associated code. This
> essentially is a revert of
> commit 4dd5f8a99e791 ("powerpc/mm/radix: Split linear mapping on hot-unplug")
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 93 +++++-------------------
>  1 file changed, 19 insertions(+), 74 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 0d9ef3277579..56f2c698deac 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -15,7 +15,6 @@
>  #include <linux/mm.h>
>  #include <linux/hugetlb.h>
>  #include <linux/string_helpers.h>
> -#include <linux/stop_machine.h>
>  #include <linux/memory.h>
>  
>  #include <asm/pgtable.h>
> @@ -782,30 +781,6 @@ static void free_pud_table(pud_t *pud_start, pgd_t *pgd)
>  	pgd_clear(pgd);
>  }
>  
> -struct change_mapping_params {
> -	pte_t *pte;
> -	unsigned long start;
> -	unsigned long end;
> -	unsigned long aligned_start;
> -	unsigned long aligned_end;
> -};
> -
> -static int __meminit stop_machine_change_mapping(void *data)
> -{
> -	struct change_mapping_params *params =
> -			(struct change_mapping_params *)data;
> -
> -	if (!data)
> -		return -1;
> -
> -	spin_unlock(&init_mm.page_table_lock);
> -	pte_clear(&init_mm, params->aligned_start, params->pte);
> -	create_physical_mapping(__pa(params->aligned_start), __pa(params->start), -1);
> -	create_physical_mapping(__pa(params->end), __pa(params->aligned_end), -1);
> -	spin_lock(&init_mm.page_table_lock);
> -	return 0;
> -}
> -
>  static void remove_pte_table(pte_t *pte_start, unsigned long addr,
>  			     unsigned long end)
>  {
> @@ -834,52 +809,6 @@ static void remove_pte_table(pte_t *pte_start, unsigned long addr,
>  	}
>  }
>  
> -/*
> - * clear the pte and potentially split the mapping helper
> - */
> -static void __meminit split_kernel_mapping(unsigned long addr, unsigned long end,
> -				unsigned long size, pte_t *pte)
> -{
> -	unsigned long mask = ~(size - 1);
> -	unsigned long aligned_start = addr & mask;
> -	unsigned long aligned_end = addr + size;
> -	struct change_mapping_params params;
> -	bool split_region = false;
> -
> -	if ((end - addr) < size) {
> -		/*
> -		 * We're going to clear the PTE, but not flushed
> -		 * the mapping, time to remap and flush. The
> -		 * effects if visible outside the processor or
> -		 * if we are running in code close to the
> -		 * mapping we cleared, we are in trouble.
> -		 */
> -		if (overlaps_kernel_text(aligned_start, addr) ||
> -			overlaps_kernel_text(end, aligned_end)) {
> -			/*
> -			 * Hack, just return, don't pte_clear
> -			 */
> -			WARN_ONCE(1, "Linear mapping %lx->%lx overlaps kernel "
> -				  "text, not splitting\n", addr, end);
> -			return;
> -		}
> -		split_region = true;
> -	}
> -
> -	if (split_region) {
> -		params.pte = pte;
> -		params.start = addr;
> -		params.end = end;
> -		params.aligned_start = addr & ~(size - 1);
> -		params.aligned_end = min_t(unsigned long, aligned_end,
> -				(unsigned long)__va(memblock_end_of_DRAM()));
> -		stop_machine(stop_machine_change_mapping, &params, NULL);
> -		return;
> -	}
> -
> -	pte_clear(&init_mm, addr, pte);
> -}
> -
>  static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
>  			     unsigned long end)
>  {
> @@ -895,7 +824,12 @@ static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
>  			continue;
>  
>  		if (pmd_is_leaf(*pmd)) {
> -			split_kernel_mapping(addr, end, PMD_SIZE, (pte_t *)pmd);
> +			if (!IS_ALIGNED(addr, PMD_SIZE) ||
> +			    !IS_ALIGNED(next, PMD_SIZE)) {
> +				WARN_ONCE(1, "%s: unaligned range\n", __func__);
> +				continue;
> +			}
> +			pte_clear(&init_mm, addr, (pte_t *)pmd);
>  			continue;
>  		}
>  
> @@ -920,7 +854,12 @@ static void remove_pud_table(pud_t *pud_start, unsigned long addr,
>  			continue;
>  
>  		if (pud_is_leaf(*pud)) {
> -			split_kernel_mapping(addr, end, PUD_SIZE, (pte_t *)pud);
> +			if (!IS_ALIGNED(addr, PUD_SIZE) ||
> +			    !IS_ALIGNED(next, PUD_SIZE)) {
> +				WARN_ONCE(1, "%s: unaligned range\n", __func__);
> +				continue;
> +			}
> +			pte_clear(&init_mm, addr, (pte_t *)pud);
>  			continue;
>  		}
>  
> @@ -946,7 +885,13 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
>  			continue;
>  
>  		if (pgd_is_leaf(*pgd)) {
> -			split_kernel_mapping(addr, end, PGDIR_SIZE, (pte_t *)pgd);
> +			if (!IS_ALIGNED(addr, PGDIR_SIZE) ||
> +			    !IS_ALIGNED(next, PGDIR_SIZE)) {
> +				WARN_ONCE(1, "%s: unaligned range\n", __func__);
> +				continue;
> +			}
> +
> +			pte_clear(&init_mm, addr, (pte_t *)pgd);
>  			continue;
>  		}
>  
> -- 
> 2.21.0
