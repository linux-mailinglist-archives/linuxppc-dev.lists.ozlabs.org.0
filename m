Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0118639933
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 03:46:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKXzx3Vn1z3f4b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:46:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O2xOwuAq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O2xOwuAq;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKXz13kZxz3057
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 13:45:48 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id q12so3291425pfn.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 18:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ppae8YkGxihHdolp7H9Ytm/fuY6Yp4IGxdByEhiVIp0=;
        b=O2xOwuAqWd42vmpaztCU+N0Zt7qwCJ+HxM+oeF/R/Gj78hawuSuBKUWUiUq7nriKCE
         LXgj9dd2Y8h6yoGZ98JNK9rt2CFthOzB9ISvDyTsm996HEY84YepKQ1lmA3YKTGbqdfS
         mZYY3HcYNv+rwoedu1KmAvTk9QCvqoATnvSwbk8KhsqeTscHgGX9mujcI5woUWdPOMEs
         4CCoP/7Ov1iBFRXxGUv6s2OlEGFERatM1Gdb5Oa+k2sM4c0A6+b6jO3vxTs8rcRfRCW8
         M22qGsW3PQAJ6X6AY74nYB2fn3GraeQtDLGqaZkcLvU8YBFhVjvAnC3tcNli0r+YBO5N
         bzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppae8YkGxihHdolp7H9Ytm/fuY6Yp4IGxdByEhiVIp0=;
        b=7iNYbTSIASB1R8q0ncHv2Z1zd421troZ8iOZ68OXRkoFcktpwSIn3kVKOTtibTLlgl
         v+59cnuRlqu4SJiirG1vZDyXjk5YB4VHZq/QuIyHBcZALPF7ihuX3GdjhK35IOvyiFyH
         zh27wgQsJyKUHC4ZAjbMP6W6xDTUKmZOtLEnwFFpQm2zhfKhJGeBSqYWSBzuw04+2Rzw
         0NVBBC1e9gU7eSvQONE5XQe1o2ubtQKMY5iojRYmwyT1GoXH2dIAbJi9tLPzVhqez3di
         EP7jprlaOgGYokw/8hOg3Qcu/dd0hDexj8EbeJQAIWPbAw0NdNMkmRpwlVNMWx1CcsHO
         0u3Q==
X-Gm-Message-State: ANoB5pmxbCqZ6sShRs+GqISF4PcUfa2AlERaPyoLNeuDweMl+4VNB4PP
	JRW9IGQtfFnSXqS9d1wjcJMG9NPwZxBKe1hQSTw=
X-Google-Smtp-Source: AA0mqf6YciwvlYw43Lh0nHr5XuZ1gXzzHQykeXjeIoYNZhlpSYxSR4xj6cT/+28H978gFdAz/Dp8UCqc83Ro3cy9dEM=
X-Received: by 2002:a65:45ce:0:b0:44b:2928:f868 with SMTP id
 m14-20020a6545ce000000b0044b2928f868mr31009871pgr.384.1669517145674; Sat, 26
 Nov 2022 18:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20221121035140.118651-1-zhouzhouyi@gmail.com> <87y1rxwsse.ffs@tglx>
In-Reply-To: <87y1rxwsse.ffs@tglx>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sun, 27 Nov 2022 10:45:34 +0800
Message-ID: <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: dave@stgolabs.net, paulmck@kernel.org, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank Thomas for your guidance

On Sun, Nov 27, 2022 at 1:05 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Nov 21 2022 at 11:51, Zhouyi Zhou wrote:
> > During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> > offline tick_do_timer_cpu, the operation will fail because in
> > function tick_nohz_cpu_down:
> > ```
> > if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
> >       return -EBUSY;
> > ```
> > Above bug was first discovered in torture tests performed in PPC VM
>
> How is this a bug?
Yes, this is a false positive instead.
>
> > of Open Source Lab of Oregon State University, and reproducable in RISC-V
> > and X86-64 (with additional kernel commandline cpu0_hotplug).
> >
> > In this patch, we avoid offline tick_do_timer_cpu by distribute
> > the offlining cpu among remaining cpus.
>
> Please read Documentation/process. Search for 'this patch'...
Documentation/process/submitting-patches.rst says:
"Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour."

So, I should construct my patch as:
We avoid ... by ...
>
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
> No. We are not exporting this just to make a bogus test case happy.
>
> Fix the torture code to handle -EBUSY correctly.
I am going to do a study on this, for now, I do a grep in the kernel tree:
find . -name "*.c"|xargs grep cpuhp_setup_state|wc -l
The result of the grep command shows that there are 268
cpuhp_setup_state* cases.
which may make our task more complicated.

After my study, should we also take Frederic's proposal as a possible option?
(construct a function for this)
https://lore.kernel.org/lkml/20221123223658.GC1395324@lothringen/

I learned a lot during this process
Many thanks
Zhouyi
>
> Thanks,
>
>         tglx
