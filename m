Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E2BBD57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:51:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cc1Q0jstzDqL2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.143; helo=hqemgate14.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="fKsCi6zt"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbx273NjzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:47:34 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d892f650000>; Mon, 23 Sep 2019 13:47:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 13:47:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 23 Sep 2019 13:47:30 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:47:30 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:47:30 +0000
Subject: Re: [PATCH v2 08/11] powerpc/kvm/book3s_hv: Applies counting method
 to monitor lockless pgtbl walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-9-leonardo@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <fc70fc5f-0ac5-c130-6fe1-79c0e53fb91e@nvidia.com>
Date: Mon, 23 Sep 2019 13:47:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920195047.7703-9-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569271653; bh=IHM3F2XlUKmWaQXJYF0R/p+56a4vCvOzrVqC2PP6AGY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=fKsCi6ztnHOVBhvv/A1afC3ElFy3NMqGFzRGAHnf5BXVcvP8+EGogQwszIBYV3DGb
 M0b9ginHMsPk9vuuWuyy1nm0Gsz9XL64QegJwakPgggBX6MRKilAFqIVxGsbZyUOoK
 zrsYTaqvzxaWnu79OYCnjeCSNGGTTg+RTkqjsCjQW776LTFwW7wqiojqUKreK0/jqt
 fniQ7qa9vzlsCLpgKkERKWeAWUFDEqTaV6PmLyx+ydJ+d3u1fGs2tH/V2gbMqCEBqc
 k19mlmDcneERfdAm3PGhLm5bDU/mjl34PI6n56PQHgtA5kihY+adS3GN9FHa7rPb+1
 71lbHBWGX+1LQ==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
 Keith Busch <keith.busch@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/19 12:50 PM, Leonardo Bras wrote:
> Applies the counting-based method for monitoring all book3s_hv related
> functions that do lockless pagetable walks.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 8 ++++++++
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 9 ++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 735e0ac6f5b2..ed68e57af3a3 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -804,6 +804,7 @@ static void kvmhv_update_nest_rmap_rc(struct kvm *kvm, u64 n_rmap,
>  		return;
>  
>  	/* Find the pte */
> +	start_lockless_pgtbl_walk(kvm->mm);

Here, it appears that there is no disabling of interrupts, so now I'm not
sure anymore if this is going to work properly. Definitely needs some documentation
somewhere as to why this is OK, since the previous discussions don't apply
if the interrupts are left on.


thanks,
-- 
John Hubbard
NVIDIA

>  	ptep = __find_linux_pte(gp->shadow_pgtable, gpa, NULL, &shift);
>  	/*
>  	 * If the pte is present and the pfn is still the same, update the pte.
> @@ -815,6 +816,7 @@ static void kvmhv_update_nest_rmap_rc(struct kvm *kvm, u64 n_rmap,
>  		__radix_pte_update(ptep, clr, set);
>  		kvmppc_radix_tlbie_page(kvm, gpa, shift, lpid);
>  	}
> +	end_lockless_pgtbl_walk(kvm->mm);
>  }
>  
>  /*
> @@ -854,10 +856,12 @@ static void kvmhv_remove_nest_rmap(struct kvm *kvm, u64 n_rmap,
>  		return;
>  
>  	/* Find and invalidate the pte */
> +	start_lockless_pgtbl_walk(kvm->mm);
>  	ptep = __find_linux_pte(gp->shadow_pgtable, gpa, NULL, &shift);
>  	/* Don't spuriously invalidate ptes if the pfn has changed */
>  	if (ptep && pte_present(*ptep) && ((pte_val(*ptep) & mask) == hpa))
>  		kvmppc_unmap_pte(kvm, ptep, gpa, shift, NULL, gp->shadow_lpid);
> +	end_lockless_pgtbl_walk(kvm->mm);
>  }
>  
>  static void kvmhv_remove_nest_rmap_list(struct kvm *kvm, unsigned long *rmapp,
> @@ -921,6 +925,7 @@ static bool kvmhv_invalidate_shadow_pte(struct kvm_vcpu *vcpu,
>  	int shift;
>  
>  	spin_lock(&kvm->mmu_lock);
> +	start_lockless_pgtbl_walk(kvm->mm);
>  	ptep = __find_linux_pte(gp->shadow_pgtable, gpa, NULL, &shift);
>  	if (!shift)
>  		shift = PAGE_SHIFT;
> @@ -928,6 +933,7 @@ static bool kvmhv_invalidate_shadow_pte(struct kvm_vcpu *vcpu,
>  		kvmppc_unmap_pte(kvm, ptep, gpa, shift, NULL, gp->shadow_lpid);
>  		ret = true;
>  	}
> +	end_lockless_pgtbl_walk(kvm->mm);
>  	spin_unlock(&kvm->mmu_lock);
>  
>  	if (shift_ret)
> @@ -1362,11 +1368,13 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
>  	/* See if can find translation in our partition scoped tables for L1 */
>  	pte = __pte(0);
>  	spin_lock(&kvm->mmu_lock);
> +	start_lockless_pgtbl_walk(kvm->mm);
>  	pte_p = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
>  	if (!shift)
>  		shift = PAGE_SHIFT;
>  	if (pte_p)
>  		pte = *pte_p;
> +	end_lockless_pgtbl_walk(kvm->mm);
>  	spin_unlock(&kvm->mmu_lock);
>  
>  	if (!pte_present(pte) || (writing && !(pte_val(pte) & _PAGE_WRITE))) {
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> index 63e0ce91e29d..53ca67492211 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -258,6 +258,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
>  	 * If called in real mode we have MSR_EE = 0. Otherwise
>  	 * we disable irq above.
>  	 */
> +	start_lockless_pgtbl_walk(kvm->mm);
>  	ptep = __find_linux_pte(pgdir, hva, NULL, &hpage_shift);
>  	if (ptep) {
>  		pte_t pte;
> @@ -311,6 +312,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
>  		ptel &= ~(HPTE_R_W|HPTE_R_I|HPTE_R_G);
>  		ptel |= HPTE_R_M;
>  	}
> +	end_lockless_pgtbl_walk(kvm->mm);
>  
>  	/* Find and lock the HPTEG slot to use */
>   do_insert:
> @@ -886,10 +888,15 @@ static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long gpa,
>  	hva = __gfn_to_hva_memslot(memslot, gfn);
>  
>  	/* Try to find the host pte for that virtual address */
> +	start_lockless_pgtbl_walk(kvm->mm);
>  	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
> -	if (!ptep)
> +	if (!ptep) {
> +		end_lockless_pgtbl_walk(kvm->mm);
>  		return H_TOO_HARD;
> +	}
>  	pte = kvmppc_read_update_linux_pte(ptep, writing);
> +	end_lockless_pgtbl_walk(kvm->mm);
> +
>  	if (!pte_present(pte))
>  		return H_TOO_HARD;
>  
> 
