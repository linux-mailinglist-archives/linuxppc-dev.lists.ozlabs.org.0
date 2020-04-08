Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5951A1C0A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 08:55:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xw5R1QTGzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 16:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JwE1cwG9; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xw3j1DfdzDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 16:53:50 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id a6so5754769ilr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 23:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/saOn6WLlO7zUwWonZp+kDvQD0TyTfUP0yErQ9sPyg=;
 b=JwE1cwG9imdl1lI0qyjO6/+AiEFt5Y+/OrRUULVPcVnAbg8EJiIAYYa4Igzb3kQkME
 T6cG2aGr+wCoMBOgsXYAliGDBvQRQ2VXYRipQSp76OpKqH0rkAs0Hx9HfJOIJyOKFFF3
 QZkBcGW6hmWuXSZTW1bJMxhnVJ4eHfmD6Vfa9voeus5z8yXKL9eY9dIgWS/Hs3qmNA2q
 R8I6eb6JzNNTnJHZa6JSUlb74sBPTQCW9RJKRrz2P8jqrj0NA8FQuL8/N1W5tM7uNex1
 VAJ30vm0f3fHymPCade6qPGbPiIoO/BILsBs9MHmC9YN5+iFImvNIDTNUOA4oAyhM0yN
 0how==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/saOn6WLlO7zUwWonZp+kDvQD0TyTfUP0yErQ9sPyg=;
 b=py4a4064cAQ5THrUNv8TdRY6g4dz9JB0qzLe/IaC9nDA2GK4T5KIwqxqH/Di8VIuJE
 GLNPNi+zHIgNGYuCkvTO0x+pZ8qZs22nwL8ToqHdxj4GorDo+IkeeF3acA4DylKsbwkL
 M9aqKVORRKc5nmlBsuXdLhvH6DNfdbqj4lV1UZbmuSKkJdr0dzDWMCeoym9LEgvh8pSh
 8qLVtzVkoeeskeQ9H285CmSzMxLbzsfwXEfMRLDcTohsxjYztcq4JYLEFfJ+9v1O1+X6
 o8BL5X9N0BRbe2EOr9ZxM5lGwYq+usvYuTiK8SK1/cf6jv32xVZfYMO6DAyEhPkmp3Oc
 +7QQ==
X-Gm-Message-State: AGi0PuYvehV9F4fAQEK6cGQw6rSgcB4KmM3k03PEHNk1fw9dsIdu7viz
 P/fovafj81OMACpVgWHvrG2Tsmhvp9VfxvOTcSPFHw==
X-Google-Smtp-Source: APiQypKlS+pkPkHPMQ5bqY+8rCHxLKAqOQJ8rXxPQgkrvPeJWEC87OpBnipdJeusnp8bKBB5as6zlajNlbQrScKzDg4=
X-Received: by 2002:a92:443:: with SMTP id 64mr6577423ile.258.1586328827269;
 Tue, 07 Apr 2020 23:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <252491a9c3fb015383ac757220c5df43d168fe4e.1585544197.git.sbobroff@linux.ibm.com>
 <c7e81c27a6da9f7a4266cec9995b597bce4efc7b.camel@gmail.com>
 <20200408062159.GB25852@osmium>
In-Reply-To: <20200408062159.GB25852@osmium>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 8 Apr 2020 16:53:36 +1000
Message-ID: <CAOSf1CHA+ZzWpLtuPrvkOvWO13Dikv86UjiBdppyG4GrexGSpA@mail.gmail.com>
Subject: Re: [PATCH 3/4] powerpc/eeh: Remove workaround from
 eeh_add_device_late()
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

On Wed, Apr 8, 2020 at 4:22 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Fri, Apr 03, 2020 at 05:08:32PM +1100, Oliver O'Halloran wrote:
> > On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> > > When EEH device state was released asynchronously by the device
> > > release handler, it was possible for an outstanding reference to
> > > prevent it's release and it was necessary to work around that if a
> > > device was re-discovered at the same PCI location.
> >
> > I think this is a bit misleading. The main situation where you'll hit
> > this hack is when recovering a device with a driver that doesn't
> > implement the error handling callbacks. In that case the device is
> > removed, reset, then re-probed by the PCI core, but we assume it's the
> > same physical device so the eeh_device state remains active.
> >
> > If you actually changed the underlying device I suspect something bad
> > would happen.
>
> I'm not sure I understand. Isn't the case you're talking about caught by
> the earlier check (just above the patch)?
>
>         if (edev->pdev == dev) {
>                 eeh_edev_dbg(edev, "Device already referenced!\n");
>                 return;
>         }

No, in the case I'm talking about the pci_dev is torn down and
freed(). After the PE is reset we re-probe the device and create a new
pci_dev.  If the release of the old pci_dev is delayed we need the
hack this patch is removing.

The check above should probably be a WARN_ON() since we should never
be re-running the EEH probe on the same device. I think there is a
case where that can happen, but I don't remember the details.

Oliver
