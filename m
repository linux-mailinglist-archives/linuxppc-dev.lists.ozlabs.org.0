Return-Path: <linuxppc-dev+bounces-8913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FDAC2047
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 11:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3gYM262Vz2ytV;
	Fri, 23 May 2025 19:56:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747994215;
	cv=none; b=PXe7G5fMIqVjJAPstx2ZFKpgs8XOfrEHuVCrk6sJtthUA+vymJL6C3SyoBWZG+4KuI+/1VLFyQHdt6e3Jk8LOj9UHmKVeuBF8h5EkknmbSYjyQKesync2CeP0owY5zcNd6+3AulGBxv192RDugxhfwEeBf9yRud1uYGmlZAyXuoRdhF+FNvLDxLdvxgowtXP6CjzN3wEIoKgpRcj85EDS3dQkR4lv1CKItKRfLy1TpQYv+Ab3q3pND8Vc5kz/ZPPQxe/kU0RRreD9J5Z3/J05p86X+wWmxEJyUgdONDdcQuRDHGj7ylVUGbAe9fzJxyIDe6BNU3Fu0BIhxzpOuAiew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747994215; c=relaxed/relaxed;
	bh=BX5f0kgNcIuaQh4riq5yd6yrHlHjtFOsSYvpeKUcm68=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MhjiBe6Hi98Y2mZ3xmcDqeZmXsdpFR4Ji7hetvfQm7dXw/T1PN51O7sHW09Ip4ENxhBy7jbRlxoOwq28isp2U8+hN8jReaUJ0rb6Fy5DSWdHlHlGRavEXta0vF4gBDT3iJce0VtKwbc31SAa+THD0klraNXnRwbBCmfRUWDVEYX2/oTmQowSAotcvlH/qxH6qvIp87OVRYD1OYirrWyietMeM+OtPTv2MXL0b4echwLftMtgvX+bwbTfvdHVqMr1ZMJ+Q73/Aceihi+kDq/1J9gr+eSsZMlphBry6ar9sQkNM6H9iHW9LMY8JtCzNaBxmOP330f7xJNUgCpUvbOtAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YUV/K2jj; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YUV/K2jj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3gYH6Tdzz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 19:56:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994213; x=1779530213;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JbxZhZlzZC1d54wodrzZn1J3iTj3tlK9lW0dMu8lctw=;
  b=YUV/K2jjB+t4mEVmcW/1GlitYJrI9jQEEYCq8ghTC2chi8SOWoPwYhD7
   F36rMAMUX5yWqNZip70UWs7dw9aq6Nop/3p8v6PjIOcSY6bl4/lmWPW02
   BgYHhS+6eFu1EgzVFJby9QTdZAiJFs6yJJNqW24XwEUrB90GMM3NmiKU+
   0BJ5WnyK1AKmkOUxtWQxAW0Mx0TzsolsWrVO7+S8nxB4GlH2obMSTFh+h
   S67ORyxjwGwcUIqeTYsYX+1AxNq0mLrkwzAoDdGs587ZaIPPF5nSoLdjz
   z8yA4Y7crlWIVqoi4+OuC4+SzuhTPJXZPYHTtgGz4pzCYKhprtJZfdkJE
   A==;
X-CSE-ConnectionGUID: Duu1o0KqR7aATvg/1C21hA==
X-CSE-MsgGUID: Okp7lT8FTmKbBmqlUDDqow==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37670355"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="37670355"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:56:47 -0700
X-CSE-ConnectionGUID: yFtpiiTURPqBOqi3zo9T/A==
X-CSE-MsgGUID: suIahlvJSs2wQTPTiC/a1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="146063780"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:56:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 May 2025 12:56:35 +0300 (EEST)
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
Subject: Re: [PATCH v8 13/20] PCI/ERR: Add printk level to
 pcie_print_tlp_log()
In-Reply-To: <20250522232339.1525671-14-helgaas@kernel.org>
Message-ID: <ce537bc4-a302-4da5-2e65-0fb07c9e3e1d@linux.intel.com>
References: <20250522232339.1525671-1-helgaas@kernel.org> <20250522232339.1525671-14-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-2019861423-1747994195=:933"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2019861423-1747994195=:933
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 22 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> aer_print_error() produces output at a printk level (KERN_ERR/KERN_WARNIN=
G/
> etc) that depends on the kind of error, and it calls pcie_print_tlp_log()=
,
> which previously always produced output at KERN_ERR.
>=20
> Add a "level" parameter so aer_print_error() can control the level of the
> pcie_print_tlp_log() output to match.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pci.h      | 3 ++-
>  drivers/pci/pcie/aer.c | 5 +++--
>  drivers/pci/pcie/dpc.c | 2 +-
>  drivers/pci/pcie/tlp.c | 6 ++++--
>  4 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 705f9ef58acc..1a9bfc708757 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -613,7 +613,8 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where,=
 int where2,
>  =09=09      struct pcie_tlp_log *log);
>  unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
>  void pcie_print_tlp_log(const struct pci_dev *dev,
> -=09=09=09const struct pcie_tlp_log *log, const char *pfx);
> +=09=09=09const struct pcie_tlp_log *log, const char *level,
> +=09=09=09const char *pfx);
>  #endif=09/* CONFIG_PCIEAER */
> =20
>  #ifdef CONFIG_PCIEPORTBUS
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f80c78846a14..f0936759ba8b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -734,7 +734,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>  =09__aer_print_error(dev, info);
> =20
>  =09if (info->tlp_header_valid)
> -=09=09pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
> +=09=09pcie_print_tlp_log(dev, &info->tlp, level, dev_fmt("  "));
> =20
>  out:
>  =09if (info->id && info->error_dev_num > 1 && info->id =3D=3D id)
> @@ -797,7 +797,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
>  =09=09=09aer->uncor_severity);
> =20
>  =09if (tlp_header_valid)
> -=09=09pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> +=09=09pcie_print_tlp_log(dev, &aer->header_log, info.level,
> +=09=09=09=09   dev_fmt("  "));
>  }
>  EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> =20
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 6c98fabdba57..7ae1590ea1da 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -222,7 +222,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *=
pdev)
>  =09=09=09  dpc_tlp_log_len(pdev),
>  =09=09=09  pdev->subordinate->flit_mode,
>  =09=09=09  &tlp_log);
> -=09pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
> +=09pcie_print_tlp_log(pdev, &tlp_log, KERN_ERR, dev_fmt(""));
> =20
>  =09if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
>  =09=09goto clear_status;
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 890d5391d7f5..71f8fc9ea2ed 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -98,12 +98,14 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where,=
 int where2,
>   * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
>   * @dev: PCIe device
>   * @log: TLP Log structure
> + * @level: Printk log level
>   * @pfx: String prefix
>   *
>   * Prints TLP Header and Prefix Log information held by @log.
>   */
>  void pcie_print_tlp_log(const struct pci_dev *dev,
> -=09=09=09const struct pcie_tlp_log *log, const char *pfx)
> +=09=09=09const struct pcie_tlp_log *log, const char *level,
> +=09=09=09const char *pfx)
>  {
>  =09/* EE_PREFIX_STR fits the extended DW space needed for the Flit mode =
*/
>  =09char buf[11 * PCIE_STD_MAX_TLP_HEADERLOG + 1];
> @@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
>  =09=09}
>  =09}
> =20
> -=09pci_err(dev, "%sTLP Header%s: %s\n", pfx,
> +=09dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
>  =09=09log->flit ? " (Flit)" : "", buf);
>  }
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2019861423-1747994195=:933--

