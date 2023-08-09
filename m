Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020BE7767AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 20:53:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CA7EQptX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLfMm5ygXz3cG0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 04:53:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CA7EQptX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLfLv5Cx5z2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 04:52:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A8C9636B3;
	Wed,  9 Aug 2023 18:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9701FC433C8;
	Wed,  9 Aug 2023 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691607154;
	bh=nMtgXGgKWm52aiYW9EcmDMcW17XRObHSw5+9dPg/R0k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CA7EQptXpU4dE/otMHfEfXIX7A2ByyKg4Gafe4Z+eG2JkmqQ126ZetUggTmXzVgcP
	 ba25k8atSaxzd3jKOhs+jLcrAn2+f9itE5jjtaJbG1CPDM3oICVA21g7nApaM6JsBN
	 s6CVRDyfrD7gEOtf6qjfG4FkUfXbIvLxuZJ4ptAh1Q1wHYzwHKwZ2uvoMgdmhSTQIL
	 2OzcozRIJES1o/h3//HnLjdu7Sjgpt0geF91Lb3wybNRKZLSh8Mi7/8hJiaL+ZKZk1
	 n0wM2r4n4mYTq31f2u5/KS34FyqYAVjllgTki6ATwL4cImuVIb5HhLbekTaXRph7TM
	 jMahdLuZA/ukA==
Date: Wed, 9 Aug 2023 13:52:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v6 2/3] PCI/AER: Disable AER interrupt on suspend
Message-ID: <20230809185232.GA402997@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p7RfVcZjw+ShtkTmhCAA4zpegRZOzwiXgmanthx_KMjxA@mail.gmail.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023 at 11:58:24AM +0800, Kai-Heng Feng wrote:
> On Tue, Jul 18, 2023 at 7:17 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, May 12, 2023 at 08:00:13AM +0800, Kai-Heng Feng wrote:
> > > PCIe services that share an IRQ with PME, such as AER or DPC,
> > > may cause a spurious wakeup on system suspend. To prevent this,
> > > disable the AER interrupt notification during the system suspend
> > > process.
> >
> > I see that in this particular BZ dmesg log, PME, AER, and DPC do share
> > the same IRQ, but I don't think this is true in general.
> >
> > Root Ports usually use MSI or MSI-X.  PME and hotplug events use the
> > Interrupt Message Number in the PCIe Capability, but AER uses the one
> > in the AER Root Error Status register, and DPC uses the one in the DPC
> > Capability register.  Those potentially correspond to three distinct
> > MSI/MSI-X vectors.
> >
> > I think this probably has nothing to do with the IRQ being *shared*,
> > but just that putting the downstream component into D3cold, where the
> > link state is L3, may cause the upstream component to log and signal a
> > link-related error as the link goes completely down.
> 
> That's quite likely a better explanation than my wording.
> Assuming AER IRQ and PME IRQ are not shared, does system get woken up
> by AER IRQ?

Rafael could answer this better than I can, but
Documentation/power/suspend-and-interrupts.rst says device interrupts
are generally disabled during suspend after the "late" phase of
suspending devices, i.e.,

  dpm_suspend_noirq
    suspend_device_irqs           <-- disable non-wakeup IRQs
    dpm_noirq_suspend_devices
      ...
        pci_pm_suspend_noirq      # (I assume)
	  pci_prepare_to_sleep

I think the downstream component would be put in D3cold by
pci_prepare_to_sleep(), so non-wakeup interrupts should be disabled by
then.

I assume PME would generally *not* be disabled since it's needed for
wakeup, so I think any interrupt that shares the PME IRQ and occurs
during suspend may cause a spurious wakeup.

If so, it's exactly as you said at the beginning: AER/DPC/etc sharing
the PME IRQ may cause spurious wakeups, and we would have to disable
those other interrupts at the source, e.g., by clearing
PCI_ERR_ROOT_CMD_FATAL_EN etc (exactly as your series does).

> > I don't think D0-D3hot should be relevant here because in all those
> > states, the link should be active because the downstream config space
> > remains accessible.  So I'm not sure if it's possible, but I wonder if
> > there's a more targeted place we could do this, e.g., in the path that
> > puts downstream devices in D3cold.
> 
> Let me try to work on this.
> 
> Kai-Heng
> 
> >
> > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Management",
> > > TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3hot), L2
> > > (D3cold with aux power) and L3 (D3cold) states. So disabling the AER
> > > notification during suspend and re-enabling them during the resume process
> > > should not affect the basic functionality.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> > > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > > v6:
> > > v5:
> > >  - Wording.
> > >
> > > v4:
> > > v3:
> > >  - No change.
> > >
> > > v2:
> > >  - Only disable AER IRQ.
> > >  - No more check on PME IRQ#.
> > >  - Use helper.
> > >
> > >  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index 1420e1f27105..9c07fdbeb52d 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
> > >       return 0;
> > >  }
> > >
> > > +static int aer_suspend(struct pcie_device *dev)
> > > +{
> > > +     struct aer_rpc *rpc = get_service_data(dev);
> > > +     struct pci_dev *pdev = rpc->rpd;
> > > +
> > > +     aer_disable_irq(pdev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int aer_resume(struct pcie_device *dev)
> > > +{
> > > +     struct aer_rpc *rpc = get_service_data(dev);
> > > +     struct pci_dev *pdev = rpc->rpd;
> > > +
> > > +     aer_enable_irq(pdev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  /**
> > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver = {
> > >       .service        = PCIE_PORT_SERVICE_AER,
> > >
> > >       .probe          = aer_probe,
> > > +     .suspend        = aer_suspend,
> > > +     .resume         = aer_resume,
> > >       .remove         = aer_remove,
> > >  };
> > >
> > > --
> > > 2.34.1
> > >
