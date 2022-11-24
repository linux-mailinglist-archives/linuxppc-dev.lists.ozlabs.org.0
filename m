Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BD637056
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 03:19:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHhXX1FB1z3dvC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 13:19:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M++o8EzB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M++o8EzB;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHhWc5DZLz3cBq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 13:19:06 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id t17so246000pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 18:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21lSEg2vXSFoHO1msB/0t+aM934kgEehRE9bwrPsG98=;
        b=M++o8EzByfjyBaiqS+e8UmHNUp76zCjYvMqojZ3+KoXa0b1R3CqyVD8fjxyaB74FAX
         neRRiN4/Q1GD7r9njMwcThpT7w4oJWkGBCW5TPD9DCrrMIIE8Is7bQidYJ1Ceyrm8YIE
         e5DClzN4jeOXladpv5A5uDUcyOiGRu8UCad8XPNGOPLameYXrKL/1M89sVflNue7u8Uo
         784jqZ+R7yYVOs14A3OxfrZci4O7oYV9kaEhs2guYgyGdk40wYXIV2COwqDFrDhhcDpu
         5STo2CrgeMM83O9xrhjpdG9jqoxn/G6By3ujxqdqZWFbIe4+U3uPemVLlsVJR4tWN9Z8
         6aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21lSEg2vXSFoHO1msB/0t+aM934kgEehRE9bwrPsG98=;
        b=5O1YxFgcVNmjVxIg9tDbTaXtj+T7OrkweiWrHuOY6C61Zj+dXOTcWotznE9SyMm3tK
         AVP1XJVsDipq3xTNp74jtsGCm9xGF/8vC+A5ygo2ZpI45gLQWj6RKbDgP6GTu6YQBZss
         Gz41vfyk2g8XVJbn6HvTJEReP5IOIyC4DgIG5VI86ZgDsoiC/xnjyk2v4FBUFxjxiB3d
         EQI4wcG7PH0fnR6+crkMBCb+w7IVbps5KnTMoMw6Rajy2E39kxtgn4RiBPJbd8wL+tmw
         bwUWLs0AQv1dNb+yYRbHSNZsPSMw6Z7Zn0cKsjBzBeUCxzMidIxPRDtYXQaZsP7e9uP4
         yBMA==
X-Gm-Message-State: ANoB5pn+99jOycTtTtuq70Ca10V6nEXC8YqFP2H4gZZF0zlEUJHu3GU3
	95ikF17Xr4QSbzJexyX76Q2MShE5YKdBRWeTsGE=
X-Google-Smtp-Source: AA0mqf7sCcwj/0deayiyopQsUgF0aXV/P1BLzhFeCXXjGFm3ZD27pTDb1KpYV/ifmNUanYNhuL/oTqLbNcHWov6h+5g=
X-Received: by 2002:a17:90a:2a09:b0:218:7040:886e with SMTP id
 i9-20020a17090a2a0900b002187040886emr3119248pjd.1.1669256342183; Wed, 23 Nov
 2022 18:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20221121035140.118651-1-zhouzhouyi@gmail.com> <20221123223658.GC1395324@lothringen>
In-Reply-To: <20221123223658.GC1395324@lothringen>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 24 Nov 2022 10:18:51 +0800
Message-ID: <CAABZP2yDMTKqkj6r+hsQb=3zdoXOWMQ8Z3QKSxaaVTWv2eS-kw@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
To: Frederic Weisbecker <frederic@kernel.org>
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
Cc: dave@stgolabs.net, paulmck@kernel.org, fweisbec@gmail.com, josh@joshtriplett.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 24, 2022 at 6:37 AM Frederic Weisbecker <frederic@kernel.org> wrote:
>
> On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> > During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> > offline tick_do_timer_cpu, the operation will fail because in
> > function tick_nohz_cpu_down:
> > ```
> > if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
> >       return -EBUSY;
> > ```
> > Above bug was first discovered in torture tests performed in PPC VM
> > of Open Source Lab of Oregon State University, and reproducable in RISC-V
> > and X86-64 (with additional kernel commandline cpu0_hotplug).
> >
> > In this patch, we avoid offline tick_do_timer_cpu by distribute
> > the offlining cpu among remaining cpus.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> >  include/linux/tick.h        |  1 +
> >  kernel/time/tick-common.c   |  1 +
> >  kernel/time/tick-internal.h |  1 -
> >  kernel/torture.c            | 10 ++++++++++
> >  4 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > index bfd571f18cfd..23cc0b205853 100644
> > --- a/include/linux/tick.h
> > +++ b/include/linux/tick.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/rcupdate.h>
> >
> >  #ifdef CONFIG_GENERIC_CLOCKEVENTS
> > +extern int tick_do_timer_cpu __read_mostly;
> >  extern void __init tick_init(void);
> >  /* Should be core only, but ARM BL switcher requires it */
> >  extern void tick_suspend_local(void);
> > diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> > index 46789356f856..87b9b9afa320 100644
> > --- a/kernel/time/tick-common.c
> > +++ b/kernel/time/tick-common.c
> > @@ -48,6 +48,7 @@ ktime_t tick_next_period;
> >   *    procedure also covers cpu hotplug.
> >   */
> >  int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
> > +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
>
> Please rather make a function for this. This is an internal value
> that we don't want to expose to modules.
>
> This can be:
>
>      int tick_nohz_full_timekeeper(void)
>      {
>          if (tick_nohz_full_enabled() && tick_do_timer_cpu >= 0)
>              return tick_do_timer_cpu;
>          else
>              return nr_cpu_ids;
>      }
>
> And then just check if the value is below nr_cpu_ids.
Thank Paul and Frederic both for your guidance!

Things are much easier;-) and I will do it.

Cheers
Zhouyi
>
> Thanks.
