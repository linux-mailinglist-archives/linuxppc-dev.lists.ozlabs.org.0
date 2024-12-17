Return-Path: <linuxppc-dev+bounces-4266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E19F4F9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 16:37:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCLXN2DWTz304x;
	Wed, 18 Dec 2024 02:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734449828;
	cv=none; b=IiPxXxnWffGkjTPNdQu1AJDBOR6sMpNDEhdTFtAXTFFXolIwiUFPJAlcKNac8HUQXSmyDfIO3GDY8335ShcdiA8t3BW2ab5+bsAuYw4R35rzXYy8YCEwViT4CCvNXRQmVPGb5CpvAaphSIbUpJkxbCMhylbwTVmqb/uGKyW8uBubXTkdr2ean5Moob5oajVqzruNTDmuel8ZsAGwr5vJ74fd78OlCzjOSexSw71IDiXuFNdtDQZkFDHePyEP5EfavFlkkmjwJDUM0DnSfU2hSbaf+gm2//A+alwF3DKfi8N92QNBB/BKvfgexFrsAYV+F0aoNCKhklGqNyOKFgURyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734449828; c=relaxed/relaxed;
	bh=qdS+KJxeZKRYlKSS+uNoV0JDCSjiconymZtWIDzU/v8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Bcid1ovuzhejZYgH84uSr8bW3rdNUo+Z1m7n6O3KdqSCCItmLighgtI8s9EOPc2wpFz60ohb6FxnKqmPhvz8r+xvOcr4OyQaoOYkybyVjSA6AInG3bUnsH7bvVj/RPjq7ETWc3z7te0hRdPB/XpYzmQsok2Vl9jQLeqkLP+9AjE1IiWJz3pE1YRwGdzeURDUj/blPM9+M5PZApN8/JcSxP1GVcnpMrIp8EISfwoRsqUADKfLH0gE5suKFYAgy23GkUrZMeEv6O32qzFwUFe8WeBUDgQSDt7gwZ/mfn3/c2eqPFnXfI1fFErdWC0Ii0f+A5yxruBN0DmzcHtbrzsPAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4o/GD6e; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4o/GD6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCLXJ2H1Yz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 02:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734449824; x=1765985824;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7khA5JcW71av4ThxWlBfqu2rJHa/l8SiGW54wOk9rwk=;
  b=n4o/GD6eQuuICFRJKOqJ6FQHtuHFbLto6IpBU5uHxDuSq6u8b6iq3D8+
   Tg+NB71yQPYRDNB1rbcN1VoDuKgDqm9+lUlY6wrLM+cK3Bd42FJx87EWY
   iNhZZRCQwhkoknrgXh0pMZjFVLXXEl1I430t01z54DrNGhQuW/CUGB55I
   srD8CpAtPMyV+fAtKNNt3WuXVntUA/TakdP2cuJ+IDZW9E1csHi0dSc+w
   s2E6P8Akc3DTj6WER7ICMXjjCi4BUrFpLzfBAQgK5hED9gg+bIzhP/NQX
   BSE4MLE8o4o9fivoAy+IjKlMQ1U1B3BumuokpRD8OmHXxHDbkHDeKId8R
   A==;
X-CSE-ConnectionGUID: SjZOF1UnTQODcVe3JbEpeQ==
X-CSE-MsgGUID: oCWN3G41SsG5qfEfQlWD2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34610200"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34610200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:36:59 -0800
X-CSE-ConnectionGUID: d6hHN4FZStOIlMxhNlCMqQ==
X-CSE-MsgGUID: wtU0e46sQ9m3H9Ev2SV1bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="97457037"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:36:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Dec 2024 17:36:51 +0200 (EET)
To: Bjorn Helgaas <bhelgaas@google.com>
cc: linux-pci@vger.kernel.org, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 6/8] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <20241217135358.9345-7-ilpo.jarvinen@linux.intel.com>
Message-ID: <9fa49c5d-4939-db48-c815-ccb496c82d0b@linux.intel.com>
References: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com> <20241217135358.9345-7-ilpo.jarvinen@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="8323328-798945083-1734449811=:924"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-798945083-1734449811=:924
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 17 Dec 2024, Ilpo J=C3=A4rvinen wrote:

> pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
> (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
>=20
> Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> TLP Prefix Log. The relevant registers are formatted identically in AER
> and DPC Capability, but has these variations:
>=20
> a) The offsets of TLP Prefix Log registers vary.
> b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
> c) AER TLP Prefix Log Present (PCIe r6.1 sec 7.8.4.7) can indicate
>    Prefix Log is not present.
>=20
> Therefore callers must pass the offset of the TLP Prefix Log register
> and the entire length to pcie_read_tlp_log() to be able to read the
> correct number of TLP Prefix DWORDs from the correct offset.
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/pci/pci.h             |  5 +++-
>  drivers/pci/pcie/aer.c        |  5 +++-
>  drivers/pci/pcie/dpc.c        | 13 +++++----
>  drivers/pci/pcie/tlp.c        | 50 +++++++++++++++++++++++++++++++----
>  include/linux/aer.h           |  1 +
>  include/uapi/linux/pci_regs.h | 10 ++++---
>  6 files changed, 66 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 55fcf3bac4f7..7797b2544d00 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -550,7 +550,9 @@ struct aer_err_info {
>  int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *=
info);
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> =20
> -int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_lo=
g *log);
> +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> +=09=09      unsigned int tlp_len, struct pcie_tlp_log *log);
> +unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
>  #endif=09/* CONFIG_PCIEAER */
> =20
>  #ifdef CONFIG_PCIEPORTBUS
> @@ -569,6 +571,7 @@ void pci_dpc_init(struct pci_dev *pdev);
>  void dpc_process_error(struct pci_dev *pdev);
>  pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>  bool pci_dpc_recovered(struct pci_dev *pdev);
> +unsigned int dpc_tlp_log_len(struct pci_dev *dev);
>  #else
>  static inline void pci_save_dpc_state(struct pci_dev *dev) { }
>  static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 80c5ba8d8296..656dbf1ac45b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1248,7 +1248,10 @@ int aer_get_device_error_info(struct pci_dev *dev,=
 struct aer_err_info *info)
> =20
>  =09=09if (info->status & AER_LOG_TLP_MASKS) {
>  =09=09=09info->tlp_header_valid =3D 1;
> -=09=09=09pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
> +=09=09=09pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
> +=09=09=09=09=09  aer + PCI_ERR_PREFIX_LOG,
> +=09=09=09=09=09  aer_tlp_log_len(dev, aercc),
> +=09=09=09=09=09  &info->tlp);
>  =09=09}
>  =09}
> =20
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 2b6ef7efa3c1..7933b3cedb59 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -190,7 +190,7 @@ pci_ers_result_t dpc_reset_link(struct pci_dev *pdev)
>  static void dpc_process_rp_pio_error(struct pci_dev *pdev)
>  {
>  =09u16 cap =3D pdev->dpc_cap, dpc_status, first_error;
> -=09u32 status, mask, sev, syserr, exc, log, prefix;
> +=09u32 status, mask, sev, syserr, exc, log;
>  =09struct pcie_tlp_log tlp_log;
>  =09int i;
> =20
> @@ -217,20 +217,19 @@ static void dpc_process_rp_pio_error(struct pci_dev=
 *pdev)
> =20
>  =09if (pdev->dpc_rp_log_size < 4)
>  =09=09goto clear_status;
> -=09pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG, &tlp_log=
);
> +=09pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
> +=09=09=09  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
> +=09=09=09  dpc_tlp_log_len(pdev), &tlp_log);
>  =09pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
>  =09=09tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
> +=09for (i =3D 0; i < pdev->dpc_rp_log_size - 5; i++)
> +=09=09pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.pref=
ix[i]);
> =20
>  =09if (pdev->dpc_rp_log_size < 5)
>  =09=09goto clear_status;
>  =09pci_read_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_IMPSPEC_LOG, &lo=
g);
>  =09pci_err(pdev, "RP PIO ImpSpec Log %#010x\n", log);
> =20
> -=09for (i =3D 0; i < pdev->dpc_rp_log_size - 5; i++) {
> -=09=09pci_read_config_dword(pdev,
> -=09=09=09cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG + i * 4, &prefix);
> -=09=09pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, prefix);
> -=09}
>   clear_status:
>  =09pci_write_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_STATUS, status)=
;
>  }
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 65ac7b5d8a87..0c4bf6a50d7e 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -11,26 +11,66 @@
> =20
>  #include "../pci.h"
> =20
> +/**
> + * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log len=
gth
> + * @dev: PCIe device
> + *
> + * Return: TLP Header/Prefix Log length
> + */
> +unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc)

Hmpf, it seems I forgot to move the @aercc kerneldoc from Flit mode series=
=20
patch were it was originally added to here when I needed aercc to the
PCI_ERR_CAP_PREFIX_LOG_PRESENT check.

I'll send an update in a day or two.

> +{
> +=09return 4 + (aercc & PCI_ERR_CAP_PREFIX_LOG_PRESENT) ?
> +=09=09   dev->eetlp_prefix_max : 0;
> +}

--
 i.
--8323328-798945083-1734449811=:924--

