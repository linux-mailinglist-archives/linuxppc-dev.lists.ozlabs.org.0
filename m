Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389555E5DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 18:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXTqY1BtSz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 02:01:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dD7Wqxrx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dD7Wqxrx;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXTpy5X1Rz2ypf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 02:01:14 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id i15so23060595ybp.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JSgkWuUAADlOM6Jw2JGSpNYb73+UZZR8Ny928REi7Do=;
        b=dD7WqxrxIulFXhD/bExMZnWi60wwO8Kj+M+kIed6KYNLHB0WWLvTKi3YQglVoCYW4P
         +nCIP4SR+cwnQqQfuATDns64AdE53d0F59geSv0p/m5YXnhqp4LycwIMn8fTF4Q77Gv9
         JOpUOTuY3a9w8gtDFPgVQ2AYVTdCpBjjnDrH38boB6yaYsKF0FG2/J9PB7qqpl9vKHJa
         5PbEManR+KQaodnyqs64a5Pz/K9SPx1dRdNN2bbRiZzRZ65LxBDyShencH0aKN3YaGNN
         DodJhWIcA2oLlhzqE0ACp0cNtsDgcWQAS9pfcEWt337XNT7UXLPRvQp9CgVf6ZrMiAkK
         tJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JSgkWuUAADlOM6Jw2JGSpNYb73+UZZR8Ny928REi7Do=;
        b=6RHMEBN8BXHi91ThOOondSIR9weItagGR/+OkK/2Fco8UltTPXM/EWFDJLRgIs0u5p
         lTqis2+8I/kx11LqRE9hOct2i0pk5YHk6Vvf7DOg/JXIHvrl6Nb3rwi8Mk2Vtf9A+K+3
         NrYvwCYHgPH8VgD+2Oun81gYLS3t3w3tYYcPzZWFJsaoJX6MbXOElkyDYV5ge6SIlZqE
         K729TVvCJGaTLN+F+5FoMiZrtuQQ7CsF+1JyzM/zpcNqwymCF29J90BIyjWNTFqNY92c
         6nzSnp2qs0krQvkdnfYLlSnZUnZ2Q/5a9ABmVGqrF/tieX9E41Q0wSdVNVtqJryPJ1dm
         T+Xg==
X-Gm-Message-State: AJIora+amfeYXLZyyxp9r+kjRX3nLtqFZC0hm7pg5Kq4FC4fTl7bqMv4
	paEabSywORID4uKZNSTCvgx5+CtBO/lVbXqaIEBUVA==
X-Google-Smtp-Source: AGRyM1sZ36lYEgCFXIjvvLhfzCJJ1REYB15gJrq5Pp+y7LUoSX97r40Vy8EqU/H/mu0brC3/C7znR71H1FQdTL/t3qo=
X-Received: by 2002:a25:cc56:0:b0:66c:d0f6:2f0e with SMTP id
 l83-20020a25cc56000000b0066cd0f62f0emr12156904ybf.168.1656432071758; Tue, 28
 Jun 2022 09:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-14-elver@google.com>
 <CACT4Y+aJZzkYHc+YJRApOLG-NYe8zXMaqxpQgQQFAy5WY97Ttg@mail.gmail.com>
In-Reply-To: <CACT4Y+aJZzkYHc+YJRApOLG-NYe8zXMaqxpQgQQFAy5WY97Ttg@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 18:00:34 +0200
Message-ID: <CANpmjNOh9gzzC7sOOOk1q7Ssj2dFxczj1bmufarYS2KupZQthg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] perf/hw_breakpoint: Optimize toggle_bp_slot()
 for CPU-independent task targets
To: Dmitry Vyukov <dvyukov@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 17:45, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
> >
> > We can still see that a majority of the time is spent hashing task pointers:
> >
> >     ...
> >     16.98%  [kernel]       [k] rhashtable_jhash2
> >     ...
> >
> > Doing the bookkeeping in toggle_bp_slots() is currently O(#cpus),
> > calling task_bp_pinned() for each CPU, even if task_bp_pinned() is
> > CPU-independent. The reason for this is to update the per-CPU
> > 'tsk_pinned' histogram.
> >
> > To optimize the CPU-independent case to O(1), keep a separate
> > CPU-independent 'tsk_pinned_all' histogram.
> >
> > The major source of complexity are transitions between "all
> > CPU-independent task breakpoints" and "mixed CPU-independent and
> > CPU-dependent task breakpoints". The code comments list all cases that
> > require handling.
> >
> > After this optimization:
> >
> >  | $> perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512
> >  |      Total time: 1.758 [sec]
> >  |
> >  |       34.336621 usecs/op
> >  |     4395.087500 usecs/op/cpu
> >
> >     38.08%  [kernel]       [k] queued_spin_lock_slowpath
> >     10.81%  [kernel]       [k] smp_cfm_core_cond
> >      3.01%  [kernel]       [k] update_sg_lb_stats
> >      2.58%  [kernel]       [k] osq_lock
> >      2.57%  [kernel]       [k] llist_reverse_order
> >      1.45%  [kernel]       [k] find_next_bit
> >      1.21%  [kernel]       [k] flush_tlb_func_common
> >      1.01%  [kernel]       [k] arch_install_hw_breakpoint
> >
> > Showing that the time spent hashing keys has become insignificant.
> >
> > With the given benchmark parameters, that's an improvement of 12%
> > compared with the old O(#cpus) version.
> >
> > And finally, using the less aggressive parameters from the preceding
> > changes, we now observe:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  |      Total time: 0.067 [sec]
> >  |
> >  |       35.292187 usecs/op
> >  |     2258.700000 usecs/op/cpu
> >
> > Which is an improvement of 12% compared to without the histogram
> > optimizations (baseline is 40 usecs/op). This is now on par with the
> > theoretical ideal (constraints disabled), and only 12% slower than no
> > breakpoints at all.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> I don't see any bugs. But the code is quite complex. Does it make
> sense to add some asserts to the histogram type? E.g. counters don't
> underflow, weight is not negative (e.g. accidentally added -1 returned
> from task_bp_pinned()). Not sure if it will be enough to catch all
> types of bugs, though.
> Could kunit tests check that histograms are all 0's at the end?
>
> I am not just about the current code (which may be correct), but also
> future modifications to this code.

I'll think of some more options.

bp_slots_histogram_max*() already has asserts (WARN about underflow;
some with KCSAN help).

The main thing I did to raise my own confidence in the code is inject
bugs and see if the KUnit test catches it. If it didn't I extended the
tests. I'll do that some more maybe.
