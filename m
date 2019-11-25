Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ECB10881B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 06:04:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lw2014mZzDqJN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 16:04:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ruvdO8Kv"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LvBg02nwzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 15:27:06 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id v17so9063185ilg.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 20:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jfC3OQNifs9t/eB38l7Wn1nVSOa8PuYaK6Vwbni4I3k=;
 b=ruvdO8KvAoEtezFgCb1Msln+nbHdbnmuo7/U5NcFAI25FNg2yXCI9Ss6NsJ+/dCKp5
 abzV3F67VNoQMqMFkVgPIThAop+1ROckAjPgFVg4lin/ruRamSgNmwqOTMQ8LLWqTcPX
 1v61MzOC6qYSL6UnKEhyxKljAZvfHb6ry5bNP6rExclFlLFB+FzJcYuA9M8EorqC1T0W
 p1KDvdCTNTjwk7YUffr/3oybDy7xLfqK8I57v2gjaaUD7iYmHTAyyoXzPQWJBhLmKD46
 eQr/DxX9ghFjSB5r2Mq4MYr+eASS18GA4T9pbla55ZCZyg3GwRgDtVlXmSj4GMcuVGf/
 sDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfC3OQNifs9t/eB38l7Wn1nVSOa8PuYaK6Vwbni4I3k=;
 b=cUxRVXK7SzLyKUnApS3DsB8LDpt9+WRkVZUbcR18vmPIItCUWOYoccRz3MhSjdtJpm
 Y/tWc83Zmy3XUN+vDOdze04rR3upUJKRjvARObPVrW1Kaq1jHbAu2P+OJ9r/obyYGwby
 +2Oozqmig6a8Rba8XrHG0C4fdSCudxUGytMeOk+XPrmUDwDhAl2yd9ST15XC9Md8Qi6w
 5OhKcOyIxESNmzBXzlfxdxLoBEQg/Tda+o9sGAD2mVhOQKwNOBWrt9qnnoakOhf/OG0m
 zO8OKh4Zk0e8PIvueTjzC1ZY2fhWpso+1vCrWIVsQV3BhF6lqLWdf9LxTFAfZvbys+uw
 fSJg==
X-Gm-Message-State: APjAAAXGAO27xslP+Fs0HyODdkiP1+uWvjAiDJh0S1FuUyF4877HbOJf
 qfGRFe1cxKSeg4Hj2TZl6fan+HfTIg4lLffXmYo=
X-Google-Smtp-Source: APXvYqyjh0EqasFgxWH33sb4NcCIpSBy28K7JR2yK0w/f2S0qQatdecFxCAq2RXRnNon4xFncgCjOkdJvfmJPdAAwuA=
X-Received: by 2002:a92:3943:: with SMTP id g64mr15395088ila.298.1574656022939; 
 Sun, 24 Nov 2019 20:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-23-oohall@gmail.com>
 <f150f51d-e2da-f77a-5e8b-b735801d12da@ozlabs.ru>
In-Reply-To: <f150f51d-e2da-f77a-5e8b-b735801d12da@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 25 Nov 2019 15:26:51 +1100
Message-ID: <CAOSf1CG6X-KzO_sf+s9YSTkH-FYaiwmB36YFK-okx45kYUjxAQ@mail.gmail.com>
Subject: Re: [Very RFC 22/46] powernv/eeh: Allocate eeh_dev's when needed
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
Cc: Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 25, 2019 at 2:27 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> > Have the PowerNV EEH backend allocate the eeh_dev if needed rather than using
> > the one attached to the pci_dn.
>
> So that pci_dn attached one is leaked then?

Sorta, the eeh_dev attached to the pci_dn is supposed to have the same
lifetime as the pci_dn it's attached to. Whatever frees the pci_dn
should also be freeing the eeh_dev, but I'm pretty sure the only
situation where that actually happens is when removing the pci_dn for
VFs. It's bad.

> > This gets us most of the way towards decoupling
> > pci_dn from the PowerNV EEH code.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> > We should probably be free()ing the eeh_dev somewhere. The pci_dev release
> > function is the right place for it.
> > ---
> >  arch/powerpc/platforms/powernv/eeh-powernv.c | 22 ++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > index 1cd80b399995..7aba18e08996 100644
> > --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> > +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > @@ -366,10 +366,9 @@ static int pnv_eeh_write_config(struct eeh_dev *edev,
> >   */
> >  static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
> >  {
> > -     struct pci_dn *pdn = pci_get_pdn(pdev);
> > -     struct pci_controller *hose = pdn->phb;
> > -     struct pnv_phb *phb = hose->private_data;
> > -     struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
> > +     struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> > +     struct pci_controller *hose = phb->hose;
> > +     struct eeh_dev *edev;
> >       uint32_t pcie_flags;
> >       int ret;
> >       int config_addr = (pdev->bus->number << 8) | (pdev->devfn);
> > @@ -415,12 +414,27 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
> >       if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
> >               return NULL;
> >
> > +     /* otherwise allocate and initialise a new eeh_dev */
> > +     edev = kzalloc(sizeof(*edev), GFP_KERNEL);
> > +     if (!edev) {
> > +             pr_err("%s: out of memory lol\n", __func__);
>
> "lol"?

yeah lol

I am pretty sure we do not have to print anything if alloc failed
> as alloc prints an error anyway. Thanks,

It does? Neat.
