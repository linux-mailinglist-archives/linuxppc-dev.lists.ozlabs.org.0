Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E461821E7C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:00:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5VGv1cxdzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uykS8ZY4; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5VF50g3YzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:58:32 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id l1so16082369ioh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 22:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lEQiTKGfsKn6GiZqFQW0gj62PTpsSis2GUTQxZh3bU=;
 b=uykS8ZY4BSYHyE6E2DlLoNR/xKglZ9/QYuB1UQlYXk0a1+X50e0yitgEkqOTid3fAr
 8YWrukQNv6PUjq9w/gP3v2ubdLexPGZA1lAdgEhGr6jrTVhqAnUcXSD066wXuh6VmsW+
 HMSyf2Fsw+mKbxNaUddxklsxWo8sMmfRjGD/o6bzpxM0NNVZkxDdrMl4IUQ+gFS17CHN
 qq5RNOLOb+30elm02WwVTQahjlIPYXY4B/xxOzuE+wJPV9+RqnCKItzPR4v0Eor/6VW6
 5S+R+hURg4ib9f6JZTXVAS9Q+Dh0BedzmziEMYb7jXPgMgrCNyqVrn3nTXGCtlAbM3vF
 iAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lEQiTKGfsKn6GiZqFQW0gj62PTpsSis2GUTQxZh3bU=;
 b=tOx1AfFD6PNlEjs3lyq43HyU8EXhXki8lfMNzwQXaW4Nsbhngdvv7MoP1ISk3TLMYi
 M3AITZVGm7KN+p5J2ZfgslkaHypTUkMOUOMibJyL5omCVMy1iD0xuiAy+c9GG4K81uBj
 wSX0OByMfoumFnkopyQZRgaYpyDXnV/4SwSIgmbYoMvA1pFacopc0ladVHk3SpYU4yB2
 dcw+zjJBxUp5Xmp7q6IP4ejnxuYny8QCbi8SuZgZ8zHtgJF4QYAsVYo+8LGu4Q+vaaM8
 HEwXrRYOBM7q9cvSnMqKENFyu9b4XFILYhjxUDM4sZnXFpWh37WbKj8htvNOwwEbD68h
 bh6g==
X-Gm-Message-State: AOAM530lfwgnYV2tZD0YdQzVuh1dopMrZNDEV1sEhCvrwUB55AStl4Ql
 i5vMOrEYghlluqb7PkCZBtR/rIMH8JIPNAapbbt3jL83
X-Google-Smtp-Source: ABdhPJzb2OSehjiT4Rb5hBdJTOIlc+bo7pgKFqXBnKucKI8LUty7MO33sj4Iver47eKIzhi4QEv/ZGOidYkBrmcCsEU=
X-Received: by 2002:a5d:8853:: with SMTP id t19mr3469552ios.73.1594706309231; 
 Mon, 13 Jul 2020 22:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-4-oohall@gmail.com>
 <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
In-Reply-To: <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 14 Jul 2020 15:58:18 +1000
Message-ID: <CAOSf1CESRPypebf6+rnkZkNmi6+xL4+QP1xgAS1szGsZDBcs8A@mail.gmail.com>
Subject: Re: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the
 DMA setup state
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

On Tue, Jul 14, 2020 at 3:37 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> On 10/07/2020 15:23, Oliver O'Halloran wrote:
> > There's an optimisation in the PE setup which skips performing DMA
> > setup for a PE if we only have bridges in a PE. The assumption being
> > that only "real" devices will DMA to system memory, which is probably
> > fair. However, if we start off with only bridge devices in a PE then
> > add a non-bridge device the new device won't be able to use DMA  because
> > we never configured it.
> >
> > Fix this (admittedly pretty weird) edge case by tracking whether we've done
> > the DMA setup for the PE or not. If a non-bridge device is added to the PE
> > (via rescan or hotplug, or whatever) we can set up DMA on demand.
>
> So hotplug does not work on powernv then, right? I thought you tested it
> a while ago, or this patch is the result of that attempt? If it is, then

It mostly works. Just the really niche case of hot plugging a bridge,
then later on hot plugging a device into the same bus which wouldn't
work.

> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
>
> > This also means the only remaining user of the old "DMA Weight" code is
> > the IODA1 DMA setup code that it was originally added for, which is good.
>
>
> Is ditching IODA1 in the plan? :)

That or separating out the pci_controller_ops for IODA1 and IODA2 so
we can stop any IODA2 specific changes from breaking it. For the most
part keeping around IODA1 support isn't hurting anyone, but I wanted
to re-work how the BDFN->PE assignment works so that we'd delay
assigning a BDFN to a PE until the device is probed. Right now when
we're configuring the PE for a bus we map all 255 devfn's to that PE.
This is mostly fine, but if you do a bus rescan and there's no device
present we'll get a spurious EEH on that PE since the PHB sees that
there's no device responding to the CFG cycle. We stop the spurious
EEH freeze today by only allowing config cycles if we can find a
pci_dn for that bdfn, but I want to get rid of pci_dn.

Mapping each BDFN to a PE after the device is probed is easy enough to
do on PHB3 and above since the mapping is handled by an in-memory
table which is indexed by the BDFN. Earlier PHBs (i.e. IODA1) use a
table of bask & mask values which match on the BDFN, so assigning a
whole bus at once is easy, but adding individual BDFNs is hard. It's
still possible to do in the HW, but the way the OPAL API works makes
it impossible.

> >
> > Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> > Alexey, do we need to have the IOMMU API stuff set/clear this flag?
>
>
> I'd say no as that API only cares if a device is in a PE and for those
> the PE DMA setup  optimization is skipped. Thanks,

Ok cool.
