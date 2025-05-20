Return-Path: <linuxppc-dev+bounces-8724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3330ABD4F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rTM3PJvz2yxN;
	Tue, 20 May 2025 20:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737127;
	cv=none; b=Yfz+q4jIUU4VfxBgZnpJnsvBam8T1/vlWnNhLd+qHcomqPWDrkuQyWaatdxRumyJZ2oOr5VMm7fx831dH1iRSaAVlnhe6HNQT/QuXmRnnlN+BxuDNWq7+FodmbEvj6KzwtGx6oNg1R57qKCcHQCHA8z4UKT4wThmfMfvuDuaC9z7djXfviuiEHOodvcH7iPaj6OcxkSRmO86QtUAQ3btL5yCr8GiSq3fwEUsbYwsWStGmXXaPgJKjy0EgHui0jU4kOTqdj78bECiVNn60YXbnkoJ6u4vfu3DZ4qbLjiTo3VC9ijD1+YN05Re41HR7T0BYGvsMyxZen6zy8vVbAzESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737127; c=relaxed/relaxed;
	bh=XkFkvbd+Yl+RMd3KRO+x6D3m+67/5eRrs3F3e9oMnf4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Xb/OpvW5tCNRmVNf17IJPoK3O6hlXWY6CBjRlFJaYQgQR8p4YJ9vSg5wGkf8QVWPJ6+9b8s353Jk6vsB43l7rjzQ4cHLMRAxk+SqOIgbYsInHTIlLpVxQaJSFCwVz586Jp45QvIg2h9VPwQmIMorXm6QYuyrJQmygiRyIod5UOCgO57eoscu+MCWjrDhNZkBu7UPoXW5CIiJqkeUDheTgqF0NrJjL40AIylAqQ3i0uebl6yzbNnYDBRNajLNeCzkf9ZkmQpJs7nvUMXfDY7jpbDFG+4GN5DyxhsK225wzceTwhwhuiA36GP+ghABTyd8nqHp/U6OSjKXv+n+/E5yRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EWNtMlxa; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EWNtMlxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rTL0mDGz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:32:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737126; x=1779273126;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TJRyDHxczC9IA4djKmSUESAGNZkcmiHKFFh7fx72gCo=;
  b=EWNtMlxaRdSHYjSG1xH3GXGq7lfm/guxpBhW6Reaof/Ta4oFSqCm1f4B
   CDAmOt6TiNeGU4gsvF5NkV2OGsipbyjeV5Dcj0ijWpvXYmwUnvQv5UdDw
   CLAnMcLlRSIxu25Qjcka7+wxqx/SdZAqEyTGnO+MK5JCaXrw2zedj7tSZ
   NQIl8kcsnouVkxlSR/73np7ZpCK4eKRO8F/LwUrWoNT+FErI5NrKaRlGt
   omwdRvm7KvlGA0TcoTeeWSzUjiLMSYQVmZr2+S4dP/qFgLAjCJgdnUD/D
   tuMVG/hsIqRd4xDIvwDaOS9xM2Pw1KcNThNHUiUhy/H5N+Mpdt9a7hFIV
   g==;
X-CSE-ConnectionGUID: IYlIlm58TNC41rBKeHrfdQ==
X-CSE-MsgGUID: L1xzFF/KT1amlmgAcYnSRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72175968"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72175968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:31:52 -0700
X-CSE-ConnectionGUID: Y6hkVwn/RruBDe+ob+/vDw==
X-CSE-MsgGUID: GLIdw7GwQ7KGkOWZuroKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140067264"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:31:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:31:41 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
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
Subject: Re: [PATCH v6 03/16] PCI/AER: Consolidate Error Source ID logging
 in aer_print_port_info()
In-Reply-To: <20250519213603.1257897-4-helgaas@kernel.org>
Message-ID: <fe9d879f-a908-e794-03ff-6ac4526c674a@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-4-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-651407544-1747737101=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-651407544-1747737101=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously we decoded the AER Error Source ID in two places.  Consolidate
> them so both places use aer_print_port_info().  Add a "details" parameter
> so we can add a note when we didn't find any downstream devices with erro=
rs
> logged in their AER Capability.
>=20
> When we didn't read any error details from the source device, we logged t=
wo
> messages: one in aer_isr_one_error() and another in find_source_device().
> Since they both contain the same information, only log the first one when
> when find_source_device() has found error details.
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
>  drivers/pci/pcie/aer.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..b8494ccd935b 100644
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
> @@ -926,13 +927,13 @@ static bool find_source_device(struct pci_dev *pare=
nt,
>  =09else
>  =09=09pci_walk_bus(parent->subordinate, find_device_iter, e_info);
> =20
> +=09/*
> +=09 * If we didn't find any devices with errors logged in the AER
> +=09 * Capability, just print the Error Source ID from the Root Port or
> +=09 * RCEC that received an ERR_* Message.
> +=09 */
>  =09if (!e_info->error_dev_num) {
> -=09=09u8 bus =3D e_info->id >> 8;
> -=09=09u8 devfn =3D e_info->id & 0xff;
> -
> -=09=09pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> -=09=09=09 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> -=09=09=09 PCI_FUNC(devfn));
> +=09=09aer_print_port_info(parent, e_info, " (no details found)");
>  =09=09return false;
>  =09}
>  =09return true;
> @@ -1297,10 +1298,11 @@ static void aer_isr_one_error(struct aer_rpc *rpc=
,
>  =09=09=09e_info.multi_error_valid =3D 1;
>  =09=09else
>  =09=09=09e_info.multi_error_valid =3D 0;
> -=09=09aer_print_port_info(pdev, &e_info);
> =20
> -=09=09if (find_source_device(pdev, &e_info))
> +=09=09if (find_source_device(pdev, &e_info)) {
> +=09=09=09aer_print_port_info(pdev, &e_info, "");
>  =09=09=09aer_process_err_devices(&e_info);
> +=09=09}
>  =09}
> =20
>  =09if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> @@ -1316,10 +1318,10 @@ static void aer_isr_one_error(struct aer_rpc *rpc=
,
>  =09=09else
>  =09=09=09e_info.multi_error_valid =3D 0;
> =20
> -=09=09aer_print_port_info(pdev, &e_info);
> -
> -=09=09if (find_source_device(pdev, &e_info))
> +=09=09if (find_source_device(pdev, &e_info)) {
> +=09=09=09aer_print_port_info(pdev, &e_info, "");
>  =09=09=09aer_process_err_devices(&e_info);
> +=09=09}
>  =09}
>  }
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-651407544-1747737101=:936--

