Return-Path: <linuxppc-dev+bounces-8825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E8ABF113
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2S0L2tjSz3c2V;
	Wed, 21 May 2025 20:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747822354;
	cv=none; b=Q09+k8BJXfpjgW5tH7WlBoiCXxcq8ElyjxABAdr9rgPBPRCYCyJvyZplFJrOtExJI/MefKmkP9GaY++6LCRKUFnIZc4m/n9W6iZESLCp0ELtskAkwfeqQSIHkgyWaUasFNTA+2suZCqOrlLoZkYT9c/S99MgNVxJYVAFnSijCq/IfrOUJQUZ9owiIbMws/EKWqw0H4h0PalYtb4+V1QFvPoM/b8vvRH7ePYmr9+N9fw6+4IZxIQdNlWo6/Bd79H1pnVQ/UCdKpEujK/9F2dBkmmk2GwFcnPgKro438miaG1dRcyB3xkNqbUexCxWDYmuobljoB9Bwzrk6zsozNlMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747822354; c=relaxed/relaxed;
	bh=shRdBmR0G5Ctfq1SoZBHToct+08esnqpM6mM/Lu9eAs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g+sT7IOpA8oIDnEJevaEHQsqWGLE/XKQswDB4gLpdzW44w5X+tkQnAd2yoFEjKEAXQDbX+AD5KTbqpNI7qR6/bMuvbEhc9RM3XH7V/OPnTuMZa0drLUe3peYiVdmg6hlF6vu0zJvYqPP8YFP8RQP3NCw0tSebiIXtgkJEBn6WrOH53jrS+JrsZAxOFsSctdecQY5rOEoPIEC4WVkQ75byjmBh/CwgPf2z3tWZlkL7rdaIGlqB2OvdpilWH396vgpJb8C4T/6lx343agrINYWoeSKGnW1R4sSMs8UfWOOBVzI4ZR0FAkPF8vSURxZtX9VP54wQwumxdYAhUd0qpSLow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crXjToLg; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crXjToLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2S0K33vPz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:12:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747822353; x=1779358353;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GnBe3IeIQt6OC2JsK7/U8UeTims0vuSmq1ePGQQjad4=;
  b=crXjToLgVLDiaBX9VLigpVsAU19NOZwsOSN9cb1hAM+f5/YYtdrNyTC+
   rk3CKDolHQdHT3wyKszXwvrt4xtEO3TpfwdxYZYfQGBnxG3Mf2lz9d5mr
   KkiEJkhNjCMZ11R6Xl47jJ4A3r85jByxriz7KxFTxuvwyET2MpwE0ibKj
   NvrWKF59Pggs22c+0u8ffEyONBijcylicTjR3bpmp3WtmpJ3hROlrJabe
   JSId8S7In5bTahyjDehjkB9CGOiLQdHIEg9Y01GYBHMEMYnw2sVIGn9EC
   nfQE42dG1wLShvJczTa3mehhY6sSZXzrX7ZvpElf5hzWK74RScILhjl5+
   A==;
X-CSE-ConnectionGUID: 6cdJaxd6T2qwUtBPBavo6g==
X-CSE-MsgGUID: RdnqSz+vTiqdFBqZRb37Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67206823"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="67206823"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:12:30 -0700
X-CSE-ConnectionGUID: zsQQroisTUWpPsUBeoW8Dw==
X-CSE-MsgGUID: 8fg1fRZIRPitzdV3wAFxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140068274"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:12:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 13:12:19 +0300 (EEST)
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
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v7 03/17] PCI/AER: Factor COR/UNCOR error handling out
 from aer_isr_one_error()
In-Reply-To: <20250520215047.1350603-4-helgaas@kernel.org>
Message-ID: <95fbe3a9-fa77-c4ef-1396-618fd6944d41@linux.intel.com>
References: <20250520215047.1350603-1-helgaas@kernel.org> <20250520215047.1350603-4-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1330325227-1747822339=:946"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1330325227-1747822339=:946
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> aer_isr_one_error() duplicates the Error Source ID logging and AER error
> processing for Correctable Errors and Uncorrectable Errors.  Factor out t=
he
> duplicated code to aer_isr_one_error_type().
>=20
> aer_isr_one_error() doesn't need the struct aer_rpc pointer, so pass it t=
he
> Root Port or RCEC pci_dev pointer instead.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..568229288ca3 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1273,17 +1273,32 @@ static inline void aer_process_err_devices(struct=
 aer_err_info *e_info)
>  }
> =20
>  /**
> - * aer_isr_one_error - consume an error detected by Root Port
> - * @rpc: pointer to the Root Port which holds an error
> + * aer_isr_one_error_type - consume a Correctable or Uncorrectable Error
> + *=09=09=09    detected by Root Port or RCEC
> + * @root: pointer to Root Port or RCEC that signaled AER interrupt
> + * @info: pointer to AER error info
> + */
> +static void aer_isr_one_error_type(struct pci_dev *root,
> +=09=09=09=09   struct aer_err_info *info)
> +{
> +=09aer_print_port_info(root, info);
> +
> +=09if (find_source_device(root, info))
> +=09=09aer_process_err_devices(info);
> +}
> +
> +/**
> + * aer_isr_one_error - consume error(s) signaled by an AER interrupt fro=
m
> + *=09=09       Root Port or RCEC
> + * @root: pointer to Root Port or RCEC that signaled AER interrupt
>   * @e_src: pointer to an error source
>   */
> -static void aer_isr_one_error(struct aer_rpc *rpc,
> +static void aer_isr_one_error(struct pci_dev *root,
>  =09=09struct aer_err_source *e_src)
>  {
> -=09struct pci_dev *pdev =3D rpc->rpd;
>  =09struct aer_err_info e_info;
> =20
> -=09pci_rootport_aer_stats_incr(pdev, e_src);
> +=09pci_rootport_aer_stats_incr(root, e_src);
> =20
>  =09/*
>  =09 * There is a possibility that both correctable error and
> @@ -1297,10 +1312,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  =09=09=09e_info.multi_error_valid =3D 1;
>  =09=09else
>  =09=09=09e_info.multi_error_valid =3D 0;
> -=09=09aer_print_port_info(pdev, &e_info);
> =20
> -=09=09if (find_source_device(pdev, &e_info))
> -=09=09=09aer_process_err_devices(&e_info);
> +=09=09aer_isr_one_error_type(root, &e_info);
>  =09}
> =20
>  =09if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> @@ -1316,10 +1329,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  =09=09else
>  =09=09=09e_info.multi_error_valid =3D 0;
> =20
> -=09=09aer_print_port_info(pdev, &e_info);
> -
> -=09=09if (find_source_device(pdev, &e_info))
> -=09=09=09aer_process_err_devices(&e_info);
> +=09=09aer_isr_one_error_type(root, &e_info);
>  =09}
>  }
> =20
> @@ -1340,7 +1350,7 @@ static irqreturn_t aer_isr(int irq, void *context)
>  =09=09return IRQ_NONE;
> =20
>  =09while (kfifo_get(&rpc->aer_fifo, &e_src))
> -=09=09aer_isr_one_error(rpc, &e_src);
> +=09=09aer_isr_one_error(rpc->rpd, &e_src);
>  =09return IRQ_HANDLED;
>  }
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1330325227-1747822339=:946--

