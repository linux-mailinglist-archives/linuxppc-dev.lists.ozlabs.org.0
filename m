Return-Path: <linuxppc-dev+bounces-8731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADADABD5C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sCC4BC6z3bjc;
	Tue, 20 May 2025 21:04:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747739095;
	cv=none; b=XJH0SV0KCzyl9khtazj+WH2wHB7hk7UOkpiX1kroXIm7uwFRB+7qXJTX4OswsBjdh+/KTAHHIX3Wzt/CIzhITVEt4R3jibG2U9Haxk2WidwBnfamWuXeTTsopMTeI/b0zs+7kUUZZ693pyVExsRtdQJfT/ElLQFPJqTbMcqOZ76pofoVtDLr1YztUGPvwWKYlUcKMpAItET/eL15RRKbeM2WXDX7Davzn2FpjAzUnk6YtJxK6H6YPAEk2Lx4sREoVDEI580UiMDd3QSb09U10jqrIwfkmA8U1P8uTAceUOHP38Z+Lkb42H7ZyIYN0Y8mGZxxfuB851lDv7JwxUCVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747739095; c=relaxed/relaxed;
	bh=j6nHyq+eP3R5s/RgSuPvKu2lYkEUakxLWxry+SU7JWk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NTC8hHjh39O1YKANKfOB+ZVhJKClq08RtYoyoqgspRIYhGjq6B4pv9kQngnm47iIJGM9MU390ebCxqtp00deen/EXgjd4ou7sYSiwVHBzWRTsSx5XmYv5u90sGTc/OtLKsAFsxj+QFEAPD5iXU8Cx9Bcl2DPpwhC+6qtkwdpZ2zQmRFbm2Xt5M7H9XJYuOhRj5621aLSnJqycgkpXgThoBl8A7rQL27K+gW1+ael7xHw7wBDNFhYdPzoRHi1dH30xVi+MIRA7YQs1FcP9OxJX+ek1oYb/gYmV1QNTYwGBEeLJ3E1VIhQ8amfaDNqLDQ2QT+XiiRNen/lpmt5aq9lqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iKaABZIY; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iKaABZIY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1sC85yZPz30g6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:04:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747739093; x=1779275093;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2q3Euz3gWXew0Lix6LkM48KWDqKNDLqiRhgOnRlDonc=;
  b=iKaABZIYOg/uay4LPsKeUe68HJAgPal1DK1+dmshl/7QP9Rp0WhtmxYo
   wOuk6UxNmhvGG6h8sF3DBBw3yPOKXgzxV6k+QUh0gzVRtHgq7C+rO1uve
   2pySzkLnMc4F/HfD3lx4zIYz5FfdlXWqjBHuoFHSW6J585c/NFFQMp/2t
   kttKBQpPZMvxsoueXw6r4ByoKqlk14i9T/75PQFzV5iCWUzA5jlvOQLyT
   QLm6frLFkFYCcVJSfxuJ3rvz8dvVBSRQumjjCHLRLJOQ81MpFT/9NXKSm
   m+AwlD2EWj98WjSyrZwCsRlAq7GXMObWWkUh522McZOrNmqcB5dqj9NCX
   A==;
X-CSE-ConnectionGUID: br9xaXDmSXinNSRkP8Uqyw==
X-CSE-MsgGUID: XuwApMhaTF6KjjgxDRf/uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49570078"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49570078"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:04:48 -0700
X-CSE-ConnectionGUID: lsWvy+8XTtOpxXcW+r6gMA==
X-CSE-MsgGUID: zI7pvXqoT7ea0loC5Vlm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176784390"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:04:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 14:04:38 +0300 (EEST)
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
Subject: Re: [PATCH v6 09/16] PCI/AER: Update statistics early in logging
In-Reply-To: <20250519213603.1257897-10-helgaas@kernel.org>
Message-ID: <0e27ac92-0b94-43c2-1c7a-da706f60792d@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-10-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1997636967-1747739078=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1997636967-1747739078=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> There are two AER logging entry points:
>=20
>   - aer_print_error() is used by DPC (dpc_process_error()) and native AER
>     handling (aer_process_err_devices()).
>=20
>   - pci_print_aer() is used by GHES (aer_recover_work_func()) and CXL
>     (cxl_handle_rdport_errors())
>=20
> Both use __aer_print_error() to print the AER error bits.  Previously
> __aer_print_error() also incremented the AER statistics via
> pci_dev_aer_stats_incr().
>=20
> Call pci_dev_aer_stats_incr() early in the entry points instead of in
> __aer_print_error() so we update the statistics even if the actual printi=
ng
> of error bits is rate limited by a future change.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 73d618354f6a..eb80c382187d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -693,7 +693,6 @@ static void __aer_print_error(struct pci_dev *dev,
>  =09=09aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
>  =09=09=09=09info->first_error =3D=3D i ? " (First)" : "");
>  =09}
> -=09pci_dev_aer_stats_incr(dev, info);
>  }
> =20
>  static void aer_print_source(struct pci_dev *dev, struct aer_err_info *i=
nfo,
> @@ -714,6 +713,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>  =09int id =3D pci_dev_id(dev);
>  =09const char *level;
> =20
> +=09pci_dev_aer_stats_incr(dev, info);
> +
>  =09if (!info->status) {
>  =09=09pci_err(dev, "PCIe Bus Error: severity=3D%s, type=3DInaccessible, =
(Unregistered Agent ID)\n",
>  =09=09=09aer_error_severity_string[info->severity]);
> @@ -782,6 +783,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
>  =09info.status =3D status;
>  =09info.mask =3D mask;
> =20
> +=09pci_dev_aer_stats_incr(dev, &info);
> +
>  =09layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
>  =09agent =3D AER_GET_AGENT(aer_severity, status);
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1997636967-1747739078=:936--

