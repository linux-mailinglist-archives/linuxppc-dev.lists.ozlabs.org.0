Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2823D2FCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 00:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GW6SN4F3Gz30Nc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 08:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N8C3IV6/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N8C3IV6/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GW6Rv3rFKz2yL7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 08:23:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3513260EB1;
 Thu, 22 Jul 2021 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626992632;
 bh=KweSwaLbhjPsHWnbE36IThydrkfovxRJ8o9A5OxnuNU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=N8C3IV6/7SFoMb0TY7JRYES0pjqk0tCaHYT017TBqfb9k7kaIMvojvhKokdtacg0z
 u9I/n2iFN6muXrMmi3dymmdnsbXI75rwldlumIFhMOht8w2Xt1nYBlmwUCDnsCdiJn
 vbMkQ/H7FZ/EaMOE9YDw8fBi/fCGOFoJ8GcnahCqVxihfSCwuCwztjhibxvcOs6iZA
 UbT7sJ0yhD9Zb+jiRl8efxtn2C3dZQhmVM7lBydpPsV2qrVLinALbLQ/b57CF+/s4i
 vc40EwR84vgutE8Df9oKwxvGtyE3Fg1Q1s7kYP+8DqgotAsyJMlog5UBOZNRxYxOQ8
 HmOtHTn7UypiQ==
Date: Thu, 22 Jul 2021 17:23:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 1/2] PCI/AER: Disable AER interrupt during suspend
Message-ID: <20210722222351.GA354095@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p6VN0ejKHcTRgj8mZ_iApR=KogpVZ-HkvdoZbJ=Yue98g@mail.gmail.com>
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
 Alex Williamson <alex.williamson@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 05, 2021 at 11:17:32PM +0800, Kai-Heng Feng wrote:
> On Fri, Feb 5, 2021 at 7:28 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc Alex]
> >
> > On Thu, Jan 28, 2021 at 12:09:37PM +0800, Kai-Heng Feng wrote:
> > > On Thu, Jan 28, 2021 at 4:51 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Thu, Jan 28, 2021 at 01:31:00AM +0800, Kai-Heng Feng wrote:
> > > > > Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> > > > > hint") enables ACS, and some platforms lose its NVMe after resume from
> > > > > firmware:
> > > > > [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> > > > > [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > > > > [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> > > > > [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> > > > > [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > > > > [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > > > > [   50.947843] nvme nvme0: frozen state error detected, reset controller
> > > > >
> > > > > It happens right after ACS gets enabled during resume.
> > > > >
> > > > > To prevent that from happening, disable AER interrupt and enable it on
> > > > > system suspend and resume, respectively.
> > > >
> > > > Lots of questions here.  Maybe this is what we'll end up doing, but I
> > > > am curious about why the error is reported in the first place.
> > > >
> > > > Is this a consequence of the link going down and back up?
> > >
> > > Could be. From the observations, it only happens when firmware suspend
> > > (S3) is used.
> > > Maybe it happens when it's gets powered up, but I don't have equipment
> > > to debug at hardware level.
> > >
> > > If we use non-firmware suspend method, enabling ACS after resume won't
> > > trip AER and DPC.
> > >
> > > > Is it consequence of the device doing a DMA when it shouldn't?
> > >
> > > If it's doing DMA while suspending, the same error should also happen
> > > after NVMe is suspended and before PCIe port suspending.
> > > Furthermore, if non-firmware suspend method is used, there's so such
> > > issue, so less likely to be any DMA operation.
> > >
> > > > Are we doing something in the wrong order during suspend?  Or maybe
> > > > resume, since I assume the error is reported during resume?
> > >
> > > Yes the error is reported during resume. The suspend/resume order
> > > seems fine as non-firmware suspend doesn't have this issue.
> >
> > I really feel like we need a better understanding of what's going on
> > here.  Disabling the AER interrupt is like closing our eyes and
> > pretending that because we don't see it, it didn't happen.
> >
> > An ACS error is triggered by a DMA, right?  I'm assuming an MMIO
> > access from the CPU wouldn't trigger this error.  And it sounds like
> > the error is triggered before we even start running the driver after
> > resume.
> >
> > If we're powering up an NVMe device from D3cold and it DMAs before the
> > driver touches it, something would be seriously broken.  I doubt
> > that's what's happening.  Maybe a device could resume some previously
> > programmed DMA after powering up from D3hot.
> 
> I am not that familiar with PCIe ACS/AER/DPC, so I can't really answer
> questions you raised.
> PCIe spec doesn't say the suspend/resume order is also not helping here.
> 
> However, I really think it's a system firmware issue.
> I've seen some suspend-to-idle platforms with NVMe can reach D3cold,
> those are unaffected.

Marking both of these as "not applicable" for now because I don't
think we really understand what's going on.

Apparently a DMA occurs during suspend or resume and triggers an ACS
violation.  I don't think think such a DMA should occur in the first
place.

Or maybe, since you say the problem happens right after ACS is enabled
during resume, we're doing the ACS enable incorrectly?  Although I
would think we should not be doing DMA at the same time we're enabling
ACS, either.

If this really is a system firmware issue, both HP and Dell should
have the knowledge and equipment to figure out what's going on.

> > Or maybe the error occurred on suspend, like if the device wasn't
> > quiesced or something, but we didn't notice it until resume?  The
> > AER error status bits are RW1CS, which means they can be preserved
> > across hot/warm/cold resets.
> >
> > Can you instrument the code to see whether the AER error status bit is
> > set before enabling ACS?  I'm not sure that merely enabling ACS (I
> > assume you mean pci_std_enable_acs(), where we write PCI_ACS_CTRL)
> > should cause an interrupt for a previously-logged error.  I suspect
> > that could happen when enabling *AER*, but I wouldn't think it would
> > happen when enabling *ACS*.
> 
> Diff to print AER status:
> https://bugzilla.kernel.org/show_bug.cgi?id=209149#c11
> 
> And dmesg:
> https://bugzilla.kernel.org/show_bug.cgi?id=209149#c12
> 
> Looks like the read before suspend and after resume are both fine.
> 
> >
> > Does this error happen on multiple machines from different vendors?
> > Wondering if it could be a BIOS issue, e.g., BIOS not cleaning up
> > after it did something to cause an error.
> 
> AFAIK, systems from both HP and Dell are affected.
> I was told that the reference platform from Intel is using
> suspend-to-idle, but vendors changed the sleep method to S3 to have
> lower power consumption to pass regulation.
> 
> Kai-Heng
> 
> >
> > > > If we *do* take the error, why doesn't DPC recovery work?
> > >
> > > It works for the root port, but not for the NVMe drive:
> > > [   50.947816] pcieport 0000:00:1b.0: DPC: containment event,
> > > status:0x1f01 source:0x0000
> > > [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > > [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error:
> > > severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver
> > > ID)
> > > [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error
> > > status/mask=00200000/00010000
> > > [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > > [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > > [   50.947843] nvme nvme0: frozen state error detected, reset controller
> > > [   50.948400] ACPI: EC: event unblocked
> > > [   50.948432] xhci_hcd 0000:00:14.0: PME# disabled
> > > [   50.948444] xhci_hcd 0000:00:14.0: enabling bus mastering
> > > [   50.949056] pcieport 0000:00:1b.0: PME# disabled
> > > [   50.949068] pcieport 0000:00:1c.0: PME# disabled
> > > [   50.949416] e1000e 0000:00:1f.6: PME# disabled
> > > [   50.949463] e1000e 0000:00:1f.6: enabling bus mastering
> > > [   50.951606] sd 0:0:0:0: [sda] Starting disk
> > > [   50.951610] nvme 0000:01:00.0: can't change power state from D3hot
> > > to D0 (config space inaccessible)
> > > [   50.951730] nvme nvme0: Removing after probe failure status: -19
> > > [   50.952360] nvme nvme0: failed to set APST feature (-19)
> > > [   50.971136] snd_hda_intel 0000:00:1f.3: PME# disabled
> > > [   51.089330] pcieport 0000:00:1b.0: AER: broadcast resume message
> > > [   51.089345] pcieport 0000:00:1b.0: AER: device recovery successful
> > >
> > > But I think why recovery doesn't work for NVMe is for another discussion...
> > >
> > > Kai-Heng
> > >
> > > >
> > > > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> > > > > Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
> > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > ---
> > > > >  drivers/pci/pcie/aer.c | 18 ++++++++++++++++++
> > > > >  1 file changed, 18 insertions(+)
> > > > >
> > > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > > index 77b0f2c45bc0..0e9a85530ae6 100644
> > > > > --- a/drivers/pci/pcie/aer.c
> > > > > +++ b/drivers/pci/pcie/aer.c
> > > > > @@ -1365,6 +1365,22 @@ static int aer_probe(struct pcie_device *dev)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +static int aer_suspend(struct pcie_device *dev)
> > > > > +{
> > > > > +     struct aer_rpc *rpc = get_service_data(dev);
> > > > > +
> > > > > +     aer_disable_rootport(rpc);
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int aer_resume(struct pcie_device *dev)
> > > > > +{
> > > > > +     struct aer_rpc *rpc = get_service_data(dev);
> > > > > +
> > > > > +     aer_enable_rootport(rpc);
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > > > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > > > @@ -1437,6 +1453,8 @@ static struct pcie_port_service_driver aerdriver = {
> > > > >       .service        = PCIE_PORT_SERVICE_AER,
> > > > >
> > > > >       .probe          = aer_probe,
> > > > > +     .suspend        = aer_suspend,
> > > > > +     .resume         = aer_resume,
> > > > >       .remove         = aer_remove,
> > > > >  };
> > > > >
> > > > > --
> > > > > 2.29.2
> > > > >
