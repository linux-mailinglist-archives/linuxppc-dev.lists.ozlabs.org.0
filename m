Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89557B989
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnzyF2bKjz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HIhV3Fd6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HIhV3Fd6;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnzxc0HhBz3dsW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:23:47 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id p26-20020a1c545a000000b003a2fb7c1274so1583793wmi.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=slmyMPLStcdVZwVLrygegZI1kQWoRXJ3dHO76YDTpRY=;
        b=HIhV3Fd6zMou+mYxHrh3EwfKVqnGb8wEko3bWRabyZeaVFndg3i21gDTZYKU4QH+U+
         ceaCmAfpX1NMgjhfDGx4UySpyEinYNowzRP7cFJRtqspUSkZIR2zjdPU8Gn7M0H6VQWx
         B3ybGupwWxzX5e2wtNdoemR9WFi5dPRa9TeZSbSnHoLoeV/L688W4Kv11U68i6CaqIvn
         uiaRX7PjPvyU0C0H5C5GXfZss8yQw1k3hMQhZ9JXJzEisI+okjAVN2JnoxjGu3G4Es6Y
         +kY3oLBP7KynlFqDXyPzuq/rcV8M/Le1dOaWLGpb3ON+93C8x2JKUBBkSxJmL+fDzeAI
         q/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slmyMPLStcdVZwVLrygegZI1kQWoRXJ3dHO76YDTpRY=;
        b=31ht8HYcPKWUbDC5nogohdfin9ggLxZmtxCxtG8nbt0FOEkvm+O50TGTcUx5e/hBch
         ucrLIGxq46ftjov+VczmbVppdMHHFoLKIs9l7ShI87f6dss7eStAp+ZJu0Z9nZ1hiund
         ePTC/cshxM1jZW9sHY4dqJkGizr1jB8xgrInDqUOabUpJymlLkqsZMoBwWsoKVG50RUm
         RR3X9AkEPE2WarT8nkkrdVHDqj8p62v0vFgMfmhV+9C0lypNZc5i8O94N7O7Xuafin5a
         TQabzMsoxE2YCpJV6QPry7RNO8Kx9QUQXtkdGimk7/Vg9znoLdCem509iZTge/HMBgeA
         Napw==
X-Gm-Message-State: AJIora+C620TVsIPg77Z5VoaeZg9ogJIiKgVEjiq6gXrtw7oqNeITFDo
	ohSEXHm8yeo/9PAW/QCDW1m1au2mxp4uHVb0cllalw==
X-Google-Smtp-Source: AGRyM1vb0saAhlewKLRMkgo4BMvL28iEly+NJOS9mGiKUFwMGQzov9Fw2dnpVoeLMPQGJoQSPfnpkfZDFIn0qF4i0sU=
X-Received: by 2002:a05:600c:20e:b0:3a3:214c:7ffb with SMTP id
 14-20020a05600c020e00b003a3214c7ffbmr494719wmi.1.1658330623182; Wed, 20 Jul
 2022 08:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-4-elver@google.com>
In-Reply-To: <20220704150514.48816-4-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:23:31 -0700
Message-ID: <CAP-5=fWWB7qnxn0WMwqGuiO=CXqfBdvjAWMc52BHSJciz04gCg@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] perf/hw_breakpoint: Clean up headers
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
> Clean up headers:
>
>  - Remove unused <linux/kallsyms.h>
>
>  - Remove unused <linux/kprobes.h>
>
>  - Remove unused <linux/module.h>
>
>  - Remove unused <linux/smp.h>
>
>  - Add <linux/export.h> for EXPORT_SYMBOL_GPL().
>
>  - Add <linux/mutex.h> for mutex.
>
>  - Sort alphabetically.
>
>  - Move <linux/hw_breakpoint.h> to top to test it compiles on its own.
>
> Signed-off-by: Marco Elver <elver@google.com>
> Acked-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> v2:
> * Move to start of series.
> ---
>  kernel/events/hw_breakpoint.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index fd5cd1f9e7fc..6076c6346291 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -17,23 +17,22 @@
>   * This file contains the arch-independent routines.
>   */
>
> +#include <linux/hw_breakpoint.h>
> +
> +#include <linux/bug.h>
> +#include <linux/cpu.h>
> +#include <linux/export.h>
> +#include <linux/init.h>
>  #include <linux/irqflags.h>
> -#include <linux/kallsyms.h>
> -#include <linux/notifier.h>
> -#include <linux/kprobes.h>
>  #include <linux/kdebug.h>
>  #include <linux/kernel.h>
> -#include <linux/module.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/percpu.h>
>  #include <linux/sched.h>
> -#include <linux/init.h>
>  #include <linux/slab.h>
> -#include <linux/list.h>
> -#include <linux/cpu.h>
> -#include <linux/smp.h>
> -#include <linux/bug.h>
>
> -#include <linux/hw_breakpoint.h>
>  /*
>   * Constraints data
>   */
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
