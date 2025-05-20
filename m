Return-Path: <linuxppc-dev+bounces-8726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD7ABD512
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rWL6Rb2z30gY;
	Tue, 20 May 2025 20:33:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737230;
	cv=none; b=hEVp9mIvVdHw55W9CUAUNJup/UjoR9uswFc6MMDmlqaKoV+6OKSomnz9n0wT9TOcQi+04O9o2o5HXFYniZnnou9Sn1tbgGkHie90wGHmoKI3CkZuJ/xzYkM0OzOpvkouW8oVLF/BeqpSLJeBhEg3cIW8DD/OljZVza//e1Jg6XBRhjB06Aipkt+Bvc/JTzz2BgH9RR2HN8idPHoXwQ4+/YR7nK9gV0ebWZbzPhs0ZvRsZeSVuZC8yNlXplrJkGnDjVDC2isQn98Ognn0lV9+UYIBlxmnFgDrFFVvioNpTE0JjTzlruk685octWXp+PZoFZKA8QtPuRQqgHYUtb+zHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737230; c=relaxed/relaxed;
	bh=TvAxHig1MUpN42okvVgFu8Vf1/8p/JlU2E7+AaTFA6M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jMAGrGx4mlL2l6eq6fbE9iO5Gp4e/6pphDIWV2I9WRb+VTodOS/OzBKHpQsrgsWRO3C5fzRhXIDR+jZTGoTlvzU6Tss1MklJQLC+1pBopZ7JVRM74wX0I2mCnIzKbtw7WoZHpeX/sUtidOPPW2Gu475zw5sIrw31QupAd7JfqWY7y0mRE8U1fjtT73OCT6d9tvf1tC/UjDuqfFI8ooDIYsu/qCr5pkzzyHcwZmTRG7bHe2JYT6A+GD2IhtSy3TvLJpkBhIv5a4HPuAEx1C/MCOa98Jjyi2VM0N4fFliIHyfdAJV5yJexOrqegPxBMsUNBstfYp0JZ70PXOU/GHaeng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MzPEaaxd; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MzPEaaxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 20 May 2025 20:33:49 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rWK73lRz30g6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:33:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737230; x=1779273230;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jSrPTsUdiYGaIXTDtmHfRKOVo6dm+izWDCI+NqHxcFQ=;
  b=MzPEaaxdw+9ynzP3NofvcSpQUELn/tPOHb8QEvG14HK9FBX/ajdlzIjD
   8rFOO/+nsGUK5o9oOGmW0lNog8c5JUXwXcZ0+cZJsGvD0OpwNYtSmkoyA
   VpZXL1udDV8lKhW8HM6UbOpI9gdw/X6qMlV8H6ZEeIDU0y38jz755Jc1D
   Yv0/UaU9rC7KX7wpTDfQt50OvrGrxl7Wm9MdH6ODb9megZ7iNpzycGT/w
   EZlk5cCvjDYF1cWl5WuNYe5LyO1masFca/NSbMoZvtczxYAhEQc20RcHT
   gJR4/RAuj+m00yNltt3asxs4oChlqGheHYk8odP+OZ5ivX1kdnPYJ/ILl
   A==;
X-CSE-ConnectionGUID: hZo352T2QA2osCwYVXDsTw==
X-CSE-MsgGUID: aIQeaKbUQvG9jma5zr51RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48917719"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48917719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:32:43 -0700
X-CSE-ConnectionGUID: /yTSjeFFQ7iKO4HR0N18Dw==
X-CSE-MsgGUID: d0Ajj8wcR9+ZmqYffBY8BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="162956622"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:32:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:32:32 +0300 (EEST)
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
Subject: Re: [PATCH v6 04/16] PCI/AER: Extract bus/dev/fn in aer_print_port_info()
 with PCI_BUS_NUM(), etc
In-Reply-To: <20250519213603.1257897-5-helgaas@kernel.org>
Message-ID: <cf21c493-7430-fbbe-54c0-77305f5af14b@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-5-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-699488453-1747737152=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-699488453-1747737152=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Use PCI_BUS_NUM(), PCI_SLOT(), PCI_FUNC() to extract the bus number,
> device, and function number directly from the Error Source ID.  There's n=
o
> need to shift and mask it explicitly.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index b8494ccd935b..dc8a50e0a2b7 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -736,14 +736,13 @@ void aer_print_error(struct pci_dev *dev, struct ae=
r_err_info *info)
>  static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info=
 *info,
>  =09=09=09=09const char *details)
>  {
> -=09u8 bus =3D info->id >> 8;
> -=09u8 devfn =3D info->id & 0xff;
> +=09u16 source =3D info->id;
> =20
>  =09pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n=
",
>  =09=09 info->multi_error_valid ? "Multiple " : "",
>  =09=09 aer_error_severity_string[info->severity],
> -=09=09 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> -=09=09 PCI_FUNC(devfn), details);
> +=09=09 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
> +=09=09 PCI_SLOT(source), PCI_FUNC(source), details);
>  }
> =20
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-699488453-1747737152=:936--

