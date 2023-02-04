Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C383C68A7D3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:30:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7xMT55cjz3fDL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 13:30:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sys04XZk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sys04XZk;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7xLX6qWKz3f42
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 13:29:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 34A96B82C1C;
	Sat,  4 Feb 2023 02:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4882FC433D2;
	Sat,  4 Feb 2023 02:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675477775;
	bh=A31zSwlgRwgvDbdSE2DEbrUbqrKSeAqq7FjkMqnStZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sys04XZk8jqh8pRKO4mghhMIaZOJaNysJlIGALRMdUzBCxAI7G298EYXo2zlMRvSr
	 v1L58VM1ZHs7x81UItVoBpt9wcZHmGDg5tNF+6JViYATk8zllrsyuNPci/+h9ThQNC
	 KW//e75t+wHxZCqRUkgsCKq4iGfhZGkJ2TH63kQJ9oR+CjCAQa7/KkH2zX9Gq7ZUzT
	 JuXMK4xLEjNS6GRz1ijKyXH/9LrhEwsou1WQe6fwvelXFDxVFZwSA9iJKcPffsY87l
	 1jDSihH/HYx9/w9lxJwcSwTV40QPZPI04Z41AbBuYIqH66hVf0PVr4wNkI33bF0LF/
	 Ts2VwRwiP4moA==
Date: Fri, 3 Feb 2023 18:29:32 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 05/22] csky/cpu: Make sure arch_cpu_idle_dead() doesn't
 return
Message-ID: <20230204022932.k24laszjs3v4bc3v@treble>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <f860f3a1c1a53c437a99abc53e8f1a798aef6881.1675461757.git.jpoimboe@kernel.org>
 <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kernel@vger.kernel.org,
  linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 04, 2023 at 09:12:31AM +0800, Guo Ren wrote:
> On Sat, Feb 4, 2023 at 6:05 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> > BUG().
> >
> > BUG() is preferable to unreachable() because BUG() is a more explicit
> > failure mode and avoids undefined behavior like falling off the edge of
> > the function into whatever code happens to be next.
> >
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >  arch/csky/kernel/smp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
> > index b45d1073307f..0ec20efaf5fd 100644
> > --- a/arch/csky/kernel/smp.c
> > +++ b/arch/csky/kernel/smp.c
> > @@ -317,5 +317,7 @@ void arch_cpu_idle_dead(void)
> >                 "jmpi   csky_start_secondary"
> >                 :
> >                 : "r" (secondary_stack));
> > +
> > +       BUG();
> Why not:
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index f26ab2675f7d..1d3bf903add2 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -285,6 +285,7 @@ static void do_idle(void)
>                         tick_nohz_idle_stop_tick();
>                         cpuhp_report_idle_dead();
>                         arch_cpu_idle_dead();
> +                       BUG();

Without the BUG() in csky arch_cpu_idle_dead(), the compiler will warn
about arch_cpu_idle_dead() returning, because it's marked __noreturn but
doesn't clearly return (as far as the compiler knows).

And we want it marked __noreturn so we'll be more likely to catch such
bugs at build time.

And as a bonus we get better code generation and clearer code semantics
which helps both humans and tooling understand the intent of the code.

-- 
Josh
