Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4CA306C38
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:29:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR6tj6qDXzDrTy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 15:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR6SM2QMYzDrP0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 15:09:54 +1100 (AEDT)
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1l4ycw-0002lr-3i
 for linuxppc-dev@lists.ozlabs.org; Thu, 28 Jan 2021 04:09:50 +0000
Received: by mail-lj1-f200.google.com with SMTP id c19so2357342lji.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 20:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fl7bm6buw7fD0rpOxqw4tFNpwhOF3QlYfdvY0hGN/E=;
 b=Aqwf1DbTArhWMg85GuGa5Gr1NGqMwzmvUZsGrl7tCf2PpzgECauinycIHEPYIU/dLK
 ddJ5dupZj4zc9K/GoUGWw7lLaNqe+sMGEQFR3a6ZY3YEhs4/XRt6QujnjXU3qH1jaVWH
 VqtB/PjqU0lm8boQ5+THRqLPGD/NncQTCu7x+CRGnEgAGrQHvQAoGTj6wtjcNomkhbmW
 CUtGWq+JHJsyW4ZyX15T5DKfNoeVdXnJqsmto2GRA5shD7hfq0/Hyow7YTdmhhSdaFEU
 txP9ocGJ+I6Ql+/XFpWZQB41c/4QPXBjhIkoHBS/BXjtLle2LCE+uEnNF7GaGwS3TfGC
 tTvQ==
X-Gm-Message-State: AOAM530SNso+BlAjnmFkX2OdTge1/mPtDgvLp6iGHj9yqE8d6UJMtcdE
 B3GToyJIuBwp2i2Lm38fgVrQolQPv6GJKmUpps7TywbzNFsADF9a1Imzlq5Dv7F2A00eCEwkjJf
 czvfI8uCnw69ljHRsc+hHakmgTYsHFURxEpKxLjwhwpIBvQwreS4o7WRirEI=
X-Received: by 2002:a2e:7a05:: with SMTP id v5mr7107373ljc.402.1611806989356; 
 Wed, 27 Jan 2021 20:09:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUZ61PxNciB0RDZ4gO3Vtagr/TV9bDy/Ex9ys0/59vTDw6Y6nGIPGqgglSPQLGt2i2uXLbz1zcOkH5OoCjSQU=
X-Received: by 2002:a2e:7a05:: with SMTP id v5mr7107359ljc.402.1611806989056; 
 Wed, 27 Jan 2021 20:09:49 -0800 (PST)
MIME-Version: 1.0
References: <20210127173101.446940-1-kai.heng.feng@canonical.com>
 <20210127205053.GA3049358@bjorn-Precision-5520>
In-Reply-To: <20210127205053.GA3049358@bjorn-Precision-5520>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 28 Jan 2021 12:09:37 +0800
Message-ID: <CAAd53p7FfRCgfC5dGL3HyP+rbVtR2VCfMPYBBvJ=-DFCWFeVPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI/AER: Disable AER interrupt during suspend
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Joerg Roedel <jroedel@suse.de>,
 "open list:PCI ENHANCED ERROR HANDLING \(EEH\) FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 4:51 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Jan 28, 2021 at 01:31:00AM +0800, Kai-Heng Feng wrote:
> > Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> > hint") enables ACS, and some platforms lose its NVMe after resume from
> > firmware:
> > [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> > [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> > [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> > [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > [   50.947843] nvme nvme0: frozen state error detected, reset controller
> >
> > It happens right after ACS gets enabled during resume.
> >
> > To prevent that from happening, disable AER interrupt and enable it on
> > system suspend and resume, respectively.
>
> Lots of questions here.  Maybe this is what we'll end up doing, but I
> am curious about why the error is reported in the first place.
>
> Is this a consequence of the link going down and back up?

Could be. From the observations, it only happens when firmware suspend
(S3) is used.
Maybe it happens when it's gets powered up, but I don't have equipment
to debug at hardware level.

If we use non-firmware suspend method, enabling ACS after resume won't
trip AER and DPC.

>
> Is it consequence of the device doing a DMA when it shouldn't?

If it's doing DMA while suspending, the same error should also happen
after NVMe is suspended and before PCIe port suspending.
Furthermore, if non-firmware suspend method is used, there's so such
issue, so less likely to be any DMA operation.

>
> Are we doing something in the wrong order during suspend?  Or maybe
> resume, since I assume the error is reported during resume?

Yes the error is reported during resume. The suspend/resume order
seems fine as non-firmware suspend doesn't have this issue.

>
> If we *do* take the error, why doesn't DPC recovery work?

It works for the root port, but not for the NVMe drive:
[   50.947816] pcieport 0000:00:1b.0: DPC: containment event,
status:0x1f01 source:0x0000
[   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
[   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error:
severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver
ID)
[   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error
status/mask=00200000/00010000
[   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
[   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
[   50.947843] nvme nvme0: frozen state error detected, reset controller
[   50.948400] ACPI: EC: event unblocked
[   50.948432] xhci_hcd 0000:00:14.0: PME# disabled
[   50.948444] xhci_hcd 0000:00:14.0: enabling bus mastering
[   50.949056] pcieport 0000:00:1b.0: PME# disabled
[   50.949068] pcieport 0000:00:1c.0: PME# disabled
[   50.949416] e1000e 0000:00:1f.6: PME# disabled
[   50.949463] e1000e 0000:00:1f.6: enabling bus mastering
[   50.951606] sd 0:0:0:0: [sda] Starting disk
[   50.951610] nvme 0000:01:00.0: can't change power state from D3hot
to D0 (config space inaccessible)
[   50.951730] nvme nvme0: Removing after probe failure status: -19
[   50.952360] nvme nvme0: failed to set APST feature (-19)
[   50.971136] snd_hda_intel 0000:00:1f.3: PME# disabled
[   51.089330] pcieport 0000:00:1b.0: AER: broadcast resume message
[   51.089345] pcieport 0000:00:1b.0: AER: device recovery successful

But I think why recovery doesn't work for NVMe is for another discussion...

Kai-Heng

>
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> > Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/pci/pcie/aer.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 77b0f2c45bc0..0e9a85530ae6 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1365,6 +1365,22 @@ static int aer_probe(struct pcie_device *dev)
> >       return 0;
> >  }
> >
> > +static int aer_suspend(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc = get_service_data(dev);
> > +
> > +     aer_disable_rootport(rpc);
> > +     return 0;
> > +}
> > +
> > +static int aer_resume(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc = get_service_data(dev);
> > +
> > +     aer_enable_rootport(rpc);
> > +     return 0;
> > +}
> > +
> >  /**
> >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > @@ -1437,6 +1453,8 @@ static struct pcie_port_service_driver aerdriver = {
> >       .service        = PCIE_PORT_SERVICE_AER,
> >
> >       .probe          = aer_probe,
> > +     .suspend        = aer_suspend,
> > +     .resume         = aer_resume,
> >       .remove         = aer_remove,
> >  };
> >
> > --
> > 2.29.2
> >
