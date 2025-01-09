Return-Path: <linuxppc-dev+bounces-4905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7AEA07193
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 10:36:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTKRk416Nz2xQD;
	Thu,  9 Jan 2025 20:36:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736415394;
	cv=none; b=ZIcPaOgK7HIacCMrXzeX9M1LxGrIlw+7q9jHxw9IcPt6/WadvsW/TC97NYyyGBQwWdf43a9rAbaH+WtIcb7yF3lB/CNcG60EZtW+QWhM9xKOOXSoNtU3Tu3Riz+1QqkkoGFowY2nNLMP6KIBeHl5tQo1sil8CxnNb4zYoaIVTzyiAAjM/+llMo3PqK6VZuVtFUNT8uhlsCa/lJ9irhMFGVlHl2hbPG28MYCBSti5zZS16QmKJ5jHnfnZJsFRiqJDh4Lgz+sBAgb+EPtH5mEX1QeElP+4dEEIyTifuf+mZz6kfpXQF5+0yuBIuQe7KpnFKUPZ1EUJg2P7CWjZNDSUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736415394; c=relaxed/relaxed;
	bh=EbMmRZyZumO7XVF1M9BsS2pwQ0q+NGeRk/B5QixjUL0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M/51sT0dgNUzMQo6jYzcQMwhX7R2didCr3KVAqldNTCPquwCuGi+AtxxVwPQaIwTvSNucmcsJjIQVGhP5CJcvwLeRPxS3qyICXsDUbGc/nPP6sGw+I0Aaf6WUppY9wm2K+8+zDQCsgdBYd61CwmiRpv+dvHLBfD1D+AkyUayn3tEYuoo98rRODn6YUc4sQz11wGzaxQj+9vH0A6KKZzfZXM5ptFY6SSetDlOrIiqk0dhjerV9wo+A668dhLHoNQYpiYoEO9B2SpA0KwFYUgUQlFis6xEBukuaikYZdQm3S/H2Umo6ZKlg1j1CCSpzblBbcpZb4M9F6n8bJUuqnBmfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R5xIGR22; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R5xIGR22;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTKRg0Qz7z2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 20:36:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736415391; x=1767951391;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=K4rx36aF+LJL+HwBYL4wZ1WTeoNafvHfL/WkHvywtxQ=;
  b=R5xIGR22ezPJz/mn+DXcwjyPvUMVYvD+dd7knu42jgfk0flSXjXGPQyS
   xYQD92W3p24X/iEx8jAT1Zkz846ttWagP2n1We+QgFsWTG7O70Ip54CwU
   fcwdX3w/jFbdzBHjegEvNg8G3+TrQ1ab/Go5qYqiY8G7qNx3aHlw8jv6q
   BOaM7H6yEAYLvaN8Zi3/p03UpUKwgvzd3Dl2r4a+CZxf30QSoUY1YGdT2
   k75E5qDe8avwJvmpQIqWVTB5JiliEF9hUHW4n6qgS/mEnVgPNEeGAjNLk
   qRy1XeqHcdLRZKgnPrDInRyVeztQSCU42z0VltJc/ltlX42fptRNzal0b
   g==;
X-CSE-ConnectionGUID: hHXT0bQaQjiZ2M8NdW+gmQ==
X-CSE-MsgGUID: P1JhtbfwQ6S8jgTXb8X/FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="62044707"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="62044707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:36:24 -0800
X-CSE-ConnectionGUID: LDrN3JQiSryHOg+BI2B8fw==
X-CSE-MsgGUID: mwjSmZbwQyqyqZfLSODPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140679668"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:36:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jan 2025 11:36:17 +0200 (EET)
To: Yazen Ghannam <yazen.ghannam@amd.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/7] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <20250108213359.GC1342186@yaz-khff2.amd.com>
Message-ID: <a7a769c6-0a4d-0e50-f2d7-6556db0fa7bf@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com> <20241218143747.3159-7-ilpo.jarvinen@linux.intel.com> <20250108213359.GC1342186@yaz-khff2.amd.com>
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
Content-Type: multipart/mixed; BOUNDARY="8323328-1620162179-1736413457=:938"
Content-ID: <d097befd-a7a7-8093-a0aa-3d69536ba622@linux.intel.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1620162179-1736413457=:938
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d145a1cb-57f9-ef27-d597-5ada2cb814fc@linux.intel.com>

On Wed, 8 Jan 2025, Yazen Ghannam wrote:

> On Wed, Dec 18, 2024 at 04:37:46PM +0200, Ilpo J=E4rvinen wrote:
> > pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
> > (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> >=20
> > Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> > TLP Prefix Log. The relevant registers are formatted identically in AER
> > and DPC Capability, but has these variations:
> >=20
> > a) The offsets of TLP Prefix Log registers vary.
> > b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
> > c) AER TLP Prefix Log Present (PCIe r6.1 sec 7.8.4.7) can indicate
> >    Prefix Log is not present.
> >=20
> > Therefore callers must pass the offset of the TLP Prefix Log register
> > and the entire length to pcie_read_tlp_log() to be able to read the
> > correct number of TLP Prefix DWORDs from the correct offset.
> >=20
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  drivers/pci/pci.h             |  5 +++-
> >  drivers/pci/pcie/aer.c        |  5 +++-
> >  drivers/pci/pcie/dpc.c        | 13 +++++----
> >  drivers/pci/pcie/tlp.c        | 51 +++++++++++++++++++++++++++++++----
> >  include/linux/aer.h           |  1 +
> >  include/uapi/linux/pci_regs.h | 10 ++++---
> >  6 files changed, 67 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 55fcf3bac4f7..7797b2544d00 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -550,7 +550,9 @@ struct aer_err_info {
> >  int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info=
 *info);
> >  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> > =20
> > -int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_=
log *log);
> > +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> > +=09=09      unsigned int tlp_len, struct pcie_tlp_log *log);
> > +unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
> >  #endif=09/* CONFIG_PCIEAER */
> > =20
> >  #ifdef CONFIG_PCIEPORTBUS
> > @@ -569,6 +571,7 @@ void pci_dpc_init(struct pci_dev *pdev);
> >  void dpc_process_error(struct pci_dev *pdev);
> >  pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
> >  bool pci_dpc_recovered(struct pci_dev *pdev);
> > +unsigned int dpc_tlp_log_len(struct pci_dev *dev);
> >  #else
> >  static inline void pci_save_dpc_state(struct pci_dev *dev) { }
> >  static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 80c5ba8d8296..656dbf1ac45b 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1248,7 +1248,10 @@ int aer_get_device_error_info(struct pci_dev *de=
v, struct aer_err_info *info)
> > =20
> >  =09=09if (info->status & AER_LOG_TLP_MASKS) {
> >  =09=09=09info->tlp_header_valid =3D 1;
> > -=09=09=09pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
> > +=09=09=09pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
> > +=09=09=09=09=09  aer + PCI_ERR_PREFIX_LOG,
> > +=09=09=09=09=09  aer_tlp_log_len(dev, aercc),
> > +=09=09=09=09=09  &info->tlp);
> >  =09=09}
> >  =09}
> > =20
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index 2b6ef7efa3c1..7933b3cedb59 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -190,7 +190,7 @@ pci_ers_result_t dpc_reset_link(struct pci_dev *pde=
v)
> >  static void dpc_process_rp_pio_error(struct pci_dev *pdev)
> >  {
> >  =09u16 cap =3D pdev->dpc_cap, dpc_status, first_error;
> > -=09u32 status, mask, sev, syserr, exc, log, prefix;
> > +=09u32 status, mask, sev, syserr, exc, log;
> >  =09struct pcie_tlp_log tlp_log;
> >  =09int i;
> > =20
> > @@ -217,20 +217,19 @@ static void dpc_process_rp_pio_error(struct pci_d=
ev *pdev)
> > =20
> >  =09if (pdev->dpc_rp_log_size < 4)
> >  =09=09goto clear_status;
> > -=09pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG, &tlp_l=
og);
> > +=09pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
> > +=09=09=09  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
> > +=09=09=09  dpc_tlp_log_len(pdev), &tlp_log);
> >  =09pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
> >  =09=09tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
> > +=09for (i =3D 0; i < pdev->dpc_rp_log_size - 5; i++)
> > +=09=09pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.pr=
efix[i]);
> > =20
> >  =09if (pdev->dpc_rp_log_size < 5)
> >  =09=09goto clear_status;
> >  =09pci_read_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_IMPSPEC_LOG, &=
log);
> >  =09pci_err(pdev, "RP PIO ImpSpec Log %#010x\n", log);
> > =20
> > -=09for (i =3D 0; i < pdev->dpc_rp_log_size - 5; i++) {
> > -=09=09pci_read_config_dword(pdev,
> > -=09=09=09cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG + i * 4, &prefix);
> > -=09=09pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, prefix);
> > -=09}
> >   clear_status:
> >  =09pci_write_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_STATUS, statu=
s);
> >  }
> > diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> > index 65ac7b5d8a87..302ba99e64e6 100644
> > --- a/drivers/pci/pcie/tlp.c
> > +++ b/drivers/pci/pcie/tlp.c
> > @@ -11,26 +11,67 @@
> > =20
> >  #include "../pci.h"
> > =20
> > +/**
> > + * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log l=
ength
> > + * @dev: PCIe device
> > + * @aercc: AER Capabilities and Control register value
> > + *
> > + * Return: TLP Header/Prefix Log length
> > + */
> > +unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc)
> > +{
> > +=09return 4 + (aercc & PCI_ERR_CAP_PREFIX_LOG_PRESENT) ?
>=20
> Another place for a "BASE_NR_*" define. I incorrectly said "MAX_NR_*" in
> a previous patch. But "BASE" or "STD" seems more appropriate.

Thanks for the reviews!

I don't know why I didn't realize I was adding a literal 4 in many places.=
=20
I'll surely add a define for it now that you pointed it out, thanks.

> > +=09=09   dev->eetlp_prefix_max : 0;
> > +}
> > +
> > +#ifdef CONFIG_PCIE_DPC
> > +/**
> > + * dpc_tlp_log_len - Calculates DPC RP PIO TLP Header/Prefix Log lengt=
h
> > + * @dev: PCIe device
> > + *
> > + * Return: TLP Header/Prefix Log length
> > + */
> > +unsigned int dpc_tlp_log_len(struct pci_dev *dev)
> > +{
> > +=09/* Remove ImpSpec Log register from the count */
> > +=09if (dev->dpc_rp_log_size >=3D 5)
> > +=09=09return dev->dpc_rp_log_size - 1;
> > +
> > +=09return dev->dpc_rp_log_size;
> > +}
> > +#endif
> > +
> >  /**
> >   * pcie_read_tlp_log - read TLP Header Log
> >   * @dev: PCIe device
> >   * @where: PCI Config offset of TLP Header Log
> > + * @where2: PCI Config offset of TLP Prefix Log
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
> >  =09unsigned int i;
> > -=09int ret;
> > +=09int off, ret;
> > +=09u32 *to;
> > =20
> >  =09memset(log, 0, sizeof(*log));
> > =20
> > -=09for (i =3D 0; i < 4; i++) {
> > -=09=09ret =3D pci_read_config_dword(dev, where + i * 4, &log->dw[i]);
> > +=09for (i =3D 0; i < tlp_len; i++) {
> > +=09=09if (i < 4) {
> > +=09=09=09off =3D where + i * 4;
> > +=09=09=09to =3D &log->dw[i];
> > +=09=09} else {
> > +=09=09=09off =3D where2 + (i - 4) * 4;
> > +=09=09=09to =3D &log->prefix[i - 4];
> > +=09=09}
> > +
> > +=09=09ret =3D pci_read_config_dword(dev, off, to);
> >  =09=09if (ret)
> >  =09=09=09return pcibios_err_to_errno(ret);
>=20
> Could we do two loops? Sorry if this was already discussed.
>=20
> =09for (i =3D 0; i < min(tlp_len, BASE_NR_TLP); i++, where +=3D 4, tlp_le=
n--) {
> =09=09ret =3D pci_read_config_dword(dev, where, &log->dw[i]);
> =09=09if (ret)
> =09=09=09return pcibios_err_to_errno(ret);
> =09}
>=20
> =09for (i =3D 0; i < tlp_len; i++, where2 +=3D 4) {
> =09=09ret =3D pci_read_config_dword(dev, where2, &log->prefix[i]);
> =09=09if (ret)
> =09=09=09return pcibios_err_to_errno(ret);
> =09}

I'm not convinced splitting it would be clearly better. After the flit=20
mode patch, only variation that will remain is the offset calculation=20
(extended ->dw[] entires will be overlapping with ->prefix[] using union=20
trickery so I can just use ->dw[i] in the loop).

> >  =09}
> > diff --git a/include/linux/aer.h b/include/linux/aer.h
> > index 190a0a2061cd..dc498adaa1c8 100644
> > --- a/include/linux/aer.h
> > +++ b/include/linux/aer.h
> > @@ -20,6 +20,7 @@ struct pci_dev;
> > =20
> >  struct pcie_tlp_log {
> >  =09u32 dw[4];
> > +=09u32 prefix[4];
>=20
> Another place for "BASE_NR_*".
>=20
> >  };
> > =20
> >  struct aer_capability_regs {
> > diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_reg=
s.h
> > index 14a6306c4ce1..82866ac0bda7 100644
> > --- a/include/uapi/linux/pci_regs.h
> > +++ b/include/uapi/linux/pci_regs.h
> > @@ -790,10 +790,11 @@
> >  =09/* Same bits as above */
> >  #define PCI_ERR_CAP=09=090x18=09/* Advanced Error Capabilities & Ctrl*=
/
> >  #define  PCI_ERR_CAP_FEP(x)=09((x) & 0x1f)=09/* First Error Pointer */
> > -#define  PCI_ERR_CAP_ECRC_GENC=090x00000020=09/* ECRC Generation Capab=
le */
> > -#define  PCI_ERR_CAP_ECRC_GENE=090x00000040=09/* ECRC Generation Enabl=
e */
> > -#define  PCI_ERR_CAP_ECRC_CHKC=090x00000080=09/* ECRC Check Capable */
> > -#define  PCI_ERR_CAP_ECRC_CHKE=090x00000100=09/* ECRC Check Enable */
> > +#define  PCI_ERR_CAP_ECRC_GENC=09=090x00000020 /* ECRC Generation Capa=
ble */
> > +#define  PCI_ERR_CAP_ECRC_GENE=09=090x00000040 /* ECRC Generation Enab=
le */
> > +#define  PCI_ERR_CAP_ECRC_CHKC=09=090x00000080 /* ECRC Check Capable *=
/
> > +#define  PCI_ERR_CAP_ECRC_CHKE=09=090x00000100 /* ECRC Check Enable */
> > +#define  PCI_ERR_CAP_PREFIX_LOG_PRESENT=090x00000800 /* TLP Prefix Log=
 Present */
>=20
> I didn't think to mention this in a previous patch, but could/should we
> use GENMASK() for bitmasks updates? I know it's a break from the current
> style though.

Bjorn called himself "a dinosaur" when it comes to GENMASK() :-):

https://lore.kernel.org/linux-pci/20231031200312.GA25127@bhelgaas/

> >  #define PCI_ERR_HEADER_LOG=090x1c=09/* Header Log Register (16 bytes) =
*/
> >  #define PCI_ERR_ROOT_COMMAND=090x2c=09/* Root Error Command */
> >  #define  PCI_ERR_ROOT_CMD_COR_EN=090x00000001 /* Correctable Err Repor=
ting Enable */
> > @@ -809,6 +810,7 @@
> >  #define  PCI_ERR_ROOT_FATAL_RCV=09=090x00000040 /* Fatal Received */
> >  #define  PCI_ERR_ROOT_AER_IRQ=09=090xf8000000 /* Advanced Error Interr=
upt Message Number */
> >  #define PCI_ERR_ROOT_ERR_SRC=090x34=09/* Error Source Identification *=
/
> > +#define PCI_ERR_PREFIX_LOG=090x38=09/* TLP Prefix LOG Register (up to =
16 bytes) */
> > =20
> >  /* Virtual Channel */
> >  #define PCI_VC_PORT_CAP1=090x04

--=20
 i.
--8323328-1620162179-1736413457=:938--

