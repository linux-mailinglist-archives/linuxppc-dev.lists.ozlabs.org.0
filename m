Return-Path: <linuxppc-dev+bounces-8725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BBABD50C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:33:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rW51mSwz30Ss;
	Tue, 20 May 2025 20:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737217;
	cv=none; b=mhMNVEK/Jq7PvA6V4JrOVRp723quYUrhHZGQ3WUI7gUnksw7wSS+tQeWkdBhpjzo7LSorZdkDp9FlCwtdmLZhxc9FyUX9G69peNQXWywmx1+ZPi+KJzzVjX4UpxEsd2PTBMaI1TS4FBkuaqGJDNoYGYy3BKVvbSh1RqmV1n+5E3kLLYQFBSjfGqteY0W/dKNJz5/NAkRoyGqYJXuV+usx1ILalTkLcwWNcF9zZdu1KQkGffNZPO6tkdyLuEQ6fzFzJIOQhmAOEAki4iNYdomEIv6jFlskHhga/IJsm1Tg47Wubd1JLXVxyyqH/rkXrMzMHJ75KBWLyTmlPKpq2XUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737217; c=relaxed/relaxed;
	bh=aUCTBCQfOEHV40u8HHArvvx1Eq06ZVtrEqYZSGyNFMM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lLueidePwNBCucNC8czRSSWFUb+AeETVg4cVb4Sc2Wz6mbPojWT8fdJPSDq90Fdi7fXWvmKQIqhANw/zGQb154xixLatL1uGi/n3S2lxt0fpO0GOJ/+tL9XcRpe1QeqKqfVu06bJsFM4qNDuhAaohjuEg8I0KmuphJLB+LpiAO+mSxQHtE5T7LMHsCFhZ35kfzgH8g3Y1u+tWfeKO2MAgaZFDhD4PmZ49QKjAqgIvX+5g68grjCbA7nAiUQE3CbUkvgKPc3kH+0VY7v4LjhmAnYx2S7JwCEBzTTv8hh3cyk2eqZOcDiJgvhpAOC5Rz4nkKxzlJoUOQH/cvmW3TlAgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkGW1R1e; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkGW1R1e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rW40mDhz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:33:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737217; x=1779273217;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6/pDG+AvJT15c5ska4ppz+CuaS46pEaA766nfX3ii2Y=;
  b=nkGW1R1e/ZGX5sZbthXjzNnPLygmBkiTEoA0NBUxKGVIOLb5eiiXpVLt
   Jn//j8d8xk5aZOQMuhoEMpVAl2j47759TMdo/+5yGHnr9hrB8C1oqszoe
   Yus0tseIuFsp67rVxghFQOi8182BWP7EDVobJZvlBlDUF/UbL7ICZaW3v
   h1dGWJWSkGl3iU8egK7s2PNJfjZZ5BAIB3+zb4mXZv6As2J3YohM2dkgK
   +Qoi59+i8dDyxy9zjJFHJcIgRahPkF2QIsTDlLgZtNh3cMsVRRZQd/6Dn
   iqEUnoT5rvs6YUck90Xw5ADyeOXYtQ2QRHua7M6brAz43CQjb57CqUcrf
   Q==;
X-CSE-ConnectionGUID: dXoVcpY+Rt+CJb7Jms+FgA==
X-CSE-MsgGUID: ddC7wx5DR1+zN228E5st6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61058998"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61058998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:33:32 -0700
X-CSE-ConnectionGUID: 8xb8IhFVQtmzJreTdiAd6w==
X-CSE-MsgGUID: rCBTico+SkGyQg6oESRtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176777146"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:33:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:33:22 +0300 (EEST)
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
Subject: Re: [PATCH v6 05/16] PCI/AER: Rename aer_print_port_info() to
 aer_print_source()
In-Reply-To: <20250519213603.1257897-6-helgaas@kernel.org>
Message-ID: <2ebdfb8d-18ec-d87e-469d-c33ee245d244@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-6-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-247255916-1747737202=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-247255916-1747737202=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Jon Pan-Doh <pandoh@google.com>
>=20
> Rename aer_print_port_info() to aer_print_source() to be more descriptive=
=2E
> This logs the Error Source ID logged by a Root Port or Root Complex Event
> Collector when it receives an ERR_COR, ERR_NONFATAL, or ERR_FATAL Message=
=2E
>=20
> [bhelgaas: aer_print_rp_info() -> aer_print_source()]
> Link: https://lore.kernel.org/r/20250321015806.954866-5-pandoh@google.com
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index dc8a50e0a2b7..eb42d50b2def 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -733,8 +733,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>  =09=09=09info->severity, info->tlp_header_valid, &info->tlp);
>  }
> =20
> -static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info=
 *info,
> -=09=09=09=09const char *details)
> +static void aer_print_source(struct pci_dev *dev, struct aer_err_info *i=
nfo,
> +=09=09=09     const char *details)
>  {
>  =09u16 source =3D info->id;
> =20
> @@ -932,7 +932,7 @@ static bool find_source_device(struct pci_dev *parent=
,
>  =09 * RCEC that received an ERR_* Message.
>  =09 */
>  =09if (!e_info->error_dev_num) {
> -=09=09aer_print_port_info(parent, e_info, " (no details found)");
> +=09=09aer_print_source(parent, e_info, " (no details found)");
>  =09=09return false;
>  =09}
>  =09return true;
> @@ -1299,7 +1299,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  =09=09=09e_info.multi_error_valid =3D 0;
> =20
>  =09=09if (find_source_device(pdev, &e_info)) {
> -=09=09=09aer_print_port_info(pdev, &e_info, "");
> +=09=09=09aer_print_source(pdev, &e_info, "");
>  =09=09=09aer_process_err_devices(&e_info);
>  =09=09}
>  =09}
> @@ -1318,7 +1318,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  =09=09=09e_info.multi_error_valid =3D 0;
> =20
>  =09=09if (find_source_device(pdev, &e_info)) {
> -=09=09=09aer_print_port_info(pdev, &e_info, "");
> +=09=09=09aer_print_source(pdev, &e_info, "");
>  =09=09=09aer_process_err_devices(&e_info);
>  =09=09}
>  =09}
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-247255916-1747737202=:936--

