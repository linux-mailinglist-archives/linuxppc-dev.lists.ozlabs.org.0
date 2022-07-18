Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1A578D68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 00:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmx862TlTz3c30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 08:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmx7g6DSqz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 08:13:51 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26IM8fqS005455;
	Mon, 18 Jul 2022 17:08:41 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26IM8dBn005451;
	Mon, 18 Jul 2022 17:08:39 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 18 Jul 2022 17:08:39 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
Message-ID: <20220718220839.GF25951@gate.crashing.org>
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com> <87cze3docs.fsf@mpe.ellerman.id.au> <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 12:06:52PM -0700, Linus Torvalds wrote:
> On Sun, Jul 17, 2022 at 9:41 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >         li 4,254                 #,
> >
> > Here we load 254 into r4, which is the 2nd parameter to memset (c).
> 
> I love how even powerpc people know that "4" is bogus, and have to
> make it clear that it means "r4".

This is compiler output.  Compiler output is mainly meant for the
assembler to produce object code from.  It isn't meant to be readable
(and e.g. -fverbose-asm didn't help much here, that's the "#," ;-) ).

The mnemonic determines what the operands mean.  It is much easier to
read and write "li 4,254" than "li r4,254" or "li %r4,254", all of which
are valid.  You can also write "li 3+1,2*127", but not with the other
forms (this is useful if you use assembler macros, which are way more
powerful and appropriate than abusing the C preprocessor, when writing
assembler code).

It matters more if you have three or four or five or six operands to an
assembler instruction, all the extra line noise makes things illegible.

The "%r4" variant hails from winnt.  It is a bit problematic in inline
assembler, because you need to escape the % in extended inline asm, but
not in basic inline asm.  It also is pure line noise to read.

The "r4" variant is problematic if you have symbols named the same.
When you use the -mregnames assembler option it is taken to mean the
register; you can write "(r6)" to mean the symbol.  (There also are "sp"
and "rtos" and "xer" and whatnot, not just "r4").

> I don't understand why the powerpc assembler is so messed up, and uses
> random integer constants for register "names".

360 was the same.  370 was the same.  390 is the same.  801 was the
same.  RIOS (aka POWER) was the same.  So yes, PowerPC inherited it, I
don't know how much thought was put into this, don't change a winning
team etc.

> And it gets even worse, when you start mixing FP, vector and integer "names".

It is clear from the mnemonic what the operands are: some register, an
immediate, a constant, etc.  An expression (which can include object
symbols) can be any of those.

Assembler language is unforgiving.  It isn't easy to write, and most
mistakes will not be diagnosed.  If the assmbler language makes it
easier to read the code, that makes it more likely correct code will be
written, and that correct code will be written in less time.

> I've seen many bad assemblers (in fact, I have *written* a couple of
> bad assemblers myself), but I have never seen anything quite that
> broken on any other architecture.
> 
> Oddities, yes ("$" as a prefix for register? Alpha asm is also very
> odd), but nothing *quite* as broken as "simple constants have entirely
> different meanings depending on the exact instruction and argument
> position".

What is broken about that?  It makes everything very consistent, and
very readable.  Sigils are just nasty, and having the register names the
same as valid symbol names is also problematic.

> It's not even an IBM thing. S390 uses perfectly sane register syntax,
> and calls things '%r4" etc.

s390 has the same syntax, and even inherited the GAS code for this from
the ppc port.

> The human-written asm files have those #define's in headers just to
> make things slightly more legible, because apparently the assembler
> doesn't even *accept* the sane names.

That was true a long time ago.  And the "#define r0 0" thing caused
quite a few bugs itself btw.

> So it's not even a "the compiler
> generates this abbreviated illegible mess". It's literally that the
> assembler is so horrid.

The disassembler has shown "r4" etc. by default since ages.  The
assembler needs -mregnames to accept it; enabling this by default would
be a compatibility break, not acceptable.

> Why do people put up with that?

Why are people misinformed?

Is there anything in particular in the documentation we could improve?


Hope this helps,


Segher
