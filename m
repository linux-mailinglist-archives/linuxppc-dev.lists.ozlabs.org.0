Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B945657E274
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 15:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq9br56m1z30Qc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 23:42:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mav9qQe7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mav9qQe7;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq9bC44jnz2xjk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 23:41:58 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id p6so5485396ljc.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dx7D0BqkkDvjmBT9gC4DV9N7HZuC2AWyX/zQVsh2Lhg=;
        b=Mav9qQe7Hay6uovpG8VBsmTfL/xzD90QiB1XmORe5cOsqAXIlePMrDnpAKjk2SPHlU
         kb5Ut7GMhYSuGugphdGTCzl4QS6dVbBemaHVAe/68tr5YLIdKH+1dl3Be+60VFt6Mw1X
         89ZZ7H+XeGTtXT+aoENzLnwYujx0UEFEHIllUI+2lj18vV6lg2lkpPDYX2L9dVq8r5Mu
         ohtc/xno0dA+uaPEz0e57vbqZPXDLbKUqdzl3NXPeMXzZjWy8P656YDqqiKQAcIZgP12
         9CxD2oRBzvv/UqkEIIr6I79Mj6do1s20CN+FUt2qGuSgsOMDu5gIKWU0Uw89VqdLMCEK
         WJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dx7D0BqkkDvjmBT9gC4DV9N7HZuC2AWyX/zQVsh2Lhg=;
        b=ZU0Jd/E6hXEFCQWOvpeNxpStrQCCTxlevIbbPAXu+GMXgQN3C9jqay80UefZOR287h
         XA1tHxMuSs8VtD9OSgs2SemACLPT//3ip57SwkwWZLUq3AYSMJqRmNesg3ZTUmVhoU//
         3Rzlf1ANYQHO1J1cG1zW1w6wMg8wMViym7sHw3KduQz70LZ2QVhYBsKQwDXbh3HIFe5K
         /DLfk/hqeJ9xR3H/FVXNNxe0A6qpnpX7ibPMaitWl6jAmNM6CRWg6YdznCsbQcYCi9Xk
         UVW2QfX+KUWNTk9xZFhoQguY5J3XuPsfus0PjeKgBA6q9GylXXBP6sX3/BOhKXKT3e+V
         PA5w==
X-Gm-Message-State: AJIora+Y/3klNj9KiSNkSOIialD1pxay1NcE033QobnisBCRm+VX/+nv
	3wPNAI/8FfUMB5j4a2K1u72K0qOgorO9Q944i0ex7w==
X-Google-Smtp-Source: AGRyM1vqDflld4FdeS1YXh0RjgxlOzCf0nGqPxhUwqvkb5F6yDAk/Z183xcr0L3QZpAS70KrFAFPlj5+eHC8c+4k4GY=
X-Received: by 2002:a2e:bd0e:0:b0:25a:88b3:9af6 with SMTP id
 n14-20020a2ebd0e000000b0025a88b39af6mr24943ljq.363.1658497309800; Fri, 22 Jul
 2022 06:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-2-elver@google.com>
 <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com> <20220722091044.GC18125@willie-the-truck>
 <CACT4Y+ZOXXqxhe4U3ZtQPCj2yrf6Qtjg1q0Kfq8+poAOxGgUew@mail.gmail.com>
 <20220722101053.GA18284@willie-the-truck> <CACT4Y+Z0imEHF0jM-f-uYdpfSpfzMpa+bFZfPeQW1ECBDjD9fA@mail.gmail.com>
 <20220722110305.GA18336@willie-the-truck>
In-Reply-To: <20220722110305.GA18336@willie-the-truck>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 22 Jul 2022 15:41:38 +0200
Message-ID: <CACT4Y+aLiNNt3ESZUKHT9U8duN-TMK561nC7Htx9y3R7afCV4g@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
To: Will Deacon <will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jul 2022 at 13:03, Will Deacon <will@kernel.org> wrote:
> > > > > > On Mon, Jul 04, 2022 at 05:05:01PM +0200, Marco Elver wrote:
> > > > > > I'm not immediately sure what would be necessary to support per-task kernel
> > > > > > breakpoints, but given a lot of that state is currently per-cpu, I imagine it's
> > > > > > invasive.
> > > > >
> > > > > I would actually like to remove HW_BREAKPOINT completely for arm64 as it
> > > > > doesn't really work and causes problems for other interfaces such as ptrace
> > > > > and kgdb.
> > > >
> > > > Will it be a localized removal of code that will be easy to revert in
> > > > future? Or will it touch lots of code here and there?
> > > > Let's say we come up with a very important use case for HW_BREAKPOINT
> > > > and will need to make it work on arm64 as well in future.
> > >
> > > My (rough) plan is to implement a lower-level abstraction for handling the
> > > underlying hardware resources, so we can layer consumers on top of that
> > > instead of funneling through hw_breakpoint. So if we figure out how to make
> > > bits of hw_breakpoint work on arm64, then it should just go on top.
> > >
> > > The main pain point for hw_breakpoint is kernel-side {break,watch}points
> > > and I think there are open design questions about how they should work
> > > on arm64, particularly when considering the interaction with user
> > > watchpoints triggering on uaccess routines and the possibility of hitting
> > > a kernel watchpoint in irq context.
> >
> > I see. Our main interest would be break/watchpoints on user addresses
> > firing from both user-space and kernel (uaccess), so at least on irqs.
>
> Interesting. Do other architectures report watchpoint hits on user
> addresses from kernel uaccess? It feels like this might be surprising to
> some users, and it opens up questions about accesses using different virtual
> aliases (e.g. via GUP) or from other entities as well (e.g. firmware,
> KVM guests, DMA).

x86 supports this.
There is that attr.exclude_kernel flag that requires special permissions:
https://elixir.bootlin.com/linux/v5.19-rc7/source/kernel/events/core.c#L12061
https://elixir.bootlin.com/linux/v5.19-rc7/source/kernel/events/core.c#L9323
But if I understand correctly, it only filters out delivery, the HW
breakpoint fires even if attr.exclude_kernel is set.

We also wanted to relax this permission check somewhat:
https://lore.kernel.org/all/20220601093502.364142-1-elver@google.com/

Yes, if the kernel maps the page at a different virtual address, then
the breakpoint won't fire I think.
Don't know what are the issues with firmware/KVM.
