Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856863B72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 20:54:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45js1z3qZWzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 04:54:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=janani@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45js08437GzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 04:53:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69IpfSY114207
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jul 2019 14:53:06 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmx8cwh9j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 14:53:05 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <janani@linux.ibm.com>;
 Tue, 9 Jul 2019 19:53:04 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Jul 2019 19:53:02 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69Ir0gm55705936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 18:53:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E96EBE051;
 Tue,  9 Jul 2019 18:53:00 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12DE9BE04F;
 Tue,  9 Jul 2019 18:52:59 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jul 2019 18:52:59 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 09 Jul 2019 13:55:28 -0500
From: janani <janani@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 1/7] kvmppc: HMM backend driver to manage pages of
 secure guest
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190709102545.9187-2-bharata@linux.ibm.com>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-2-bharata@linux.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19070918-0016-0000-0000-000009CC269D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011401; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229807; UDB=6.00647710; IPR=6.01011066; 
 MB=3.00027655; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-09 18:53:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070918-0017-0000-0000-000043F3C6EE
Message-Id: <29e536f225036d2a93e653c56a961fcb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090222
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
Reply-To: janani@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-09 05:25, Bharata B Rao wrote:
> HMM driver for KVM PPC to manage page transitions of
> secure guest via H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> 
> H_SVM_PAGE_IN: Move the content of a normal page to secure page
> H_SVM_PAGE_OUT: Move the content of a secure page to normal page
> 
> Private ZONE_DEVICE memory equal to the amount of secure memory
> available in the platform for running secure guests is created
> via a HMM device. The movement of pages between normal and secure
> memory is done by ->alloc_and_copy() callback routine of migrate_vma().
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h         |   4 +
>  arch/powerpc/include/asm/kvm_book3s_hmm.h |  29 ++
>  arch/powerpc/include/asm/kvm_host.h       |  12 +
>  arch/powerpc/include/asm/ultravisor-api.h |   2 +
>  arch/powerpc/include/asm/ultravisor.h     |  17 +
>  arch/powerpc/kvm/Makefile                 |   3 +
>  arch/powerpc/kvm/book3s_hv.c              |  19 +
>  arch/powerpc/kvm/book3s_hv_hmm.c          | 482 ++++++++++++++++++++++
>  8 files changed, 568 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/kvm_book3s_hmm.h
>  create mode 100644 arch/powerpc/kvm/book3s_hv_hmm.c
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h
> b/arch/powerpc/include/asm/hvcall.h
> index 463c63a9fcf1..2f6b952deb0f 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -337,6 +337,10 @@
>  #define H_TLB_INVALIDATE	0xF808
>  #define H_COPY_TOFROM_GUEST	0xF80C
> 
> +/* Platform-specific hcalls used by the Ultravisor */
> +#define H_SVM_PAGE_IN		0xEF00
> +#define H_SVM_PAGE_OUT		0xEF04
> +
>  /* Values for 2nd argument to H_SET_MODE */
>  #define H_SET_MODE_RESOURCE_SET_CIABR		1
>  #define H_SET_MODE_RESOURCE_SET_DAWR		2
> diff --git a/arch/powerpc/include/asm/kvm_book3s_hmm.h
> b/arch/powerpc/include/asm/kvm_book3s_hmm.h
> new file mode 100644
> index 000000000000..21f3de5f2acb
> --- /dev/null
> +++ b/arch/powerpc/include/asm/kvm_book3s_hmm.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __POWERPC_KVM_PPC_HMM_H__
> +#define __POWERPC_KVM_PPC_HMM_H__
> +
> +#ifdef CONFIG_PPC_UV
> +extern unsigned long kvmppc_h_svm_page_in(struct kvm *kvm,
> +					  unsigned long gra,
> +					  unsigned long flags,
> +					  unsigned long page_shift);
> +extern unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
> +					  unsigned long gra,
> +					  unsigned long flags,
> +					  unsigned long page_shift);
> +#else
> +static inline unsigned long
> +kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gra,
> +		     unsigned long flags, unsigned long page_shift)
> +{
> +	return H_UNSUPPORTED;
> +}
> +
> +static inline unsigned long
> +kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gra,
> +		      unsigned long flags, unsigned long page_shift)
> +{
> +	return H_UNSUPPORTED;
> +}
> +#endif /* CONFIG_PPC_UV */
> +#endif /* __POWERPC_KVM_PPC_HMM_H__ */
> diff --git a/arch/powerpc/include/asm/kvm_host.h
> b/arch/powerpc/include/asm/kvm_host.h
> index 184becb62ea4..ac1a101beb07 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -858,4 +858,16 @@ static inline void kvm_arch_vcpu_blocking(struct
> kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) 
> {}
> 
> +#ifdef CONFIG_PPC_UV
> +extern int kvmppc_hmm_init(void);
> +extern void kvmppc_hmm_free(void);
> +#else
> +static inline int kvmppc_hmm_init(void)
> +{
> +	return 0;
> +}
> +
> +static inline void kvmppc_hmm_free(void) {}
> +#endif /* CONFIG_PPC_UV */
> +
>  #endif /* __POWERPC_KVM_HOST_H__ */
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h
> b/arch/powerpc/include/asm/ultravisor-api.h
> index 7c4d0b4ced12..f1c5800ac705 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -20,5 +20,7 @@
>  /* opcodes */
>  #define UV_WRITE_PATE			0xF104
>  #define UV_RETURN			0xF11C
> +#define UV_PAGE_IN			0xF128
> +#define UV_PAGE_OUT			0xF12C
> 
>  #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> diff --git a/arch/powerpc/include/asm/ultravisor.h
> b/arch/powerpc/include/asm/ultravisor.h
> index 996c1efd6c6d..16f8e0e8ec3f 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -44,6 +44,23 @@ static inline int uv_register_pate(u64 lpid, u64
> dw0, u64 dw1)
>  	return ucall(UV_WRITE_PATE, retbuf, lpid, dw0, dw1);
>  }
> 
> +static inline int uv_page_in(u64 lpid, u64 src_ra, u64 dst_gpa, u64 
> flags,
> +			     u64 page_shift)
> +{
> +	unsigned long retbuf[UCALL_BUFSIZE];
> +
> +	return ucall(UV_PAGE_IN, retbuf, lpid, src_ra, dst_gpa, flags,
> +		     page_shift);
> +}
> +
> +static inline int uv_page_out(u64 lpid, u64 dst_ra, u64 src_gpa, u64 
> flags,
> +			      u64 page_shift)
> +{
> +	unsigned long retbuf[UCALL_BUFSIZE];
> +
> +	return ucall(UV_PAGE_OUT, retbuf, lpid, dst_ra, src_gpa, flags,
> +		     page_shift);
> +}
>  #endif /* !__ASSEMBLY__ */
> 
>  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 4c67cc79de7c..d1a79fb5f806 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -71,6 +71,9 @@ kvm-hv-y += \
>  	book3s_64_mmu_radix.o \
>  	book3s_hv_nested.o
> 
> +kvm-hv-$(CONFIG_PPC_UV) += \
> +	book3s_hv_hmm.o
> +
>  kvm-hv-$(CONFIG_PPC_TRANSACTIONAL_MEM) += \
>  	book3s_hv_tm.o
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c 
> b/arch/powerpc/kvm/book3s_hv.c
> index a104743291a9..8ee66aa0da58 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -75,6 +75,8 @@
>  #include <asm/xics.h>
>  #include <asm/xive.h>
>  #include <asm/hw_breakpoint.h>
> +#include <asm/kvm_host.h>
> +#include <asm/kvm_book3s_hmm.h>
> 
>  #include "book3s.h"
> 
> @@ -1083,6 +1085,18 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu 
> *vcpu)
>  					 kvmppc_get_gpr(vcpu, 5),
>  					 kvmppc_get_gpr(vcpu, 6));
>  		break;
> +	case H_SVM_PAGE_IN:
> +		ret = kvmppc_h_svm_page_in(vcpu->kvm,
> +					   kvmppc_get_gpr(vcpu, 4),
> +					   kvmppc_get_gpr(vcpu, 5),
> +					   kvmppc_get_gpr(vcpu, 6));
> +		break;
> +	case H_SVM_PAGE_OUT:
> +		ret = kvmppc_h_svm_page_out(vcpu->kvm,
> +					    kvmppc_get_gpr(vcpu, 4),
> +					    kvmppc_get_gpr(vcpu, 5),
> +					    kvmppc_get_gpr(vcpu, 6));
> +		break;
>  	default:
>  		return RESUME_HOST;
>  	}
> @@ -5501,11 +5515,16 @@ static int kvmppc_book3s_init_hv(void)
>  			no_mixing_hpt_and_radix = true;
>  	}
> 
> +	r = kvmppc_hmm_init();
> +	if (r < 0)
> +		pr_err("KVM-HV: kvmppc_hmm_init failed %d\n", r);
> +
>  	return r;
>  }
> 
>  static void kvmppc_book3s_exit_hv(void)
>  {
> +	kvmppc_hmm_free();
>  	kvmppc_free_host_rm_ops();
>  	if (kvmppc_radix_possible())
>  		kvmppc_radix_exit();
> diff --git a/arch/powerpc/kvm/book3s_hv_hmm.c 
> b/arch/powerpc/kvm/book3s_hv_hmm.c
> new file mode 100644
> index 000000000000..cd34323888b6
> --- /dev/null
> +++ b/arch/powerpc/kvm/book3s_hv_hmm.c
> @@ -0,0 +1,482 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * HMM driver to manage page migration between normal and secure
> + * memory.
> + *
> + * Based on Jérôme Glisse's HMM dummy driver.
> + *
> + * Copyright 2018 Bharata B Rao, IBM Corp. <bharata@linux.ibm.com>
> + */
> +
> +/*
> + * A pseries guest can be run as a secure guest on Ultravisor-enabled
> + * POWER platforms. On such platforms, this driver will be used to 
> manage
> + * the movement of guest pages between the normal memory managed by
> + * hypervisor (HV) and secure memory managed by Ultravisor (UV).
> + *
> + * Private ZONE_DEVICE memory equal to the amount of secure memory
> + * available in the platform for running secure guests is created
> + * via a HMM device. The movement of pages between normal and secure
> + * memory is done by ->alloc_and_copy() callback routine of 
> migrate_vma().
> + *
> + * The page-in or page-out requests from UV will come to HV as hcalls 
> and
> + * HV will call back into UV via uvcalls to satisfy these page 
> requests.
> + *
> + * For each page that gets moved into secure memory, a HMM PFN is used
> + * on the HV side and HMM migration PTE corresponding to that PFN 
> would be
> + * populated in the QEMU page tables. HMM PFNs are stored in the rmap
> + * array. Whenever a guest page becomes secure, HMM PFN allocated for
> + * the same will be populated in the corresponding slot in the rmap
> + * array. The overloading of rmap array's usage which otherwise is
> + * used primarily by HPT guests means that this feature (secure
> + * guest on PEF platforms) is available only for Radix MMU guests.
> + * Also the same rmap array is used differently by nested HPT guests.
> + * Hence a secure guest can't have nested guests.
> + */
> +
> +#include <linux/hmm.h>
> +#include <linux/kvm_host.h>
> +#include <linux/sched/mm.h>
> +#include <asm/ultravisor.h>
> +
> +struct kvmppc_hmm_device {
> +	struct hmm_device *device;
> +	struct hmm_devmem *devmem;
> +	unsigned long *pfn_bitmap;
> +};
> +
> +static struct kvmppc_hmm_device kvmppc_hmm;
> +spinlock_t kvmppc_hmm_lock;
> +
> +struct kvmppc_hmm_page_pvt {
> +	unsigned long *rmap;
> +	unsigned int lpid;
> +	unsigned long gpa;
> +};
> +
> +struct kvmppc_hmm_migrate_args {
> +	unsigned long *rmap;
> +	unsigned int lpid;
> +	unsigned long gpa;
> +	unsigned long page_shift;
> +};
> +
> +/*
> + * Bits 60:56 in the rmap entry will be used to identify the
> + * different uses/functions of rmap. This definition with move
> + * to a proper header when all other functions are defined.
> + */
> +#define KVMPPC_PFN_HMM		(0x2ULL << 56)
> +
> +static inline bool kvmppc_is_hmm_pfn(unsigned long pfn)
> +{
> +	return !!(pfn & KVMPPC_PFN_HMM);
> +}
> +
> +/*
> + * Get a free HMM PFN from the pool
> + *
> + * Called when a normal page is moved to secure memory (UV_PAGE_IN). 
> HMM
> + * PFN will be used to keep track of the secure page on HV side.
> + *
> + * @rmap here is the slot in the rmap array that corresponds to @gpa.
> + * Thus a non-zero rmap entry indicates that the corresonding guest
> + * page has become secure, is not mapped on the HV side.
> + *
> + * NOTE: In this and subsequent functions, we pass around and access
> + * individual elements of kvm_memory_slot->arch.rmap[] without any
> + * protection. Should we use lock_rmap() here?
> + */
> +static struct page *kvmppc_hmm_get_page(unsigned long *rmap,
> +					unsigned long gpa, unsigned int lpid)
> +{
> +	struct page *dpage = NULL;
> +	unsigned long bit, hmm_pfn;
> +	unsigned long nr_pfns = kvmppc_hmm.devmem->pfn_last -
> +				kvmppc_hmm.devmem->pfn_first;
> +	unsigned long flags;
> +	struct kvmppc_hmm_page_pvt *pvt;
> +
> +	if (kvmppc_is_hmm_pfn(*rmap))
> +		return NULL;
> +
> +	spin_lock_irqsave(&kvmppc_hmm_lock, flags);
> +	bit = find_first_zero_bit(kvmppc_hmm.pfn_bitmap, nr_pfns);
> +	if (bit >= nr_pfns)
> +		goto out;
> +
> +	bitmap_set(kvmppc_hmm.pfn_bitmap, bit, 1);
> +	hmm_pfn = bit + kvmppc_hmm.devmem->pfn_first;
> +	dpage = pfn_to_page(hmm_pfn);
> +
> +	if (!trylock_page(dpage))
> +		goto out_clear;
> +
> +	*rmap = hmm_pfn | KVMPPC_PFN_HMM;
> +	pvt = kzalloc(sizeof(*pvt), GFP_ATOMIC);
> +	if (!pvt)
> +		goto out_unlock;
> +	pvt->rmap = rmap;
> +	pvt->gpa = gpa;
> +	pvt->lpid = lpid;
> +	hmm_devmem_page_set_drvdata(dpage, (unsigned long)pvt);
> +	spin_unlock_irqrestore(&kvmppc_hmm_lock, flags);
> +
> +	get_page(dpage);
> +	return dpage;
> +
> +out_unlock:
> +	unlock_page(dpage);
> +out_clear:
> +	bitmap_clear(kvmppc_hmm.pfn_bitmap,
> +		     hmm_pfn - kvmppc_hmm.devmem->pfn_first, 1);
> +out:
> +	spin_unlock_irqrestore(&kvmppc_hmm_lock, flags);
> +	return NULL;
> +}
> +
> +/*
> + * Release the HMM PFN back to the pool
> + *
> + * Called when secure page becomes a normal page during UV_PAGE_OUT.
> + */
> +static void kvmppc_hmm_put_page(struct page *page)
> +{
> +	unsigned long pfn = page_to_pfn(page);
> +	unsigned long flags;
> +	struct kvmppc_hmm_page_pvt *pvt;
> +
> +	spin_lock_irqsave(&kvmppc_hmm_lock, flags);
> +	pvt = (struct kvmppc_hmm_page_pvt 
> *)hmm_devmem_page_get_drvdata(page);
> +	hmm_devmem_page_set_drvdata(page, 0);
> +
> +	bitmap_clear(kvmppc_hmm.pfn_bitmap,
> +		     pfn - kvmppc_hmm.devmem->pfn_first, 1);
> +	*(pvt->rmap) = 0;
> +	spin_unlock_irqrestore(&kvmppc_hmm_lock, flags);
> +	kfree(pvt);
> +}
> +
> +/*
> + * migrate_vma() callback to move page from normal memory to secure 
> memory.
> + *
> + * We don't capture the return value of uv_page_in() here because when
> + * UV asks for a page and then fails to copy it over, we don't care.
> + */
> +static void
> +kvmppc_hmm_migrate_alloc_and_copy(struct vm_area_struct *vma,
> +				  const unsigned long *src_pfn,
> +				  unsigned long *dst_pfn,
> +				  unsigned long start,
> +				  unsigned long end,
> +				  void *private)
> +{
> +	struct kvmppc_hmm_migrate_args *args = private;
> +	struct page *spage = migrate_pfn_to_page(*src_pfn);
> +	unsigned long pfn = *src_pfn >> MIGRATE_PFN_SHIFT;
> +	struct page *dpage;
> +
> +	*dst_pfn = 0;
> +	if (!(*src_pfn & MIGRATE_PFN_MIGRATE))
> +		return;
> +
> +	dpage = kvmppc_hmm_get_page(args->rmap, args->gpa, args->lpid);
> +	if (!dpage)
> +		return;
> +
> +	if (spage)
> +		uv_page_in(args->lpid, pfn << args->page_shift,
> +			   args->gpa, 0, args->page_shift);
> +
> +	*dst_pfn = migrate_pfn(page_to_pfn(dpage)) |
> +		    MIGRATE_PFN_DEVICE | MIGRATE_PFN_LOCKED;
> +}
> +
> +/*
> + * This migrate_vma() callback is typically used to updated device
> + * page tables after successful migration. We have nothing to do here.
> + *
> + * Also as we don't care if UV successfully copied over the page in
> + * kvmppc_hmm_migrate_alloc_and_copy(), we don't bother to check
> + * dst_pfn for any errors here.
> + */
> +static void
> +kvmppc_hmm_migrate_finalize_and_map(struct vm_area_struct *vma,
> +				    const unsigned long *src_pfn,
> +				    const unsigned long *dst_pfn,
> +				    unsigned long start,
> +				    unsigned long end,
> +				    void *private)
> +{
> +}
> +
> +static const struct migrate_vma_ops kvmppc_hmm_migrate_ops = {
> +	.alloc_and_copy = kvmppc_hmm_migrate_alloc_and_copy,
> +	.finalize_and_map = kvmppc_hmm_migrate_finalize_and_map,
> +};
> +
> +/*
> + * Move page from normal memory to secure memory.
> + */
> +unsigned long
> +kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> +		     unsigned long flags, unsigned long page_shift)
> +{
> +	unsigned long addr, end;
> +	unsigned long src_pfn, dst_pfn;
> +	struct kvmppc_hmm_migrate_args args;
> +	struct vm_area_struct *vma;
> +	int srcu_idx;
> +	unsigned long gfn = gpa >> page_shift;
> +	struct kvm_memory_slot *slot;
> +	unsigned long *rmap;
> +	int ret = H_SUCCESS;
> +
> +	if (page_shift != PAGE_SHIFT)
> +		return H_P3;
> +
> +	if (flags)
> +		return H_P2;
> +
> +	down_read(&kvm->mm->mmap_sem);
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slot = gfn_to_memslot(kvm, gfn);
> +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> +	if (kvm_is_error_hva(addr)) {
> +		ret = H_PARAMETER;
> +		goto out;
> +	}
> +
> +	end = addr + (1UL << page_shift);
> +	vma = find_vma_intersection(kvm->mm, addr, end);
> +	if (!vma || vma->vm_start > addr || vma->vm_end < end) {
> +		ret = H_PARAMETER;
> +		goto out;
> +	}
> +
> +	args.rmap = rmap;
> +	args.lpid = kvm->arch.lpid;
> +	args.gpa = gpa;
> +	args.page_shift = page_shift;
> +	ret = migrate_vma(&kvmppc_hmm_migrate_ops, vma, addr, end,
> +			  &src_pfn, &dst_pfn, &args);
> +	if (ret < 0)
> +		ret = H_PARAMETER;
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	up_read(&kvm->mm->mmap_sem);
> +	return ret;
> +}
> +
> +/*
> + * We drop the HMM PFN here, provision a new page and populate
> + * the same in QEMU page tables.
> + */
> +static void
> +kvmppc_hmm_fault_migrate_alloc_and_copy(struct vm_area_struct *vma,
> +					const unsigned long *src_pfn,
> +					unsigned long *dst_pfn,
> +					unsigned long start,
> +					unsigned long end,
> +					void *private)
> +{
> +	struct page *dpage, *spage;
> +	struct kvmppc_hmm_page_pvt *pvt;
> +	unsigned long pfn;
> +	int ret = U_SUCCESS;
> +
> +	*dst_pfn = MIGRATE_PFN_ERROR;
> +	spage = migrate_pfn_to_page(*src_pfn);
> +	if (!spage || !(*src_pfn & MIGRATE_PFN_MIGRATE))
> +		return;
> +	if (!is_zone_device_page(spage))
> +		return;
> +	dpage = hmm_vma_alloc_locked_page(vma, start);
> +	if (!dpage)
> +		return;
> +	pvt = (struct kvmppc_hmm_page_pvt *)
> +	       hmm_devmem_page_get_drvdata(spage);
> +
> +	pfn = page_to_pfn(dpage);
> +	ret = uv_page_out(pvt->lpid, pfn << PAGE_SHIFT,
> +			  pvt->gpa, 0, PAGE_SHIFT);
> +	if (ret == U_SUCCESS)
> +		*dst_pfn = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> +}
> +
> +/*
> + * We have nothing to do here.
> + */
> +static void
> +kvmppc_hmm_fault_migrate_finalize_and_map(struct vm_area_struct *vma,
> +					  const unsigned long *src_pfn,
> +					  const unsigned long *dst_pfn,
> +					  unsigned long start,
> +					  unsigned long end,
> +					  void *private)
> +{
> +}
> +
> +static const struct migrate_vma_ops kvmppc_hmm_fault_migrate_ops = {
> +	.alloc_and_copy = kvmppc_hmm_fault_migrate_alloc_and_copy,
> +	.finalize_and_map = kvmppc_hmm_fault_migrate_finalize_and_map,
> +};
> +
> +/*
> + * Fault handler callback when HV touches any page that has been
> + * moved to secure memory, we ask UV to give back the page by
> + * issuing a UV_PAGE_OUT uvcall.
> + */
> +static vm_fault_t kvmppc_hmm_devmem_fault(struct hmm_devmem *devmem,
> +					  struct vm_area_struct *vma,
> +					  unsigned long addr,
> +					  const struct page *page,
> +					  unsigned int flags,
> +					  pmd_t *pmdp)
> +{
> +	unsigned long end = addr + PAGE_SIZE;
> +	unsigned long src_pfn, dst_pfn = 0;
> +
> +	if (migrate_vma(&kvmppc_hmm_fault_migrate_ops, vma, addr, end,
> +			&src_pfn, &dst_pfn, NULL))
> +		return VM_FAULT_SIGBUS;
> +	if (dst_pfn == MIGRATE_PFN_ERROR)
> +		return VM_FAULT_SIGBUS;
> +	return 0;
> +}
> +
> +static void kvmppc_hmm_devmem_free(struct hmm_devmem *devmem,
> +				   struct page *page)
> +{
> +	kvmppc_hmm_put_page(page);
> +}
> +
> +static const struct hmm_devmem_ops kvmppc_hmm_devmem_ops = {
> +	.free = kvmppc_hmm_devmem_free,
> +	.fault = kvmppc_hmm_devmem_fault,
> +};
> +
> +/*
> + * Move page from secure memory to normal memory.
> + */
> +unsigned long
> +kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
> +		      unsigned long flags, unsigned long page_shift)
> +{
> +	unsigned long addr, end;
> +	struct vm_area_struct *vma;
> +	unsigned long src_pfn, dst_pfn = 0;
> +	int srcu_idx;
> +	int ret = H_SUCCESS;
> +
> +	if (page_shift != PAGE_SHIFT)
> +		return H_P3;
> +
> +	if (flags)
> +		return H_P2;
> +
> +	down_read(&kvm->mm->mmap_sem);
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> +	if (kvm_is_error_hva(addr)) {
> +		ret = H_PARAMETER;
> +		goto out;
> +	}
> +
> +	end = addr + (1UL << page_shift);
> +	vma = find_vma_intersection(kvm->mm, addr, end);
> +	if (!vma || vma->vm_start > addr || vma->vm_end < end) {
> +		ret = H_PARAMETER;
> +		goto out;
> +	}
> +	ret = migrate_vma(&kvmppc_hmm_fault_migrate_ops, vma, addr, end,
> +			  &src_pfn, &dst_pfn, NULL);
> +	if (ret < 0)
> +		ret = H_PARAMETER;
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	up_read(&kvm->mm->mmap_sem);
> +	return ret;
> +}
> +
> +static u64 kvmppc_get_secmem_size(void)
> +{
> +	struct device_node *np;
> +	int i, len;
> +	const __be32 *prop;
> +	u64 size = 0;
> +
> +	np = of_find_node_by_path("/ibm,ultravisor/ibm,uv-firmware");
> +	if (!np)
> +		goto out;
> +
> +	prop = of_get_property(np, "secure-memory-ranges", &len);
> +	if (!prop)
> +		goto out_put;
> +
> +	for (i = 0; i < len / (sizeof(*prop) * 4); i++)
> +		size += of_read_number(prop + (i * 4) + 2, 2);
> +
> +out_put:
> +	of_node_put(np);
> +out:
> +	return size;
> +}
> +
> +static int kvmppc_hmm_pages_init(void)
> +{
> +	unsigned long nr_pfns = kvmppc_hmm.devmem->pfn_last -
> +				kvmppc_hmm.devmem->pfn_first;
> +
> +	kvmppc_hmm.pfn_bitmap = kcalloc(BITS_TO_LONGS(nr_pfns),
> +					 sizeof(unsigned long), GFP_KERNEL);
> +	if (!kvmppc_hmm.pfn_bitmap)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&kvmppc_hmm_lock);
> +
> +	return 0;
> +}
> +
> +int kvmppc_hmm_init(void)
> +{
> +	int ret = 0;
> +	unsigned long size;
> +
> +	size = kvmppc_get_secmem_size();
> +	if (!size) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	kvmppc_hmm.device = hmm_device_new(NULL);
> +	if (IS_ERR(kvmppc_hmm.device)) {
> +		ret = PTR_ERR(kvmppc_hmm.device);
> +		goto out;
> +	}
> +
> +	kvmppc_hmm.devmem = hmm_devmem_add(&kvmppc_hmm_devmem_ops,
> +					   &kvmppc_hmm.device->device, size);
> +	if (IS_ERR(kvmppc_hmm.devmem)) {
> +		ret = PTR_ERR(kvmppc_hmm.devmem);
> +		goto out_device;
> +	}
> +	ret = kvmppc_hmm_pages_init();
> +	if (ret < 0)
> +		goto out_device;
> +
> +	pr_info("KVMPPC-HMM: Secure Memory size 0x%lx\n", size);
> +	return ret;
> +
> +out_device:
> +	hmm_device_put(kvmppc_hmm.device);
> +out:
> +	return ret;
> +}
> +
> +void kvmppc_hmm_free(void)
> +{
> +	kfree(kvmppc_hmm.pfn_bitmap);
> +	hmm_device_put(kvmppc_hmm.device);
> +}

