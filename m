Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9123CB0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 15:40:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMCRS5rKjzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 23:40:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4BMCLj5fpkzDqf2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 23:35:57 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 075DZ7fT020629;
 Wed, 5 Aug 2020 08:35:08 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 075DZ5lG020627;
 Wed, 5 Aug 2020 08:35:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 5 Aug 2020 08:35:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v8 5/8] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
Message-ID: <20200805133505.GN6753@gate.crashing.org>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <2a67c333893454868bbfda773ba4b01c20272a5d.1588079622.git.christophe.leroy@c-s.fr>
 <878sflvbad.fsf@mpe.ellerman.id.au>
 <65fd7823-cc9d-c05a-0816-c34882b5d55a@csgroup.eu>
 <87wo2dy5in.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wo2dy5in.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, nathanl@linux.ibm.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, linux-arch@vger.kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Aug 05, 2020 at 04:24:16PM +1000, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Indeed, 32-bit doesn't have a redzone, so I believe it needs a stack 
> > frame whenever it has anything to same.
> 
> Yeah OK that would explain it.
> 
> > Here is what I have in libc.so:
> >
> > 000fbb60 <__clock_gettime>:
> >     fbb60:	94 21 ff e0 	stwu    r1,-32(r1)

This is the *only* place where you can use a negative offset from r1:
in the stwu to extend the stack (set up a new stack frame, or make the
current one bigger).

> > diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h 
> > b/arch/powerpc/include/asm/vdso/gettimeofday.h
> > index a0712a6e80d9..0b6fa245d54e 100644
> > --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
> > +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> > @@ -10,6 +10,7 @@
> >     .cfi_startproc
> >   	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
> >   	mflr		r0
> > +	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
> >     .cfi_register lr, r0
> 
> The cfi_register should come directly after the mflr I think.

That is the idiomatic way to write it, and most obviously correct.  But
as long as the value in LR at function entry is available in multiple
places (like, in LR and in R0 here), it is fine to use either for
unwinding.  Sometimes you can use this to optimise the unwind tables a
bit -- not really worth it in hand-written code, it's more important to
make it legible ;-)

> >> There's also no code to load/restore the TOC pointer on BE, which I
> >> think we'll need to handle.
> >
> > I see no code in the generated vdso64.so doing anything with r2, but if 
> > you think that's needed, just let's do it:
> 
> Hmm, true.
> 
> The compiler will use the toc for globals (and possibly also for large
> constants?)

And anything else it bloody well wants to, yeah :-)

> AFAIK there's no way to disable use of the toc, or make it a build error
> if it's needed.

Yes.

> At the same time it's much safer for us to just save/restore r2, and
> probably in the noise performance wise.

If you want a function to be able to work with ABI-compliant code safely
(in all cases), you'll have to make it itself ABI-compliant as well,
yes :-)

> So yeah we should probably do as below.

[ snip ]

Looks good yes.


Segher
