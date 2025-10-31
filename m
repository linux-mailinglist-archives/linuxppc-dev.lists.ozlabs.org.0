Return-Path: <linuxppc-dev+bounces-13637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3DC23FF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 10:05:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZp00smbz2yqh;
	Fri, 31 Oct 2025 20:05:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761901543;
	cv=none; b=IrboyfNm5PPKntE5OqpNjgahxFezSQ9uTpbVXFjENu4emLcbuYE1QrXYcG/w4FhLeGwcNJc/C3lqv6y+OvSko84N5AA53nZ3BGj20b9Rpvb6WIsdJ0iRI7vAJSFgB5fk3cnLPLrCCNIkIp21b6GaqJw91RU/adNd20abLKpZUYVjlJYnHZ1iPPNz8Now7TqTqUrto1kinfvDnyBuSRBr2S5o35aT/y8GzZ/3ICvjqG0kVNNSlvLJXDfITEIsBwg4rnj9m9KVzS6H+SzsCabJrxdMTIAiP41FMOmvNSYLNZRyFF4DnJ6wQmA2USzhjNsvK0gpCHvv5GkqlLSehP5S9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761901543; c=relaxed/relaxed;
	bh=/mZtn147ikWvuq3oArSaA/nKxRJMYxqffmhEF5+2L50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bapVDMGIY2cLRDppRAPZo9Wp5CnD57YfwK7MnWrRJXsFQlw4ROeyP7qtPtVnkez2gIHSh3ly8HwgyG6ivuhbh6CconaRqJE047uC4ZQr2IvMt07dSF3hb9iORyIvzpLwJrtW7+CrE7/L09LPo+J2/GyOBIwviqn3z6OhjqQYjsuRC7JO4Wne9a8eQiqdpT6ly+HLe1KtZdptx9zML43etnW+RYa/3LsZFJmvEZCPOVAotohlo6YOhZvlslDBPiW2Zr+u75CbjjejYFGW5YC4pto2FJM/5uKdNAe7NAe6PIIx8ay7SEpGRtKHN7/16Sic/rn7OELdJM5cjYZdU13cTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Adq1c/fH; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Adq1c/fH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZnz0sncz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 20:05:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901543; x=1793437543;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qFNmSQUeXMaY7XvP4sAPgKkJ8Ev3XCXyw2q+qbAZDIU=;
  b=Adq1c/fH7KvHZgJQo5xZJIy836Te8QUK6IO+3gcXBE/m1werpG1TTbOZ
   7DmRqzTpekQtG4ofo1elsNXBJ6GfTPgoH9rblthO1s9QOxHdv4ga1jdVX
   ZHWZUl3ePBPF/Xl76vTWrFZ4geBiIJVfYK8q+H6j3Mvdm+WvGeC/OhIr4
   4PGNTFI9O1YzF1Yy2bGnUDTslfxGyqnfkvfsyRMe8hEWgvOyo3B4aEcgN
   eXVVlXiYv854V+ncmWKGeXjSdDqdyBkaJ0V6zCgHO/V6t25djnZJICCYQ
   oNo0o0E+GWCk1rjtX9TOTKzF+h7vBrFbfbKRf0vXhuyVDtz3uFpYg26N/
   Q==;
X-CSE-ConnectionGUID: SIZGZbDdTIysypkd1kkurQ==
X-CSE-MsgGUID: 6oND9kNlSoSQZoEt7tZSHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75508368"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75508368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:05:41 -0700
X-CSE-ConnectionGUID: wf1Dt5UnRy6jaWYzdx9wDQ==
X-CSE-MsgGUID: x9G1JpmbTtGdOFT3heo6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186121954"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:05:32 -0700
Message-ID: <18ecf186-c3b9-4027-a54b-7f3e5ba9f484@linux.intel.com>
Date: Fri, 31 Oct 2025 17:05:34 +0800
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
Subject: Re: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
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
 <20251030200951.3402865-21-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-21-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Unconditionally assert that mmu_lock is held for write when removing S-EPT
> entries, not just when removing S-EPT entries triggers certain conditions,
> e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> Conditionally asserting implies that it's safe to hold mmu_lock for read
> when those paths aren't hit, which is simply not true, as KVM doesn't
> support removing S-EPT entries under read-lock.
>
> Only two paths lead to remove_external_spte(), and both paths asserts that
                                                                 ^
                                                               assert
> mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> handle_removed_pt() via KVM_BUG_ON()).
>
> Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
> the conditional assert in tdx_track() as well, but with a comment to help
> explain why holding mmu_lock for write matters (above and beyond why
> tdx_sept_remove_private_spte()'s requirements).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 63d4609cc3bc..999b519494e9 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
>   	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
>   		return;
>   
> +	/*
> +	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
> +	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
> +	 * tracking epoch hasn't completed.
> +	 */
>   	lockdep_assert_held_write(&kvm->mmu_lock);
>   
>   	err = tdh_mem_track(&kvm_tdx->td);
> @@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
>   	gpa_t gpa = gfn_to_gpa(gfn);
>   	u64 err, entry, level_state;
>   
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
>   	/*
>   	 * HKID is released after all private pages have been removed, and set
>   	 * before any might be populated. Warn if zapping is attempted when


