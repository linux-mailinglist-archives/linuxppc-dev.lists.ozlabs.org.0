Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E47394928
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 01:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsLgX0mgRz3bnS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 09:36:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MXMut9ar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MXMut9ar; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsLg7138rz2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 09:36:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FsLg33rm6z9sRf;
 Sat, 29 May 2021 09:36:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622244991;
 bh=WfceVqG2ph1t0qIlz3+8z99n7uyRcmZUoB77cZnEtzs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MXMut9ar0XyljUv9U/i7CQirX5FkTZBO9JZ91z8jMCczG+Vgx+gGMiO3BSmvRH8d8
 oXSZGIVhpJIs0VU2bm4Z9evd/lIIUArytLQsw5EaGcGmwvOKpD1/3p8I/1AY/gr/02
 z+AHGOgl0ZjwDRC6UkJNoEKnQJN8ux7UpBpR52mfI5Mi5mDuur6pz5gF8JNII777Ry
 E53x38Vav+Z1tTNDXSqAdVO3wTSPHWmldQygU1qolonn1dwiK+O44i1xlsLvFB2Fb+
 0I/bHI3y3vgTji07mqZbMkEAr0ooycMkmAQjdTsWAMPp/sL/uL5HpfjAv21+JUjOBr
 GHZUqElT1lulg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Fix reverse map real-mode
 address lookup with huge vmalloc
In-Reply-To: <20210526120005.3432222-1-npiggin@gmail.com>
References: <20210526120005.3432222-1-npiggin@gmail.com>
Date: Sat, 29 May 2021 09:36:29 +1000
Message-ID: <87sg26h1mq.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> real_vmalloc_addr() does not currently work for huge vmalloc, which is
> what the reverse map can be allocated with for radix host, hash guest.
>
> Extract the hugepage aware equivalent from eeh code into a helper, and
> convert existing sites including this one to use it.
>
> Fixes: 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

I changed the subject to "powerpc: ..." now that it's not just a KVM patch.

...

> diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
> index 51bbaae94ccc..ddba8761e58c 100644
> --- a/arch/powerpc/kernel/io-workarounds.c
> +++ b/arch/powerpc/kernel/io-workarounds.c
> @@ -65,22 +65,13 @@ struct iowa_bus *iowa_mem_find_bus(const PCI_IO_ADDR addr)
>  		bus = &iowa_busses[token - 1];
>  	else {
>  		unsigned long vaddr, paddr;
> -		pte_t *ptep;
>  
>  		vaddr = (unsigned long)PCI_FIX_ADDR(addr);
>  		if (vaddr < PHB_IO_BASE || vaddr >= PHB_IO_END)
>  			return NULL;
> -		/*
> -		 * We won't find huge pages here (iomem). Also can't hit
> -		 * a page table free due to init_mm
> -		 */
> -		ptep = find_init_mm_pte(vaddr, &hugepage_shift);
> -		if (ptep == NULL)
> -			paddr = 0;
> -		else {
> -			WARN_ON(hugepage_shift);
> -			paddr = pte_pfn(*ptep) << PAGE_SHIFT;
> -		}
> +
> +		paddr = ppc_find_vmap_phys(vaddr);
> +
>  		bus = iowa_pci_find(vaddr, paddr);
>  
>  		if (bus == NULL)

This needed:

diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
index ddba8761e58c..c877f074d174 100644
--- a/arch/powerpc/kernel/io-workarounds.c
+++ b/arch/powerpc/kernel/io-workarounds.c
@@ -55,7 +55,6 @@ static struct iowa_bus *iowa_pci_find(unsigned long vaddr, unsigned long paddr)
 #ifdef CONFIG_PPC_INDIRECT_MMIO
 struct iowa_bus *iowa_mem_find_bus(const PCI_IO_ADDR addr)
 {
-	unsigned hugepage_shift;
 	struct iowa_bus *bus;
 	int token;
 

cheers
