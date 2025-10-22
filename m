Return-Path: <linuxppc-dev+bounces-13136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF683BF9CF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 05:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crvTt0fZZz2yrb;
	Wed, 22 Oct 2025 14:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761103025;
	cv=none; b=A+fBZBTdP8ZsaldOlUoPKX+6QrJI4V59s+VEmr0WX7nV4qZ6c8Ih5oz73FitrQnOEbbwUq6CShWHgnGrxjh5qCZocjJu5VxATDLOL1ZlgiNTEaWOPHEGJlWtKEvIiG7NZJandF+6YX806fkJGAV0KA7Yeasbd+mroa9K9qXCw3sPodA44LLauhyyFPyUujeOmmisL7xuQR99PVotZiN45rMOm6qQhzn98zZOkTwS43eLuvma2jr4rRKCeGq+0BGFd2dDnwYiODcGIMbStW8oXnSs1x6dvd6mE8XMFt1YaxYgJF92/Rdgyt5WQNMZaKN8G34vbeMF5RPQLeNNK1A1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761103025; c=relaxed/relaxed;
	bh=tTCdiePndXIRwCmFCtbHTHaGzs2XLhLP1juLivd72j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfoYgKr9KjRGQm22TrOaYrM+tc7yRAAfQ1tCJIkn0+1s/pq3g1+M+nra/0z8ymGYOahoMUyYexrFunBKvGW01dS5mI5rhDqggv7JepemVFRTfiAm6SM1tRDQrH8XhzGTexTk1xePIXIB+h29nhdvrD9lWPkyiWJdrQnZXtr+aGyePCqidOriWv43avJ0ntfxYoUtLCJb7ldsV5EaIK6X0I+Wf8v6YePxnFhU3TAQ6iKhxpkOJ38OuzhYBgqxBwtrN7X6iNdv0r1y8kLu3HZVZsDl10htZRVbtEFUJBrVNKZVwiUTj4fh0OgwsyrLM9TWPxruxJ5STChwWDYy0rggrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j4xeAdrA; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j4xeAdrA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 22 Oct 2025 14:17:03 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crvTq3ZQkz2yjr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 14:17:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761103024; x=1792639024;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=C4vq3UaKFDwToRnrsRh+czOcOkuL3mJDA1+8OYAo9rg=;
  b=j4xeAdrAJYj03rDhDaND5XEZRKGLmY+cX3SMOJoPt69KKa9chGK1zVGg
   zQgpI0MMudnbqAD7lFCS4uASDK7+QwvSGC2SAqqb9m314bbdNPxzE92LU
   J+2qt7dNaHeZzP4x5zWnWviXZvVtyJA0FZ4ZCbKVrF572LfpS0HRC6Mvm
   4noTe3BCaWQlB3Xoy+kkKsfw7CJiuJ5hqnoCGIbS/DsmA9MPIlxi3zdRH
   H4xMwwS3pt6S2PUd/DDx5uYgPQqJ1HUhIhqH+7VD6LmN0XuzaO30fp1TI
   j/STj1W+hZy6JC1v8FTvtXvZ06vXtbD9jkdtepXnfgx1mF5tnGUSY2MhK
   w==;
X-CSE-ConnectionGUID: JDFoIg7yRJyoqxgV+eIjYQ==
X-CSE-MsgGUID: 2Ciq5vSORfiw+wzmQIjVGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63151314"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63151314"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:15:56 -0700
X-CSE-ConnectionGUID: rS/w9ShoRTOr0LOxJ5xyUg==
X-CSE-MsgGUID: oNdfq1G9T4yNJ67V9X9aAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184159739"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:15:49 -0700
Message-ID: <eb6a2ca0-84eb-4770-8300-cd8892eae6ad@linux.intel.com>
Date: Wed, 22 Oct 2025 11:15:46 +0800
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
Subject: Re: [PATCH v3 03/25] KVM: TDX: Drop PROVE_MMU=y sanity check on
 to-be-populated mappings
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
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-4-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-4-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Drop TDX's sanity check that a mirror EPT mapping isn't zapped between
> creating said mapping and doing TDH.MEM.PAGE.ADD, as the check is
> simultaneously superfluous and incomplete.  Per commit 2608f1057601
> ("KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"), the
> justification for introducing kvm_tdp_mmu_gpa_is_mapped() was to check
> that the target gfn was pre-populated, with a link that points to this
> snippet:
>
>   : > One small question:
>   : >
>   : > What if the memory region passed to KVM_TDX_INIT_MEM_REGION hasn't been pre-
>   : > populated?  If we want to make KVM_TDX_INIT_MEM_REGION work with these regions,
>   : > then we still need to do the real map.  Or we can make KVM_TDX_INIT_MEM_REGION
>   : > return error when it finds the region hasn't been pre-populated?
>   :
>   : Return an error.  I don't love the idea of bleeding so many TDX details into
>   : userspace, but I'm pretty sure that ship sailed a long, long time ago.
>
> But that justification makes little sense for the final code, as the check
> on nr_premapped after TDH.MEM.PAGE.ADD will detect and return an error if
> KVM attempted to zap a S-EPT entry (tdx_sept_zap_private_spte() will fail
> on TDH.MEM.RANGE.BLOCK due lack of a valid S-EPT entry).  And as evidenced
> by the "is mapped?" code being guarded with CONFIG_KVM_PROVE_MMU=y, KVM is
> NOT relying on the check for general correctness.
>
> The sanity check is also incomplete in the sense that mmu_lock is dropped
> between the check and TDH.MEM.PAGE.ADD, i.e. will only detect KVM bugs that
> zap SPTEs in a very specific window (note, this also applies to the check
> on nr_premapped).
>
> Removing the sanity check will allow removing kvm_tdp_mmu_gpa_is_mapped(),
> which has no business being exposed to vendor code, and more importantly
> will pave the way for eliminating the "pre-map" approach entirely in favor
> of doing TDH.MEM.PAGE.ADD under mmu_lock.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 14 --------------
>   1 file changed, 14 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 326db9b9c567..4c3014befe9f 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3181,20 +3181,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>   	if (ret < 0)
>   		goto out;
>   
> -	/*
> -	 * The private mem cannot be zapped after kvm_tdp_map_page()
> -	 * because all paths are covered by slots_lock and the
> -	 * filemap invalidate lock.  Check that they are indeed enough.
> -	 */
> -	if (IS_ENABLED(CONFIG_KVM_PROVE_MMU)) {
> -		scoped_guard(read_lock, &kvm->mmu_lock) {
> -			if (KVM_BUG_ON(!kvm_tdp_mmu_gpa_is_mapped(vcpu, gpa), kvm)) {
> -				ret = -EIO;
> -				goto out;
> -			}
> -		}
> -	}
> -
>   	ret = 0;
>   	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
>   			       src_page, &entry, &level_state);


