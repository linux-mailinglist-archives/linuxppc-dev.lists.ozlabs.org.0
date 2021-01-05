Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9D2EB57A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 23:43:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9SFX2RD6zDqdP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 09:43:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nEGBJJsu; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9SCX0jj8zDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 09:41:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B64C422D6E;
 Tue,  5 Jan 2021 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609886485;
 bh=Hd0WCK5SrMVNFPBh9xnoTwtX6vl1dAnkrgvh+w7m70g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEGBJJsu9wtcnOowraQpQglsTKmrBSp9f3SOj7ZqNb60xHmYkXWumhwpw4iZyFXrY
 Q2qgJsYv0Uc4U1FS1g+rl2+EyHUsnieBTu9iDunwMfTa7r6xIEQg8z+JA8rtbmc53I
 APYe/v66W4ITmKuq5bLpQJLqW8NGMHHGMCT3bgOKj5burfUi4IFUSjy8LI/JhC+iHX
 KdQUa/KGMwpB7qG4JDZPNcihKwEBNzm6aG9KvPH6AFwCE3hg/jXcodrUOZZ6QaZigD
 mGef+R7mmqmwscyztviJVtPN2ZWeAF0YZx2hBcUPTxUnPqaljWb9WXTltRIFi9nR/3
 OSwNnvpOP3N6A==
Date: Tue, 5 Jan 2021 22:41:19 +0000
From: Will Deacon <will@kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Message-ID: <20210105224119.GA13005@willie-the-truck>
References: <20210105132623.GB11108@willie-the-truck>
 <7BFAB97C-1949-46A3-A1E2-DFE108DC7D5E@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7BFAB97C-1949-46A3-A1E2-DFE108DC7D5E@amacapital.net>
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 05, 2021 at 08:20:51AM -0800, Andy Lutomirski wrote:
> > On Jan 5, 2021, at 5:26 AM, Will Deacon <will@kernel.org> wrote:
> > Sorry for the slow reply, I was socially distanced from my keyboard.
> > 
> >> On Mon, Dec 28, 2020 at 04:36:11PM -0800, Andy Lutomirski wrote:
> >> On Mon, Dec 28, 2020 at 4:11 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> >>>> +static inline void membarrier_sync_core_before_usermode(void)
> >>>> +{
> >>>> +     /*
> >>>> +      * XXX: I know basically nothing about powerpc cache management.
> >>>> +      * Is this correct?
> >>>> +      */
> >>>> +     isync();
> >>> 
> >>> This is not about memory ordering or cache management, it's about
> >>> pipeline management. Powerpc's return to user mode serializes the
> >>> CPU (aka the hardware thread, _not_ the core; another wrongness of
> >>> the name, but AFAIKS the HW thread is what is required for
> >>> membarrier). So this is wrong, powerpc needs nothing here.
> >> 
> >> Fair enough.  I'm happy to defer to you on the powerpc details.  In
> >> any case, this just illustrates that we need feedback from a person
> >> who knows more about ARM64 than I do.
> > 
> > I think we're in a very similar boat to PowerPC, fwiw. Roughly speaking:
> > 
> >  1. SYNC_CORE does _not_ perform any cache management; that is the
> >     responsibility of userspace, either by executing the relevant
> >     maintenance instructions (arm64) or a system call (arm32). Crucially,
> >     the hardware will ensure that this cache maintenance is broadcast
> >     to all other CPUs.
> 
> Is this guaranteed regardless of any aliases?  That is, if I flush from
> one CPU at one VA and then execute the same physical address from another
> CPU at a different VA, does this still work?

The data side will be fine, but the instruction side can have virtual
aliases. We handle this in flush_ptrace_access() by blowing away the whole
I-cache if we're not physically-indexed, but userspace would be in trouble
if it wanted to handle this situation alone.

> >  2. Even with all the cache maintenance in the world, a CPU could have
> >     speculatively fetched stale instructions into its "pipeline" ahead of
> >     time, and these are _not_ flushed by the broadcast maintenance instructions
> >     in (1). SYNC_CORE provides a means for userspace to discard these stale
> >     instructions.
> > 
> >  3. The context synchronization event on exception entry/exit is
> >     sufficient here. The Arm ARM isn't very good at describing what it
> >     does, because it's in denial about the existence of a pipeline, but
> >     it does have snippets such as:
> > 
> >    (s/PE/CPU/)
> >       | For all types of memory:
> >       | The PE might have fetched the instructions from memory at any time
> >       | since the last Context synchronization event on that PE.
> > 
> >     Interestingly, the architecture recently added a control bit to remove
> >     this synchronisation from exception return, so if we set that then we'd
> >     have a problem with SYNC_CORE and adding an ISB would be necessary (and
> >     we could probable then make kernel->kernel returns cheaper, but I
> >     suspect we're relying on this implicit synchronisation in other places
> >     too).
> > 
> 
> Is ISB just a context synchronization event or does it do more?

That's a good question. Barrier instructions on ARM do tend to get
overloaded with extra behaviours over time, so it could certainly end up
doing the context synchronization event + extra stuff in future. Right now,
the only thing that springs to mind is the spectre-v1 heavy mitigation
barrier of 'DSB; ISB' which, for example, probably doesn't work for 'DSB;
ERET' because the ERET can be treated like a conditional (!) branch.

> On x86, it’s very hard to tell that MFENCE does any more than LOCK, but
> it’s much slower.  And we have LFENCE, which, as documented, doesn’t
> appear to have any semantics at all.  (Or at least it didn’t before
> Spectre.)

I tend to think of ISB as a front-end barrier relating to instruction fetch
whereas DMB, acquire/release and DSB are all back-end barriers relating to
memory accesses. You _can_ use ISB in conjunction with control dependencies
to order a pair of loads (like you can with ISYNC on Power), but it's a
really expensive way to do it.

> > Are you seeing a problem in practice, or did this come up while trying to
> > decipher the semantics of SYNC_CORE?
> 
> It came up while trying to understand the code and work through various
> bugs in it.  The code was written using something approximating x86
> terminology, but it was definitely wrong on x86 (at least if you believe
> the SDM, and I haven’t convinced any architects to say otherwise).

Ok, thanks.

Will
