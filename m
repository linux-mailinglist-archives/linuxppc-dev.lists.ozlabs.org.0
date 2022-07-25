Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71F57FE01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 13:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrxvH1Mxjz3bnT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 21:02:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=E3q3Uy+K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=E3q3Uy+K;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrxtg2dvbz3bcZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 21:01:30 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id c131so19348618ybf.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hnm/5jPi/oqeCaQaqiY7o9Mgs5EnAdp5rIAWl4CX1kc=;
        b=E3q3Uy+KE30s3i9aCOl8AotGVDDShiXI7tWYkdizXOWArvf4tCCKrrqgQQ+YkeOGMm
         JDZXyDdGc/Uy1nkQfdfP8PF5dqX8nk6czkkh8l5sGQ583o9cap9IXxSoNArL0baijSwt
         zxeqokI9/BAh+Kpu6s6ZhCETT0Cktr5+QqYK8cEs+7TfRw5jw7YZ7zwqspzZo5C9BLvR
         5uISoADuepWhs+rjDzP1giy3xy79mqbzcC3qlpiBZ/VLbqFYtOecxkQkVGrV6aGMsObC
         ELKTuHvvUvXvFC6VwmucZ+kr2LAnyx0MLuRN/eCgrT7ajUJwPwKB1iGwhNyH/jqqBifR
         kIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hnm/5jPi/oqeCaQaqiY7o9Mgs5EnAdp5rIAWl4CX1kc=;
        b=1fIfsAzOzz2UBYw/x4xN1JlaokEO+RKX7ne+GW9yyKRwMm6zcAiJmiIUYZeMmkras3
         29XejYEW4SENgAxZUdqpt2HX1wOSdIhNfdvV5RGw4EY43FRZLbmMmkR1UIXhVVbP/Yg9
         SsD67eEDpHTt+iVdo/tbciBtR4zvtFVEvvzHFUxRvGKbZmVy9QltgEU1Ol8sIfqbulZP
         EMph+uKzCVM1k+9D0ulU1tY2CUkRH50c+fOptO9RuhNSIUj5vEI0BTySnszjkiUESZ8q
         0ZmpOS1OKoHGeP/B5Av9oNGTkz0TQmIactiozLRXyqtZbd38OJxIDlI9Vnk3heVcsCEY
         H5bw==
X-Gm-Message-State: AJIora8ql3ZfNoYfo9Nnf15fzTpz/BNvvbGoIfqeOaB5HNl8dNKrmvgN
	BiLg7zb29VnaI7Eb953lcTlDXvZhYLbHFzOaeu2JDg==
X-Google-Smtp-Source: AGRyM1s4PTcghivRcD1z3aK99V0VtYiFFUccAGTBIJw4jlLGmDG/y/3ylLenSc8tzgZ6jqSK70Df541MERbbmnr4XaI=
X-Received: by 2002:a25:c602:0:b0:670:90ba:98fb with SMTP id
 k2-20020a25c602000000b0067090ba98fbmr8445943ybf.143.1658746885541; Mon, 25
 Jul 2022 04:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-2-elver@google.com>
 <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com>
From: Marco Elver <elver@google.com>
Date: Mon, 25 Jul 2022 13:00:48 +0200
Message-ID: <CANpmjNMk+p1bAEKe6Em6n0_6_1O2Aco7g9v1hcVj54hKdGJ4ug@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: Will Deacon <will@kernel.org>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Jul 2022 at 18:22, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Marco,
>
> [adding Will]
>
> On Mon, Jul 04, 2022 at 05:05:01PM +0200, Marco Elver wrote:
> > Add KUnit test for hw_breakpoint constraints accounting, with various
> > interesting mixes of breakpoint targets (some care was taken to catch
> > interesting corner cases via bug-injection).
> >
> > The test cannot be built as a module because it requires access to
> > hw_breakpoint_slots(), which is not inlinable or exported on all
> > architectures.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> As mentioned on IRC, I'm seeing these tests fail on arm64 when applied atop
> v5.19-rc7:
>
> | TAP version 14
> | 1..1
> |     # Subtest: hw_breakpoint
> |     1..9
> |     ok 1 - test_one_cpu
> |     ok 2 - test_many_cpus
> |     # test_one_task_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 3 - test_one_task_on_all_cpus
> |     # test_two_tasks_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 4 - test_two_tasks_on_all_cpus
> |     # test_one_task_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 5 - test_one_task_on_one_cpu
> |     # test_one_task_mixed: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 6 - test_one_task_mixed
> |     # test_two_tasks_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 7 - test_two_tasks_on_one_cpu
> |     # test_two_tasks_on_one_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 8 - test_two_tasks_on_one_all_cpus
> |     # test_task_on_all_and_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
> |     Expected IS_ERR(bp) to be false, but is true
> |     not ok 9 - test_task_on_all_and_one_cpu
> | # hw_breakpoint: pass:2 fail:7 skip:0 total:9
> | # Totals: pass:2 fail:7 skip:0 total:9
>
> ... which seems to be becasue arm64 currently forbids per-task
> breakpoints/watchpoints in hw_breakpoint_arch_parse(), where we have:
>
>         /*
>          * Disallow per-task kernel breakpoints since these would
>          * complicate the stepping code.
>          */
>         if (hw->ctrl.privilege == AARCH64_BREAKPOINT_EL1 && bp->hw.target)
>                 return -EINVAL;
>
> ... which has been the case since day one in commit:
>
>   478fcb2cdb2351dc ("arm64: Debugging support")
>
> I'm not immediately sure what would be necessary to support per-task kernel
> breakpoints, but given a lot of that state is currently per-cpu, I imagine it's
> invasive.

Thanks for investigating - so the test is working as intended. ;-)

However it's a shame that arm64's support is limited. And what Will
said about possible removal/rework of arm64 hw_breakpoint support
doesn't sound too reassuring.

We will definitely want to revisit arm64's hw_breakpoint support in future.

Thanks,
-- Marco
