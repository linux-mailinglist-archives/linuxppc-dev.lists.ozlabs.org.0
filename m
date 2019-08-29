Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE939A1033
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 06:12:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jq233jwfzDrK0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 14:12:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sukadev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JnYh5Q2yzDrLw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 13:06:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T33Clu072857; Wed, 28 Aug 2019 23:05:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up69y88uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 23:05:56 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7T33svt078996;
 Wed, 28 Aug 2019 23:05:55 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up69y88tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 23:05:55 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7T34XEG009874;
 Thu, 29 Aug 2019 03:05:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 2ujvv6sxh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 03:05:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T35suR43385164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 03:05:54 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2594124053;
 Thu, 29 Aug 2019 03:05:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3FDE124052;
 Thu, 29 Aug 2019 03:05:53 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 03:05:53 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 41F4E2E10DA; Wed, 28 Aug 2019 20:05:52 -0700 (PDT)
Date: Wed, 28 Aug 2019 20:05:52 -0700
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 5/7] kvmppc: Radix changes for secure guest
Message-ID: <20190829030552.GA17673@us.ibm.com>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-6-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822102620.21897-6-bharata@linux.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290032
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> - After the guest becomes secure, when we handle a page fault of a page
>   belonging to SVM in HV, send that page to UV via UV_PAGE_IN.
> - Whenever a page is unmapped on the HV side, inform UV via UV_PAGE_INVAL.
> - Ensure all those routines that walk the secondary page tables of
>   the guest don't do so in case of secure VM. For secure guest, the
>   active secondary page tables are in secure memory and the secondary
>   page tables in HV are freed when guest becomes secure.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h       | 12 ++++++++++++
>  arch/powerpc/include/asm/ultravisor-api.h |  1 +
>  arch/powerpc/include/asm/ultravisor.h     |  5 +++++
>  arch/powerpc/kvm/book3s_64_mmu_radix.c    | 22 ++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_devm.c         | 20 ++++++++++++++++++++
>  5 files changed, 60 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 66e5cc8c9759..29333e8de1c4 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -867,6 +867,8 @@ static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
>  #ifdef CONFIG_PPC_UV
>  extern int kvmppc_devm_init(void);
>  extern void kvmppc_devm_free(void);
> +extern bool kvmppc_is_guest_secure(struct kvm *kvm);
> +extern int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gpa);
>  #else
>  static inline int kvmppc_devm_init(void)
>  {
> @@ -874,6 +876,16 @@ static inline int kvmppc_devm_init(void)
>  }
> 
>  static inline void kvmppc_devm_free(void) {}
> +
> +static inline bool kvmppc_is_guest_secure(struct kvm *kvm)
> +{
> +	return false;
> +}
> +
> +static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gpa)
> +{
> +	return -EFAULT;
> +}
>  #endif /* CONFIG_PPC_UV */
> 
>  #endif /* __POWERPC_KVM_HOST_H__ */
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> index 46b1ee381695..cf200d4ce703 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -29,5 +29,6 @@
>  #define UV_UNREGISTER_MEM_SLOT		0xF124
>  #define UV_PAGE_IN			0xF128
>  #define UV_PAGE_OUT			0xF12C
> +#define UV_PAGE_INVAL			0xF138
> 
>  #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
> index 719c0c3930b9..b333241bbe4c 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -57,4 +57,9 @@ static inline int uv_unregister_mem_slot(u64 lpid, u64 slotid)
>  	return ucall_norets(UV_UNREGISTER_MEM_SLOT, lpid, slotid);
>  }
> 
> +static inline int uv_page_inval(u64 lpid, u64 gpa, u64 page_shift)
> +{
> +	return ucall_norets(UV_PAGE_INVAL, lpid, gpa, page_shift);
> +}
> +
>  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> index 2d415c36a61d..93ad34e63045 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -19,6 +19,8 @@
>  #include <asm/pgtable.h>
>  #include <asm/pgalloc.h>
>  #include <asm/pte-walk.h>
> +#include <asm/ultravisor.h>
> +#include <asm/kvm_host.h>
> 
>  /*
>   * Supported radix tree geometry.
> @@ -915,6 +917,9 @@ int kvmppc_book3s_radix_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
>  	if (!(dsisr & DSISR_PRTABLE_FAULT))
>  		gpa |= ea & 0xfff;
> 
> +	if (kvmppc_is_guest_secure(kvm))
> +		return kvmppc_send_page_to_uv(kvm, gpa & PAGE_MASK);
> +
>  	/* Get the corresponding memslot */
>  	memslot = gfn_to_memslot(kvm, gfn);
> 
> @@ -972,6 +977,11 @@ int kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>  	unsigned long gpa = gfn << PAGE_SHIFT;
>  	unsigned int shift;
> 
> +	if (kvmppc_is_guest_secure(kvm)) {
> +		uv_page_inval(kvm->arch.lpid, gpa, PAGE_SIZE);
> +		return 0;
> +	}

If it is a page we share with UV, won't we need to drop the HV mapping
for the page?
> +
>  	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
>  	if (ptep && pte_present(*ptep))
>  		kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
> @@ -989,6 +999,9 @@ int kvm_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>  	int ref = 0;
>  	unsigned long old, *rmapp;
> 
> +	if (kvmppc_is_guest_secure(kvm))
> +		return ref;
> +
>  	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
>  	if (ptep && pte_present(*ptep) && pte_young(*ptep)) {
>  		old = kvmppc_radix_update_pte(kvm, ptep, _PAGE_ACCESSED, 0,
> @@ -1013,6 +1026,9 @@ int kvm_test_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>  	unsigned int shift;
>  	int ref = 0;
> 
> +	if (kvmppc_is_guest_secure(kvm))
> +		return ref;
> +
>  	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
>  	if (ptep && pte_present(*ptep) && pte_young(*ptep))
>  		ref = 1;
> @@ -1030,6 +1046,9 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
>  	int ret = 0;
>  	unsigned long old, *rmapp;
> 
> +	if (kvmppc_is_guest_secure(kvm))
> +		return ret;
> +
>  	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
>  	if (ptep && pte_present(*ptep) && pte_dirty(*ptep)) {
>  		ret = 1;
> @@ -1082,6 +1101,9 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
>  	unsigned long gpa;
>  	unsigned int shift;
> 
> +	if (kvmppc_is_guest_secure(kvm))
> +		return;
> +
>  	gpa = memslot->base_gfn << PAGE_SHIFT;
>  	spin_lock(&kvm->mmu_lock);
>  	for (n = memslot->npages; n; --n) {
> diff --git a/arch/powerpc/kvm/book3s_hv_devm.c b/arch/powerpc/kvm/book3s_hv_devm.c
> index 494495806407..19cfad340a51 100644
> --- a/arch/powerpc/kvm/book3s_hv_devm.c
> +++ b/arch/powerpc/kvm/book3s_hv_devm.c
> @@ -49,6 +49,11 @@ struct kvmppc_devm_page_pvt {
>  	bool skip_page_out;
>  };
> 
> +bool kvmppc_is_guest_secure(struct kvm *kvm)
> +{
> +	return !!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE);
> +}
> +
>  unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  {
>  	struct kvm_memslots *slots;
> @@ -453,6 +458,21 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
>  	return ret;
>  }
> 
> +int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gpa)
> +{
> +	unsigned long pfn;
> +	int ret;
> +
> +	pfn = gfn_to_pfn(kvm, gpa >> PAGE_SHIFT);
> +	if (is_error_noslot_pfn(pfn))
> +		return -EFAULT;
> +
> +	ret = uv_page_in(kvm->arch.lpid, pfn << PAGE_SHIFT, gpa, 0, PAGE_SHIFT);
> +	kvm_release_pfn_clean(pfn);
> +
> +	return (ret == U_SUCCESS) ? RESUME_GUEST : -EFAULT;
> +}
> +
>  static u64 kvmppc_get_secmem_size(void)
>  {
>  	struct device_node *np;
> -- 
> 2.21.0
