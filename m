Return-Path: <linuxppc-dev+bounces-4050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26649EEF48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 17:13:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Hb348BDz30W0;
	Fri, 13 Dec 2024 03:13:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734020031;
	cv=none; b=JM62JOr2Zs1ho5UGQY3YXtVKHvQNepuHkWrMDQQ61vBLE13qHgaA0WOoBAOdwejYz1oZ/CS5jlqxY+m9KZ+ITHabZx0UNVaAiN08xzcB2IFXkGDnEKyYijFKWpwIMKSaxPII7l+qiX8uUL9MKO6EpsAWhIpLHS45G4fMeXdnJSXCR068EIzL6dgoP3+gvdqpCtq5BpOmRurHKJjpHhpLw/Dwm5Ig6y0MaouwIafrRJlLbeGVVGIh+cIjr2MOTdj6N1FilSH00xBEE9OjfsJSXKYryblNmnM4akTxVgDBIPaqMjDLsgywms4CHk2nPcaXQ06hYtx54nifLBJv08JUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734020031; c=relaxed/relaxed;
	bh=kPcciLwnYmoturQ835EieR+ciuXf3dHjr43Og9lgBQc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HCx9N8v8tWtOLGAR0ddhomt4YgutY7TDsXDrqfn7DZtTt7iqvCM1qfpPbP8Ou03+iMxmXvPlJV95/1Y2soik6PIcYBLPOu9rSTIHawljOtyooe9t7UBACc/UePKOpq3Xx2cfHJWV7eiPjoyjkNCGhSZAbdWHrf3vVo1ReNyKeRmZQjJ1dfS7psFrT57PPUtW5A9N+OaXAgSPTflYdzPiYltSVqxvzANrMTqODGpZNzNWmJdFcaRXGt48O4CRJI6XMEawVMRbCX6LFKcjQAG0DzBM7sOG5byz6e9u03Z05uRue47yn8+GOxPLiXb5EHBm4AeXSFaqY432Knp/YvUrGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mSeGOocW; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mSeGOocW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 03:13:47 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8HZz6c0Dz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 03:13:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734020028; x=1765556028;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/zzJK9mnFf6zdHNCyut9nYjKlt83q2BcuRUr2z160zQ=;
  b=mSeGOocWPhKP/E9hoARoc2NCPKPRcbL+atfk7eullZP4wgvvemDffiS/
   h8/sVLbf7q+NyNTbd5EhrFW/70toMDBu5JjSffvQ4+q4Uk9S4JTF1uHVG
   7unMpwJ33+ruoVpfiMqTWIO+BUKgkXtuXU935X22LBvxjFj4cZsYOEhCG
   xGpPvN5zD+l12msmE9ikqcRxgtX80lglCUu1HbsOBUlmQO4x/Lmeb6+bd
   b1EJr2xcW2or4sRJpMhHXRP8TLsjz4JV2WxNhPOvfJYgt4LH5pd3Ts4R0
   m9Twoq66f7752FvEUiU/0pevyrMiXCkcrV24pc8FeMFFHDOvqUwG9ynhj
   A==;
X-CSE-ConnectionGUID: Uoi4qJQ1SN+b3H1PtOlVpw==
X-CSE-MsgGUID: gtK0AlHOTcyZZwdLuQDSsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59840834"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="59840834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:12:24 -0800
X-CSE-ConnectionGUID: 3/zP/YWEToi+5AyQtTtn5Q==
X-CSE-MsgGUID: V4/Dril5RPetIeubuZG3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96116896"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.137])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:12:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Dec 2024 18:12:18 +0200 (EET)
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 6/8] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <20241211164904.00007a02@huawei.com>
Message-ID: <e4f907ad-ab87-ac42-7428-93e16f070f74@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com> <20240913143632.5277-7-ilpo.jarvinen@linux.intel.com> <20241211164904.00007a02@huawei.com>
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
Content-Type: multipart/mixed; boundary="8323328-913753533-1734019938=:936"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-913753533-1734019938=:936
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Dec 2024, Jonathan Cameron wrote:

> On Fri, 13 Sep 2024 17:36:30 +0300
> Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
>=20
> > pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
> > (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> >=20
> > Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> > TLP Prefix Log. The relevant registers are formatted identically in AER
> > and DPC Capability, but has these variations:
> >=20
> > a) The offsets of TLP Prefix Log registers vary.
> > b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
> >=20
> > Therefore callers must pass the offset of the TLP Prefix Log register
> > and the entire length to pcie_read_tlp_log() to be able to read the
> > correct number of TLP Prefix DWORDs from the correct offset.
> >=20
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> Trivial comments below
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> Would have been nice if they'd just made the formats have the
> same sized holes etc!

That's not even the worst problem.

They managed to copy-paste most of the stuff into DPC (copy-paste is=20
really obvious because the text still refers to AER in a DPC section :-))=
=20
but forgot to add a few capability fields into the DPC capability, most=20
importantly, the bit that indicates whether TLP was logged in Flit mode
or not And now we get to keep the pieces how to interpret the Log=20
Registers (relates to the follow up series). :-(

> > diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> > index 65ac7b5d8a87..def9dd7b73e8 100644
> > --- a/drivers/pci/pcie/tlp.c
> > +++ b/drivers/pci/pcie/tlp.c
> > @@ -11,26 +11,65 @@
>=20
> >  /**
> >   * pcie_read_tlp_log - read TLP Header Log
> Maybe update this to read TLP Header and Prefix Logs
> >   * @dev: PCIe device
> >   * @where: PCI Config offset of TLP Header Log
> > + * @where2: PCI Config offset of TLP Prefix Log
>=20
> Is it worth giving it a more specific name than where2?
> Possibly renaming where as well!

Sure, why not.

--=20
 i.

> > + * @tlp_len: TLP Log length (Header Log + TLP Prefix Log in DWORDs)
> >   * @log: TLP Log structure to fill
> >   *
> >   * Fill @log from TLP Header Log registers, e.g., AER or DPC.
> >   *
> >   * Return: 0 on success and filled TLP Log structure, <0 on error.
> >   */
> > -int pcie_read_tlp_log(struct pci_dev *dev, int where,
> > -=09=09      struct pcie_tlp_log *log)
> > +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> > +=09=09      unsigned int tlp_len, struct pcie_tlp_log *log)
> >  {


--8323328-913753533-1734019938=:936--

