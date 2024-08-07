Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB994B210
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:23:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=kTH2K96F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfNTT5Z13z3d96
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 07:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=kTH2K96F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfNSq4Vnxz3cmV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 07:23:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8D54CE104C;
	Wed,  7 Aug 2024 21:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5492CC32781;
	Wed,  7 Aug 2024 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723065798;
	bh=5TeacULXpvoFK35sDeqFFGloS/Xk45IocGQ+pCFA1LU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kTH2K96FIchSUF8CqRAEuvGsFOqDp0pEqwfQtA61rNeoMT6EQichhOCDdgAB/PZ4q
	 5OGZjb/Czsefmbiep4IM10TTePzuqLaeQH1qeIDHQWCTUWYGAksRZP7OT8WUgRUhM9
	 8VPDuwGGVeA5N9V4HmPIvreZjN6ixFaOm5vUOUW8=
Date: Wed, 7 Aug 2024 14:23:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Message-Id: <20240807142316.bbad141a106093b6f36249e2@linux-foundation.org>
In-Reply-To: <20240807194812.819412-1-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  7 Aug 2024 15:48:04 -0400 Peter Xu <peterx@redhat.com> wrote:

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

OK.  Who are you addressing this question to?

> - userfault wp-async: I also wanted to test userfault-wp async be able to
>   split huge puds (here it's simply a clear_pud.. though), but it won't
>   work for devdax anyway due to not allowed to do smaller than 1G faults in
>   this case. So skip too.

Sounds OK.  So that's an additional project if anyone cares enough?

> - Power, as no hardware on hand.

Hopefully the powerpc people can help with that.  What tests do you ask
that they run?

