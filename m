Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2F11D0A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 16:14:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YclD2BdvzDr4r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 02:14:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ychk4c0ZzDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 02:11:50 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xBCFAuSn025295;
 Thu, 12 Dec 2019 09:10:56 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xBCFApXE025289;
 Thu, 12 Dec 2019 09:10:51 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 12 Dec 2019 09:10:51 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191212151051.GF3152@gate.crashing.org>
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zimp0ay.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Dec 12, 2019 at 04:42:13PM +1100, Michael Ellerman wrote:
> Some of the generic versions don't generate good code compared to our
> versions, but that's because READ_ONCE() is triggering stack protector
> to be enabled.

The *big* difference is the generic code has a special path that does not
do an atomic access at all.  Either that is a good idea or not, but we
probably should not change the behaviour here, not without benchmarking
anyway.

> For example, comparing an out-of-line copy of the generic and ppc
> versions of test_and_set_bit_lock():

(With what GCC version, and what exact flags?)

(A stand-alone testcase would be nice too, btw).

(Michael gave me one, thanks!)

> If you squint, the generated code for the actual logic is pretty similar, but
> the stack protector gunk makes a big mess.

And with stack protector it cannot shrink-wrap the exit, one of the bigger
performance costs of the stack protector.  The extra branch in the generic
code isn't fun either (but maybe it is good for performance?

> It's particularly bad here
> because the ppc version doesn't even need a stack frame.

You are hit by this:

  if (... || (RECORD_OR_UNION_TYPE_P (var_type)
              && record_or_union_type_has_array_p (var_type)) ...)

(in the GCC code, stack_protect_decl_p (), cfgexpand.c)

for the variable __u from

#define __READ_ONCE(x, check)                                           \
({                                                                      \
        union { typeof(x) __val; char __c[1]; } __u;                    \
        __read_once_size(&(x), __u.__c, sizeof(x));                     \
        smp_read_barrier_depends(); /* Enforce dependency ordering from x */ \
        __u.__val;                                                      \
})

This is all optimised away later, but at the point this decision is made
GCC does not know that.

> So READ_ONCE() + STACKPROTECTOR_STRONG is problematic. The root cause is
> presumably that READ_ONCE() does an access to an on-stack variable,
> which triggers the heuristics in the compiler that the stack needs
> protecting.

Not exactly, but the problem is READ_ONCE alright.

> It seems like a compiler "mis-feature" that a constant-sized access to the stack
> triggers the stack protector logic, especially when the access is eventually
> optimised away. But I guess that's probably what we get for doing tricks like
> READ_ONCE() in the first place :/

__c is an array.  That is all that matters.  I don't think it is very
reasonable to fault GCC for this.

> I tried going back to the version of READ_ONCE() that doesn't use a
> union, ie. effectively reverting dd36929720f4 ("kernel: make READ_ONCE()
> valid on const arguments") to get:
> 
> #define READ_ONCE(x)							\
> 	({ typeof(x) __val; __read_once_size(&x, &__val, sizeof(__val)); __val; })

With that, it is that the address of __val is taken:

  ...
  || TREE_ADDRESSABLE (var)
  ...

> But it makes no difference, the stack protector stuff still triggers. So
> I guess it's simply taking the address of a stack variable that triggers
> it.

Not in the earlier testcase.  Btw, there is no such thing as a "stack
variable" at that point in the compiler: it just is a local var.

> There seems to be a function attribute to enable stack protector for a
> function, but not one to disable it:
>   https://gcc.gnu.org/onlinedocs/gcc-9.2.0/gcc/Common-Function-Attributes.html#index-stack_005fprotect-function-attribute

Yes.

> That may not be a good solution even if it did exist, because it would
> potentially disable stack protector in places where we do want it
> enabled.

Right, I don't think we want that, such an attribute invites people to
write dangerous code.  (You already can just put the functions that you
want to be unsafe in a separate source file...  It sounds even sillier
that way, heh).


Segher
