Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A5F1F8033
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 03:24:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kKdZ3b1wzDqFs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 11:24:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49kKGr1DcnzDr0Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 11:08:35 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 05D18GAQ009853;
 Fri, 12 Jun 2020 20:08:16 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 05D18FdZ009852;
 Fri, 12 Jun 2020 20:08:15 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 12 Jun 2020 20:08:15 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
Message-ID: <20200613010815.GR31009@gate.crashing.org>
References: <49YBKY13Szz9sT4@ozlabs.org>
 <20200611224355.71174-1-ndesaulniers@google.com>
 <20200611235256.GL31009@gate.crashing.org>
 <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Jun 12, 2020 at 02:33:09PM -0700, Nick Desaulniers wrote:
> On Thu, Jun 11, 2020 at 4:53 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > The PowerPC part of
> > https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html#Machine-Constraints
> > (sorry, no anchor) documents %U.
> 
> I thought those were constraints, not output templates?  Oh,
>     The asm statement must also use %U<opno> as a placeholder for the
>     “update” flag in the corresponding load or store instruction.
> got it.

Traditionally, *all* constraints were documented here, including the
ones that are only meant for GCC's internal use.  And the output
modifiers were largely not documented at all.

For GCC 10, for Power, I changed it to only document the constraints
that should be public in gcc.info (and everything in gccint.info).  The
output modifiers can neatly be documented here as well, since it such a
short section now.  We're not quite there yet, but getting there.

> > Traditionally the source code is the documentation for this.  The code
> > here starts with the comment
> >       /* Write second word of DImode or DFmode reference.  Works on register
> >          or non-indexed memory only.  */
> > (which is very out-of-date itself, it works fine for e.g. TImode as well,
> > but alas).
> >
> > Unit tests are completely unsuitable for most compiler things like this.
> 
> What? No, surely one may write tests for output operands.  Grepping
> for `%L` in gcc/ was less fun than I was hoping.

You should look for 'L' instead (incl. those quotes) ;-)

Unit tests are 100x as much work, and gets <5% of the problems, compared
to regression tests.  Unit tests only test the stuff you should have
written *anyway*.  It is much more useful to test that much higher level
things work, IMNSHO.

> > HtH,
> 
> Yes, perfect, thank you so much!  So it looks like LLVM does not yet
> handle %L properly for memory operands.
> https://bugs.llvm.org/show_bug.cgi?id=46186#c4
> It's neat to see how this is implemented in GCC (and how many aren't
> implemented in LLVM, yikes :( ).  For reference, this is implemented
> in PPCAsmPrinter::PrintAsmOperand() and
> PPCAsmPrinter::PrintAsmMemoryOperand() in
> llvm/lib/Target/PowerPC/PPCAsmPrinter.cpp.  GCC switches first on the
> modifier characters, then the operand type.

That is what the rs6000 backend currently does, yeah.  The print_operand
function just gets passed the modifier character (as "int code", or 0 if
there is no modifier).  Since there are so many modifiers there aren't
really any better options than just doing a "switch (code)" around
everything else (well, things can be factored, some helper functions,
etc., but this is mostly very old code, and it has grown organically).

> LLVM dispatches on operand type, then modifier.

That is neater, certainly for REG operands.

> When I was looking into LLVM's AsmPrinter class,
> I was surprised to see it's basically an assembler that just has
> complex logic to just do a bunch of prints, so it makes sense to see
> that pattern in GCC literally calling printf.

GCC always outputs assembler code.  This is usually a big advantage, for
things like output_operand.

> Some things I don't understand from PPC parlance is the "mode"
> (preinc, predec, premodify) and small data operands?

"mode" is "machine mode" -- SImode and the like.  PRE_DEC etc. are
*codes* (rtx codes), like,  (mem:DF (pre_dec:SI (reg:SI 39)))  (straight
from the manual).

> IIUC the bug report correctly, it looks like LLVM is failing for the
> __put_user_asm2_goto case for -m32.  A simple reproducer:
> https://godbolt.org/z/jBBF9b
> 
> void foo(long long in, long long* out) {
> asm volatile(
>   "stw%X1 %0, %1\n\t"
>   "stw%X1 %L0, %L1"
>   ::"r"(in), "m"(*out));
> }

This is wrong if operands[0] is a register, btw.  So it should use 'o'
as constraint (not 'm'), and then the 'X' output modifier has become
useless.

> prints (in GCC):
> foo:
>   stw 3, 0(5)
>   stw 4, 4(5)
>   blr
> (first time looking at ppc assembler, seems constants and registers
> are not as easy to distinguish,

The instruction mnemonic always tells you what types all arguments are.
Traditionally we don't write spaces after commas, either.  That is
actually easier to read -- well, if you are used to it, anyway! :-)

> https://developer.ibm.com/technologies/linux/articles/l-ppc/ say "Get
> used to it." LOL, ok).

Since quite a while you can write your assembler using register names as
well.  Not using the dangerous macros the Linux kernel had/has(with
which you can write "rN" in place of any "N", and it doesn't force you
to use the register name either, so you could write "li r3,r4" and
"mr r3,0" and even "addi r3,r0,1234", all very misleading).

> so that's "store word from register 3 into dereference of register 5
> plus 0, then store word from register 4 into dereference of register 5
> plus 4?"

Yup.

> Guessing the ppc32 abi is ILP32 putting long long's into two
> separate registers?

Yes, and the order is the same as it would be in memory (on BE, high
half goes into the lower-numbered register; on LE, the wr^Wother way
around).

> Seems easy to implement in LLVM (short of those modes/small data operands).

I don't know what SDATA variants LLVM does support?

> https://reviews.llvm.org/D81767

Output modifiers are not just for use by the calling convention (as your
examples already show :-) )

%Ln is the second word of a multi-word reference, not the "upper word"
(%Yn is third, %Zn is fourth, and for BE it isn't the high half even
for 2-word things).

The code looks like it will work (I don't know most LLVM specifics of
course).

Cheers,


Segher
