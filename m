Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA03B1FA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 19:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G99Tz1dnBz3bxd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 03:38:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=uyCNzWi7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=uyCNzWi7; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G99TT3qYqz304G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 03:38:03 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id w21so7156866qkb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 10:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B5o1VpdMcZrmQnyC6VaIuCe6zHlh4bhQF/lUKDsspdg=;
 b=uyCNzWi7QuYZIzhGrc5Gb0sdMjZK3o6D0PuYZzJifbcz5wgi1WYMMQLGlIjgLaTWiV
 Y4aa2KgTJlvAvMQgmqyviyjzKaEw0jufgBBV0MDw9vzaM9Nm4/BsgAmh0UmIq5qmRIVy
 iyjfe0Ng8PLGeYGk/YSVvr9pWYTZhy7WC/hqAWcRnXRZE1WQPk4VgRskrvGwvNKXusZ6
 b8mwxVPmkgqS0o8quY79rwRVrItOcHsvvrvnr7DBPQXwCW4lqX1En11ySqqyjWAaxLyp
 h2WPhz0s73bmvf73nVMXj6PPZv9uYKZleOl7R/tkmOjDmAT8zD5eKrJtiOqLI/E/rNkM
 mSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B5o1VpdMcZrmQnyC6VaIuCe6zHlh4bhQF/lUKDsspdg=;
 b=hvX4+ZStwvKdcAK+jslBfiHbLs44OYTpVO+SntXYg+nyIMBL62zMSK4nrNARKJRCME
 Rg/+0/NdzzSwpEV421g2r9xuNQT4kCqOoNZDv6J0+EHKyRbrGqgsZa6zKnCv0ifvFYmC
 TBK91DuH8/bzNTJ/R/5AZtqkzbTg8L9+VwbZyFJlVvDMYQmbppxlJ6iSoRIJNI/yz02g
 CI6O4axQacckVOHJyutPlNKumAHZT70bwO547I7e/OcAdXujPcY+b9LXRyeIjgOeidjH
 o5v2tw84gZiOYXQrt6jxhH3pMGcwmt0JhSIsDyXqGndC9PclR+V6UAnycv4TrCGUusRL
 ULzA==
X-Gm-Message-State: AOAM532nV1s/yniO7DBDcVybWvd/loytuGg1nwmybi5kyB0EL8iJkg83
 8Yb/kCRSXwkfuQU3U/OkkFGgjFSZRNEJ1iRnWjAblw==
X-Google-Smtp-Source: ABdhPJyS501FUMJKU2Fd8GSeFaTNJquoa/D16LPwAed/qRy5fatTpVdAvkwHb8W/LsdshZn6oTNpuwnYHJodG440fwc=
X-Received: by 2002:ae9:dd06:: with SMTP id r6mr1270322qkf.74.1624469879194;
 Wed, 23 Jun 2021 10:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
 <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
 <20210623120835.GB29143@vingu-book>
 <5D874F72-B575-4830-91C3-8814A2B371CD@linux.vnet.ibm.com>
 <CAKfTPtBKn27=jryS_sxsVb+0yHDze_PMcLuyFtDkDo0H9Nzqww@mail.gmail.com>
 <CAKfTPtDFUBe+qD9z0YYb7yyup_mhdNNX+zopFwcnyh+G41viAw@mail.gmail.com>
In-Reply-To: <CAKfTPtDFUBe+qD9z0YYb7yyup_mhdNNX+zopFwcnyh+G41viAw@mail.gmail.com>
From: Odin Ugedal <odin@uged.al>
Date: Wed, 23 Jun 2021 19:37:23 +0200
Message-ID: <CAFpoUr1kLf3knmVG4HjPaOLzbs0bz+YpRf_uno233ZPO9xxCdQ@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To: Vincent Guittot <vincent.guittot@linaro.org>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ons. 23. jun. 2021 kl. 19:27 skrev Vincent Guittot <vincent.guittot@linaro.org>:
>
> On Wed, 23 Jun 2021 at 18:55, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Wed, 23 Jun 2021 at 18:46, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
> > >
> > >
> > > > Ok. This becomes even more weird. Could you share your config file and more details about
> > > > you setup ?
> > > >
> > > > Have you applied the patch below ?
> > > > https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> > > >
> > > > Regarding the load_avg warning, I can see possible problem during attach. Could you add
> > > > the patch below. The load_avg warning seems to happen during boot and sched_entity
> > > > creation.
> > > >
> > >
> > > Here is a summary of my testing.
> > >
> > > I have a POWER box with PowerVM hypervisor. On this box I have a logical partition(LPAR) or guest
> > > (allocated with 32 cpus 90G memory) running linux-next.
> > >
> > > I started with a clean slate.
> > > Moved to linux-next 5.13.0-rc7-next-20210622 as base code.
> > > Applied patch #1 from Vincent which contains changes to dequeue_load_avg()
> > > Applied patch #2 from Vincent which contains changes to enqueue_load_avg()
> > > Applied patch #3 from Vincent which contains changes to attach_entity_load_avg()
> > > Applied patch #4 from https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> > >
> > > With these changes applied I was still able to recreate the issue. I could see kernel warning
> > > during boot.
> > >
> > > I then applied patch #5 from Odin which contains changes to update_cfs_rq_load_avg()
> > >
> > > With all the 5 patches applied I was able to boot the kernel without any warning messages.
> > > I also ran scheduler related tests from ltp (./runltp -f sched) . All tests including cfs_bandwidth01
> > > ran successfully. No kernel warnings were observed.
> >
> > ok so Odin's patch fixes the problem which highlights that we
> > overestimate _sum or don't sync _avg and _sum correctly
> >
> > I'm going to look at this further
>
> The problem is  "_avg * divider" makes the assumption that all pending
> contrib are not null contributions whereas they can be null.

Yeah.

> Odin patch is the right way to fix this. Other patches should not be
> useful for your problem

Ack. As I see it, given how PELT works now, it is the only way to
mitigate it (without doing a lot of extra PELT stuff).
Will post it as a patch together with a proper message later today or tomorrow.

>
> >
> > >
> > > Have also attached .config in case it is useful. config has CONFIG_HZ_100=y
> >
> > Thanks, i will have a look
> >
> > >
> > > Thanks
> > > -Sachin
> > >

Thanks for reporting Sachin!

Thanks
Odin
