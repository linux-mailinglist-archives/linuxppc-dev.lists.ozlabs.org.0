Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F166E499D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 15:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0SFY4pHwz3gFf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=lEOYQrAR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=lEOYQrAR;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0S7C69V3z3fhx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 23:09:10 +1000 (AEST)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 88EEC3F193
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681736946;
	bh=YiUFuqU/fhzjjmJ7DSn8Q7aAMZ0aYSzaCs/lV3Bh1Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lEOYQrARAaG2Dl7zcASdI5e4z9ASw/MgYvyvZEGwiwnvl4HMeuAyfEOwZslK2AYxT
	 ZbrYeSAg28TFG8vYlrXnKHA7e2rWRQ+iwrx/qjVnax62wWkqv4oSozhQIUISy7aS97
	 QEnCPxeWkviF6LkwbYCQkB57SH7H9X8MgNzZA9yEtXbMh6/VjnecYnsMcCFebvgIu2
	 +MczuXTr5uLYkmzFrL2rFAUGzA9WqnfRTblV2fwJ9sZY2m50jU0gHt46HTe/ZQrBAS
	 y8GZZHMGizvThK3H3Ae/E63oO3z7r9Ke1J5FpHF6D2HzQJ6dHcASC2LBvTtarhHEyG
	 G09UeqHuwsN2Q==
Received: by mail-pg1-f197.google.com with SMTP id x71-20020a63864a000000b0051b7f8530f5so3322324pgd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 06:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681736944; x=1684328944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiUFuqU/fhzjjmJ7DSn8Q7aAMZ0aYSzaCs/lV3Bh1Qo=;
        b=C4xN3DTrbwfj8c0GIbK3LXvE6kdk7Pz5D+DbZ0zlW6gEWAGlEn2seJSnM1xmk5ZMxd
         nfjfaa6lyBWjTb0teCBWxkMxuPXpF/XcJ9F7kM5V7jq8BAjLb39l+Sao7p5xws7E2jE7
         ayspVFchJuE8BnQHFD04D1fqE81P6Hw8AvXkwdVLpluK2Fn56JOn6wnkq0ZaL12xdRL6
         tlwos56EHx7OWUAhYhMDORvCDEzTdw/Nu/gNq3qppK7t65gNdhlTeHxTM71NkFXIjLUd
         tfppwsuF8SGLDUaOGTlAOvZm43ubXIbGlu0kzGcgn296Rg90qFjZfVGIQ5zoo9akzQdB
         HqeQ==
X-Gm-Message-State: AAQBX9dZYbybEEyTC8kfDXIBhWVC+Wtz7Jn+6ywNNi9Nq+I68bT424Ok
	gXx4OBLvV4UbQkCdDX9ESyaaL3aLEBH1Tx7tARZHi7R3573+aqeSP9tXggtQZwZWBFsf2ZM8EmN
	1Zsz1hHQ0TxpbR9hELz/rH3YD+ezyE78s0WYe5iuQxnJQVM4w2ikyz10rppo=
X-Received: by 2002:a05:6a21:3289:b0:ef:ead5:6fdf with SMTP id yt9-20020a056a21328900b000efead56fdfmr3237248pzb.33.1681736944222;
        Mon, 17 Apr 2023 06:09:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y4+tmmuSr/2Z3KNN7Jh48j6KvrHrUIuFudVHw7Y7X97z4iFkBn86z0rfwYvct0MY7OmsK5RY2wd9BuIP5xboU=
X-Received: by 2002:a05:6a21:3289:b0:ef:ead5:6fdf with SMTP id
 yt9-20020a056a21328900b000efead56fdfmr3237216pzb.33.1681736943751; Mon, 17
 Apr 2023 06:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220727013255.269815-3-kai.heng.feng@canonical.com> <20220928212438.GA1836272@bhelgaas>
In-Reply-To: <20220928212438.GA1836272@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 17 Apr 2023 21:08:52 +0800
Message-ID: <CAAd53p7C8UkpEqTEy-WN-uKTSJYOuxPz1kOOcOykYZBvjQX0xg@mail.gmail.com>
Subject: Re: [PATCH 3/3] PCI/DPC: Disable DPC service on suspend when IRQ is
 shared with PME
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 5:24=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Jul 27, 2022 at 09:32:52AM +0800, Kai-Heng Feng wrote:
> > PCIe service that shares IRQ with PME may cause spurious wakeup on
> > system suspend.
> >
> > Since AER is conditionally disabled in previous patch, also apply the
> > same condition to disable DPC which depends on AER to work.
> >
> > PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
> > that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
> > (D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
> > much here to disable DPC during system suspend.
> >
> > This is very similar to previous attempts to suspend AER and DPC [1],
> > but with a different reason.
> >
> > [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.=
feng@canonical.com/
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 52 +++++++++++++++++++++++++++++++++---------
> >  1 file changed, 41 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index 3e9afee02e8d1..542f282c43f75 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -343,13 +343,33 @@ void pci_dpc_init(struct pci_dev *pdev)
> >       }
> >  }
> >
> > +static void dpc_enable(struct pcie_device *dev)
> > +{
> > +     struct pci_dev *pdev =3D dev->port;
> > +     u16 ctl;
> > +
> > +     pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl)=
;
> > +     ctl =3D (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_C=
TL_INT_EN;
> > +     pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl)=
;
> > +}
>

Sorry for the belated response.

> I guess the reason we need this is because we disable interupts in
> pci_pm_suspend() first, then we call pci_save_dpc_state() from
> pci_pm_suspend_noirq(), so we save the *disabled* control register.
> Then when we resume, we restore that disabled control register so we
> need to enable DPC again.  Right?

Sorry for the belated response.

Yes, and the same logic applies to AER too.

>
> I think we should save a "dpc_enabled" bit in the pci_dev and
> conditionally set PCI_EXP_DPC_CTL_INT_EN here.  If we unconditionally
> set it here, we depend on portdrv *not* calling dpc_resume() if we
> didn't enable DPC at enumeration-time for some reason.

Does this scenario really happen?
Once the port is marked with PCIE_PORT_SERVICE_DPC, DPC will be
enabled by dpc_probe().
So an additional bit seems to be unnecessary.

>
> And I would leave PCI_EXP_DPC_CTL_EN_FATAL alone; see below.
>
> > +static void dpc_disable(struct pcie_device *dev)
> > +{
> > +     struct pci_dev *pdev =3D dev->port;
> > +     u16 ctl;
> > +
> > +     pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl)=
;
> > +     ctl &=3D ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> > +     pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl)=
;
>
>   #define  PCI_EXP_DPC_CTL_EN_FATAL       0x0001
>   #define  PCI_EXP_DPC_CTL_INT_EN         0x0008
>
> Clearing PCI_EXP_DPC_CTL_INT_EN makes sense to me, but I don't
> understand the PCI_EXP_DPC_CTL_EN_FATAL part.
>
> PCI_EXP_DPC_CTL_EN_FATAL is one of the four values of the two-bit DPC
> Trigger Enable, so clearing that bit leaves the field as either 00b
> (DPC is disabled) or 10b (DPC enabled and triggered when the port
> detects an uncorrectable error or receives an ERR_NONFATAL or
> ERR_FATAL message).
>
> I think we should only clear PCI_EXP_DPC_CTL_INT_EN.

Yes, clearing PCI_EXP_DPC_CTL_INT_EN should be sufficient.

>
> > +}
> > +
> >  #define FLAG(x, y) (((x) & (y)) ? '+' : '-')
> >  static int dpc_probe(struct pcie_device *dev)
> >  {
> >       struct pci_dev *pdev =3D dev->port;
> >       struct device *device =3D &dev->device;
> >       int status;
> > -     u16 ctl, cap;
> > +     u16 cap;
> >
> >       if (!pcie_aer_is_native(pdev) && !pcie_ports_dpc_native)
> >               return -ENOTSUPP;
> > @@ -364,10 +384,7 @@ static int dpc_probe(struct pcie_device *dev)
> >       }
> >
> >       pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap)=
;
> > -     pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl)=
;
> > -
> > -     ctl =3D (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_C=
TL_INT_EN;
> > -     pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl)=
;
>
> I think we should keep the PCI_EXP_DPC_CTL_EN_FATAL part here. That
> just sets the desired trigger mode but AFAICT, has nothing to do with
> generating interrupts.

Agree. Will do it in next revision.

>
> > +     dpc_enable(dev);
>
> Then dpc_enable() could be called something like dpc_enable_irq(), and
> it would *only* control interupt generation.

Will do.

Kai-Heng

>
> >       pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
> >
> >       pci_info(pdev, "error containment capabilities: Int Msg #%d, RPEx=
t%c PoisonedTLP%c SwTrigger%c RP PIO Log %d, DL_ActiveErr%c\n",
> > @@ -380,14 +397,25 @@ static int dpc_probe(struct pcie_device *dev)
> >       return status;
> >  }
> >
> > -static void dpc_remove(struct pcie_device *dev)
> > +static int dpc_suspend(struct pcie_device *dev)
> >  {
> > -     struct pci_dev *pdev =3D dev->port;
> > -     u16 ctl;
> > +     if (dev->shared_pme_irq)
> > +             dpc_disable(dev);
> >
> > -     pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl)=
;
> > -     ctl &=3D ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> > -     pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl)=
;
> > +     return 0;
> > +}
> > +
> > +static int dpc_resume(struct pcie_device *dev)
> > +{
> > +     if (dev->shared_pme_irq)
> > +             dpc_enable(dev);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dpc_remove(struct pcie_device *dev)
> > +{
> > +     dpc_disable(dev);
> >  }
> >
> >  static struct pcie_port_service_driver dpcdriver =3D {
> > @@ -395,6 +423,8 @@ static struct pcie_port_service_driver dpcdriver =
=3D {
> >       .port_type      =3D PCIE_ANY_PORT,
> >       .service        =3D PCIE_PORT_SERVICE_DPC,
> >       .probe          =3D dpc_probe,
> > +     .suspend        =3D dpc_suspend,
> > +     .resume         =3D dpc_resume,
> >       .remove         =3D dpc_remove,
> >  };
> >
> > --
> > 2.36.1
> >
