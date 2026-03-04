Return-Path: <linuxppc-dev+bounces-17686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGC2G/3yp2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:53:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CA1FCF75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmfJ3JGkz3bp0;
	Wed, 04 Mar 2026 19:53:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614392;
	cv=none; b=gYNJqcisENN4Km2UZa+2dN2MLnIRKYNhHDMys+Qfnty3ZZhyybL2nudOH/MweWvxAK35004T/4irlkYd5YBYneKEWgPyEFNZaIcP3tySf+isI8MIcRF1hzQNE5m/SV72ydBid6M0lkiVRxQT1Rxr/a531RsZFv5/WVuP77yleMEAMa7+FYW2OFBYd+kMAMvxYf3Nf6Qh2WebPOGqSDAXltL4amkAydeRg/bbowINQbLZpLL82pTvgcCnZ02WHIah/x71We/UmCydZc6XouvPhKsQ6A+dJ59vJ+Sqv78yiJPBgiauc1u5WY+kbyRMUOY97p7tbvqsArkz/KqK4uk19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614392; c=relaxed/relaxed;
	bh=B+66wSXz/9KLmuQpespPML/K60CzBNJY07z8y0t/IFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FiaSG5K2WNf2rW1LtwXMfikjM80qqZ71W7ENZxmw0Iks1UfyipD+39eRsNeR6ge58mUnyP4YwocWRUlD3bo0MM1uLAKNcxB2GLZQABR0Fz7DMakf0j6WX4F+pkOVOl+R1DfU6nl4aOHhkwPRzIQfH5Nop/6KYq3raaqLWkT25UBiApOqQ9UcSNvHoXEM5QrN4B0zy0OjpPPs+7Ya2UZYV83fp3ne53g2XuLTfo5cZGQBDfEo2jWzWbavc6GHZEScXEY+2ruuRmpl+yam4u9Lg7aeBlWZYazO3LAFFtRiihIZhyutFT2IrUw8dTKRujiw0CIuk5aDaWy7bc6U0QOksQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q+bToVKt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q+bToVKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmfH2rtyz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 19:53:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72C3060097;
	Wed,  4 Mar 2026 08:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6172BC19423;
	Wed,  4 Mar 2026 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772614389;
	bh=StrbMlm959BwZ1b5TDceBEL1IlRGm/TfDepBkeRT8uw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q+bToVKtQ2sUUyFzW+MxYpCg3+2ivPfzpfkh6tCpuQA+fUBho85lQp0PgSq+teUTe
	 i6/A2APPoeK4WgG9y2lhic2AZf/QYU9E/fSvBfDYkJkupYpNAQ94SZaseL4R9ERdwR
	 QWaS0H0aC2vCR3BZgQUr1CYr+YAS1AFuunQDCS2Fn+Q0xH2/aNXHPHNJe1KZC/+NPd
	 SRhNFHFqR03qBPTUGX2WeGOEBvRcFYiPr5D5g0T8nyvuXHcS13XrdMcEfRludkG2/5
	 K5QzQDQSzbRfjjZvn4dX9Syj8KgM0K8XoaBy5m8qI3pCG4ulaLW4+dSXxfQsh49VoT
	 VNL8NpDdK7fug==
Message-ID: <e10b3f59-603b-4d7f-a4bf-91f4e9f51ae7@kernel.org>
Date: Wed, 4 Mar 2026 09:53:05 +0100
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
Subject: Re: [RFC v1 01/10] powerpc/pgtable-frag: Fix bad page state in
 pte_frag_destroy
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
 <62dfff55a7f4f465ac1f8077cee93e6e87ebddd0.1772013273.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <62dfff55a7f4f465ac1f8077cee93e6e87ebddd0.1772013273.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 8E6CA1FCF75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17686-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action



Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
> powerpc uses pt_frag_refcount as a reference counter for tracking it's
> pte and pmd page table fragments. For PTE table, in case of Hash with
> 64K pagesize, we have 16 fragments of 4K size in one 64K page.
> 
> Patch series [1] "mm: free retracted page table by RCU"
> added pte_free_defer() to defer the freeing of PTE tables when
> retract_page_tables() is called for madvise MADV_COLLAPSE on shmem
> range.
> [1]: https://lore.kernel.org/all/7cd843a9-aa80-14f-5eb2-33427363c20@google.com/
> 
> pte_free_defer() sets the active flag on the corresponding fragment's
> folio & calls pte_fragment_free(), which reduces the pt_frag_refcount.
> When pt_frag_refcount reaches 0 (no active fragment using the folio), it
> checks if the folio active flag is set, if set, it calls call_rcu to
> free the folio, it the active flag is unset then it calls pte_free_now().
> 
> Now, this can lead to following problem in a corner case...
> 
> [  265.351553][  T183] BUG: Bad page state in process a.out  pfn:20d62
> [  265.353555][  T183] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x20d62
> [  265.355457][  T183] flags: 0x3ffff800000100(active|node=0|zone=0|lastcpupid=0x7ffff)
> [  265.358719][  T183] raw: 003ffff800000100 0000000000000000 5deadbeef0000122 0000000000000000
> [  265.360177][  T183] raw: 0000000000000000 c0000000119caf58 00000000ffffffff 0000000000000000
> [  265.361438][  T183] page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
> [  265.362572][  T183] Modules linked in:
> [  265.364622][  T183] CPU: 0 UID: 0 PID: 183 Comm: a.out Not tainted 6.18.0-rc3-00141-g1ddeaaace7ff-dirty #53 VOLUNTARY
> [  265.364785][  T183] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
> [  265.364908][  T183] Call Trace:
> [  265.364955][  T183] [c000000011e6f7c0] [c000000001cfaa18] dump_stack_lvl+0x130/0x148 (unreliable)
> [  265.365202][  T183] [c000000011e6f7f0] [c000000000794758] bad_page+0xb4/0x1c8
> [  265.365384][  T183] [c000000011e6f890] [c00000000079c020] __free_frozen_pages+0x838/0xd08
> [  265.365554][  T183] [c000000011e6f980] [c0000000000a70ac] pte_frag_destroy+0x298/0x310
> [  265.365729][  T183] [c000000011e6fa30] [c0000000000aa764] arch_exit_mmap+0x34/0x218
> [  265.365912][  T183] [c000000011e6fa80] [c000000000751698] exit_mmap+0xb8/0x820
> [  265.366080][  T183] [c000000011e6fc30] [c0000000001b1258] __mmput+0x98/0x300
> [  265.366244][  T183] [c000000011e6fc80] [c0000000001c81f8] do_exit+0x470/0x1508
> [  265.366421][  T183] [c000000011e6fd70] [c0000000001c95e4] do_group_exit+0x88/0x148
> [  265.366602][  T183] [c000000011e6fdc0] [c0000000001c96ec] pid_child_should_wake+0x0/0x178
> [  265.366780][  T183] [c000000011e6fdf0] [c00000000003a270] system_call_exception+0x1b0/0x4e0
> [  265.366958][  T183] [c000000011e6fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> 
> The bad page state error occurs when such a folio gets freed (with
> active flag set), from do_exit() path in parallel.
> 
> ... this can happen when the pte fragment was allocated from this folio,
> but when all the fragments get freed, the pte_frag_refcount still had some
> unused fragments. Now, if this process exits, with such folio as it's cached
> pte_frag in mm->context, then during pte_frag_destroy(), we simply call
> pagetable_dtor() and pagetable_free(), meaning it doesn't clear the
> active flag. This, can lead to the above bug. Since we are anyway in
> do_exit() path, then if the refcount is 0, then I guess it should be
> ok to simply clear the folio active flag before calling pagetable_dtor()
> & pagetable_free().
> 
> Fixes: 32cc0b7c9d50 ("powerpc: add pte_free_defer() for pgtables sharing page")
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/mm/pgtable-frag.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index 77e55eac16e4..ae742564a3d5 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -25,6 +25,7 @@ void pte_frag_destroy(void *pte_frag)
>   	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
>   	/* We allow PTE_FRAG_NR fragments from a PTE page */
>   	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
> +		folio_clear_active(ptdesc_folio(ptdesc));
>   		pagetable_dtor(ptdesc);
>   		pagetable_free(ptdesc);
>   	}


