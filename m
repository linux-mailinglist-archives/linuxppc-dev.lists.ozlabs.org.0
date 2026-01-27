Return-Path: <linuxppc-dev+bounces-16302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OaGHFpxeGnEpwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 09:03:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4AD90E38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 09:03:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0dFc2l6Kz2xjP;
	Tue, 27 Jan 2026 19:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.76.133.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769501012;
	cv=none; b=fKLkX2fmxxnutAI1YRdaQof/pVfAHdx3H0W7BLAo0h7t1R4SmX0sXF1iN8vMGTGottrdePGTaQpbHKYhFXB1Ouq13HmCZ8F6jpye7M7K67QCtz/or+3S6zQREAijehQH6TXiWBfYwk6aUq3/iBwAkbdtdA+0gj6aNvGIZeaD0M1i/fT3toaYlrv6GHd/Pdw/+h7RB2TxZPxhvYgreqBKe8bJtMWiceDkoZAswKaczaA7Zzf2cYgUp1AkHjlt2MZk980PuvWrhgXz7WSp/LpeQ1Kv1rPNrA0ioFaI9IRMTld08HHuRMBEAGQGFOAghQ7Rj2h9epJWHfKU7nOGEVCVew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769501012; c=relaxed/relaxed;
	bh=OqLTZnaR76/X4GuLe7DHwPK0CdnfxdxNomCoVQx6ngw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrBTtFQvL650PQriOWa7Qge411jsgqfR02fufau+6fl/8SZVpyWSP7FkZ8vYJQoHThSmz2Ep2WwO/8EJKzJjbW+xgZFXcEqxOTdF/XpDTdLTn8zDJRugEXOUSPM74l5vYcE5lHwcKrREyXjWwzAXO4VjPlZenQNiEBpqw8RphdNsLGQFtqgqTlTmytuCeUYOvluCbLvs0HdgUQHmyLHhEYATshbq7oo8EquSZQxqvVE0heQjWchWvcR8OiCLnHkzjKVn8GAqjt6asLFyCR2AzZg0PRJzwFTRqkGWnylJY5zlfQ4qx8GK3nruZ0CH92lub9fWNEus/R9jtO77G+bNFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 389 seconds by postgrey-1.37 at boromir; Tue, 27 Jan 2026 19:03:30 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [144.76.133.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0dFZ5fl9z2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 19:03:30 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 37B772C003FA;
	Tue, 27 Jan 2026 08:56:53 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 07EA22F4FF; Tue, 27 Jan 2026 08:56:53 +0100 (CET)
Date: Tue, 27 Jan 2026 08:56:53 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Terry Bowman <terry.bowman@amd.com>,
	linux-pci@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>,
	tianruidong@linux.alibaba.com, Keith Busch <kbusch@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PCI/AER: Clear stale errors on reporting agents upon
 probe
Message-ID: <aXhvxYw6q3XvoEFh@wunner.de>
References: <3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de>
 <06fcb922-458c-473c-999a-1dd8518976f1@linux.intel.com>
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
In-Reply-To: <06fcb922-458c-473c-999a-1dd8518976f1@linux.intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16302-lists,linuxppc-dev=lfdr.de];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sathyanarayanan.kuppuswamy@linux.intel.com,m:helgaas@kernel.org,m:terry.bowman@amd.com,m:linux-pci@vger.kernel.org,m:xueshuai@linux.alibaba.com,m:tianruidong@linux.alibaba.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,vger.kernel.org,linux.alibaba.com,linux.ibm.com,gmail.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.969];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5F4AD90E38
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:42:06AM -0800, Kuppuswamy Sathyanarayanan wrote:
> On 1/25/2026 1:25 AM, Lukas Wunner wrote:
> > Correctable and Uncorrectable Error Status Registers on reporting agents
> > are cleared upon PCI device enumeration in pci_aer_init() to flush past
> > events.  They're cleared again when an error is handled by the AER driver.
> > 
> > If an agent reports a new error after pci_aer_init() and before the AER
> > driver has probed on the corresponding Root Port or Root Complex Event
> > Collector, that error is not handled by the AER driver:  It clears the
> > Root Error Status Register on probe, but neglects to re-clear the
> > Correctable and Uncorrectable Error Status Registers on reporting agents.
> > 
> > The error will eventually be reported when another error occurs.  Which
> > is irritating because to an end user it appears as if the earlier error
> > has just happened.
> > 
> > Amend the AER driver to clear stale errors on reporting agents upon probe.
> > 
> > Skip reporting agents which have not invoked pci_aer_init() yet to avoid
> > using an uninitialized pdev->aer_cap.  They're recognizable by the error
> > bits in the Device Control register still being clear.
> > 
> > Reporting agents may execute pci_aer_init() after the AER driver has
> > probed, particularly when devices are hotplugged or removed/rescanned via
> > sysfs.  For this reason, it continues to be necessary that pci_aer_init()
> > clears Correctable and Uncorrectable Error Status Registers.
> 
> Can you include details about where and in what configuration you observed 
> this issue?

The issue was observed on an upcoming Xeon "Diamond Rapids" platform,
where certain Root Complex Integrated Endpoints (the Data Streaming
Accelerator and In-Memory Analytics Accelerator) raise a Correctable Error
of type "Advisory Non-Fatal Error" when certain fields in Config Space are
accessed.  The RCiEPs send an ERR_COR Message to their Root Complex Event
Collector, but it is not handled because the AER driver hasn't probed yet.
When it later on does probe, it only clear the error bits of the RCEC, not
those of the RCiEPs.

Since this platform is not yet in customers' hands and the issue
apparently wasn't observed on other platforms before, I refrained
from including those details in the commit message.  But I can respin
and include them, or Bjorn may choose to amend the commit message
with those details if/when applying the patch.

> > +static int clear_status_iter(struct pci_dev *dev, void *data)
> > +{
> > +	u16 devctl;
> > +
> > +	/* Skip if pci_enable_pcie_error_reporting() hasn't been called yet */
> > +	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &devctl);
> > +	if (!(devctl & PCI_EXP_AER_FLAGS))
> > +		return 0;
> > +
> > +	pci_aer_clear_status(dev);
> > +	pcie_clear_device_status(dev);
> 
> Should pci_aer_init() also clear device status along with uncor/cor
> error status?

Hm, good question.  For AER-supporting devices, it probably makes sense
since we're also clearing the bits when handling an error.

It's unclear what to do on non-AER-supporting devices.  PCIe r7.0 sec 6.2.1
calls this "baseline capability" error signaling.  If a device doesn't
support AER, I don't think we get a (spec-defined) interrupt to report
and clear errors.  But the device may still raise an interrupt which
would then be received and handled by its driver in some custom way.

So I guess that on "baseline capability" devices, it is the job of the
device driver to report and clear errors.  One could argue that it's
also the driver's job to clear stale bits on probe.  Because if the
kernel does that on enumeration, new errors may occur until the driver
probes and so the driver would have to clear stale bits on probe
anyway.

I can look into amending pci_aer_init() to clear the Device Status
error bits on AER-supporting devices, but it's an orthogonal issue
to the one addressed by this patch.

Thanks,

Lukas

