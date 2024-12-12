Return-Path: <linuxppc-dev+bounces-4053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002A9EFA44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 19:04:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8L2Q1nlJz30W1;
	Fri, 13 Dec 2024 05:04:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734026654;
	cv=none; b=kdGyIicFoO09QrSZitvgVrL2EUNcW6E7STOg6zHRi9fSGEl0hXOR8XHnw6V2XD0EeR+0z/AJ9chvsRz4t18fM0bD6pP/pMaQxA6Oobmis9VG106dldiufsfoZEwyYO+OmUoP6+bAbHOHroRS3koQ3frYWkGk+468Ysp85ZGvlgtQtLl3EY04J90EuHz+tcmkxVWyt96hd5150cX0LSZBtvN0V74ixohDNIQUEtV4leutVxBYWW/uxI9EaG3xzT66DOR/Jv0LXIqAb/WBcfqYzQ79yyiZAKTYHKk8fK6pVGGyKbX4FdtVJnvpfc9NZ6gpP/sMvpR2q00mjI/NQwTgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734026654; c=relaxed/relaxed;
	bh=az/7IfhNzYdlLgnuT/uF+7T7H2y+Z3z3wW4zjBRARpw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TGG5ihuISgP0q/wy+Ep6MVR+ywn9GPA4Wvuo3VMW1EzJC161GrcTm+JaeKh3quKayChIkaLSYU1K8HQjZ1BOvzsmettqh1hgN+mbadLSUdKOK4Akz+mwrMn/t3u4mpyruIA6Yaka4S9tnm+UwahS6RPvMyxqzB25EXC80qLtSyEZVFEac9Oiy+DuG49iQ0v88DQxJQW/BE2xKd1yseih935qhtMMpvE4l8QGVRsHM515ObdQaWLULnCbnjtaMimR81AvBzIoHtQscTfaYGRR2S2kqbYcha/KPitp4MWk/rzzEFM8Hifj7+7mURBzGxFqQjZeAAl6XqWGpmcAWFDyGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SDGuVTbT; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SDGuVTbT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8L2L2kg2z30TT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 05:04:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734026651; x=1765562651;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=F75IBG8N3JPrXMGX6GgOgsRBEU/kIskJWrg/4L6cN50=;
  b=SDGuVTbTlIIRtVsDFL752AJ2qvHFNr6+/A1kKDbL1ZRHSb3fEdl0VyBS
   x+MUzOyRuOmzE6Zyc0j5Uv+GHRuubiJ2JOBm3i5nM3/AJCkrXqFCh/4du
   DngrdR/d5ZzD1XfAQl94WnRxK0gLkPsP0nuUCi/fET5H/eZpOq0Gb2tSl
   Y0Cw0spMksOWjH5ys2UwLeahfa4UoaM7UVrMaDGdcyxbJqxvLbkyAjn/R
   k6uTRxeaNVtviYnMdh05KJkPacMHX1Apq6HoFzFJnnxG7HTfORxbuClHZ
   LlLaZ4sj49yBK6qGZnNqkPM1YMWCrkCWiLyqrfIWPGqMvJtAGIX6bF7QI
   Q==;
X-CSE-ConnectionGUID: 7ItazVXzSbyoQCEtSV+9nA==
X-CSE-MsgGUID: 7ly8oKwsSLuWVTs72RvSyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34509006"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="34509006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 10:04:05 -0800
X-CSE-ConnectionGUID: NNaPQb/OSlmhgIdu1GqAlQ==
X-CSE-MsgGUID: qT/iyMhKReqk+9X7aYR3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="101158370"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 10:04:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Dec 2024 20:03:59 +0200 (EET)
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 5/8] PCI: Store # of supported End-End TLP Prefixes
In-Reply-To: <20241211163629.00002937@huawei.com>
Message-ID: <349c5b75-3f6c-c119-fedb-32dd1ec61725@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com> <20240913143632.5277-6-ilpo.jarvinen@linux.intel.com> <20241211163629.00002937@huawei.com>
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
Content-Type: multipart/mixed; boundary="8323328-1886133581-1734026639=:936"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1886133581-1734026639=:936
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Dec 2024, Jonathan Cameron wrote:

> On Fri, 13 Sep 2024 17:36:29 +0300
> Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
>=20
> > eetlp_prefix_path in the struct pci_dev tells if End-End TLP Prefixes
> > are supported by the path or not, the value is only calculated if
> > CONFIG_PCI_PASID is set.
> >=20
> > The Max End-End TLP Prefixes field in the Device Capabilities Register
> > 2 also tells how many (1-4) End-End TLP Prefixes are supported (PCIe r6
> > sec 7.5.3.15). The number of supported End-End Prefixes is useful for
> > reading correct number of DWORDs from TLP Prefix Log register in AER
> > capability (PCIe r6 sec 7.8.4.12).
> >=20
> > Replace eetlp_prefix_path with eetlp_prefix_max and determine the
> > number of supported End-End Prefixes regardless of CONFIG_PCI_PASID so
> > that an upcoming commit generalizing TLP Prefix Log register reading
> > does not have to read extra DWORDs for End-End Prefixes that never will
> > be there.
> >=20
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/pci/ats.c             |  2 +-
> >  drivers/pci/probe.c           | 14 +++++++++-----
> >  include/linux/pci.h           |  2 +-
> >  include/uapi/linux/pci_regs.h |  1 +
> >  4 files changed, 12 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> > index c570892b2090..e13433dcfc82 100644
> > --- a/drivers/pci/ats.c
> > +++ b/drivers/pci/ats.c
> > @@ -377,7 +377,7 @@ int pci_enable_pasid(struct pci_dev *pdev, int feat=
ures)
> >  =09if (WARN_ON(pdev->pasid_enabled))
> >  =09=09return -EBUSY;
> > =20
> > -=09if (!pdev->eetlp_prefix_path && !pdev->pasid_no_tlp)
> > +=09if (!pdev->eetlp_prefix_max && !pdev->pasid_no_tlp)
> >  =09=09return -EINVAL;
> > =20
> >  =09if (!pasid)
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index b14b9876c030..0ab70ea6840c 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -2228,8 +2228,8 @@ static void pci_configure_relaxed_ordering(struct=
 pci_dev *dev)
> > =20
> >  static void pci_configure_eetlp_prefix(struct pci_dev *dev)
> >  {
> > -#ifdef CONFIG_PCI_PASID
> >  =09struct pci_dev *bridge;
> > +=09unsigned int eetlp_max;
> >  =09int pcie_type;
> >  =09u32 cap;
> > =20
> > @@ -2241,15 +2241,19 @@ static void pci_configure_eetlp_prefix(struct p=
ci_dev *dev)
> >  =09=09return;
> > =20
> >  =09pcie_type =3D pci_pcie_type(dev);
> > +
> > +=09eetlp_max =3D FIELD_GET(PCI_EXP_DEVCAP2_EE_PREFIX_MAX, cap);
> > +=09/* 00b means 4 */
> > +=09eetlp_max =3D eetlp_max ?: 4;
> > +
> >  =09if (pcie_type =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
> >  =09    pcie_type =3D=3D PCI_EXP_TYPE_RC_END)
> > -=09=09dev->eetlp_prefix_path =3D 1;
> > +=09=09dev->eetlp_prefix_max =3D eetlp_max;
> >  =09else {
> >  =09=09bridge =3D pci_upstream_bridge(dev);
> > -=09=09if (bridge && bridge->eetlp_prefix_path)
> > -=09=09=09dev->eetlp_prefix_path =3D 1;
> > +=09=09if (bridge && bridge->eetlp_prefix_max)
>=20
> What happens if they disagree?  That is the bridge supports 2
> and the device 3?

That's a good question.

The current code obviously only checks if Prefixes are supported or not so=
=20
the max value doesn't matter for the existing code.

I went to read spec and my reading from TLP logging point of view is that=
=20
the device's own maximum matters even if it might never get >2 Prefixes
(r6.1 2.2.10.4 & 6.2.4).

AFAIK, things happen on low level and there's no way to program this=20
value. So it's not like the kernel is telling that hw must only use x=20
Prefixes at most if that's what you were worried about.

But there are more things to consider, e.g., I noticed End-End TLP Prefix=
=20
Blocking in DevCtl2 which might impact the existing usage too and is not
checked by the kernel currently.

My interest here lies on cleaning this up so I'm not sure if functional=20
changes such as considering End-End TLP Prefix Blocking really matter for=
=20
some case or not. I can obviously easily add the code for that too if it's=
=20
required for this series to be acceptable but I don't have a test case for=
=20
it. My main goal with this TLP logging consolidation series is to get to a=
=20
point that extending it to support Flit mode is easier.

There's also TLP Prefix Log Present which I think the reader should=20
consider, which matters to another patch in this series and I'm going to=20
alter the length based on that flag.

--=20
 i.

--8323328-1886133581-1734026639=:936--

