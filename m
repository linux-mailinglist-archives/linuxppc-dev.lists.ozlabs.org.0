Return-Path: <linuxppc-dev+bounces-9623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FF9AE319F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 21:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQLMz2JVYz30VR;
	Mon, 23 Jun 2025 05:08:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750619311;
	cv=none; b=QUYFnpHL5hcmKfOqHDn/IyBxa2xC+eYOz0Z4lbA4vCKvr28lLfBhuos8yyFczRWGq6JMT08sGuNhm3TQ6n7rxQlny4BWQPnmYlD32wnOqWcxqGImxnao1qEICaTLTathGG+9YuaoEgipcGyTIJNl5Rv3HWc7z/ZK0SA0apsNLqzGsSEUGQdJjAOb3M02t5z/wgKhyIIDFbBbZ1W4OhrTj2QmFr4O/3L8NgK0PT8D4xBLrD8FLNGtq4tzErtaANpuZIZ32MIUseBtsNn1IUG/Rit5CRBN7b16W4v6tdoVPZv2cHW9hFtOVIfrhrH1DBLYqMsVjRn69flEc+jWs2DbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750619311; c=relaxed/relaxed;
	bh=lXvkinor2Kxjpw0TfsCTa3CsaB0P+Y72nKpP+5Ar/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsbAjHy1ISgxSmq/GJMy10zKr0xlzK+sGwhDVNnCbMREck+fZhm4f54KF7V4qaf2XbqoQkTh7DUxPaDlsaMLQ6ffFqfdHncYRUp0kTIMIojUI6/6xTpJGWUHqT27pJzt6qyKH98R6ebJRXnEi8B7DRLw3BagjQdpSe+6GuUvXzXXZgt+mZAokEn00FQzIPrF2ALafCc8yITwJyR1etwHNi6V2lvgDy0+ARwiw5SsOgX3AN7aSvP7Fyr7xGUUP+ID7N+/8gs1qx0FlFAYZ1OdREawUGVlT2IabBa9Lc3cg5uwdFhOxYh1deobIjWYgfbN/P5XAFRwhSf6JvGr7JeeMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQLMx3m4Tz30GV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 05:08:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55MIvBBC005896;
	Sun, 22 Jun 2025 13:57:11 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55MIv72V005883;
	Sun, 22 Jun 2025 13:57:07 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 22 Jun 2025 13:57:06 -0500
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
Subject: Re: [PATCH 5/5] powerpc: Implement masked user access
Message-ID: <20250622185706.GB17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu> <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu> <20250622181351.08141b50@pumpkin>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622181351.08141b50@pumpkin>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sun, Jun 22, 2025 at 06:13:51PM +0100, David Laight wrote:
> On Sun, 22 Jun 2025 11:52:43 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> > e500 has the isel instruction which allows selecting one value or
> > the other without branch and that instruction is not speculative, so
> > use it. Allthough GCC usually generates code using that instruction,
> > it is safer to use inline assembly to be sure. The result is:

The instruction (which is a standard Power instruction since
architecture version 2.03, published in 2006) can in principle be
speculative, but there exist no Power implementations that do any data
speculation like this at all.

If you want any particular machine instructions to be generated you have
to manually write it, sure, in inline asm or preferably in actual asm.
But you can be sure that GCC will generate isel or similar (like the
v3.1 set[n]bc[r] insns, best instructions ever!), whenever appropriate,
i.e. when it is a) allowed at all, and b) advantageous.

> >   14:	3d 20 bf fe 	lis     r9,-16386
> >   18:	7c 03 48 40 	cmplw   r3,r9
> >   1c:	7c 69 18 5e 	iselgt  r3,r9,r3
> > 
> > On other ones, when kernel space is over 0x80000000 and user space
> > is below, the logic in mask_user_address_simple() leads to a
> > 3 instruction sequence:
> > 
> >   14:	7c 69 fe 70 	srawi   r9,r3,31
> >   18:	7c 63 48 78 	andc    r3,r3,r9
> >   1c:	51 23 00 00 	rlwimi  r3,r9,0,0,0
> > 
> > This is the default on powerpc 8xx.
> > 
> > When the limit between user space and kernel space is not 0x80000000,
> > mask_user_address_32() is used and a 6 instructions sequence is
> > generated:
> > 
> >   24:	54 69 7c 7e 	srwi    r9,r3,17
> >   28:	21 29 57 ff 	subfic  r9,r9,22527
> >   2c:	7d 29 fe 70 	srawi   r9,r9,31
> >   30:	75 2a b0 00 	andis.  r10,r9,45056
> >   34:	7c 63 48 78 	andc    r3,r3,r9
> >   38:	7c 63 53 78 	or      r3,r3,r10
> > 
> > The constraint is that TASK_SIZE be aligned to 128K in order to get
> > the most optimal number of instructions.
> > 
> > When CONFIG_PPC_BARRIER_NOSPEC is not defined, fallback on the
> > test-based masking as it is quicker than the 6 instructions sequence
> > but not necessarily quicker than the 3 instructions sequences above.
> 
> Doesn't that depend on whether the branch is predicted correctly?
> 
> I can't read ppc asm well enough to check the above.

[ PowerPC or Power (or Power Architecture, or Power ISA) ]

> And the C is also a bit tortuous.

I can read the code ;-)  All those instructions are normal simple
integer instructions.  Shifts, adds, logicals.

In general, correctly predicted non-taken bvranches cost absolutely
nothing.  Correctly predicted taken branches cost the same as any taken
branch, so a refetch, maybe resulting in a cycle or so of decode bubble.
And a mispredicted branch can be very expensive, say on the order of a
hundred cycles (but usually more like ten, which is still a lot of insns
worth).

So branches are great for predictable stuff, and "not so great" for
not so predictable stuff.


Segher

