Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B16A42C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 14:34:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQM0s1TLdz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 00:34:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=I0RZYM2u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQLzr30B4z3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:33:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lYtdb3OvoePD9FKa/wblmpog8oSZWnWeDVgUCfTs9As=; b=I0RZYM2uTHooxcHaCkgIjRt6S4
	Q+Cio3xlxnE2D8zBu9EwrwmOHggoJ4gPAUNYZLjzw6o6dohV+xL162RX8FtA3I/WRk1wFdNPEm/yr
	yrKFjbWHC1ZMcqj/0irRPq39VpTS5bCGOh+VFsbhmQUAls+W6xDUTrdPqBkP6MdJ6Rvt2Hjd19xYC
	9leBtPob2IRbId2+FqrKY9fTkZ6D+RbZusAK7d7eGmHpRP7Hxvnw1VZqOvC4MIc5pzaGzxjDYi/yr
	tlalojHEEtgTFimWnPIYIitNI7zGfGggSUik5O456sxE5vEq3hLP19ZxR53wd51AF/rpo5SH2HOqY
	3ZlKpOkQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pWdcq-00EEZC-0g;
	Mon, 27 Feb 2023 13:33:08 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4A9E8300293;
	Mon, 27 Feb 2023 14:33:06 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2942823B24806; Mon, 27 Feb 2023 14:33:06 +0100 (CET)
Date: Mon, 27 Feb 2023 14:33:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v7 5/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Message-ID: <Y/yxEnCcPmUk89Jp@hirez.programming.kicks-ass.net>
References: <20230203071837.1136453-1-npiggin@gmail.com>
 <20230203071837.1136453-6-npiggin@gmail.com>
 <20230226141238.6ec5fdf7d75dcf2cd4c58ba0@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226141238.6ec5fdf7d75dcf2cd4c58ba0@linux-foundation.org>
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@redhat.com>, Will Deacon <will@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@amacapital.net>, linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <nadav.amit@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 26, 2023 at 02:12:38PM -0800, Andrew Morton wrote:
> On Fri,  3 Feb 2023 17:18:37 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> > On a 16-socket 192-core POWER8 system, the context_switch1_threads
> > benchmark from will-it-scale (see earlier changelog), upstream can
> > achieve a rate of about 1 million context switches per second, due to
> > contention on the mm refcount.
> > 
> > 64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN, so enable
> > the option. This increases the above benchmark to 118 million context
> > switches per second.
> 
> Is that the best you can do ;)
> 
> > This generates 314 additional IPI interrupts on a 144 CPU system doing
> > a kernel compile, which is in the noise in terms of kernel cycles.
> > 
> > ...
> >
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -265,6 +265,7 @@ config PPC
> >  	select MMU_GATHER_PAGE_SIZE
> >  	select MMU_GATHER_RCU_TABLE_FREE
> >  	select MMU_GATHER_MERGE_VMAS
> > +	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
> >  	select MODULES_USE_ELF_RELA
> >  	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
> >  	select NEED_PER_CPU_EMBED_FIRST_CHUNK	if PPC64
> 
> Can we please have a summary of which other architectures might benefit
> from this, and what must they do?
> 
> As this is powerpc-only, I expect it won't get a lot of testing in
> mm.git or in linux-next.  The powerpc maintainers might choose to merge
> in the mm-stable branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm if this is a
> concern.

I haven't really had time to page all of this back in, but x86 is very
close to be able to use this, it mostly just needs cleaning up some
accidental active_mm usage.

I've got a branch here:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/lazy

That's mostly Nick's patches with a bunch of Andy's old patches stuck on
top. I also have a pile of notes, but alas, not finished in any way.
