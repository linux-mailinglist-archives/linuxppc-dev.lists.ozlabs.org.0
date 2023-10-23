Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0007D3D62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 19:21:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZOVDksWf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDhnd2DFWz3cTb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 04:21:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZOVDksWf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDhmn0Kr7z2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 04:21:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF6ADCE0C47;
	Mon, 23 Oct 2023 17:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977DEC433C7;
	Mon, 23 Oct 2023 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698081670;
	bh=WQYEKm0Mc7inaH0wFnxcEUmfAmPR1JoMV7fRygVNKQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOVDksWfw+hV9R+Z5ZexM6NcY3xDNdzdq9AsRt4vO9wMdxWhqWWcxLwP+eW4A962q
	 Qk6ekhq2Ipm65VVsfFxXGy8qQeQOWzCvDqLJfEU8nWaZHFbI6flnaXvlVH0CRDWH+w
	 hIMRahts5mdD+tpF+6eXFcpVMEl1Ep7tHL5W7fbVdPmlfZ6yQugf14RafBolwJcEMn
	 21vyDdZz0h9WC0+Q/QJBX2oIB6fGQ1kXhcFuxCsKB2tbLoPEgU/BSdSOixB9qw31iO
	 OgDPN8A4Uqs6uFqTMJcPk6zjMZ/offJmG+hcHSxPefHsLKYd1oYsfoKs6fvoRIkbKX
	 wMvEth+vb/+ag==
Date: Mon, 23 Oct 2023 18:21:00 +0100
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 07/13] arm64, execmem: extend execmem_params for
 generated code allocations
Message-ID: <20231023172059.GB4041@willie-the-truck>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-8-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918072955.2507221-8-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_
 T=F6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 10:29:49AM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The memory allocations for kprobes and BPF on arm64 can be placed
> anywhere in vmalloc address space and currently this is implemented with
> overrides of alloc_insn_page() and bpf_jit_alloc_exec() in arm64.
> 
> Define EXECMEM_KPROBES and EXECMEM_BPF ranges in arm64::execmem_params and
> drop overrides of alloc_insn_page() and bpf_jit_alloc_exec().
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/arm64/kernel/module.c         | 13 +++++++++++++
>  arch/arm64/kernel/probes/kprobes.c |  7 -------
>  arch/arm64/net/bpf_jit_comp.c      | 11 -----------
>  3 files changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index cd6320de1c54..d27db168d2a2 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -116,6 +116,16 @@ static struct execmem_params execmem_params __ro_after_init = {
>  			.flags = EXECMEM_KASAN_SHADOW,
>  			.alignment = MODULE_ALIGN,
>  		},
> +		[EXECMEM_KPROBES] = {
> +			.start = VMALLOC_START,
> +			.end = VMALLOC_END,
> +			.alignment = 1,
> +		},
> +		[EXECMEM_BPF] = {
> +			.start = VMALLOC_START,
> +			.end = VMALLOC_END,
> +			.alignment = 1,
> +		},
>  	},
>  };
>  
> @@ -140,6 +150,9 @@ struct execmem_params __init *execmem_arch_params(void)
>  		r->end = module_plt_base + SZ_2G;
>  	}
>  
> +	execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
> +	execmem_params.ranges[EXECMEM_BPF].pgprot = PAGE_KERNEL;
> +
>  	return &execmem_params;
>  }
>  
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 70b91a8c6bb3..6fccedd02b2a 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -129,13 +129,6 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  	return 0;
>  }
>  
> -void *alloc_insn_page(void)
> -{
> -	return __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
> -			GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
> -			NUMA_NO_NODE, __builtin_return_address(0));
> -}

It's slightly curious that we didn't clear the tag here, so it's nice that
it all happens magically with your series:

Acked-by: Will Deacon <will@kernel.org>

Will
