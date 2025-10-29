Return-Path: <linuxppc-dev+bounces-13488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF9C187E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 07:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxHch0lgQz3bf4;
	Wed, 29 Oct 2025 17:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761719891;
	cv=none; b=ojWur67qaw3AbsHJjKpwPYvbCII5/LEpuVn0lv+C8T4G3irxOfmv+7NitnhY7NNBztSsXH8SmS30Oilc+acoUZAqwHQtThpbDbwda5apwDGkXuTa28mOWmqp1yh1sYRtC7UxBAflvwpS8Y0E0eojC85yn6VTParK8/ecVi47TY6u/UnVASAOvi/cjNa3yqiklqGM/c+A7GLnpniwA9AsVK7JUvp0w+GpqtVLS3Nh761Dr0ZAos7XdVMUc6UAjwlpIFk/Iek3EYXv0Ep9hh3UxmF9wYBw9DrKlTpXz2uMhlvnns3R34slMlmlf86Cs8rWMfmcmIyRmf1NoAGCaHdV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761719891; c=relaxed/relaxed;
	bh=b8wTYakyYYGv8DE9O4+d7bWqzisPOemtKRNIS4+cn20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IthFfswHNINS5V/Xi/j/vxh6LYCJRdDKbmXnY7rIJjyecoBk70gj/kZrsVqa5/V7qtacjWHAVkK5JpYq7Vcfsfx5eeuwRpzCHolvZuzOFaQOtNLu0FsZ6CPUCCVxW+8xZwl2f5b9sXbHXotImxYJS7GRQZiL6oyCuVRtIK0oQLKBfU39EgIHjOKNSolrq7XfimQ/Olz7VgBMK6WQD61y5UMs40Sl9WwVv8DBLhPJtHthQbsyJAwHdnwCX54kBCuS7lnTIJZj061rMcghegc7dhuTKowHBzD/8ac4B84MsVXhh+Sr4mPe4Zfoi5L7mitv1e2jQAxDj+bh+y3XkLYL6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ieh3CNAv; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ieh3CNAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxHcd5DSSz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 17:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761719890; x=1793255890;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GQBcTt3q3jYhlQdBtZfxngxuplRCCGIsPQTXwR3o7QE=;
  b=ieh3CNAv5la7laOI0rkL4469Cf8iLeSn4A6472J6NMhwsNT99Cnt8p5U
   yMr+AYFgipLIMvchJrzSXcki6Q7trO8sVDB2tgqTf0VPPKuUjo/q5HS7b
   a7wzReCfs3pT/O1xRgaGxFhcfE1jUfO9NHS4ncW6O7bGZgNICvkSZ1oJp
   0KZ8jwsrUu8aSnkzjaBQa3A2CliLdEvmoW+pam03++fmg9FlXhC7O8Qqz
   iKSfFf9nVon3PzFCB5u8dffJlYzd3U2Ask504DzoLtcf/3GfyeA6S91bG
   M4su+n5JIYseNe8K0jnxrqvm7qbLpcdbtd1BJKORkn1b9Oo9dntntOyIN
   A==;
X-CSE-ConnectionGUID: KCgxYroMSs6XNdL7k6lWZg==
X-CSE-MsgGUID: vSQ+vTL7Ty6CAv/kqwXSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75278614"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="75278614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:38:05 -0700
X-CSE-ConnectionGUID: 8nQPxS3sQHujSGq7kBId9A==
X-CSE-MsgGUID: W9e750ZQTU6M5dFb3BxcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190701774"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:37:57 -0700
Message-ID: <71006f78-7afa-4821-8bd1-9cd5b8d62a33@linux.intel.com>
Date: Wed, 29 Oct 2025 14:37:55 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: seanjc@google.com, ackerleytng@google.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, chenhuacai@kernel.org,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, ira.weiny@intel.com,
 kai.huang@intel.com, kas@kernel.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, maddy@linux.ibm.com, maobibo@loongson.cn,
 maz@kernel.org, michael.roth@amd.com, oliver.upton@linux.dev,
 palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
 vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com,
 zhaotianrui@loongson.cn
References: <aP-1qlTkmFUgTld-@google.com>
 <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/28/2025 8:28 AM, Rick Edgecombe wrote:
> Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
> meeting contention during retries in some no-fail MMU paths.
>
> The TDX module takes various try-locks internally, which can cause
> SEAMCALLs to return an error code when contention is met. Dealing with
> an error in some of the MMU paths that make SEAMCALLs is not straight
> forward, so KVM takes steps to ensure that these will meet no contention
> during a single BUSY error retry. The whole scheme relies on KVM to take
> appropriate steps to avoid making any SEAMCALLs that could contend while
> the retry is happening.
>
> Unfortunately, there is a case where contention could be met if userspace
> does something unusual. Specifically, hole punching a gmem fd while
> initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().
>
> The resource being contended is called the "TDR resource" in TDX docs
> parlance. The tdh_vp_init() can take this resource as exclusive if the
> 'version' passed is 1, which happens to be version the kernel passes. The
> various MMU operations (tdh_mem_range_block(), tdh_mem_track() and
> tdh_mem_page_remove()) take it as shared.
>
> There isn't a KVM lock that maps conceptually and in a lock order friendly
> way to the TDR lock. So to minimize infrastructure, just take MMU lock
> around tdh_vp_init(). This makes the operations we care about mutually
> exclusive. Since the other operations are under a write mmu_lock, the code
> could just take the lock for read, however this is weirdly inverted from
> the actual underlying resource being contended. Since this is covering an
> edge case that shouldn't be hit in normal usage, be a little less weird
> and take the mmu_lock for write around the call.
>
> Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Hi,
>
> It was indeed awkward, as Sean must have sniffed. But seems ok enough to
> close the issue.
>
> Yan, can you give it a look?
>
> Posted here, but applies on top of this series.
>
> Thanks,
>
> Rick
> ---
>   arch/x86/kvm/vmx/tdx.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index daec88d4b88d..8bf5d2624152 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2938,9 +2938,18 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
>   		}
>   	}
>   
> -	err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
> -	if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
> -		return -EIO;
> +	/*
> +	 * tdh_vp_init() can take a exclusive lock of the TDR resource inside
                                   ^
                                   an

> +	 * the TDX module. This resource is also taken as shared in several
> +	 * no-fail MMU paths, which could return TDX_OPERAND_BUSY on contention.
> +	 * A read lock here would be enough to exclude the contention, but take
> +	 * a write lock to avoid the weird inversion.
Can we also add the description that the lock is trying to prevent an edge case
as in the change log if not too wordy?

> +	 */
> +	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
> +		err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
> +		if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
> +			return -EIO;
> +	}
>   
>   	vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
>   


