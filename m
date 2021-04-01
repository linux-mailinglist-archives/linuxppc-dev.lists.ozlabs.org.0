Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6D73516AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 18:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB7f728Qbz3clP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 03:18:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FB7dn29JNz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 03:18:19 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 131GBa12032064;
 Thu, 1 Apr 2021 11:11:36 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 131GBVOu032063;
 Thu, 1 Apr 2021 11:11:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 1 Apr 2021 11:11:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Xiongwei Song <sxwjean@gmail.com>
Subject: Re: [PATCH v2] powerpc/traps: Enhance readability for trap types
Message-ID: <20210401161131.GE13863@gate.crashing.org>
References: <20210330150425.10145-1-sxwjean@me.com>
 <875z17y79i.fsf@mpe.ellerman.id.au>
 <20210331212550.GD13863@gate.crashing.org>
 <CAEVVKH8XDiEGHjXj6sJAHynhwqKWpNqj_Ws03AqwNjR8OmHf5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEVVKH8XDiEGHjXj6sJAHynhwqKWpNqj_Ws03AqwNjR8OmHf5w@mail.gmail.com>
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
Cc: pmladek@suse.com, peterz@infradead.org, peterx@redhat.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, kan.liang@linux.intel.com,
 leobras.c@gmail.com, mikey@neuling.org, maddy@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, aik@ozlabs.ru,
 kjain@linux.ibm.com, msuchanek@suse.de, ravi.bangoria@linux.ibm.com,
 john.ogness@linutronix.de, alistair@popple.id.au, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 Xiongwei Song <sxwjean@me.com>, oleg@redhat.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 01, 2021 at 10:55:58AM +0800, Xiongwei Song wrote:
> Segher Boessenkool <segher@kernel.crashing.org> 于2021年4月1日周四 上午6:15写道：
> 
> > On Wed, Mar 31, 2021 at 08:58:17PM +1100, Michael Ellerman wrote:
> > > So perhaps:
> > >
> > >   EXC_SYSTEM_RESET
> > >   EXC_MACHINE_CHECK
> > >   EXC_DATA_STORAGE
> > >   EXC_DATA_SEGMENT
> > >   EXC_INST_STORAGE
> > >   EXC_INST_SEGMENT
> > >   EXC_EXTERNAL_INTERRUPT
> > >   EXC_ALIGNMENT
> > >   EXC_PROGRAM_CHECK
> > >   EXC_FP_UNAVAILABLE
> > >   EXC_DECREMENTER
> > >   EXC_HV_DECREMENTER
> > >   EXC_SYSTEM_CALL
> > >   EXC_HV_DATA_STORAGE
> > >   EXC_PERF_MONITOR
> >
> > These are interrupt (vectors), not exceptions.  It doesn't matter all
> > that much, but confusing things more isn't useful either!  There can be
> > multiple exceptions that all can trigger the same interrupt.
> >
> >  When looking at the reference manual of e500 and e600 from NXP
>  official, they call them as interrupts.While looking at the "The
> Programming Environments"
>  that is also from NXP, they call them exceptions. Looks like there is
>  no explicit distinction between interrupts and exceptions.

The architecture documents have always called it interrupts.  The PEM
says it calls them exceptions instead, but they are called interrupts in
the architecture (and the PEM says that, too).

> Here is the "The Programming Environments" link:
> https://www.nxp.com.cn/docs/en/user-guide/MPCFPE_AD_R1.pdf

That document is 24 years old.  The architecture is still published,
new versions regularly.

> As far as I know, the values of interrupts or exceptions above are defined
> explicitly in reference manual or the programming environments.

They are defined in the architecture.

> Could
> you please provide more details about multiple exceptions with the same
> interrupts?

The simplest example is 700, program interrupt.  There are many causes
for it, including all the exceptions in FPSCR: VX, ZX, OX, UX, XX, and
VX is actually divided into nine separate cases itself.  There also are
the various causes of privileged instruction type program interrupts,
and  the trap type program interrupt, but the FEX ones are most obvious
here.


Segher
