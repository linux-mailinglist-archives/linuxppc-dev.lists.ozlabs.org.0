Return-Path: <linuxppc-dev+bounces-8916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED96AC21D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 13:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3jHb4s8Vz2ySP;
	Fri, 23 May 2025 21:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747998907;
	cv=none; b=EIJPKwaBVCH1JMVJhT6JCXiaLVjJUc0gsUNt5aaGuHmUTjGZ5sjlRduDYNI87EKRmTX5CHnxqo8J+aB4A8Rhw3+yOX90DyZtXEVvKCXK0Zu0EshVn2QHtrZHMgc6+B/OVBdVz0RnRZ8EO0rLZZLgOaNAJpypnlFG2QHs7zHpU93hHpo1W+/4GI6KGu7S8lMCLHY672TAMQ1eUWrXaDrmcwylUo0Rd6wofEDc6CMlLM1m7K5fcfV8R1vmhd8fqzEss1UJMiBm8xb37W3dWpA8Bm6C/9PRBzROES03SyFJHijfaf/YNSj0h8w3Hv5rjClZwlqgj1lK0UZJsXPs4MxtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747998907; c=relaxed/relaxed;
	bh=wZtItW9qS2quazqIIiZgBLvxQAqkaGi/nngQ9TjqNV4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZwY25P8xpAKDXgQQvBu84NFQX23zuqpG1n8kseW7GSG5qJsSnRlsQS/oxxlgAtBT+fDrO/C6iDL7tqiHjmylt3Xl3H7/9AYgY8gTJWzrsVlfHe/z0YOkiMbvJeoluEu82jbCasblalgttuKJwVJ7BsWlN+W1TjflP33ErOnouZ2U+rrWQLfmMtUyFcS/WB+rBPm3lNeYeTQDZ077k0JYNHCirm4flufVGFSo4IuEHaQiZrVmJDvpPIRCOrKF7+qrtxZPGrJA9GD5ZVfcoTc+yuASM7jGknbcUDXu/CiK3IlNeNsL5tXs2TSxFVfKkpxftP04UZnshAWFgevAoXQHBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h09RJckG; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h09RJckG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3jHZ4zMjz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 21:15:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747998907; x=1779534907;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uLBLtxOJYDYA8ZKK3hhgGuqxa2VSzPJe0qY4w9hbLA0=;
  b=h09RJckGFm+8pxFtvLcPL7DS/reBIyjNKFCec/GsxmpVdaiYG7DJ6y1m
   Z1aEfbQbSbxrJhKEn3PvscUcikOgtYzUmj32qxaPW/qVxMOp2Se5lz5eG
   UcCcTgsGIdSvErotlotmsrLBdd1+sx+IBaQsASvAurmgyU/sPIIMT+3Pv
   7dod1u1izBmtwzmuhr0OQd36de39ZkvDxPVLImTBRp/vvpzmvuDfZXbYr
   t8t00qFi1seRNjoVFEynPHxU24+97Wy7+eghJ8Ik50kPs1IO44hKlw+L2
   Ed6sP4SHRaHQfrZ/LtKHW88iPR7Ig1Yu6zwmWM9kFFDrlIJsN62psYOdY
   Q==;
X-CSE-ConnectionGUID: vDw7JJQ1QQ2eQ4cV2OBZXw==
X-CSE-MsgGUID: /QLf68GCSMeBVxM5q5HwIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72579762"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="72579762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:15:04 -0700
X-CSE-ConnectionGUID: Vtg0ZHwRQnaaq6htq1XEYA==
X-CSE-MsgGUID: Qtk9mCUPRiWTvSmmhHzOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141165383"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:14:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 May 2025 14:14:53 +0300 (EEST)
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
Subject: Re: [PATCH v8 17/20] PCI/AER: Simplify add_error_device()
In-Reply-To: <20250522232339.1525671-18-helgaas@kernel.org>
Message-ID: <68ea56e6-f4d2-9521-9f89-e6e9246eb1b7@linux.intel.com>
References: <20250522232339.1525671-1-helgaas@kernel.org> <20250522232339.1525671-18-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1191482443-1747998893=:21466"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1191482443-1747998893=:21466
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 22 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Return -ENOSPC error early so the usual path through add_error_device() i=
s
> the straightline code.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 237741e66d28..24f0f5c55256 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -816,12 +816,15 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>   */
>  static int add_error_device(struct aer_err_info *e_info, struct pci_dev =
*dev)
>  {
> -=09if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
> -=09=09e_info->dev[e_info->error_dev_num] =3D pci_dev_get(dev);
> -=09=09e_info->error_dev_num++;
> -=09=09return 0;
> -=09}
> -=09return -ENOSPC;
> +=09int i =3D e_info->error_dev_num;
> +
> +=09if (i >=3D AER_MAX_MULTI_ERR_DEVICES)
> +=09=09return -ENOSPC;
> +
> +=09e_info->dev[i] =3D pci_dev_get(dev);
> +=09e_info->error_dev_num++;
> +
> +=09return 0;
>  }
> =20
>  /**
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1191482443-1747998893=:21466--

