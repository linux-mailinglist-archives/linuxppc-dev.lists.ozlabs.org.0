Return-Path: <linuxppc-dev+bounces-13636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9265C23F98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 10:01:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZhY4v5qz2yrX;
	Fri, 31 Oct 2025 20:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761901261;
	cv=none; b=kXl3jAA9X6RRI6mS1vygGWAIxx6qrjWOFkYfMof0VCFAINssrlnH77JltVriFK0Mm39i1/1Zdnd1aYwFUFs8ZglQD3gU7rnnd9fZaoGtCbfTC0hE6k5HA+ow6mfpjjAgPdP+84zz7OYL60vZaKOge9+TkqtMM/UgOZu9DY8mjhoXFvj1U6AETPvjUgsfsaR3tmYpO4Tuatz7nJkppa7eC7jDnH0Z7Owurdlz4gYIVN/hksiz9utQQwBJ/GWj78s+k5QDOMmIiswHgJWgsRcRaiIt070XEswkb6IVHc44jglR6SmKHwaC08TbuQz5almChjJYxQu+fn/WXIKlVsJKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761901261; c=relaxed/relaxed;
	bh=4FqGoCQAd8WXHNGO1W4O+86RFAzg5M4qX32jto5ifBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuuVcYfLol3LEDK9UjKJg0vAKLl60aj8C50nrj8H/LFNR8Ik3gHFJOtm00pLoEHRX52jiyfCWzVv0xlhcYYixqRcEOGRWrVds+NwgbOsvQtO4Aqo3/bmRSyvhusp07IxEiZZjBN/hBJAxtucAIuPif894tW/mNh3J2daW/XDkU5VP2GZ530OVGe+KHjdDDWQc+XCZySBg6j6eIDM4y/s4A+peI2oiMaTLbpLVi5JeCdvtyQ+pWg6Smpxcb52b4Ti3tNnd6LXc3V2flz4ebpdZdxMbedp3PrfQ1dy7ph7L7jfKb/uyDDi4THrm/T0tidhLoaVhV18vuymThCXDewLqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjqhrfBV; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjqhrfBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZhX50ksz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 20:01:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901261; x=1793437261;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WrRAkZWX2mY1Sn4BYh8lP0+Uv8J4x4xta8TyjbzO6EM=;
  b=LjqhrfBVUI1c1hU0zX/k2qyRqGEoSflVMy2bAVyyLqibsyTvcdEVhtdS
   9XbyTBd6kKFxOcWg3mrHR6HM1nSHg1DknizLxVKj63cRqRtPN9kzfHDMy
   SlhAhM3Ytc1EJZUxemVJHkd3faYiGch92r2lSURnH1RCxOxZ13LrlPVr0
   kw1Ii6Sn8mL1RM0Sw30cQagcTsyG7QrTYo09KF6KBAx2QtPaoScPKMUsW
   AhCeqe8qBNyUmOhKGOa14TIT5MyDsf2S9ZkZOpjBRe+uqYciT6fO1CwYq
   Ew8/qPV7+RyXVpb0qL6A7R52ylExoTQ8fC5/PEV8z1It8z5t8Pi3fmYQC
   Q==;
X-CSE-ConnectionGUID: 0i9SlzrkRrGuSALcDW4yoA==
X-CSE-MsgGUID: yxRUA5xhQgm5ilEXczO+lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63263163"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="63263163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:00:58 -0700
X-CSE-ConnectionGUID: Dd9eBStPTB2R+zNgqb0uKQ==
X-CSE-MsgGUID: AT1MnrH1RWGItLZni9BlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186120016"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:00:50 -0700
Message-ID: <326290aa-def6-478c-9ef3-1649e027e5d5@linux.intel.com>
Date: Fri, 31 Oct 2025 17:00:48 +0800
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
Subject: Re: [PATCH v4 19/28] KVM: TDX: Derive error argument names from the
 local variable names
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
 <20251030200951.3402865-20-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-20-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> When printing SEAMCALL errors, use the name of the variable holding an
> error parameter instead of the register from whence it came, so that flows
> which use descriptive variable names will similarly print descriptive
> error messages.
>
> Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 5e6f2d8b6014..63d4609cc3bc 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -41,14 +41,15 @@
>   #define TDX_BUG_ON(__err, __fn, __kvm)				\
>   	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
>   
> -#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
> -	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
> +#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
> +	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
>   
> -#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
> -	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
> +#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
> +	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
>   
> -#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
> -	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
> +#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
> +	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
> +		     a1, a2, a3)
>   
>   
>   bool enable_tdx __ro_after_init;


