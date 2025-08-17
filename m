Return-Path: <linuxppc-dev+bounces-11071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68837B2933B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Aug 2025 15:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c4bxg18TSz2xgQ;
	Sun, 17 Aug 2025 23:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755436679;
	cv=none; b=dXLH1SDbFFQ0RZhJqXvBscERq7khuAfOC8rB8suGL2r5ShPpE8kU4ZX07yD82oZj1VXSBAoPdFxTbIhevzLA8cO81FYutA2SIgZl6H8VMMAx4sK2AkWzi+pSS/MbucHcBB+YKMqFVod5ClhVQcR0cRlUhVdkeuszoMdh8PcuXe1T3G2f5tLZm5549OVEnPFvvJq1PJOVk81XzFVXgsEnE08piju7dlUIqGP9UvBLbDEO8235U00uxjTc++o3Gy19Rc+oUxh9cc2WWkdhYksZ/zARoRQvXYItrt2KNKdlkNkbpv4AissMWs6sdv48Btj5c0ycTR+2GI9VmSX8x93Dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755436679; c=relaxed/relaxed;
	bh=8Q5O6dScdPqUml37FquvQuoPfkKpBgnyn23XlpkhiFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IL3bQF7YfhJMF3cuh0aWxc1lz9+a+MKeYGAeZNYZQ28EihHO+VdkbwlQgXf3b4DyXczf9w7Ds2NDZ9507rtKSp16OoHxuZtVTyY/fB76DSYj/qXtPBO6vpYaq5Md5OdAjrbAPJjW6nzleavq4GT79WBpvaXcrA7j0wklRn6oCeyRLScHsjtfj08mACtO6f4/dE4wJYebv9/bmgjtmU3c2M4kpdNjxsbQMxTG3+tMgLMXlRr/0xoWFY+3vK+IRiG2h9zf7GZqi21htwR+H3qo+lnysrMQ4YsL0FVSB1B4wGnJBxRhrXCRdP7Mi+MaKkRKL7PWcjm/446DPiaWb6CYgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c4bxd66dgz2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 23:17:55 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 5BD522006F47;
	Sun, 17 Aug 2025 15:17:51 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 51EE331EAD7; Sun, 17 Aug 2025 15:17:51 +0200 (CEST)
Date: Sun, 17 Aug 2025 15:17:51 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Riana Tauro <riana.tauro@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
Message-ID: <aKHWf3L0NCl_CET5@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
 <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
 <aJ2uE6v46Zib30Jh@wunner.de>
 <eec85830-e024-4801-bbc8-5cfa60048932@linux.intel.com>
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
In-Reply-To: <eec85830-e024-4801-bbc8-5cfa60048932@linux.intel.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 12:29:25PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 8/14/25 2:36 AM, Lukas Wunner wrote:
> > On Thu, Aug 14, 2025 at 09:56:09AM +0200, Niklas Schnelle wrote:
> > > On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
> > > > @@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> > > >   		pci_walk_bridge(bridge, report_mmio_enabled, &status);
> > > >   	}
> > > > +	if (status == PCI_ERS_RESULT_NEED_RESET ||
> > > > +	    state == pci_channel_io_frozen) {
> > > > +		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
> > > > +			pci_warn(bridge, "subordinate device reset failed\n");
> > > > +			goto failed;
> > > > +		}
> > > > +	}
> > > > +
> > > >   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> > > >   		/*
> > > >   		 * TODO: Should call platform-specific
> > > 
> > > I wonder if it might make sense to merge the reset into the above
> > > existing if.
> > 
> > There are drivers such as drivers/bus/mhi/host/pci_generic.c which
> > return PCI_ERS_RESULT_RECOVERED from ->error_detected().  So they
> > fall through directly to the ->resume() stage.  They're doing this
> > even in the pci_channel_io_frozen case (i.e. for Fatal Errors).
> > 
> > But for DPC we must call reset_subordinates() to bring the link back up.
> > And for Fatal Errors, Documentation/PCI/pcieaer-howto.rst suggests that
> > we must likewise call it because the link may be unreliable.
> 
> For fatal errors, since we already ignore the value returned by
> ->error_detected() (by calling reset_subordinates() unconditionally), why
> not update status accordingly in report_frozen_detected() and notify the
> driver about the reset?
> 
> That way, the reset logic could be unified under a single if
> (status == PCI_ERS_RESULT_NEED_RESET) condition.
> 
> Checking the drivers/bus/mhi/host/pci_generic.c implementation, it looks
> like calling slot_reset callback looks harmless.

Unfortunately it's not harmless:

mhi_pci_slot_reset() calls pci_enable_device().  But a corresponding
call to pci_disable_device() is only performed before in
mhi_pci_error_detected() if that function returns
PCI_ERS_RESULT_NEED_RESET.

So there would be an enable_cnt imbalance if I'd change the logic to
overwrite the driver's vote with PCI_ERS_RESULT_NEED_RESET in the
pci_channel_io_frozen case and call its ->slot_reset() callback.

The approach taken by this patch is to minimize risk, avoid any changes
to drivers, make do with minimal changes to pcie_do_recovery() and
limit the behavioral change.

I think overriding status = PCI_ERS_RESULT_NEED_RESET and calling drivers'
->slot_reset() would have to be done in a separate patch on top and would
require going through all drivers again to see which ones need to be
amended.

Also, note that report_frozen_detected() is too early to set
"status = PCI_ERS_RESULT_NEED_RESET".  That needs to happen after the
->mmio_enabled() step, so that drivers get a chance to examine the
device even in the pci_channel_io_frozen case before a reset is
performed.  (The ->mmio_enabled() step is only performed if "status" is
PCI_ERS_RESULT_CAN_RECOVER.)

So then the code would look like this:

	if (state == pci_channel_io_frozen)
		status = PCI_ERS_RESULT_NEED_RESET;

	if (status == PCI_ERS_RESULT_NEED_RESET) {
		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
			pci_warn(bridge, "subordinate device reset failed\n");
			goto failed;
		}

		status = PCI_ERS_RESULT_RECOVERED;
		pci_dbg(bridge, "broadcast slot_reset message\n");
		pci_walk_bridge(bridge, report_slot_reset, &status);
	}

... which isn't very different from the present patch:

        if (status == PCI_ERS_RESULT_NEED_RESET ||
            state == pci_channel_io_frozen) {
                if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
                        pci_warn(bridge, "subordinate device reset failed\n");
                        goto failed;
                }
        }

        if (status == PCI_ERS_RESULT_NEED_RESET) {
                status = PCI_ERS_RESULT_RECOVERED;
                pci_dbg(bridge, "broadcast slot_reset message\n");
                pci_walk_bridge(bridge, report_slot_reset, &status);
        }

... except that this patch avoids touching any drivers.

Thanks,

Lukas

