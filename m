Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D014EC1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 12:57:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488G1p0fxPzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 22:57:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 488FzJ1HyXzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 22:55:39 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00VBtFCD018161;
 Fri, 31 Jan 2020 05:55:15 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00VBtEuF018160;
 Fri, 31 Jan 2020 05:55:14 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2020 05:55:14 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
Message-ID: <20200131115514.GZ22482@gate.crashing.org>
References: <20200129162947.GN22482@gate.crashing.org>
 <87imku8ac5.fsf@oldenburg2.str.redhat.com>
 <20200129175104.GO22482@gate.crashing.org>
 <87k1595iok.fsf@oldenburg2.str.redhat.com>
 <20200130112512.GS22482@gate.crashing.org>
 <87y2tp40d2.fsf@oldenburg2.str.redhat.com>
 <20200130135030.GV22482@gate.crashing.org>
 <f46bafbd-c553-565a-38a4-73d81cc5a8d2@linaro.org>
 <20200130214105.GX22482@gate.crashing.org>
 <7568c170-55ef-d3b0-fe85-e5bec68c1fe1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7568c170-55ef-d3b0-fe85-e5bec68c1fe1@linaro.org>
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
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Jan 31, 2020 at 08:30:45AM -0300, Adhemerval Zanella wrote:
> On 30/01/2020 18:41, Segher Boessenkool wrote:
> > On Thu, Jan 30, 2020 at 02:04:51PM -0300, Adhemerval Zanella wrote:
> >> be value propagated over
> >> functions calls and over different scopes, which I take from your 
> >> explanation is not supported and fragile.
> > 
> > You probably misundertand that, but let me ask: where is err assigned to
> > at all in the code you quoted?  I don't see it.  Maybe it's hidden in some
> > macro?
> 
> Indeed it was not explicit in the example code, it is burried in the
> INTERNAL_SYSCALL_CALL macro which calls sparc-defined macros. For instance, 
> with 6 argument kernel syscall, it issues:
> 
> #define inline_syscall6(string,err,name,arg1,arg2,arg3,arg4,arg5,arg6)  \
> ({                                                                      \
>         register long __o0 __asm__ ("o0") = (long)(arg1);               \
>         register long __o1 __asm__ ("o1") = (long)(arg2);               \
>         register long __o2 __asm__ ("o2") = (long)(arg3);               \
>         register long __o3 __asm__ ("o3") = (long)(arg4);               \
>         register long __o4 __asm__ ("o4") = (long)(arg5);               \
>         register long __o5 __asm__ ("o5") = (long)(arg6);               \
>         err = name;                                                     \
>         __asm __volatile (string : "=r" (err), "=r" (__o0) :            \
>                           "0" (err), "1" (__o0), "r" (__o1),            \
>                           "r" (__o2), "r" (__o3), "r" (__o4),           \
>                           "r" (__o5) :                                  \
>                           __SYSCALL_CLOBBERS);                          \
>         __o0;                                                           \
> })
> 
> Where 'err' defined by 'INTERNAL_SYSCALL_DECL' should be the 'err' macro
> argument.

GCC makes sure that what is in register g1 at the end of this asm does
end up in the C variable "err" (at least conceptually, the actual code
can be optimised further).

> I meant a register variable where its use 'after' the extended asm
> is expected to use the define register.

Yes, that is not supported like this.  You'll have to use some more
inline asm at that use (with "err" as input there).  Or, if you actually
care about this being in a specific register, maybe you shouldn't write
this in C at all?  Writing assembler code in assembler language (in a
single inline asm block, or even in an assembler source file) tends to
give much better results (and is a lot easier) than trying to second-
guess the compiler.  You can write pretty much anything as inline
assembler code, but that doesn't mean you have to, or that that would
be a good idea.

Things on the border like system calls are hard to handle.  I like the
idea of doing those in compiler builtins ("compiler intrinsics"), but
that has its own problems as well: mostly, need to {write down / lock
down / determine in advance} more of the calling convention than the
other approaches.  And of course it will take years before most projects
can use it :-/


Segher
