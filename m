Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CFF57B9A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp06D2R8tz3dBN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:31:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZgSdDrcT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZgSdDrcT;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp05b3Mk0z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:30:43 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so1497796wmj.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbQQtxk91yWYRZraNSUPdpEN5EtZ/LYwfMBL5CTtBFk=;
        b=ZgSdDrcTcr6JhWUwgLeeh1yQ9u58+Ab4TLY/9NWJ14ctjS/Cf0hA1uIf+uSICo6sG+
         ja1ASwrj+j4d7rSxdTiJhAQaduieXoyDaMRRlIyE0izCCB/pe5JK0sLW441PeVUHkiss
         LqOTAbZGsNFTPI0Wr7XJRjxLZmSlinOdklUBHdsOfcdm9HZaWty1jPocbHnuUYDX6pkR
         bTyuznMgGyweD+DMnuutQjBH7vifM4LqFkYE1JochPDmhfeOW66S5FbRQRq8aGJCIUPp
         0fUPHKbaf0ArxF2itLLHnf45BDUn7TOIwaTwwAErb6AT9Cns6qZ/jQtv7C9YsUaZIcnJ
         XZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbQQtxk91yWYRZraNSUPdpEN5EtZ/LYwfMBL5CTtBFk=;
        b=wN4t4kHu9nZm1pa5bGj2WFX7qI9X4CTTNw7CcMxVgOMtLTWUQlBIFTXMydsMz+cn7o
         yW20KxnHYQgikJlCoMv2kdId9f5iqeL6ULzn6tx8ctsFHyrLoF3hLMkO6sWL1ou3hCim
         hUqSQvZNR7kDIo0HGv+bvGqGb9SzJxEYr8XiBNQqOz3nDX3t1fX90iBX8YfCKQC0QYPq
         w1TDVeO1frtRfG7e831capW4lJKJKmAeoqrrKE5YFhTuLGePGg+ibn2fpVPDJ/A6e0Uh
         EgdP9cyl0IcnV9kTXUvX9g52OCIlZwdfQVqGIO9h7Eb/VPcoN01YoCJ8P763iaqF+/LR
         uM5A==
X-Gm-Message-State: AJIora+kKf48JRUnWpO86hIu1eKTFRpzVtMAIckZ9NK/2CxG8Lb+5504
	7jy81CtkO3KPcwD2SaQC4kQ9FbHtQkH7jS/gcf0lKg==
X-Google-Smtp-Source: AGRyM1sy4lIt5WZk/5VWHmNj+E1KQce0Jhi+vNS6UD5M14DwPu5vweqB/Nip957rArEL/RP2momlLO0zY+G4KGjgDBI=
X-Received: by 2002:a05:600c:19d2:b0:3a3:2cdb:cc02 with SMTP id
 u18-20020a05600c19d200b003a32cdbcc02mr1916330wmq.182.1658331040002; Wed, 20
 Jul 2022 08:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-6-elver@google.com>
In-Reply-To: <20220704150514.48816-6-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:30:26 -0700
Message-ID: <CAP-5=fUySGaL32RQH5AuXjRCuBe8E6Nacarg8z1nkS38RkzZHg@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] perf/hw_breakpoint: Mark data __ro_after_init
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
> Mark read-only data after initialization as __ro_after_init.
>
> While we are here, turn 'constraints_initialized' into a bool.
>
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  kernel/events/hw_breakpoint.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index 6d09edc80d19..7df46b276452 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -46,7 +46,7 @@ struct bp_cpuinfo {
>  };
>
>  static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
> -static int nr_slots[TYPE_MAX];
> +static int nr_slots[TYPE_MAX] __ro_after_init;
>
>  static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
>  {
> @@ -62,7 +62,7 @@ static const struct rhashtable_params task_bps_ht_params = {
>         .automatic_shrinking = true,
>  };
>
> -static int constraints_initialized;
> +static bool constraints_initialized __ro_after_init;
>
>  /* Gather the number of total pinned and un-pinned bp in a cpuset */
>  struct bp_busy_slots {
> @@ -739,7 +739,7 @@ int __init init_hw_breakpoint(void)
>         if (ret)
>                 goto err;
>
> -       constraints_initialized = 1;
> +       constraints_initialized = true;
>
>         perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
