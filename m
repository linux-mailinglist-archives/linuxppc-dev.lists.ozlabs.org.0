Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 290CA2CAE5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 22:29:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClwGr2RQxzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 08:29:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=nWeVMLcS; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClwF41VcPzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 08:28:07 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 903E420870;
 Tue,  1 Dec 2020 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606858085;
 bh=jydMEXFzO2t7+Ckqr+Txcfmmvphc90YJ7puBAL7qT2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWeVMLcStfE7SiK55mRRUlPOIopGrLWwUwpF6yOo/TkHyPd6hOZ0mDwpHL1HFm459
 vrhD8GWAQ4U2gaXC1J3++fW3Bmas8OIxiXPakhwyW4QZZjHWE7gZQQxzVaGrl3oAxm
 zS0sn0zf66wWg3S6hprcUqxHbdRRYpRJAPfSw2fc=
Date: Tue, 1 Dec 2020 21:27:58 +0000
From: Will Deacon <will@kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
Message-ID: <20201201212758.GA28300@willie-the-truck>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
 <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
 <CALCETrWBtCfD+jZ3S+O8FK-HFPODuhbDEbbfWvS=-iPATNFAOA@mail.gmail.com>
 <CALCETrXAR_9EGaOF8ymVkZycxgZkYk0dR+NjEpTfVzdcS3sOVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrXAR_9EGaOF8ymVkZycxgZkYk0dR+NjEpTfVzdcS3sOVw@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Dave Hansen <dave.hansen@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 10:31:51AM -0800, Andy Lutomirski wrote:
> other arch folk: there's some background here:
> 
> https://lkml.kernel.org/r/CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com
> 
> On Sun, Nov 29, 2020 at 12:16 PM Andy Lutomirski <luto@kernel.org> wrote:
> >
> > On Sat, Nov 28, 2020 at 7:54 PM Andy Lutomirski <luto@kernel.org> wrote:
> > >
> > > On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> > > >
> > > > On big systems, the mm refcount can become highly contented when doing
> > > > a lot of context switching with threaded applications (particularly
> > > > switching between the idle thread and an application thread).
> > > >
> > > > Abandoning lazy tlb slows switching down quite a bit in the important
> > > > user->idle->user cases, so so instead implement a non-refcounted scheme
> > > > that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
> > > > any remaining lazy ones.
> > > >
> > > > Shootdown IPIs are some concern, but they have not been observed to be
> > > > a big problem with this scheme (the powerpc implementation generated
> > > > 314 additional interrupts on a 144 CPU system during a kernel compile).
> > > > There are a number of strategies that could be employed to reduce IPIs
> > > > if they turn out to be a problem for some workload.
> > >
> > > I'm still wondering whether we can do even better.
> > >
> >
> > Hold on a sec.. __mmput() unmaps VMAs, frees pagetables, and flushes
> > the TLB.  On x86, this will shoot down all lazies as long as even a
> > single pagetable was freed.  (Or at least it will if we don't have a
> > serious bug, but the code seems okay.  We'll hit pmd_free_tlb, which
> > sets tlb->freed_tables, which will trigger the IPI.)  So, on
> > architectures like x86, the shootdown approach should be free.  The
> > only way it ought to have any excess IPIs is if we have CPUs in
> > mm_cpumask() that don't need IPI to free pagetables, which could
> > happen on paravirt.
> 
> Indeed, on x86, we do this:
> 
> [   11.558844]  flush_tlb_mm_range.cold+0x18/0x1d
> [   11.559905]  tlb_finish_mmu+0x10e/0x1a0
> [   11.561068]  exit_mmap+0xc8/0x1a0
> [   11.561932]  mmput+0x29/0xd0
> [   11.562688]  do_exit+0x316/0xa90
> [   11.563588]  do_group_exit+0x34/0xb0
> [   11.564476]  __x64_sys_exit_group+0xf/0x10
> [   11.565512]  do_syscall_64+0x34/0x50
> 
> and we have info->freed_tables set.
> 
> What are the architectures that have large systems like?
> 
> x86: we already zap lazies, so it should cost basically nothing to do
> a little loop at the end of __mmput() to make sure that no lazies are
> left.  If we care about paravirt performance, we could implement one
> of the optimizations I mentioned above to fix up the refcounts instead
> of sending an IPI to any remaining lazies.
> 
> arm64: AFAICT arm64's flush uses magic arm64 hardware support for
> remote flushes, so any lazy mm references will still exist after
> exit_mmap().  (arm64 uses lazy TLB, right?)  So this is kind of like
> the x86 paravirt case.  Are there large enough arm64 systems that any
> of this matters?

Yes, there are large arm64 systems where performance of TLB invalidation
matters, but they're either niche (supercomputers) or not readily available
(NUMA boxes).

But anyway, we blow away the TLB for everybody in tlb_finish_mmu() after
freeing the page-tables. We have an optimisation to avoid flushing if
we're just unmapping leaf entries when the mm is going away, but we don't
have a choice once we get to actually reclaiming the page-tables.

One thing I probably should mention, though, is that we don't maintain
mm_cpumask() because we're not able to benefit from it and the atomic
update is a waste of time.

Will
