Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B76EB47E300
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 13:10:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKTXf4pgBz3cBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 23:10:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VZoDl5yI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKTX00M5Mz2yfr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 23:09:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VZoDl5yI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JKTWy6QMCz4xmv;
 Thu, 23 Dec 2021 23:09:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640261375;
 bh=1siwOFFYtHZKwcy5kaBtuBB1w+GNVODRs2v3Bz3XFmo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VZoDl5yIll8mfNypSDImwT8BfYJpgWtZVSLJE9ro7S+4dxphp4hgv6LRMp84uivNr
 TaaOz6AaOOY5rX+/N1Zd4Ql21GwTymw52MSwQGzma7R/2yHWTMj1IKeST7CExcFeZ3
 +tnPioruVIJ5Tft6vlOKunm0GLzSu1+H6bJ2ZMOgZFR7IIowP4o0xlLgmJ1CsrTjZA
 zxw1WDo3OCnejfW/fhWdUvtdh8SzsdQpWOE62OfgGm7mPqtmhHpOuxMMbnKKcH1/gf
 x7zUtxxOTInc1+M0jw9GZmP1KkljR3rvRf6Ck1J6j93x+W+FJn/f34MAzA//xLQEfs
 J+wAdARCD/LCw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
In-Reply-To: <112b55c5fe019fefc284e3361772b00345fa0967.1639676816.git.christophe.leroy@csgroup.eu>
References: <112b55c5fe019fefc284e3361772b00345fa0967.1639676816.git.christophe.leroy@csgroup.eu>
Date: Thu, 23 Dec 2021 23:09:34 +1100
Message-ID: <871r2334ld.fsf@mpe.ellerman.id.au>
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
Cc: Maxime Bizon <mbizon@freebox.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> included a spin_lock() to change_page_attr() in order to
> safely perform the three step operations. But then
> commit 9f7853d7609d ("powerpc/mm: Fix set_memory_*() against
> concurrent accesses") modify it to use pte_update() and do
> the operation atomically.

It's not really atomic, it's just safe against concurrent access.

We still do a read / modify / write of the pte value.

Which isn't safe against concurrent calls to change_page_attr() for the
same address.

But maybe that's OK? AFAICS other architectures (eg. arm64) have no
protection against concurrent callers. I think the assumption is higher
level code is ensuring there's only a single caller at a time.

On the other hand x86 and s390 do have locking (cpa_lock / cpa_mutex).
But it seems that's mostly to protect against splitting of page tables,
which we aren't doing.

We'd be a bit safer if we used pte_update() "properly", like I did in:

  https://lore.kernel.org/linuxppc-dev/20210817132552.3375738-1-mpe@ellerman.id.au/


cheers

> In the meantime, Maxime reported some spinlock recursion.
>
> [   15.351649] BUG: spinlock recursion on CPU#0, kworker/0:2/217
> [   15.357540]  lock: init_mm+0x3c/0x420, .magic: dead4ead, .owner: kworker/0:2/217, .owner_cpu: 0
> [   15.366563] CPU: 0 PID: 217 Comm: kworker/0:2 Not tainted 5.15.0+ #523
> [   15.373350] Workqueue: events do_free_init
> [   15.377615] Call Trace:
> [   15.380232] [e4105ac0] [800946a4] do_raw_spin_lock+0xf8/0x120 (unreliable)
> [   15.387340] [e4105ae0] [8001f4ec] change_page_attr+0x40/0x1d4
> [   15.393413] [e4105b10] [801424e0] __apply_to_page_range+0x164/0x310
> [   15.400009] [e4105b60] [80169620] free_pcp_prepare+0x1e4/0x4a0
> [   15.406045] [e4105ba0] [8016c5a0] free_unref_page+0x40/0x2b8
> [   15.411979] [e4105be0] [8018724c] kasan_depopulate_vmalloc_pte+0x6c/0x94
> [   15.418989] [e4105c00] [801424e0] __apply_to_page_range+0x164/0x310
> [   15.425451] [e4105c50] [80187834] kasan_release_vmalloc+0xbc/0x134
> [   15.431898] [e4105c70] [8015f7a8] __purge_vmap_area_lazy+0x4e4/0xdd8
> [   15.438560] [e4105d30] [80160d10] _vm_unmap_aliases.part.0+0x17c/0x24c
> [   15.445283] [e4105d60] [801642d0] __vunmap+0x2f0/0x5c8
> [   15.450684] [e4105db0] [800e32d0] do_free_init+0x68/0x94
> [   15.456181] [e4105dd0] [8005d094] process_one_work+0x4bc/0x7b8
> [   15.462283] [e4105e90] [8005d614] worker_thread+0x284/0x6e8
> [   15.468227] [e4105f00] [8006aaec] kthread+0x1f0/0x210
> [   15.473489] [e4105f40] [80017148] ret_from_kernel_thread+0x14/0x1c
>
> Remove the spin_lock() in change_page_attr().
>
> Reported-by: Maxime Bizon <mbizon@freebox.fr>
> Link: https://lore.kernel.org/all/20211212112152.GA27070@sakura/
> Cc: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/pageattr.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index edea388e9d3f..308adc51da9d 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -30,8 +30,6 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  	long action = (long)data;
>  	pte_t pte;
>  
> -	spin_lock(&init_mm.page_table_lock);
> -
>  	pte = ptep_get(ptep);
>  
>  	/* modify the PTE bits as desired, then apply */
> @@ -61,8 +59,6 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  
>  	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  
> -	spin_unlock(&init_mm.page_table_lock);
> -
>  	return 0;
>  }
>  
> -- 
> 2.33.1
