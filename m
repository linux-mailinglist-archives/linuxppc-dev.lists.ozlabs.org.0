Return-Path: <linuxppc-dev+bounces-4057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D3F9EFB71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 19:48:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8M1y5CYLz30TQ;
	Fri, 13 Dec 2024 05:48:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734029334;
	cv=none; b=kAyMygxO7YX5JacyZv0G6JnLEj/JwOVzHrGAu/p5sxwJzLsijO+B7fwYM32cL+0F7W5WK5YJjnYn1NwQCg1WKSexvnumPfvvU9ij4zmPyxb+olY2xtZIJGlR0gnDjON5uqjN2hshAlnUp9tWfE+nzvVkAwP9uPUYqzaOGBJRT12qJGVh7mc1yJPmDKWEN4MFdKeSPYXhIEKLVugcveYHqJb7NVDkJBvK43rpYfCTi172Qecnqf6wsOoI8JonGL5fjg6L6/uJ5WhINasfAiTOQ8tHwibVFqnXFJ0LOQEs/nIYKbRHsNIbfS82PZ5Xjc7/CQQZNpB8SAczBK0zPJZhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734029334; c=relaxed/relaxed;
	bh=txVRGXUX+wTk0UIxkNCCBORmgC9KCP+2Xj8CfK65tXo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Pfp3RL8vLyN8pOxy2BvzWtd6DLaM61WISBuABWb7IP+2/CCwC+QbfvftgctUIPpm5RVfF2+cW3ytj+9Z4OejkAl0oemEOn0DUePvY0uhPaaCEYhDAHGHwTRQlOVwBBUbw1L9A8bFe+rH34SOeb7S2DK8hNg1iO6zFsYcAs6cQKGgq5rY2pqWCzgVDERNki4cuH7t+JNTz/kMiFkEU3ra9qKFH0TwZ07/KC2PcdsTrUh3TjjXp+MGR4IXZ2lQyUoSsu8qloywSNWpN39PkCMVuI2yI7JWDyDB8peEMbLci2tjXR1WNvDhcT4CZqPWKvOt2uGJtrSCFZ+oSfPtIISYMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C8KcdtTr; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C8KcdtTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8M1v0F5nz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 05:48:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734029332; x=1765565332;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2wHg5ech62f6kNP58dWuNm42eu3h+FcT06MHSXTV5lM=;
  b=C8KcdtTr8Ud9BQVAvh83W5PEyIh5jrJJz+7OgbG/V2QypooATHgW1UUx
   1OuUvHeg8UGZSwkTQCstYMVTrdjCTqNWfdcyiVfdTQxEjlqIUEkTBfUfA
   ZJ30Z8v4Y/+83fi6ooWksArVtxKJWQHzcN+WvC9g/VUWM9pn5gaH5Wjuv
   2D5Nyqx2dy2Hh6w9izu7fbZvZR/PLaazOirN8m8YqjNfFj5qFpvyrXJeg
   tr5FktJvgNDP2okw0e0COmRYuXw7BpsxOe6XALWfeG+7uhk2MhZ1KR11D
   ZZvhneSzGjd4Swi2p0MeA15335olBnsmTf3JNMFZKUfenGzHu5Vjsr/74
   Q==;
X-CSE-ConnectionGUID: Q8rpMU0lSgm5de9juqTIZg==
X-CSE-MsgGUID: uELHJJlbSkiK3ga8pU+UYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45474150"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45474150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 10:48:47 -0800
X-CSE-ConnectionGUID: pVSicdywTUa2jTMaz/PNGQ==
X-CSE-MsgGUID: cfYrER84RBK5Aqf03CS7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127318593"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 10:48:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Dec 2024 20:48:38 +0200 (EET)
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 6/8] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <e4f907ad-ab87-ac42-7428-93e16f070f74@linux.intel.com>
Message-ID: <827acda7-26d8-f4f5-2251-befb932ebb8b@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com> <20240913143632.5277-7-ilpo.jarvinen@linux.intel.com> <20241211164904.00007a02@huawei.com> <e4f907ad-ab87-ac42-7428-93e16f070f74@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="8323328-1583029406-1734029318=:936"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1583029406-1734029318=:936
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 12 Dec 2024, Ilpo J=E4rvinen wrote:

> On Wed, 11 Dec 2024, Jonathan Cameron wrote:
>=20
> > On Fri, 13 Sep 2024 17:36:30 +0300
> > Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> >=20
> > > pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix L=
og
> > > (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> > >=20
> > > Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> > > TLP Prefix Log. The relevant registers are formatted identically in A=
ER
> > > and DPC Capability, but has these variations:
> > >=20
> > > a) The offsets of TLP Prefix Log registers vary.
> > > b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
> > >=20
> > > Therefore callers must pass the offset of the TLP Prefix Log register
> > > and the entire length to pcie_read_tlp_log() to be able to read the
> > > correct number of TLP Prefix DWORDs from the correct offset.
> > >=20
> > > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >=20
> > Trivial comments below
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >=20
> > Would have been nice if they'd just made the formats have the
> > same sized holes etc!
>=20
> That's not even the worst problem.
>=20
> They managed to copy-paste most of the stuff into DPC (copy-paste is=20
> really obvious because the text still refers to AER in a DPC section :-))=
=20
> but forgot to add a few capability fields into the DPC capability, most=
=20
> importantly, the bit that indicates whether TLP was logged in Flit mode
> or not And now we get to keep the pieces how to interpret the Log=20
> Registers (relates to the follow up series). :-(
>=20
> > > diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> > > index 65ac7b5d8a87..def9dd7b73e8 100644
> > > --- a/drivers/pci/pcie/tlp.c
> > > +++ b/drivers/pci/pcie/tlp.c
> > > @@ -11,26 +11,65 @@
> >=20
> > >  /**
> > >   * pcie_read_tlp_log - read TLP Header Log
> > Maybe update this to read TLP Header and Prefix Logs
> > >   * @dev: PCIe device
> > >   * @where: PCI Config offset of TLP Header Log
> > > + * @where2: PCI Config offset of TLP Prefix Log
> >=20
> > Is it worth giving it a more specific name than where2?
> > Possibly renaming where as well!
>=20
> Sure, why not.

Hi again,

After doing this rename, I rebased the Flit mode series on top of it and
realized there's one small problem with naming where2. It will be=20
overloaded between TLP Prefix Log (Non-Flit mode) and extended TLP Header=
=20
Log (DW5+) (Flit mode) so I'm not sure if there's really going to be a=20
good name for it.

--=20
 i.

--8323328-1583029406-1734029318=:936--

