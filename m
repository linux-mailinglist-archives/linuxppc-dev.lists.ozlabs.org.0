Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E752204DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:17:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B66cs3zvTzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZyjK/gL/; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B66bB5kQ7zDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:16:22 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id y2so1069069ioy.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4SDiMl73WoK0qCzA+owoObYiRwvKUwPuTaHQx1HZwRU=;
 b=ZyjK/gL/CsuxwOnL7dKW1hxu+cFoVsDvvd5Ci/sfMvABqsSDb10iDANtBwZIFtEeUg
 7Raz1MTRAc0v0wBKQeJZN3O2AujFjtZ2LuScyemqjqoUc1nRKl8lfhwLxfXZLcQA2cSM
 ynCDj03pPVgfkHSlrp+yzHEKsBUpf+H6+ZldsaFhUf/T5qZXTMz4Ds3h2ZzxydAeOmUS
 a4u6zJHlkp7BtNTId5BFLkhe4B53FMsBHogg2YbqH3EUGaqSpk9+PejUaO3uERz7GtaD
 C7oYtoxKMH+n/vxvxKfAE2/oG7Q/4Gle8GdSjJma06LkGXYDvZTPg3uO5bSgTHgPWLo0
 o8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4SDiMl73WoK0qCzA+owoObYiRwvKUwPuTaHQx1HZwRU=;
 b=Y9U7CS9QPPtifhXnEVjocHKsUYRST3mkoi7+WMo8pqSE4Ro1iBl/64as88MsYtZnWE
 ckBYy8mVpjyrR9npSnbZgtprRkOWD03uV/f+T9LB1nIgQs3bjYBTGw3URJp2nvGphTCE
 mLA7kOM8ZSurP2APYLBQTSO7MBlCuJ9eBGMX0Cv4rzT7gdJgwnwBWtZxJI8vOBz3DlXz
 C0YCd1BY27iCBFFdaofReqVn4/uHfGp8HiO8Y8WlP+UnXgQYrGda4IDphdqzUJ1U3d+Y
 H75h0XnnHEV6YU1BoIKkef1mEDf9MfGZSBxQpNw2sO6pE3ogNWWjjSlL8VaOiwWyUyvh
 d0bQ==
X-Gm-Message-State: AOAM533ml1WKDxf0rLBO5MgmKuWQK36F8J9bd7eYAe9TzCVNH1m5BfYT
 20DKgb65WWfVr4zutUxgZx5YKgaCvTg6+KfLc/85EHOim1U=
X-Google-Smtp-Source: ABdhPJwMsg9zod/Z0Ae8HpH360gNZQWBZ+2e8C6kX6PnPkSmo0dHJduWwAISPkyqzstJPt0UThqYHkJz5n6ZUrYGy0Y=
X-Received: by 2002:a05:6638:1442:: with SMTP id
 l2mr7811510jad.132.1594793778703; 
 Tue, 14 Jul 2020 23:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-16-oohall@gmail.com>
 <c89dfd04-afc2-4d69-00ab-2e743d5bb844@ozlabs.ru>
In-Reply-To: <c89dfd04-afc2-4d69-00ab-2e743d5bb844@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 16:16:07 +1000
Message-ID: <CAOSf1CHL9YoSohwMWm1YkLbLTqOn-WfBMKERZaPYb_5-UKmsuw@mail.gmail.com>
Subject: Re: [PATCH 15/15] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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

On Wed, Jul 15, 2020 at 3:24 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
> > @@ -158,9 +157,9 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
> >               goto disable_iov;
> >       pdev->dev.archdata.iov_data = iov;
> >
> > +     /* FIXME: totalvfs > phb->ioda.total_pe_num is going to be a problem */
>
>
> WARN_ON_ONCE() then?

can't hurt

> > @@ -173,50 +172,51 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
> >                       goto disable_iov;
> >               }
> >
> > -             total_vf_bar_sz += pci_iov_resource_size(pdev,
> > -                             i + PCI_IOV_RESOURCES);
> > +             vf_bar_sz = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
> >
> >               /*
> > -              * If bigger than quarter of M64 segment size, just round up
> > -              * power of two.
> > +              * Generally, one segmented M64 BAR maps one IOV BAR. However,
> > +              * if a VF BAR is too large we end up wasting a lot of space.
> > +              * If we've got a BAR that's bigger than greater than 1/4 of the
>
>
> bigger, greater, huger? :)
>
> Also, a nit: s/got a BAR/got a VF BAR/

whatever, it's just words

> > +              * default window's segment size then switch to using single PE
> > +              * windows. This limits the total number of VFs we can support.
>
> Just to get idea about absolute numbers here.
>
> On my P9:
>
> ./pciex@600c3c0300000/ibm,opal-m64-window
>                  00060200 00000000 00060200 00000000 00000040 00000000
>
> so that default window's segment size is 0x40.0000.0000/512 = 512MB?

Yeah. It'll vary a bit since PHB3 and some PHB4s have 256.

> >                *
> > -              * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
> > -              * with other devices, IOV BAR size is expanded to be
> > -              * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
> > -              * segment size , the expanded size would equal to half of the
> > -              * whole M64 space size, which will exhaust the M64 Space and
> > -              * limit the system flexibility.  This is a design decision to
> > -              * set the boundary to quarter of the M64 segment size.
> > +              * The 1/4 limit is arbitrary and can be tweaked.
> >                */
> > -             if (total_vf_bar_sz > gate) {
> > -                     mul = roundup_pow_of_two(total_vfs);
> > -                     dev_info(&pdev->dev,
> > -                             "VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
> > -                             total_vf_bar_sz, gate, mul);
> > -                     iov->m64_single_mode = true;
> > -                     break;
> > -             }
> > -     }
> > +             if (vf_bar_sz > (phb->ioda.m64_segsize >> 2)) {
> > +                     /*
> > +                      * On PHB3, the minimum size alignment of M64 BAR in
> > +                      * single mode is 32MB. If this VF BAR is smaller than
> > +                      * 32MB, but still too large for a segmented window
> > +                      * then we can't map it and need to disable SR-IOV for
> > +                      * this device.
>
>
> Why not use single PE mode for such BAR? Better than nothing.

Suppose you could, but I figured VFs were mainly interesting since you
could give each VF to a separate guest. If there's multiple VFs under
the same single PE BAR then they'd have to be assigned to the same
guest in order to retain the freeze/unfreeze behaviour that PAPR
requires. I guess that's how it used to work, but it seems better just
to disable them rather than having VFs which sort of work.
