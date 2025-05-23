Return-Path: <linuxppc-dev+bounces-8915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA51AC21CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 13:14:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3jGV007Vz2yRn;
	Fri, 23 May 2025 21:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747998849;
	cv=none; b=YWwzSl+Uh+fXbN7I8X+tRm26/Q2b7RsaHAfM6D90g9od7dWLLXDeBdCyIMaS75XXRRg6+Ld62iBMfa+2CzkRT8OR2FYZgMNqgb1FRUIf4seC9phAQol2hpcZawXLOcTIbEtN/8GQ5SZ+Y7OIbgEvww6Q8UZAuFvSBBatPFZWxzxmY/8mEzIbXYK4chybeD2SnaKMj3oKWEKXalYU84PTrcyjcK3jrqbyWun7M1UCJKL3HbUzG74c/uA+kEnGi6htQjR/yj1hJEv2v6BXA6QKc8OimoZN06mHu9bk7DYQTHB6/O1cIdKadz0/Hitule2e9FFD4y+EgTyd+Voe9kncsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747998849; c=relaxed/relaxed;
	bh=VfMRhQMY4ALThD5RKXRpHJC5V1yyfggBPnZMnEHp2O8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RBGNXZEhIKFeZAGj9lA46a1vTa7v1/gWNtHOVdi3H0wjXZOaAsBzsualRgKrZxI+gEmPeATtx7TLBmQ0lZKZ2oYoUnJqmXni0CJ2+t4XT360Jc/mQ3nTuJkopXQyNmRflpKt7bfBOImBfjLHvm2XkDwKPrbW3b/Allh5tWcUWTm25/NicnoD19sg6O5hFdNEPrXVq6I8rlbheJka3qAr/bvbRd8o4tKanE5Vwnd2K2inkYMftlNlhRtHhWbKhb7obRMrJnTmL65PoN25246tfsEwA9FUFR5VLPV7yspN+t5mFPRsUw7Vx8k3Fz75VFI69K29U8sRfh7K1lpbif52RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WedW8apu; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WedW8apu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3jGR2kBBz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 21:14:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747998848; x=1779534848;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=awPgKAtbs09VBvJjTCS50PNvg1VAMdB8tjpi4ROCuFc=;
  b=WedW8apu0NjI0ajnD0v6wpIidyFy7tWtqkiy5ycp8EiLS7eWA4UcdYhn
   vOdK2Y6+X9H6pu915evqVRHUT2dAmVY3knyn5rPGBdq8xTY7hCALLooMC
   0Bl2CyNhLbA7UAYg2l/3XaaAfGHvxUOHwyQknYHE+K/I33uf9tx07uJfP
   FRTexYwnUwV0uHjD6myzYsjUA7aVzXJ2f5RbZsVzQ7g3jXr50caLfKKfa
   zfBk5d8EKpFcHGp2jEHLQlejUTI6jd7wU0fwOMg0/ZG7SMyHGfF5RKtw8
   VgQ/I+j9rtrFG7fv07E/rMw9J2WCmeOT1qUmQRVqkPUXhD//14DZ5Rh1k
   g==;
X-CSE-ConnectionGUID: fQjVCYD1RbWFxwF1IHVb9g==
X-CSE-MsgGUID: 0mhhMdz6TaaUIm054/Aakg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50216290"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="50216290"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:14:04 -0700
X-CSE-ConnectionGUID: kVB90jRXQLejrPr2/iMbUQ==
X-CSE-MsgGUID: Ch5Ov7+kS/aSdw6fhA38tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="142055114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:13:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 May 2025 14:13:52 +0300 (EEST)
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
Subject: Re: [PATCH v8 16/20] PCI/AER: Convert aer_get_device_error_info(),
 aer_print_error() to index
In-Reply-To: <20250522232339.1525671-17-helgaas@kernel.org>
Message-ID: <b7e7a308-713f-d89b-cccd-8f397e097bae@linux.intel.com>
References: <20250522232339.1525671-1-helgaas@kernel.org> <20250522232339.1525671-17-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-767706868-1747998832=:21466"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-767706868-1747998832=:21466
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 22 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously aer_get_device_error_info() and aer_print_error() took a point=
er
> to struct aer_err_info and a pointer to a pci_dev.  Typically the pci_dev
> was one of the elements of the aer_err_info.dev[] array (DPC was an
> exception, where the dev[] array was unused).
>=20
> Convert aer_get_device_error_info() and aer_print_error() to take an inde=
x
> into the aer_err_info.dev[] array instead.  A future patch will add
> per-device ratelimit information, so the index makes it convenient to fin=
d
> the ratelimit associated with the device.
>=20
> To accommodate DPC, set info->dev[0] to the DPC port before using these
> interfaces.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pci.h      |  4 ++--
>  drivers/pci/pcie/aer.c | 33 +++++++++++++++++++++++----------
>  drivers/pci/pcie/dpc.c |  8 ++++++--
>  3 files changed, 31 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 1a9bfc708757..e1a28215967f 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -605,8 +605,8 @@ struct aer_err_info {
>  =09struct pcie_tlp_log tlp;=09/* TLP Header */
>  };
> =20
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *=
info);
> -void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> +int aer_get_device_error_info(struct aer_err_info *info, int i);
> +void aer_print_error(struct aer_err_info *info, int i);
> =20
>  int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>  =09=09      unsigned int tlp_len, bool flit,
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 787a953fb331..237741e66d28 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -705,12 +705,18 @@ static void aer_print_source(struct pci_dev *dev, s=
truct aer_err_info *info,
>  =09=09 found ? "" : " (no details found");
>  }
> =20
> -void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> +void aer_print_error(struct aer_err_info *info, int i)
>  {
> -=09int layer, agent;
> -=09int id =3D pci_dev_id(dev);
> +=09struct pci_dev *dev;
> +=09int layer, agent, id;
>  =09const char *level =3D info->level;
> =20
> +=09if (i >=3D AER_MAX_MULTI_ERR_DEVICES)
> +=09=09return;

Are these OoB checks actually indication of a logic error in the caller=20
side which would perhaps warrant using
=09if (WARN_ON_ONCE(i >=3D AER_MAX_MULTI_ERR_DEVICES))
?

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

> +
> +=09dev =3D info->dev[i];
> +=09id =3D pci_dev_id(dev);
> +
>  =09pci_dev_aer_stats_incr(dev, info);
>  =09trace_aer_event(pci_name(dev), (info->status & ~info->mask),
>  =09=09=09info->severity, info->tlp_header_valid, &info->tlp);
> @@ -1193,19 +1199,26 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
> =20
>  /**
>   * aer_get_device_error_info - read error status from dev and store it t=
o info
> - * @dev: pointer to the device expected to have an error record
>   * @info: pointer to structure to store the error record
> + * @i: index into info->dev[]
>   *
>   * Return: 1 on success, 0 on error.
>   *
>   * Note that @info is reused among all error devices. Clear fields prope=
rly.
>   */
> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *=
info)
> +int aer_get_device_error_info(struct aer_err_info *info, int i)
>  {
> -=09int type =3D pci_pcie_type(dev);
> -=09int aer =3D dev->aer_cap;
> +=09struct pci_dev *dev;
> +=09int type, aer;
>  =09u32 aercc;
> =20
> +=09if (i >=3D AER_MAX_MULTI_ERR_DEVICES)
> +=09=09return 0;
> +
> +=09dev =3D info->dev[i];
> +=09aer =3D dev->aer_cap;
> +=09type =3D pci_pcie_type(dev);
> +
>  =09/* Must reset in this function */
>  =09info->status =3D 0;
>  =09info->tlp_header_valid =3D 0;
> @@ -1257,11 +1270,11 @@ static inline void aer_process_err_devices(struct=
 aer_err_info *e_info)
> =20
>  =09/* Report all before handling them, to not lose records by reset etc.=
 */
>  =09for (i =3D 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -=09=09if (aer_get_device_error_info(e_info->dev[i], e_info))
> -=09=09=09aer_print_error(e_info->dev[i], e_info);
> +=09=09if (aer_get_device_error_info(e_info, i))
> +=09=09=09aer_print_error(e_info, i);
>  =09}
>  =09for (i =3D 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -=09=09if (aer_get_device_error_info(e_info->dev[i], e_info))
> +=09=09if (aer_get_device_error_info(e_info, i))
>  =09=09=09handle_error_source(e_info->dev[i], e_info);
>  =09}
>  }
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 7ae1590ea1da..fc18349614d7 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -253,6 +253,10 @@ static int dpc_get_aer_uncorrect_severity(struct pci=
_dev *dev,
>  =09=09info->severity =3D AER_NONFATAL;
> =20
>  =09info->level =3D KERN_ERR;
> +
> +=09info->dev[0] =3D dev;
> +=09info->error_dev_num =3D 1;
> +
>  =09return 1;
>  }
> =20
> @@ -270,8 +274,8 @@ void dpc_process_error(struct pci_dev *pdev)
>  =09=09pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrec=
table error detected\n",
>  =09=09=09 status);
>  =09=09if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
> -=09=09    aer_get_device_error_info(pdev, &info)) {
> -=09=09=09aer_print_error(pdev, &info);
> +=09=09    aer_get_device_error_info(&info, 0)) {
> +=09=09=09aer_print_error(&info, 0);
>  =09=09=09pci_aer_clear_nonfatal_status(pdev);
>  =09=09=09pci_aer_clear_fatal_status(pdev);
>  =09=09}
>=20

--=20
 i.

--8323328-767706868-1747998832=:21466--

