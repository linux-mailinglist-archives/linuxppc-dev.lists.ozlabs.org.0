Return-Path: <linuxppc-dev+bounces-10498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A2B17C6D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 07:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btZdg2Sqdz2y82;
	Fri,  1 Aug 2025 15:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754027063;
	cv=none; b=LJEzjH7OuWDsf0pE0+Hl81cg832C/oYCSBzx+mD3M+HNkbwqSFyCPhfiHB07+w0nBaoukMYT3Y6LcRQbveM6Nq95QJ3pdLaOJPxIGOB0tNxse+w0SPsa1/3+sdqeRHfIoXk6hEw6TA3kwWSbJu5bjRNIWthHzRcCnusA4m5NS8c0yE1zsHsGmoazTDtjTgyNceCH9lQFUwY5CyxCOKXjfuCoT/e03eN8+mcwbFH9HL83JD5U2c8LBTySa45QwiLGeUNapPpNny0xUcJI49jZ2HS3rwDFCsdHPnE9QcmMuIOhZPD7nlgecl8VLbPKlhTyjEhoVn0Hxx7K4a7gVscjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754027063; c=relaxed/relaxed;
	bh=qPINZeWRyJ3TyvW45SwmhTUJQVPkY/h7nBGbxPl8Few=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFzD+UPrHqjE9wo7w4VpwMkchV5hSfwqPN9uGQHWlB0nB0PfcZh3a4i25IaZGUxGvhRyolKjyxmu4t+zzhXapK7uGganpXCQpbDYzNLDO2++cr/zO5HhibbK4b1ce1kCayHqgH27kC2R0PSElnnEEhXJGElgDIGbRUdGchhHGGwgKKWb6nsU3OTjzf+aYjNM0cBMPSYuKrKiRUPX55flH8qgvnLBDHEGgYhy6lcP/iPjXQTMqzKKfnlCWwBHewlDDHKGBUxarWD/UeRsAl5V0Lz9+GQKR4x0L4E/gA9P/fYbRg+B9/iXLfG7wAURmPLRprZGDEN9M4bfSQQlRFLJFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 121340 seconds by postgrey-1.37 at boromir; Fri, 01 Aug 2025 15:44:22 AEST
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btZdf1GLMz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 15:44:19 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 69F252012A16;
	Fri,  1 Aug 2025 07:44:14 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3BF1B38CA21; Fri,  1 Aug 2025 07:44:14 +0200 (CEST)
Date: Fri, 1 Aug 2025 07:44:14 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v3 1/2] PCI/AER: Fix missing uevent on recovery when a
 reset is requested
Message-ID: <aIxULlDfQw4yhFDv@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
 <aIp6LiKJor9KLVpv@wunner.de>
 <aIp_Z9IdwSjMtDho@wunner.de>
 <aItpKIhYr0T8jf7A@wunner.de>
 <4969c441-fe2a-470f-9efd-4661efca56ec@linux.intel.com>
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
In-Reply-To: <4969c441-fe2a-470f-9efd-4661efca56ec@linux.intel.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 31, 2025 at 10:04:38AM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 7/31/25 6:01 AM, Lukas Wunner wrote:
> > +++ b/drivers/pci/pcie/err.c
> > @@ -165,6 +165,12 @@ static int report_resume(struct pci_dev *dev, void *data)
> >   	return 0;
> >   }
> > +static int report_disconnect(struct pci_dev *dev, void *data)
> > +{
> > +	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
> > +	return 0;
> > +}
> 
> Since you are notifying the user space, I am wondering whether the drivers
> should be notified about the recovery failure?

The drivers are usually *causing* the recovery failure by returning
PCI_ERS_RESULT_DISCONNECT from their pci_error_handlers callbacks
(or by lacking pci_error_handlers, in particular ->error_detected()).

So in principle the drivers should be aware of recovery failure.

There are cases where multiple drivers are involved.  E.g. on GPUs,
there's often a PCIe switch with a graphics device and various sound
or telemetry devices.  Typically errors are reported by the Upstream
Port, so the Secondary Bus Reset occurs at the Root or Downstream Port
above the Upstream Port and affects the switch and all subordinate
devices.  In cases like this, recovery failure may be caused by a
single driver (e.g. GPU) and the other drivers (e.g. telemetry) may
be unaware of it.

The recovery flow documented in Documentation/PCI/pci-error-recovery.rst
was originally conceived for EEH and indeed EEH does notify all drivers
of recovery failures by invoking the ->error_detected() callback with
channel_state pci_channel_io_perm_failure.  See this call ...

	eeh_pe_report("error_detected(permanent failure)", pe,
		      eeh_report_failure, NULL);

... in arch/powerpc/kernel/eeh_driver.c below the recover_failed label
in eeh_handle_normal_event().

I don't know why pcie_do_recovery() doesn't do the same on recovery
failure.  This is one of several annoying deviations between AER and
EEH.  Ideally the behavior should be the same across all platforms
so that drivers don't have to cope with platform-specific quirks.

However I think that's orthogonal to the pci_uevent_ers() invocation
in pcie_do_recovery().

Thanks,

Lukas

