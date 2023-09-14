Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CB79F8CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:17:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T/RmXvPb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMvP3QLxz3dHH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T/RmXvPb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMgk09gvz3dFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:07:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694660850; x=1726196850;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hQLGmdNELjYMZnPnnmaVF9DnSi0UkgWqzZbEZVq1o/k=;
  b=T/RmXvPb3T9yQJqfVRcPAswmgau3k4FfgNnkMQfb8xKLF2QroAPFsVP5
   zmtEqkp5cerWUQCa4wPXjVakPtttnYCC5oLoh4Eh5iRIxI0BCAwKiCzwk
   M7ccTrB4o5BFn8CrGzllp3bdVX+8CsidoAE3uTconmG4rgk1I5v4BRPE6
   MNiuW6CHzgag0SrZFnvCNWh8Far9jVg6MQi0N6obfVOUuWtQxvopYs8BS
   xWcwGo1iIpap/4Xg7oQL/JsvdtC48UB3JbqSeQ9+Ek4M+nlQ8PnEVDdkI
   Phj564WejTY4fMAY2WmRshltvxAoukfgIHSlNRu/+tVCDXH9OpHeI0ECp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382644873"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="382644873"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747565104"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="747565104"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.8.84]) ([10.238.8.84])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:07:14 -0700
Message-ID: <54d3e6bf-d374-caa5-0920-bb2fe3b7595c@linux.intel.com>
Date: Thu, 14 Sep 2023 11:07:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for
 mmu_notifier_retry
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-3-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20230914015531.1419405-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliv
 er Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Currently in mmu_notifier invalidate path, hva range is recorded and
> then checked against by mmu_notifier_retry_hva() in the page fault
> handling path. However, for the to be introduced private memory, a page
> fault may not have a hva associated, checking gfn(gpa) makes more sense.
>
> For existing hva based shared memory, gfn is expected to also work. The
> only downside is when aliasing multiple gfns to a single hva, the
> current algorithm of checking multiple ranges could result in a much
> larger range being rejected. Such aliasing should be uncommon, so the
> impact is expected small.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> [sean: convert vmx_set_apic_access_page_addr() to gfn-based API]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c   | 10 ++++++----
>   arch/x86/kvm/vmx/vmx.c   | 11 +++++------
>   include/linux/kvm_host.h | 33 +++++++++++++++++++++------------
>   virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++++++++---------
>   4 files changed, 63 insertions(+), 31 deletions(-)
>
[...]
>   
> -void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
> -			      unsigned long end)
> +void kvm_mmu_invalidate_begin(struct kvm *kvm)
>   {
> +	lockdep_assert_held_write(&kvm->mmu_lock);
>   	/*
>   	 * The count increase must become visible at unlock time as no
>   	 * spte can be established without taking the mmu_lock and
>   	 * count is also read inside the mmu_lock critical section.
>   	 */
>   	kvm->mmu_invalidate_in_progress++;
> +
> +	if (likely(kvm->mmu_invalidate_in_progress == 1))
> +		kvm->mmu_invalidate_range_start = INVALID_GPA;
> +}
> +
> +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> +{
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
> +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> +
>   	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
>   		kvm->mmu_invalidate_range_start = start;
>   		kvm->mmu_invalidate_range_end = end;
> @@ -771,6 +781,12 @@ void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
>   	}
>   }
>   
> +static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> +	return kvm_unmap_gfn_range(kvm, range);
> +}
> +
>   static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>   					const struct mmu_notifier_range *range)
>   {
> @@ -778,7 +794,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>   	const struct kvm_mmu_notifier_range hva_range = {
>   		.start		= range->start,
>   		.end		= range->end,
> -		.handler	= kvm_unmap_gfn_range,
> +		.handler	= kvm_mmu_unmap_gfn_range,
>   		.on_lock	= kvm_mmu_invalidate_begin,
>   		.on_unlock	= kvm_arch_guest_memory_reclaimed,
>   		.flush_on_ret	= true,
> @@ -817,8 +833,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>   	return 0;
>   }
>   
> -void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
> -			    unsigned long end)
> +void kvm_mmu_invalidate_end(struct kvm *kvm)
>   {
>   	/*
>   	 * This sequence increase will notify the kvm page fault that
> @@ -833,6 +848,13 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
>   	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
>   	 */
>   	kvm->mmu_invalidate_in_progress--;
> +
> +	/*
> +	 * Assert that at least one range must be added between start() and
> +	 * end().  Not adding a range isn't fatal, but it is a KVM bug.
> +	 */
> +	WARN_ON_ONCE(kvm->mmu_invalidate_in_progress &&
> +		     kvm->mmu_invalidate_range_start == INVALID_GPA);
Should the check happen before the decrease of 
kvm->mmu_invalidate_in_progress?
Otherwise, KVM calls kvm_mmu_invalidate_begin(), then 
kvm_mmu_invalidate_end()
the check will not take effect.

>   }
>   
>   static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,

