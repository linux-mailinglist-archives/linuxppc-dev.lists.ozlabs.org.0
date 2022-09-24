Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576E5E8E6A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 18:18:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZZ1m5rY0z3dqy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 02:18:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZZ1J63JGz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 02:17:39 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28OGEQAB001449;
	Sat, 24 Sep 2022 11:14:26 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28OGEOKe001448;
	Sat, 24 Sep 2022 11:14:24 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 24 Sep 2022 11:14:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in irq_soft_mask_{set,return}
Message-ID: <20220924161424.GO25951@gate.crashing.org>
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu> <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo> <20220923121829.GL25951@gate.crashing.org> <CN3X6YN1FRQ3.1Z9BVD6WYQY3M@bobo> <20220923221543.GN25951@gate.crashing.org> <CN4BYDAY75PX.33LJ1P2VQJXD9@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CN4BYDAY75PX.33LJ1P2VQJXD9@bobo>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 24, 2022 at 02:00:55PM +1000, Nicholas Piggin wrote:
> On Sat Sep 24, 2022 at 8:15 AM AEST, Segher Boessenkool wrote:
> > Never it is guaranteed that all accesses through this variable will use
> > the register directly: this fundamentally cannot work on all archs, and
> > also not at -O0.  More in general it doesn't work if some basic
> > optimisations are not done, be it because of a compiler deficiency, or a
> > straight out bug, or maybe it is a conscious choice in some cases.
> 
> Right, and we know better than to rely on a spec that is not 100% air
> tight with no possibility of lawyering. This may be what the intention is,
> it may be what gcc and clang do now, and everybody involved today agrees
> with that interpretation. We still have to maintain the kernel tomorrow
> though, so explicit r13 it must be.

It has *always* been this way.  Very old GCC (say, GCC < 3.x) tried to
guarantee more, even, but that turned out to be untenable.  But this is
all in the distant past.

I have no idea if clang implements the GCC C extensions correctly.  If
they don't it is just another compiler bug and they'll just have to fix
it.

The rules *are* airtight.  But this does not mean you can assume random
other stuff, adjacent or not :-P

> > (Please use "n" instead of "i".  Doesn't matter here, but it does in
> > many other places.)
> 
> What is the difference? Just "i" allows assmebly-time constants?

"n" means "number": constant integers.  "i" means "immediate": any
constant.  The address of a global variable is "i" but not "n" (in most
ABIs, no -fPIC and such) for example.

> How about "I"? that looks like it was made for it. Gives much better
> errors.

For PowerPC, "I" is a signed 16-bit number.  "K" is unsigned 16-bit,
and there are more as well.  Just like for "n" you'll have to make
sure the number you feed in will work in the assembler, and you'll get
the same error message (but, as you say, for "I" in some cases the
compiler will give errors already).  It's otherwise only useful if you
use e.g. "IL" as constraint, and then write "addi%e2 %0,%1,%2" for
example, so the asm can generate "addis" insns.  Such things aren't very
often useful in internal asm.  The main reason any of this exists is
this is how GCC works internally; extended inline asm exposes a lot of
that.


Segher
