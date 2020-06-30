Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9042B20EAAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:07:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wmRd58y0zDqfH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:07:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jw62aWNj; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wmPn2KFMzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:05:49 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id d16so7989011edz.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMTWQWChSj343jYVgV8/gH8rsqb4QQrZGi2QENoQfj8=;
 b=jw62aWNjhzIViJKdP8N26VY6kSaTPsF7d+CftYcQILf61seq4H1GJZwGz2q0qGbUPN
 eaEPAiw99r+03EbHAEXJHPrIN14f4f8IDPP2iYFWPfOvF/T7kWMaRYI7Hamhnh+Kjm2o
 KT4t0vm8Kjs9B6r/6gy6jEZF+p8C78pGSreMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMTWQWChSj343jYVgV8/gH8rsqb4QQrZGi2QENoQfj8=;
 b=jo/SNwIzaIrmFk+1mKuvnMzY74nBQibiuBdniXASB8yFNPen51023xBLWjKUFE8H4h
 z9nzq0bVvZhdCEV9bOpASJJVhPkvmehokY/O3RrC5tUVnejN6iLsCYlTCYwejfyxzpp6
 s6PirVXAOOPckiVLuF5GzDQ8NeLMaqoF2FgQPCiSsk7EsdEdyw3xJDycDLQLN+l71JlW
 OtFd6OmRa3bUmpwTpcq26N2EevYKcTVrAqx6zfev8nXw6znzYwl/e376O3b09qs3fmL7
 LGZ5QOUXAyaJl7aYOTTlPwquR2VAgzULaOO47gN3p1gSr2TbRjJZ8RVSclM2JeSOTItW
 XrJA==
X-Gm-Message-State: AOAM531QR2O7xceDQmkFjDAFSAqmDEGooDs3ukq945xe+l1RjGxAbpjj
 UJBJbfvbfJQ6XdUmjUB2FFKzeEqBMWxS3l69t6lUeRhDxzc=
X-Google-Smtp-Source: ABdhPJzPnOEA5M23GtwL8rMm7kuogfBBpzBjIm1nJP8+KqHdqOYzlaswX25KcJdisxhQzdqOEqyJWiKgVZwKxFPVbJc=
X-Received: by 2002:aa7:d802:: with SMTP id v2mr13505732edq.77.1593479143785; 
 Mon, 29 Jun 2020 18:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200625100349.2408899-1-joel@jms.id.au>
 <20200629104248.GD20062@in.ibm.com>
In-Reply-To: <20200629104248.GD20062@in.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Jun 2020 01:05:32 +0000
Message-ID: <CACPK8XfzzN+7gSUpc0UF8FUkQ4X_RZg=RxEN__fhnmPJSsijYA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Warn about use of smt_snooze_delay
To: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, ego@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Jun 2020 at 10:42, Gautham R Shenoy <ego@linux.vnet.ibm.com> wrote:
>
> On Thu, Jun 25, 2020 at 07:33:49PM +0930, Joel Stanley wrote:
> > It's not done anything for a long time. Save the percpu variable, and
> > emit a warning to remind users to not expect it to do anything.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> The only known user of "smt_snooze_delay" is the "ppc64_cpu" which
> uses the presence of this file to assume that the system is SMT
> capable.
>
> Since we have "/sys/devices/system/cpu/smt/" these days, perhaps the
> userspace utility can use that and we can get rid of the file
> altogether ?

I've sent a change to the userspace tool to stop using the file. It
now uses the device tree parsing that was already present to determine
the smt state.

 https://github.com/ibm-power-utilities/powerpc-utils/pull/43

We will want to wait for the userspace tool to propagate through a
release and to distros before we remove the file all together. I agree
it should be removed in the future.

I've got of this patch v2 that changes the message to be:

         pr_warn_ratelimited("%s (%d) used unsupported
smt_snooze_delay, this has no effect\n",
                            current->comm, current->pid);

I'll send that out today.

Cheers,

Joel

>
> FWIW,
> Acked-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/sysfs.c | 41 +++++++++++++------------------------
> >  1 file changed, 14 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> > index 571b3259697e..530ae92bc46d 100644
> > --- a/arch/powerpc/kernel/sysfs.c
> > +++ b/arch/powerpc/kernel/sysfs.c
> > @@ -32,29 +32,25 @@
> >
> >  static DEFINE_PER_CPU(struct cpu, cpu_devices);
> >
> > -/*
> > - * SMT snooze delay stuff, 64-bit only for now
> > - */
> > -
> >  #ifdef CONFIG_PPC64
> >
> > -/* Time in microseconds we delay before sleeping in the idle loop */
> > -static DEFINE_PER_CPU(long, smt_snooze_delay) = { 100 };
> > +/*
> > + * Snooze delay has not been hooked up since 3fa8cad82b94 ("powerpc/pseries/cpuidle:
> > + * smt-snooze-delay cleanup.") and has been broken even longer. As was foretold in
> > + * 2014:
> > + *
> > + *  "ppc64_util currently utilises it. Once we fix ppc64_util, propose to clean
> > + *  up the kernel code."
> > + *
> > + * At some point in the future this code should be removed.
> > + */
> >
> >  static ssize_t store_smt_snooze_delay(struct device *dev,
> >                                     struct device_attribute *attr,
> >                                     const char *buf,
> >                                     size_t count)
> >  {
> > -     struct cpu *cpu = container_of(dev, struct cpu, dev);
> > -     ssize_t ret;
> > -     long snooze;
> > -
> > -     ret = sscanf(buf, "%ld", &snooze);
> > -     if (ret != 1)
> > -             return -EINVAL;
> > -
> > -     per_cpu(smt_snooze_delay, cpu->dev.id) = snooze;
> > +     WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
> >       return count;
> >  }
> >
> > @@ -62,9 +58,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
> >                                    struct device_attribute *attr,
> >                                    char *buf)
> >  {
> > -     struct cpu *cpu = container_of(dev, struct cpu, dev);
> > +     WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
> >
> > -     return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
> > +     return sprintf(buf, "100\n");
> >  }
> >
> >  static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
> > @@ -72,16 +68,7 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
> >
> >  static int __init setup_smt_snooze_delay(char *str)
> >  {
> > -     unsigned int cpu;
> > -     long snooze;
> > -
> > -     if (!cpu_has_feature(CPU_FTR_SMT))
> > -             return 1;
> > -
> > -     snooze = simple_strtol(str, NULL, 10);
> > -     for_each_possible_cpu(cpu)
> > -             per_cpu(smt_snooze_delay, cpu) = snooze;
> > -
> > +     WARN_ON_ONCE("smt-snooze-delay command line option has no effect\n");
> >       return 1;
> >  }
> >  __setup("smt-snooze-delay=", setup_smt_snooze_delay);
> > --
> > 2.27.0
> >
