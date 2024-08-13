Return-Path: <linuxppc-dev+bounces-61-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B565E950588
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 14:50:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MbcVogWx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjrnq4DL4z2yF4;
	Tue, 13 Aug 2024 22:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MbcVogWx;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjrnq0M6Sz2y81
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 22:50:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723553406;
	bh=3JTj5OrR4YCVo4xbpaM1+3vNhDyPwwq6JrLH7UwwKog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MbcVogWxm8B5kX2RxPVpBX6D+wT9QM6+TJf/xnYyEoTtHe/IusCt0b/jFusolJoDh
	 69bhGuVRAKsCELkguiBlzmEIyZu25DdDEpIGBUKl2LcHP6PvN6luAO1CYP04pxOu6R
	 DYI8rd+STVQGe/6xBr9v8PjCwKW5vwCiVa89qYHjvOCy2OGHx7Qgicx7dP6plDnGZf
	 ToDdNthdsM7avYVQ5oy3Py/CihGgg9iuqSfc9a6Hrc6kffElUkjx1YcC6tp6MLAnqF
	 e4n04wp7/z+y0GD5e1MTOSLc/ShjXhJjB+gk8TbT/H6VM9w9OicIGpOc7pO8VvahIr
	 +h5kFkHW0SgEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wjrnm3Rq6z4w2R;
	Tue, 13 Aug 2024 22:50:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: "Kirill A . Shutemov" <kirill@shutemov.name>, Nicholas Piggin
 <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>, Matthew Wilcox
 <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, James
 Houghton <jthoughton@google.com>, Huang Ying <ying.huang@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, peterx@redhat.com,
 Vlastimil Babka <vbabka@suse.cz>, Rick P Edgecombe
 <rick.p.edgecombe@intel.com>, Hugh Dickins <hughd@google.com>, Borislav
 Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rik
 van Riel <riel@surriel.com>, Dan Williams <dan.j.williams@intel.com>, Mel
 Gorman <mgorman@techsingularity.net>, x86@kernel.org, Ingo Molnar
 <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, Oscar
 Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 0/7] mm/mprotect: Fix dax puds
In-Reply-To: <20240812181225.1360970-1-peterx@redhat.com>
References: <20240812181225.1360970-1-peterx@redhat.com>
Date: Tue, 13 Aug 2024 22:50:04 +1000
Message-ID: <87plqc1tab.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Peter Xu <peterx@redhat.com> writes:
> [Based on mm-unstable, commit 98808d08fc0f, Aug 7th. NOTE: it is
>  intentional to not have rebased to latest mm-unstable, as this is to
>  replace the queued v4]
>
> v5 Changelog:
> - Rename patch subject "mm/x86: arch_check_zapped_pud()", add "Implement" [tglx]
> - Mostly rewrote commit messages for the x86 patches, follow -tip rules [tglx]
> - Line wrap fixes (to mostly avoid newlines when unnecessary) [tglx]
> - English fixes [tglx]
> - Fix a build issue only happens with i386 pae + clang
>   https://lore.kernel.org/r/202408111850.Y7rbVXOo-lkp@intel.com
>
> v1: https://lore.kernel.org/r/20240621142504.1940209-1-peterx@redhat.com
> v2: https://lore.kernel.org/r/20240703212918.2417843-1-peterx@redhat.com
> v3: https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
> v4: https://lore.kernel.org/r/20240807194812.819412-1-peterx@redhat.com
>
> Dax supports pud pages for a while, but mprotect on puds was missing since
> the start.  This series tries to fix that by providing pud handling in
> mprotect().  The goal is to add more types of pud mappings like hugetlb or
> pfnmaps.  This series paves way for it by fixing known pud entries.
>
> Considering nobody reported this until when I looked at those other types
> of pud mappings, I am thinking maybe it doesn't need to be a fix for stable
> and this may not need to be backported.  I would guess whoever cares about
> mprotect() won't care 1G dax puds yet, vice versa.  I hope fixing that in
> new kernels would be fine, but I'm open to suggestions.
>
> There're a few small things changed to teach mprotect work on PUDs. E.g. it
> will need to start with dropping NUMA_HUGE_PTE_UPDATES which may stop
> making sense when there can be more than one type of huge pte.  OTOH, we'll
> also need to push the mmu notifiers from pmd to pud layers, which might
> need some attention but so far I think it's safe.  For such details, please
> refer to each patch's commit message.
>
> The mprotect() pud process should be straightforward, as I kept it as
> simple as possible.  There's no NUMA handled as dax simply doesn't support
> that.  There's also no userfault involvements as file memory (even if work
> with userfault-wp async mode) will need to split a pud, so pud entry
> doesn't need to yet know userfault's existance (but hugetlb entries will;
> that's also for later).
>
> Tests
> =====
>
> What I did test:
>
> - cross-build tests that I normally cover [1]
>
> - smoke tested on x86_64 the simplest program [2] on dev_dax 1G PUD
>   mprotect() using QEMU's nvdimm emulations [3] and ndctl to create
>   namespaces with proper alignments, which used to throw "bad pud" but now
>   it'll run through all fine.  I checked sigbus happens if with illegal
>   access on protected puds.
>
> - vmtests.
>
> What I didn't test:
>
> - fsdax: I wanted to also give it a shot, but only until then I noticed it
>   doesn't seem to be supported (according to dax_iomap_fault(), which will
>   always fallback on PUD_ORDER).  I did remember it was supported before, I
>   could miss something important there.. please shoot if so.
>
> - userfault wp-async: I also wanted to test userfault-wp async be able to
>   split huge puds (here it's simply a clear_pud.. though), but it won't
>   work for devdax anyway due to not allowed to do smaller than 1G faults in
>   this case. So skip too.
>
> - Power, as no hardware on hand.

Does it need some specific configuration, or just any Power machine will do?

cheers

