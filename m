Return-Path: <linuxppc-dev+bounces-10483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8AB171AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 15:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bt8Nc5Qvkz2yLB;
	Thu, 31 Jul 2025 23:01:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753966896;
	cv=none; b=E8D1+7hn4tBasttO/B+jlBi8FZz5e+Pg8+W8pLLcpM2/ULBuKZcS4zj8Bu6BDFwulKNw98gcXlknx8ed5OA8v7xvB6ZDbVnwg2iGUnkhI+vlzZaf0VqWkx2PXSFrPNoxuMPXVb6zW1PePYlsvBQdXymN1J1gKaz+cw/YJrqg68KJwzwEEAXAnGJEklBVXy7Q+OUkwV+e8dYV4mjhKjvPGPu+QntM5kvYw23dI03tkQVhVf0zj52lx2x3nsaUMy7uiyv+0h4EGci4Z5sO+3TmbiU/Dr4zxnnxhaMIIZUvC/n9XekxdIx5oDc7CMfzyaS5LxuEBwf5s/uL+H1NFte2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753966896; c=relaxed/relaxed;
	bh=jxW+6785tJEz/E3KGQE/g1RUSoxOfHYk4JGiyk+THwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqCbfhmX+O9TdgofJFeUD7wM4AtMsmASc0o22XE/YUd0t0fbU+yJDQQ+zS9h+HQlfaWQiI5jHi7ROD7bytojgt3QmIYXj05va91W6h2OMwUkL3zrVL0mgh2ApcWhrdyutq7Bc6OvaC1zrCaywsquA0mEv5yqnLCKB5ytcQm6TW1anDNFoBTOOQZdw8XcC/Kie6APglkGtgcN6D785BHnQcbr4sRQDlEoKQjGJjg/LXXv2b3PWr4iwTa0mK2ykejBrbcIlipP+2RSCwBRru/L6qkadpRGyi4L2X9HzHQFTsDPrJ+k9HZoZePU+vLZjY94JjwM5EVA+S7ZFEdh1YEwdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bt8Nb392sz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 23:01:32 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 6C3922C06E34;
	Thu, 31 Jul 2025 15:01:28 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 550D02A060F; Thu, 31 Jul 2025 15:01:28 +0200 (CEST)
Date: Thu, 31 Jul 2025 15:01:28 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <aItpKIhYr0T8jf7A@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
 <aIp6LiKJor9KLVpv@wunner.de>
 <aIp_Z9IdwSjMtDho@wunner.de>
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
In-Reply-To: <aIp_Z9IdwSjMtDho@wunner.de>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 10:24:07PM +0200, Lukas Wunner wrote:
> On Wed, Jul 30, 2025 at 10:01:50PM +0200, Lukas Wunner wrote:
> > On Wed, Jul 30, 2025 at 01:20:57PM +0200, Niklas Schnelle wrote:
> > > Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
> > > status for udev") AER uses the result of error_detected() as parameter
> > > to pci_uevent_ers(). As pci_uevent_ers() however does not handle
> > > PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
> > > beginning of recovery if drivers request a reset. Fix this by treating
> > > PCI_ERS_RESULT_NEED_RESET as beginning recovery.
> > [...]
> > > +++ b/drivers/pci/pci-driver.c
> > > @@ -1592,6 +1592,7 @@ void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
> > >  	switch (err_type) {
> > >  	case PCI_ERS_RESULT_NONE:
> > >  	case PCI_ERS_RESULT_CAN_RECOVER:
> > > +	case PCI_ERS_RESULT_NEED_RESET:
> > >  		envp[idx++] = "ERROR_EVENT=BEGIN_RECOVERY";
> > >  		envp[idx++] = "DEVICE_ONLINE=0";
> > >  		break;
> > 
> > I note that PCI_ERS_RESULT_NO_AER_DRIVER is also missing in that
> > switch/case statement.  I guess for the patch to be complete,
> > it needs to be added to the PCI_ERS_RESULT_DISCONNECT case.
> > Do you agree?
> 
> I realize now there's a bigger problem here:  In pcie_do_recovery(),
> when control reaches the "failed:" label, a uevent is only signaled
> for the *bridge*.  Shouldn't a uevent instead be signaled for every
> device *below* the bridge?  (And possibly the bridge itself if it was
> the device reporting the error.)

The small patch below should resolve this issue.
Please let me know what you think.

> In that case you don't need to add PCI_ERS_RESULT_NO_AER_DRIVER to
> the switch/case statement because we wouldn't want to have multiple
> uevents reporting disconnect, so the one emitted below the "failed:"
> label would be sufficient.

I'll send a separate Reviewed-by for your original patch as the small
patch below should resolve my concern about PCI_ERS_RESULT_NO_AER_DRIVER.

> This all looks so broken that I'm starting to wonder if there's any
> user space application at all that takes advantage of these uevents?

I'd still be interested to know which user space application you're
using to track these uevents?

Thanks,

Lukas

-- >8 --

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index e795e5ae..3a95aa2 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -165,6 +165,12 @@ static int report_resume(struct pci_dev *dev, void *data)
 	return 0;
 }
 
+static int report_disconnect(struct pci_dev *dev, void *data)
+{
+	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
+	return 0;
+}
+
 /**
  * pci_walk_bridge - walk bridges potentially AER affected
  * @bridge:	bridge which may be a Port, an RCEC, or an RCiEP
@@ -272,7 +278,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 failed:
 	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
 
-	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
+	pci_walk_bridge(bridge, report_disconnect, NULL);
 
 	pci_info(bridge, "device recovery failed\n");
 

