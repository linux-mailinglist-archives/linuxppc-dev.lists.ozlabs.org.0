Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B263D14BD2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 16:44:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486WB83sldzDqLl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 02:44:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486W6G2jxszDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 02:40:35 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00SFeRKO026089;
 Tue, 28 Jan 2020 09:40:27 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00SFeQZR026088;
 Tue, 28 Jan 2020 09:40:26 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 28 Jan 2020 09:40:26 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
Message-ID: <20200128154026.GI22482@gate.crashing.org>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580218232.2tezmthp1x.astroid@bobo.none>
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
Cc: Florian Weimer <fweimer@redhat.com>, libc-alpha@sourceware.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 29, 2020 at 12:05:40AM +1000, Nicholas Piggin wrote:
> Florian Weimer's on January 28, 2020 11:09 pm:
> > But I don't think we are so lucky for the inline system calls.  GCC
> > recognizes an "lr" clobber with inline asm (even though it is not
> > documented), but it generates rather strange assembler output as a
> > result:

> > 	std 0,16(1)
> > 	ori 2,2,0
> > 	ld 0,16(1)

> > That's with GCC 8.3 at -O2.  I don't understand what the ori is about.
> 
> ori 2,2,0 is the group terminating nop hint for POWER8 type cores
> which had dispatch grouping rules.

Yup.  GCC generates that here to force the load into a different
scheduling group than the corresponding store is, because that otherwise
would cause very expensive pipeline flushes.  It does that if it knows it
is the same address (like here).

> > I don't think we can save LR in a regular register around the system
> > call, explicitly in the inline asm statement, because we still have to
> > generate proper unwinding information using CFI directives, something
> > that you cannot do from within the asm statement.

Why not?

> >> - Error handling: use of CR0[SO] to indicate error requires a mtcr / mtocr
> >>   instruction on the kernel side, and it is currently not implemented well
> >>   in glibc, requiring a mfcr (mfocr should be possible and asm goto support
> >>   would allow a better implementation). Is it worth continuing this style of
> >>   error handling? Or just move to -ve return means error? Using a different
> >>   bit would allow the kernel to piggy back the CR return code setting with
> >>   a test for the error case exit.
> > 
> > GCC does not model the condition registers,

Huh?  It does model the condition register, as 8 registers in GCC's
internal model (one each for CR0..CR7).

There is no way to use CR0 across function calls, with our ABIs: it is
a volatile register.

GCC does not model the SO bits in the CR fields.

If the calling convention would only use registers GCC *does* know
about, we can have a builtin for this, so that you can get better
inlining etc., no need for an assembler wrapper.

> > But the kernel uses the -errno convention internally, so I think it
> > would make sense to pass this to userspace and not convert back and
> > forth.  This would align with what most of the architectures do, and
> > also avoids the GCC oddity.
> 
> Yes I would be interested in opinions for this option. It seems like
> matching other architectures is a good idea. Maybe there are some
> reasons not to.

Agreed with you both here.

> >> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
> >>   calls if there was interest in developing an ABI for 32-bit programs.
> >>   Marginal benefit in avoiding compat syscall selection.
> > 
> > We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
> > provide an ELFv1 port for this given that it's POWER9-specific.

We *do* have a 32-bit LE ABI.  And ELFv1 is not 32-bit either.  Please
don't confuse these things :-)

The 64-bit LE kernel does not really support 32-bit userland (or BE
userland), *that* is what you want to say.

> > From the glibc perspective, the major question is how we handle run-time
> > selection of the system call instruction sequence.

Well, if it is inlined you don't have this problem either!  :-)


Segher
