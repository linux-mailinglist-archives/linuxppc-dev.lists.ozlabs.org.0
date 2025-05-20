Return-Path: <linuxppc-dev+bounces-8744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF58ABD701
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:37:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sx82Vgrz3bp0;
	Tue, 20 May 2025 21:37:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747741068;
	cv=none; b=m60IStgf0PhK900HNlA/hAMSB+CzvOHsbyWXJyZezaJY1qUMhJPSbpBRRJXGKzK52Feu891YW8pcWKhBqYaBMY/PUe6XD3AI18R6B9uuo0EAKpwikANSLV7n4V71exVB3QwRYXdVt04c6OLX1djKwdj7qDlU/+sICdLCzHSFCwBHKcSwsUPom+WBC9Euu2zdt1Pwgaf2YRRL5taaZQegrmgoq0yAb22Orr/0zMm2xTXnKk413n8+aOq0QY9994LwiQlNWhffOuMjtcvxuFT14Pczai7v8Butw2K3e8FUiyxBQb9AWxoEQ/vKfn+m0f2iyScWbou5NhdlNJLN8JrfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747741068; c=relaxed/relaxed;
	bh=LmLdTKxoySLAPeevVgRsrREe5gbYfob1zQkbGiGURXA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iNWkxgGliIWOOe70pEz0Bhoruk9NZIIzsQewL5L1s0FHNM8M7FFh8e/3lizipVAUkRmvQMImUN1O/RH1/I2Jy55Hneu8QlN4DFl0k8vkxd2gy/w6aNiTyKc0ozJ0HiHzj1jWW/kd4LYypnxfXG//MVBSbY5recJ5/3StPoIYezcBA5Pu2pq2TU4dJmC+oHRACVFXMkZ95wmdfd6bh8VZsvLLE4ht5LvkUzPFh1fY5AO3RuLbscN485mt3iOFM9MUNN0tzGhCk24DbFMbG6EUHe+bQr8WN5kD+iCSVCjc7RLgIyBvSK1jQFLIsZ/5n3DPexArxBKnODNStmlC6q0ZdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+4Ipt7r; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+4Ipt7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1sx66zt3z3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747741067; x=1779277067;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JZT3t/IlAfusfoWxhMUxTHePqNlUTlsw8BDpHV7BHRY=;
  b=j+4Ipt7rQ1zRnJzBgOBY6PEEjbTTy408kSwZIEqsw8CbNUF6x8EW3Ei7
   f5zfL3g3QNYC+ODM0zxPB6IbHobmcL1KRIBjm5BN//KfgMKOm5lnWTfFI
   ++DFaONLqVnjDPAlbnXfo8v7dlem5TKOTWC49lqo1llFql6YEeAn2eG8F
   329sK/JRLWPrKMWBWW/Qy9JsSLzVyaCA6GtF0i7zyES6AEHjZU2aqWNAJ
   A6whOE7zLWGhLTvUVBWQoxKXh92PwFqH5BQ23eh36HHzjbuKUfaGU7LJS
   KUY+FRN9YKbFroM+64H39qN4A8gjuvfZH4dokhNB02hXKeYtkWR3jFLy8
   A==;
X-CSE-ConnectionGUID: cqDNgmYqT6GbbS1dHkCovQ==
X-CSE-MsgGUID: Wqt5OD8WQaavWXyNkc+flA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49806353"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49806353"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:37:43 -0700
X-CSE-ConnectionGUID: ic4X7e+rTxqBQ4TxyRlWEg==
X-CSE-MsgGUID: 8feM2N1HTdic6OGIJoZD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140201921"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:37:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 14:37:33 +0300 (EEST)
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
Subject: Re: [PATCH v6 12/16] PCI/AER: Make all pci_print_aer() log levels
 depend on error type
In-Reply-To: <20250519213603.1257897-13-helgaas@kernel.org>
Message-ID: <921fea13-9a28-9dc6-90c3-48498626f317@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-13-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1883428364-1747741053=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1883428364-1747741053=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Karolina Stolarek <karolina.stolarek@oracle.com>
>=20
> Some existing logs in pci_print_aer() log with error severity by default.
> Convert them to depend on error type (consistent with rest of AER logging=
).
>=20
> Link: https://lore.kernel.org/r/20250321015806.954866-3-pandoh@google.com
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 73b03a195b14..06a7dda20846 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -788,15 +788,21 @@ void pci_print_aer(struct pci_dev *dev, int aer_sev=
erity,
>  =09layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
>  =09agent =3D AER_GET_AGENT(aer_severity, status);
> =20
> -=09pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> +=09aer_printk(info.level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +=09=09   status, mask);
>  =09__aer_print_error(dev, &info);
> -=09pci_err(dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> -=09=09aer_error_layer[layer], aer_agent_string[agent]);
> +=09aer_printk(info.level, dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> +=09=09   aer_error_layer[layer], aer_agent_string[agent]);
> =20
>  =09if (aer_severity !=3D AER_CORRECTABLE)
> -=09=09pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> -=09=09=09aer->uncor_severity);
> +=09=09aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
> +=09=09=09   aer->uncor_severity);
> =20
> +=09/*
> +=09 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
> +=09 * tlp_header_valid is set, and info.level is always KERN_ERR in
> +=09 * that case.
> +=09 */
>  =09if (tlp_header_valid)
>  =09=09pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));

There's another similar callsite but only this has the comment added. I=20
was thinking if this call could be made from __aer_print_error(). There=20
would be small change in order of messages but I can't seem to decide if=20
it would be bad/good.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


>  }
>=20

--=20
 i.

--8323328-1883428364-1747741053=:936--

