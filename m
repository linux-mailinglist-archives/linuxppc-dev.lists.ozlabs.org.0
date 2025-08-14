Return-Path: <linuxppc-dev+bounces-10979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 780D2B2611A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 11:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2g9S0yjvz2yhD;
	Thu, 14 Aug 2025 19:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755164188;
	cv=none; b=XN3C6eRwTk6+8cg7SD6v5WDI6dgxqIunVHmZ+PSxRYYCY7x4XYvOYNaNAcF1qef/J+a3qwb9cUgTbS7K4vaIGMl4dkjTHzS6JmD+PmBCEc80rLCSOtewSQSdkAfClXT1ZLoFjToCFaZge5DdVibnh9D+JCz6i6s7xSKuaxGxpCb1n/9OOFQ/5js51hQ+ZeORis1aaf0ZR7itxTwKB26qTx5oSfA80JWGPs874PsIeihU94z+I+SP3QY8KqPQCHAOtHk1I/7JPgR1PwohwVn0D8Xy4ORX+XF5cdvK3pWz20XKTyetlz2IAUNas2m05za/rB4s+QXwes1hFyoXIKMGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755164188; c=relaxed/relaxed;
	bh=w/nJ6tSdBBE3u+U22ICtZPHe3/MaRHxNz4qGdBTAmJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1KNqV6jhyJCZ9FLZvHIRStp7mCl1wSUmj7Wzg0p2C5gOFGeBGOFKR4IRNAhwC+YAHSPaMEGgd6Kb8+wFla/97hWhkwk16aGbcyZb7kBhjGMPIB/gMxF+UXvQ5v/umFSFpVAKJ2aKyl0HBkuuKBbq1ilgSh9Qt0Q/80cDjKkLO353MhGrGHJi7/t2Zn1whnhL/vyP9mpSRUXc94/rPRiB4AUwCA0mnB0Guh2xh8b6geVY87xaZWqVtnFrW2YausphvNX/otVTFkVjquPuct/TsnmhQEUpWqAer+GZ79Ja2uSj9xMMBwGSoOy7uQ8bcU3eva34Jkxsu4a7vGgdAW/8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2g9Q5kLJz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 19:36:24 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 194C620091AD;
	Thu, 14 Aug 2025 11:36:20 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0702EB1D0F; Thu, 14 Aug 2025 11:36:20 +0200 (CEST)
Date: Thu, 14 Aug 2025 11:36:19 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
Message-ID: <aJ2uE6v46Zib30Jh@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
 <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 09:56:09AM +0200, Niklas Schnelle wrote:
> On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
> > +++ b/drivers/pci/pcie/err.c
> > @@ -217,15 +217,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  	pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
> >  
> >  	pci_dbg(bridge, "broadcast error_detected message\n");
> > -	if (state == pci_channel_io_frozen) {
> > +	if (state == pci_channel_io_frozen)
> >  		pci_walk_bridge(bridge, report_frozen_detected, &status);
> > -		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
> > -			pci_warn(bridge, "subordinate device reset failed\n");
> > -			goto failed;
> > -		}
> > -	} else {
> > +	else
> >  		pci_walk_bridge(bridge, report_normal_detected, &status);
> > -	}
> >  
> >  	if (status == PCI_ERS_RESULT_CAN_RECOVER) {
> >  		status = PCI_ERS_RESULT_RECOVERED;
> 
> On s390 PCI errors leave the device with MMIO blocked until either the
> error state is cleared or we reset via the firmware interface. With
> this change and the pci_channel_io_frozen case AER would now do the
> report_mmio_enabled() before the reset with nothing happening between
> report_frozen_detected() and report_mmio_enabled() is MMIO enabled at
> this point?

Yes, MMIO access is controlled through the Memory Space Enable and
Bus Master Enable bits in the Command Register (PCIe r7.0 sec 7.5.1.1.3).
Drivers generally set those bits on probe and they're not automatically
cleared by hardware upon an Uncorrectable Error.

EEH and s390 blocking MMIO access likely serves the purpose of preventing
corrupted data being propagated upstream.  AER doesn't support that
(or at least doesn't mandate that -- certain implementations might
be capable of blocking poisoned data).

Thus with AER, MMIO access is usually possible already in ->error_detected().
The only reason why drivers shouldn't be doing that and instead defer
MMIO access to ->mmio_enabled() is to be compatible with EEH and s390.

There are exceptions to this rule:  E.g. if the Uncorrectable Error
was "Surprise Down", the link to the device is down and MMIO access
isn't possible, neither in ->error_detected() nor ->mmio_enabled().
Drivers should check whether an MMIO read results in an "all ones"
response (PCI_POSSIBLE_ERROR()), which is usually what the host bridge
fabricates upon a Completion Timeout caused by the link being down
and the Endpoint being inaccessible.

(There's a list of all the errors with default severity etc in PCIe r7.0
sec 6.2.7.)

I believe DPC was added to the PCIe Base Specification to prevent
propagating corrupted data upstream, similarly to EEH and s390.
DPC brings down the link immediately upon an Uncorrectable Error
(the Linux driver confines this to Fatal Errors), but as a side
effect this results in a Hot Reset being propagated down the
hierarchy, making it impossible to access the device in the
faulting state to retrieve debug information etc.  After the link
has been brought up again, the device is in post-reset state.
So DPC doesn't allow for reset-less recovery.

With the ordering change introduced by this commit, ->mmio_enabled()
will no longer be able to access MMIO space in the DPC case because
the link hasn't been brought back up until ->slot_reset().  But as
explained in the commit message, I only found two drivers affected
by this.  One seems to be EEH-specific (drivers/scsi/ipr.c).
And the other one (drivers/scsi/sym53c8xx_2/sym_glue.c) dumps debug
registers in ->mmio_enabled() and I'm arguing that with this commit
it's dumping "all ones", but right now it's dumping the post-reset
state of the device, which isn't any more useful.

> I think this callback really only makes sense if you have
> an equivalent to s390's clearing of the error state that enables MMIO
> but doesn't otherwise reset. Similarly EEH has eeh_pci_enable(pe,
> EEH_OPT_THAW_MMIO).

Right.

> > @@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  		pci_walk_bridge(bridge, report_mmio_enabled, &status);
> >  	}
> >  
> > +	if (status == PCI_ERS_RESULT_NEED_RESET ||
> > +	    state == pci_channel_io_frozen) {
> > +		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
> > +			pci_warn(bridge, "subordinate device reset failed\n");
> > +			goto failed;
> > +		}
> > +	}
> > +
> >  	if (status == PCI_ERS_RESULT_NEED_RESET) {
> >  		/*
> >  		 * TODO: Should call platform-specific
> 
> I wonder if it might make sense to merge the reset into the above
> existing if.

There are drivers such as drivers/bus/mhi/host/pci_generic.c which
return PCI_ERS_RESULT_RECOVERED from ->error_detected().  So they
fall through directly to the ->resume() stage.  They're doing this
even in the pci_channel_io_frozen case (i.e. for Fatal Errors).

But for DPC we must call reset_subordinates() to bring the link back up.
And for Fatal Errors, Documentation/PCI/pcieaer-howto.rst suggests that
we must likewise call it because the link may be unreliable.

Hence the if-condition must use a boolean OR, i.e.:

	if (status == PCI_ERS_RESULT_NEED_RESET ||
	    state == pci_channel_io_frozen) {

... whereas if I would move the invocation of reset_subordinates() inside
the existing "if (status == PCI_ERS_RESULT_NEED_RESET)", it would be
equivalent to a boolean AND.

I would have to amend drivers such as drivers/bus/mhi/host/pci_generic.c
to work with the changed logic and I figured that it's simpler to only
change pcie_do_recovery() rather than touching all affected drivers.
I don't have any of that hardware and so it seems risky touching all
those drivers.

> I'm a bit confused by that TODO comment and
> anyway, it asks for a platform-specific reset to be added bu
> reset_subordinate() already seems to allow platform specific behavior,
> so maybe the moved reset should replace the TODO?

Manivannan has a patch pending which removes the TODO:

https://lore.kernel.org/all/20250715-pci-port-reset-v6-1-6f9cce94e7bb@oss.qualcomm.com/

> Also I think for the
> kind of broken case where the state is pci_channel_io_frozen but the
> drivers just reports PCI_ERS_RESULT_CAN_RECOVER it looks like there
> would be a reset but no calls to ->slot_reset().

Right, but that's what AER is currently doing and drivers such as
drivers/bus/mhi/host/pci_generic.c are written to work with the
existing flow.

Thanks,

Lukas

