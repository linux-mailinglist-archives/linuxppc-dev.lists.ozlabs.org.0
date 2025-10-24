Return-Path: <linuxppc-dev+bounces-13256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F30C04C4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 09:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctFDQ0r1gz30RJ;
	Fri, 24 Oct 2025 18:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761291605;
	cv=none; b=kynlyWaUlTgcGJVczqRPhizxK5erjy8ekRkSVYgPrQ2GvQ7j9zytlICJvTsY1ws00pT0EXI86bvqozVkiW8OaZm4Ba8BNa8bBvtA2p5HRD8R8/8e/+/cpb0A0/LhowA9C9tI8/XzqkntRx82cJx9bmsRWqmJbhDo805ByUgQxkAr2wxYD1J8hGVyQyJfGqO0CKCHTQHDaDM53Qm0huKt/XRqLG6ImFYQ+gZJ7SLEwgyqNRlI0zyLAOLcfZc3k4QfTjPK+ffkUB950CKCziymS586aYH5/y/DVwbGBr/zId6hhCOnV7LoeBNtVWeTKqC0dO5G9JXCrSOG9om7XFAKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761291605; c=relaxed/relaxed;
	bh=KZFjUecKeoM0wM6NVOccMenUolXv2il+hW7at1O2jY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm0kId4tQFhaJMLJRMK0VsB55XD4UfAvAXrlk24VZrp/cIffiLigfeWZipQVY3Fnp14qSz7e3hMHPW8rzOkz/jPEmyU7r/6wTl27Nu/JB8kXkC7XgYLZw0NgUmbTmCI5ipPzyfdz2LNxVJfrjPhEKI/n+/fgC/JhkvtMXN+CnpPQaTPzI1HHP0luu3JT9MlB/irk14BXbg6C3afMe3SCFDQiJ14ZfP8Uy254Hy6TWEZ/cHxqnnJokj68r59uZesvFagY9Sa8TaOaFCPxwWgQlnuBJiW96lUolvboRPiN4bOGfLgGDkxb4WmgiRvpTNgik8sD4Qfi++2XjYXPmvk/1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f7HDhUm5; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f7HDhUm5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 18:40:03 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctFDM40hMz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 18:40:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761291603; x=1792827603;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mqrmnotooRW9zCLkNbwsBqACdnSVp7ozY0nJzWJwIdI=;
  b=f7HDhUm5q05lrxQ8w3WFqdDHJb8Zfhmo5+Gf90SxcFlLCc0dfNVgXgIl
   RZZk67LJksR0o1HVwUCWazrifs1ztr6Dvc9i9i2RTsVT9SYKkaMoDw0JM
   ubf6iATK+sMDZDZy1UmP3wiALgRkCFBj1TRBYAOQpib0zcP88vTKdNbXW
   hh79wQ5nPljEKKXaoxRdbqx4ylf3jgDEwZQq3TjF/hcuWSVfHlYKJeieV
   JN1gjuGv8nLn4q+4JnvuUmoOKMIuFwZxs2NWJk8LLH3YPlxtPqGxtmxz1
   iWT06t9/+KO4HmWVzm3Hl3oEN7sx07cvR2kzjdb24BnAjKGHde5UbZ5RB
   g==;
X-CSE-ConnectionGUID: B8lzMCpeT+Cb8/qoFdLBiQ==
X-CSE-MsgGUID: JjEKDLcZTcONUqESXvRvgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63394998"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63394998"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:38:55 -0700
X-CSE-ConnectionGUID: UxV1qHb2TCSYa+TzbX0Eow==
X-CSE-MsgGUID: EwmjUoGZTCaYHb6B07GYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188424583"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.235.70]) ([10.124.235.70])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:38:46 -0700
Message-ID: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Date: Fri, 24 Oct 2025 15:38:43 +0800
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
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
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
 <20251017003244.186495-14-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-14-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
> providing a one-off helper for effectively three lines of code is at best a
> wash, and splitting the code makes the comment for smp_rmb()  _extremely_
> confusing as the comment talks about reading kvm->arch.pre_fault_allowed
> before kvm_tdx->state, but the immediately visible code does the exact
> opposite.
>
> Opportunistically rewrite the comments to more explicitly explain who is
> checking what, as well as _why_ the ordering matters.
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

[...]
> +	/*
> +	 * If the TD isn't finalized/runnable, then userspace is initializing
> +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
                                                                    ^
                                                 Nit: Is pre-mapped better?
> +	 * have been added to the image, to prevent running the TD with a
> +	 * valid mapping in the mirror EPT, but not in the S-EPT.
> +	 */
> +	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE)) {
> +		if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
> +			return -EIO;
> +
> +		atomic64_inc(&kvm_tdx->nr_premapped);
> +		return 0;
> +	}
> +
> +	return tdx_mem_page_aug(kvm, gfn, level, pfn);
>   }
>   
>   static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,


