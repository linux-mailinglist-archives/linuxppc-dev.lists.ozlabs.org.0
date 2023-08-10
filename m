Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA428777649
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 12:52:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bk/Vs3Be;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM3f2597Qz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 20:52:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bk/Vs3Be;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM3d60hTRz2ygq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 20:51:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E827660B8A;
	Thu, 10 Aug 2023 10:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA0CC433C7;
	Thu, 10 Aug 2023 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691664678;
	bh=L99B55PNTBqp8V4rry9xXV7Cfll06W4h1rJqzyof8fY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bk/Vs3BeIzSWktA2LqEtqRPaO7y9ya68Fz/rE9R6Fq8rsQWTa18OawPIvL0WdS+Yj
	 OdfJCI/tcLztV8DvKgzKE74xMoKXcSl8dFFS2xjF26YaQLuTDEis6CFLZv6KpxnV9G
	 4cJ+9c6a2pzXHVvh50quvadTH3e8xHefefm9kRHlMm/iPdhWSzgH6xncGx0sA1Zk+h
	 9t4Nh5JwbL7NRqUn0Tgq3xidk6H9HE2IintUesb15PMt/Awo7ilE1iuFBVInHys6ZP
	 HzSYF4zRiBfDrHvCR9uPBGcxBwWHOgWsACvkKaIs2U6JjUxRdA3fq1Q670SyJn1Nyq
	 OE/OjclI8K1pg==
Date: Thu, 10 Aug 2023 05:51:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v6 2/3] PCI/AER: Disable AER interrupt on suspend
Message-ID: <20230810105116.GA22621@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p5QhaCA09G0BrhyDBXTKBbcgpXq0yAsj7PkG6wF8Qr=_w@mail.gmail.com>
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

On Thu, Aug 10, 2023 at 04:17:21PM +0800, Kai-Heng Feng wrote:
> On Thu, Aug 10, 2023 at 2:52 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Jul 21, 2023 at 11:58:24AM +0800, Kai-Heng Feng wrote:
> > > On Tue, Jul 18, 2023 at 7:17 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Fri, May 12, 2023 at 08:00:13AM +0800, Kai-Heng Feng wrote:
> > > > > PCIe services that share an IRQ with PME, such as AER or DPC,
> > > > > may cause a spurious wakeup on system suspend. To prevent this,
> > > > > disable the AER interrupt notification during the system suspend
> > > > > process.
> > > >
> > > > I see that in this particular BZ dmesg log, PME, AER, and DPC do share
> > > > the same IRQ, but I don't think this is true in general.
> > > >
> > > > Root Ports usually use MSI or MSI-X.  PME and hotplug events use the
> > > > Interrupt Message Number in the PCIe Capability, but AER uses the one
> > > > in the AER Root Error Status register, and DPC uses the one in the DPC
> > > > Capability register.  Those potentially correspond to three distinct
> > > > MSI/MSI-X vectors.
> > > >
> > > > I think this probably has nothing to do with the IRQ being *shared*,
> > > > but just that putting the downstream component into D3cold, where the
> > > > link state is L3, may cause the upstream component to log and signal a
> > > > link-related error as the link goes completely down.
> > >
> > > That's quite likely a better explanation than my wording.
> > > Assuming AER IRQ and PME IRQ are not shared, does system get woken up
> > > by AER IRQ?
> >
> > Rafael could answer this better than I can, but
> > Documentation/power/suspend-and-interrupts.rst says device interrupts
> > are generally disabled during suspend after the "late" phase of
> > suspending devices, i.e.,
> >
> >   dpm_suspend_noirq
> >     suspend_device_irqs           <-- disable non-wakeup IRQs
> >     dpm_noirq_suspend_devices
> >       ...
> >         pci_pm_suspend_noirq      # (I assume)
> >           pci_prepare_to_sleep
> >
> > I think the downstream component would be put in D3cold by
> > pci_prepare_to_sleep(), so non-wakeup interrupts should be disabled by
> > then.
> >
> > I assume PME would generally *not* be disabled since it's needed for
> > wakeup, so I think any interrupt that shares the PME IRQ and occurs
> > during suspend may cause a spurious wakeup.
> 
> Yes, that's the case here.
> 
> > If so, it's exactly as you said at the beginning: AER/DPC/etc sharing
> > the PME IRQ may cause spurious wakeups, and we would have to disable
> > those other interrupts at the source, e.g., by clearing
> > PCI_ERR_ROOT_CMD_FATAL_EN etc (exactly as your series does).
> 
> So is the series good to be merged now?

If we merge as-is, won't we disable AER & DPC interrupts unnecessarily
in the case where the link goes to D3hot?  In that case, there's no
reason to expect interrupts related to the link going down, but things
like PTM messages still work, and they may cause errors that we should
know about.

> > > > I don't think D0-D3hot should be relevant here because in all those
> > > > states, the link should be active because the downstream config space
> > > > remains accessible.  So I'm not sure if it's possible, but I wonder if
> > > > there's a more targeted place we could do this, e.g., in the path that
> > > > puts downstream devices in D3cold.
> > >
> > > Let me try to work on this.
> > >
> > > Kai-Heng
> > >
> > > >
> > > > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Management",
> > > > > TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3hot), L2
> > > > > (D3cold with aux power) and L3 (D3cold) states. So disabling the AER
> > > > > notification during suspend and re-enabling them during the resume process
> > > > > should not affect the basic functionality.
> > > > >
> > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> > > > > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > ---
> > > > > v6:
> > > > > v5:
> > > > >  - Wording.
> > > > >
> > > > > v4:
> > > > > v3:
> > > > >  - No change.
> > > > >
> > > > > v2:
> > > > >  - Only disable AER IRQ.
> > > > >  - No more check on PME IRQ#.
> > > > >  - Use helper.
> > > > >
> > > > >  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
> > > > >  1 file changed, 22 insertions(+)
> > > > >
> > > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > > index 1420e1f27105..9c07fdbeb52d 100644
> > > > > --- a/drivers/pci/pcie/aer.c
> > > > > +++ b/drivers/pci/pcie/aer.c
> > > > > @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +static int aer_suspend(struct pcie_device *dev)
> > > > > +{
> > > > > +     struct aer_rpc *rpc = get_service_data(dev);
> > > > > +     struct pci_dev *pdev = rpc->rpd;
> > > > > +
> > > > > +     aer_disable_irq(pdev);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int aer_resume(struct pcie_device *dev)
> > > > > +{
> > > > > +     struct aer_rpc *rpc = get_service_data(dev);
> > > > > +     struct pci_dev *pdev = rpc->rpd;
> > > > > +
> > > > > +     aer_enable_irq(pdev);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > > > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > > > @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver = {
> > > > >       .service        = PCIE_PORT_SERVICE_AER,
> > > > >
> > > > >       .probe          = aer_probe,
> > > > > +     .suspend        = aer_suspend,
> > > > > +     .resume         = aer_resume,
> > > > >       .remove         = aer_remove,
> > > > >  };
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
