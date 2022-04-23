Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D558F50CB83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 17:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlvdG51hCz3bdB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 01:02:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j4W+UeVu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j4W+UeVu; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Klvcg18Ckz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 01:01:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4271B6129D;
 Sat, 23 Apr 2022 15:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BCCC385A0;
 Sat, 23 Apr 2022 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650726095;
 bh=uaq6jNypdiikbr84HxxnRbgSGuCdBE8n2XWA2kVi2Go=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=j4W+UeVu3/Vi110qIfDgsZqhpYu8qMnJWI5iwdqmEpz6rWP2cQz6EBroNuEBknJSt
 Pajs7dX7YzmIgbttwC9wDbnRxYZV+ydbrIk7w/o6T8XiPN+o7fk7kKZyl6V2t8SlqS
 y2Vp0AlB/QEOBmxSznnjFkmK1SmrVmzGqvxuDu7/4C91717uTC5+JM+2VtKVYlCLoa
 GSn+cdsFeV7jmjOjLNH6WByptK7hTvUzISBNOpHmM/bpS34kwjP4y6d5i213GV86wT
 X6Ml966XTBxMhEKT4pyIyNqqu8WnOMSB8q42TueLKq1HmPXKsaikWy5t2IMnOrNibw
 xpaRC8DS/Cu/w==
Date: Sat, 23 Apr 2022 10:01:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Jingar, Rajvi" <rajvi.jingar@intel.com>
Subject: Re: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable PTM
Message-ID: <20220423150132.GA1552054@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB507047C0109C5163EF20D9AE9EF69@SJ0PR11MB5070.namprd11.prod.outlook.com>
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
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "koba.ko@canonical.com" <koba.ko@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 23, 2022 at 12:43:14AM +0000, Jingar, Rajvi wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > On Thu, Apr 14, 2022 at 07:54:02PM +0200, Rafael J. Wysocki wrote:
> > > On 3/25/2022 8:50 PM, Rajvi Jingar wrote:
> > > > For the PCIe devices (like nvme) that do not go into D3 state still need to
> > > > disable PTM on PCIe root ports to allow the port to enter a lower-power PM
> > > > state and the SoC to reach a lower-power idle state as a whole. Move the
> > > > pci_disable_ptm() out of pci_prepare_to_sleep() as this code path is not
> > > > followed for devices that do not go into D3. This patch fixes the issue
> > > > seen on Dell XPS 9300 with Ice Lake CPU and Dell Precision 5530 with Coffee
> > > > Lake CPU platforms to get improved residency in low power idle states.
> > > >
> > > > Fixes: a697f072f5da ("PCI: Disable PTM during suspend to save power")
> > > > Signed-off-by: Rajvi Jingar <rajvi.jingar@intel.com>
> > > > Suggested-by: David E. Box <david.e.box@linux.intel.com>
> > > > ---
> > > >   drivers/pci/pci-driver.c | 10 ++++++++++
> > > >   drivers/pci/pci.c        | 10 ----------
> > > >   2 files changed, 10 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > > > index 8b55a90126a2..ab733374a260 100644
> > > > --- a/drivers/pci/pci-driver.c
> > > > +++ b/drivers/pci/pci-driver.c
> > > > @@ -847,6 +847,16 @@ static int pci_pm_suspend_noirq(struct device *dev)
> > > >   	if (!pci_dev->state_saved) {
> > > >   		pci_save_state(pci_dev);
> > > > +		/*
> > > > +		 * There are systems (for example, Intel mobile chips since
> > Coffee
> > > > +		 * Lake) where the power drawn while suspended can be
> > significantly
> > > > +		 * reduced by disabling PTM on PCIe root ports as this allows the
> > > > +		 * port to enter a lower-power PM state and the SoC to reach a
> > > > +		 * lower-power idle state as a whole.
> > > > +		 */
> > > > +		if (pci_pcie_type(pci_dev) == PCI_EXP_TYPE_ROOT_PORT)
> > > > +			pci_disable_ptm(pci_dev);
> > 
> > Why is disabling PTM dependent on pci_dev->state_saved?  The point of
> > this is to change the behavior of the device, and it seems like we
> > want to do that regardless of whether the driver has used
> > pci_save_state().
> 
> Because we use the saved state to restore PTM on the root port. 
> And it's under this condition that the root port state gets saved.

Yes, I understand that pci_restore_ptm_state() depends on a previous
call to pci_save_ptm_state().

The point I'm trying to make is that pci_disable_ptm() changes the
state of the device, and that state change should not depend on
whether the driver has used pci_save_state().

When we're putting a device into a low-power state, I think we want to
disable PTM *always*, no matter what the driver did.  And I think we
want to do it for all devices, not just Root Ports.

Bjorn
