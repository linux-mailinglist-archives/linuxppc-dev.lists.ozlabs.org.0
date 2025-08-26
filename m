Return-Path: <linuxppc-dev+bounces-11300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF0B35453
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yH00pCMz3dJg;
	Tue, 26 Aug 2025 16:21:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189292;
	cv=none; b=TawsQthVm3+qyydSKrsEiKCO4Ugz16BFrQBuPh2L9vCn/12wjylqxx2g/tePAzaSPy+joMHZuYy2hRGAsG9NEXNX2AFTGIHq1zcJ8MvII4XQa0dvhKY8PRzt81R1fDl7xbIEZd6PNMm1lFVNH2tFR+zCDUe2jLCvt5tTUpdqhBxFjMvckQimbJZJ6gHYV+eRxBlJEgD55dodd7NXY9nkTHxUsbKRJH6v0WVbRyLCxI3p/raq9woBNaYS93uYPtPHuQRPPKx2/aEyvMpZzVz+XjR8GQxkYWroOFcyZ9IGBwSvntAygVcag2Gs6SUJarqj+W+3Mwd6Lqi0gehLhA5h7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189292; c=relaxed/relaxed;
	bh=ILvWheSw7axbg3krBZNj8XsIqzPcs7LCGiznkPNeZiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lq5T4yrZUwbnEHHtgTCIaiAaDhJNFZ5IqzE14upynXpDkJ1yAR3NN92sbvV6cAia16iMmxTInRoxMC7NjQ1RjB/yx888frP6t7S6V0bguAomxfIcem+S1IvLWoFnAtKY9XKmK/VnTbbxFn/PNbFeuy7SoEVgn72weTSNlhjSWurMCJ/paVCdyWm39bAPoH6TY++qdrMkM/vgVRPP4x32duccrsoqm5ImVfWiScW971JVt5lonQ7GGLgRyYtLs+mdMCWl71YKXDh1K8Z1fGpQjblpcw/KH+7gpSogLy5/LJdax4+coU9xhuxap/y9fHNBDRU3EgLxF0rUDbilUasH0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9yGz0g4Pz3dJM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:21:29 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 4063C2C05262;
	Tue, 26 Aug 2025 08:21:24 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 16EC962C37; Tue, 26 Aug 2025 08:21:24 +0200 (CEST)
Date: Tue, 26 Aug 2025 08:21:24 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
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
Subject: Re: [PATCH v5 0/3] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
Message-ID: <aK1SZGJBjrOx0s6y@wunner.de>
References: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
 <20250814210201.GA348169@bhelgaas>
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
In-Reply-To: <20250814210201.GA348169@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 04:02:01PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 07, 2025 at 03:55:37PM +0200, Niklas Schnelle wrote:
> > Niklas Schnelle (3):
> >       PCI/AER: Fix missing uevent on recovery when a reset is requested
> >       PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI recovery
> >       powerpc/eeh: Use result of error_detected() in uevent
> > 
> >  arch/powerpc/kernel/eeh_driver.c | 2 +-
> >  arch/s390/pci/pci_event.c        | 3 +++
> >  drivers/pci/pci-driver.c         | 3 ++-
> >  include/linux/pci.h              | 2 +-
> >  4 files changed, 7 insertions(+), 3 deletions(-)
> 
> Applied on pci/aer for v6.18, thanks!  This on top of Lukas's series:
> 
>   https://lore.kernel.org/all/cover.1755008151.git.lukas@wunner.de/
> 
> Expect the whole branch to be rebased to add Reviewed-by, etc.

In case it helps, these are all the tags that were offered for my series
and that haven't been added to the pci/aer branch yet:

d0a2dee7d458 PCI/AER: Allow drivers to opt in to Bus Reset on Non-Fatal Errors
  Reviewed-by: Linas Vepstas <linasvepstas@gmail.com>
  https://lore.kernel.org/r/CAHrUA34fVV48MShC4CrXSmveR9i8MC4KAQxtM+XQY_Ao8joBQw@mail.gmail.com/
  Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  https://lore.kernel.org/r/8491adbd-d8e8-465a-971e-3fe50e2561b1@linux.intel.com/

1cbc5e25fb70 PCI/ERR: Fix uevent on failure to recover
  Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  https://lore.kernel.org/r/f0b59604-ae4d-4afe-8522-a8fbe5568e96@linux.intel.com/
  Reviewed-by: Linas Vepstas <linasvepstas@gmail.com>
  https://lore.kernel.org/r/CAHrUA34fVV48MShC4CrXSmveR9i8MC4KAQxtM+XQY_Ao8joBQw@mail.gmail.com/
  Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
  https://lore.kernel.org/r/a4419480c3d494a5940e87fea0c7b9864dc3e85b.camel@linux.ibm.com/

9011f0667c93 PCI/ERR: Notify drivers on failure to recover
  Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  https://lore.kernel.org/r/fa9f42ab-bced-4c7f-9977-c0b611e92e2e@linux.intel.com/
  Reviewed-by: Linas Vepstas <linasvepstas@gmail.com>
  https://lore.kernel.org/r/CAHrUA34fVV48MShC4CrXSmveR9i8MC4KAQxtM+XQY_Ao8joBQw@mail.gmail.com/

45bc82563d55 PCI/ERR: Update device error_state already after reset
  Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  https://lore.kernel.org/r/004298f7-ae08-428e-9b98-995fc56e55b1@linux.intel.com/
  Reviewed-by: Linas Vepstas <linasvepstas@gmail.com>
  https://lore.kernel.org/r/CAHrUA34fVV48MShC4CrXSmveR9i8MC4KAQxtM+XQY_Ao8joBQw@mail.gmail.com/

cc4a7a21e815 PCI/ERR: Remove remnants of .link_reset() callback
  Reviewed-by: Linas Vepstas <linasvepstas@gmail.com>
  https://lore.kernel.org/r/CAHrUA34fVV48MShC4CrXSmveR9i8MC4KAQxtM+XQY_Ao8joBQw@mail.gmail.com/
  Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  https://lore.kernel.org/r/59308229-24ed-4b8a-b398-cc47c61dfc47@linux.intel.com/
  Reviewed-by: Justin Tee <justin.tee@broadcom.com>
  https://lore.kernel.org/r/CABPRKS_Ut8Z+rvM4+-E0YvEwUKbMb0SDpLBdH+g1sYEh+YcxFA@mail.gmail.com/

Thanks!

Lukas

