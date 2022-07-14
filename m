Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50355749F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 12:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk95g5T6Sz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 20:02:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BBvvyLCc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BBvvyLCc;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk9515lQgz3050
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 20:01:55 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id bp15so2490630ejb.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hnb6dmJVJ8w+0s7YTlnQHUZqrxFXtH+uKxV3IXY9L40=;
        b=BBvvyLCcMtbUvehMM2snxdWnz/o57eYWts/1kZVSRIHaFo8g/gbOmGiq9dzzXSEEY0
         6k4yuafUZ2DfJIEW7EXBBiY3yx2jCIGEhmOmjKP22SZ2e7TgfdMAJQzTzlknpq7BJRQS
         t0Au1FhwOBHM91G0Z5KDYb4F2wkMK+fgnJ3LWNwr3DFNSpSj5lwo7K6OcDA/AydjV3WY
         TcPh8k6afACQV76dCekexaxcFLiJWupnOa88OtAJSPDck8XhHjtEs7aFXNcAex8PuneQ
         Y56Aaf/JVTGK+EuNVOJRRp0XHITuunFgYTU/qdIqOwhC5n6+5k0aZvAG5x03pLaYXI76
         Arpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hnb6dmJVJ8w+0s7YTlnQHUZqrxFXtH+uKxV3IXY9L40=;
        b=pIB6IvxLtzdDBz3mWRpQ1xGH2o91x8zGgXZZnmcYyc3GG56fdh4v2T6xOX3KdkdZfq
         L8PWKXzQ1/DDiGhJSOgGjkrJwAMsXVG6AvWE+nM1zM/CflJSFBsn8BlZn7P434VYOeOA
         buCvSUeiD/uURNw2U4H00cpRkNYUEJxaFKpafvoZ5YVg1lP7sVF0Uv5oeaGPTZWrUstE
         Xgy5uK9BK2XMAVO0Zvh5V4W2GL8b0me8f++XVvvn/IZ0fNsfnlz8C8ACnDegoiulk1/U
         cL8EqDRSbcsmJjuVcdAB4HQAkdxzXDlp15nb/nE+COlasyh4t0b5XUq7pDamS0dzCulC
         l1hw==
X-Gm-Message-State: AJIora8txA4dzVx2G+XhTA+UH7sN6dhSsSkEJPtIcrGNw+ktWbRsCceK
	hzFxu7QOAh9UN0sRzgzVZd1S6C4YAoJcxjQO2r8=
X-Google-Smtp-Source: AGRyM1sCQn8e+iDOsrWhFzdhSNCJDhCc4UgyWLSakUOGtksbk5r0HgvpK3Fsmib9vFWsJBhOgZej6MmBSRRPHyBcaPw=
X-Received: by 2002:a17:907:971a:b0:72b:6bab:abc2 with SMTP id
 jg26-20020a170907971a00b0072b6bababc2mr8046604ejc.551.1657792912428; Thu, 14
 Jul 2022 03:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220714013131.12648-1-zhouzhouyi@gmail.com> <87tu7k6o7n.fsf@jogness.linutronix.de>
In-Reply-To: <87tu7k6o7n.fsf@jogness.linutronix.de>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 14 Jul 2022 18:01:41 +0800
Message-ID: <CAABZP2x-OiwX7-nRvdPz0NU1D5kgUoL4MQOgTqLK1KgLcrZ5DA@mail.gmail.com>
Subject: Re: [PATCH linux-next] powerpc: use raw_smp_processor_id in arch_touch_nmi_watchdog
To: John Ogness <john.ogness@linutronix.de>
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
Cc: pmladek@suse.com, "Paul E. McKenney" <paulmck@kernel.org>, rcu <rcu@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Julia.Lawall@inria.fr, paulus@samba.org, lance@osuosl.org, ldufour@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank John for correcting me ;-)

On Thu, Jul 14, 2022 at 5:25 PM John Ogness <john.ogness@linutronix.de> wrote:
>
> On 2022-07-14, Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> > use raw_smp_processor_id() in arch_touch_nmi_watchdog
> > because when called from watchdog, the cpu is preemptible.
>
> I would expect the correct solution is to make it a non-migration
> section. Something like the below (untested) patch.
I applied your patch (I have made a tiny modification by removing the
return statement after "goto out;") and
passed the test in the ppc VM of Open Source Lab of Oregon State University.

Tested-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Many Thanks
Kindly Regards
Zhouyi
>
> John Ogness
>
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index bfc27496fe7e..9d34aa809241 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -450,17 +450,23 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  void arch_touch_nmi_watchdog(void)
>  {
>         unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
> -       int cpu = smp_processor_id();
> +       int cpu;
>         u64 tb;
>
> -       if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
> +       cpu = get_cpu();
> +
> +       if (!cpumask_test_cpu(cpu, &watchdog_cpumask)) {
> +               goto out;
>                 return;
I think we should remove the return statement here.
> +       }
>
>         tb = get_tb();
>         if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
>                 per_cpu(wd_timer_tb, cpu) = tb;
>                 wd_smp_clear_cpu_pending(cpu);
>         }
> +out:
> +       put_cpu();
>  }
>  EXPORT_SYMBOL(arch_touch_nmi_watchdog);
