Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CBB20ED94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:31:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wtJj1xh2zDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:31:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtBv61p9zDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:26:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U53AMg142815
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:26:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycj9qa00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:26:44 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05U54VmS146966
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:26:44 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycj9q9ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:26:44 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U5PwDg024058;
 Tue, 30 Jun 2020 05:26:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 31wwr8tsa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:26:43 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U5QdZi17694984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:26:39 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FA2F136051;
 Tue, 30 Jun 2020 05:26:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8240113604F;
 Tue, 30 Jun 2020 05:26:40 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.48.28])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:26:40 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 3/3] powerpc/mm/book3s64/radix: Off-load TLB
 invalidations to host when !GTSE
In-Reply-To: <20200626131000.5207-4-bharata@linux.ibm.com>
References: <20200626131000.5207-1-bharata@linux.ibm.com>
 <20200626131000.5207-4-bharata@linux.ibm.com>
Date: Tue, 30 Jun 2020 10:56:38 +0530
Message-ID: <874kqtgm41.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 clxscore=1015 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300037
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
Cc: npiggin@gmail.com, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> From: Nicholas Piggin <npiggin@gmail.com>
>
> When platform doesn't support GTSE, let TLB invalidation requests
> for radix guests be off-loaded to the host using H_RPT_INVALIDATE
> hcall.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> 	[hcall wrapper, error path handling and renames]
> ---
>  .../include/asm/book3s/64/tlbflush-radix.h    | 15 ++++
>  arch/powerpc/include/asm/hvcall.h             | 34 +++++++-
>  arch/powerpc/include/asm/plpar_wrappers.h     | 50 +++++++++++
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 82 +++++++++++++++++--
>  4 files changed, 173 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> index ca8db193ae38..e7cf50358411 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -2,10 +2,25 @@
>  #ifndef _ASM_POWERPC_TLBFLUSH_RADIX_H
>  #define _ASM_POWERPC_TLBFLUSH_RADIX_H
>  
> +#include <asm/hvcall.h>
> +
>  struct vm_area_struct;
>  struct mm_struct;
>  struct mmu_gather;
>  
> +static inline u64 psize_to_h_rpti(unsigned long psize)
> +{
> +	if (psize == MMU_PAGE_4K)
> +		return H_RPTI_PAGE_4K;
> +	if (psize == MMU_PAGE_64K)
> +		return H_RPTI_PAGE_64K;
> +	if (psize == MMU_PAGE_2M)
> +		return H_RPTI_PAGE_2M;
> +	if (psize == MMU_PAGE_1G)
> +		return H_RPTI_PAGE_1G;
> +	return H_RPTI_PAGE_ALL;
> +}
> +
>  static inline int mmu_get_ap(int psize)
>  {
>  	return mmu_psize_defs[psize].ap;
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index e90c073e437e..43486e773bd6 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -305,7 +305,8 @@
>  #define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_HEALTH            0x400
>  #define H_SCM_PERFORMANCE_STATS 0x418
> -#define MAX_HCALL_OPCODE	H_SCM_PERFORMANCE_STATS
> +#define H_RPT_INVALIDATE	0x448
> +#define MAX_HCALL_OPCODE	H_RPT_INVALIDATE
>  
>  /* Scope args for H_SCM_UNBIND_ALL */
>  #define H_UNBIND_SCOPE_ALL (0x1)
> @@ -389,6 +390,37 @@
>  #define PROC_TABLE_RADIX	0x04
>  #define PROC_TABLE_GTSE		0x01
>  
> +/*
> + * Defines for
> + * H_RPT_INVALIDATE - Invalidate RPT translation lookaside information.
> + */
> +
> +/* Type of translation to invalidate (type) */
> +#define H_RPTI_TYPE_NESTED	0x0001	/* Invalidate nested guest partition-scope */
> +#define H_RPTI_TYPE_TLB		0x0002	/* Invalidate TLB */
> +#define H_RPTI_TYPE_PWC		0x0004	/* Invalidate Page Walk Cache */
> +/* Invalidate Process Table Entries if H_RPTI_TYPE_NESTED is clear */
> +#define H_RPTI_TYPE_PRT		0x0008
> +/* Invalidate Partition Table Entries if H_RPTI_TYPE_NESTED is set */
> +#define H_RPTI_TYPE_PAT		0x0008
> +#define H_RPTI_TYPE_ALL		(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
> +				 H_RPTI_TYPE_PRT)
> +#define H_RPTI_TYPE_NESTED_ALL	(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
> +				 H_RPTI_TYPE_PAT)
> +
> +/* Invalidation targets (target) */
> +#define H_RPTI_TARGET_CMMU		0x01 /* All virtual processors in the partition */
> +#define H_RPTI_TARGET_CMMU_LOCAL	0x02 /* Current virtual processor */
> +/* All nest/accelerator agents in use by the partition */
> +#define H_RPTI_TARGET_NMMU		0x04
> +
> +/* Page size mask (page sizes) */
> +#define H_RPTI_PAGE_4K	0x01
> +#define H_RPTI_PAGE_64K	0x02
> +#define H_RPTI_PAGE_2M	0x04
> +#define H_RPTI_PAGE_1G	0x08
> +#define H_RPTI_PAGE_ALL (-1UL)
> +
>  #ifndef __ASSEMBLY__
>  #include <linux/types.h>
>  
> diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
> index 4497c8afb573..a184923abd07 100644
> --- a/arch/powerpc/include/asm/plpar_wrappers.h
> +++ b/arch/powerpc/include/asm/plpar_wrappers.h
> @@ -334,6 +334,49 @@ static inline long plpar_get_cpu_characteristics(struct h_cpu_char_result *p)
>  	return rc;
>  }
>  
> +/*
> + * Wrapper to H_RPT_INVALIDATE hcall that handles return values appropriately
> + *
> + * - Returns H_SUCCESS on success
> + * - For H_BUSY return value, we retry the hcall.
> + * - For any other hcall failures, attempt a full flush once before
> + *   resorting to BUG().
> + *
> + * Note: This hcall is expected to fail only very rarely. The correct
> + * error recovery of killing the process/guest will be eventually
> + * needed.
> + */
> +static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 type,
> +					  u64 page_sizes, u64 start, u64 end)
> +{
> +	long rc;
> +	unsigned long all;
> +
> +	while (true) {
> +		rc = plpar_hcall_norets(H_RPT_INVALIDATE, pid, target, type,
> +					page_sizes, start, end);
> +		if (rc == H_BUSY) {
> +			cpu_relax();
> +			continue;
> +		} else if (rc == H_SUCCESS)
> +			return rc;
> +
> +		/* Flush request failed, try with a full flush once */
> +		all = (type & H_RPTI_TYPE_NESTED) ? H_RPTI_TYPE_NESTED_ALL :
> +		      H_RPTI_TYPE_ALL;
> +retry:
> +		rc = plpar_hcall_norets(H_RPT_INVALIDATE, pid, target,
> +					all, page_sizes, 0, -1UL);
> +		if (rc == H_BUSY) {
> +			cpu_relax();
> +			goto retry;
> +		} else if (rc == H_SUCCESS)
> +			return rc;
> +
> +		BUG();
> +	}
> +}
> +
>  #else /* !CONFIG_PPC_PSERIES */
>  
>  static inline long plpar_set_ciabr(unsigned long ciabr)
> @@ -346,6 +389,13 @@ static inline long plpar_pte_read_4(unsigned long flags, unsigned long ptex,
>  {
>  	return 0;
>  }
> +
> +static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 type,
> +					  u64 page_sizes, u64 start, u64 end)
> +{
> +	return 0;
> +}
> +
>  #endif /* CONFIG_PPC_PSERIES */
>  
>  #endif /* _ASM_POWERPC_PLPAR_WRAPPERS_H */
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index b5cc9b23cf02..180d8ddcf6e3 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -16,6 +16,7 @@
>  #include <asm/tlbflush.h>
>  #include <asm/trace.h>
>  #include <asm/cputhreads.h>
> +#include <asm/plpar_wrappers.h>
>  
>  #define RIC_FLUSH_TLB 0
>  #define RIC_FLUSH_PWC 1
> @@ -694,7 +695,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
>  			goto local;
>  		}
>  
> -		if (cputlb_use_tlbie()) {
> +		if (!mmu_has_feature(MMU_FTR_GTSE)) {
> +			unsigned long tgt = H_RPTI_TARGET_CMMU;
> +
> +			if (atomic_read(&mm->context.copros) > 0)
> +				tgt |= H_RPTI_TARGET_NMMU;
> +			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
> +					       H_RPTI_PAGE_ALL, 0, -1UL);
> +		} else if (cputlb_use_tlbie()) {
>  			if (mm_needs_flush_escalation(mm))
>  				_tlbie_pid(pid, RIC_FLUSH_ALL);
>  			else
> @@ -727,7 +735,16 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
>  				goto local;
>  			}
>  		}
> -		if (cputlb_use_tlbie())
> +		if (!mmu_has_feature(MMU_FTR_GTSE)) {
> +			unsigned long tgt = H_RPTI_TARGET_CMMU;
> +			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> +					     H_RPTI_TYPE_PRT;
> +
> +			if (atomic_read(&mm->context.copros) > 0)
> +				tgt |= H_RPTI_TARGET_NMMU;
> +			pseries_rpt_invalidate(pid, tgt, type,
> +					       H_RPTI_PAGE_ALL, 0, -1UL);
> +		} else if (cputlb_use_tlbie())
>  			_tlbie_pid(pid, RIC_FLUSH_ALL);
>  		else
>  			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
> @@ -760,7 +777,19 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
>  			exit_flush_lazy_tlbs(mm);
>  			goto local;
>  		}
> -		if (cputlb_use_tlbie())
> +		if (!mmu_has_feature(MMU_FTR_GTSE)) {
> +			unsigned long tgt, page_sizes, size;
> +
> +			tgt = H_RPTI_TARGET_CMMU;
> +			page_sizes = psize_to_h_rpti(psize);
> +			size = 1UL << mmu_psize_to_shift(psize);
> +
> +			if (atomic_read(&mm->context.copros) > 0)
> +				tgt |= H_RPTI_TARGET_NMMU;
> +			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
> +					       page_sizes, vmaddr,
> +					       vmaddr + size);
> +		} else if (cputlb_use_tlbie())
>  			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
>  		else
>  			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
> @@ -810,7 +839,14 @@ static inline void _tlbiel_kernel_broadcast(void)
>   */
>  void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
> -	if (cputlb_use_tlbie())
> +	if (!mmu_has_feature(MMU_FTR_GTSE)) {
> +		unsigned long tgt = H_RPTI_TARGET_CMMU | H_RPTI_TARGET_NMMU;
> +		unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> +				     H_RPTI_TYPE_PRT;
> +
> +		pseries_rpt_invalidate(0, tgt, type, H_RPTI_PAGE_ALL,
> +				       start, end);
> +	} else if (cputlb_use_tlbie())
>  		_tlbie_pid(0, RIC_FLUSH_ALL);
>  	else
>  		_tlbiel_kernel_broadcast();
> @@ -864,7 +900,17 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>  				nr_pages > tlb_local_single_page_flush_ceiling);
>  	}
>  
> -	if (full) {
> +	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
> +		unsigned long tgt = H_RPTI_TARGET_CMMU;
> +		unsigned long page_sizes = psize_to_h_rpti(mmu_virtual_psize);
> +
> +		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +			page_sizes |= psize_to_h_rpti(MMU_PAGE_2M);
> +		if (atomic_read(&mm->context.copros) > 0)
> +			tgt |= H_RPTI_TARGET_NMMU;
> +		pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB, page_sizes,
> +				       start, end);
> +	} else if (full) {
>  		if (local) {
>  			_tlbiel_pid(pid, RIC_FLUSH_TLB);
>  		} else {
> @@ -1046,7 +1092,17 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
>  				nr_pages > tlb_local_single_page_flush_ceiling);
>  	}
>  
> -	if (full) {
> +	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
> +		unsigned long tgt = H_RPTI_TARGET_CMMU;
> +		unsigned long type = H_RPTI_TYPE_TLB;
> +		unsigned long page_sizes = psize_to_h_rpti(psize);
> +
> +		if (also_pwc)
> +			type |= H_RPTI_TYPE_PWC;
> +		if (atomic_read(&mm->context.copros) > 0)
> +			tgt |= H_RPTI_TARGET_NMMU;
> +		pseries_rpt_invalidate(pid, tgt, type, page_sizes, start, end);
> +	} else if (full) {
>  		if (local) {
>  			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
>  		} else {
> @@ -1111,7 +1167,19 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
>  			exit_flush_lazy_tlbs(mm);
>  			goto local;
>  		}
> -		if (cputlb_use_tlbie())
> +		if (!mmu_has_feature(MMU_FTR_GTSE)) {
> +			unsigned long tgt, type, page_sizes;
> +
> +			tgt = H_RPTI_TARGET_CMMU;
> +			type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
> +			       H_RPTI_TYPE_PRT;
> +			page_sizes = psize_to_h_rpti(mmu_virtual_psize);
> +
> +			if (atomic_read(&mm->context.copros) > 0)
> +				tgt |= H_RPTI_TARGET_NMMU;
> +			pseries_rpt_invalidate(pid, tgt, type, page_sizes,
> +					       addr, end);
> +		} else if (cputlb_use_tlbie())
>  			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
>  		else
>  			_tlbiel_va_range_multicast(mm,
> -- 
> 2.21.3
