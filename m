Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32AF571B84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 15:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj22x5L3vz3cF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 23:41:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LSt+DLU3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LSt+DLU3;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj22H44z5z2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 23:40:38 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2ef5380669cso81096357b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALyPmALyKUZN850RRfbsMebRjTXHId7O0aEtI7++nZc=;
        b=LSt+DLU33Q6liALS8BuSSMkfOKSlRWDFuTo7po1O26Fv7bk7ore1ydtL7Hkh54hx5B
         9uSRjCaDwCvwdfWSzS7lnufwTmWr2b2BeYWR5YFP9ZU8F9VUUXmk6Zu5giNcEj2YbgpC
         uI4p1/JHiKYlEhx0fK1shW+TiQcG27FxZBVsXr+bZEYrVso0bpBwSBWJ2SnXgjmK3o2a
         TljCQ3HgMAtH+5k9+nmdR7HTEIpmR3g8H3YU3v/0m4e+3pVXNggO7+TOdghExzxY46ET
         DIp6u0LHdi2CFsZzjm9ZOB6D+HRRffEUqutrzlU2tzRGZr0L4jryw4F7HNyo/VTj61UD
         CAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALyPmALyKUZN850RRfbsMebRjTXHId7O0aEtI7++nZc=;
        b=fPtGYsLnl9P17Lw+RudtbS8AUlFsbPmyAfgc+459i4NYkW1ZOHfM5J0+b+QGWMRl6m
         lALnDRBO1uDeCagIopLMc3OXaav5SdNyxVa+FhBktjLqF7NW+ffSZ/oiSv7z60B70obf
         8ojxq/2wuq4I98kgxFGKz4nyQajrDpqUbSVNqR7xc4Udr1UF4sNuoyesEfg0vfpV8ybD
         1aegw6GC57ZlLs5vAL4IG7h67VyQM5i+Ds+B1/ap9+iz6kEXgWsHat3GFQLj3slVUUVw
         1br4sEtCkgVfZZdMIzHSCr7/BkYW06J6iZfJ8zpstZZCu6QInW4TkbtFbEu39RkoVLuJ
         I1lw==
X-Gm-Message-State: AJIora9xb8bcbfwMf4uKL4JMeUxzS+0Hy9wHsKaxctvEjCK4Iij7UHXL
	4KU9RfGE/4u3UXzIvp/HBqdEWse38qBlIPplNm111Q==
X-Google-Smtp-Source: AGRyM1vOJbA/kJ593A3ED5ZJMoh4prb03n/Kz2Y5PlZioljval/AgDFA11ABBXVIE5GqjlsCSBB2nghmV/bKBZoaO6Q=
X-Received: by 2002:a81:98d:0:b0:31c:921c:9783 with SMTP id
 135-20020a81098d000000b0031c921c9783mr25237173ywj.316.1657633233606; Tue, 12
 Jul 2022 06:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
In-Reply-To: <20220704150514.48816-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 12 Jul 2022 15:39:57 +0200
Message-ID: <CANpmjNP0hPuhXmZmkX1ytCDh56LOAmxJjf7RyfxOvoaem=2d8Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] perf/hw_breakpoint: Optimize for thousands of tasks
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 4 Jul 2022 at 17:05, Marco Elver <elver@google.com> wrote:
>
> The hw_breakpoint subsystem's code has seen little change in over 10
> years. In that time, systems with >100s of CPUs have become common,
> along with improvements to the perf subsystem: using breakpoints on
> thousands of concurrent tasks should be a supported usecase.
[...]
> Marco Elver (14):
>   perf/hw_breakpoint: Add KUnit test for constraints accounting
>   perf/hw_breakpoint: Provide hw_breakpoint_is_used() and use in test
>   perf/hw_breakpoint: Clean up headers
>   perf/hw_breakpoint: Optimize list of per-task breakpoints
>   perf/hw_breakpoint: Mark data __ro_after_init
>   perf/hw_breakpoint: Optimize constant number of breakpoint slots
>   perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
>   perf/hw_breakpoint: Remove useless code related to flexible
>     breakpoints
>   powerpc/hw_breakpoint: Avoid relying on caller synchronization
>   locking/percpu-rwsem: Add percpu_is_write_locked() and
>     percpu_is_read_locked()
>   perf/hw_breakpoint: Reduce contention with large number of tasks
>   perf/hw_breakpoint: Introduce bp_slots_histogram
>   perf/hw_breakpoint: Optimize max_bp_pinned_slots() for CPU-independent
>     task targets
>   perf/hw_breakpoint: Optimize toggle_bp_slot() for CPU-independent task
>     targets
[...]

This is ready from our side, and given the silence, assume it's ready
to pick up and/or have a maintainer take a look. Since this is mostly
kernel/events, would -tip/perf/core be appropriate?

Thanks,
-- Marco
