Return-Path: <linuxppc-dev+bounces-4321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6F9F684B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:25:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCwtm6rjCz30VF;
	Thu, 19 Dec 2024 01:25:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734531904;
	cv=none; b=dGW4AMyvZYpHWKtVCX0Z4dCyAvv5boZ0bMe8gbMA7dM2vhVkevV6INcqlLI2G0gqCaR+gkj7vIcXsr2lCyBM6PeVo5FyUwFdgLxefbC7IcQM2JhsdYk9i+D+fSJSfoJIbKtWy6FMWzqe5vtMTNXYJxYjdkY9EP0c60ytzekaaNh3xfba4KxEVpPB2c6aKbmnmDHsg5/HM/SqlQgN1V9KB5Bu2uQMLAMd3jcHnl8TGWVGbawjCQ6LTjQQ97JeIhclr4wBbAER0MfsNgphled1q3Q9LZsW6EAhFoeGMZ07z9ll+aViopktU04DxXWqWmWfVr5YzDk3Ey7XIaAHe+yIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734531904; c=relaxed/relaxed;
	bh=iUd/sknpD+9WLDFdlIZWIePz8Va3E9rT1tLJ1PuZXW4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WG0WXEEdCDZS4ea+2rbeYl3/NjC8s9P26N0vjnXcfTQPEs1riWRu0HX4BOjupeqtLzRhUU41M2s2pzCY2nGo9MHbb1RxqvHGFZSGes+Egm1AOq8zDfc+pIgQxT7BjkBPST3CoMV/2q/s6yLc2DvyEaN6gxiL3gdBNZ1gT+6nea3g3oqcerYZiNaC3WwY87Vs4mk7tCUsF7f32i9emSeyQI62SUpA47EtR1hgSWCUcMGgSB4y5MEjv+rQiWnTp+bwfKnH9ISBAgutiGiYVs6O/i/R8D5fcXFUPjPbCiZ3Crsga0+tpMdMlg5j9mE6J7EZ3horUrV7JjmrKMt/dQilMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiiTMmeQ; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiiTMmeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCwtl1HPjz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:25:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734531903; x=1766067903;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=jXV7XyJRmu6HSpyyngB1vqa+GMDUyf2VJ19KpM94/gU=;
  b=eiiTMmeQQF5xVCImqh0LnDFaBmqH0RqRhWUs8eU3H4bRoi+VFW0lnAbn
   NYBVZ3qeDoaotiGFflyoVYYBduJsyqnIuFL9rUbomf0unBxnSOF+6xWXX
   fMdo1MKl8B0KsP1l6NbElaIO9jg9Zn5qAjMlC33OJjneVdo1wQTdr9Vl1
   xqGqy7hlTo/yOt1GV0d1Qh9pD/aC6LVQWgl3VmRwxHMe2JoiU5y8Tg0IF
   7ZHp3qccpuNnHVcpC1BC5VKfBFYTT4OZDzikODoEhptX73lccnuEHV2YV
   8ZH4N4D7X42+U6zyGHlYhH3yoRkwW9a/TblAg9i3yje5/j3svU8B6yVFf
   A==;
X-CSE-ConnectionGUID: rQpr0Rz/SPyIOIxlfVwXNQ==
X-CSE-MsgGUID: WwEvM3ySR5Gfr5ASiqUWWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38685443"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38685443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:25:00 -0800
X-CSE-ConnectionGUID: RHbH0LbbQEKEF3SQ2pyDSw==
X-CSE-MsgGUID: 9XnzB4UkSN2aOMnrmYKyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98696671"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:24:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Dec 2024 16:24:53 +0200 (EET)
To: Yazen Ghannam <yazen.ghannam@amd.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
    Lukas Wunner <lukas@wunner.de>, Borislav Petkov <bp@alien8.de>, 
    linux-edac@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 0/3] PCI: Add support for logging Flit Mode TLPs
 (PCIe6)
In-Reply-To: <20241217214929.GA1121691@yaz-khff2.amd.com>
Message-ID: <bbd52a2b-a97f-7825-c271-0f470b75df1b@linux.intel.com>
References: <20240614150921.29724-1-ilpo.jarvinen@linux.intel.com> <20241217214929.GA1121691@yaz-khff2.amd.com>
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
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-666698470-1734529599=:939"
Content-ID: <57976c77-cac9-bb7b-8590-a5b03a24285f@linux.intel.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-666698470-1734529599=:939
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e7996e2e-a4e3-0dc0-b045-a62823a48f7a@linux.intel.com>

On Tue, 17 Dec 2024, Yazen Ghannam wrote:

> On Fri, Jun 14, 2024 at 06:09:18PM +0300, Ilpo J=E4rvinen wrote:
> > This series adds support for Flit Mode (PCIe6). The series is built on
> > top of the TLP Logging refactoring series:
> >=20
> >   https://lore.kernel.org/linux-pci/20240514113109.6690-1-ilpo.jarvinen=
@linux.intel.com/
> >=20
> > Important note to maintainer: The series carries
> > pcie_update_link_speed() refactoring change that is almost identical
> > with a patch in the PCIe BW controller series. The patch itself is
> > basically the same but the context has minor difference. This will need
> > to be considered if applying both series within the same kernel cycle.
> >=20
> > Ilpo J=E4rvinen (3):
> >   PCI: Refactor pcie_update_link_speed()
> >   PCI: Track Flit Mode Status & print it with link status
> >   PCI: Handle TLP Log in Flit mode
> >=20
> >  drivers/pci/hotplug/pciehp_hpc.c |  5 +--
> >  drivers/pci/pci.c                | 12 ++++---
> >  drivers/pci/pci.h                | 13 ++++++--
> >  drivers/pci/pcie/aer.c           |  4 ++-
> >  drivers/pci/pcie/dpc.c           | 23 ++++++++++---
> >  drivers/pci/pcie/tlp.c           | 57 ++++++++++++++++++++++----------
> >  drivers/pci/probe.c              | 13 +++++---
> >  include/linux/aer.h              | 13 ++++++--
> >  include/linux/pci.h              |  1 +
> >  include/ras/ras_event.h          | 12 +++----
> >  include/uapi/linux/pci_regs.h    |  6 +++-
> >  11 files changed, 112 insertions(+), 47 deletions(-)
>
> Is there any new development on this feature? Or is it on hold while any
> spec oversights are worked out in the PCI-SIG?

As far as I know, the series is not on hold. It just tends to take time=20
from Bjorn to get patches applied (and I don't want to pressure=20
maintainers with frequent pings). But I think it might help if you would=20
kindly review the patches. :-)

And of course this series depends on the TLP cleanup series that has to=20
be applied first (but hopefully that happens soon enough).

When it comes to the spec oversight, we concluded with Lukas Wunner that=20
even if DPC capability would eventually get a flag to indicate in which=20
mode the TLP was logged we cannot assume the flags is always there. Thus,=
=20
this link Flit mode status tracking has to be done anyway. I know it's not=
=20
ideal because at least in theory the state kept by the kernel could be=20
stale but there seems to no way around that given how the spec is.

--=20
 i.
--8323328-666698470-1734529599=:939--

