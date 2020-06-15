Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1171F8C42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 04:19:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lZlT5n1hzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 12:19:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=baolu.lu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lZjs46hfzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 12:17:52 +1000 (AEST)
IronPort-SDR: PfBhlvPT/zWAF9Ldfjef5dAC8YooWZuMe1NF6/M1PhnpHY7AUE6z7HPgMms8uFUZSu/vHRHJiw
 4j9BJPVf/bvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2020 19:17:48 -0700
IronPort-SDR: Uob3CZWz0xNCSTRrbf7iB54YQSoy4usLaGVasoq/ksqhTs/VRiosycehEva16KGBqYrPirqqzE
 ar0CvARaiFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,513,1583222400"; d="scan'208";a="298321650"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2020 19:17:43 -0700
Subject: Re: [PATCH v2 11/12] x86/mmu: Allocate/free PASID
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan
 <ajd@linux.ibm.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@intel.com>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-12-git-send-email-fenghua.yu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <4d759c15-d539-cd1a-569d-eefa5fb6f039@linux.intel.com>
Date: Mon, 15 Jun 2020 10:13:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592008893-9388-12-git-send-email-fenghua.yu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Fenghua,

On 6/13/20 8:41 AM, Fenghua Yu wrote:
> A PASID is allocated for an "mm" the first time any thread attaches
> to an SVM capable device. Later device attachments (whether to the same
> device or another SVM device) will re-use the same PASID.
> 
> The PASID is freed when the process exits (so no need to keep
> reference counts on how many SVM devices are sharing the PASID).
> 
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> v2:
> - Define a helper free_bind() to simplify error exit code in bind_mm()
>    (Thomas)
> - Fix a ret error code in bind_mm() (Thomas)
> - Change pasid's type from "int" to "unsigned int" to have consistent
>    pasid type in iommu (Thomas)
> - Simplify alloc_pasid() a bit.
> 
>   arch/x86/include/asm/iommu.h       |   2 +
>   arch/x86/include/asm/mmu_context.h |  14 ++++
>   drivers/iommu/intel/svm.c          | 101 +++++++++++++++++++++++++----
>   3 files changed, 105 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
> index bf1ed2ddc74b..ed41259fe7ac 100644
> --- a/arch/x86/include/asm/iommu.h
> +++ b/arch/x86/include/asm/iommu.h
> @@ -26,4 +26,6 @@ arch_rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
>   	return -EINVAL;
>   }
>   
> +void __free_pasid(struct mm_struct *mm);
> +
>   #endif /* _ASM_X86_IOMMU_H */
> diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
> index 47562147e70b..f8c91ce8c451 100644
> --- a/arch/x86/include/asm/mmu_context.h
> +++ b/arch/x86/include/asm/mmu_context.h
> @@ -13,6 +13,7 @@
>   #include <asm/tlbflush.h>
>   #include <asm/paravirt.h>
>   #include <asm/debugreg.h>
> +#include <asm/iommu.h>
>   
>   extern atomic64_t last_mm_ctx_id;
>   
> @@ -117,9 +118,22 @@ static inline int init_new_context(struct task_struct *tsk,
>   	init_new_context_ldt(mm);
>   	return 0;
>   }
> +
> +static inline void free_pasid(struct mm_struct *mm)
> +{
> +	if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
> +		return;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_ENQCMD))
> +		return;
> +
> +	__free_pasid(mm);
> +}
> +
>   static inline void destroy_context(struct mm_struct *mm)
>   {
>   	destroy_context_ldt(mm);
> +	free_pasid(mm);
>   }
>   
>   extern void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index 4e775e12ae52..27dc866b8461 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -425,6 +425,53 @@ int intel_svm_unbind_gpasid(struct device *dev, unsigned int pasid)
>   	return ret;
>   }
>   
> +static void free_bind(struct intel_svm *svm, struct intel_svm_dev *sdev,
> +		      bool new_pasid)
> +{
> +	if (new_pasid)
> +		ioasid_free(svm->pasid);
> +	kfree(svm);
> +	kfree(sdev);
> +}
> +
> +/*
> + * If this mm already has a PASID, use it. Otherwise allocate a new one.
> + * Let the caller know if a new PASID is allocated via 'new_pasid'.
> + */
> +static int alloc_pasid(struct intel_svm *svm, struct mm_struct *mm,
> +		       unsigned int pasid_max, bool *new_pasid,
> +		       unsigned int flags)
> +{
> +	unsigned int pasid;
> +
> +	*new_pasid = false;
> +
> +	/*
> +	 * Reuse the PASID if the mm already has a PASID and not a private
> +	 * PASID is requested.
> +	 */
> +	if (mm && mm->pasid && !(flags & SVM_FLAG_PRIVATE_PASID)) {
> +		/*
> +		 * Once a PASID is allocated for this mm, the PASID
> +		 * stays with the mm until the mm is dropped. Reuse
> +		 * the PASID which has been already allocated for the
> +		 * mm instead of allocating a new one.
> +		 */
> +		ioasid_set_data(mm->pasid, svm);

How about adding some sanity checks here? For example,

	void *p = ioasid_find(NULL, mm->pasid, NULL);

	if (!p)
		ioasid_set_data(mm->pasid, svm);
	else if (IS_ERR(p) || p != svm)
		return INVALID_IOSASID;

Best regards,
baolu
