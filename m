Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E97C48014A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 16:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JN2Pk6f2mz3c57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 02:58:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jisFFYjc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jisFFYjc; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JN2P149Hjz2yRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 02:57:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640620645; x=1672156645;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Qopi0GCbZb8D3tqnGHATwO1hv9M0cdIa+FRZv6opEto=;
 b=jisFFYjcsMFGdhcNtR6u3V8vWmG643xpIVaBOx7i29GmKMFyYXdZzlPZ
 d/zNYbpzJxkO62/Jva0fgv5p5bSkNqhr4f3fkuSMyltE0JRe7muoNQBet
 r2wViAInfNYk0GeBnH9QrnQ98wjd79vd7Zyi0Ou+ItieRXlWlQZfEmkvS
 jfVd1GqoJlCWXF8MJARfkFVkyNF4LUzuSggsrDH0+TFB1Ya4U85/il4NR
 smHL+cN5qIc7qWtyCEGomJ0jlSXnK3B13/oEC3srqICZdk3Dmyif/NQnO
 xIia6Xn8xnn1bpcmA/OS55nQ/7imfJDBNWMvojWNiL+l8JOpwaYxLbBoZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="327552172"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="327552172"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 07:56:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="486053937"
Received: from dannysua-mobl2.amr.corp.intel.com (HELO [10.212.232.47])
 ([10.212.232.47])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 07:56:16 -0800
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
From: Dave Hansen <dave.hansen@intel.com>
Message-ID: <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
Date: Mon, 27 Dec 2021 07:56:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227145903.187152-4-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/27/21 6:59 AM, Kefeng Wang wrote:
> This patch select HAVE_ARCH_HUGE_VMALLOC to let X86_64 and X86_PAE
> support huge vmalloc mappings.

In general, this seems interesting and the diff is simple.  But, I don't
see _any_ x86-specific data.  I think the bare minimum here would be a
few kernel compiles and some 'perf stat' data for some TLB events.

> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> index 95fa745e310a..6bf5cb7d876a 100644
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -75,8 +75,8 @@ void *module_alloc(unsigned long size)
>  
>  	p = __vmalloc_node_range(size, MODULE_ALIGN,
>  				    MODULES_VADDR + get_module_load_offset(),
> -				    MODULES_END, gfp_mask,
> -				    PAGE_KERNEL, VM_DEFER_KMEMLEAK, NUMA_NO_NODE,
> +				    MODULES_END, gfp_mask, PAGE_KERNEL,
> +				    VM_DEFER_KMEMLEAK | VM_NO_HUGE_VMAP, NUMA_NO_NODE,
>  				    __builtin_return_address(0));
>  	if (p && (kasan_module_alloc(p, size, gfp_mask) < 0)) {
>  		vfree(p);

To figure out what's going on in this hunk, I had to look at the cover
letter (which I wasn't cc'd on).  That's not great and it means that
somebody who stumbles upon this in the code is going to have a really
hard time figuring out what is going on.  Cover letters don't make it
into git history.

This desperately needs a comment and some changelog material in *this*
patch.

But, even the description from the cover letter is sparse:

> There are some disadvantages about this feature[2], one of the main
> concerns is the possible memory fragmentation/waste in some scenarios,
> also archs must ensure that any arch specific vmalloc allocations that
> require PAGE_SIZE mappings(eg, module alloc with STRICT_MODULE_RWX)
> use the VM_NO_HUGE_VMAP flag to inhibit larger mappings.

That just says that x86 *needs* PAGE_SIZE allocations.  But, what
happens if VM_NO_HUGE_VMAP is not passed (like it was in v1)?  Will the
subsequent permission changes just fragment the 2M mapping?
