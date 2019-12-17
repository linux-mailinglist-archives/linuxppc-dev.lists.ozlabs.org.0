Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77912275B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 10:11:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cXSG3zVYzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 20:11:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="pj9zXHNB"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cXQF4MCrzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 20:09:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LLbbhzPHRdMFZlP/HUcM9v4cCpiGyzf8ItvqlMapKa8=; b=pj9zXHNBi1JNV2/wNvFPR6io8
 555ewGWGCwse9AsiEmr4M5iAc0J7SLwy26abo/ALaQHP04NR+qgvNMlB8KoVuxGe/n5UAr3EujzWg
 iYKy/dcOUWBMcs9UKDphelfO9oH9193OSeBHkBS1phDidmJU31C32xi9zA4R6al7g+jEi5X7T8zed
 r1LWstxJYJ7elRHiJrIXqTrjszQGPLZ14W7ROal+qPqhKHo+w30L2al+zCvfC+XPpffEM+IrjP46T
 bZWKuEo+Somid/yRUSFT/K+1BSXMlTxVWAEudgrsDENu2LL2cdRWNwrUvlqI/ETZ1CKY4gtUbGL0Y
 2gv1SEecQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih8qy-0001tB-2n; Tue, 17 Dec 2019 09:09:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 102233035D4;
 Tue, 17 Dec 2019 10:07:52 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 931D82B3D7E81; Tue, 17 Dec 2019 10:09:14 +0100 (CET)
Date: Tue, 17 Dec 2019 10:09:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] mm/mmu_gather: Invalidate TLB correctly on batch
 allocation failure and flush
Message-ID: <20191217090914.GX2844@hirez.programming.kicks-ass.net>
References: <20191217071713.93399-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217071713.93399-1-aneesh.kumar@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 17, 2019 at 12:47:12PM +0530, Aneesh Kumar K.V wrote:
> Architectures for which we have hardware walkers of Linux page table should
> flush TLB on mmu gather batch allocation failures and batch flush. Some
> architectures like POWER supports multiple translation modes (hash and radix)
> and in the case of POWER only radix translation mode needs the above TLBI.
> This is because for hash translation mode kernel wants to avoid this extra
> flush since there are no hardware walkers of linux page table. With radix
> translation, the hardware also walks linux page table and with that, kernel
> needs to make sure to TLB invalidate page walk cache before page table pages are
> freed.

> Based on changes from Peter Zijlstra <peterz@infradead.org>

AFAICT it is all my patch ;-)

Anyway, this commit:

> More details in
> commit: d86564a2f085 ("mm/tlb, x86/mm: Support invalidating TLB caches for RCU_TABLE_FREE")

states that you do an explicit invalidate in __p*_free_tlb(), which, if
I'm not mistaken is still there:

  arch/powerpc/include/asm/nohash/pgalloc.h:      tlb_flush_pgtable(tlb, address);

Or am I reading this wrong? I'm thinking you can remove that now.

> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
> index b2c0be93929d..feea1a09bbce 100644
> --- a/arch/powerpc/include/asm/tlb.h
> +++ b/arch/powerpc/include/asm/tlb.h
> @@ -27,6 +27,10 @@
>  #define tlb_flush tlb_flush
>  extern void tlb_flush(struct mmu_gather *tlb);
>  
> +#ifdef CONFIG_HAVE_RCU_TABLE_FREE
/*
 * PPC-Hash does not use the linux page-tables, so we can avoid
 * the TLBI for page-table freeing, PPC-Radix otoh does use the
 * page-tables and needs the TLBI.
 */
> +#define tlb_needs_table_invalidate()	radix_enabled()
> +#endif

Also, are you really sure about the !SMP case? Esp. on Radix I'm
thinking that the PWC (page-walk-cache) can give trouble even on UP,
when we get preempted in the middle of mmu_gather. Hmm?

>  /* Get the generic bits... */
>  #include <asm-generic/tlb.h>


