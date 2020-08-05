Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED523D453
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 02:00:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMTCB1wg0zDqB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 10:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=R8V8Xt5c; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMT8k354LzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 09:58:14 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id c10so4108143edk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BLxcBBqlcvQYddgC4EcPW6Kp2JKtlHCc+i/89YzOsrk=;
 b=R8V8Xt5cnS0erOcniTejm/8qVsWxIUAxhhuflK2dZIM9SiRF02XCma5BaU5nd1kfVJ
 4WE+sBFq8q9tsy6e8zbgYXfFcpAxOMoQ6oz1VrH91dWJ3YY8WE36GGQFiFJI3ezgGLYx
 vYXBTFT+4nP77Lad886FvueMRBDGSYzFhX9c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLxcBBqlcvQYddgC4EcPW6Kp2JKtlHCc+i/89YzOsrk=;
 b=D/xnym9sg37K7z3ecnKuDUuC/saymsem0w2AE6QCT0fKXtC/BuSYj9LTCz7i+vsqbW
 FRKCQST4js/Dhu+dy9iBSC/bdpxRRcNfl/P8ddEU9AF/026secXAtbXorz+V+fo1AQpe
 C3i4JaYjWC7UfRytuFKqOB0Cmp9KEeeRJkdjZ4lwcdu0PyMeuRSCMN5vra6PtgtsYk2U
 JgODNouQ78C140PL1ryZX2uM60wCevBHIhr5lqkOmMip00DNqSaWjV32a8JabEoQC5jo
 nyt6HiV1orl/nZCpeeNOu0KwGtP0RvHgoTJJu3NDtxa3jDJbUqSLMo9sguRdHPCgPpJn
 BiJQ==
X-Gm-Message-State: AOAM532HhF8iN0Xp69ODzbVFsoczhMQ6VZsknGANMeDYSQ/qf2TKyW4d
 6Q9F+YT16a/yjLAeo2xqFT2o/wawAtarauimKTE=
X-Google-Smtp-Source: ABdhPJxVXVuwvgUU9+UXXDXVzj+X5eV3hxJh1VVJsI1pxTzBUyDP9O3VYsQh9soTF3FHCQowo45SyG5EbBU6umJ2VJQ=
X-Received: by 2002:aa7:dc02:: with SMTP id b2mr1630668edu.260.1596671889774; 
 Wed, 05 Aug 2020 16:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200630015935.2675676-1-joel@jms.id.au>
 <87eeomzknj.fsf@mpe.ellerman.id.au>
In-Reply-To: <87eeomzknj.fsf@mpe.ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Aug 2020 23:57:57 +0000
Message-ID: <CACPK8XdQ_oofUxvA7XqAg+qT+uF+a=c4-qmZVpszvPuVKTg+3g@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: Warn about use of smt_snooze_delay
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Aug 2020 at 11:59, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Joel Stanley <joel@jms.id.au> writes:
> > It's not done anything for a long time. Save the percpu variable, and
> > emit a warning to remind users to not expect it to do anything.
> >
> > Fixes: 3fa8cad82b94 ("powerpc/pseries/cpuidle: smt-snooze-delay cleanup.")
> > Cc: stable@vger.kernel.org # v3.14
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > --
> > v2:
> >  Use pr_warn instead of WARN
> >  Reword and print proccess name with pid in message
> >  Leave CPU_FTR_SMT test in
> >  Add Fixes line
> >
> > mpe, if you don't agree then feel free to drop the cc stable.
> >
> > Testing 'ppc64_cpu --smt=off' on a 24 core / 4 SMT system it's quite noisy
> > as the online/offline loop that ppc64_cpu runs is slow.
>
> Hmm, that is pretty spammy.
>
> I know I suggested the ratelimit, but I was thinking it would print once
> for each ppc64_cpu invocation, not ~30 times.
>
> How about pr_warn_once(), that should still be sufficient for people to
> notice if they're looking for it.

I think that's a reasonable suggestion.

>
> ...
> > diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> > index 571b3259697e..ba6d4cee19ef 100644
> > --- a/arch/powerpc/kernel/sysfs.c
> > +++ b/arch/powerpc/kernel/sysfs.c
> > @@ -32,29 +32,26 @@
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
> > +     pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
> > +                         current->comm, current->pid);
>
> Can we make this:
>
>         "%s (%d) stored to unsupported smt_snooze_delay, which has no effect.\n",

ack

>
>
> >       return count;
> >  }
> >
> > @@ -62,9 +59,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
> >                                    struct device_attribute *attr,
> >                                    char *buf)
> >  {
> > -     struct cpu *cpu = container_of(dev, struct cpu, dev);
> > -
> > -     return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
> > +     pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
> > +                         current->comm, current->pid);
>
> It has as much effect as it ever did :)
>
> So maybe:
>
>         "%s (%d) read from unsupported smt_snooze_delay.\n",
>
>
> I can do those changes when applying if you like rather than making you
> do a v3.

Yes please! Your suggested changes lgtm.

Cheers,

Joel
