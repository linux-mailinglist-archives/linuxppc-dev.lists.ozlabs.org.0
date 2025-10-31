Return-Path: <linuxppc-dev+bounces-13632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B8C23F0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 09:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZYY3P1Lz2yD5;
	Fri, 31 Oct 2025 19:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761900897;
	cv=none; b=cJQX+8c+7TwlZPWg8GgZTLU+9Oe2hmfwZMG/6afVFg65Pu7MpqdY6/egMxnHrt7lvQQRZJn6KEtMbmvSMO3I+STslZ7q3u5d5dbQEm3ATUpdxhqUYPp+PBcQsJa1QFT7WYT1dluZjx5gvyvXaQbEH5tF4PYT8z8Y/u9+ZS2GwSLcXRZCnx++FK/4Peu/vnL8ZnU+Bd4i+gIvnqQgevvmoqfb1Foc/FuM1s75l2QL+0LmuPNmUstKRd5LPmC+NOkMRJqpMTh4jmWM3ev09P3a/gbEGuzOWFs0KFKY7E7OATFEZm+TfW+tjEpA1Yf02RNOu1Ui5T+TxsB/p7reQXiWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761900897; c=relaxed/relaxed;
	bh=qayQvrvRInAs4NV/gH0141z06SSAxHM7x/8/cuBuNKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACBYIuLzxcNAtYte8DxCcBybSmjmRK8wJdHI+joq3QyK92umluEV/f8XJTp7CDNsisOlYZlD+l/EZvfyMsqOtREDVxNv3P7/FW5SDtzHrWbb6anizS797iIiU/gSWmSPqOmrSfErVBLZlUWYmH+ODlCj+evEIeETy8xwlVQBn2CF/MHry88RXLxr6yS5DnwNeAEF2f4zMMb69+o67PY33zRGZ5siTqKL9L3CCoDJ5LEFgTm9eZ57xHOaXXv1D3XpCYEHhqM+1xaWkh7M6L8VvOYgsKCwSk5Se5aFnXjBxryx4/G6g0AbWlhEHtHHvLCf9Z48swMExWyCDEO7B0IC5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bA776szP; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bA776szP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZYV68Zxz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 19:54:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761900895; x=1793436895;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iU1XFUVtQH6LI61M4J5u+MgZ1klxrWMInWe7hZiTFt8=;
  b=bA776szPQqyBvdJ/zq/pb6tJeTVpBPaln1B9mVP/MrNvi/MpxBKysDAj
   aJxzsQfxpAu5MkXOOvh7AfHEo+DH4Z98qnvtCC7Sq7VfKnEH3CIwTmn2+
   vV8cFi8tC2kRGbudYyt4RzgXvk5FXGqx7RiBs/rOL+2m/qipiYYfkW/E9
   H5RrHym1fZ5AtxID6vfuyd4bA+JXGwNxqtEUtW4U3sYnWOIc8O8iDyC6R
   Fy0Jd1/dv0S7eB0GLU/gP8fbJWEF4oT2X2uCkcUdRUUaMdZtdysDq+q4c
   sLX/zx4TG65ZHQW4tO0TCVgALKGzNWxmbHV3bmYib6Dz3v7Nt02h7QCYt
   A==;
X-CSE-ConnectionGUID: Oz2lFZfERsiKd926S05aag==
X-CSE-MsgGUID: rLbG0Zu1Sii95FsExt/Kiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67709833"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="67709833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:54:50 -0700
X-CSE-ConnectionGUID: 4Xvcl/miQfWM+8RZoCX16A==
X-CSE-MsgGUID: H6esMYuyQ0eLrmr7cZvmKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186117901"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:54:42 -0700
Message-ID: <91e3ca2f-2336-416a-bd37-3f6fa84d0613@linux.intel.com>
Date: Fri, 31 Oct 2025 16:54:39 +0800
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
Subject: Re: [PATCH v4 16/28] KVM: TDX: ADD pages to the TD image while
 populating mirror EPT entries
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
 <20251030200951.3402865-17-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-17-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> When populating the initial memory image for a TDX guest, ADD pages to the
> TD as part of establishing the mappings in the mirror EPT, as opposed to
> creating the mappings and then doing ADD after the fact.  Doing ADD in the
> S-EPT callbacks eliminates the need to track "premapped" pages, as the
> mirror EPT (M-EPT) and S-EPT are always synchronized, e.g. if ADD fails,
> KVM reverts to the previous M-EPT entry (guaranteed to be !PRESENT).
>
> Eliminating the hole where the M-EPT can have a mapping that doesn't exist
> in the S-EPT in turn obviates the need to handle errors that are unique to
> encountering a missing S-EPT entry (see tdx_is_sept_zap_err_due_to_premap()).
>
> Keeping the M-EPT and S-EPT synchronized also eliminates the need to check
> for unconsumed "premap" entries during tdx_td_finalize(), as there simply
> can't be any such entries.  Dropping that check in particular reduces the
> overall cognitive load, as the management of nr_premapped with respect
> to removal of S-EPT is _very_ subtle.  E.g. successful removal of an S-EPT
> entry after it completed ADD doesn't adjust nr_premapped, but it's not
> clear why that's "ok" but having half-baked entries is not (it's not truly
> "ok" in that removing pages from the image will likely prevent the guest
> from booting, but from KVM's perspective it's "ok").
>
> Doing ADD in the S-EPT path requires passing an argument via a scratch
> field, but the current approach of tracking the number of "premapped"
> pages effectively does the same.  And the "premapped" counter is much more
> dangerous, as it doesn't have a singular lock to protect its usage, since
> nr_premapped can be modified as soon as mmu_lock is dropped, at least in
> theory.  I.e. nr_premapped is guarded by slots_lock, but only for "happy"
> paths.
>
> Note, this approach was used/tried at various points in TDX development,
> but was ultimately discarded due to a desire to avoid stashing temporary
> state in kvm_tdx.  But as above, KVM ended up with such state anyways,
> and fully committing to using temporary state provides better access
> rules (100% guarded by slots_lock), and makes several edge cases flat out
> impossible.
>
> Note #2, continue to extend the measurement outside of mmu_lock, as it's
> a slow operation (typically 16 SEAMCALLs per page whose data is included
> in the measurement), and doesn't *need* to be done under mmu_lock, e.g.
> for consistency purposes.  However, MR.EXTEND isn't _that_ slow, e.g.
> ~1ms latency to measure a full page, so if it needs to be done under
> mmu_lock in the future, e.g. because KVM gains a flow that can remove
> S-EPT entries during KVM_TDX_INIT_MEM_REGION, then extending the
> measurement can also be moved into the S-EPT mapping path (again, only if
> absolutely necessary).  P.S. _If_ MR.EXTEND is moved into the S-EPT path,
> take care not to return an error up the stack if TDH_MR_EXTEND fails, as
> removing the M-EPT entry but not the S-EPT entry would result in
> inconsistent state!
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

> ---
>   arch/x86/kvm/vmx/tdx.c | 106 ++++++++++++++---------------------------
>   arch/x86/kvm/vmx/tdx.h |   8 +++-
>   2 files changed, 43 insertions(+), 71 deletions(-)
>
[...]
> diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
> index ca39a9391db1..1b00adbbaf77 100644
> --- a/arch/x86/kvm/vmx/tdx.h
> +++ b/arch/x86/kvm/vmx/tdx.h
> @@ -36,8 +36,12 @@ struct kvm_tdx {
>   
>   	struct tdx_td td;
>   
> -	/* For KVM_TDX_INIT_MEM_REGION. */
> -	atomic64_t nr_premapped;
> +	/*
> +	 * Scratch pointer used to pass the source page to tdx_mem_page_add.
tdx_mem_page_add -> tdx_mem_page_add()

> +	 * Protected by slots_lock, and non-NULL only when mapping a private
> +	 * pfn via tdx_gmem_post_populate().
> +	 */
> +	struct page *page_add_src;
>   
>   	/*
>   	 * Prevent vCPUs from TD entry to ensure SEPT zap related SEAMCALLs do


