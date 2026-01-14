Return-Path: <linuxppc-dev+bounces-15683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D0D1CCCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 08:21:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drcwv0H2Vz2xpm;
	Wed, 14 Jan 2026 18:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768375278;
	cv=none; b=mwa/Vcr9uZUcyN9eBCLHFv21ddbMWnkMSRaqI/tSfdGa1f4E+mRsrHgDFjUbJggpN25JfMhfBtfd4JD89tYhvNs9+URT/FTDiuD/fvXcTRoNv9Mt53Fm/m4CPj3G6liAO8VgC+bHwdpimYPsRtBLw+dNzIFne1qE0VZFqjU+5HsvlvvLGJEnZ5qs91uHMrKyCgCCyDEKlwMEiy1hutDQYdW30T/7OnOxrdWpCcIhq0+bxRN7uYsKQ8QQaUOgzSiESGr6d6BwkGc5XQlVT25te4uIBLY2s3DG0C1iULLgGEOHy5J5M9THjBXEbF8zCcY3CWf1GvNUF/UUWWPyOYjbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768375278; c=relaxed/relaxed;
	bh=USGtV3+n93v8pp6pT/3Zgm6YGfywpo0PJVEBtkCCeSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqtu9V3zE8TDBM+dUTZIDB97qP20zve+GdBGU7C1fV91ytot7KK3IOPaEykMA349T4ru92sL9KgQHMZ/9epQ6E4pgphu245QwWR7kdGGBB+DuKY2+cNJOmmcZtkWYYF8L9BePdrD1FvR5DXJYSyDeSzufEReHcljKy9zQ3htp7CN/CPkynaq7JhYACDZ+zWXtbwws+l/Xi9X3D14NUSyrYGE4GSXyFAwZqtPwoWaOTRggMlWsVxUPprAfUUNQiJJ65ax3OXQE0U240AjoMetHVfFGwb6nnsDJxr+0U1pHlvC287MQVLi9eGH8vkpZvMbJT4C8OSK7HNbeUmivEfsrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=GLYRdRw6 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=GLYRdRw6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drcws4jpNz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 18:21:17 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4drcwp38sWz1DR2b;
	Wed, 14 Jan 2026 08:21:14 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4drcwm54NNz1DDXY;
	Wed, 14 Jan 2026 08:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768375274;
	bh=USGtV3+n93v8pp6pT/3Zgm6YGfywpo0PJVEBtkCCeSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GLYRdRw6BcVYpXpDzS8ZqYhxtT7bZEqyt6FuYL8Og+uuX6KmBzkodf4AAzTgQK8Vj
	 6QbBYuy/EUx3fCM7vga1p7zdd9seT9SSuJ28fck7TvCAs/Gwc0UpWogq+FDfeMLhxP
	 Q9tIWi9KAy3JY7vvXnVldebdrOSI6/xQmw6aZqkHZJU9FXjDY0poTHU/LzOD1ekgYF
	 2nFh0u8d2uWVggyereuQ0MAq07iXxOjlDmJmNDlViRxcJ4I2srsAz+uaxP1y7echmT
	 rgWILKmtxf/xBcRfC4IBmOKjPaCa/8zHfl4NRJCZIC9TqeetLFcYzLPvsXlK9du/pk
	 oxIYdU3UlZQgw==
Message-ID: <544172e4-cdf7-4789-8cad-4dc3c498e497@gaisler.com>
Date: Wed, 14 Jan 2026 08:21:12 +0100
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
Subject: Re: [PATCH v6 12/14] sparc/mm: replace batch->active with
 is_lazy_mmu_mode_active()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-13-kevin.brodsky@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251215150323.2218608-13-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-12-15 16:03, Kevin Brodsky wrote:
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper
> is_lazy_mmu_mode_active() to tell whether a batch struct is active
> instead of tracking it explicitly.
> 
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/sparc/include/asm/tlbflush_64.h | 1 -
>  arch/sparc/mm/tlb.c                  | 9 +--------
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 4e1036728e2f..6133306ba59a 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -12,7 +12,6 @@ struct tlb_batch {
>  	unsigned int hugepage_shift;
>  	struct mm_struct *mm;
>  	unsigned long tlb_nr;
> -	unsigned long active;
>  	unsigned long vaddrs[TLB_BATCH_NR];
>  };
>  
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 7b5dfcdb1243..3a852071d260 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,11 +52,7 @@ void flush_tlb_pending(void)
>  
>  void arch_enter_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb;
> -
>  	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> -	tb->active = 1;
>  }
>  
>  void arch_flush_lazy_mmu_mode(void)
> @@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
>  
>  void arch_leave_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> -
>  	arch_flush_lazy_mmu_mode();
> -	tb->active = 0;
>  	preempt_enable();
>  }
>  
> @@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
>  		nr = 0;
>  	}
>  
> -	if (!tb->active) {
> +	if (!is_lazy_mmu_mode_active()) {
>  		flush_tsb_user_page(mm, vaddr, hugepage_shift);
>  		global_flush_tlb_page(mm, vaddr);
>  		goto out;

Acked-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas


