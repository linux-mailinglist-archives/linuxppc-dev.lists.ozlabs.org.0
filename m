Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B7C147C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 14:55:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46h59V68z7zDq6J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 22:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=dan.streetman@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g2SB2sVWzDr0N
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 05:49:30 +1000 (AEST)
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.streetman@canonical.com>) id 1iDwF4-0005je-8I
 for linuxppc-dev@lists.ozlabs.org; Fri, 27 Sep 2019 19:49:26 +0000
Received: by mail-io1-f71.google.com with SMTP id i2so14518246ioo.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 12:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzSszHmZY6R6wBZpwrMnlGiFB4TaLUoa40MZxhfjcUQ=;
 b=n4Rg6sXfeJt/jdIas32utaYFrGxPPochED0u6cyXtHeJhFvrLsCnSEHVKIEbzD/psP
 7dc2SmJgX+YOvioU1uuz0Rj/S+M7fYWGN4Ga7yKRfX0tnMOSHCgbO1lhh4W2Niuvmk3k
 G9voV+X4h1oU14YKoBYcgGPPIzd0MqwaB4R9TJpkYTK+Eq2RVch3rZdCvhyvjGTTEnlG
 LvoY7eCpl7Q2dorVRzwcoBraEe4pmunVX6S8b+XsVz4/EjZMyshg8trJhlNQ6jI3bBqd
 BnxWtio6efbleuyob07naIxRSNKqOZ9kG2puD2/PvwIDIud2nDWsjOA3yjDn6H9cDY7+
 l6RA==
X-Gm-Message-State: APjAAAWUi2aECyBlMjQDQxZDE5EntavAB6BztrKmLXeIgVfl0+7NY3qg
 mKvZDli0rLDKb48H+xzdkty5zzJlpzbN++P2F6+N4mduHu65IibDs2Q4KnvEn8v+bdH//y8rgiU
 mhwt/8XvV+1RofsUDmIbxygHyhlO4yfGx00OUOxqgwZsF5RaE7kN2BPeX++Q=
X-Received: by 2002:a05:6602:c9:: with SMTP id z9mr9411765ioe.28.1569613765283; 
 Fri, 27 Sep 2019 12:49:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGvhNv1kaE6ju+QP/5ILJjDu0CVwiSJXPvYACgs/yTF1cbZAIT67ZZEk6c8Kh9eh7t5f1wpnnhgFX0RTxQOCs=
X-Received: by 2002:a05:6602:c9:: with SMTP id z9mr9411730ioe.28.1569613764952; 
 Fri, 27 Sep 2019 12:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190927130402.687-1-ddstreet@canonical.com>
 <20190927181856.GD1804168@kroah.com>
In-Reply-To: <20190927181856.GD1804168@kroah.com>
From: Dan Streetman <ddstreet@canonical.com>
Date: Fri, 27 Sep 2019 15:48:49 -0400
Message-ID: <CAOZ2QJNNnkM_0ZTULHOYGY2wEz1GxZWzHjosnM=j98zxZXUvYA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vio: use simple dummy struct device as bus parent
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 29 Sep 2019 22:51:39 +1000
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
Cc: Rob Herring <robh@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 27, 2019 at 2:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 27, 2019 at 09:04:02AM -0400, Dan Streetman wrote:
> > The dummy vio_bus_device creates the /sys/devices/vio directory, which
> > contains real vio devices under it; since it represents itself as having
> > a bus = &vio_bus_type, its /sys/devices/vio/uevent does call the bus's
> > .uevent function, vio_hotplug(), and as that function won't find a real
> > device for the dummy vio_dev, it will return -ENODEV.
> >
> > One of the main users of the uevent node is udevadm, e.g. when it is called
> > with 'udevadm trigger --devices'.  Up until recently, it would ignore any
> > errors returned when writing to devices' uevent file, but it was recently
> > changed to start returning error if it gets an error writing to any uevent
> > file:
> > https://github.com/systemd/systemd/commit/97afc0351a96e0daa83964df33937967c75c644f
> >
> > since the /sys/devices/vio/uevent file has always returned ENODEV from
> > any write to it, this now causes the udevadm trigger command to return
> > an error.  This may be fixed in udevadm to ignore ENODEV errors, but the
> > vio driver should still be fixed.
> >
> > This patch changes the arch/powerpc/platform/pseries/vio.c 'dummy'
> > parent device into a real dummy device with no .bus, so its uevent
> > file will stop returning ENODEV and simply do nothing and return 0.
> >
> > Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> > ---
> >  arch/powerpc/platforms/pseries/vio.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> > index 79e2287991db..63bc16631680 100644
> > --- a/arch/powerpc/platforms/pseries/vio.c
> > +++ b/arch/powerpc/platforms/pseries/vio.c
> > @@ -32,11 +32,8 @@
> >  #include <asm/page.h>
> >  #include <asm/hvcall.h>
> >
> > -static struct vio_dev vio_bus_device  = { /* fake "parent" device */
> > -     .name = "vio",
> > -     .type = "",
> > -     .dev.init_name = "vio",
> > -     .dev.bus = &vio_bus_type,
> > +static struct device vio_bus = {
> > +     .init_name      = "vio",
>
> Eeek, no!  Why are you creating a static device that will then be
> reference counted?  Not nice :(

sorry!  I'll admit that I simply copied what drivers/base/platform.c
seemed to be doing.

>
> What's wrong with a simple call to device_create() for your "fake"
> device you want to make here?  That's what it is there for :)

ack, will send a new patch using that.  thanks!

>
> thanks,
>
> greg k-h
