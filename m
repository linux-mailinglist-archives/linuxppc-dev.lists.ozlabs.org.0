Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FC1086F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 05:19:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lv2G3MhmzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 15:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j09ePQ4C"; 
 dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lv0M1z0tzDqV9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 15:18:11 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id s5so12925857iln.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 20:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1LdY682YPm+mPF1FBvxInHeIx6bxuw6kEf2NFU4E6rQ=;
 b=j09ePQ4COwSWV/1fchVfnu8kN9nQTFbfQ+xdCjcFXgvYjETJEOx4AhpS1X+Xyzswg0
 OpIBX9zLtGQ564aAV9q+xq1jSlz3BycilajJrcV0q9ZEzviBEvYB+ZYjqZAEa3uW2q8H
 2Cw8SftHiA4uJ1MRSnejop0nxWHulRYumSKTiOxDcViVUb/EpFc28YcI7yXI7rUFUJ91
 OShOxoTEJMEudKdFKdvR8jS0Ogfy1urGdLN5JRjusl/jNJiDX1kUBg7h2e8S0hM7tZ10
 xw37Ry/PgQkBK9aePBAKj+B3s1H+2ecrcodUvARQ5KNO1USd8A9UZ9NsPrES9VmXOkuV
 PP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LdY682YPm+mPF1FBvxInHeIx6bxuw6kEf2NFU4E6rQ=;
 b=rau4zy8GmDvGiGCOzIa4a7i79txItSNPpPKSAzaEviEUzA122LOQ4NbRXLzNu4ZgcA
 D5GA7hFsJNsn0ns76GVuI7oX6vvzPegqNsY34R9Hm7KyyNf70tNeC4eRNrOMqmNbvi48
 flkUKtnaBvQHxsk1JJ99q9JmhbpgCBZGcQx5bvZ/y1iZBpReauiOJCW9XP5gd/JsTeoR
 GTnTVlh+e/3mhZDbhiz+LXbPbf0Lk7ehTN9Xazxlv4r4LWP99+1zfY/xom4dTKZPViPW
 NRh8D0EwEtFV/TFFvX/h9msD4/VmiCpOdMhSeZkXSrxOYZ7EfByiY0Gn5EDFZo/CVBWq
 M75g==
X-Gm-Message-State: APjAAAWrmTpzEgiHFMJe5jF9nPV2cfGy7mcGHeOEaswgGPY0N7xs2CQs
 R+neHA5yfuL/WFWbI4YjCnsuoXCJ0j/zJm5XLYDyVgPu
X-Google-Smtp-Source: APXvYqwgwJEDdBwTfMIbw6IDcrxCgGJmIlE9gBer9k8rJA6qlZN6Mf8o/ImTjA+6WZdfFCI+czPqvolQDsaOO+QBgVc=
X-Received: by 2002:a92:7e18:: with SMTP id z24mr29915869ilc.276.1574655488180; 
 Sun, 24 Nov 2019 20:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-22-oohall@gmail.com>
 <27e9f3a4-2b44-19f2-70c3-3aadb53ee622@ozlabs.ru>
In-Reply-To: <27e9f3a4-2b44-19f2-70c3-3aadb53ee622@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 25 Nov 2019 15:17:57 +1100
Message-ID: <CAOSf1CHFrfFSiaUiQwEC35=Rckx+CyLL4dZJoSD0h_Z_PpNd8A@mail.gmail.com>
Subject: Re: [Very RFC 21/46] powernv/eeh: Rework finding an existing edev in
 probe_pdev()
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

On Mon, Nov 25, 2019 at 2:20 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> > Use the pnv_eeh_find_edev() helper to look up the eeh_dev for a device
> > rather than doing it via the pci_dn.
>
> This is not what the patch does. I struggle to see what is that thing
> really.

Hmm, looks like a rebase screw up. This patch and the following one
(22/46) used to be one patch, but I thought it was getting a bit large
and split them.

> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >  arch/powerpc/platforms/powernv/eeh-powernv.c | 44 ++++++++++++++------
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > index 6ba74836a9f8..1cd80b399995 100644
> > --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> > +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > @@ -374,20 +374,40 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
> >       int ret;
> >       int config_addr = (pdev->bus->number << 8) | (pdev->devfn);
> >
> > +     pci_dbg(pdev, "%s: probing\n", __func__);
> > +
> >       /*
> > -      * When probing the root bridge, which doesn't have any
> > -      * subordinate PCI devices. We don't have OF node for
> > -      * the root bridge. So it's not reasonable to continue
> > -      * the probing.
> > +      * EEH keeps the eeh_dev alive over a recovery pass even when the
> > +      * corresponding pci_dev has been torn down. In that case we need
> > +      * to find the existing eeh_dev and re-bind the two.
> >        */
> > -     if (!edev || edev->pe)
> > -             return NULL;
> > +     edev = pnv_eeh_find_edev(phb, config_addr);
>
>
> What was @edev before this line?

22/46 has the following hunk which should probably be in this patch:

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c
b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 1cd80b3..7aba18e 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -366,10 +366,9 @@ static int pnv_eeh_write_config(struct eeh_dev *edev,
  */
 static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 {
-       struct pci_dn *pdn = pci_get_pdn(pdev);
-       struct pci_controller *hose = pdn->phb;
-       struct pnv_phb *phb = hose->private_data;
-       struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
+       struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
+       struct pci_controller *hose = phb->hose;
+       struct eeh_dev *edev;

> > +     if (edev) {
> > +             eeh_edev_dbg(edev, "Found existing edev!\n");
> > +
> > +             /*
> > +              * XXX: eeh_remove_device() clears pdev so we shouldn't hit this
> > +              * normally. I've found that screwing around with the pci probe
> > +              * path can result in eeh_probe_pdev() being called twice. This
> > +              * is harmless at the moment, but it's pretty strange so emit a
> > +              * warning to be on the safe side.
> > +              */
> > +             if (WARN_ON(edev->pdev))
> > +                     eeh_edev_dbg(edev, "%s: already bound to a pdev!\n", __func__);
> > +
> > +             edev->pdev = pdev;
> > +
> > +             /* should we be doing something with REMOVED too? */
> > +             edev->mode &= EEH_DEV_DISCONNECTED;
> > +
> > +             /* update the primary bus if we need to */
> > +             // XXX: why do we need to do this? is the pci_bus going away? what cleared the flag?
>
> From just reading this patch alone: if you do not know why we need it,

There's a few comments in here that are essentially notes to myself
that I thought other people might be able to shed light on. The series
is tagged "Very RFC" for a reason ;)

> then why did you add it here (it is not cut-n-paste)? Thanks,

dunno lol
