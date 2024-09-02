Return-Path: <linuxppc-dev+bounces-883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85C968CCB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 19:22:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyFtL0Z0sz2xKh;
	Tue,  3 Sep 2024 03:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725297722;
	cv=none; b=meRiiqHmoSSeXXN1ndUSjDyVJQhcr1XVHCcuz+U19qwioAGGVhCSKH+597CmOrB3Gozf26WFESX+3+3eztqgj2DJmQL6zOZBmIVccMebA/b1H1uOHtA14Mx74rj5yFpwvXI4XMylfayQr4A2Je1fUIkG2igk7iDRnE8z3XZqDsRvXxNiNae1aOKI3NxVrRBIbtyoO/MwFzrx9eR/nWM680lYsnXuUXQqA/TXF3O8+ZVwlS8voeDP7IJwlTdcH9FHUIEuvGHWPTC9ihnKjvD5peYKNHcibDPy/p7QTXTn1Y2na+nYc0WLL8TAy7aFmtg4xNEINxmDqwf3q8CaAJQ1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725297722; c=relaxed/relaxed;
	bh=tUrKFu8uwEmZb88QnSfCQwROPrf0Q0o71Qo9u9VMwq4=;
	h=DKIM-Signature:From:Date:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type; b=lATCyTIDICwWTijJjtlzTdNrVCoXd3P+uRUHaGwOwxDKlg8FRheYNv6HYvFa4spLN3BEvmvE6OBCJiTuDG0Ocxxedj/CjibxegHeXvtPrh70SsM4eEZc3ZqA2IwxVlVBhplpNMRvzE7DBmAwkGc186lYvgBtN+//zWqB4udswOU4cv0k9OFPC56QduQCwCLN0fcwCaQ5AUdTN6FFVNSvB6qzUyRi0wrTTFbCyxmZBhPjoAX1pf6tdQ295368WdQsfZZ6Ie1IHsLmKJVWYP5DFGbUkrpRm49p/x2QdI+iw77s0MdXipxRcV/dVaqAQzGT14+klHFFno08hA3G2y4L1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FOmBxUIo; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FOmBxUIo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 03 Sep 2024 03:21:59 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyFtH5hgZz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 03:21:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725297720; x=1756833720;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GkQVm/313yFRiCJitqApvhCnlkgQuXATKxT6CqO6J2s=;
  b=FOmBxUIoN5NNsKw5bSCmajaizEF38RV7eRhCzzhD6MGpjVia2MSOqTjX
   iG3BbIruuNUC/z8BuIXi7t+sriMerPjoTSefVdPPlKvvFsQJULCAUJsZf
   ytJYi8BbD8rZOSWOeccLwrIEPNbI5rYqDxJeN+WlmUoFGvvKXQRO3bnVx
   uy9T8M/QL60dCR8VxjZziznhSfJmG67QlmxJV2YVgJUXMWe9dG8A8Ns8I
   lX/3XRGaExk/GVYf2i8ltdmwP+s4tTeQwS/bKWrSooRG2jylZF6SCAsrh
   1fsCeSxlAxUPd3RU3kudbdP/5GGjzYNyYDxtvTl17DbsYrWFGTl5fzanT
   g==;
X-CSE-ConnectionGUID: NTU2pOVLQtSqZSCGfQ2J+w==
X-CSE-MsgGUID: PwZQgAefTDW+FK/WxtnELg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35253187"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="35253187"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 10:20:51 -0700
X-CSE-ConnectionGUID: 4Whz1t3+TEOCjPACwmHH9w==
X-CSE-MsgGUID: IJelBsvoT0ahJb71fLn1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64287900"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 10:20:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Sep 2024 20:20:41 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 7/7] PCI: Create helper to print TLP Header and Prefix
 Log
In-Reply-To: <20240830191129.GA115840@bhelgaas>
Message-ID: <b0484353-8ba5-02c2-e78c-d51aba55bbb7@linux.intel.com>
References: <20240830191129.GA115840@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1996877222-1725297641=:1156"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1996877222-1725297641=:1156
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 Aug 2024, Bjorn Helgaas wrote:

> On Tue, May 14, 2024 at 02:31:09PM +0300, Ilpo J=C3=A4rvinen wrote:
> > Add pcie_print_tlp_log() helper to print TLP Header and Prefix Log.
> > Print End-End Prefixes only if they are non-zero.
> >=20
> > Consolidate the few places which currently print TLP using custom
> > formatting.
> >=20
> > The first attempt used pr_cont() instead of building a string first but
> > it turns out pr_cont() is not compatible with pci_err() and prints on a
> > separate line. When I asked about this, Andy Shevchenko suggested
> > pr_cont() should not be used in the first place (to eventually get rid
> > of it) so pr_cont() is now replaced with building the string first.
> >=20
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/pci/pci.h      |  2 ++
> >  drivers/pci/pcie/aer.c | 10 ++--------
> >  drivers/pci/pcie/dpc.c |  5 +----
> >  drivers/pci/pcie/tlp.c | 31 +++++++++++++++++++++++++++++++
> >  4 files changed, 36 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 7afdd71f9026..45083e62892c 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -423,6 +423,8 @@ void aer_print_error(struct pci_dev *dev, struct ae=
r_err_info *info);
> >  int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> >  =09=09      unsigned int tlp_len, struct pcie_tlp_log *log);
> >  unsigned int aer_tlp_log_len(struct pci_dev *dev);
> > +void pcie_print_tlp_log(const struct pci_dev *dev,
> > +=09=09=09const struct pcie_tlp_log *log, const char *pfx);
> >  #endif=09/* CONFIG_PCIEAER */
> > =20
> >  #ifdef CONFIG_PCIEPORTBUS
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index ecc1dea5a208..efb9e728fe94 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -664,12 +664,6 @@ static void pci_rootport_aer_stats_incr(struct pci=
_dev *pdev,
> >  =09}
> >  }
> > =20
> > -static void __print_tlp_header(struct pci_dev *dev, struct pcie_tlp_lo=
g *t)
> > -{
> > -=09pci_err(dev, "  TLP Header: %08x %08x %08x %08x\n",
> > -=09=09t->dw[0], t->dw[1], t->dw[2], t->dw[3]);
> > -}
> > -
> >  static void __aer_print_error(struct pci_dev *dev,
> >  =09=09=09      struct aer_err_info *info)
> >  {
> > @@ -724,7 +718,7 @@ void aer_print_error(struct pci_dev *dev, struct ae=
r_err_info *info)
> >  =09__aer_print_error(dev, info);
> > =20
> >  =09if (info->tlp_header_valid)
> > -=09=09__print_tlp_header(dev, &info->tlp);
> > +=09=09pcie_print_tlp_log(dev, &info->tlp, "  ");
>=20
> I see you went to some trouble to preserve the previous output, down
> to the number of spaces prefixing it.
>=20
> But more than the leading spaces, I think what people will notice is
> that previously AER and DPC dmesgs contain the "AER: " or "DPC: "
> prefixes implicitly added by the dev_fmt definitions [1], where now
> IIUC they won't.
>=20
> I think adding dev_fmt("") here should take care of that, e.g.,
>=20
>   pcie_print_tlp_log(dev, &info->tlp, dev_fmt(""));
>=20
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1990272

Okay, I'll fix it and resend but looking into that output, it doesn't=20
look very consistent when it comes to prefixes as the lines in between do=
=20
not start with "AER: " either. Perhaps those lines should be changed as=20
well?

--=20
 i.

--8323328-1996877222-1725297641=:1156--

