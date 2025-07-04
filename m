Return-Path: <linuxppc-dev+bounces-10119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4F3AF9474
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 15:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYZbz2bNwz3bmQ;
	Fri,  4 Jul 2025 23:43:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751636639;
	cv=none; b=h5q82t/vkjCLomQj9T8mfQ03fb2FUf0yexmqOctTuRzzmUqBxWKNFGGbzbaF2dyPmgize52ykivMov3aT11nLCiB1Cr/b6sCnESZhAeT5Qz9hO9tdLs5OrZabIeQlOAC2+3JF2c6J3i36C5CSZM263ALfrOwUNUYpCcdD22JxCQUCl01mSOkF1wAnP1pYu1pBGKE3W8Ut19B8x+MWfsIgxNxSYZeShwdTNz+C0SxfcJfB52aSMfM+sTDWKEMWQxQF/MrzDTHjrcbpi/NwoEeKFI0Q+dfNx6fDFmgoi7fqUQfVaxHq47KcNEODT4dN14YYHsgWLsgib91rAXCL6V0og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751636639; c=relaxed/relaxed;
	bh=hlrAIUubpmcgN51JUzcGLPRxEyewbvaMgK3cuuOKFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e98dv/u9wXHiKSqSBN6CjYn5oSXVylvTFmEEXELjVFxT/d8kF62gkZZp8z7rHsZIQRX+7W9IqODQsmEkhjTVYiuxVvAsfQPi/QgnfpcArmdE4tpt18SbJFJCotslOuAzvZch0WDM+Xl6n1BBPFn0koRC+qsqZe3kGky+wxfOiaWXPuTpIsIs1MRCrVPf75IdCLoEkE4p/Dah4hcIv66hs+FF9NUeA4nil3DIl1jehAlMCSzg8JWmETMXQmgs+18AdsWaYEpd1ksGSsKXIdNRwrTVAnczp7lJyCKi9M8O7O5Gq8uVt4f5GMsg/ywhGYDozpGwCIs5p6rhh4TcnkR7Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIrQ9YtB; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIrQ9YtB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYZbx019Qz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 23:43:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751636637; x=1783172637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KmpX5zxlGsQARhawRN1W4dV47zBrJ2MU4Gpq1Itt2mE=;
  b=eIrQ9YtBVcOmyr8HNh4Fm+NlBVmf2chs5QWBSsddMvdegujN/dtPL9vP
   0co+SG239msrWglpJ1VSEl7+1ZqCB6LfwZQH17L6n2wWjPDLeLsE8YIRm
   HC8yZ5MbmTp4b5mNTqG5KFyk6cOKGhHUoPFwUMpRpMevzc3vdg0gpWPB3
   zCek2kcgRGgiN5hLxeNLBOUwzNzK7jt6AFo+dqxjSf7wsKPGk3FvyQj4j
   zIiU3zyoi5hZ3XVqOY7S51rji7/izn+jhnfg4eBqIHBT8kQ+f8EfC5oYE
   OBvTrmi3VVq5VhhqUlv57TB0fcV0Lv2k96Z/zY9u9mt/flaEbasqHFsJC
   g==;
X-CSE-ConnectionGUID: 0vwkPmDtQTm+AeJGHURsWA==
X-CSE-MsgGUID: F3sOQoguR6+G4AC080coZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57745982"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="57745982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 06:43:53 -0700
X-CSE-ConnectionGUID: Xlct5SpASzGOsWnvRo5+Cg==
X-CSE-MsgGUID: al4pzX24RQSY0KYIv3BFLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155408398"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.112])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 06:43:46 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-edac@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject:
 Re: [PATCH 3/3 v4] ACPI: extlog: Trace CPER CXL Protocol Error Section
Date: Fri, 04 Jul 2025 15:43:43 +0200
Message-ID: <2114182.IDvDuAF1LB@fdefranc-mobl3>
In-Reply-To: <20250701140503.00006a48@huawei.com>
References:
 <20250623145453.1046660-1-fabio.m.de.francesco@linux.intel.com>
 <20250623145453.1046660-4-fabio.m.de.francesco@linux.intel.com>
 <20250701140503.00006a48@huawei.com>
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
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tuesday, July 1, 2025 3:05:03=E2=80=AFPM Central European Summer Time Jo=
nathan Cameron wrote:
> On Mon, 23 Jun 2025 16:54:20 +0200
> "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:
>=20
> > When Firmware First is enabled, BIOS handles errors first and then it m=
akes
> > them available to the kernel via the Common Platform Error Record (CPER)
> > sections (UEFI 2.10 Appendix N). Linux parses the CPER sections via one=
 of
> > two similar paths, either ELOG or GHES. The errors managed by ELOG are
> > signaled to the BIOS by the I/O Machine Check Architecture (I/O MCA).
> >=20
> > Currently, ELOG and GHES show some inconsistencies in how they report to
> > userspace via trace events.
> >=20
> > Therefore, make the two mentioned paths act similarly by tracing the CP=
ER
> > CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13).
> >=20
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@lin=
ux.intel.com>
> > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.=
com>
> > ---
> >  drivers/acpi/acpi_extlog.c | 62 ++++++++++++++++++++++++++++++++++++++
> >  drivers/cxl/core/ras.c     |  6 ++++
> >  include/cxl/event.h        |  2 ++
> >  3 files changed, 70 insertions(+)
> >=20
> > diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> > index cefe8d2d8affc..9a37b08aacfea 100644
> > --- a/drivers/acpi/acpi_extlog.c
> > +++ b/drivers/acpi/acpi_extlog.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/ratelimit.h>
> >  #include <linux/edac.h>
> >  #include <linux/ras.h>
> > +#include <cxl/event.h>
> >  #include <acpi/ghes.h>
> >  #include <asm/cpu.h>
> >  #include <asm/mce.h>
> > @@ -160,6 +161,60 @@ static void extlog_print_pcie(struct cper_sec_pcie=
 *pcie_err,
> >  	pci_dev_put(pdev);
> >  }
> > =20
> > +static void
> > +extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> > +				int severity)
> > +{
> > +	struct cxl_cper_prot_err_work_data wd;
> > +	u8 *dvsec_start, *cap_start;
>=20
>=20
> A bunch of this is identical to cxl_cper_post_prot_err()
> Can we factor that stuff out for common use?
>=20
> > +
> > +	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
> > +		pr_warn_ratelimited("CXL CPER invalid agent type\n");
> > +		return;
> > +	}
> > +
> > +	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
> > +		pr_warn_ratelimited("CXL CPER invalid protocol error log\n");
> > +		return;
> > +	}
> > +
> > +	if (prot_err->err_len !=3D sizeof(struct cxl_ras_capability_regs)) {
> > +		pr_warn_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
> > +				    prot_err->err_len);
> > +		return;
> > +	}
> > +
> > +	if ((prot_err->agent_type =3D=3D RCD || prot_err->agent_type =3D=3D D=
EVICE ||
> > +	     prot_err->agent_type =3D=3D LD || prot_err->agent_type =3D=3D FM=
LD) &&
> > +	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> > +		pr_warn_ratelimited(FW_WARN
> > +				    "CXL CPER no device serial number\n");
>=20
> Whilst some of this check isn't present in cxl_cper_post_prot_err(), it s=
hould
> be harmless.
>
Maybe all these checks should go to a static helper in cxl/core/ras.c which
cxl_cper_handle_prot_err can call? But I'm not entirely sure yet it would=20
really be worth. Anyway, I'll look into it.

Thanks,

=46abio




