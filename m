Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D317A57E068
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 13:03:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq64g5wr9z3dqC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 21:03:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLZZhI4A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLZZhI4A;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq6446Tshz2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 21:03:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 660556137B;
	Fri, 22 Jul 2022 11:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583BEC341C6;
	Fri, 22 Jul 2022 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658487793;
	bh=gajyD+WJ9t3ABvxX9BRkdBmZElhbZ0gxOqXZEcwzeL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLZZhI4AskrmWJuqTjEnLzl7OlDfW7QZDHepbLOlKZ9dkU4H6MHPaT2C9eQoT+pbD
	 m6dWfWODUPVQIVIa8+X3Bla19vIpFCKYFGGQeRuBOE4TqVBs3kTQXIzbkhT1ssMCUK
	 ZvR3ZdpVl52M16vAgIcpmr2w86Ju+5Ej0g/y83+FmVxuQaGZltnalBoJEIwiqY9QrU
	 OpV24R93x7+Po9kumEaYY+XgtvJSUhlj+SMOyoj14EfBSxVrvO5D+uqhjbzpULYASd
	 YU6oYeMowXkpsdPof+5cqLPVMTzTFuVtT0clcvPHEViwayDVQlQ8/XhADtEBnIydJo
	 CIRQ3Qy5K962A==
Date: Fri, 22 Jul 2022 12:03:06 +0100
From: Will Deacon <will@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v3 01/14] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
Message-ID: <20220722110305.GA18336@willie-the-truck>
References: <20220704150514.48816-1-elver@google.com>
 <20220704150514.48816-2-elver@google.com>
 <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com>
 <20220722091044.GC18125@willie-the-truck>
 <CACT4Y+ZOXXqxhe4U3ZtQPCj2yrf6Qtjg1q0Kfq8+poAOxGgUew@mail.gmail.com>
 <20220722101053.GA18284@willie-the-truck>
 <CACT4Y+Z0imEHF0jM-f-uYdpfSpfzMpa+bFZfPeQW1ECBDjD9fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+Z0imEHF0jM-f-uYdpfSpfzMpa+bFZfPeQW1ECBDjD9fA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 22, 2022 at 12:31:45PM +0200, Dmitry Vyukov wrote:
> On Fri, 22 Jul 2022 at 12:11, Will Deacon <will@kernel.org> wrote:
> > > > > On Mon, Jul 04, 2022 at 05:05:01PM +0200, Marco Elver wrote:
> > > > > I'm not immediately sure what would be necessary to support per-task kernel
> > > > > breakpoints, but given a lot of that state is currently per-cpu, I imagine it's
> > > > > invasive.
> > > >
> > > > I would actually like to remove HW_BREAKPOINT completely for arm64 as it
> > > > doesn't really work and causes problems for other interfaces such as ptrace
> > > > and kgdb.
> > >
> > > Will it be a localized removal of code that will be easy to revert in
> > > future? Or will it touch lots of code here and there?
> > > Let's say we come up with a very important use case for HW_BREAKPOINT
> > > and will need to make it work on arm64 as well in future.
> >
> > My (rough) plan is to implement a lower-level abstraction for handling the
> > underlying hardware resources, so we can layer consumers on top of that
> > instead of funneling through hw_breakpoint. So if we figure out how to make
> > bits of hw_breakpoint work on arm64, then it should just go on top.
> >
> > The main pain point for hw_breakpoint is kernel-side {break,watch}points
> > and I think there are open design questions about how they should work
> > on arm64, particularly when considering the interaction with user
> > watchpoints triggering on uaccess routines and the possibility of hitting
> > a kernel watchpoint in irq context.
> 
> I see. Our main interest would be break/watchpoints on user addresses
> firing from both user-space and kernel (uaccess), so at least on irqs.

Interesting. Do other architectures report watchpoint hits on user
addresses from kernel uaccess? It feels like this might be surprising to
some users, and it opens up questions about accesses using different virtual
aliases (e.g. via GUP) or from other entities as well (e.g. firmware,
KVM guests, DMA).

Will
