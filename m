Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DE49FDBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 17:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JljCj1pn4z3cQb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 03:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JljCJ0gsqz2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 03:12:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB099113E;
 Fri, 28 Jan 2022 08:12:08 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.13.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60D523F793;
 Fri, 28 Jan 2022 08:12:06 -0800 (PST)
Date: Fri, 28 Jan 2022 16:11:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sven Schnelle <svens@linux.ibm.com>
Subject: Re: ftrace hangs waiting for rcu
Message-ID: <YfQVzba5thVs+qap@FVFF77S0Q05N>
References: <20220127114249.03b1b52b@gandalf.local.home>
 <YfLjIOlGfFmbh1Zv@FVFF77S0Q05N> <yt9dy231yq90.fsf_-_@linux.ibm.com>
 <YfQCohKWJg9H+uID@FVFF77S0Q05N> <yt9dee4rn8q7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yt9dee4rn8q7.fsf@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, hca@linux.ibm.com,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@kernel.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 28, 2022 at 05:08:48PM +0100, Sven Schnelle wrote:
> Hi Mark,
> 
> Mark Rutland <mark.rutland@arm.com> writes:
> 
> > On arm64 I bisected this down to:
> >
> >   7a30871b6a27de1a ("rcu-tasks: Introduce ->percpu_enqueue_shift for dynamic queue selection")
> >
> > Which was going wrong because ilog2() rounds down, and so the shift was wrong
> > for any nr_cpus that was not a power-of-two. Paul had already fixed that in
> > rcu-next, and just sent a pull request to Linus:
> >
> >   https://lore.kernel.org/lkml/20220128143251.GA2398275@paulmck-ThinkPad-P17-Gen-1/
> >
> > With that applied, I no longer see these hangs.
> >
> > Does your s390 test machine have a non-power-of-two nr_cpus, and does that fix
> > the issue for you?
> 
> We noticed the PR from Paul and are currently testing the fix. So far
> it's looking good. The configuration where we have seen the hang is a
> bit unusual:
> 
> - 16 physical CPUs on the kvm host
> - 248 logical CPUs inside kvm

Aha! 248 is notably *NOT* a power of two, and in this case the shift would be
wrong (ilog2() would give 7, when we need a shift of 8).

So I suspect you're hitting the same issue as I was.

Thanks,
Mark.

> - debug kernel both on the host and kvm guest
> 
> So things are likely a bit slow in the kvm guest. Interesting is that
> the number of CPUs is even. But maybe RCU sees an odd number of CPUs
> and gets confused before all cpus are brought up. Have to read code/test
> to see whether that could be possible.
> 
> Thanks for investigating!
> Sven
