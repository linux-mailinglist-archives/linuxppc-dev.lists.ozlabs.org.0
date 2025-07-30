Return-Path: <linuxppc-dev+bounces-10474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA2B1678E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 22:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bskFr0Glxz2yFK;
	Thu, 31 Jul 2025 06:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753907055;
	cv=none; b=O7sAZsN0ydqePhsbR9OrLPEbXg16gKO8tGOHWByqCOP7/LvCBKBtJ7Sb9XzPdrpbW8INmWf5OAcE1sOZW25dKFxEI7CdAFQGKP7p2k0Tf7IGaeXG6CogiFWvCIQhIQpnUNVnz6yRABHBMGZkmqun3s2MOAPl96G/mA7UsyiNtSnHKEGiVk6Bol8urEsX0jxgBoazTIAleaNuF1ZHIgsJ4sUhg4Yox+541wh0FtUzcjZZL++RVHQjiEPkYjuRdM7TYfFtqiyJNO4xj0QhPu258jloqk0cZ8RODgi96hoQ8Gy5K6ZCreKPBqkbnSTv8m2VkctRi0l9NM+zhkv4EZdExg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753907055; c=relaxed/relaxed;
	bh=qOP005lHBEI3dWWe2qQcCj8n0Hu4yftcip/YVjdGyWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWRNIy9w9WEF/emlUyK2/7kdcfFpkxUfgxmDfFTlvR1SJ/YJUljgZyRsBC1COyR3PQcvAPvW8krV4Y9KumYyIx4FlkcCXiSYwKFWCdAh7k1MgXnVDBVjL492uiApq6E8VV8bI8l+24w8nkOmwjnb9Zy3Izn6rcyPI/HdSZpTRnFf0+xw54VWxWyj4lnkubDSb49ANeKf2HhZoX/6yL5JW7Gr7sXKujhe9c1sZXgEIkOuDXC/AMYswTqGGKdaRPrXjuBjuueatgy4WiA7W/m6ZZ4JE0VqOAKVlgs6oFjiaoBD92uJkehaYpRz1rk+G/2JNYt7prlqUFxLfP/7KALrBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bskFq0XVmz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 06:24:15 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 7F00D2C02AD6;
	Wed, 30 Jul 2025 22:24:07 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 6C714467C48; Wed, 30 Jul 2025 22:24:07 +0200 (CEST)
Date: Wed, 30 Jul 2025 22:24:07 +0200
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
Message-ID: <aIp_Z9IdwSjMtDho@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
 <aIp6LiKJor9KLVpv@wunner.de>
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
In-Reply-To: <aIp6LiKJor9KLVpv@wunner.de>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 10:01:50PM +0200, Lukas Wunner wrote:
> On Wed, Jul 30, 2025 at 01:20:57PM +0200, Niklas Schnelle wrote:
> > Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
> > status for udev") AER uses the result of error_detected() as parameter
> > to pci_uevent_ers(). As pci_uevent_ers() however does not handle
> > PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
> > beginning of recovery if drivers request a reset. Fix this by treating
> > PCI_ERS_RESULT_NEED_RESET as beginning recovery.
> [...]
> > +++ b/drivers/pci/pci-driver.c
> > @@ -1592,6 +1592,7 @@ void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
> >  	switch (err_type) {
> >  	case PCI_ERS_RESULT_NONE:
> >  	case PCI_ERS_RESULT_CAN_RECOVER:
> > +	case PCI_ERS_RESULT_NEED_RESET:
> >  		envp[idx++] = "ERROR_EVENT=BEGIN_RECOVERY";
> >  		envp[idx++] = "DEVICE_ONLINE=0";
> >  		break;
> 
> I note that PCI_ERS_RESULT_NO_AER_DRIVER is also missing in that
> switch/case statement.  I guess for the patch to be complete,
> it needs to be added to the PCI_ERS_RESULT_DISCONNECT case.
> Do you agree?

I realize now there's a bigger problem here:  In pcie_do_recovery(),
when control reaches the "failed:" label, a uevent is only signaled
for the *bridge*.  Shouldn't a uevent instead be signaled for every
device *below* the bridge?  (And possibly the bridge itself if it was
the device reporting the error.)

In that case you don't need to add PCI_ERS_RESULT_NO_AER_DRIVER to
the switch/case statement because we wouldn't want to have multiple
uevents reporting disconnect, so the one emitted below the "failed:"
label would be sufficient.

Right now we may report BEGIN_RECOVERY to user space, but we fail to
later on signal FAILED_RECOVERY (unless I'm missing something).

This all looks so broken that I'm starting to wonder if there's any
user space application at all that takes advantage of these uevents?

Thanks,

Lukas

