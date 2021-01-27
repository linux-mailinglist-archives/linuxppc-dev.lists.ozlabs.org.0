Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1071A30585E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 11:28:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQfv61J8MzDqtR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 21:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQfs458WlzDqcL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 21:26:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DyrsykGh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQfrx33xvz9sW8;
 Wed, 27 Jan 2021 21:26:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1611743176;
 bh=zryxgSLQjWiTOLD0UNSsw16+SrNjwYCl/LrpeqtsbiY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DyrsykGhL7Xp3tlspIoxzVoyNszca4ctJbln+LsxEzARiBiP2f7oa45V0QTswDfoc
 Cl5PRnAjD2cK63emo/Vlk7y7TVbZ96PKRzJR+YEOEso3cSKEJ6sMw1AVZ0TNPJtTiG
 efL77s8j0uGdHOawkZ51ugE8To6++G7bAG06R3VqR5izgvxz9DDbbPpVPIcMJ2Vqmx
 ICV6oIorPqbZ0+s8wzXSWX06bDGo2IRutQoRcfqUOhcWoi1WUlFKe97S3kG2l2OmVQ
 oS3xdg+yplepHRFmZPj2/TgwqxzIjNtApPn5VXrBZfprp5TDyBnCCucNMXptgoEmRO
 bdpnitg9VTrzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v11 13/13] powerpc/64s/radix: Enable huge vmalloc mappings
In-Reply-To: <20210126044510.2491820-14-npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
 <20210126044510.2491820-14-npiggin@gmail.com>
Date: Wed, 27 Jan 2021 21:26:08 +1100
Message-ID: <87mtwuptfj.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

>  .../admin-guide/kernel-parameters.txt         |  2 ++
>  arch/powerpc/Kconfig                          |  1 +
>  arch/powerpc/kernel/module.c                  | 21 +++++++++++++++----
>  3 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a10b545c2070..d62df53e5200 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3225,6 +3225,8 @@
>  
>  	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
>  
> +	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
> +
>  	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
>  			Equivalent to smt=1.
>  
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 107bb4319e0e..781da6829ab7 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -181,6 +181,7 @@ config PPC
>  	select GENERIC_GETTIMEOFDAY
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
> +	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index a211b0253cdb..07026335d24d 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -87,13 +87,26 @@ int module_finalize(const Elf_Ehdr *hdr,
>  	return 0;
>  }
>  
> -#ifdef MODULES_VADDR
>  void *module_alloc(unsigned long size)
>  {
> +	unsigned long start = VMALLOC_START;
> +	unsigned long end = VMALLOC_END;
> +
> +#ifdef MODULES_VADDR
>  	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> +	start = MODULES_VADDR;
> +	end = MODULES_END;
> +#endif
> +
> +	/*
> +	 * Don't do huge page allocations for modules yet until more testing
> +	 * is done. STRICT_MODULE_RWX may require extra work to support this
> +	 * too.
> +	 */
>  
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
> -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> +	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
> +				    PAGE_KERNEL_EXEC,
> +				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
> +				    NUMA_NO_NODE,
>  				    __builtin_return_address(0));
>  }
> -#endif
> -- 
> 2.23.0
