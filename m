Return-Path: <linuxppc-dev+bounces-8826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D341ABF129
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2S3240MKz3c2H;
	Wed, 21 May 2025 20:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747822494;
	cv=none; b=Z9I8trTzKmvU7aDiNGSDawuXCM0ZjigqpKftPgfeqWpYskXsplHHtarPjBTYMVucUzd169FQDjQODcTv2B9/5k6/q2SMB4b/ETE+7iWjFPNEiP744HKV3ilqNBoTgOPNn4pJBu21g0Pv9fw4Tlli81gIRSwV0oe/V3vWtjCdQTB02t0dJndbZ5m6thMzG/smujtIHV93SHtcsBN0ckVoncfrGYrdF82MuRkK6TPZMMUUhDajdzkkN4k9sfLAHglkPGAO5/dMoolFsAJmHC1WBV5Od9ma1RVqJuFOaFkfdibjjvyxYwid/4tW8zBFdkjPs7sB7ByFArbzHedSjO3O5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747822494; c=relaxed/relaxed;
	bh=4KH0M1zk96AfSUieJk/mJw1hnwmgGd7DEEbc5nieQ/w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=galGBg+dzv3u3yL+N9f9BmKAXvvQejDoNqRhNdk9VmBjVmGYL4+SXI4N68lVjoZDf337FMkxwmZio9dvjZnK940lQB14YU5hUYXDbZrUcNb3gBGfUmgkek5OIotMWdolcrXD56ZdbWJx1BJvCzngaVoSiL9D0yc+KTXyFK5QxPIKbBlZnLCT80B+OzRjYpF7acLEe/QeS2WdhdBopxt0ZB8912PSNIOkRbXzKUKhdWgvecEbsk7tXnfA9Oza0tWwDfsjp6jeeOyc5DWM1TGYJfiouHsR5N74vH2XStr71bW/VqYVq/Aqjbl2tPICq4z3IIxNiHbg+Ry7zGcsagcn/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+bLOWKU; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+bLOWKU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2S313nKtz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:14:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747822494; x=1779358494;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uekFzqz99LLjLHspdti1ivZB7yPyONTYgHYGnDu/3bU=;
  b=H+bLOWKUnxF+kf1ab+ZCDytLHxgXHJ7iV+46JXsAzWGJzB74OiDazbHH
   x2lkiPHibRXAPF1WeNiuqdNVnLLhMg/wf5q/c+0evOGozdNsjZD1/qMd8
   ZD9BAXDe9Tf/QOo/TjiRgbflDkpZ5LA63uulAe9Ul6HA8q/1ivxAnu5tE
   AFSXTxgjkos4/j/4qTyIPCWViZmKEW9ut4h/p6j4BMzJKCxNKBXyX3NZf
   qAHuChK01ewDAjrr8VSZsGFmBObA5/6rXz1N0w7S0fxcp/HembHC3XyfH
   Fs3L9bC+I7UAU30xSTpyd6NkmqPmY2Y4CKVibjGjQWNrJ1r5qReHrLHqZ
   g==;
X-CSE-ConnectionGUID: qNuagdVfTUW5q67xE9WR2Q==
X-CSE-MsgGUID: mzZOAdbeT7qracG0wpXFtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53457033"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53457033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:14:51 -0700
X-CSE-ConnectionGUID: Sryv4vM8T8e2lM82CkAKLw==
X-CSE-MsgGUID: Lc+DeZb6Rtq4K8oH+oXTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144735805"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:14:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 13:14:38 +0300 (EEST)
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
Subject: Re: [PATCH v7 04/17] PCI/AER: Consolidate Error Source ID logging
 in aer_isr_one_error_type()
In-Reply-To: <20250520215047.1350603-5-helgaas@kernel.org>
Message-ID: <e2e1c971-b85d-bef9-7d9b-e4126a9a9e77@linux.intel.com>
References: <20250520215047.1350603-1-helgaas@kernel.org> <20250520215047.1350603-5-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-520110086-1747822478=:946"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-520110086-1747822478=:946
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously we decoded the AER Error Source ID in aer_isr_one_error_type()=
,
> then again in find_source_device() if we didn't find any devices with
> errors logged in their AER Capabilities.
>=20
> Consolidate this so we only decode and log the Error Source ID once in
> aer_isr_one_error_type().  Add a "details" parameter so we can add a note
> when we didn't find any downstream devices with errors logged in their AE=
R
> Capability.
>=20
> This changes the dmesg logging when we found no devices with errors logge=
d:
>=20
>   - pci 0000:00:01.0: AER: Correctable error message received from 0000:0=
2:00.0
>   - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
>   + pci 0000:00:01.0: AER: Correctable error message received from 0000:0=
2:00.0 (no details found)
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 568229288ca3..488a6408c7a8 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -733,16 +733,17 @@ void aer_print_error(struct pci_dev *dev, struct ae=
r_err_info *info)
>  =09=09=09info->severity, info->tlp_header_valid, &info->tlp);
>  }
> =20
> -static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info=
 *info)
> +static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info=
 *info,
> +=09=09=09=09const char *details)
>  {
>  =09u8 bus =3D info->id >> 8;
>  =09u8 devfn =3D info->id & 0xff;
> =20
> -=09pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
> +=09pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n=
",
>  =09=09 info->multi_error_valid ? "Multiple " : "",
>  =09=09 aer_error_severity_string[info->severity],
>  =09=09 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> -=09=09 PCI_FUNC(devfn));
> +=09=09 PCI_FUNC(devfn), details);
>  }
> =20
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -926,15 +927,8 @@ static bool find_source_device(struct pci_dev *paren=
t,
>  =09else
>  =09=09pci_walk_bus(parent->subordinate, find_device_iter, e_info);
> =20
> -=09if (!e_info->error_dev_num) {
> -=09=09u8 bus =3D e_info->id >> 8;
> -=09=09u8 devfn =3D e_info->id & 0xff;
> -
> -=09=09pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> -=09=09=09 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> -=09=09=09 PCI_FUNC(devfn));
> +=09if (!e_info->error_dev_num)
>  =09=09return false;
> -=09}
>  =09return true;
>  }
> =20
> @@ -1281,9 +1275,11 @@ static inline void aer_process_err_devices(struct =
aer_err_info *e_info)
>  static void aer_isr_one_error_type(struct pci_dev *root,
>  =09=09=09=09   struct aer_err_info *info)
>  {
> -=09aer_print_port_info(root, info);
> +=09bool found;
> =20
> -=09if (find_source_device(root, info))
> +=09found =3D find_source_device(root, info);
> +=09aer_print_port_info(root, info, found ? "" : " (no details found");
> +=09if (found)
>  =09=09aer_process_err_devices(info);
>  }
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-520110086-1747822478=:946--

