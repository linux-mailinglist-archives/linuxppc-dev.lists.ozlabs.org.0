Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 900A714E4FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 22:42:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487v3F3t0JzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 08:42:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 487v1W3hfvzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 08:41:18 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00ULf7Qh021302;
 Thu, 30 Jan 2020 15:41:07 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00ULf6cG021301;
 Thu, 30 Jan 2020 15:41:06 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 30 Jan 2020 15:41:05 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
Message-ID: <20200130214105.GX22482@gate.crashing.org>
References: <20200128200133.GJ22482@gate.crashing.org>
 <87wo9a8cc8.fsf@oldenburg2.str.redhat.com>
 <20200129162947.GN22482@gate.crashing.org>
 <87imku8ac5.fsf@oldenburg2.str.redhat.com>
 <20200129175104.GO22482@gate.crashing.org>
 <87k1595iok.fsf@oldenburg2.str.redhat.com>
 <20200130112512.GS22482@gate.crashing.org>
 <87y2tp40d2.fsf@oldenburg2.str.redhat.com>
 <20200130135030.GV22482@gate.crashing.org>
 <f46bafbd-c553-565a-38a4-73d81cc5a8d2@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f46bafbd-c553-565a-38a4-73d81cc5a8d2@linaro.org>
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

On Thu, Jan 30, 2020 at 02:04:51PM -0300, Adhemerval Zanella wrote:
> On 30/01/2020 10:50, Segher Boessenkool wrote:
> > On Thu, Jan 30, 2020 at 01:03:53PM +0100, Florian Weimer wrote:
> >>> This is why that *is* the only supported use.  The documentation could
> >>> use a touch-up, I think.  Unless we still have problems here?
> >>
> >> I really don't know.  GCC still has *some* support for the old behavior,
> >> though.
> > 
> > No.  No support.  It still does some of the same things, but that can
> > change (and probably should).  But this hasn't been supported since the
> > dark ages, and the documentation has become gradually more explicit
> > about it.
> > 
> 
> I think this might be related to an odd sparc32 issue I am seeing with 
> newer clock_nanosleep.  The expanded code is:
> 
> --
>   register long err __asm__("g1");                                   // INTERNAL_SYSCALL_DECL  (err)
>   r = ({                                                             // r = INTERNAL_SYSCALL_CANCEL (...)
> 	 long int sc_ret;
>          if (SINGLE_THREAD_P)
> 	   sc_ret = INTERNAL_SYSCALL_CALL (__VA_ARGS__);
>          else
>            {
> 	     int sc_cancel_oldtype = __libc_enable_asynccancel ();
> 	     sc_ret = INTERNAL_SYSCALL_CALL (__VA_ARGS__);          // It issues the syscall with the asm (...)
> 	     __librt_disable_asynccancel (sc_cancel_oldtype);
> 	   }
>          sc_ret;
>        });
>   if ((void) (val), __builtin_expect((err) != 0, 0))                // if (! INTERNAL_SYSCALL_ERROR_P (r, err))
>     return 0;
>   if ((-(val)) != ENOSYS)                                           // if (INTERNAL_SYSCALL_ERRNO (r, err) != ENOSYS)
>     return ((-(val)));                                              //   return INTERNAL_SYSCALL_ERRNO (r, err);
> 
>   [...]
> 
>   r = ({                                                             // r = INTERNAL_SYSCALL_CANCEL (...)
>        [...]
>       )}
>   if ((void) (val), __builtin_expect((err) != 0, 0))                // if (! INTERNAL_SYSCALL_ERROR_P (r, err))
>     {
>       [...]
>     }
>   return ((void) (val), __builtin_expect((err) != 0, 0))            // return (INTERNAL_SYSCALL_ERROR_P (r, err)
>          ? ((-(val))) : 0;                                          //        ? INTERNAL_SYSCALL_ERRNO (r, err) : 0);
> --
> 
> It requires that 'err' (assigned to 'g1')

What do you mean by "assigned to g1"?

> be value propagated over
> functions calls and over different scopes, which I take from your 
> explanation is not supported and fragile.

You probably misundertand that, but let me ask: where is err assigned to
at all in the code you quoted?  I don't see it.  Maybe it's hidden in some
macro?

Or, maybe some asm writes to g1?  This is explicitly not okay (quote
from the GCC manual):

  Defining a register variable does not reserve the register.  Other than
  when invoking the Extended 'asm', the contents of the specified register
  are not guaranteed.  For this reason, the following uses are explicitly
  _not_ supported.  If they appear to work, it is only happenstance, and
  may stop working as intended due to (seemingly) unrelated changes in
  surrounding code, or even minor changes in the optimization of a future
  version of gcc:

   * Passing parameters to or from Basic 'asm'
   * Passing parameters to or from Extended 'asm' without using input or
     output operands.
   * Passing parameters to or from routines written in assembler (or
     other languages) using non-standard calling conventions.

> It also seems that if I 
> move the __libc_enable_* calls before 'err' initialization and after
> its usage the code seems to works, but again it seems this usage
> is not really supported on gcc.
> 
> So it seems that the current usage of 'INTERNAL_SYSCALL_DECL' and
> 'INTERNAL_SYSCALL_ERROR_P' are fragile if the architecture *does*
> use the 'err' variable and it is defined a register alias (which 
> its the case only for sparc currently).
> 
> Although a straightforward for sparc would be redefine 
> INTERNAL_SYSCALL_DECL to not use a register alias, I still think
> we should just follow Linux kernel ABI convention where value in 
> the range between -4095 and -1 indicates an error and handle any 
> specific symbols that might not strictly follow it with an 
> arch-specific implementation (as we do for lseek on x32 and
> mips64n32).  It would allow cleanup a lot of code and avoid such
> pitfalls.

I don't really understand what you call a "register alias", either.
(And i don't know the Sparc ABI well enough to help you with that).


Segher
