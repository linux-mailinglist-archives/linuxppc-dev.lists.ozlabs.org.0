Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACBA50EB74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 00:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnK443Ww8z3c8v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 08:11:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TP8CwJVh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=david.e.box@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TP8CwJVh; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnDDl2Lpyz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 04:33:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650911639; x=1682447639;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmlGUQOKfZ1fEEUeDa+ZjhpmUMMaxIHAYo6P39XG2Tc=;
 b=TP8CwJVh1upPh7dU6e9gXJw0QgHzN2b5PBdeXOJDrX9yOLYczAWCK4Pp
 JDfd2MjF5gMFqdFBFiyqqvjDPkr1S6VJHz2Xtdayu59HSPwpZTFALaR86
 ieYvYYB1vpwhFXSzXyqMuy0roQa7oWrqYh5YH5EAqXeGE4rIPIoYjJv8p
 IZGTbMXFjBmU226EEmfXS4hZgfMDVrrsdSZqx7VPfAsfARV7mW6P87UDT
 puxUseG08LqxhAPW75q5ND+vN9hbhzmxumV1s/5jyWkLU03vIbV86/WYY
 sIgHv0j7U/kn4iZdxA/2gCmfe6rN8RH8z0Z6ok857aHgc1QtC3cKqKvz/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="252701385"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="252701385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 11:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="532246106"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 25 Apr 2022 11:32:55 -0700
Received: from jiunhong-mobl.amr.corp.intel.com (unknown [10.209.83.58])
 by linux.intel.com (Postfix) with ESMTP id C001B5809EB;
 Mon, 25 Apr 2022 11:32:54 -0700 (PDT)
Message-ID: <44ebf450aa3300e02aba6ec009d8bea20c0fc535.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable PTM
From: "David E. Box" <david.e.box@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, "Jingar, Rajvi"
 <rajvi.jingar@intel.com>
Date: Mon, 25 Apr 2022 11:32:54 -0700
In-Reply-To: <20220423150132.GA1552054@bhelgaas>
References: <20220423150132.GA1552054@bhelgaas>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 08:10:52 +1000
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
Reply-To: david.e.box@linux.intel.com
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
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2022-04-23 at 10:01 -0500, Bjorn Helgaas wrote:
> On Sat, Apr 23, 2022 at 12:43:14AM +0000, Jingar, Rajvi wrote:
> > > -----Original Message-----
> > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > On Thu, Apr 14, 2022 at 07:54:02PM +0200, Rafael J. Wysocki wrote:
> > > > On 3/25/2022 8:50 PM, Rajvi Jingar wrote:
> > > > > For the PCIe devices (like nvme) that do not go into D3 state still
> > > > > need to
> > > > > disable PTM on PCIe root ports to allow the port to enter a lower-
> > > > > power PM
> > > > > state and the SoC to reach a lower-power idle state as a whole. Move
> > > > > the
> > > > > pci_disable_ptm() out of pci_prepare_to_sleep() as this code path is
> > > > > not
> > > > > followed for devices that do not go into D3. This patch fixes the
> > > > > issue
> > > > > seen on Dell XPS 9300 with Ice Lake CPU and Dell Precision 5530 with
> > > > > Coffee
> > > > > Lake CPU platforms to get improved residency in low power idle states.
> > > > > 
> > > > > Fixes: a697f072f5da ("PCI: Disable PTM during suspend to save power")
> > > > > Signed-off-by: Rajvi Jingar <rajvi.jingar@intel.com>
> > > > > Suggested-by: David E. Box <david.e.box@linux.intel.com>
> > > > > ---
> > > > >   drivers/pci/pci-driver.c | 10 ++++++++++
> > > > >   drivers/pci/pci.c        | 10 ----------
> > > > >   2 files changed, 10 insertions(+), 10 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > > > > index 8b55a90126a2..ab733374a260 100644
> > > > > --- a/drivers/pci/pci-driver.c
> > > > > +++ b/drivers/pci/pci-driver.c
> > > > > @@ -847,6 +847,16 @@ static int pci_pm_suspend_noirq(struct device
> > > > > *dev)
> > > > >   	if (!pci_dev->state_saved) {
> > > > >   		pci_save_state(pci_dev);
> > > > > +		/*
> > > > > +		 * There are systems (for example, Intel mobile chips
> > > > > since
> > > Coffee
> > > > > +		 * Lake) where the power drawn while suspended can be
> > > significantly
> > > > > +		 * reduced by disabling PTM on PCIe root ports as this
> > > > > allows the
> > > > > +		 * port to enter a lower-power PM state and the SoC to
> > > > > reach a
> > > > > +		 * lower-power idle state as a whole.
> > > > > +		 */
> > > > > +		if (pci_pcie_type(pci_dev) == PCI_EXP_TYPE_ROOT_PORT)
> > > > > +			pci_disable_ptm(pci_dev);
> > > 
> > > Why is disabling PTM dependent on pci_dev->state_saved?  The point of
> > > this is to change the behavior of the device, and it seems like we
> > > want to do that regardless of whether the driver has used
> > > pci_save_state().
> > 
> > Because we use the saved state to restore PTM on the root port. 
> > And it's under this condition that the root port state gets saved.
> 
> Yes, I understand that pci_restore_ptm_state() depends on a previous
> call to pci_save_ptm_state().
> 
> The point I'm trying to make is that pci_disable_ptm() changes the
> state of the device, and that state change should not depend on
> whether the driver has used pci_save_state().

We do it here because D3 depends on whether the device state was saved by the
driver.

	if (!pci_dev->state_saved) {
        	pci_save_state(pci_dev);

		/* disable PTM here */

		if (pci_power_manageable(pci_dev))
			pci_prepare_to_sleep(pci_dev);
	}


If we disable PTM before the check, we will have saved "PTM disabled" as the
restore state. And we can't do it after the check as the device will be in D3.

As to disabling PTM on all devices, I see no problem with this, but the
reasoning is different. We disabled the root port PTM for power savings.


David

> 
> When we're putting a device into a low-power state, I think we want to
> disable PTM *always*, no matter what the driver did.  And I think we
> want to do it for all devices, not just Root Ports.
> 
> Bjorn

