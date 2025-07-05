Return-Path: <linuxppc-dev+bounces-10124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB9AFA1B2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jul 2025 22:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZMGk5xJYz2y06;
	Sun,  6 Jul 2025 06:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751746606;
	cv=none; b=JCW9OW7UD1PDuGTNMlVTOPyXhn4T9eIEGmbt1XBCBv957LcOQKInt4XOBi7V/IHU5jqd0Zw7b/3RinoI0uXNJBRJa8pHorXEjDngSnk9TizMzIKieEwL6nJmPrYQmp50XJRVaC4mh7ZrRxK/XKZ0dsiqSlpb75wyVlrENw/G62jO1mmg3eyOKLVWMQW32HJRCGMIuMcqFuRBas6OeDt0dewYuPthymlMRHORzg+RdehlsK5vxnfaEeNMzn7AjhU9kToALi43I14ewd5fVx5RoFdAnTRm+iKv4B5v75kizSVGok9+6kpAbJ9FBLO10JLO+gfaSxQMyKT1U9e3GdBJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751746606; c=relaxed/relaxed;
	bh=/KVTlMcn1gjvoMF/2QD16fykyN3hMq+DuDN2DHqGFRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfS1709tbkt4k+NPEyBnP6Y/radXevadestT1GsiFFCkILmNadkDTwLJIeB3jOGlSIm3h98BoAnTnYjuNJGfUGspALcaJwrHUe5+JgAtiuftF0TqVH9SXiDf1+P55Qa/PqXD1nEMWB46lZSS8h92MHB2NGozYME/ixed+0ivHJ5Ga0zYAAPlA/fzYcRV87YI+HOkZCB7DaWYDn3osuk391A5F/KFmDJ5hIo+HL4R0+airaEmdBILZN9gCPqQc4wpb09lJlBVXYleZh58j/UGv43KphY8kFt/q56A2MtZobgcS0S1O7pt5CocjlBgnyYc2t5kth/z6tGvMrjzbULidg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZMGj1WdYz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jul 2025 06:16:43 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 565KG2rq174660;
	Sat, 5 Jul 2025 15:16:02 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 565KFv2e174653;
	Sat, 5 Jul 2025 15:15:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 5 Jul 2025 15:15:57 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Andre Almeida <andrealmeid@igalia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <aGmH_Y4248gRRpoq@gate>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622172043.3fb0e54c@pumpkin>
 <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
 <20250624131714.GG17294@gate.crashing.org>
 <20250624175001.148a768f@pumpkin>
 <20250624182505.GH17294@gate.crashing.org>
 <20250624220816.078f960d@pumpkin>
 <83fb5685-a206-477c-bff3-03e0ebf4c40c@csgroup.eu>
 <20250626220148.GR17294@gate.crashing.org>
 <20250705193332.251e0b1f@pumpkin>
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
In-Reply-To: <20250705193332.251e0b1f@pumpkin>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sat, Jul 05, 2025 at 07:33:32PM +0100, David Laight wrote:
> On Thu, 26 Jun 2025 17:01:48 -0500
> Segher Boessenkool <segher@kernel.crashing.org> wrote:
> > On Thu, Jun 26, 2025 at 07:56:10AM +0200, Christophe Leroy wrote:
> ...
> > I have no idea why you think power9 has it while older CPUS do not.  In
> > the GCC source code we have this comment:
> >   /* For ISA 2.06, don't add ISEL, since in general it isn't a win, but
> >      altivec is a win so enable it.  */
> > and in fact we do not enable it for ISA 2.06 (p8) either, probably for

2.07 I meant of course.  Sigh.

> > a similar reason.
> 
> Odd, I'd have thought that replacing a conditional branch with a
> conditional move would pretty much always be a win.
> Unless, of course, you only consider benchmark loops where the
> branch predictor in 100% accurate.

The isel machine instruction is super expensive on p8: it is marked as
first in an instruction group, and has latency 5 for the GPR sources,
and 8 for the CR field source.

On p7 it wasn't great either, it was actually converted to a branch
sequence internally!

On p8 there are bc+8 optimisations done by the core as well, conditional
branches that skip one insn are faster than equivalent isel insns!

Since p9 it is a lot better :-)

> OTOH isn't altivec 'simd' instructions?

AltiVec is the old motorola marketing name for what is called the
"Vector Facility" in the architecture, and which at IBM is still called
VMX, the name it was developed under ("Vector Multimedia Extension").

Since p7 (ISA 2.06, 2010) there also is the Vector-Scalar Extension
Facility, VSX, which adds another 32 vector registers, and the
traditional floating point registers are physically the same (but those
use only the first half of each vector reg).  Many new VSX instructions
can do simple floating point stuff on all 64 VSX registers, either just
on the first lane ("scalar") or on all lanes ("vector").

This does largely mean that all floating point is stored in IEEE DP
format internally (on older cores usually some close to 70-bit format
was used internally), which in olden times actually allowed to make the
cores faster.  Only when storing a value to memory it was actually
converted to IEEE format (but of course it was always rounded correctly,
etc.)

> They pretty much only help for loops with lots of iterations.
> I don't know about ppc, but I've seen gcc make a real 'pigs breakfast'
> of loop vectorisation on x86.

For PowerPC (or Power, the more modern name) of course we also have our
fair share of problems with vectorisation.  It does help that we were
the first architecture used by GCC that had a serious Vector thing,
the C syntax extension for Vector literals is taken from the old
extensions in the AltiVec PIM but using curly brackets {} instead of
round brackets (), for example.

> For the linux kernel (which as Linus keeps reminding people) tends
> to run 'cold cache', you probably want conditional moves in order
> to avoid mis-predicted branches and non-linear execution, but
> don't want loop vectorisation because the setup and end cases
> cost too much compared to the gain for each iteration.

You are best off using what GCC gives you, usually.  It is very well
tuned, both the generic and the machine-specific code :-)

The kernel of course disables all Vector and FP stuff, essentially it
disables use of any of the associated registers, and that's pretty much
the end of it ;-)

(The reason for that is that it would make task switches more expensive,
long ago all task switches, but nowadays still user<->kernel switches).


Segher

