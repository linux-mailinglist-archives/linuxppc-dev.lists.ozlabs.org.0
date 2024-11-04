Return-Path: <linuxppc-dev+bounces-2829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79F9BB5F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 14:26:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhsgt5PbYz2yMk;
	Tue,  5 Nov 2024 00:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730726810;
	cv=none; b=Qg95q5PhOGgOhQv5pBW6qYBqiDY88l8VjFh4zkmViNA/2XybiJCDmlS2IOArDF3aJ73hnfPIYIIaKcSqK+4t73ZIYBg7ju/juE31+h/lx3Ab4eLs+jXNFP5I5qseCknup2oYnBimIr056l5FCigOOfkO5dCheUQLsnBn/m3N1F8yg7RXC07tpFQfyAN990qawwAhKmQeKyUd5tI84RKtaVCsM5uvy6+H8ZUrUTEeEE+UMc8oDVvL3zdgqhtTnIUDlDfYFUfft4TbPGY4CZg/A6A3Zug3E9wT0qqCTvV817TovMVJlfBc/deWK0+9jLcGhxJIk9TaPoKYxRxS6ie86g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730726810; c=relaxed/relaxed;
	bh=fBu4LSRH1Ek1Kbk8PE5B4m+YFkf2qbk/d9bb550qHQ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HqBOBrUeaTBAUKIWIJOVmbRLldgF6u3+/tDk033PA2oNHKoqlu5gu5fy78vnEKZID4qLEINJa4VoMN1tRRC6+sWVhb/eMZbyre+7U59gpnAnUt+TpRRmBYaJ36a1lWfaVDdb69r2r7ql28Xfp+X5lJE3jEAGei/o7NsRxf7Gd1wdO3glOxF6AZzr4agC/Wz28CDN9MEUj/z0YUoYtDmHmuIsQ7mf6hJ9OXdy39FOcEvILN7bS8CJiDkY9nVG106BEU6df3+R4GFALcQ0xn0tmYWFbtCjEHjIpP3kfj0nHALq1wJsCLAJantT3bXPKQA4uMFnIttQZQqtQESb03eCPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJzT92Jh; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJzT92Jh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 05 Nov 2024 00:26:46 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhsgp2gNpz2yMb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 00:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730726806; x=1762262806;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oPBklUbvKL8bSKRIlaEBq6Ena9N6JHRIUOBA6mqrZ6c=;
  b=TJzT92JhKyeWcW9ztAqoAbnpIS2wqMUTItj7n07Gijj8mDkrUUqoQN5X
   3Sl5ZUZr2GESUoWGxV2HLwuzBdPECxAaUB2EkrVcbq4xWdFoNaSYnGuF/
   hFBzFRw4UYrdX43yh0wdOYmPFovWFRhMy4HNGyJqahH7KENXhOMTjJnXW
   0ykgKE0aZdbUqf4ISGwrdgrzgy521K7VV4HVVJkQSQx3FA0o4e324qYs0
   v/FlBgM9gvAJIRKl2fyYQ+cIyj3Yfv2Zg1mAxRyHS3DGy5jqy86/x/nIe
   GHTP5krzmFoWkhdtPs1BJYm7xQ68SyVJK/f1bZsVat3T4n+7gXVz+fi7R
   w==;
X-CSE-ConnectionGUID: aXDtl+o/RvKcip3SdjfGnw==
X-CSE-MsgGUID: qXavgt7DQMashG9LMmqxKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30275418"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30275418"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:25:33 -0800
X-CSE-ConnectionGUID: v9JmlMoUQFaNhWF7H45gGQ==
X-CSE-MsgGUID: 4K1oV5FuTuelLKT3nBONXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83542204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:25:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Nov 2024 15:25:13 +0200 (EET)
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
    Davidlohr Bueso <dave@stgolabs.net>, 
    Jonathan Cameron <jonathan.cameron@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, 
    Alison Schofield <alison.schofield@intel.com>, 
    Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, 
    Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
    Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
    Tudor Ambarus <tudor.ambarus@linaro.org>, 
    Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    "David E. Box" <david.e.box@linux.intel.com>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    "Martin K. Petersen" <martin.petersen@oracle.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
    Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
    Logan Gunthorpe <logang@deltatee.com>, 
    "K. Y. Srinivasan" <kys@microsoft.com>, 
    Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
    Dexuan Cui <decui@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
    linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
    dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
    linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
    linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
    linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback
 of bin_is_visible()
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
Message-ID: <65f4dc4e-3b48-2baa-a13b-3cc34dd51ce1@linux.intel.com>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net> <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-559502379-1730726713=:989"
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-559502379-1730726713=:989
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 3 Nov 2024, Thomas Wei=C3=9Fschuh wrote:

> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
>=20
> As there are not many callback implementers perform this change
> throughout the tree at once.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/cxl/port.c                      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
>  drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
>  drivers/mtd/spi-nor/sysfs.c             |  2 +-
>  drivers/nvmem/core.c                    |  3 ++-
>  drivers/pci/pci-sysfs.c                 |  2 +-
>  drivers/pci/vpd.c                       |  2 +-
>  drivers/platform/x86/amd/hsmp.c         |  2 +-
>  drivers/platform/x86/intel/sdsi.c       |  2 +-
>  drivers/scsi/scsi_sysfs.c               |  2 +-
>  drivers/usb/core/sysfs.c                |  2 +-
>  include/linux/sysfs.h                   | 30 +++++++++++++++------------=
---
>  12 files changed, 27 insertions(+), 26 deletions(-)

> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/h=
smp.c
> index 8fcf38eed7f00ee01aade6e3e55e20402458d5aa..8f00850c139fa8d419bc1c140=
c1832bf84b2c3bd 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -620,7 +620,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  }
> =20
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -=09=09=09=09=09 struct bin_attribute *battr, int id)
> +=09=09=09=09=09 const struct bin_attribute *battr, int id)

Hi Thomas,

This driver is reworked in pdx86/for-next.

--=20
 i.


>  {
>  =09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
>  =09=09return battr->attr.mode;
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/int=
el/sdsi.c
> index 9d137621f0e6e7a23be0e0bbc6175c51c403169f..33f33b1070fdc949c1373251c=
3bca4234d9da119 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -541,7 +541,7 @@ static struct bin_attribute *sdsi_bin_attrs[] =3D {
>  };
> =20
>  static umode_t
> -sdsi_battr_is_visible(struct kobject *kobj, struct bin_attribute *attr, =
int n)
> +sdsi_battr_is_visible(struct kobject *kobj, const struct bin_attribute *=
attr, int n)
>  {
>  =09struct device *dev =3D kobj_to_dev(kobj);
>  =09struct sdsi_priv *priv =3D dev_get_drvdata(dev);

--8323328-559502379-1730726713=:989--

