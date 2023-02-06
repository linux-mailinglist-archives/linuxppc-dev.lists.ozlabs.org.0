Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44F68B467
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 04:13:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9BCd6N3Nz3cf3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 14:13:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBHWxbUE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBHWxbUE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9BBf4cR5z30RT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 14:12:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D45F560C07
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 03:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E4CC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 03:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675653127;
	bh=SEHqDj0pecZaoDvI2TxfvISMCoNXpVJslROmtkQHTl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aBHWxbUE1qscXgToVSLDbDbOTBJx5ol3QAloFKF6quHuxSLDc6bLN0hEb6oLgxGmy
	 MnLxdeRrgyeBdJ9pGDDQDN8qL5E9eF3ZREg1BlrIswbxzqSGfwNgKGkpU7eR7l/H+i
	 Vbq9BwU/inl0wIHB7aGtD4Z3NEhanBgFaoByYV66gksXGt6rGyMFlx2u7/LVAOMEK5
	 3UQMP1Lhs7EYtOpLuMlrIWY7J57uJMJDeSdRPH5Gq31PiUX/XFKpgBmcKERl5TtGxs
	 zZmDid7aciqyecTQEc01AFRGPklMTl/8Ni72awcEbNNyPoB7lSyFUULT/gnF3yjq+a
	 QYealvajIFRZg==
Received: by mail-ej1-f51.google.com with SMTP id lu11so30517646ejb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Feb 2023 19:12:07 -0800 (PST)
X-Gm-Message-State: AO0yUKUCPOcTczCnqrjP9PhvnY6OoyD8/01AegvKp0RAPBZgZuHc+CXt
	if8peIlrX8WotN+VnjPSc2fW7ZjZUDDIsEUmI8A=
X-Google-Smtp-Source: AK7set+C2OPIEjxuD4imJwgo/SdFRSDGqxy+aWdQoxwR9LsZ/L0xaRFmrPMBBJUVbKfwf6WwaCs9pUvWr8CjvlkkXS4=
X-Received: by 2002:a17:906:8419:b0:884:c19c:7c6 with SMTP id
 n25-20020a170906841900b00884c19c07c6mr4724728ejx.120.1675653125517; Sun, 05
 Feb 2023 19:12:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675461757.git.jpoimboe@kernel.org> <f860f3a1c1a53c437a99abc53e8f1a798aef6881.1675461757.git.jpoimboe@kernel.org>
 <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com> <20230204022932.k24laszjs3v4bc3v@treble>
In-Reply-To: <20230204022932.k24laszjs3v4bc3v@treble>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Feb 2023 11:11:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSrGNm3xkwzws4uh1bv__1XYFCh322MJtk2ObQmv1_nEA@mail.gmail.com>
Message-ID: <CAJF2gTSrGNm3xkwzws4uh1bv__1XYFCh322MJtk2ObQmv1_nEA@mail.gmail.com>
Subject: Re: [PATCH 05/22] csky/cpu: Make sure arch_cpu_idle_dead() doesn't return
To: Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Feb 4, 2023 at 10:29 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Sat, Feb 04, 2023 at 09:12:31AM +0800, Guo Ren wrote:
> > On Sat, Feb 4, 2023 at 6:05 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > >
> > > arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> > > BUG().
> > >
> > > BUG() is preferable to unreachable() because BUG() is a more explicit
> > > failure mode and avoids undefined behavior like falling off the edge of
> > > the function into whatever code happens to be next.
> > >
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > > ---
> > >  arch/csky/kernel/smp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
> > > index b45d1073307f..0ec20efaf5fd 100644
> > > --- a/arch/csky/kernel/smp.c
> > > +++ b/arch/csky/kernel/smp.c
> > > @@ -317,5 +317,7 @@ void arch_cpu_idle_dead(void)
> > >                 "jmpi   csky_start_secondary"
> > >                 :
> > >                 : "r" (secondary_stack));
> > > +
> > > +       BUG();
> > Why not:
> > diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> > index f26ab2675f7d..1d3bf903add2 100644
> > --- a/kernel/sched/idle.c
> > +++ b/kernel/sched/idle.c
> > @@ -285,6 +285,7 @@ static void do_idle(void)
> >                         tick_nohz_idle_stop_tick();
> >                         cpuhp_report_idle_dead();
> >                         arch_cpu_idle_dead();
> > +                       BUG();
>
> Without the BUG() in csky arch_cpu_idle_dead(), the compiler will warn
> about arch_cpu_idle_dead() returning, because it's marked __noreturn but
> doesn't clearly return (as far as the compiler knows).
>
> And we want it marked __noreturn so we'll be more likely to catch such
> bugs at build time.
>
> And as a bonus we get better code generation and clearer code semantics
> which helps both humans and tooling understand the intent of the code.
Thx for the clarification.

Acked-by: Guo Ren <guoren@kernel.org>

>
> --
> Josh



-- 
Best Regards
 Guo Ren
