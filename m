Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 591997788AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 10:01:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=CK8jNXxG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMbpB20Ftz3cF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 18:01:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=CK8jNXxG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMbnG5mzbz2yZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 18:00:17 +1000 (AEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8769042490
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691740813;
	bh=ehKRv9RoJgXADjRvicBy0Ijl/3JFgvwVofaVIbtaDGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CK8jNXxGFQB+GrX+wwgqqMAeUz+1E3GKI7f1ShRhjIrxxQ+gNQyU+6I+avj0+oHiN
	 aHrPV6we0IGaDl8jj+YOW4LJWvIb92HYZwyDaVUFISchtYXkqIvbBltbFtlGNdcAGA
	 YRcISXqrrQgzU8isGbZWGz0qJw91lMp4A1qjEmtQcQGKTDyFrnh5R/hT0TjSqdT4oV
	 g2FGcN466+0pjvI1KDx107fX3aZ4dm78SF/3zemyDCMyNwz4apo7xC/kNTlPwvscb8
	 sYPmxHJ4U4z++4E/B0tP/mnAn+hRuKgETnf3RC8WE3jToj6XnqQ2nNoAh0m+mYcRaA
	 C26zqBcDD8M5Q==
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6bb31e13a13so2018268a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 01:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691740812; x=1692345612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehKRv9RoJgXADjRvicBy0Ijl/3JFgvwVofaVIbtaDGo=;
        b=GyOx8lgPIKEH+VVJoGtqOPb5Das4+12S3Zq94IJ0NddTs0LsYi2zTWQdG/kuchQdID
         od8DQf5829Mdrf2NcZjhgAERsvh5tk5NJKakZeY8L8m7ELumyNIs2RHhQPk3UVNeDpxC
         E3uN0XFSFZzHQqR6ec3YXEbZylHwIMdIXAfexm4qSkb/Yb6aaGPk+zhJU4bS5rkIkqLK
         7wVXVQ7OQwjS2RIzYHCt2GbPLBVMLLGHTSgcfrRcrNZDEC1dTBtPyxHUgawnfb/39WnG
         Zu14iFaBo9cAEhD6qcPj3QbAUJBWezQIpm1jtySKg0KI2GKyM1Yu+d6AoUNtqZDFGL8f
         jRXA==
X-Gm-Message-State: AOJu0YxpSBqu9b33P2Ml0F9M0v0H8hwquNgTczBsxwhLuvCJogWM5Vep
	6BKxU41n1KYzBBHy3VELfgbbNXxxBhk0N5GYRkNvGTpGawDLfy1+0lxCW4COTgKNJRC0DbckzSh
	BXPXzayqcDl4WS/WOnXsEV6M6pkS5mTh1+7i4OYgwac4nXlhmyLTmzvRos3k=
X-Received: by 2002:a05:6870:fb8f:b0:1bf:1346:63e with SMTP id kv15-20020a056870fb8f00b001bf1346063emr1167126oab.49.1691740812438;
        Fri, 11 Aug 2023 01:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENjbOW7ji7Wm0UVXJurFQ3s/S8B7gPa15IsQBQj/iaL7lTpb4zwnR/bwOE+72C5VH1DhNxgEhXIufWWR0yEWA=
X-Received: by 2002:a05:6870:fb8f:b0:1bf:1346:63e with SMTP id
 kv15-20020a056870fb8f00b001bf1346063emr1167110oab.49.1691740812026; Fri, 11
 Aug 2023 01:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd53p5QhaCA09G0BrhyDBXTKBbcgpXq0yAsj7PkG6wF8Qr=_w@mail.gmail.com>
 <20230810105116.GA22621@bhelgaas>
In-Reply-To: <20230810105116.GA22621@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 11 Aug 2023 16:00:00 +0800
Message-ID: <CAAd53p4W3Amee9dJN0usG=spHfg=s1KZM3cdJ_rJjCgDhEymAw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] PCI/AER: Disable AER interrupt on suspend
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 10, 2023 at 6:51=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Thu, Aug 10, 2023 at 04:17:21PM +0800, Kai-Heng Feng wrote:
> > On Thu, Aug 10, 2023 at 2:52=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > > On Fri, Jul 21, 2023 at 11:58:24AM +0800, Kai-Heng Feng wrote:
> > > > On Tue, Jul 18, 2023 at 7:17=E2=80=AFPM Bjorn Helgaas <helgaas@kern=
el.org> wrote:
> > > > > On Fri, May 12, 2023 at 08:00:13AM +0800, Kai-Heng Feng wrote:
> > > > > > PCIe services that share an IRQ with PME, such as AER or DPC,
> > > > > > may cause a spurious wakeup on system suspend. To prevent this,
> > > > > > disable the AER interrupt notification during the system suspen=
d
> > > > > > process.
> > > > >
> > > > > I see that in this particular BZ dmesg log, PME, AER, and DPC do =
share
> > > > > the same IRQ, but I don't think this is true in general.
> > > > >
> > > > > Root Ports usually use MSI or MSI-X.  PME and hotplug events use =
the
> > > > > Interrupt Message Number in the PCIe Capability, but AER uses the=
 one
> > > > > in the AER Root Error Status register, and DPC uses the one in th=
e DPC
> > > > > Capability register.  Those potentially correspond to three disti=
nct
> > > > > MSI/MSI-X vectors.
> > > > >
> > > > > I think this probably has nothing to do with the IRQ being *share=
d*,
> > > > > but just that putting the downstream component into D3cold, where=
 the
> > > > > link state is L3, may cause the upstream component to log and sig=
nal a
> > > > > link-related error as the link goes completely down.
> > > >
> > > > That's quite likely a better explanation than my wording.
> > > > Assuming AER IRQ and PME IRQ are not shared, does system get woken =
up
> > > > by AER IRQ?
> > >
> > > Rafael could answer this better than I can, but
> > > Documentation/power/suspend-and-interrupts.rst says device interrupts
> > > are generally disabled during suspend after the "late" phase of
> > > suspending devices, i.e.,
> > >
> > >   dpm_suspend_noirq
> > >     suspend_device_irqs           <-- disable non-wakeup IRQs
> > >     dpm_noirq_suspend_devices
> > >       ...
> > >         pci_pm_suspend_noirq      # (I assume)
> > >           pci_prepare_to_sleep
> > >
> > > I think the downstream component would be put in D3cold by
> > > pci_prepare_to_sleep(), so non-wakeup interrupts should be disabled b=
y
> > > then.
> > >
> > > I assume PME would generally *not* be disabled since it's needed for
> > > wakeup, so I think any interrupt that shares the PME IRQ and occurs
> > > during suspend may cause a spurious wakeup.
> >
> > Yes, that's the case here.
> >
> > > If so, it's exactly as you said at the beginning: AER/DPC/etc sharing
> > > the PME IRQ may cause spurious wakeups, and we would have to disable
> > > those other interrupts at the source, e.g., by clearing
> > > PCI_ERR_ROOT_CMD_FATAL_EN etc (exactly as your series does).
> >
> > So is the series good to be merged now?
>
> If we merge as-is, won't we disable AER & DPC interrupts unnecessarily
> in the case where the link goes to D3hot?  In that case, there's no
> reason to expect interrupts related to the link going down, but things
> like PTM messages still work, and they may cause errors that we should
> know about.

Because the issue can be observed on D3hot as well [0].
The root port device [0] is power managed by ACPI, so I wonder if it's
reasonable to disable AER & DPC for devices that power managed by
firmware?

[0] https://bugzilla.kernel.org/show_bug.cgi?id=3D216295#c3

Kai-Heng

>
> > > > > I don't think D0-D3hot should be relevant here because in all tho=
se
> > > > > states, the link should be active because the downstream config s=
pace
> > > > > remains accessible.  So I'm not sure if it's possible, but I wond=
er if
> > > > > there's a more targeted place we could do this, e.g., in the path=
 that
> > > > > puts downstream devices in D3cold.
> > > >
> > > > Let me try to work on this.
> > > >
> > > > Kai-Heng
> > > >
> > > > >
> > > > > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Powe=
r Management",
> > > > > > TLP and DLLP transmission are disabled for a Link in L2/L3 Read=
y (D3hot), L2
> > > > > > (D3cold with aux power) and L3 (D3cold) states. So disabling th=
e AER
> > > > > > notification during suspend and re-enabling them during the res=
ume process
> > > > > > should not affect the basic functionality.
> > > > > >
> > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> > > > > > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > > ---
> > > > > > v6:
> > > > > > v5:
> > > > > >  - Wording.
> > > > > >
> > > > > > v4:
> > > > > > v3:
> > > > > >  - No change.
> > > > > >
> > > > > > v2:
> > > > > >  - Only disable AER IRQ.
> > > > > >  - No more check on PME IRQ#.
> > > > > >  - Use helper.
> > > > > >
> > > > > >  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
> > > > > >  1 file changed, 22 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > > > index 1420e1f27105..9c07fdbeb52d 100644
> > > > > > --- a/drivers/pci/pcie/aer.c
> > > > > > +++ b/drivers/pci/pcie/aer.c
> > > > > > @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device =
*dev)
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int aer_suspend(struct pcie_device *dev)
> > > > > > +{
> > > > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > > > +
> > > > > > +     aer_disable_irq(pdev);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int aer_resume(struct pcie_device *dev)
> > > > > > +{
> > > > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > > > +
> > > > > > +     aer_enable_irq(pdev);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > > > > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > > > > @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver ae=
rdriver =3D {
> > > > > >       .service        =3D PCIE_PORT_SERVICE_AER,
> > > > > >
> > > > > >       .probe          =3D aer_probe,
> > > > > > +     .suspend        =3D aer_suspend,
> > > > > > +     .resume         =3D aer_resume,
> > > > > >       .remove         =3D aer_remove,
> > > > > >  };
> > > > > >
> > > > > > --
> > > > > > 2.34.1
> > > > > >
