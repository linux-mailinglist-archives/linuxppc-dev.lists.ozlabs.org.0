Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2011BB16B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 00:16:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499zdT3jCMzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 08:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=nm6CuiAd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499zbV5YRDzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 08:14:46 +1000 (AEST)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0FA92074F;
 Mon, 27 Apr 2020 22:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588025684;
 bh=rwZyRkD1TSoz7ebCbiTMlMTBmGgzCf7CPs5QQBwDQ50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nm6CuiAd2H2773Qx0+ywYuFu0fKPEBl08Oli133tgjd6GzwvSbPQ7REExtqlaIDM9
 kz5v1Wd4nGdFdrNEkCrvNZHKkaCXMts5ejHnBttPTKpePfMzYFYNgsOrzP9tCNSNyO
 1sdVv1SuzIF9vV191NK5s8+wauUDwAAEJpzsChQI=
Date: Mon, 27 Apr 2020 17:14:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>
Subject: Re: [PATCH v2 1/2] PCI/AER: Allow Native AER Host Bridges to use AER
Message-ID: <20200427221441.GA7516@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac3d3b2d3f0e678b792281a1debf5762f1d52b1f.camel@intel.com>
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
Cc: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "Patel,
 Mayurkumar" <mayurkumar.patel@intel.com>,
 "fred@fredlawl.com" <fred@fredlawl.com>,
 "sbobroff@linux.ibm.com" <sbobroff@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "oohall@gmail.com" <oohall@gmail.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 "rajatja@google.com" <rajatja@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 27, 2020 at 04:11:07PM +0000, Derrick, Jonathan wrote:
> On Fri, 2020-04-24 at 18:30 -0500, Bjorn Helgaas wrote:
> > I'm glad you raised this because I think the way we handle
> > FIRMWARE_FIRST is really screwed up.
> > 
> > On Mon, Apr 20, 2020 at 03:37:09PM -0600, Jon Derrick wrote:
> > > Some platforms have a mix of ports whose capabilities can be negotiated
> > > by _OSC, and some ports which are not described by ACPI and instead
> > > managed by Native drivers. The existing Firmware-First HEST model can
> > > incorrectly tag these Native, Non-ACPI ports as Firmware-First managed
> > > ports by advertising the HEST Global Flag and matching the type and
> > > class of the port (aer_hest_parse).
> > > 
> > > If the port requests Native AER through the Host Bridge's capability
> > > settings, the AER driver should honor those settings and allow the port
> > > to bind. This patch changes the definition of Firmware-First to exclude
> > > ports whose Host Bridges request Native AER.
> > > 
> > > Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> > > ---
> > >  drivers/pci/pcie/aer.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index f4274d3..30fbd1f 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -314,6 +314,9 @@ int pcie_aer_get_firmware_first(struct pci_dev *dev)
> > >  	if (pcie_ports_native)
> > >  		return 0;
> > >  
> > > +	if (pci_find_host_bridge(dev->bus)->native_aer)
> > > +		return 0;
> > 
> > I hope we don't have to complicate pcie_aer_get_firmware_first() by
> > adding this "native_aer" check here.  I'm not sure what we actually
> > *should* do based on FIRMWARE_FIRST, but I don't think the current
> > uses really make sense.
> > 
> > I think Linux makes too many assumptions based on the FIRMWARE_FIRST
> > bit.  The ACPI spec really only says (ACPI v6.3, sec 18.3.2.4):
> > 
> >   If set, FIRMWARE_FIRST indicates to the OSPM that system firmware
> >   will handle errors from this source first.
> > 
> >   If FIRMWARE_FIRST is set in the flags field, the Enabled field [of
> >   the HEST AER structure] is ignored by the OSPM.
> > 
> > I do not see anything there about who owns the AER Capability, but
> > Linux assumes that if FIRMWARE_FIRST is set, firmware must own the AER
> > Capability.  I think that's reading too much into the spec.
> > 
> > We already have _OSC, which *does* explicitly talk about who owns the
> > AER Capability, and I think we should rely on that.  If firmware
> > doesn't want the OS to touch the AER Capability, it should decline to
> > give ownership to the OS via _OSC.
> > 
> > >  	if (!dev->__aer_firmware_first_valid)
> > >  		aer_set_firmware_first(dev);
> > >  	return dev->__aer_firmware_first;
> 
> Just a little bit of reading and my interpretation, as it seems like
> some of this is just layers upon layers of possibly conflicting yet
> intentionally vague descriptions.
> 
> _OSC seems to describe that OSPM can handle AER (6.2.11.3):
> PCI Express Advanced Error Reporting (AER) control
>    The OS sets this bit to 1 to request control over PCI Express AER.
>    If the OS successfully receives control of this feature, it must
>    handle error reporting through the AER Capability as described in
>    the PCI Express Base Specification.
> 
> 
> For AER and DPC the ACPI root port enumeration will properly set
> native_aer/dpc based on _OSC:
> 
> struct pci_bus *acpi_pci_root_create(struct acpi_pci_root *root,
> ...
> 	if (!(root->osc_control_set & OSC_PCI_EXPRESS_AER_CONTROL))
> 		host_bridge->native_aer = 0;
> 	if (!(root->osc_control_set & OSC_PCI_EXPRESS_PME_CONTROL))
> 		host_bridge->native_pme = 0;
> 	if (!(root->osc_control_set & OSC_PCI_EXPRESS_LTR_CONTROL))
> 		host_bridge->native_ltr = 0;
> 	if (!(root->osc_control_set & OSC_PCI_EXPRESS_DPC_CONTROL))
> 		host_bridge->native_dpc = 0;
> 
> As DPC was defined in an ECN [1], I would imagine AER will need to
> cover DPC for legacy platforms prior to the ECN.
> 
> 
> 
> The complication is that HEST also seems to describe how ports (and
> other devices) are managed either individually or globally:
> 
> Table 18-387  PCI Express Root Port AER Structure
> ...
> Flags:
>    [0] - FIRMWARE_FIRST: If set, this bit indicates to the OSPM that
>    system firmware will handle errors from this source
>    [1] - GLOBAL: If set, indicates that the settings contained in this
>    structure apply globally to all PCI Express Devices. All other bits
>    must be set to zero
> 
> 
> The _OSC definition seems to contradict/negate the above FIRMWARE_FIRST
> definition that says only firmware will handle errors. It's a bit
> different than the IA_32 MCE definition which allows for a GHES_ASSIST
> condition, which would cause Firmware 'First', however does allow the
> error to be received by OSPM AER via GHES:
> 
> Table 18-385  IA-32 Architecture Corrected Machine Check Structure
>    [0] - FIRMWARE_FIRST: If set, this bit indicates that system
>    firmware will handle errors from this source first.
>    [2] - GHES_ASSIST: If set, this bit indicates that although OSPM is
>    responsible for directly handling the error (as expected when
>    FIRMWARE_FIRST is not set), system firmware reports additional
>    information in the context of an interrupt generated by the error.
>    The additional information is reported in a Generic Hardware Error
>    Source structure with a matching Related Source Id.
> 
> 
> I think Linux needs to make an assumption that devices either
> enumerated in HEST or enumerated globally by HEST should be managed by
> FFS. However it seems that Linux should also be correlating that with
> _OSC as _OSC seems to directly contradict and possibly supercede the
> HEST expectation.

That's basically what Linux been doing -- we've been assuming that if
_OSC declines to grant us control, *or* if FFS is set somewhere, we
shouldn't touch the AER capability.  But this leads to lots of weird
corner cases, and I really doubt that firmware and Linux are
interpreting all these the same way.

What breaks if we change Linux to *only* use _OSC to determine
ownership of the AER capability?  My argument is that firmware doesn't
want the OS to touch the AER capability registers, it should decline
to give the OS control of the AER capability via _OSC.

If _OSC grants control to the OS in a case where firmware doesn't want
the OS to have control, I'd say that's just a firmware defect that
should be worked around with some sort of quirk.

> [1] https://members.pcisig.com/wg/PCI-SIG/document/12888
