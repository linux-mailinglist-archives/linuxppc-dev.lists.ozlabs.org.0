Return-Path: <linuxppc-dev+bounces-13713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F5C2F6C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 07:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0ysf07HRz3bd8;
	Tue,  4 Nov 2025 17:17:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762237029;
	cv=none; b=LIR8paOaVI9vEUjFxQrHVNtmbcwMYpmwWSrmY1xsVNFg5sLeCWvuLPqz+sPTsb0GAGuL7ThazmPM0Cny7riJ7TBdJTVMzt2IxxhHRPDKnoTD+nvqFR0vWyuRPusVR3Y54wQsL3Xcyw6SHSHLnSXs4SDzfiT3DS18GYkA11WDnEiZghwYHmCd8Kbj+Ys4/4bakdS9FX2FWGCQJZzKLmWoBmuhUtKYs/yt6iX314WAgFyedB77hgTkCBbZ5RHvfgcfnq/AHlgo8ew8w+iniPfWbUFWD1tAQ8BujcHlQsAIawJxIvo3QH6UZ/VXHFXWwuSYZD6M0CjajY3UhbLeyVjiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762237029; c=relaxed/relaxed;
	bh=czD4HOm37Sn6UenIYCgK3Nv6nS3pHMMOXjFgZv3UY6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjnIN6sE48YgMhKlngvrQaaJ/A5tw6c9HktS6QdXPO86r6Rlb7WEko3ZuHPlKgJLT+lDizdPakzruHmIi6DcUJC5T5q+ctVIpoPOdMNF5suEqHpfScJhgoZd6Xi0P9Ww1MedAYAgD9xsCqy2/3QIwAJtRAYkV72dDGHl3IkwApkN4UxiPBE/3iY2LhcwCg8ZmhI+GfUOr6oP9k85/kDne8V15PdTnkoa8SnoxQqFS5zaXsJqurs8L0eN3tThLmg0/MWCBbMtLL3ozSE0blwdfDk1K0yQofQu20XNpA3mBTRtqd3zGR+58vo630DFAk+PPlsGNoeryw6iSwORjoQEzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0gmS4rZ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0gmS4rZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0ysb0zlNz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 17:17:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762237027; x=1793773027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mSKoZmGkcXW407B8mNGjY9EejInAopsSE39gAyEUn9k=;
  b=K0gmS4rZQ4X+g0OLlFsRRUqldI1N2fLP97IXGSmAsfOcsS31GbCSPsXp
   g8mkLDhsiZ+pudDbd18TAPwoWenX+yRcYXm6QWryHnl9q1dx8vZSiJB5K
   Oi+Kh5NbdGne7XJKjOEAMvMTsNWffoDTsf7Z0C/LlNW9AIr8PJKbawhlz
   I6lHxFiXmJi2R1CSsa+BcclrS4VeLoNXFGr+NbuM1K1lZKvkskuR953P1
   gbnfpr+iZEFO2TF7v0IPi9hKXvZvHvXBNEkDQJrXX2IgfprHy2jnCMC5F
   JkwrWkNdD0aHrP4RC7TAE+dMxjVx0dAtbYLQgGP9HZdDfNcIQmatXxAX2
   g==;
X-CSE-ConnectionGUID: nkReP/kRR0u1L9lwUFaw0w==
X-CSE-MsgGUID: TDVaYOT3RYqPafmvn9Cc5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64021040"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64021040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:17:03 -0800
X-CSE-ConnectionGUID: IL8VAT68RkmI5IbPyY1fNw==
X-CSE-MsgGUID: u8bxLoPYS/KxoreV4M7Dmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="210576877"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:16:56 -0800
Message-ID: <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Date: Tue, 4 Nov 2025 14:16:53 +0800
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
Subject: Re: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-28-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-28-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> measurement should fail if and only if there is a KVM bug, or if the S-EPT
> mapping is invalid.  Now that KVM makes all state transitions mutually
> exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
> mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
> tdh_mr_extend().
>
> Holding slots_lock prevents zaps due to memslot updates,
> filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
> VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
> usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
> can be used for the initial image.
>
> For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
> exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
> for kvm_noncoherent_dma_assignment_start_or_stop(), and
> __kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
> VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot

Nit:
It sounds like TDX is using the memslot for the APIC page, but for a TD, the
memslot for the APIC page is never initialized or used?

> and so can't be used for the initial image, which means that too is
> mutually exclusive irrespective of locking).
>
> Opportunistically return early if the region doesn't need to be measured
> in order to reduce line lengths and avoid wraps.  Similarly, immediately
> and explicitly return if TDH_MR_EXTEND fails to make it clear that KVM
> needs to bail entirely if extending the measurement fails.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 8bcdec049ac6..762f2896547f 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3123,21 +3123,23 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>   
>   	put_page(src_page);
>   
> -	if (ret)
> +	if (ret || !(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
>   		return ret;
>   
> -	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
> -		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
> -			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
> -					    &level_state);
> -			if (err) {
> -				ret = -EIO;
> -				break;
> -			}
> -		}
> +	/*
> +	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
> +	 * between mapping the pfn and now, but slots_lock prevents memslot
> +	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
> +	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
> +	 * zapping flows are mutually exclusive with S-EPT mappings.
> +	 */
> +	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
> +		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
> +		if (TDX_BUG_ON_2(err, TDH_MR_EXTEND, entry, level_state, kvm))
> +			return -EIO;
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)


