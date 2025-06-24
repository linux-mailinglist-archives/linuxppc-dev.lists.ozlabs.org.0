Return-Path: <linuxppc-dev+bounces-9682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B850AE6EB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 20:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRYYh0DVMz2xlK;
	Wed, 25 Jun 2025 04:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750790167;
	cv=none; b=CPZhTu4YgF3IgpoVOEwuV7h+fMQAvvaSEiqE+mbsRRD6e1Z9DU9NTOw9yGltRh9b6o2/gMw08tF1aus9jnj+dKP0ypEy+FQMWVAmR3/Zw5nYAvlJq83vi4dXeqWiol7ZicILaY2kfTgzd6weB1AaDZMYLjsFlb6eETHPkcrMS6vdZCxwoHCuCUY05m/jGjTngCs2BuMt5tR2/iPTr2EHAZ8PtOs1NZz9TZDp7VnFt1U6f0SjteJEI9WD6bBvan3boRSrhAHFyiwYeuKv77OKhD8w0uOQtxVA4L8z2EYFNIBy/Ppyg9nQNlowvxrRcOSdl6jlz1gimhYf/B/Z6Muz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750790167; c=relaxed/relaxed;
	bh=SdL6EIXqtCwoMCw2+J9Y2V1BpD91T6/sD6VzhQzmPeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kk+kExhxtYMR2YZeUwCCo9BQ+NpkJkBUs8UyEbokgPa03tGuEM7/fbItQ6ChFhSU9vYvPyJzRMYem8JwehqhQ4sFNhoMM7OPVwKmpb8Hme5YMo8ITSVBwbdlOxlFcFaJFd2qxQob9zH0JorL9o5XPdLK3LzC9UrqB6ANt5Uq1GNAjGIoFxqbtl74r7904vfpfb2Ng1BJnSkV+gpPeXSiFuK1NrN1MtkAxf1iibctz2zRCuVjNfsZi7qB0ikqMlAG+tAfoEARCEdc9Y9/Q2jAr5ZktU9qU5aQug3M+NxIsY15QkHE+fXP7fJqLrNTHgbQsGwNizqFKkhsQsRL0G6Zug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRYYY2L92z2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 04:35:59 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55OIP98u005379;
	Tue, 24 Jun 2025 13:25:09 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55OIP5sr005378;
	Tue, 24 Jun 2025 13:25:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 24 Jun 2025 13:25:05 -0500
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
Message-ID: <20250624182505.GH17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu> <20250622172043.3fb0e54c@pumpkin> <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu> <20250624131714.GG17294@gate.crashing.org> <20250624175001.148a768f@pumpkin>
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
In-Reply-To: <20250624175001.148a768f@pumpkin>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Tue, Jun 24, 2025 at 05:50:01PM +0100, David Laight wrote:
> On Tue, 24 Jun 2025 08:17:14 -0500
> Segher Boessenkool <segher@kernel.crashing.org> wrote:
> 
> > On Tue, Jun 24, 2025 at 07:27:47AM +0200, Christophe Leroy wrote:
> > > Ah ok, I overlooked that, I didn't know the cmove instruction, seem 
> > > similar to the isel instruction on powerpc e500.  
> > 
> > cmove does a move (register or memory) when some condition is true.
> 
> The destination of x86 'cmov' is always a register (only the source can be
> memory - an is probably always read).

Both source operands can be mem, right?  But probably not both at the
same time.

> It is a also a computational instruction.

Terminology...

x86 is not a RISC architecture, or more generally, a load/store
architecture.

A computational instruction is one that doesn't touch memory or does a
branch, or some system function, some supervisor or hypervisor
instruction maybe.

x86 does not have many computational insns, most insns can touch
memory :-)

(The important thing is that most computational insns do not ever cause
exceptions, the only exceptions are if you divide by zero or
similar :-) )

> It may well always do the register write - hard to detect.
> 
> There is a planned new instruction that would do a conditional write
> to memory - but not on any cpu yet.

Interesting!  Instructions like the atomic store insns we got for p9,
maybe?  They can do minimum/maximum and various kinds of more generic
reductions and similar.

> > isel (which is base PowerPC, not something "e500" only) is a
> > computational instruction, it copies one of two registers to a third,
> > which of the two is decided by any bit in the condition register.
> 
> Does that mean it could be used for all the ppc cpu variants?

No, only things that implement architecture version of 2.03 or later.
That is from 2006, so essentially everything that is still made
implements it :-)

But ancient things do not.  Both 970 (Apple G5) and Cell BE do not yet
have it (they are ISA 2.01 and 2.02 respectively).  And the older p5's
do not have it yet either, but the newer ones do.

And all classic PowerPC is ISA 1.xx of course.  Medieval CPUs :-)

> > But sure, seen from very far off both isel and cmove can be used to
> > implement the ternary operator ("?:"), are similar in that way :-)
> 
> Which is exactly what you want to avoid speculation.

There are cheaper / simpler / more effective / better ways to get that,
but sure, everything is better than a conditional branch, always :-)


Segher

