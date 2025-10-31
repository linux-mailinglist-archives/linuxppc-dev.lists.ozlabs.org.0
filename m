Return-Path: <linuxppc-dev+bounces-13643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987B1C24664
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 11:18:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cycQM1C6wz2xdg;
	Fri, 31 Oct 2025 21:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761905931;
	cv=none; b=Oo8RwVrlfQonWuGolM9J9jb2W0ogX8SWmRxuPqOO/mkuDRyFOI8a+SWEedfGLAfdABMQF/PCeTGe1Qf7b1SpcjZqhSUofjn4JXVztS1iggFZ0OO/U+kLfqP3iBBbnkhxCIGMzrF/TrliNzOdwwESCr9eyjxbDyqmr9p2XUeTvfQjiUlOKxmf/0XOFnFV0hlaC4dpNP9bNRrJLLGj+WaIfXOV0TtVze7hu5WFgbETZ+PZ1R1NoWE6VTBqY5FsYx1SE+0U371IeZDgngu/XOPaHGADKDwgydsyr0Nsf5XPTcv8HHfpPScvGf5OXan+GrVGomRC2aBiY2U60txjd304/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761905931; c=relaxed/relaxed;
	bh=ouZuaNOHnJFp67QDBQiw2sbQI2Rbc588YfTaV+JnlAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyGJjQr37z8K/t/a2Ix1+QxmoleWVJ8KMhyDS9WhGPQO2yhmUdHB+QKC9PUH4qZ3aDO6Jg8P1G2NOXGeaRzEd6qdbBHj6muSCetTnEJO+mOF1hY1PJEjsnFBhAJz+gWPSvc8NkHRZXeoVmIpm0faLVxuDy72RJtZbZcCV4WMl35+MR2yGzhHysFbu/4QBUSwr96IccBaKdzVGRT5R/4g2l0xF+muHerEy9HHlLqLjmpUHHU3scTm65HnGA+XZcaHqh3jvdtWgM5rcKcTCLxPno7Q3NJWAdwhv+q7UqF5+4yItREZkm4wXclxg2WeF5/2L8gzDotvCQ/EwbjZN06GEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DPY0MYL4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DPY0MYL4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cycQJ3VFbz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 21:18:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761905929; x=1793441929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ScQKh0k+g0sLHY6zzPeiiWF3Mx49kdxeKS7TZIXktok=;
  b=DPY0MYL42dC7Rj1hzzhBC2MNFvqD5nxyTPoZkOuSpuYnNJKSxowHczgJ
   fwafMokuMBIcwaKWFyiubBKes6WszrY56zoivPpQJETk5tjVLJaFpSTaC
   MhVL2z/rtWX80+lIEeWTbJ3fgAZ5l5TfBcKIubUTc4pYd3HoPL2dXWv8G
   y6cQUE6FuipCNpvpGZZKiSRbZ124T51W4HkaC818CwAIl+w6+QM8y+ysh
   NKYXsTq2ng23r9D1AeUA7PdzRgVr4X9Z1AMxsCudrCZzlbgTPFitlvw85
   ThcabA9pJ79AN1CTb1j6lRrHmCEvkFon12SzqdE9+BMTshNfjuiJIBG2k
   A==;
X-CSE-ConnectionGUID: XteDIeDzQeCxCZblK1jAXg==
X-CSE-MsgGUID: 75vdSXZXSfGjJ1JiT2rZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89529660"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89529660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:18:42 -0700
X-CSE-ConnectionGUID: k25i44LyS2un9PQ5Y6ncag==
X-CSE-MsgGUID: vJDIqqS8RQmFeEw6PNSdLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185890295"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.56])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:18:30 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Guo Weikang <guoweikang.kernel@gmail.com>,
 Xin Li <xin@zytor.com>, Will Deacon <will@kernel.org>,
 Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan <gshan@redhat.com>,
 Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Li Ming <ming.li@zohomail.com>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Jon Pan-Doh <pandoh@google.com>, Lukas Wunner <lukas@wunner.de>,
 Shiju Jose <shiju.jose@huawei.com>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/6 v6] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Fri, 31 Oct 2025 11:18:27 +0100
Message-ID: <2351924.vFx2qVVIhK@fdefranc-mobl3>
In-Reply-To: <20251028144816.000018a3@huawei.com>
References:
 <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
 <20251023122612.1326748-3-fabio.m.de.francesco@linux.intel.com>
 <20251028144816.000018a3@huawei.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tuesday, October 28, 2025 3:48:16=E2=80=AFPM Central European Standard T=
ime Jonathan Cameron wrote:
> On Thu, 23 Oct 2025 14:25:37 +0200
> "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:
>=20
> > I/O Machine Check Architecture events may signal failing PCIe components
> > or links. The AER event contains details on what was happening on the w=
ire
> > when the error was signaled.
> >=20
> > Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
> > by the I/O MCA.
> >=20
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.=
com>
> Hi Fabio,
>=20
> Was taking a fresh look at this as a precursor to looking at later
> patches in series and spotted something that I'm doubtful about.
>=20
> > diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> > index 47d11cb5c912..cefe8d2d8aff 100644
> > --- a/drivers/acpi/acpi_extlog.c
> > +++ b/drivers/acpi/acpi_extlog.c
> > @@ -132,6 +132,34 @@ static int print_extlog_rcd(const char *pfx,
> >  	return 1;
> >  }
> > =20
> > +static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
> > +			      int severity)
> > +{
> > +	struct aer_capability_regs *aer;
> > +	struct pci_dev *pdev;
> > +	unsigned int devfn;
> > +	unsigned int bus;
> > +	int aer_severity;
> > +	int domain;
> > +
> > +	if (!(pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID ||
> > +	      pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO))
>=20
> Looking again, I'm not sure this is as intended.  Is the aim to
> allow for either one of these two?  Or check that that are both present?=
=20
> That is should it be !(A && B) rather than !(A || B)?
>=20
Hi Jonathan,

You're right. We need to check that both are true and return if they are=20
not, then the statement has to be !(A && B).

Thank you,

=46abio=20
>=20
> > +		return;
> > +
> > +	aer_severity =3D cper_severity_to_aer(severity);
> > +	aer =3D (struct aer_capability_regs *)pcie_err->aer_info;
> > +	domain =3D pcie_err->device_id.segment;
> > +	bus =3D pcie_err->device_id.bus;
> > +	devfn =3D PCI_DEVFN(pcie_err->device_id.device,
> > +			  pcie_err->device_id.function);
> > +	pdev =3D pci_get_domain_bus_and_slot(domain, bus, devfn);
> > +	if (!pdev)
> > +		return;
> > +
> > +	pci_print_aer(pdev, aer_severity, aer);
> > +	pci_dev_put(pdev);
> > +}
>=20
>=20





