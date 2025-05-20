Return-Path: <linuxppc-dev+bounces-8727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB745ABD51E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:35:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rXt5PJ9z2xHZ;
	Tue, 20 May 2025 20:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737310;
	cv=none; b=mTHZZm2Uyz+7pSoJTwkwRWLn+69A2vb/PthONoIL4huZp8WImr2L/tm/w4Lrf1aFXi3UGGlKwm5/mfsxIUiLddywC48rnzWSu0bGNemY8PMaNjYdzvZ5txWHV1eFMac5sqzVnr8vSn/073JdsJ0UCyI6JAdiU/dhn1mB+kczznixilBNXkDDtIu1eMAk1qsTM+Ju1dwv9SZ3OFO8W2Z+pUioUaOfL+HXs2DlRUssprnaehXB3yXc2R4L1rcJ0RTihixgrjPqJC0CVaPMzyen4J/D1M9WbodO/nsSso10ilx7WG96WqIkw1HZzvg6V7lV9V3oj0cZM/2YG+jPUpsRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737310; c=relaxed/relaxed;
	bh=2kAOG7dleUdw+YvBjz6Xb/4pVkL2zx0+4xAe2V2OVz4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=japmFkQ1Q8SHZeChkVgKAAdK1HVIzLn7gm7Yic7Xo8wR6grB+sKW/KS78JsJ+nLr7nY/+gKniDeT9fwAzgsb2pJD/ugKBu5JUlGfkGbQbUyXFZiiu2o5CPMibTsMWiZX36t1ufEY8Sp8uskJOWsta60X7CiiyDCOQ9X207FEhdop+rq3CqP5dih2AB4AdOo8zArrJcfxnxUhp8n/YtEusym1FAs9RGdyQxW9QpfNK7y9JHalbv3PrpkvhKQbxt+ENNP54d7nirFgyXfohxqWGDr2KAj4FF+w3jv+XeTsLtvNDZLKqsh5PThcfuiPvs5xZVwsDIex7PS2XdVCVcPauQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F0E1RIM4; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F0E1RIM4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rXs67t2z2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:35:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737310; x=1779273310;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ke+1+In4r/rZjrgzMhjI2/H/glCpSsOix+X86F/MPGU=;
  b=F0E1RIM4GCORRx25Xqrdhl3CDtkhv8VwCk8JEOxhHMgDyXFxMUcAnpZ8
   ZbcKkDJC1+OtDl2OdqP7W8GqMCAUBngmrurJl+3+XRMGqw5+DVNDlTzy3
   4pLnkc9fH4/DQYFH33VW5zMEZ4YPeryZJpcS8rOq+4RCn2eIiMEgLKZLt
   Ou9Mvm6KHZa4BZ6JF7sgKNbq3WAeo3PMVFslSq0pksSAU6HP88tdKycn3
   3HAL0ZFBYcSz4XKacbCQ1RCrJA5qJ8M0fdeTfDu66jlg4o4wkIuot5c7/
   4pXxV7C+96ZNkKGo+5w4Q99Pr1dA6oDjCbmJXlYa6pRqp5HeG1dX44Pey
   A==;
X-CSE-ConnectionGUID: IlPu/zykTWmTEuk4upyuWQ==
X-CSE-MsgGUID: 7ZmcfLjRS7qThm4erN9SxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48918112"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48918112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:35:08 -0700
X-CSE-ConnectionGUID: Z8NjBDTwQTerJuTOWjg9ag==
X-CSE-MsgGUID: x7Ah4STFRAiD7xKkEQKxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139555983"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:35:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:34:56 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 06/16] PCI/AER: Move aer_print_source() earlier in
 file
In-Reply-To: <20250519213603.1257897-7-helgaas@kernel.org>
Message-ID: <8b8fdf6d-d4b2-b15e-541d-f8e90b72923f@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-7-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-265372137-1747737296=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-265372137-1747737296=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Move aer_print_source() earlier in the file so a future change can use it
> from aer_print_error(), where it's easier to rate limit it.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index eb42d50b2def..95a4cab1d517 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -696,6 +696,18 @@ static void __aer_print_error(struct pci_dev *dev,
>  =09pci_dev_aer_stats_incr(dev, info);
>  }
> =20
> +static void aer_print_source(struct pci_dev *dev, struct aer_err_info *i=
nfo,
> +=09=09=09     const char *details)
> +{
> +=09u16 source =3D info->id;
> +
> +=09pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n=
",
> +=09=09 info->multi_error_valid ? "Multiple " : "",
> +=09=09 aer_error_severity_string[info->severity],
> +=09=09 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
> +=09=09 PCI_SLOT(source), PCI_FUNC(source), details);
> +}
> +
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  {
>  =09int layer, agent;
> @@ -733,18 +745,6 @@ void aer_print_error(struct pci_dev *dev, struct aer=
_err_info *info)
>  =09=09=09info->severity, info->tlp_header_valid, &info->tlp);
>  }
> =20
> -static void aer_print_source(struct pci_dev *dev, struct aer_err_info *i=
nfo,
> -=09=09=09     const char *details)
> -{
> -=09u16 source =3D info->id;
> -
> -=09pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n=
",
> -=09=09 info->multi_error_valid ? "Multiple " : "",
> -=09=09 aer_error_severity_string[info->severity],
> -=09=09 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
> -=09=09 PCI_SLOT(source), PCI_FUNC(source), details);
> -}
> -
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
>  int cper_severity_to_aer(int cper_severity)
>  {
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-265372137-1747737296=:936--

