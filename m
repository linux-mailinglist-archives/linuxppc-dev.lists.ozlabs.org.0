Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793221E62A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 05:10:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5QWD2xdxzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 13:10:32 +1000 (AEST)
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
 header.s=20161025 header.b=V5oh4Dup; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5QT812h2zDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 13:08:42 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id i18so13053738ilk.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 20:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sz3xB9q2T+AmXjBVthXa7QV3Qo3chIa7XeDU228UGxE=;
 b=V5oh4DupNtnU0KUw/CANl8igLqEmOhOpyYOGwjwrqhoFx1mkclJX0G3awCXChYzz0Z
 2MdxFOJYMc9vBErqY8+6N7Rx9LLpDH/x1YDNA0l+D1HMxObJqXqPA3FwXFSBoTQziaGT
 dF3WYXPLZ7GpNvkzoxeJyirYupmAMwi89r+4HW8nUKkT4pfzSTVG1nxlOlQL9mmI2gx1
 jDLNkUovr+pk5sK6c7DR1ICmXj1Es0cZpLyiHlP2y+MaIRCV2r8N1JK7MGvkPToflJTl
 ziTWFt8ExZPnSmI5ADJyfwhEcxe2L+xiNg9a2JkWjzKoy5dfB8UZ4ZoJWM4GEsrnk/C7
 yrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sz3xB9q2T+AmXjBVthXa7QV3Qo3chIa7XeDU228UGxE=;
 b=eBO6AGRhbGPq5aUUYZ9PZNhoznQHw5zinx6EZuUCaCzzJSvw3SUuGYUlOG5swvbCFh
 8jml3hC8m93TG9cc0wIvpuUZ2D+6Fn/yrHcPS9SuFsIajmdoZr4sDTOjOwW+GtqGZFO4
 3ywDBBCHiDuDqrqukuZE6Fre08azeS3RfcNI/y/D0TEZFmYgf7u+DAK3DbMpPrEH+PY+
 j56IgRVUtgAOAoTjNqUV0VYuvSQQ/0U7AnRnkdV9oUMT2IEl4SJOdEZT4doW6U70Ktg6
 5q7zPGzXguX8B7QIPEN7mA6vhczsIi71mKveQfvnp4cIIJnwzRghJG8Ypj42On0D33VI
 Kyow==
X-Gm-Message-State: AOAM533D520cN0jQBK/tPxJ3LU/gqTcTNMqOoTSjshYVRCZ5/yBQEssL
 WH7CCPynmDaKyYNmMQsO9GWHoNxIxrjooAsuKBo=
X-Google-Smtp-Source: ABdhPJw1qfwV3n6TNqg1W6qsLkRkDGhrHwVDryp/fPdoukXPaBpzML/tdWCJg2fdKPEPAIhjSXFgewWOklHQIc0M5CQ=
X-Received: by 2002:a92:9a97:: with SMTP id c23mr2879174ill.258.1594696118980; 
 Mon, 13 Jul 2020 20:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-15-oohall@gmail.com>
 <d2ce45e8-92e6-f875-fd38-c3fa82bf8f4e@ozlabs.ru>
In-Reply-To: <d2ce45e8-92e6-f875-fd38-c3fa82bf8f4e@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 14 Jul 2020 13:08:26 +1000
Message-ID: <CAOSf1CGRXox-fO7cJNA+0APjrQOUve01jUbjLmXWqjH=07cGxg@mail.gmail.com>
Subject: Re: [PATCH 14/14] powerpc/eeh: Move PE tree setup into the platform
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 11:50 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> On 06/07/2020 11:36, Oliver O'Halloran wrote:
> >  /**
> >   * eeh_pe_tree_insert - Add EEH device to parent PE
> >   * @edev: EEH device
> > + * @new_pe_parent: PE to create additional PEs under
> >   *
> > - * Add EEH device to the parent PE. If the parent PE already
> > - * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
> > - * we have to create new PE to hold the EEH device and the new
> > - * PE will be linked to its parent PE as well.
> > + * Add EEH device to the PE in edev->pe_config_addr. If a PE already
> > + * exists with that address then @edev is added to that PE. Otherwise
> > + * a new PE is created and inserted into the PE tree as a child of
> > + * @new_pe_parent.
> > + *
> > + * If @new_pe_parent is NULL then the new PE will be inserted under
> > + * directly under the the PHB.
> >   */
> > -int eeh_pe_tree_insert(struct eeh_dev *edev)
> > +int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
> >  {
> >       struct pci_controller *hose = edev->controller;
> >       struct eeh_pe *pe, *parent;
>
>
> We can ditch this "parent" in that single place now and use "pe"
> instead. And name the new parameter simply "parent". Dunno if it
> improves things though.

I did this at some point and then decided not to. It added a bunch of
noise to the diff and calling the parameter "parent" ended up being
pretty unreadable. The parameter is "the parent of the PE that will be
created to contain edev", or "parent of the parent PE". It's pretty
unwieldy.

> > @@ -399,7 +366,7 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
> >                       }
> >
> >                       eeh_edev_dbg(edev,
> > -                                  "Added to device PE (parent: PE#%x)\n",
> > +                                  "Added to existing PE (parent: PE#%x)\n",
> >                                    pe->parent->addr);
> >               } else {
> >                       /* Mark the PE as type of PCI bus */
> > @@ -431,10 +398,9 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
> >        * to PHB directly. Otherwise, we have to associate the
> >        * PE with its parent.
> >        */
> > -     parent = eeh_pe_get_parent(edev);
> > -     if (!parent) {
> > -             parent = eeh_phb_pe_get(hose);
> > -             if (!parent) {
> > +     if (!new_pe_parent) {
> > +             new_pe_parent = eeh_phb_pe_get(hose);
> > +             if (!new_pe_parent) {
>
>
>
> afaict only pseries can realisticly pass new_pe_parent==NULL so this
> chunk could go to pseries_eeh_pe_get_parent.

pnv_eeh_get_upstream_pe() will never return the PHB PE so
new_pe_parent will be NULL for the first PE created under a PowerNV
PHB. I guess we could move the PHB PE handling into the platform too,
but I think that just results in having to special case PHB PEs in two
places rather than one.

> > +static struct eeh_pe *pseries_eeh_pe_get_parent(struct eeh_dev *edev)
> > +{
> > +     struct eeh_dev *parent;
> > +     struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> > +
> > +     /*
> > +      * It might have the case for the indirect parent
> > +      * EEH device already having associated PE, but
> > +      * the direct parent EEH device doesn't have yet.
> > +      */
> > +     if (edev->physfn)
> > +             pdn = pci_get_pdn(edev->physfn);
> > +     else
> > +             pdn = pdn ? pdn->parent : NULL;
> > +     while (pdn) {
> > +             /* We're poking out of PCI territory */
>
>
> We are traversing up PCI hierarchy here - pci_dn->parent, how is this
> out of PCI territory? Or I understand "out of" incorrectly?
>
>
> > +             parent = pdn_to_eeh_dev(pdn);
> > +             if (!parent)
> > +                     return NULL;

If there's no eeh dev then the node we're looking at is a PHB rather
than an actual PCI device so it stops looking. I think. The comment
was copied over from the existing code and I haven't spent a whole lot
of time parsing it's meaning.



> > @@ -301,6 +343,8 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
> >       if (ret) {
> >               eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
> >       } else {
> > +             struct eeh_pe *parent;
> > +
> >               /* Retrieve PE address */
> >               edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
> >               pe.addr = edev->pe_config_addr;
> > @@ -313,16 +357,23 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
> >               if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
> >                       enable = 1;
> >
> > -             if (enable) {
> > +             /* This device doesn't support EEH, but it may have an
> > +              * EEH parent, in which case we mark it as supported.
> > +              */
> > +             parent = pseries_eeh_pe_get_parent(edev);
> > +             if (parent && !enable)
> > +                     edev->pe_config_addr = parent->addr;
>
>
> What if pseries_eeh_pe_get_parent() returned NULL - we won't write
> edev->pe_config_addr so it remains 0 which is fine just by accident? :)

edev->pe_config_addr is set above when we call
pseries_eeh_get_pe_addr(). The check there is mainly to cover the case
where pseries_eeh_get_pe_addr() fails because the device is on a
subordinate bus rather than the root bus of the PE. PAPR says the
get-pe-addr-info RTAS call can fail in that situation and that you're
supposed to traverse up the DT to find the pe_config_addr, which is
what pe_get_parent() does. Yeah it's confusing, but that's what it
does today too.

> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> > +
> > +             if (enable || parent) {
> >                       eeh_add_flag(EEH_ENABLED);
> > -                     eeh_pe_tree_insert(edev);
> > +                     eeh_pe_tree_insert(edev, parent);

> >               } else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
> >                          (pdn_to_eeh_dev(pdn->parent))->pe) {
> >                       /* This device doesn't support EEH, but it may have an
> >                        * EEH parent, in which case we mark it as supported.
> >                        */
> >                       edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
> > -                     eeh_pe_tree_insert(edev);
> > +                     eeh_pe_tree_insert(edev, parent);

I think I was supposed to delete this hunk and then forgot to since it
handles the same case mentioned above.

> >               }
> >               eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
> >                            (enable ? "enabled" : "unsupported"), ret);
> >
>
> --
> Alexey
