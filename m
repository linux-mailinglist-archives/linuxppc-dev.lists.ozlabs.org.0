Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B701334549
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:41:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwfXB49S3z3cW9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:41:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DwfWt1DVNz30LP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:41:29 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 12AHbCRi007688;
 Wed, 10 Mar 2021 11:37:12 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 12AHbAOa007687;
 Wed, 10 Mar 2021 11:37:10 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 10 Mar 2021 11:37:10 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210310173710.GL29191@gate.crashing.org>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <20210304215448.GU29191@gate.crashing.org>
 <20210309160505.GA4979@C02TD0UTHF1T.local>
 <20210309220532.GI29191@gate.crashing.org>
 <20210310112441.GA19619@C02TD0UTHF1T.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310112441.GA19619@C02TD0UTHF1T.local>
User-Agent: Mutt/1.4.2.3i
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
Cc: Marco Elver <elver@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Mar 10, 2021 at 11:32:20AM +0000, Mark Rutland wrote:
> On Tue, Mar 09, 2021 at 04:05:32PM -0600, Segher Boessenkool wrote:
> > On Tue, Mar 09, 2021 at 04:05:23PM +0000, Mark Rutland wrote:
> > > On Thu, Mar 04, 2021 at 03:54:48PM -0600, Segher Boessenkool wrote:
> > > > On Thu, Mar 04, 2021 at 02:57:30PM +0000, Mark Rutland wrote:
> > > > > It looks like GCC is happy to give us the function-entry-time FP if we use
> > > > > __builtin_frame_address(1),
> > > > 
> > > > From the GCC manual:
> > > >      Calling this function with a nonzero argument can have
> > > >      unpredictable effects, including crashing the calling program.  As
> > > >      a result, calls that are considered unsafe are diagnosed when the
> > > >      '-Wframe-address' option is in effect.  Such calls should only be
> > > >      made in debugging situations.
> > > > 
> > > > It *does* warn (the warning is in -Wall btw), on both powerpc and
> > > > aarch64.  Furthermore, using this builtin causes lousy code (it forces
> > > > the use of a frame pointer, which we normally try very hard to optimise
> > > > away, for good reason).
> > > > 
> > > > And, that warning is not an idle warning.  Non-zero arguments to
> > > > __builtin_frame_address can crash the program.  It won't on simpler
> > > > functions, but there is no real definition of what a simpler function
> > > > *is*.  It is meant for debugging, not for production use (this is also
> > > > why no one has bothered to make it faster).
> > > >
> > > > On Power it should work, but on pretty much any other arch it won't.
> > > 
> > > I understand this is true generally, and cannot be relied upon in
> > > portable code. However as you hint here for Power, I believe that on
> > > arm64 __builtin_frame_address(1) shouldn't crash the program due to the
> > > way frame records work on arm64, but I'll go check with some local
> > > compiler folk. I agree that __builtin_frame_address(2) and beyond
> > > certainly can, e.g.  by NULL dereference and similar.
> > 
> > I still do not know the aarch64 ABI well enough.  If only I had time!
> > 
> > > For context, why do you think this would work on power specifically? I
> > > wonder if our rationale is similar.
> > 
> > On most 64-bit Power ABIs all stack frames are connected together as a
> > linked list (which is updated atomically, importantly).  This makes it
> > possible to always find all previous stack frames.
> 
> We have something similar on arm64, where the kernel depends on being
> built with a frame pointer following the AAPCS frame pointer rules.

The huge difference is on Power this is about the stack itself: you do
not need a frame pointer at all for it (there is no specific register
named as frame pointer, even).

> Every stack frame contains a "frame record" *somewhere* within that
> stack frame, and the frame records are chained together as a linked
> list. The frame pointer points at the most recent frame record (and this
> is what __builtin_frame_address(0) returns).

> > See gcc.gnu.org/PR60109 for example.
> 
> Sure; I see that being true generally (and Ramana noted that on 32-bit
> arm a frame pointer wasn't mandated), but I think in this case we have a
> stronger target (and configuration) specific guarantee.

It sounds like it, yes.  You need to have a frame pointer in the ABI,
with pretty strong rules, and have everything follow those rules.

> > Is the frame pointer required?!
> 
> The arm64 Linux port mandates frame pointers for kernel code. It is
> generally possible to build code without frame pointers (e.g. userspace),
> but doing that for kernel code would be a bug.

I see.  And it even is less expensive to do this than on most machines,
because of register pair load/store instructions :-)

> > > > The real way forward is to bite the bullet and to no longer pretend you
> > > > can do a full backtrace from just the stack contents.  You cannot.
> > > 
> > > I think what you mean here is that there's no reliable way to handle the
> > > current/leaf function, right? If so I do agree.
> > 
> > No, I meant what I said.
> > 
> > There is the separate issue that you do not know where the return
> > address (etc.) is stored in a function that has not yet done a call
> > itself, sure.  You cannot assume anything the ABI does not tell you you
> > can depend on.
> 
> This is in the frame record per the AAPCS.

But you do not know where in the function it will store that.  It often
can be optimised by the compiler to only store the LR and FP on paths
where a call will happen later, and there is no way (without DWARF info
or similar) to know whether that has happened yet or not.

This is a well-known problem of course.  For the current function you
cannot know in general if there is an activation frame yet or not.


Segher
