Return-Path: <linuxppc-dev+bounces-10473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE5B1675C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 22:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsjwS208Qz2yFK;
	Thu, 31 Jul 2025 06:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753906152;
	cv=none; b=gLGatNCFABm61hP/5cVTh/iIctEqRDJk3Tvcg+SOZJKYSL5/cGN7aeyQ6Af2c2+OvfywM19kpRpRcZcwq573SnNQJJf2UlfBi6s0OjKbHojvY2ldM4zbM3+VnspKse2xscjkoQBBTel35dlJHLme+itedWvd6ff0qecJm2cdI3MvKR3KZ7A0uVizaZsHmMvnNzVICrjrlc36uZqnNsNYsKsLqh1b9J6ywvLTwL/9Yt6ROD6ly8jj+ikbsxd0thO0sAzxLqGHH9dYNrs948CQMs3WhYMJ3snehMvayZMkBo6IX3F7t/Oib1dwCMlv0/tTLuLdcHUz6nQqjtftdtFSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753906152; c=relaxed/relaxed;
	bh=lRRC/kUPR7Lt53zDYZqNO2z2QpH9xZzEkK9856ivb9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cg3jPbjn7DktPvQ4eo4YxCzADvRmr7RNO+gcPwruEPK/x9jIvFacRDwJ23oUTANU2nn9Kz3OkxjvFvMok7cLDt4XjBpJarct1dwBCQdVoWp4hkrCOdUgmsJzyo5KSDzF7e2hBD1kfW8wN/bTkhHZ1y9itxlHJzZ7p3/KmziAaH9ZZLlfIdNLHv4/P+jnrhX2wmYwCuqS4kVOU5OT4VxiZQ3IFHF5OJqHpBBuWmlvDyJudlzKHIaYXRgB8jKjUGapjYld59hppm+53JJpAk+uZBQUSdgzwsJA+uDJPFVvO6wO4gi6E4NMZNw2ZNaE0KtjLlpOLw+V8Wd66uh76o9eWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 432 seconds by postgrey-1.37 at boromir; Thu, 31 Jul 2025 06:09:11 AEST
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsjwR0506z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 06:09:10 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 71CAD200B1CF;
	Wed, 30 Jul 2025 22:01:50 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5A85339C007; Wed, 30 Jul 2025 22:01:50 +0200 (CEST)
Date: Wed, 30 Jul 2025 22:01:50 +0200
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
Message-ID: <aIp6LiKJor9KLVpv@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
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
In-Reply-To: <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 01:20:57PM +0200, Niklas Schnelle wrote:
> Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
> status for udev") AER uses the result of error_detected() as parameter
> to pci_uevent_ers(). As pci_uevent_ers() however does not handle
> PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
> beginning of recovery if drivers request a reset. Fix this by treating
> PCI_ERS_RESULT_NEED_RESET as beginning recovery.
[...]
> +++ b/drivers/pci/pci-driver.c
> @@ -1592,6 +1592,7 @@ void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
>  	switch (err_type) {
>  	case PCI_ERS_RESULT_NONE:
>  	case PCI_ERS_RESULT_CAN_RECOVER:
> +	case PCI_ERS_RESULT_NEED_RESET:
>  		envp[idx++] = "ERROR_EVENT=BEGIN_RECOVERY";
>  		envp[idx++] = "DEVICE_ONLINE=0";
>  		break;

I note that PCI_ERS_RESULT_NO_AER_DRIVER is also missing in that
switch/case statement.  I guess for the patch to be complete,
it needs to be added to the PCI_ERS_RESULT_DISCONNECT case.
Do you agree?

If you do and respin the patch with that change, feel free to add
my Reviewed-by.

Since you're an IBMer and EEH is maintained by IBM, I'm wondering
if it would be possible to amend EEH to report "rc" instead of
PCI_ERS_RESULT_NONE in eeh_report_error()?  There are multiple
deviations between AER and EEH, this is one of them.  It would
be good to move towards a more consistent recovery process across
platforms.

Thanks,

Lukas

