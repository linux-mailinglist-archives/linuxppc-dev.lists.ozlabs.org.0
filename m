Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5B53AB04
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 18:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCvbX6GQ7z3c9J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 02:23:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCvb84VJLz3bkH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 02:23:30 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 251GKOUe017174;
	Wed, 1 Jun 2022 11:20:24 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 251GKN16017173;
	Wed, 1 Jun 2022 11:20:23 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 1 Jun 2022 11:20:23 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Message-ID: <20220601162023.GW25951@gate.crashing.org>
References: <20220531065936.3674348-1-mpe@ellerman.id.au> <20220531222715.GT25951@gate.crashing.org> <87fskopsui.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fskopsui.fsf@mpe.ellerman.id.au>
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 08:43:01PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > Hi!
> >
> > On Tue, May 31, 2022 at 04:59:36PM +1000, Michael Ellerman wrote:
> >> More problematically it doesn't compile at all with GCC 12, due to the
> >> fact that it returns the char buffer declared inside the macro:
> >
> > It returns a pointer to a buffer on stack.  It is not valid C to access
> > that buffer after the function has returned (and indeed it does not
> > work, in general).
> 
> It's a statement expression though, not a function. So it doesn't return
> as such, that would be obviously wrong.

Yes, wrong language, my bad.  But luckily it doesn't matter if this is a
function or not anyway: the question is about scopes and lifetimes :-)

> But I'm not a language lawyer, so presumably it's not valid to refer to
> the variable after it's gone out of scope.
> 
> Although we do use that same pattern in many places where the value of
> the expression is a scalar type.

It's an object with automatic storage duration.  Its lifetime ends when
the scope is left, which is at the end of the statement expression, so
before the object is used.

The value of the expression can be used just fine, sure, but the object
it points to has ceased to exist, so dereferencing that pointer is
undefined behaviour.

> >> A simpler solution is to just print the value as an unsigned long. For
> >> normal instructions the output is identical. For prefixed instructions
> >> the value is printed as a single 64-bit quantity, whereas previously the
> >> low half was printed first. But that is good enough for debug output,
> >> especially as prefixed instructions will be rare in practice.
> >
> > Prefixed insns might be somewhat rare currently, but it will not stay
> > that way.
> 
> These are all printing kernel instructions, not userspace. I should have
> said that in the change log.

Ah!  In that case, it will take quite a bit longer before you will see
many prefixed insns, sure.

> The kernel doesn't build for -mcpu=power10 because we haven't done any
> changes for pcrel.
> 
> We will do that one day, but not soon.

Yeah, pcrel is the big hitter currently.  But with the extra opcode
space we have now, maybe something else will show up that even the
kernel will use.  I cannot predict the future very well :-)

> > It is not hard to fix the problem here?  The only tricky part is that
> > ppc_inst_as_ulong swaps the two halves for LE, for as far as I can see
> > no reason at all :-(
> >
> > If it didn't it would be easy to detect prefixed insns (because they
> > then are guaranteed to be > 0xffffffff), and it is easy to print them
> > with a space between the two opcodes, with a utility function:
> >
> > void print_insn_bytes_nicely(unsigned long insn)
> > {
> > 	if (insn > 0xffffffff)
> > 		printf("%08x ", insn >> 32);
> > 	printf("%08x", insn & 0xffffffff);
> > }
> 
> We don't want to do that because it can lead to interleaving messages
> between different CPUs in the kernel log.

Yuck.

void print_insn_bytes_nicely(unsigned long insn)
{
	if (insn > 0xffffffff)
		printf("%08x ", insn >> 32, insn & 0xffffffff);
	else
		printf("%08x", insn & 0xffffffff);
}

But it makes things much less enticing, alright.

> In the medium term there's some changes to printk that might land soon
> (printbuf), which would mean we could more easily define a custom printk
> formatter for printing prefixed instructions.

Yeah :-)

What about the more fundamental thing?  Have the order of the two halves
of a prefixed insn as ulong not depend on endianness?  It really is two
opcodes, and the prefixed one is first, always, even in LE.


Segher
