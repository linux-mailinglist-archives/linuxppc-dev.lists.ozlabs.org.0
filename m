Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A173DFC23
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 09:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfk720fLpz3dBx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 17:35:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Bazz9ZBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Bazz9ZBL; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfk6W3shNz30C6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 17:35:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GtjZ3ipXeKj8P4xNvYP5472scFiSXgWwNFMV9QOGauI=; b=Bazz9ZBLOe91WaVB1byxI1W2Ej
 5/vfo616togbzfW5E9qw9JSBNuCvtzXzTUAxNW+TA/GHozqvkt7ENMyUammSZPBLGnPVPYJfOYEQf
 sxgj6pHsBB5P2lXyHmFRcmjdAvVW9gZJGqbZfZQqbRKsGPdJpOPUNm9Xe97nQ2mZ/zl+7rAzXkyaE
 SkU8TvyaWkX2aJ6+Hr8UBrvkUnhQ+T+rb1OwhIjeKrajLFpSaPPHAFxgRABi3EBnGojVhQCk+u767
 ImVNqgPJ7kaPFv+mwQuk28PlTmCk9ad1tzAzwpyxra1gj9AjtZ0ifxyytT523oJW/dKvFnhPO1AIK
 YE1RCHUw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBBQ4-005WsN-Ii; Wed, 04 Aug 2021 07:34:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9BE533000F2;
 Wed,  4 Aug 2021 09:34:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 73930200BAB53; Wed,  4 Aug 2021 09:34:26 +0200 (CEST)
Date: Wed, 4 Aug 2021 09:34:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID
 tlbie if we cross PMD_SIZE
Message-ID: <YQpDAjlYIWTxr56g@hirez.programming.kicks-ass.net>
References: <20210803143725.615186-1-aneesh.kumar@linux.ibm.com>
 <1628053302.0qclx0xcj9.astroid@bobo.none>
 <1628058455.rphrivzjzb.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628058455.rphrivzjzb.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 04, 2021 at 04:39:44PM +1000, Nicholas Piggin wrote:
> For that matter, I wonder if we shouldn't do something like this 
> (untested) so the low level batch flush has visibility to the high
> level flush range.
> 
> x86 could use this too AFAIKS, just needs to pass the range a bit
> further down, but in practice I'm not sure it would ever really
> matter for them because the 2MB level exceeds the single page flush
> ceiling for 4k pages unlike powerpc with 64k pages. But in corner
> cases where the unmap crossed a bunch of small vmas or the ceiling
> was increased then in theory it could be of use.

x86 can do single invalidates for 2M pages if that's the only type
encountered in the range, at which point we can do 33*2M = 66M, which is
well below the 1G range for the next level of huge.

> Subject: [PATCH v1] mm/mmu_gather: provide archs with the entire range that is
>  to be flushed, not just the particular gather
> 
> This allows archs to optimise flushing heuristics better, in the face of
> flush operations forcing smaller flush batches. For example, an
> architecture may choose a more costly per-page invalidation for small
> ranges of pages with the assumption that the full TLB flush cost would
> be more expensive in terms of refills. However if a very large range is
> forced into flushing small ranges, the faster full-process flush may
> have been the better choice.

What is splitting up the flushes for you? That page_size power-special?
