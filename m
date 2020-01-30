Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540114DC52
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 14:53:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487hdG3vr8zDqZx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 00:53:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 487hZV4LKJzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 00:50:40 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00UDoVLr032679;
 Thu, 30 Jan 2020 07:50:31 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00UDoUw8032678;
 Thu, 30 Jan 2020 07:50:30 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 30 Jan 2020 07:50:30 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
Message-ID: <20200130135030.GV22482@gate.crashing.org>
References: <20200128154026.GI22482@gate.crashing.org>
 <87o8unbm8u.fsf@oldenburg2.str.redhat.com>
 <20200128200133.GJ22482@gate.crashing.org>
 <87wo9a8cc8.fsf@oldenburg2.str.redhat.com>
 <20200129162947.GN22482@gate.crashing.org>
 <87imku8ac5.fsf@oldenburg2.str.redhat.com>
 <20200129175104.GO22482@gate.crashing.org>
 <87k1595iok.fsf@oldenburg2.str.redhat.com>
 <20200130112512.GS22482@gate.crashing.org>
 <87y2tp40d2.fsf@oldenburg2.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2tp40d2.fsf@oldenburg2.str.redhat.com>
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
Cc: libc-alpha@sourceware.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi again,

On Thu, Jan 30, 2020 at 01:03:53PM +0100, Florian Weimer wrote:
> > This is why that *is* the only supported use.  The documentation could
> > use a touch-up, I think.  Unless we still have problems here?
> 
> I really don't know.  GCC still has *some* support for the old behavior,
> though.

No.  No support.  It still does some of the same things, but that can
change (and probably should).  But this hasn't been supported since the
dark ages, and the documentation has become gradually more explicit
about it.

> For example, local register variables are treated as
> initialized, and I think you can still use registers like global
> variables.  GCC does not perform copy propagation here:
> 
> int f1 (int);
> 
> int
> f (void)
> {
>   register int edi __asm__ ("edi");
>   int edi_copy = edi;
>   return f1 (1) + edi_copy;
> }

f:
        pushl   %edi
        subl    $20, %esp
        pushl   $1
        call    f1
        addl    %edi, %eax
        addl    $24, %esp
        popl    %edi
        ret

It takes the edi value *after* the call.  The behaviour is undefined,
so that is not a problem.  (This is a GCC 10 from September, fwiw).

> And the case that we agreed should be defined in fact is not:
> 
> void f1 (int);
> 
> int
> f (void)
> {
>   register int edi __asm__ ("edi");
>   asm ("#" : "=r" (edi));
>   f1 (1);
>   return edi;
> }

f:
        pushl   %edi
        subl    $20, %esp
#APP
        #
#NO_APP
        pushl   $1
        call    f1
        movl    %edi, %eax
        addl    $24, %esp
        popl    %edi
        ret

Changing it to "# %0" (so that we can see what we are doing) gives

#APP
        # %edi
#NO_APP

All as expected.

> On x86-64,

Oh, this was i386, since you used edi.  On x86-64:

f:
        pushq   %rbx
        movl    %edi, %ebx
        movl    $1, %edi
        call    f1
        addl    %ebx, %eax
        popq    %rbx
        ret

for that first testcase, taking edi before the call, which is not
*guaranteed* to happen, but still can; and

f:
        subq    $8, %rsp
        movl    $1, %edi
        call    f1
        addq    $8, %rsp
        movl    %edi, %eax
        ret

The asm was right before that "mov $1,%edi", so it was optimised away:
it is not a volatile asm, and its output is unused.  Making the asm
statement volatile gives

f:
        subq    $8, %rsp
#APP
        # %edi
#NO_APP
        movl    $1, %edi
        call    f1
        addq    $8, %rsp
        movl    %edi, %eax
        ret

> %edi is used to pass the first function parameter, so the
> call clobbers %edi.  It is simply ambiguous whether edi (the variable)
> should retain the value prior to the call to f1 (which I think is what
> should happen under the new model, where register variables are only
> affect asm operands), or if edi (the variable) should have the value of
> %edi (the register) after the call (the old model).

There is nothing ambiguous there, afaics?  Other than the edi value you
use in the asm is coming out of thin air (but it will always work with
current GCC; that's not really specified though).

> Should we move this to the gcc list?

Whoops, I thought that was on Cc:.  Sure.


Segher
