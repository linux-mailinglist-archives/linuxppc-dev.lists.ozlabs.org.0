Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60D323598
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 03:18:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlfjW1D1Yz3cS9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 13:18:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QThEKmeq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QThEKmeq; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dlfj308YJz30QT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 13:18:12 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id m144so810028qke.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 18:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wm67GfD4ghS4rrBiHt9rr9H+zSi6V630GZ7MQ8Ue9cM=;
 b=QThEKmeqx8/5I6Cx7mN72ulibj2TYyeKp+hqrDP91Txb35ER110MMLL/bIaxzdNKlL
 X9m7bwBsiX3oKljOI4rbiYNPrwSdgcTZuKBg1SOZBFXHz70A/dnq71LCkg/K4P3V5DnB
 zRdfupLRhAVZxbKpVTFw97kc9GgIild9KuxG8hwecfpHgh1xf3d7xFIRh0kQvsZyIw8E
 cfrwU89LDBt/6+oW0K9IjabBIH6AHAENNOHwhDH/gPh021YuCxryZ3PZTXmFZR0jFib5
 ABK5vv2OLElP/hnAp9WVShfLSthuqEPcUUbqKnIbG6d6xhzewgTZyvRamXT6EvRMiLs7
 IUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wm67GfD4ghS4rrBiHt9rr9H+zSi6V630GZ7MQ8Ue9cM=;
 b=WcmJYVyuox6riYz+B/bjryeqKpR4uBdBTqsZx/0SeqL7EY5MaBenQWN+RtwebijbGZ
 cROou6NvR5LpSRwJLXH6nf5AoprLouiInIX/CX7WAoVHGPqn5rKRW6GVOxFM8ygvu7m3
 Rws+U4Lc+rwMrtAwmMSToJJIjHuKiC5sCKIDCyFMkkfpLFObYRUipfW50zvc8dsWNtXa
 VGigfqC/VKQE6eJN0/x5E/Ofn4BsgCVGcrfI8d108rGsa6cWDM5DSGeOPKeHT+jy2RoN
 YWr9tOz1e4372brSL7T7kj6BaGiMg3vMEfV729xbWB5VzXlq70PDWtv8msjbZBYH1Umc
 HwBw==
X-Gm-Message-State: AOAM532pHHbwPATALkx4G7SKKwzRa0FzlqT6wp/44Cs6nd+vqWPxKo6A
 SHU8T3eEC0HM6W72Rc6ipLBPsalI0GrsGN/hN3E=
X-Google-Smtp-Source: ABdhPJwjdOgT1uZepQw6sPBJB9XvPbJWPfmpVmXlSJf6x9z7ZjnZl5ynsuqOGzKTbbd6jQivBkWIalIdTtI95ERiml0=
X-Received: by 2002:a05:620a:1193:: with SMTP id
 b19mr25524981qkk.143.1614133088766; 
 Tue, 23 Feb 2021 18:18:08 -0800 (PST)
MIME-Version: 1.0
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
In-Reply-To: <877dmythcr.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Feb 2021 13:17:57 +1100
Message-ID: <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
Subject: Re: [PASEMI] Nemo board doesn't boot anymore because of moving
 pas_pci_init
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 11:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Olof Johansson <olof@lixom.net> writes:
> > Hi,
> >
> > On Tue, Feb 23, 2021 at 1:43 PM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >>
> >> Hello,
> >>
> >> The Nemo board [1] with a P.A. Semi PA6T SoC doesn't boot anymore
> >> because of moving "pas_pci_init" to the device tree adoption [2] in the
> >> latest PowerPC updates 5.12-1 [3].
> >>
> >> Unfortunately the Nemo board doesn't have it in its device tree. I
> >> reverted this commit and after that the Nemo board boots without any
> >> problems.
> >>
> >> What do you think about this ifdef?
> >>
> >> #ifdef CONFIG_PPC_PASEMI_NEMO
> >>          /*
> >>           * Check for the Nemo motherboard here, if we are running on one
> >>           * then pas_pci_init()
> >>           */
> >>          if (of_machine_is_compatible("pasemi,nemo")) {
> >>                  pas_pci_init();
> >>          }
> >> #endif
> >
> > This is not a proper fix for the problem. Someone will need to debug
> > what on the pas_pci_init() codepath still needs to happen early in the
> > boot, even if the main PCI setup happens later.
>
> I looked but don't see anything 100% obvious.
>
> Possibly it's the call to isa_bridge_find_early()?

Looks like it. I think the problem stems from the use of the PIO
helpers (mainly outb()) in i8259_init() which is called from
nemo_init_IRQ(). The PIO helpers require the ISA space to be mapped
and io_isa_base to be set since they take a PIO register address
rather than an MMIO address. It looks like there's a few other legacy
embedded platforms that might have the same problem.

I guess the real fix would be to decouple the ISA base address
discovery from the PHB discovery. That should be doable since it's all
discovered via DT anyway and we only support one ISA address range,
but it's a bit of work.
