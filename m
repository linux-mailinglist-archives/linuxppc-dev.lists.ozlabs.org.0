Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682155C9B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 14:57:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXPkl2t0dz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 22:57:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MDq4ifSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXPk94r8nz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 22:56:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MDq4ifSu;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXPk46wX9z4xXF;
	Tue, 28 Jun 2022 22:56:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656421007;
	bh=k5WbTKh0IYEEK0n0TkrO0MnVkcIiC1k08BT2h5qHrWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MDq4ifSulJSEw/eE68hXVMaI4YoM6Qypa/96kwCcwD2HCQMBJbbSyfYZZHC9refIC
	 EYPrVjJENOEh1Z8G/7YRvjYme4zfiI7pp1LmmtewdP1T7Zqf2DGmFgPP8z2zVO1t4t
	 fnL7a9+6nnn0kQAZE+/+4uOXZlrh/rCGwB1PJIKVf/KRCGhtv8XkhAwr+2v3md3zUC
	 7kV5asjz+I/bGSkq1FQ3VPBhYJF5kgC1Fg75dOm0LYE37NBEpevHdV/dpYgwCDSvGw
	 divyCzvz/xPRcjSIe/Ce0MKFA1KXsJ0OdXcdtFXBogS/w/Gm9+uBhrmgUjNalMom/r
	 7klcL29wv/a/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2] powerpc/memhotplug: Add add_pages override for PPC
In-Reply-To: <20220627072708.75662-1-aneesh.kumar@linux.ibm.com>
References: <20220627072708.75662-1-aneesh.kumar@linux.ibm.com>
Date: Tue, 28 Jun 2022 22:56:40 +1000
Message-ID: <87a69x3q0n.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> With commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> the kernel now validate the addr against high_memory value. This results
> in the below BUG_ON with dax pfns.
>
> [  635.798741][T26531] kernel BUG at mm/page_alloc.c:5521!
> 1:mon> e
> cpu 0x1: Vector: 700 (Program Check) at [c000000007287630]
>     pc: c00000000055ed48: free_pages.part.0+0x48/0x110
>     lr: c00000000053ca70: tlb_finish_mmu+0x80/0xd0
>     sp: c0000000072878d0
>    msr: 800000000282b033
>   current = 0xc00000000afabe00
>   paca    = 0xc00000037ffff300   irqmask: 0x03   irq_happened: 0x05
>     pid   = 26531, comm = 50-landscape-sy
> kernel BUG at :5521!
> Linux version 5.19.0-rc3-14659-g4ec05be7c2e1 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #625 SMP Thu Jun 23 00:35:43 CDT 2022
> 1:mon> t
> [link register   ] c00000000053ca70 tlb_finish_mmu+0x80/0xd0
> [c0000000072878d0] c00000000053ca54 tlb_finish_mmu+0x64/0xd0 (unreliable)
> [c000000007287900] c000000000539424 exit_mmap+0xe4/0x2a0
> [c0000000072879e0] c00000000019fc1c mmput+0xcc/0x210
> [c000000007287a20] c000000000629230 begin_new_exec+0x5e0/0xf40
> [c000000007287ae0] c00000000070b3cc load_elf_binary+0x3ac/0x1e00
> [c000000007287c10] c000000000627af0 bprm_execve+0x3b0/0xaf0
> [c000000007287cd0] c000000000628414 do_execveat_common.isra.0+0x1e4/0x310
> [c000000007287d80] c00000000062858c sys_execve+0x4c/0x60
> [c000000007287db0] c00000000002c1b0 system_call_exception+0x160/0x2c0
> [c000000007287e10] c00000000000c53c system_call_common+0xec/0x250
>
> The fix is to make sure we update high_memory on memory hotplug.
> This is similar to what x86 does in commit 3072e413e305 ("mm/memory_hotplug: introduce add_pages")
>
> Fixes: ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
 
...

> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 52b77684acda..2a63920c369d 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -105,6 +105,36 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
>  	vm_unmap_aliases();
>  }
>  
> +/*
> + * After memory hotplug the variables max_pfn, max_low_pfn and high_memory need
> + * updating.
> + */
> +static void update_end_of_memory_vars(u64 start, u64 size)
> +{
> +	unsigned long end_pfn = PFN_UP(start + size);
> +
> +	if (end_pfn > max_pfn) {
> +		max_pfn = end_pfn;
> +		max_low_pfn = end_pfn;
> +		high_memory = (void *)__va(max_pfn * PAGE_SIZE - 1) + 1;
> +	}
> +}
> +
> +int __ref add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> +		    struct mhp_params *params)
> +{
> +	int ret;
> +
> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
> +	WARN_ON_ONCE(ret);

What's the justification for making this a WARN_ON_ONCE(), and then
continuing to update the variables anyway?

I realise that's what x86 does, but it seems kind of wrong.

cheers

> +	/* update max_pfn, max_low_pfn and high_memory */
> +	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> +				  nr_pages << PAGE_SHIFT);
> +
> +	return ret;
> +}
