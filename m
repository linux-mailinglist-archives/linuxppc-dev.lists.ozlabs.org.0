Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3B2958D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 09:11:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGz700z1xzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 18:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=InkF17Gm; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyrV17KXzDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:58:49 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id p9so743677ilr.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZYYj+uQmURS506LLIuPMrOEKOO6dWQ/OLNHv1kkJb/s=;
 b=InkF17Gm4TTfsPw3WDzAP4S+woa1Vw8UbC+pC4nRS8NgF7JFzdWDfzIp3F412kuIlh
 fZXvoFUOMoFKiksj3DNNYLqj67NzS6pwkRDFJfF2IoPhzmer3sChP019UWJ0VTnu7+UB
 Md3axp1r4asWrSyFNO4FEw47JNEsWSujX71v9plaqTPo4vjFXz2m58wBExfQpfqvmQLd
 DH9HhzzJh5nidcl/4kwBYP8G7FhYBdzZQ38uApfpVm789bCJs7SeCrL8qE+QoxFkyEtZ
 +8RZFxdWjLy/aWlIlsU3K7TNi3yF2Y2H74Oaib7T3Iu7sn6de4eCEO5BP9q6KcTJ4Mwo
 wl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZYYj+uQmURS506LLIuPMrOEKOO6dWQ/OLNHv1kkJb/s=;
 b=FGnhdPpsTny/VMh5h94Yo2hdVKPV55R6YKqRovo4iEF/bt8C0gCXC/UVP9fzTVOC0O
 c65meLE9km8lNz44bQZPkMjWR6hoZ0B9s8u9Oz9daficBaWYpwW6CEepRJbNXZ284dAA
 KweMZ+kI0Eg+4e5MZ7lUpnZMl1sP/FakFe53ULRFgALgk8RghDzFlfjoXQjGIMDQJHo7
 4zLyI9D34/SBP/veXymwoO9MllIYjGHspKgq1ECEnSMzUsOzzv8a4es//TloTvFJyLXR
 ZyVvbkRyCEV3KnvKePM83XfCAvdmtXREXf3Wei65/uKWhZ08025XYbCHcR392r0doNWu
 4AAQ==
X-Gm-Message-State: AOAM5321qt6X4zx/5qjBgEfZtm4LueSy5cRapR0ag9U7uuHofNQ2QeA/
 2qzMy+fxAX2PXBu+71wazCUhsWXyIQPKAzo1CYVxJf4+/w==
X-Google-Smtp-Source: ABdhPJz1D//X2UxoBnI33LBCOh0UlQOOuv9YrzI0eOeJ7DqLnEsSXZN1w5CV8iSqoWuTOqrXxJkIjOE1Z3fMbqxzK+I=
X-Received: by 2002:a92:cbd2:: with SMTP id s18mr855888ilq.34.1603349922925;
 Wed, 21 Oct 2020 23:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <1603349479-26185-1-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1603349479-26185-1-git-send-email-kernelfans@gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Thu, 22 Oct 2020 14:58:31 +0800
Message-ID: <CAFgQCTvE0s2BKJmawZ1yHaO243f1vyR8hhJhJQ=Goz8YMndHug@mail.gmail.com>
Subject: Re: [PATCH] powerpc/time: enable sched clock for irqtime
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I encounter a irq flood on Power9 machine, and tries a way to work
around it by https://www.spinics.net/lists/kernel/msg3705028.html

As irq time accounting is the foundation for the method, it needs to
make irq accounting take effect on powerpc platform.

On Thu, Oct 22, 2020 at 2:51 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> When CONFIG_IRQ_TIME_ACCOUNTING and CONFIG_VIRT_CPU_ACCOUNTING_GEN, powerpc
> does not enable "sched_clock_irqtime" and can not utilize irq time
> accounting.
>
> Like x86, powerpc does not use the sched_clock_register() interface. So it
> needs an dedicated call to enable_sched_clock_irqtime() to enable irq time
> accounting.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> To: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/time.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index f85539e..4083b59e 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -53,6 +53,7 @@
>  #include <linux/of_clk.h>
>  #include <linux/suspend.h>
>  #include <linux/sched/cputime.h>
> +#include <linux/sched/clock.h>
>  #include <linux/processor.h>
>  #include <asm/trace.h>
>
> @@ -1134,6 +1135,7 @@ void __init time_init(void)
>         tick_setup_hrtimer_broadcast();
>
>         of_clk_init(NULL);
> +       enable_sched_clock_irqtime();
>  }
>
>  /*
> --
> 2.7.5
>
