Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64155D6FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 15:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXQBC58vPz3cNM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AT2t+rTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AT2t+rTr;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXQ9Z2Tztz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:17:05 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id x3so22273016lfd.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 06:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X57uwopXnuwAGxBJfo3nXt3MJLIDmWTaNVtJmoGBIrs=;
        b=AT2t+rTr3KgCX8AA8eDt3WrbxtMhylo4g1A8Gxq1VecJhw5AD9vpsoz/2xq2XcDZUW
         tptAB4ig8ybMBqdwhS7/u5onHQdA/cUFgW1Ek02/2U2+Gtw3+8M6eRTac5lfoAAsHvgz
         sF7cUuFbFVDR3quRsL6I5+94M/OE/UypLaxuAlAgRuKl+84iwY2kdjwtNwj/SnloBiO8
         kk/odc9q3zUdO+qVSQVt5Aex46qwxbLOO+ypHzWbk1RNAm1y5U8i4UZ6aSNKoLhC42Tu
         3hKZMpRbPk9Y7KC45eeLp7Q6lCepZHZhMUNxP/XCOKqwWXygnxUMKaLuCS5aiD3/K6PE
         Yaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X57uwopXnuwAGxBJfo3nXt3MJLIDmWTaNVtJmoGBIrs=;
        b=rA4Gu+W2oNV5VVPyXNyXq8/ZoJpxnjdTKifirrc2iclgg4HOR55zvHc7i1SKfSgAbb
         vPr0DSYwKU+zIBbZnaiEvpliDNK0rLilsXRvofEGAUlzpoGEPClVILUycE80pZgLeH3a
         d3e5LZVMpUVItUWC6mEDl5EDceViWxCy26ALkDvFtyYsHJ2AMIFp9IKAaIcssg3KPagL
         8ZLiOKHnKrLWz514q1t6anOjfApDIhHjYC1tLGT19Gah9kmZhOjRnKLMy4CxjL5gzBEv
         RTDwIKWoaXrt+gG8GxbxpnbbV3ivNfT4rCka7oWPbW6KaNGtWyldg9U6AptcjANSrdBh
         5ejQ==
X-Gm-Message-State: AJIora9DQ0LN8Ix7tlwcEX2ME7jgwNjaABwofdH0TBv6p8j6M6H6NbGh
	8K+dqq3asbI8SvgQMkg+8xj1coF/oxm5wNBwwIUz9A==
X-Google-Smtp-Source: AGRyM1tG67YPf8p5Qp1qLNRMlMNTKwh2CzvgbvnW3zyfeM/E1CTmSMCbEimuXozCm7RVAzd+EXswJxcxpkMBCM0PW6s=
X-Received: by 2002:a05:6512:39ce:b0:481:31e4:1e06 with SMTP id
 k14-20020a05651239ce00b0048131e41e06mr1777836lfu.376.1656422220502; Tue, 28
 Jun 2022 06:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-7-elver@google.com>
In-Reply-To: <20220628095833.2579903-7-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 28 Jun 2022 15:16:49 +0200
Message-ID: <CACT4Y+bkQNci3gOyvBAkcfJjqE9h2kPJ2nKjrD7XjQ+sg1L4kg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
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

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  include/linux/hw_breakpoint.h | 1 -
>  kernel/events/hw_breakpoint.c | 4 +++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
> index 78dd7035d1e5..9fa3547acd87 100644
> --- a/include/linux/hw_breakpoint.h
> +++ b/include/linux/hw_breakpoint.h
> @@ -79,7 +79,6 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
>  extern int dbg_release_bp_slot(struct perf_event *bp);
>  extern int reserve_bp_slot(struct perf_event *bp);
>  extern void release_bp_slot(struct perf_event *bp);
> -int hw_breakpoint_weight(struct perf_event *bp);
>  int arch_reserve_bp_slot(struct perf_event *bp);
>  void arch_release_bp_slot(struct perf_event *bp);
>  void arch_unregister_hw_breakpoint(struct perf_event *bp);
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index a089302ddf59..a124786e3ade 100644
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
