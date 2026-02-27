Return-Path: <linuxppc-dev+bounces-17426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPXQDIn/oWl4yAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:33:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9931BDACE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fN0QF52Rnz30Sv;
	Sat, 28 Feb 2026 07:33:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772224389;
	cv=none; b=MWPmvvz0PAn4npfqN8IrK0rabBaZxT8wEodP4dyiFALzYFpBuXopdIvowHeRA1J6+CgCh/3eeyOSso+vYM09h1FZwQP0kFq1FP4El+upz1UT1z1M5up0/OOTmG6UeONuZWmMJ5G3U437J52Mshtsj+MUSvfWUNtdNmw04IMGkWxS8uryNkG1K36oG5Ysquj6lKBVDGiRhj4JpMVHI7Vm3pYfW8VbvrF4dFbQ0niv4q28/pFNTy6lrJHLv42jaj6/nojCRZ3YcMHeuTzN7MpProPJWYnx9uPto+YxlukZsXFXCz+P7XwSOtN5TUf6px9PdcAIyYyaX30JVQORSWY5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772224389; c=relaxed/relaxed;
	bh=3uekEshW/xKjXBEvusLeqL0JjgByGtsyP7Oc65umvMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpiBNK/U2B6XpIX8/G8aKJhosL8oLDXe4I2RbCK+9oZkDFxjwdTLiJ0Wx4O7cVioTvWQwhQSfaSNAKPSuFG6WFJu8F1l9b5YKsJE+vhhXwxSRMg+5x5JNgOqRj1AiSS2cQCApm4LEmXSyOYe06c9ApQB+oTG+UZVkncGvdU7ALeu1XJ7y8wDIkIW9StHEgcpoJBl5L6cBb1LxMSfXZWbI0AxCwyTfEGQoAJy8TcslVFr6Xm4OFLnlIuf+yre/tfMwTMEuzD9OgJs5PiY+WitIfZsw4zYOIyYe6fX1T0Tr2T0Or/OxuMKDvGGbQnex5mhHl1I5ZeJBmeAiAcsAygU/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyjNx/Se; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyjNx/Se;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN0QD6Bxhz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:33:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C576E60126;
	Fri, 27 Feb 2026 20:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51087C116C6;
	Fri, 27 Feb 2026 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772224386;
	bh=slkBastChf5NkGimBBG2KdI1m6NFtJss7zAk/GegKbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyjNx/SeP9lh/TRrToS5vPssRYmhM4HT9p1ZWZKlb0Bfps1aFY3b6ChEAluMcTyYq
	 3U7EZvChT5nEPWS0froZu+zHpL2hUzCG/FRr3PUBmoB9hGZ+YSbEGTRqSbtjDbJpoX
	 /q2y6uMhPIYlb3FKpC21qDfAUzWgYxPBSAGneu3BwiVDF0rAUAepOiivNkEZgeF8bk
	 H0PnBeZPd4QvyYlIqu6qNM7d2zO6ovfkzqhykvPKdrvRNoo7J2XfX8F28TnEEU+D/C
	 9R/34qGAr4DTM2s/ktGhTON2adcaeWy8ZP9XdZsQzKLrxC0ocrSkeAGoh0kjvh4544
	 vm2RDzb9nfguA==
Date: Fri, 27 Feb 2026 22:33:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] mm/hugetlb.c: Use __pa() instead of virt_to_phys() in
 early bootmem alloc code
Message-ID: <aaH_fgdQB7gm9XtL@kernel.org>
References: <b4a7d2c6c4c1dd81dddc904fc21f01303290a4b8.1772107852.git.riteshh@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a7d2c6c4c1dd81dddc904fc21f01303290a4b8.1772107852.git.riteshh@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17426-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:linuxppc-dev@lists.ozlabs.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4D9931BDACE
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 05:56:30PM +0530, Ritesh Harjani (IBM) wrote:
> Architecture like powerpc, checks for pfn_valid() in their
> virt_to_phys() implementation (when CONFIG_DEBUG_VIRTUAL is enabled) [1].
> Commit d49004c5f0c1 "arch, mm: consolidate initialization of nodes, zones and memory map"
> changed the order of initialization between hugetlb_bootmem_alloc() and
> free_area_init(). This means, pfn_valid() can now return false in
> alloc_bootmem() path, since sparse_init() is not yet done.
> 
> Since, alloc_bootmem() uses memblock_alloc(.., MEMBLOCK_ALLOC_ACCESSIBLE), this
> means these allocations are always going to happen below high_memory, where
> __pa() should return valid physical addresses. Hence this patch converts
> the two callers of virt_to_phys() in alloc_bootmem() path to __pa() to avoid
> this bootup warning:
> 
>  ------------[ cut here ]------------
>  WARNING: arch/powerpc/include/asm/io.h:879 at virt_to_phys+0x44/0x1b8, CPU#0: swapper/0
>  Modules linked in:
>  <...>
>  NIP [c000000000601584] virt_to_phys+0x44/0x1b8
>  LR [c000000004075de4] alloc_bootmem+0x144/0x1a8
>  Call Trace:
>  [c000000004d1fb50] [c000000004075dd4] alloc_bootmem+0x134/0x1a8
>  [c000000004d1fba0] [c000000004075fac] __alloc_bootmem_huge_page+0x164/0x230
>  [c000000004d1fbe0] [c000000004030bc4] alloc_bootmem_huge_page+0x44/0x138
>  [c000000004d1fc10] [c000000004076e48] hugetlb_hstate_alloc_pages+0x350/0x5ac
>  [c000000004d1fd30] [c0000000040782f0] hugetlb_bootmem_alloc+0x15c/0x19c
>  [c000000004d1fd70] [c00000000406d7b4] mm_core_init_early+0x7c/0xdf4
>  [c000000004d1ff30] [c000000004011d84] start_kernel+0xac/0xc58
>  [c000000004d1ffe0] [c00000000000e99c] start_here_common+0x1c/0x20
> 
> [1]: https://lore.kernel.org/linuxppc-dev/87tsv5h544.ritesh.list@gmail.com/
> 
> Fixes: d49004c5f0c1 ("arch, mm: consolidate initialization of nodes, zones and memory map")
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/hugetlb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6e855a32de3d..43e0c95738a6 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3101,7 +3101,7 @@ static __init void *alloc_bootmem(struct hstate *h, int nid, bool node_exact)
>  			 * extract the actual node first.
>  			 */
>  			if (m)
> -				listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
> +				listnode = early_pfn_to_nid(PHYS_PFN(__pa(m)));
>  		}
> 
>  		if (m) {
> @@ -3160,7 +3160,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>  	 * The head struct page is used to get folio information by the HugeTLB
>  	 * subsystem like zone id and node id.
>  	 */
> -	memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
> +	memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
>  		huge_page_size(h) - PAGE_SIZE);
> 
>  	return 1;
> --
> 2.53.0
> 

-- 
Sincerely yours,
Mike.

