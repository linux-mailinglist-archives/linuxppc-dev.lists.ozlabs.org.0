Return-Path: <linuxppc-dev+bounces-9083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D951ACBAE8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 20:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bB24W4X4nz2yPS;
	Tue,  3 Jun 2025 04:12:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748887947;
	cv=none; b=DDoJg5jzXBOWQltAHzfuhPwFHnAxC1J82j1D4/gyNSWPuOMcR3oR/jKiFhQAmShUZS87r0AWUycwNR3o0LDj6rFsdmTOMknBcv9qSsr6W36A7kj2NcTfh83aGQLvhntbiprGiqZW0aMXNlOta9oi4taqSrslTkXRN2Zu1NRRyxkMBUL7DoterkIJw/coIuhWRXeoOE/1SpJ/qT7uPgym/p7dsFLODWNCIQOBvgVxPCwYv2gXxRODOva1hrXwOzwSOV1tos/iFUdOUwsbnj6wWs/jtpmqp+qEO0xKCkZsg/sPcUJEUEB7JPojlGJWfNfgpkY5knAqyKA0bgLaEGPZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748887947; c=relaxed/relaxed;
	bh=NeZoPwB+6JOkvYe2VU0l/le/5Qh+jq9eDgVf+bUMvjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hI1Z728RZYYDTJxd20jo+Yt7SeYFwYYaaDpCFKcb94WYm/OXIGZLZ8u9IDrFvmLLocrjONHB8T4rkuue7oMzj+zyw9fKBiGwCo9PUp90K2SoQ9pZpWp6u6SUip8GbocucvPs7M+it4Hw1VPLnQBRf3gEqr/PeQI1hMUXiRscZiWRH1cWePZMxEGNk1bxIVq6YT4Ig9kBdf12F92uamHTucXl1fZqhrj8LS4ZAScgQneplYn4wngXo9/GdUcQcedE7OiAuPxN4PGvC0x9sjqXpJWXjgd9vLs3QN9yCQz3vb+y26EJjzhaNC0Qp/J8NZH8ET1C0rUixJftW9GmQ/Cr0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoFKy2QA; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoFKy2QA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 04:12:26 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bB24V3rD9z2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 04:12:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748887947; x=1780423947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2UUlMrZ8pq2KZwO7Te3yGwm+qcaW3/azDJtyt1C5sXU=;
  b=SoFKy2QAfxC2WF2BtAnjtr/n/t30jUXUHrv4VrVW6fhHgkGKEhT+ONmG
   LatHmf+FPqCcdc9k73Rojieu/yk5zP7jvTXEyBNvR2Q95S3tA8zk9oJmi
   BqXow6EFkbsIH3Hga+HMoy9UoX1mqBzkWrTyonylpsYhjxuKs14yD+c9I
   VTxMOdTcLAyU4IKIfirnirBUKKtqHzZm/6WDnnw0IzuWHnfcXL7vzho3y
   Z8tOzsQWP/7mdfFdhhKIxmkfKrrZlBwGvQYp1I5oiSidXXN+S7+LSsEqp
   iS86bQVv80bZu3qSwUfh+hDEVCMw1j9OXqVLBcE8xmeuJxXWQrduTojzm
   g==;
X-CSE-ConnectionGUID: 0uppLnc1Tw2fMd2ihJjqig==
X-CSE-MsgGUID: DoxuO7YZRWWndxqOzJTmlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51004927"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="51004927"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:11:20 -0700
X-CSE-ConnectionGUID: 9Hr2MReVSlembJqHcEmVpg==
X-CSE-MsgGUID: iehnMzY1TL2kjPR7bm1I/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="145561290"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.244])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:11:13 -0700
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
Subject: Re: [PATCH 3/4 v2] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Mon, 02 Jun 2025 18:59:05 +0200
Message-ID: <3791386.LZWGnKmheA@fdefranc-mobl3>
In-Reply-To: <20250429180242.GA76257@yaz-khff2.amd.com>
References:
 <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
 <20250429172109.3199192-4-fabio.m.de.francesco@linux.intel.com>
 <20250429180242.GA76257@yaz-khff2.amd.com>
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

On Tuesday, April 29, 2025 8:02:42=E2=80=AFPM Central European Summer Time =
Yazen Ghannam wrote:
> On Tue, Apr 29, 2025 at 07:21:08PM +0200, Fabio M. De Francesco wrote:
> > I/O Machine Check Arcitecture events may signal failing PCIe components
> > or links. The AER event contains details on what was happening on the w=
ire
> > when the error was signaled.
> >=20
> > Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
> > by the I/O MCA.
> >=20
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.=
com>
> > ---
> >  drivers/acpi/acpi_extlog.c | 30 ++++++++++++++++++++++++++++++
> >  drivers/pci/pcie/aer.c     |  2 +-
> >  include/linux/aer.h        | 13 +++++++++++--
> >  3 files changed, 42 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> > index caca6ccd6e99..7d7a813169f1 100644
> > --- a/drivers/acpi/acpi_extlog.c
> > +++ b/drivers/acpi/acpi_extlog.c
> > @@ -131,6 +131,32 @@ static int print_extlog_rcd(const char *pfx,
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
> > +	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
> > +	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
>=20
> You can save an indentation level by inverting this check and returning
> early.
>=20
Nice idea, I'll do it.
>
> > +		aer_severity =3D cper_severity_to_aer(severity);
>=20
> I think it would help with clarity if all these lines were aligned on
> the "=3D".
>=20
> > +		aer =3D (struct aer_capability_regs *)pcie_err->aer_info;
> > +		domain =3D pcie_err->device_id.segment;
> > +		bus =3D pcie_err->device_id.bus;
>=20
> Many of these variables are passed unchanged to a single function below.
>=20
> Why not pass them directly to the function?
>=20
> Even if you split the function parameters across multiple lines, you
> will still have fewer lines. Plus you will not need to allocate the
> variables.
>=20
I think that the cost is minimal and readability is improved.
>
> > +		devfn =3D PCI_DEVFN(pcie_err->device_id.device,
> > +				  pcie_err->device_id.function);
> > +		pdev =3D pci_get_domain_bus_and_slot(domain, bus, devfn);
> > +		if (!pdev)
> > +			return;
>=20
> Newline here, please.
>=20
Sure.
>
> > +		pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);
>=20
> Why use a debug log level?
>
Dan Williams suggested the debug log level commenting v1.
>
> > +		pci_dev_put(pdev);
> > +	}
> > +}
> > +
> >  static int extlog_print(struct notifier_block *nb, unsigned long val,
> >  			void *data)
> >  {
> > @@ -182,6 +208,10 @@ static int extlog_print(struct notifier_block *nb,=
 unsigned long val,
> >  			if (gdata->error_data_length >=3D sizeof(*mem))
> >  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
> >  						       (u8)gdata->error_severity);
> > +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> > +			struct cper_sec_pcie *pcie_err =3D acpi_hest_get_payload(gdata);
> > +
> > +			extlog_print_pcie(pcie_err, gdata->error_severity);
> >  		} else {
> >  			void *err =3D acpi_hest_get_payload(gdata);
> > =20
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index d0ebf7c15afa..627fcf434698 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -801,7 +801,7 @@ void pci_print_aer(char *level, struct pci_dev *dev=
, int aer_severity,
> >  	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
> >  			aer_severity, tlp_header_valid, &aer->header_log);
> >  }
> > -EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> > +EXPORT_SYMBOL_GPL(pci_print_aer);
> > =20
> >  /**
> >   * add_error_device - list device to be handled
> > diff --git a/include/linux/aer.h b/include/linux/aer.h
> > index 45d0fb2e2e75..737db92e6570 100644
> > --- a/include/linux/aer.h
> > +++ b/include/linux/aer.h
> > @@ -56,17 +56,26 @@ struct aer_capability_regs {
> >  #if defined(CONFIG_PCIEAER)
> >  int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
> >  int pcie_aer_is_native(struct pci_dev *dev);
> > +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> > +		   struct aer_capability_regs *aer);
> >  #else
> >  static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
> >  {
> >  	return -EINVAL;
> >  }
> >  static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
> > +static inline void pci_print_aer(char *level, struct pci_dev *dev,
> > +				 int aer_severity,
> > +				 struct aer_capability_regs *aer)
> > +{ }
>=20
> I think the "{ }" can just go at the end of the parameters.
>=20
> >  #endif
> > =20
> > -void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> > -		   struct aer_capability_regs *aer);
> > +#if defined(CONFIG_ACPI_APEI_PCIEAER)
> >  int cper_severity_to_aer(int cper_severity);
> > +#else
> > +static inline int cper_severity_to_aer(int cper_severity) { return 0; }
>=20
> This may have an unintentional side effect.
>=20
> '0' means AER_NONFATAL.
>=20
> So the function will return that the error is an uncorrectable AER error
> that is potentially recoverable. At a minimum, this will incorrectly
> classify the error for data collection, and it could cause incorrect
> handling.
>=20
> I guess the risk is minimal, since CONFIG_ACPI_APEI_PCIEAER will likely
> be enabled on systems that would use this.
>
Noted. Kconfig will select CONFIG_ACPI_APEI_PCIEAER.
>
> Thanks,
> Yazen
>

Thanks,

=46abio



