Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE821D49A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 13:13:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B51HK30nxzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 21:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N4RNZ4ot; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B51F327qGzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 21:11:49 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d4so5885866pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPcFtDaeSwUgdmq2mlv4hskdLj3edOGQf1WPvvkr1dc=;
 b=N4RNZ4otyEyC4p5W7R8dsCxoYQOdz9OmTYBy3GRE990vb+HHiqzwlzh2uX6f/f8ia2
 NJ3zbesXNSgh/9qS+kVhDvTXi2j1Ip4FNh9OZIii1GwdhHA1xc7Eo18rqS2fetSbrXX2
 0U0PWEU/23lmatBaiIZweGK24n4jCVs5w2mAEzpJ5Vv9PUXauUBPUnfibhE5VVVrhImu
 bihrSBgBCrWaV/ykfjon8bzoK4Nb6Y9sFggmk2J7p6tQywPEJmP1u+7loF0aKh7NENtG
 neFA82CGCk/Wt75/ilE6m1Ebzd4e1Ln0jm1bClVoPMO7I8+M0LRfdJK0pBoIAOIFwJKD
 gTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPcFtDaeSwUgdmq2mlv4hskdLj3edOGQf1WPvvkr1dc=;
 b=IbzNKw99kIRmFIB98Q2gT5TWUinVNggSd5ZbvHMWKNM1byV49+S5MEtQEIUilEKO9Z
 EnhqA6Wcdnc1w6fIGwVpKc5MeYN+t1qxwpdFaeqaCegc/My3MgvHn7aaNBSYluq0jrNv
 3/1Q5mR8gRjXT/UFfm2QBgHWkSo1+KY3ascwICamBb/XWqT9c0e2eJfYbsfgdaeEfHnd
 nuorxlDAKgeT9HtY6sohq0wpFXtjvLgTRPiezkmQDW3lFQ99yDS9okVic5IBpi1BTAaX
 7Gc0mSqiga86lRN4kZFjY1i6qR0xBo2ch0hlzeRUPbGOaZB3fzTzQhxVBk/rdewzRhZU
 OSkg==
X-Gm-Message-State: AOAM530fZQYXkn8zVnJfSgPtcj135DMG6cr+x6RVuK10RB9arJkJPA+a
 99mWtiNATQfFuQTrHAgamMFto9qKPsatEHeEnjUSj88u5i4=
X-Google-Smtp-Source: ABdhPJxxy03mwHUbid5fkwz4AKkQqKToK23oXhroXlGxtJiMGJmbTMepSjZFtrTrw2dTBRj85HQVgBRheHKx/QyfJNk=
X-Received: by 2002:a92:9a97:: with SMTP id c23mr64083473ill.258.1594638704431; 
 Mon, 13 Jul 2020 04:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-6-oohall@gmail.com>
 <d227871b-efc7-0864-efc4-a92b99a2ff04@ozlabs.ru>
In-Reply-To: <d227871b-efc7-0864-efc4-a92b99a2ff04@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 13 Jul 2020 21:11:33 +1000
Message-ID: <CAOSf1CGOtoWvqp2ZVj0p_nYCndQ0PhJDWM5uCq7fdqXEEYpAtA@mail.gmail.com>
Subject: Re: [PATCH 05/14] powerpc/eeh: Kill off eeh_ops->get_pe_addr()
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

On Mon, Jul 13, 2020 at 7:54 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 06/07/2020 11:36, Oliver O'Halloran wrote:
> > This is used in precisely one place which is in pseries specific platform
> > code.  There's no need to have the callback in eeh_ops since the platform
> > chooses the EEH PE addresses anyway. The PowerNV implementation has always
> > been a stub too so remove it.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >  arch/powerpc/include/asm/eeh.h               |  1 -
> >  arch/powerpc/platforms/powernv/eeh-powernv.c | 13 ------------
> >  arch/powerpc/platforms/pseries/eeh_pseries.c | 22 ++++++++++----------
> >  3 files changed, 11 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> > index 3d648e042835..1bddc0dfe099 100644
> > --- a/arch/powerpc/include/asm/eeh.h
> > +++ b/arch/powerpc/include/asm/eeh.h
> > @@ -220,7 +220,6 @@ struct eeh_ops {
> >       int (*init)(void);
> >       struct eeh_dev *(*probe)(struct pci_dev *pdev);
> >       int (*set_option)(struct eeh_pe *pe, int option);
> > -     int (*get_pe_addr)(struct eeh_pe *pe);
> >       int (*get_state)(struct eeh_pe *pe, int *delay);
> >       int (*reset)(struct eeh_pe *pe, int option);
> >       int (*get_log)(struct eeh_pe *pe, int severity, char *drv_log, unsigned long len);
> > diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > index 79409e005fcd..bcd0515d8f79 100644
> > --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> > +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > @@ -535,18 +535,6 @@ static int pnv_eeh_set_option(struct eeh_pe *pe, int option)
> >       return 0;
> >  }
> >
> > -/**
> > - * pnv_eeh_get_pe_addr - Retrieve PE address
> > - * @pe: EEH PE
> > - *
> > - * Retrieve the PE address according to the given tranditional
> > - * PCI BDF (Bus/Device/Function) address.
> > - */
> > -static int pnv_eeh_get_pe_addr(struct eeh_pe *pe)
> > -{
> > -     return pe->addr;
> > -}
> > -
> >  static void pnv_eeh_get_phb_diag(struct eeh_pe *pe)
> >  {
> >       struct pnv_phb *phb = pe->phb->private_data;
> > @@ -1670,7 +1658,6 @@ static struct eeh_ops pnv_eeh_ops = {
> >       .init                   = pnv_eeh_init,
> >       .probe                  = pnv_eeh_probe,
> >       .set_option             = pnv_eeh_set_option,
> > -     .get_pe_addr            = pnv_eeh_get_pe_addr,
> >       .get_state              = pnv_eeh_get_state,
> >       .reset                  = pnv_eeh_reset,
> >       .get_log                = pnv_eeh_get_log,
> > diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> > index 18a2522b9b5e..088771fa38be 100644
> > --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> > +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> > @@ -32,6 +32,8 @@
> >  #include <asm/ppc-pci.h>
> >  #include <asm/rtas.h>
> >
> > +static int pseries_eeh_get_pe_addr(struct pci_dn *pdn);
> > +
> >  /* RTAS tokens */
> >  static int ibm_set_eeh_option;
> >  static int ibm_set_slot_reset;
> > @@ -301,7 +303,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
> >               eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
> >       } else {
> >               /* Retrieve PE address */
> > -             edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
> > +             edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
> >               pe.addr = edev->pe_config_addr;
> >
> >               /* Some older systems (Power4) allow the ibm,set-eeh-option
> > @@ -431,8 +433,10 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
> >   * It's notable that zero'ed return value means invalid PE config
> >   * address.
> >   */
> > -static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
> > +static int pseries_eeh_get_pe_addr(struct pci_dn *pdn)
> >  {
> > +     int config_addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);
>
> Why not use pe->config_addr

I wanted to get rid of the PE argument. The only caller
(pseries_eeh_init_edev()) doesn't even pass a real PE, just the "fake"
PE which only has one initialised field which is... sketch IMO. The
other reason is for Wen's post-kdump pseries PHB reset patch. In that
situation we want the reset to be done before we've done any PCI setup
so there won't be any eeh_pe structures available. We will however
have pci_dn's since they're set up before we start scanning PHBs. I
also think some of the "fake pe" stuff in pseries_eeh_init_edev() is
broken so the fewer users of that we have the better.

> (and why we have two addresses in eeh_pe anyway)?

I don't know :(

It's one of those things I've been meaning to look at but haven't
found the will to jump down that particular rabbit hole.

I did take a cursory look and there's some comments about pe->addr
being zero in some cases so EEH falls back to matching on
pe->config_addr when searching for a PE. IIRC when I looked I couldn't
work out why pe->config_addr would ever be zero. On PowerNV zero is a
valid PE address and we set the EEH_VALID_PE_ZERO flag to disable that
fallback logic so the reason is probably some weird pseries thing.


> Ah, I guess I just trust you with this one :)
>
>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
>
>
>
> > +     int buid = pdn->phb->buid;
> >       int ret = 0;
> >       int rets[3];
> >
> > @@ -443,18 +447,16 @@ static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
> >                * meaningless.
> >                */
> >               ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> > -                             pe->config_addr, BUID_HI(pe->phb->buid),
> > -                             BUID_LO(pe->phb->buid), 1);
> > +                             config_addr, BUID_HI(buid), BUID_LO(buid), 1);
> >               if (ret || (rets[0] == 0))
> >                       return 0;
> >
> >               /* Retrieve the associated PE config address */
> >               ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> > -                             pe->config_addr, BUID_HI(pe->phb->buid),
> > -                             BUID_LO(pe->phb->buid), 0);
> > +                             config_addr, BUID_HI(buid), BUID_LO(buid), 0);
> >               if (ret) {
> >                       pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
> > -                             __func__, pe->phb->global_number, pe->config_addr);
> > +                             __func__, pdn->phb->global_number, config_addr);
> >                       return 0;
> >               }
> >
> > @@ -463,11 +465,10 @@ static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
> >
> >       if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
> >               ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
> > -                             pe->config_addr, BUID_HI(pe->phb->buid),
> > -                             BUID_LO(pe->phb->buid), 0);
> > +                             config_addr, BUID_HI(buid), BUID_LO(buid), 0);
> >               if (ret) {
> >                       pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
> > -                             __func__, pe->phb->global_number, pe->config_addr);
> > +                             __func__, pdn->phb->global_number, config_addr);
> >                       return 0;
> >               }
> >
> > @@ -839,7 +840,6 @@ static struct eeh_ops pseries_eeh_ops = {
> >       .init                   = pseries_eeh_init,
> >       .probe                  = pseries_eeh_probe,
> >       .set_option             = pseries_eeh_set_option,
> > -     .get_pe_addr            = pseries_eeh_get_pe_addr,
> >       .get_state              = pseries_eeh_get_state,
> >       .reset                  = pseries_eeh_reset,
> >       .get_log                = pseries_eeh_get_log,
> >
>
> --
> Alexey
