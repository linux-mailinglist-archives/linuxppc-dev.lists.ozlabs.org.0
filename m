Return-Path: <linuxppc-dev+bounces-9082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEE7ACBAE4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 20:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bB24N6YK2z2y8l;
	Tue,  3 Jun 2025 04:12:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748887940;
	cv=none; b=iMf/mEDXah2fWTvDa6yfaD/OfQcU7muP7LNjyMu+zXza7Sk6SsmTKkt7J1IrCYil9t/kc77yDUccbU1SG2tYHfs3TbHNfYk2Y+6ApWLHhfaLqtE/DtjPL9HNMSgJC9BMEkQDVCfdK+RZyjhRcwl9/waY89l2wnNrvVxIqkaBuICRc6GUx+LDZkWKm1Snz0mpfFDHBAnTTfdxOKiGmQhRNRjonTlyGyX3NyvuMJ/MqyfESwsOgxwD3/0zsSpP1PoFOkGf1IhKyfXEbBJ3HI0a4kV2UicmPS6ThdCkc8jouqh1fPAZ2kgzxFBjyQevIpOIzClcz9fuA4CboO9NQSRNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748887940; c=relaxed/relaxed;
	bh=XKIL+UARRUyl8cfPiqIMRBjq3+QhF0kxm8VJbs0JzYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8j56yhWf5jfHrwsKiSCizjw89d84ToRKpdMUINpVUSEyIlFUSnNu9++9BaiwsLkJF0Oo1gvFXLAKlOc6Dm8KJJQbJlYSrRqksu91jsUYHJlOwOBxuxaG6AsEDySMwLiTASzE+lVhYdCGt+Bd7sRcdXSw8rYJXLPNtf2e9fETerFSi+QOSJXr4sFNxTftAg0P7i1KlT0bPIDOp5//J+z+V/pJp4OrltHf/VlKdw97QeTUN3znUD8k8UALc1N1HTIBVixyoXd24TDAQ7iXkp6w3xD2NYQRPqSNpqhVF/fFRPrAOmgj7HtJg3yJV/TExPw+kQ20yuiKp9ZEPKd3EJvDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1ZnYiyT; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1ZnYiyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 04:12:18 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bB24L2sSZz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 04:12:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748887939; x=1780423939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=30U5FrzZe477PkMourbldSSCDpz4fRDaC700uOnf3C0=;
  b=V1ZnYiyTjnWXs3AvLyeyGPBPBisKoQHMqWqSH3GctJ3CfGL37g8WazqH
   YRYSvP1rNdn1XG9241JBvH2jGPDUFbx9ojBsEJlgdmN6Ty1joU2znphGj
   wvZtOWyxkqGssqzGWy7idtrcoVYEsvDHn7bbO6yDDCz1j3Kp44am3mC1o
   hzJ7XVNvFcyDwrSjoxmjbNWTs4PqexE06RfL8IFIY42zQTWrrlvAyLpjb
   X7legggyOx8ooQbSxvhS7hqSYXlruF7tN7J9GHB5GQDYP9DGeZ6x0aCKW
   1L89dv4qeEZXSKX52pbjT9JRPnnxsKRZMmWXSQeuEq/9R+UfeQJURmKpO
   g==;
X-CSE-ConnectionGUID: n74svS06RWKb6LU077WGSA==
X-CSE-MsgGUID: 6E3982tQStugN2LlGItkcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50770710"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="50770710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:11:10 -0700
X-CSE-ConnectionGUID: rmcKHSDgT8WBm+xG+YxC8w==
X-CSE-MsgGUID: OZrs+IS/S4yOMpwDesH9+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="148467703"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:11:04 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH 4/4 v2] ACPI: extlog: Trace CPER CXL Protocol Errors
Date: Mon, 02 Jun 2025 20:06:28 +0200
Message-ID: <2947754.vYhyI6sBWr@fdefranc-mobl3>
In-Reply-To: <20250429182055.GB76257@yaz-khff2.amd.com>
References:
 <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
 <20250429172109.3199192-5-fabio.m.de.francesco@linux.intel.com>
 <20250429182055.GB76257@yaz-khff2.amd.com>
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

On Tuesday, April 29, 2025 8:20:55=E2=80=AFPM Central European Summer Time =
Yazen Ghannam wrote:
> On Tue, Apr 29, 2025 at 07:21:09PM +0200, Fabio M. De Francesco wrote:
> > When Firmware First is enabled, BIOS handles errors first and then it
> > makes them available to the kernel via the Common Platform Error Record
> > (CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
> > via one of two similar paths, either ELOG or GHES.
> >=20
> > Currently, ELOG and GHES show some inconsistencies in how they report to
> > userspace via trace events.
> >=20
> > Therfore make the two mentioned paths act similarly by tracing the CPER
> > CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13) signaled by the
> > I/O Machine Check Architecture and reported by BIOS in FW-First.
> >=20
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.=
com>
> > ---
> >  drivers/acpi/acpi_extlog.c | 60 ++++++++++++++++++++++++++++++++++++++
> >  drivers/cxl/core/ras.c     |  6 ++++
> >  include/cxl/event.h        |  2 ++
> >  3 files changed, 68 insertions(+)
> >=20
> > diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> > index 7d7a813169f1..8f2ff3505d47 100644
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
> > @@ -157,6 +158,60 @@ static void extlog_print_pcie(struct cper_sec_pcie=
 *pcie_err,
> >  	}
> >  }
> > =20
> > +static void
> > +extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> > +				int severity)
> > +{
> > +#ifdef CONFIG_ACPI_APEI_PCIEAER
>=20
> Why not apply this check on the function prototype?
>=20
This function is static.
>
> Reference: Documentation/process/coding-style.rst
> 	   Section 21) Conditional Compilation
>=20
> > +	struct cxl_cper_prot_err_work_data wd;
> > +	u8 *dvsec_start, *cap_start;
> > +
> > +	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
> > +		pr_err_ratelimited("CXL CPER invalid agent type\n");
> > +		return;
> > +	}
> > +
> > +	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
> > +		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> > +		return;
> > +	}
> > +
> > +	if (prot_err->err_len !=3D sizeof(struct cxl_ras_capability_regs)) {
> > +		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
> > +				   prot_err->err_len);
> > +		return;
> > +	}
> > +
> > +	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> > +		pr_warn(FW_WARN "CXL CPER no device serial number\n");
>=20
> Is this a requirement (in the spec) that we should warn users about?
>=20
> The UEFI spec says that serial number is only used if "CXL agent" is a
> "CXL device".
>=20
> "CXL ports" won't have serial numbers. So this will be a false warning
> for port errors.
>=20
I'll add a test and print that warning only if agent is a device (RCD,
DEVICE, LD, FMLD).
>
> > +
> > +	switch (prot_err->agent_type) {
> > +	case RCD:
> > +	case DEVICE:
> > +	case LD:
> > +	case FMLD:
> > +	case RP:
> > +	case DSP:
> > +	case USP:
> > +		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
> > +
> > +		dvsec_start =3D (u8 *)(prot_err + 1);
> > +		cap_start =3D dvsec_start + prot_err->dvsec_len;
> > +
> > +		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
> > +		wd.severity =3D cper_severity_to_aer(severity);
> > +		break;
> > +	default:
> > +		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
>=20
> "invalid" is too harsh given that the specs may be updated. Maybe say
> "reserved" or "unknown" or "unrecognized" instead.
>=20
> Hopefully things will settle down to where a user will be able to have a
> system with newer CXL "agents" without *requiring* a kernel update. :)
>
I'll replace "invalid" with "unknown".
>=20
> Thanks,
> Yazen
>=20
Thanks,

=46abio




