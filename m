Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D457DD75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 11:21:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq3pV3Nrjz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 19:21:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HZso6ITt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HZso6ITt;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq3nr0N6Kz30LR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 19:20:46 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id bp17so6754061lfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QRgm1i6pUMaVa04XshAEZM9Qyu6OwRtZCN3cy0vmh7k=;
        b=HZso6ITt75EPvPclCh4fRlgn/FKlvidTHBNAiEwaLYawZzU+8afxHQMdKVfcUcGjQ9
         wOX426kD3sMN9oM24HVzrVmR5CTSbGmZA/DTnHvdOoW3aw4iUtBoeFUYOLRnOaoVLFOC
         RUgW167EZKC21EUVC8U0CsWc60xKQomB6I+xjh8XT11UyVUScPUiXKZpn/UVb4OYbM2w
         YfNFx77GRNAf6f4xHjRiP+I2RW0n2b6oS/dQT6YlLiv7O3ILc15ITwsoTggN6QBRS9qS
         Fbroi3gbhHU7D60r4xbEw0SzsUYDtfgHuCFtU6/byYYdxkEZiaWm2AenLqkFh0omyfEY
         GPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QRgm1i6pUMaVa04XshAEZM9Qyu6OwRtZCN3cy0vmh7k=;
        b=OWuJL95mkQ8idc8O7lz4+lHBwXAxL+pSH64YTNS9A3zlMyE0oRhIYDxAdB1Tjg84lf
         8+/H+kyPpfO5+ZCO6oJT9Q1xuzmcdkvcYUGAwYe7dUlwoktnNsKEL3emfhpl1VR7OP4I
         rscgLTXD/rnF8+8QQlYz1p6swazvBQbbgMJif8XLyTRwBNFLE81yrlR55DSYM6b1u1A0
         YKEBSF8bEv0dUdl4ZDlqYtoNFdbB+TjDGNRAFELoNUCmLl/NZkAGvlQyG4hmNvBGSm9z
         D4pNxKdiv+R2LmfEoggOE3Qg5Rs/QzuzMEXMq5e5n5zwd33xXIu48d3ni3XA8zz6IeYB
         dMNA==
X-Gm-Message-State: AJIora/Z77Gm1RDlsLDF0WRTAYqRAxfs0p+xz7W2Nwm3OvzXgCsKDnhp
	w4E5BV9MLQMVGua+vWK/1gVEYTXPu9EdK2l4UiXD/Q==
X-Google-Smtp-Source: AGRyM1u5re9izJgUD0ajuSTYF8GDBxWnjDfbTJE8M2xP5mYLaJrM7U2hH+ZezpTXnb3khj0IcVijjetLnS98rcuea3w=
X-Received: by 2002:a05:6512:1085:b0:48a:710:6a7b with SMTP id
 j5-20020a056512108500b0048a07106a7bmr930020lfg.417.1658481637244; Fri, 22 Jul
 2022 02:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-2-elver@google.com>
 <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com> <20220722091044.GC18125@willie-the-truck>
In-Reply-To: <20220722091044.GC18125@willie-the-truck>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 22 Jul 2022 11:20:25 +0200
Message-ID: <CACT4Y+ZOXXqxhe4U3ZtQPCj2yrf6Qtjg1q0Kfq8+poAOxGgUew@mail.gmail.com>
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

On Fri, 22 Jul 2022 at 11:10, Will Deacon <will@kernel.org> wrote:
> > [adding Will]
> >
> > On Mon, Jul 04, 2022 at 05:05:01PM +0200, Marco Elver wrote:
> > > Add KUnit test for hw_breakpoint constraints accounting, with various
> > > interesting mixes of breakpoint targets (some care was taken to catch
> > > interesting corner cases via bug-injection).
> > >
> > > The test cannot be built as a module because it requires access to
> > > hw_breakpoint_slots(), which is not inlinable or exported on all
> > > architectures.
> > >
> > > Signed-off-by: Marco Elver <elver@google.com>
> >
> > As mentioned on IRC, I'm seeing these tests fail on arm64 when applied atop
> > v5.19-rc7:
> >
> > | TAP version 14
> > | 1..1
> > |     # Subtest: hw_breakpoint
> > |     1..9
> > |     ok 1 - test_one_cpu
> > |     ok 2 - test_many_cpus
> > |     # test_one_task_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 3 - test_one_task_on_all_cpus
> > |     # test_two_tasks_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 4 - test_two_tasks_on_all_cpus
> > |     # test_one_task_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 5 - test_one_task_on_one_cpu
> > |     # test_one_task_mixed: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 6 - test_one_task_mixed
> > |     # test_two_tasks_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 7 - test_two_tasks_on_one_cpu
> > |     # test_two_tasks_on_one_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 8 - test_two_tasks_on_one_all_cpus
> > |     # test_task_on_all_and_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> > |     Expected IS_ERR(bp) to be false, but is true
> > |     not ok 9 - test_task_on_all_and_one_cpu
> > | # hw_breakpoint: pass:2 fail:7 skip:0 total:9
> > | # Totals: pass:2 fail:7 skip:0 total:9
> >
> > ... which seems to be becasue arm64 currently forbids per-task
> > breakpoints/watchpoints in hw_breakpoint_arch_parse(), where we have:
> >
> >         /*
> >          * Disallow per-task kernel breakpoints since these would
> >          * complicate the stepping code.
> >          */
> >         if (hw->ctrl.privilege == AARCH64_BREAKPOINT_EL1 && bp->hw.target)
> >                 return -EINVAL;
> >
> > ... which has been the case since day one in commit:
> >
> >   478fcb2cdb2351dc ("arm64: Debugging support")
> >
> > I'm not immediately sure what would be necessary to support per-task kernel
> > breakpoints, but given a lot of that state is currently per-cpu, I imagine it's
> > invasive.
>
> I would actually like to remove HW_BREAKPOINT completely for arm64 as it
> doesn't really work and causes problems for other interfaces such as ptrace
> and kgdb.

Will it be a localized removal of code that will be easy to revert in
future? Or will it touch lots of code here and there?
Let's say we come up with a very important use case for HW_BREAKPOINT
and will need to make it work on arm64 as well in future.
