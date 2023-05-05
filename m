Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2B6F7B3F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:54:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFd50jm5z3cNJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 12:54:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jxvLXO0y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jxvLXO0y;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFcF6Pjhz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 12:53:17 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-51452556acdso783143a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 19:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683255195; x=1685847195;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvuQIwE86qT9nMkGXeQaDip5ug2GQu1BAKE7bYWgdwk=;
        b=jxvLXO0ysCTk5XQj17Rp4MPTljRhsg/NAlWqiFmGR2fpw55Cfg5sVLQNF9ke8zqu/N
         HHnWR+znibrRLrH9vcnvMDlm348iuI+SsyPL+KjDHd8kJ+kLygMtANYkoqlJA6z6lSGj
         QZNZWJy5SjgWh7ZGzeckqYUPsJuTsWIU94R5NJGqG7ornKXAjfQhUxU9ZW6eHYyHSwC8
         XuNhhR9rjzN6nhEHsIDIEBvw8EKr9RR4JqVK8n0VmA4Fy2LIawRCSoZ2wFbIEnMX0Hu7
         jCpsjNuzdvbOAUR1puJswLMYD3EbpysfH1e5Yu7q8B6TUU8LxJDGkmTXqTGuht3T2lUp
         xFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255195; x=1685847195;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TvuQIwE86qT9nMkGXeQaDip5ug2GQu1BAKE7bYWgdwk=;
        b=S9QE5ub9IwNoWBdvrKbROI9l/SLA9oFUT7fiG1MEwf3SBuYwcdyyyZNSRv+xAiagLB
         Na6wHIQR+kyXBirYF+/jb7amMc8Q9OP+iYICpYV5fc4IooBUxdHvNfjRwHWL4X26WS3V
         Z9tIDT4Hp89f5CawyzvP4snn6AgeQEl+IHF4qrnUcFy67M4nbUs7oNcpALt7ehe03edp
         lU9JjMZoHBx1uh50hWKK6NWqDdH/9PKctm7E2ZlNm04hshso0uf1Bd1plq6S/DGLNJZD
         QgQHBimFr3YcPT2Q1y9HRWCtGlbfzdlpbPlYa9E1A5ivzW7eM3H6kMg38CkpYQa47ADH
         YHZQ==
X-Gm-Message-State: AC+VfDwRsbenQvdSBncLwW+RDzvmk/9wNQLgK8nJJQ1h5wECmVtyTeSy
	fzcNbsdgJY46L35BgBZ3xjU=
X-Google-Smtp-Source: ACHHUZ5a9oH4I1uJO71H1fLGgVbhwllNxoxjP5ILVe8scfc+huKbvNVr33otWqWTE3YRZg/we43I2g==
X-Received: by 2002:a17:903:2285:b0:1aa:f536:b1e2 with SMTP id b5-20020a170903228500b001aaf536b1e2mr6428524plh.62.1683255194928;
        Thu, 04 May 2023 19:53:14 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b00186a2274382sm356805plh.76.2023.05.04.19.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 19:53:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 12:53:01 +1000
Message-Id: <CSE05UZ1HC0R.2L6QW2OI7GIMA@wheely>
Subject: Re: [PATCH v4 06/17] watchdog/perf: Rename watchdog_hld.c to
 watchdog_perf.c
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
In-Reply-To: <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> The code currently in "watchdog_hld.c" is for detecting hardlockups
> using perf, as evidenced by the line in the Makefile that only
> compiles this file if CONFIG_HARDLOCKUP_DETECTOR_PERF is
> defined. Rename the file to prepare for the buddy hardlockup detector,
> which doesn't use perf.
>
> It could be argued that the new name makes it less obvious that this
> is a hardlockup detector. While true, it's not hard to remember that
> the "perf" detector is always a hardlockup detector and it's nice not
> to have names that are too convoluted.

Better than the confusion that the perf version is *the* hardlockup
detector IMO.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Rename watchdog_hld.c to watchdog_perf.c") new for v4.
>
>  kernel/Makefile                            | 2 +-
>  kernel/{watchdog_hld.c =3D> watchdog_perf.c} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename kernel/{watchdog_hld.c =3D> watchdog_perf.c} (99%)
>
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 10ef068f598d..406ccccc4dd3 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -91,7 +91,7 @@ obj-$(CONFIG_FAIL_FUNCTION) +=3D fail_function.o
>  obj-$(CONFIG_KGDB) +=3D debug/
>  obj-$(CONFIG_DETECT_HUNG_TASK) +=3D hung_task.o
>  obj-$(CONFIG_LOCKUP_DETECTOR) +=3D watchdog.o
> -obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) +=3D watchdog_hld.o
> +obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) +=3D watchdog_perf.o
>  obj-$(CONFIG_SECCOMP) +=3D seccomp.o
>  obj-$(CONFIG_RELAY) +=3D relay.o
>  obj-$(CONFIG_SYSCTL) +=3D utsname_sysctl.o
> diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_perf.c
> similarity index 99%
> rename from kernel/watchdog_hld.c
> rename to kernel/watchdog_perf.c
> index 96b717205952..c3d8ceb149da 100644
> --- a/kernel/watchdog_hld.c
> +++ b/kernel/watchdog_perf.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Detect hard lockups on a system
> + * Detect hard lockups on a system using perf
>   *
>   * started by Don Zickus, Copyright (C) 2010 Red Hat, Inc.
>   *
> --=20
> 2.40.1.521.gf1e218fcd8-goog

