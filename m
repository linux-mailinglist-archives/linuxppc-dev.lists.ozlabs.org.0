Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C53516B0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 18:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB7lQ72v2z3cCG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 03:23:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FB7l430Wpz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 03:22:55 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 131GGI0w032424;
 Thu, 1 Apr 2021 11:16:18 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 131GGGMJ032422;
 Thu, 1 Apr 2021 11:16:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 1 Apr 2021 11:16:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/traps: Enhance readability for trap types
Message-ID: <20210401161616.GF13863@gate.crashing.org>
References: <20210330150425.10145-1-sxwjean@me.com>
 <875z17y79i.fsf@mpe.ellerman.id.au>
 <20210331212550.GD13863@gate.crashing.org>
 <87im5620f3.fsf@mpe.ellerman.id.au> <1617262858.ls37f2d81f.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617262858.ls37f2d81f.astroid@bobo.none>
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
Cc: ravi.bangoria@linux.ibm.com, aik@ozlabs.ru, peterx@redhat.com,
 oleg@redhat.com, paulus@samba.org, kan.liang@linux.intel.com,
 leobras.c@gmail.com, mikey@neuling.org, maddy@linux.ibm.com,
 haren@linux.ibm.com, peterz@infradead.org, kjain@linux.ibm.com,
 msuchanek@suse.de, pmladek@suse.com, john.ogness@linutronix.de,
 alistair@popple.id.au, kvm-ppc@vger.kernel.org, jniethe5@gmail.com,
 atrajeev@linux.vnet.ibm.com, Xiongwei Song <sxwjean@me.com>,
 Xiongwei Song <sxwjean@gmail.com>, linux-kernel@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 01, 2021 at 06:01:29PM +1000, Nicholas Piggin wrote:
> Excerpts from Michael Ellerman's message of April 1, 2021 12:39 pm:
> > Segher Boessenkool <segher@kernel.crashing.org> writes:
> >> On Wed, Mar 31, 2021 at 08:58:17PM +1100, Michael Ellerman wrote:
> >>> So perhaps:
> >>> 
> >>>   EXC_SYSTEM_RESET
> >>>   EXC_MACHINE_CHECK
> >>>   EXC_DATA_STORAGE
> >>>   EXC_DATA_SEGMENT
> >>>   EXC_INST_STORAGE
> >>>   EXC_INST_SEGMENT
> >>>   EXC_EXTERNAL_INTERRUPT
> >>>   EXC_ALIGNMENT
> >>>   EXC_PROGRAM_CHECK
> >>>   EXC_FP_UNAVAILABLE
> >>>   EXC_DECREMENTER
> >>>   EXC_HV_DECREMENTER
> >>>   EXC_SYSTEM_CALL
> >>>   EXC_HV_DATA_STORAGE
> >>>   EXC_PERF_MONITOR
> >>
> >> These are interrupt (vectors), not exceptions.  It doesn't matter all
> >> that much, but confusing things more isn't useful either!  There can be
> >> multiple exceptions that all can trigger the same interrupt.
> > 
> > Yeah I know, but I think that ship has already sailed as far as the
> > naming we have in the kernel.
> 
> It has, but there are also several other ships also sailing in different 
> directions. It could be worse though, at least they are not sideways in 
> the Suez.

:-)

> > We have over 250 uses of "exc", and several files called "exception"
> > something.
> > 
> > Using "interrupt" can also be confusing because Linux uses that to mean
> > "external interrupt".
> > 
> > But I dunno, maybe INT or VEC is clearer? .. or TRAP :)
> 
> We actually already have defines that follow Segher's suggestion, it's 
> just that they're hidden away in a KVM header.
> 
> #define BOOK3S_INTERRUPT_SYSTEM_RESET   0x100
> #define BOOK3S_INTERRUPT_MACHINE_CHECK  0x200
> #define BOOK3S_INTERRUPT_DATA_STORAGE   0x300
> #define BOOK3S_INTERRUPT_DATA_SEGMENT   0x380
> #define BOOK3S_INTERRUPT_INST_STORAGE   0x400
> #define BOOK3S_INTERRUPT_INST_SEGMENT   0x480
> #define BOOK3S_INTERRUPT_EXTERNAL       0x500
> #define BOOK3S_INTERRUPT_EXTERNAL_HV    0x502
> #define BOOK3S_INTERRUPT_ALIGNMENT      0x600
> 
> It would take just a small amount of work to move these to general 
> powerpc header, add #ifdefs for Book E/S where the numbers differ,
> and remove the BOOK3S_ prefix.
> 
> I don't mind INTERRUPT_ but INT_ would be okay too. VEC_ actually
> doesn't match what Book E does (which is some weirdness to map some
> of them to match Book S but not all, arguably we should clean that
> up too and just use vector numbers consistently, but the INTERRUPT_
> prefix would still be valid if we did that).

VEC also is pretty incorrect: there is code at those addresses, not
vectors pointing to code (as similar things on some other architectures
have).  Everyone understands what it means of course, except it is
confusing with a thing we *do* have on Power called VEC (the MSR bit) :-P

(And TRAP is just one cause of 700...)


Segher
