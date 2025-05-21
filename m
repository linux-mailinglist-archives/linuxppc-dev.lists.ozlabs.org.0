Return-Path: <linuxppc-dev+bounces-8823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC8ABF0FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Rwf4B7Zz3c1B;
	Wed, 21 May 2025 20:09:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747822162;
	cv=none; b=g5CxY8blJkgAbxMgCOupLNZ/yVMF33oXkicRMPt/yhpQbkismu6Gw+O+F0/brtJgM5pKXtG82CK3sylWuQ5k8pLGzF4nHW/MN/BVyIrnkm9DRotKdtQf1VFmFytuj/bqdN6jophTaOsEL2Tr6zifL6nwsBnSjaK0D3QgRHWvY6GasdKxqy92tP5CBpvbbOaSftkEYm++moBqnRiapuDTh18zVJESYqaaq7k5x4l4sbQyL35MZyTLZKDh/tf9EP8Srmzf8qCb3GSIiKUd7u6jTrSGrHit077iZiLHqEcsS7WENsXneSthtxkVZgH/RqN/EY5HKlKu5KJrvOaujRAOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747822162; c=relaxed/relaxed;
	bh=9AdkrCqinL9WX3CYlKsm+bH58Zc/2jBoQHEeqMyf9CM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KgQ41pF7or10JZOYPKpTTvsZhmuQIQjkajXo8Y+NnreV/si3V3QcaRtTvTtdjigjgu8cdY+vYSON7ZmCD0kHc/VRiXNHc5KmyMK9i53kkmuWEPkD3ZCfTXEgT3eTb0uWMnMbt+r530AsLFq0fTwcaq3CI8Xam9462KK6ORdG+vDSdS76+qSnTJ69F5LOFSvbFNgijoZen+ohr8KdmlguKt1qZF4jqlCT6vtFKE8CNhdWdt4nrQceiMxcJLGfWFZkM1d7lr2PX0bsBdU1ebg0zYgAINnj8+5Pldx3UId0jU7H3oI4LDgXzT+g76fJjQioO1Q5G9KPjtgRuJ8vKjeEOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vm7zU110; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vm7zU110;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Rwd4L01z3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:09:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747822162; x=1779358162;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GJtjHLwbxetCaPY6Nh168eeCsJmjGpcxn+Lhe8fiWAE=;
  b=Vm7zU110boPQ8ZdeMmUeKcZsupzrXdtVFge7WOqZWmayAVouXR+Lbhr2
   JsypjaSYhivNMUP0j7kS2CWVe1N7C5vqjDLRhqH76c7HiF9OeyGXWyj4o
   ZGeCqbEc9S4X55ZuCMovipbXytwy/9lzULDFGHkv94FaqLu38c33PxTY6
   SfgzavEXmksLm65UOJnXXm2VHktRJRHihWknqz6LeMpcdsATpWvKTBgS6
   FIjQDANvqAJ8kHLPSh82kNW7EBL4zaosB3GexuTCiyy0Qa4L7a/48y461
   rePkYWiczEbaIZB0qEJfxbZFun7A5WwGgahD5qfR/vLtJZQiXzbRBjfAr
   g==;
X-CSE-ConnectionGUID: bnuO33fBTAW3cb7pdbPfdg==
X-CSE-MsgGUID: X6F7biMOQKi5dvXPLvcwpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67206357"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="67206357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:09:18 -0700
X-CSE-ConnectionGUID: Kxou+FeYTkafmcT1p1KDGQ==
X-CSE-MsgGUID: lFkPEBM2QBigZhWKqGkOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="143993372"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:09:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 13:09:07 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Weinan Liu <wnliu@google.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 02/17] PCI/DPC: Log Error Source ID only when valid
In-Reply-To: <20250520215047.1350603-3-helgaas@kernel.org>
Message-ID: <804a9b61-44dd-0f72-d12f-07cf14ff931b@linux.intel.com>
References: <20250520215047.1350603-1-helgaas@kernel.org> <20250520215047.1350603-3-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1798336978-1747822147=:946"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1798336978-1747822147=:946
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> DPC Error Source ID is only valid when the DPC Trigger Reason indicates
> that DPC was triggered due to reception of an ERR_NONFATAL or ERR_FATAL
> Message (PCIe r6.0, sec 7.9.14.5).
>=20
> When DPC was triggered by ERR_NONFATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_NF=
E)
> or ERR_FATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) from a downstream device=
,
> log the Error Source ID (decoded into domain/bus/device/function).  Don't
> print the source otherwise, since it's not valid.
>=20
> For DPC trigger due to reception of ERR_NONFATAL or ERR_FATAL, the dmesg
> logging changes:
>=20
>   - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
>   - pci 0000:00:01.0: DPC: ERR_FATAL detected
>   + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL re=
ceived from 0000:02:00.0
>=20
> and when DPC triggered for other reasons, where DPC Error Source ID is
> undefined, e.g., unmasked uncorrectable error:
>=20
>   - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
>   - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
>   + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked unc=
orrectable error detected
>=20
> Previously the "containment event" message was at KERN_INFO and the
> "%s detected" message was at KERN_WARNING.  Now the single message is at
> KERN_WARNING.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
=2Eintel.com>
> ---
>  drivers/pci/pcie/dpc.c | 64 ++++++++++++++++++++++++------------------
>  1 file changed, 36 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 3daaf61c79c9..9d85f1b3b761 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -261,37 +261,45 @@ void dpc_process_error(struct pci_dev *pdev)
>  =09struct aer_err_info info =3D {};
> =20
>  =09pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> -=09pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> -
> -=09pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> -=09=09 status, source);
> =20
>  =09reason =3D status & PCI_EXP_DPC_STATUS_TRIGGER_RSN;
> -=09ext_reason =3D status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> -=09pci_warn(pdev, "%s detected\n",
> -=09=09 (reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR) ?
> -=09=09 "unmasked uncorrectable error" :
> -=09=09 (reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE) ?
> -=09=09 "ERR_NONFATAL" :
> -=09=09 (reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> -=09=09 "ERR_FATAL" :
> -=09=09 (ext_reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
> -=09=09 "RP PIO error" :
> -=09=09 (ext_reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
> -=09=09 "software trigger" :
> -=09=09 "reserved error");
> =20
> -=09/* show RP PIO error detail information */
> -=09if (pdev->dpc_rp_extensions &&
> -=09    reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
> -=09    ext_reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO)
> -=09=09dpc_process_rp_pio_error(pdev);
> -=09else if (reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
> -=09=09 dpc_get_aer_uncorrect_severity(pdev, &info) &&
> -=09=09 aer_get_device_error_info(pdev, &info)) {
> -=09=09aer_print_error(pdev, &info);
> -=09=09pci_aer_clear_nonfatal_status(pdev);
> -=09=09pci_aer_clear_fatal_status(pdev);
> +=09switch (reason) {
> +=09case PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR:
> +=09=09pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrec=
table error detected\n",
> +=09=09=09 status);
> +=09=09if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
> +=09=09    aer_get_device_error_info(pdev, &info)) {
> +=09=09=09aer_print_error(pdev, &info);
> +=09=09=09pci_aer_clear_nonfatal_status(pdev);
> +=09=09=09pci_aer_clear_fatal_status(pdev);
> +=09=09}
> +=09=09break;
> +=09case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
> +=09case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
> +=09=09pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID,
> +=09=09=09=09     &source);
> +=09=09pci_warn(pdev, "containment event, status:%#06x, %s received from =
%04x:%02x:%02x.%d\n",
> +=09=09=09 status,
> +=09=09=09 (reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> +=09=09=09=09"ERR_FATAL" : "ERR_NONFATAL",
> +=09=09=09 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
> +=09=09=09 PCI_SLOT(source), PCI_FUNC(source));
> +=09=09break;
> +=09case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
> +=09=09ext_reason =3D status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> +=09=09pci_warn(pdev, "containment event, status:%#06x: %s detected\n",
> +=09=09=09 status,
> +=09=09=09 (ext_reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
> +=09=09=09 "RP PIO error" :
> +=09=09=09 (ext_reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) =
?
> +=09=09=09 "software trigger" :
> +=09=09=09 "reserved error");
> +=09=09/* show RP PIO error detail information */
> +=09=09if (ext_reason =3D=3D PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO &&
> +=09=09    pdev->dpc_rp_extensions)
> +=09=09=09dpc_process_rp_pio_error(pdev);
> +=09=09break;
>  =09}
>  }
> =20
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1798336978-1747822147=:946--

