Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E566671360C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 20:16:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QT92x5XLhz3fJX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 04:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=llE6IRkx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.27; helo=out-27.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=llE6IRkx;
	dkim-atps=neutral
X-Greylist: delayed 379 seconds by postgrey-1.36 at boromir; Sun, 28 May 2023 04:15:22 AEST
Received: from out-27.mta0.migadu.com (out-27.mta0.migadu.com [91.218.175.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QT9224yz7z3f79
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 04:15:22 +1000 (AEST)
Date: Sat, 27 May 2023 18:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685210926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qro1ly8D0IN85bz01iVra27g5btF8pv3UlKO41a9+sM=;
	b=llE6IRkx/n91QHSJfUuz8Lvf36Zsdvbsda8s4+YDAphela0hHMrM+udZgnGOhdOMmdcMem
	6eMFZGQIhSrfmCXeAFxKmM8bvTDiACcfidzZol+st9/hDl3h5IknZGYlF6wWBlLroxmus0
	h5pa83O4YLhVJG62l7K1d5yuFK61noU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 04/10] kvm/arm64: make stage2 page tables
 RCU safe
Message-ID: <ZHJHJPBF6euzOFdw@linux.dev>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-5-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-5-yuzhao@google.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yu,

On Fri, May 26, 2023 at 05:44:29PM -0600, Yu Zhao wrote:
> Stage2 page tables are currently not RCU safe against unmapping or VM
> destruction. The previous mmu_notifier_ops members rely on
> kvm->mmu_lock to synchronize with those operations.
> 
> However, the new mmu_notifier_ops member test_clear_young() provides
> a fast path that does not take kvm->mmu_lock. To implement
> kvm_arch_test_clear_young() for that path, unmapped page tables need
> to be freed by RCU and kvm_free_stage2_pgd() needs to be after
> mmu_notifier_unregister().
> 
> Remapping, specifically stage2_free_removed_table(), is already RCU
> safe.
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h |  2 ++
>  arch/arm64/kvm/arm.c                 |  1 +
>  arch/arm64/kvm/hyp/pgtable.c         |  8 ++++++--
>  arch/arm64/kvm/mmu.c                 | 17 ++++++++++++++++-
>  4 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index ff520598b62c..5cab52e3a35f 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -153,6 +153,7 @@ static inline bool kvm_level_supports_block_mapping(u32 level)
>   * @put_page:			Decrement the refcount on a page. When the
>   *				refcount reaches 0 the page is automatically
>   *				freed.
> + * @put_page_rcu:		RCU variant of the above.

You don't need to add yet another hook to implement this. I was working
on lock-free walks in a separate context and arrived at the following:

commit f82d264a37745e07ee28e116c336f139f681fd7f
Author: Oliver Upton <oliver.upton@linux.dev>
Date:   Mon May 1 08:53:37 2023 +0000

    KVM: arm64: Consistently use free_removed_table() for stage-2
    
    free_removed_table() is essential to the RCU-protected parallel walking
    scheme, as behind the scenes the cleanup is deferred until an RCU grace
    period. Nonetheless, the stage-2 unmap path calls put_page() directly,
    which leads to table memory being freed inline with the table walk.
    
    This is safe for the time being, as the stage-2 unmap walker is called
    while holding the write lock. A future change to KVM will further relax
    the locking mechanics around the stage-2 page tables to allow lock-free
    walkers protected only by RCU. As such, switch to the RCU-safe mechanism
    for freeing table memory.
    
    Signed-off-by: Oliver Upton <oliver.upton@linux.dev>

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 3d61bd3e591d..bfbebdcb4ef0 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1019,7 +1019,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 					       kvm_granule_size(ctx->level));
 
 	if (childp)
-		mm_ops->put_page(childp);
+		mm_ops->free_removed_table(childp, ctx->level);
 
 	return 0;
 }

-- 
Thanks,
Oliver
