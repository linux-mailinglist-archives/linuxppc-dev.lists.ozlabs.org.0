Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F408610881E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 06:11:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lw9l01L5zDqF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 16:11:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eow5KXVR"; 
 dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LvX368krzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 15:42:11 +1100 (AEDT)
Received: by mail-il1-x143.google.com with SMTP id q15so12941532ils.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 20:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/SpM38MUmnkiJ9mCGzLv5Th991siNYw2QE/6UR3xUk=;
 b=Eow5KXVRycnITJA4KkQGN4DyQzdzn2Ryznnr3Df8qNlwtaiIZRxMGrRx/Gh14aWwOM
 GaDkiMG1a3AphfC30lupDYin2woSzJnMTTeT/BFpuBEW1UnrvUwy/fsSjjBby8JJa4mr
 fKQ/qiluR3NRWRLobGmnIf5HT9QIlPbrytj31Z4augeOUthaXZrAGQ+EaV0VrXBPHQOJ
 ekx81cXCoGkowBZPOYJotGuMjj+CdfRNPlmlgbqzd+BEiyKo9GLh5S4vdBVxnXSen320
 XVGaKlKFi9gf/ys4TwaQAISErAHn5SoP6EBkMvzJm+uPXwfg7nH6QvcjWmyhoV8Sdd8R
 S3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/SpM38MUmnkiJ9mCGzLv5Th991siNYw2QE/6UR3xUk=;
 b=BsWobIsKve/S/A2WnSattv5O2X9UhtAV3cAWGZckJ9egrF6Bve3MkGfb4NW8UTlOHF
 mCBqUAI7+K5TXLRNou+xrCx/3Ue/tzRrBANwb0Vfp0W8nPX9k4yEAif4dloAcQeluvtL
 bVCJRJuLxIMlLgQ7aLLntLvT/zdzuZnau3pIUdj5BoJZ6xyrEZJ9sqjstkQ3ZXilr3pt
 5dJ0aNhiqBFXaTJyC/ueyaabW5YC8IU+8248pKPFFGU2nwkWFwWXbrKuzKUuxKv3VqOR
 Kim0FZQfjxWc6CmB5vMUdaUGbu2xN435xUeSS164ZUlFm7N5tuf0PqP14lI//5cLgseY
 HNDQ==
X-Gm-Message-State: APjAAAWFWdN4m0G/PHVlNFBOVyovi+SHTgEbBX0UO54By3NT9oX53GKO
 xxUSD7S8ILPwYVZIIubRj+iYOR0lBOW/7/nZCLXoPQ==
X-Google-Smtp-Source: APXvYqyk2USwKI6VTYNAw9Xq3rcc1miF5uKvhgVYIdbXf5/MqTEHc5Kg7VUyv0B7PHf/HgTXMQtg7hkxYVmj4UFU4Ro=
X-Received: by 2002:a05:6e02:152:: with SMTP id
 j18mr32236851ilr.293.1574656929597; 
 Sun, 24 Nov 2019 20:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-7-oohall@gmail.com>
 <31213003-c6c4-001e-74b9-298e584ef58e@ozlabs.ru>
In-Reply-To: <31213003-c6c4-001e-74b9-298e584ef58e@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 25 Nov 2019 15:41:58 +1100
Message-ID: <CAOSf1CHcs9OV-0r9LwY=v6-2fdPW6KXe07ri65MWgHhwt5ynvg@mail.gmail.com>
Subject: Re: [Very RFC 06/46] powerpc/iov: Move VF pdev fixup into
 pcibios_fixup_iov()
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

On Thu, Nov 21, 2019 at 3:34 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> > Move this out of the PHB's dma_dev_setup() callback and into the
> > ppc_md.pcibios_fixup_iov callback. This ensures that the VF PE's
> > pdev pointer is always valid for the whole time the device is
> > added the bus.
>
> Yeah it would be nice if dma setup did just dma stuff.
>
> > This isn't strictly required, but it's slightly a slightly more logical
>
> s/slightly a slightly/slightly (slightly)/ ? :)
>
>
> > place to do the fixup and it makes dma_dev_setup a bit simpler.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >  arch/powerpc/platforms/powernv/pci-ioda.c | 35 +++++++++++------------
> >  1 file changed, 17 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> > index 45f974258766..c6ea7a504e04 100644
> > --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> > +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> > @@ -2910,9 +2910,6 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
> >       struct pci_dn *pdn;
> >       int mul, total_vfs;
> >
> > -     if (!pdev->is_physfn || pci_dev_is_added(pdev))
> > -             return;
> > -
> >       pdn = pci_get_pdn(pdev);
> >       pdn->vfs_expanded = 0;
> >       pdn->m64_single_mode = false;
> > @@ -2987,6 +2984,22 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
> >               res->end = res->start - 1;
> >       }
> >  }
> > +
> > +static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
> > +{
> > +     if (WARN_ON(pci_dev_is_added(pdev)))
> > +             return;
> > +
> > +     if (pdev->is_virtfn) {
> > +             /* Fix the VF PE's pdev pointer */
> > +             struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
> > +             pe->pdev = pdev;
> > +
> > +             WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
>
>
> return;
>
> > +     } else if (pdev->is_physfn) {
>
>
>
> > +             pnv_pci_ioda_fixup_iov_resources(pdev);
>
>
> and open code pnv_pci_ioda_fixup_iov_resources() right here?

pnv_pci_ioda_fixup_iov_resources() is pretty hairy so I'd rather keep
it as a separate function. I'd like to get rid of it entirely at some
point, but that's a problem for another day.
