Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4057B9E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:33:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp08n3xc3z3dq5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:33:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rtE6DDog;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rtE6DDog;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp08C753vz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:32:59 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id c22so2912136wmr.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXRVB9OIIhdX/URjZNl0v6pVC+o3sTM2QCDmzX1vQJc=;
        b=rtE6DDogJhUh+ZtpN70YLu2ZmXY6CdKqcLHxcq0UtGow0+ie8eT3w/DFXyTOdGk2qn
         9qXeHyATZP9kX/Z6EhXLAEUHnWAYA+EyhDv3lnKJZM12itGYkI5F7A/gGzqqwOL5Zbzc
         fEvl5gpqnwtXWQc1hdvpSjF4JR7aLXOGSfzOGl0nS1bcGnfeYQoFtvJij5eTNji5VBEr
         J0/m6f2HyiaMiPNxbylBgOVgiii6EqD369gArU7xbJglNvg86B3i9b+Z4GrM1mKVvtOm
         P9SinFz14vcVy8P0eoINmmFeh8MAMRMU5MeNvwIOpvYaanl3HotPG62I8xu3ViSvW2zT
         +6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXRVB9OIIhdX/URjZNl0v6pVC+o3sTM2QCDmzX1vQJc=;
        b=lLCSKHxzz/VcOm0zrij0U5KevZSLl+Kw/dFk45R6G0vzcrRHc0t7q+3zTtl6GNt2SJ
         0LZ+DJtwniHg4tNPAkPchez73n1OAh/ICsOq7yCdZ0ysfcN+NDRzyGRvEvMxL6qNxs/J
         NHM8m4rT2RpUu8A36Z+PGMPxqeHR0c8LJoxnC90Wt7wCFLZsCX6cWe4M2NINKfyAiX7A
         nIMDGe4lHOw2ltUxkCI0nJaFOmVGU/oodqCnLwHtHvQlX+f32nQeaB4FettPlIawrFH7
         MF2GR39MJwppzqjyq/NhX40Prhqo2sSzESgr0j1ZuNIuxEbwmDa9pa0Lg//X+wcv7PRB
         Qt/A==
X-Gm-Message-State: AJIora/PYOfEgRnvN3pi8Hl8asNInpoDpGNU6VmUVB+HcFE3gC1DKx1K
	TBr3r4JRk5Im5swRJ8V/ZV4wMU8M3qB+2l8BgggIiw==
X-Google-Smtp-Source: AGRyM1uKEr8mdMUyiaQkbnJMsIqtKZlyztLCldKuCxnZuhty8HbuiUhiD4EwDJT4EsNMfKUDzW3f/+pF3GTbtebQt3Y=
X-Received: by 2002:a7b:ce13:0:b0:3a3:102c:23d3 with SMTP id
 m19-20020a7bce13000000b003a3102c23d3mr4328674wmc.67.1658331176588; Wed, 20
 Jul 2022 08:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-8-elver@google.com>
In-Reply-To: <20220704150514.48816-8-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:32:44 -0700
Message-ID: <CAP-5=fWTZ7f4TvJX_S4vZ3os2DBZGWE4qkyu9ro8ufs10A01Ow@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
To: Marco Elver <elver@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 4, 2022 at 8:06 AM Marco Elver <elver@google.com> wrote:
>
> Due to being a __weak function, hw_breakpoint_weight() will cause the
> compiler to always emit a call to it. This generates unnecessarily bad
> code (register spills etc.) for no good reason; in fact it appears in
> profiles of `perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512`:
>
>     ...
>     0.70%  [kernel]       [k] hw_breakpoint_weight
>     ...
>
> While a small percentage, no architecture defines its own
> hw_breakpoint_weight() nor are there users outside hw_breakpoint.c,
> which makes the fact it is currently __weak a poor choice.
>
> Change hw_breakpoint_weight()'s definition to follow a similar protocol
> to hw_breakpoint_slots(), such that if <asm/hw_breakpoint.h> defines
> hw_breakpoint_weight(), we'll use it instead.
>
> The result is that it is inlined and no longer shows up in profiles.
>
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  include/linux/hw_breakpoint.h | 1 -
>  kernel/events/hw_breakpoint.c | 4 +++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
> index a3fb846705eb..f319bd26b030 100644
> --- a/include/linux/hw_breakpoint.h
> +++ b/include/linux/hw_breakpoint.h
> @@ -80,7 +80,6 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
>  extern int dbg_release_bp_slot(struct perf_event *bp);
>  extern int reserve_bp_slot(struct perf_event *bp);
>  extern void release_bp_slot(struct perf_event *bp);
> -int hw_breakpoint_weight(struct perf_event *bp);
>  int arch_reserve_bp_slot(struct perf_event *bp);
>  void arch_release_bp_slot(struct perf_event *bp);
>  void arch_unregister_hw_breakpoint(struct perf_event *bp);
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index 9fb66d358d81..9c9bf17666a5 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -124,10 +124,12 @@ static __init int init_breakpoint_slots(void)
>  }
>  #endif
>
> -__weak int hw_breakpoint_weight(struct perf_event *bp)
> +#ifndef hw_breakpoint_weight
> +static inline int hw_breakpoint_weight(struct perf_event *bp)
>  {
>         return 1;
>  }
> +#endif
>
>  static inline enum bp_type_idx find_slot_idx(u64 bp_type)
>  {
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
