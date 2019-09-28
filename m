Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF4C147D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 14:57:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46h5D01Z4szDqbf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 22:57:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gTzF2ybJzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 23:29:29 +1000 (AEST)
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.streetman@canonical.com>) id 1iECmq-00061v-Ox
 for linuxppc-dev@lists.ozlabs.org; Sat, 28 Sep 2019 13:29:24 +0000
Received: by mail-io1-f70.google.com with SMTP id w16so18889710ioc.15
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 06:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bF3USLrRtGOtWkc8DEqoHbqfqpfLY1dkn/s/U0IIv9I=;
 b=gMYmFSmHO3mnFvMS38KSqC01xDAAHW6v4kJf+RuYMIjas2203df1gCcXq3TUULet98
 Z6Cfd0eSPGD0CSxkqCzeMFeQyRs+KKdfXNl2aJj+2mbr4RiiD6T5TpGmHMjwNjWTkT4u
 /sXlhLJm5tY9HsgVrnd7fcWbcPVZEKl8M1zga+pBdkVj4EqmW1Ky1yuX2PtqIUCI1GWH
 qr8FEXZjMu8skhfaW2seXD/IOJ3AYV6s8XB6x/e+JhQxN/klZNrS+zMpkyI2mGCj19ZO
 yzUAXIrIbXcIY0RT06/oAFhzinrNZsrYR+BJg+RDxhjvdyKmniSb1ayKa6BMjKUdV5GU
 ISxQ==
X-Gm-Message-State: APjAAAV155cUeLbp2SRCgmNwstx+NKwkhx8C3mGTQH2gPGdzOLBToUQa
 3O9/5ecl5HoB49wl6fim7svW43V9xGwaJpQXHv5h/oeG+v5mAuOTRy6TaAbijLxIe7UIuT7KslO
 hhm/gySZh5fhci+uSDMB0tNHXMyAUi9XXvlLG4wwcSA79jFkHSgSp2fA9mA8=
X-Received: by 2002:a92:1a4f:: with SMTP id z15mr10893526ill.199.1569677363793; 
 Sat, 28 Sep 2019 06:29:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6TG/+XKfdalDvEwdVWY/LzoTroAcnh5FMg0wYJDGSjRqFcDHyDFELZbFI2E1ITE0cL5+p2Aqm0Z7tLRCF42Y=
X-Received: by 2002:a92:1a4f:: with SMTP id z15mr10893493ill.199.1569677363423; 
 Sat, 28 Sep 2019 06:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190927130402.687-1-ddstreet@canonical.com>
 <20190927181856.GD1804168@kroah.com>
 <CAOZ2QJNNnkM_0ZTULHOYGY2wEz1GxZWzHjosnM=j98zxZXUvYA@mail.gmail.com>
 <20190928074124.GD1836895@kroah.com>
In-Reply-To: <20190928074124.GD1836895@kroah.com>
From: Dan Streetman <ddstreet@canonical.com>
Date: Sat, 28 Sep 2019 09:28:47 -0400
Message-ID: <CAOZ2QJP2bf=MpKgnTaW4vbLAbOpivyXgdmcijGTMezOpJWaufQ@mail.gmail.com>
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

On Sat, Sep 28, 2019 at 3:41 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 27, 2019 at 03:48:49PM -0400, Dan Streetman wrote:
> > On Fri, Sep 27, 2019 at 2:19 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 27, 2019 at 09:04:02AM -0400, Dan Streetman wrote:
> > > > The dummy vio_bus_device creates the /sys/devices/vio directory, which
> > > > contains real vio devices under it; since it represents itself as having
> > > > a bus = &vio_bus_type, its /sys/devices/vio/uevent does call the bus's
> > > > .uevent function, vio_hotplug(), and as that function won't find a real
> > > > device for the dummy vio_dev, it will return -ENODEV.
> > > >
> > > > One of the main users of the uevent node is udevadm, e.g. when it is called
> > > > with 'udevadm trigger --devices'.  Up until recently, it would ignore any
> > > > errors returned when writing to devices' uevent file, but it was recently
> > > > changed to start returning error if it gets an error writing to any uevent
> > > > file:
> > > > https://github.com/systemd/systemd/commit/97afc0351a96e0daa83964df33937967c75c644f
> > > >
> > > > since the /sys/devices/vio/uevent file has always returned ENODEV from
> > > > any write to it, this now causes the udevadm trigger command to return
> > > > an error.  This may be fixed in udevadm to ignore ENODEV errors, but the
> > > > vio driver should still be fixed.
> > > >
> > > > This patch changes the arch/powerpc/platform/pseries/vio.c 'dummy'
> > > > parent device into a real dummy device with no .bus, so its uevent
> > > > file will stop returning ENODEV and simply do nothing and return 0.
> > > >
> > > > Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> > > > ---
> > > >  arch/powerpc/platforms/pseries/vio.c | 11 ++++-------
> > > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> > > > index 79e2287991db..63bc16631680 100644
> > > > --- a/arch/powerpc/platforms/pseries/vio.c
> > > > +++ b/arch/powerpc/platforms/pseries/vio.c
> > > > @@ -32,11 +32,8 @@
> > > >  #include <asm/page.h>
> > > >  #include <asm/hvcall.h>
> > > >
> > > > -static struct vio_dev vio_bus_device  = { /* fake "parent" device */
> > > > -     .name = "vio",
> > > > -     .type = "",
> > > > -     .dev.init_name = "vio",
> > > > -     .dev.bus = &vio_bus_type,
> > > > +static struct device vio_bus = {
> > > > +     .init_name      = "vio",
> > >
> > > Eeek, no!  Why are you creating a static device that will then be
> > > reference counted?  Not nice :(
> >
> > sorry!  I'll admit that I simply copied what drivers/base/platform.c
> > seemed to be doing.
>
> I don't see platform.c having a 'static struct device' anywhere in it,
> am I missing it in my searching?

no, you are right, what I meant was:

struct device platform_bus = {
        .init_name      = "platform",
};


>
> thanks,
>
> greg k-h
