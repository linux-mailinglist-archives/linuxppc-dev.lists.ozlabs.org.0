Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFBB4647
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XVLv4pvZzF41G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 14:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rK241p/k"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XVJr3zmrzF3vk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 14:20:25 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id m11so4434680ioo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEF8NySr0K6/Ijr+n5Et9s43PFDWSWV44y+495v7P7U=;
 b=rK241p/kv6mHQOFL9pdVV5n2yb162KV+wSSxJVOJVwj7hg7bn7yK1ongnhCxK9tbiu
 ANz4jL36+6LKLAugPF9JmmOpfcYWT337YWpiACesH/NISdj0DmQ5Ffz4h10wZHt01oXX
 sAS/ss40XAQtU+EL/uo+BBhHZqw9cpWZ9jk0gKfLWqSY1Bo9Y20wNhfB0SfdNAMqIwp/
 Kgnwn31iwGK4CNMrX1sE0Hr+0BApCbNhN/fiKw2KohWS1NZvMyCmb3LjMOUCJa1n5gJQ
 IDKxIkseliFFm6ZptkS8AJ0Ibvy/jUmLsIjG7UPKzNvFRv5XFuESw5TH+H5DwDxKi+JY
 xCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEF8NySr0K6/Ijr+n5Et9s43PFDWSWV44y+495v7P7U=;
 b=KpyYebzSY4gXRtFuYf6CzJamHxXnVzR7RovH60rNp4YUEn6KgxV1EULyH3BySFJ98G
 8G33w8EKTWVI/avjBaF++k+SSpklsr29oIHzgGr/WT8bbyfPhWY9u6eOBZxjq/K16rj8
 8+7J34dCXBwGQnbQotj1XsrpAXs/3qH1cNiXuDuBlmp0II4+uaFgj6yc9MMi0ATC1SsA
 c0luQAhah/yUYcBD1LUdNlBVuCXNmQ9YduQC57cfCqFPTfQKX/ILj6NeFqhyq6+77cNA
 rO169zGflWUfap+K25BTjuBPZpbwFF5pN1FXKQCPec6YoZJrdttGNA8Gt58IAHt0WlgC
 eX6Q==
X-Gm-Message-State: APjAAAWciKVkpHD4RuFADlzZoJaJDGM/J1geUihD53r7bbtimGf1HaAq
 Bf5R8pyJUZkKRBqHZyEUjqZmMmC7mLauyGeCBKo=
X-Google-Smtp-Source: APXvYqyBLX8EeRvvn0RubwkObD/WmlaNhIatCpHUa82vAaXOKh55xGSLo+kHkqnMQ2yoZkH6t7N63y6JB82bA1PhaFg=
X-Received: by 2002:a05:6638:6b2:: with SMTP id
 d18mr1873618jad.61.1568694022446; 
 Mon, 16 Sep 2019 21:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-5-oohall@gmail.com>
 <20190917010048.GD21303@tungsten.ozlabs.ibm.com>
In-Reply-To: <20190917010048.GD21303@tungsten.ozlabs.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 17 Sep 2019 14:20:11 +1000
Message-ID: <CAOSf1CEE9wsLkjuUMgYwd-D+JVbV3QTmmiauXEKNo2G5KBjpLg@mail.gmail.com>
Subject: Re: [PATCH 04/14] powerpc/eeh: Check slot presence state in
 eeh_handle_normal_event()
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 11:01 AM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Tue, Sep 03, 2019 at 08:15:55PM +1000, Oliver O'Halloran wrote:
> > When a device is surprise removed while undergoing IO we will probably
> > get an EEH PE freeze due to MMIO timeouts and other errors. When a freeze
> > is detected we send a recovery event to the EEH worker thread which will
> > notify drivers, and perform recovery as needed.
> >
> > In the event of a hot-remove we don't want recovery to occur since there
> > isn't a device to recover. The recovery process is fairly long due to
> > the number of wait states (required by PCIe) which causes problems when
> > devices are removed and replaced (e.g. hot swapping of U.2 NVMe drives).
> >
> > To determine if we need to skip the recovery process we can use the
> > get_adapter_state() operation of the hotplug_slot to determine if the
> > slot contains a device or not, and if the slot is empty we can skip
> > recovery entirely.
> >
> > One thing to note is that the slot being EEH frozen does not prevent the
> > hotplug driver from working. We don't have the EEH recovery thread
> > remove any of the devices since it's assumed that the hotplug driver
> > will handle tearing down the slot state.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>
> Looks good, but some comments, below.
>
> > ---
> >  arch/powerpc/kernel/eeh_driver.c | 60 ++++++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> > index 18a69fac4d80..52ce7584af43 100644
> > --- a/arch/powerpc/kernel/eeh_driver.c
> > +++ b/arch/powerpc/kernel/eeh_driver.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/irq.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > +#include <linux/pci_hotplug.h>
> >  #include <asm/eeh.h>
> >  #include <asm/eeh_event.h>
> >  #include <asm/ppc-pci.h>
> > @@ -769,6 +770,46 @@ static void eeh_pe_cleanup(struct eeh_pe *pe)
> >       }
> >  }
> >
> > +/**
> > + * eeh_check_slot_presence - Check if a device is still present in a slot
> > + * @pdev: pci_dev to check
> > + *
> > + * This function may return a false positive if we can't determine the slot's
> > + * presence state. This might happen for for PCIe slots if the PE containing
> > + * the upstream bridge is also frozen, or the bridge is part of the same PE
> > + * as the device.
> > + *
> > + * This shouldn't happen often, but you might see it if you hotplug a PCIe
> > + * switch.
> > + */
>
> I don't think the function name is very good; it does check the slot but
> it doesn't tell you what a true result means -- but I don't see an
> obviously great alternative either. If it can return false positives, it's
> really testing for empty so maybe 'eeh_slot_definitely_empty()' or
> 'eeh_slot_maybe_populated()'?

I don't see a better name either. I thought the meaning was fairly
clear when looked at in the context of the caller though.

> > +     /*
> > +      * When devices are hot-removed we might get an EEH due to
> > +      * a driver attempting to touch the MMIO space of a removed
> > +      * device. In this case we don't have a device to recover
> > +      * so suppress the event if we can't find any present devices.
> > +      *
> > +      * The hotplug driver should take care of tearing down the
> > +      * device itself.
> > +      */
> > +     eeh_for_each_pe(pe, tmp_pe)
> > +             eeh_pe_for_each_dev(tmp_pe, edev, tmp)
> > +                     if (eeh_slot_presence_check(edev->pdev))
> > +                             devices++;
>
> In other parts of the EEH code we do a get_device() on edev->pdev before
> passing it around, it might be good to do that here too.

I don't see any calls to get_device (or pci_dev_get) in arch/powerpc/kernel/

I agree that we probably should be taking a ref to the pci_dev, but
IIRC you we're working on a series to do just that so I figured I
should keep things in line with what's there currently.

> > +     if (!devices)
> > +             goto out; /* nothing to recover */
>
> Does this handle an empty, but frozen, PHB correctly? (Can that happen?)

Probably not, but I don't think we handle the case well (at all?)
currently. In order to start the recovery process we need something to
flag that an error has occurred on the PHB and without a device being
present I don't see where that would come from. It might work on P8
where we have PHB error interrupts, but I don't think those can fire
if the PHB is fenced.

Oliver
