Return-Path: <linuxppc-dev+bounces-17687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELX/F1Tzp2nImwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:54:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2811FCFC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:54:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmh10LbPz3bp0;
	Wed, 04 Mar 2026 19:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614480;
	cv=none; b=E8Y5ORaCycBqYvtlZi7esCHPHRw1tZophcJrb1NYDhkaJnn/iRT14mb9JkM48CuEW4PHPSjBe9UIQKfF3Mo57sMLEM8uHkb1tvIzp5EirVwsj8prwtDZmX0XesXvRtHDjotFmwstLLbtjWW/3/EHVWbFVIEpxEg99cIysTgXR8tR7j+P+5/wNIGNy1VNoUYPCMNsIyJPwaq4Fd4hszx8+k4oe4NSSfTamUnU6zKCB7URh7IEgmMFgbbw0p2d1tLpnTd+Oy+5iQU4YRKzjylTXcN6w+XGra8gKhpK6kfuFiB8FDWastqyg6gNfh8ICKQMPRFG2RWtGwkmVuFSE/x93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614480; c=relaxed/relaxed;
	bh=bARe5vahzlBecaWQ8CByabip2fvZsODg61fvn/CTpxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foFzsBB1zm4khAx5xFygvyi7Ji72k0yPtFpGXhmTAHlO/IWZ7e2iGoMHVQheyYSZJKnLLQ9Wh+ANiUt8ukiqXzWXA9P+GuwrpVwTu2ih5O5JQy2W2HmyMC+qwErIW0ieBgMNv2DEBU70k5sG+SR3T/waoccu+Z/XgAniTDB5c5ihE12LYKwk0ufYJdiy9lT4cPQ5b5ApOIBxKEeC237wZT1Zq2PDXkJm5zuzoU67YegbEntQGo1FRl71m3q+p+ICSlzK4P2w7yPhRCZEL6tJDyNNsZMM+PWZRAdXEz/6UwvmfhUGUvNtMpDlDLorNnXHGaa8Q3yhTtwftXwqZOhjyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kN8+2zA1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kN8+2zA1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmh01DdLz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 19:54:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B6F060097;
	Wed,  4 Mar 2026 08:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B57C19423;
	Wed,  4 Mar 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772614477;
	bh=0bD5+ytOm5kpMEcwWBYleyhFBrc8X6uiBo5uYxm/1EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kN8+2zA1E6Ozz23iEINk4XkaIUU9MBTbgeDZPYooipd4PtNDfmE4BAF0rYq+/UfNY
	 NGadN4jE3eKkfm5kKgUtX9qKP6006J987V5HFaW+PF224G+z6mCOvYmASJIz9bygCi
	 7MkIO2hT8xBxlW0eD/MC8K0BSVwjhvNMpM8Z40SX2DYwRQNG/OxE9skSOBh7yWob7l
	 j+DiwTsiD9NH0Mig2jhEwuuKuIK1m/SgTjDKvyxtNpD3pbpXMxjUmpzijsY0PiPPpw
	 TWuz4+azrBUQEhzVAMbB8s3R2shHAxLHXLDieWd0gJBwgT4CqZr5ptXV7GvqzWmU51
	 d4QvbgLXqubAA==
Message-ID: <8112d5f0-8d4d-4c48-98f9-231c786e59d8@kernel.org>
Date: Wed, 4 Mar 2026 09:54:33 +0100
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
Subject: Re: [RFC v1 02/10] powerpc: book3s64: Fix unmap race with PMD THP
 migration entry
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
 <6a1d3d5992307e181082b35ba238d7e09acc77a6.1772013273.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <6a1d3d5992307e181082b35ba238d7e09acc77a6.1772013273.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 6E2811FCFC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17687-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,m:pavrampu@linux.vnet.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org,linux.vnet.ibm.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action



Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
> The following race is possible with migration swap entries or
> device-private THP entries. e.g. when move_pages is called on a PMD THP
> page, then there maybe an intermediate state, where PMD entry acts as
> a migration swap entry (pmd_present() is true). Then if an munmap
> happens at the same time, then this VM_BUG_ON() can happen in
> pmdp_huge_get_and_clear_full().
> 
> This patch fixes that.
> 
> Thread A: move_pages() syscall
>    add_folio_for_migration()
>      mmap_read_lock(mm)
>      folio_isolate_lru(folio)
>      mmap_read_unlock(mm)
> 
>    do_move_pages_to_node()
>      migrate_pages()
>        try_to_migrate_one()
>          spin_lock(ptl)
>          set_pmd_migration_entry()
>            pmdp_invalidate()     # PMD: _PAGE_INVALID | _PAGE_PTE | pfn
>            set_pmd_at()          # PMD: migration swap entry (pmd_present=0)
>          spin_unlock(ptl)
>          [page copy phase]       # <--- RACE WINDOW -->
> 
> Thread B: munmap()
>    mmap_write_downgrade(mm)
>    unmap_vmas() -> zap_pmd_range()
>      zap_huge_pmd()
>        __pmd_trans_huge_lock()
>          pmd_is_huge():          # !pmd_present && !pmd_none -> TRUE (swap entry)
>          pmd_lock() -> 		# spin_lock(ptl), waits for Thread A to release ptl
>        pmdp_huge_get_and_clear_full()
>          VM_BUG_ON(!pmd_present(*pmdp))  # HITS!
> 
> [  287.738700][ T1867] ------------[ cut here ]------------
> [  287.743843][ T1867] kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:187!
> cpu 0x0: Vector: 700 (Program Check) at [c00000044037f4f0]
>      pc: c000000000094ca4: pmdp_huge_get_and_clear_full+0x6c/0x23c
>      lr: c000000000645dec: zap_huge_pmd+0xb0/0x868
>      sp: c00000044037f790
>     msr: 800000000282b033
>    current = 0xc0000004032c1a00
>    paca    = 0xc000000004fe0000   irqmask: 0x03   irq_happened: 0x09
>      pid   = 1867, comm = a.out
> kernel BUG at :187!
> Linux version 6.19.0-12136-g14360d4f917c-dirty (powerpc64le-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #27 SMP PREEMPT Sun Feb 22 10:38:56 IST 2026
> enter ? for help
> [link register   ] c000000000645dec zap_huge_pmd+0xb0/0x868
> [c00000044037f790] c00000044037f7d0 (unreliable)
> [c00000044037f7d0] c000000000645dcc zap_huge_pmd+0x90/0x868
> [c00000044037f840] c0000000005724cc unmap_page_range+0x176c/0x1f40
> [c00000044037fa00] c000000000572ea0 unmap_vmas+0xb0/0x1d8
> [c00000044037fa90] c0000000005af254 unmap_region+0xb4/0x128
> [c00000044037fb50] c0000000005af400 vms_complete_munmap_vmas+0x138/0x310
> [c00000044037fbe0] c0000000005b0f1c do_vmi_align_munmap+0x1ec/0x238
> [c00000044037fd30] c0000000005b3688 __vm_munmap+0x170/0x1f8
> [c00000044037fdf0] c000000000587f74 sys_munmap+0x2c/0x40
> [c00000044037fe10] c000000000032668 system_call_exception+0x128/0x350
> [c00000044037fe50] c00000000000d05c system_call_vectored_common+0x15c/0x2ec
> ---- Exception: 3000 (System Call Vectored) at 0000000010064a2c
> SP (7fff9b1ee9c0) is in userspace
> 0:mon> zh
> 
> Fixes: 75358ea359e7c ("powerpc/mm/book3s64: Fix MADV_DONTNEED and parallel page fault race")
> Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/mm/book3s64/pgtable.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 4b09c04654a8..359092001670 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -210,8 +210,23 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
>   {
>   	pmd_t pmd;
>   	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
> -	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
> -		   !pmd_present(*pmdp));
> +	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)));
> +
> +	if (!pmd_present(*pmdp)) {
> +		/*
> +		 * Non-present PMDs can be migration entries or device-private
> +		 * THP entries. Since these are non-present, so there is no TLB
> +		 * backing. This happens when the address space is being
> +		 * unmapped zap_huge_pmd(), and we encounter non-present pmds.
> +		 * So it is safe to just clear the PMDs here. zap_huge_pmd(),
> +		 * will take care of withdraw of the deposited table.
> +		 */
> +		pmd = pmdp_get(pmdp);
> +		pmd_clear(pmdp);
> +		page_table_check_pmd_clear(vma->vm_mm, addr, pmd);
> +		return pmd;
> +	}
> +
>   	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
>   	/*
>   	 * if it not a fullmm flush, then we can possibly end up converting
> --
> 2.53.0
> 


