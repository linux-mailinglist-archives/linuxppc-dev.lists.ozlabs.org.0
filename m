Return-Path: <linuxppc-dev+bounces-8745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE3DABD706
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:38:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1syR1RHCz3bqs;
	Tue, 20 May 2025 21:38:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747741135;
	cv=none; b=VG5mXWDD5kZdz+AaLOQag4xrZUoRUgQdZh75FcvgBVeIqq76jbhS00tlcUBGsn/qFyQiRwVqV+pyZ7bNV4ZMH3dGYS+oEZDC32AbXbYQNgRfzo2hocS3ALkUFouOJ/ORqBDrP3w2voXgVCTGETFL69cl7vMXHtyxYpMZGGuf3o4+51VkXUDn+hUyIKQq8BVsysXr61th/zqnFDe7Vn8gqKoavnowZQdAoV8Se5yIuIzSmZOPSHWpRWxJlJ0eqJjrCKazaNmuplkxUKjL+UNzSMvrHqJ5d4VeaAaBxTaT2UfyShixuLUZNGai/CJTgAZS9Rcbi74JhuXIAwsm4VthUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747741135; c=relaxed/relaxed;
	bh=kD5tv9uH+MQC56dMQYdcewCGdcINyJfaFjKt55d8pcw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aGlwNXJ2zTOBn4O8ko5TYEqg4SzgwcaM4t5q+BK99OmxbPhR9cSD3/V7mJX6tioHZbo6zdR0GVv9EvQyEEV5jpkZxS5O40vgXX9r5cthWUXt0Fkuq67XeAy3qXaRz7/9MfSzgzzj2yn9Xbdyeyu2ZIDdUyQaWbvoQPuFMlyRMRxQhkWNkhrht8ir+7rfFkI7Po+kHAJ1669HEdAKDfp5b2nVhgaoONXrBMix8hsz1ooDoW6S/FaimmzRwpJlPmEh3OQE6dsCskLOWU1IzUTkmoOa3R8plkvRwyOAXvFsePOmxdpxwh/7FYs+M4jYhBEaKf1SGuoCqOgjMGXo6eyupQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOboLqxN; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOboLqxN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1syQ218Cz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:38:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747741135; x=1779277135;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZBhy5jTMuX/islvsvsIGuvvsPNEPu6gzFj5aeGdgWNU=;
  b=DOboLqxNlDReAy7IFM3ALjpUzXGZ3IxgwynGmZhxdqKn4vtqkVRw+i3b
   DMQJXnQBO7UeSMHKBA+puyrLmrnzEgz09WuGTA1wcKnJfwkIbwJmDYRj+
   r3ec91eedsWCBjjuE73bF5gaNiYaHhM/4uk2IaHFpiHeB38hBTEgTY+0V
   fUBP3YZdnsUscWX2BmUIu0JHyjqh18TJloy90SWSnZPRLT9Rspf3Bp/X+
   Q5PYNZcpcST8R4VAKNZd5n/IKOgySdNzsDZwFlyvCCsFpNZ8mFHQ+Poyv
   eqW3aFvMzAI+Q8U7R7uIj3o70iAR0x/p3wqYVUBPTV7mEJc0SS7iG7NKR
   w==;
X-CSE-ConnectionGUID: 1u6g4FE1Qj2Gc6iOCfGxXw==
X-CSE-MsgGUID: cRcgNj6CQ8WmW5IjitF22A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53340883"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53340883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:38:50 -0700
X-CSE-ConnectionGUID: KQtvJJ91TcO/jpGFcfksrg==
X-CSE-MsgGUID: Zwa6PwrpScOkOLk4GToe3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139506684"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:38:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 14:38:40 +0300 (EEST)
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
Subject: Re: [PATCH v6 13/16] PCI/AER: Rename struct aer_stats to
 aer_report
In-Reply-To: <20250519213603.1257897-14-helgaas@kernel.org>
Message-ID: <c5d071eb-c389-6f63-95e0-1b133bc1a620@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-14-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1916209925-1747741120=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1916209925-1747741120=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Karolina Stolarek <karolina.stolarek@oracle.com>
>=20
> Update name to reflect the broader definition of structs/variables that a=
re
> stored (e.g. ratelimits). This is a preparatory patch for adding rate lim=
it
> support.
>=20
> Link: https://lore.kernel.org/r/20250321015806.954866-6-pandoh@google.com
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 50 +++++++++++++++++++++---------------------
>  include/linux/pci.h    |  2 +-
>  2 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 06a7dda20846..da62032bf024 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -54,11 +54,11 @@ struct aer_rpc {
>  =09DECLARE_KFIFO(aer_fifo, struct aer_err_source, AER_ERROR_SOURCES_MAX)=
;
>  };
> =20
> -/* AER stats for the device */
> -struct aer_stats {
> +/* AER report for the device */
> +struct aer_report {
> =20
>  =09/*
> -=09 * Fields for all AER capable devices. They indicate the errors
> +=09 * Stats for all AER capable devices. They indicate the errors
>  =09 * "as seen by this device". Note that this may mean that if an
>  =09 * Endpoint is causing problems, the AER counters may increment
>  =09 * at its link partner (e.g. Root Port) because the errors will be
> @@ -80,7 +80,7 @@ struct aer_stats {
>  =09u64 dev_total_nonfatal_errs;
> =20
>  =09/*
> -=09 * Fields for Root Ports & Root Complex Event Collectors only; these
> +=09 * Stats for Root Ports & Root Complex Event Collectors only; these
>  =09 * indicate the total number of ERR_COR, ERR_FATAL, and ERR_NONFATAL
>  =09 * messages received by the Root Port / Event Collector, INCLUDING th=
e
>  =09 * ones that are generated internally (by the Root Port itself)
> @@ -377,7 +377,7 @@ void pci_aer_init(struct pci_dev *dev)
>  =09if (!dev->aer_cap)
>  =09=09return;
> =20
> -=09dev->aer_stats =3D kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
> +=09dev->aer_report =3D kzalloc(sizeof(*dev->aer_report), GFP_KERNEL);
> =20
>  =09/*
>  =09 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
> @@ -398,8 +398,8 @@ void pci_aer_init(struct pci_dev *dev)
> =20
>  void pci_aer_exit(struct pci_dev *dev)
>  {
> -=09kfree(dev->aer_stats);
> -=09dev->aer_stats =3D NULL;
> +=09kfree(dev->aer_report);
> +=09dev->aer_report =3D NULL;
>  }
> =20
>  #define AER_AGENT_RECEIVER=09=090
> @@ -537,10 +537,10 @@ static const char *aer_agent_string[] =3D {
>  {=09=09=09=09=09=09=09=09=09\
>  =09unsigned int i;=09=09=09=09=09=09=09\
>  =09struct pci_dev *pdev =3D to_pci_dev(dev);=09=09=09=09\
> -=09u64 *stats =3D pdev->aer_stats->stats_array;=09=09=09\
> +=09u64 *stats =3D pdev->aer_report->stats_array;=09=09=09\
>  =09size_t len =3D 0;=09=09=09=09=09=09=09\
>  =09=09=09=09=09=09=09=09=09\
> -=09for (i =3D 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
> +=09for (i =3D 0; i < ARRAY_SIZE(pdev->aer_report->stats_array); i++) {\
>  =09=09if (strings_array[i])=09=09=09=09=09\
>  =09=09=09len +=3D sysfs_emit_at(buf, len, "%s %llu\n",=09\
>  =09=09=09=09=09     strings_array[i],=09=09\
> @@ -551,7 +551,7 @@ static const char *aer_agent_string[] =3D {
>  =09=09=09=09=09     i, stats[i]);=09=09\
>  =09}=09=09=09=09=09=09=09=09\
>  =09len +=3D sysfs_emit_at(buf, len, "TOTAL_%s %llu\n", total_string,=09\
> -=09=09=09     pdev->aer_stats->total_field);=09=09\
> +=09=09=09     pdev->aer_report->total_field);=09=09\
>  =09return len;=09=09=09=09=09=09=09\
>  }=09=09=09=09=09=09=09=09=09\
>  static DEVICE_ATTR_RO(name)
> @@ -572,7 +572,7 @@ aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_err=
s,
>  =09=09     char *buf)=09=09=09=09=09=09\
>  {=09=09=09=09=09=09=09=09=09\
>  =09struct pci_dev *pdev =3D to_pci_dev(dev);=09=09=09=09\
> -=09return sysfs_emit(buf, "%llu\n", pdev->aer_stats->field);=09\
> +=09return sysfs_emit(buf, "%llu\n", pdev->aer_report->field);=09\
>  }=09=09=09=09=09=09=09=09=09\
>  static DEVICE_ATTR_RO(name)
> =20
> @@ -599,7 +599,7 @@ static umode_t aer_stats_attrs_are_visible(struct kob=
ject *kobj,
>  =09struct device *dev =3D kobj_to_dev(kobj);
>  =09struct pci_dev *pdev =3D to_pci_dev(dev);
> =20
> -=09if (!pdev->aer_stats)
> +=09if (!pdev->aer_report)
>  =09=09return 0;
> =20
>  =09if ((a =3D=3D &dev_attr_aer_rootport_total_err_cor.attr ||
> @@ -623,28 +623,28 @@ static void pci_dev_aer_stats_incr(struct pci_dev *=
pdev,
>  =09unsigned long status =3D info->status & ~info->mask;
>  =09int i, max =3D -1;
>  =09u64 *counter =3D NULL;
> -=09struct aer_stats *aer_stats =3D pdev->aer_stats;
> +=09struct aer_report *aer_report =3D pdev->aer_report;
> =20
>  =09trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
>  =09=09=09info->severity, info->tlp_header_valid, &info->tlp);
> =20
> -=09if (!aer_stats)
> +=09if (!aer_report)
>  =09=09return;
> =20
>  =09switch (info->severity) {
>  =09case AER_CORRECTABLE:
> -=09=09aer_stats->dev_total_cor_errs++;
> -=09=09counter =3D &aer_stats->dev_cor_errs[0];
> +=09=09aer_report->dev_total_cor_errs++;
> +=09=09counter =3D &aer_report->dev_cor_errs[0];
>  =09=09max =3D AER_MAX_TYPEOF_COR_ERRS;
>  =09=09break;
>  =09case AER_NONFATAL:
> -=09=09aer_stats->dev_total_nonfatal_errs++;
> -=09=09counter =3D &aer_stats->dev_nonfatal_errs[0];
> +=09=09aer_report->dev_total_nonfatal_errs++;
> +=09=09counter =3D &aer_report->dev_nonfatal_errs[0];
>  =09=09max =3D AER_MAX_TYPEOF_UNCOR_ERRS;
>  =09=09break;
>  =09case AER_FATAL:
> -=09=09aer_stats->dev_total_fatal_errs++;
> -=09=09counter =3D &aer_stats->dev_fatal_errs[0];
> +=09=09aer_report->dev_total_fatal_errs++;
> +=09=09counter =3D &aer_report->dev_fatal_errs[0];
>  =09=09max =3D AER_MAX_TYPEOF_UNCOR_ERRS;
>  =09=09break;
>  =09}
> @@ -656,19 +656,19 @@ static void pci_dev_aer_stats_incr(struct pci_dev *=
pdev,
>  static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>  =09=09=09=09 struct aer_err_source *e_src)
>  {
> -=09struct aer_stats *aer_stats =3D pdev->aer_stats;
> +=09struct aer_report *aer_report =3D pdev->aer_report;
> =20
> -=09if (!aer_stats)
> +=09if (!aer_report)
>  =09=09return;
> =20
>  =09if (e_src->status & PCI_ERR_ROOT_COR_RCV)
> -=09=09aer_stats->rootport_total_cor_errs++;
> +=09=09aer_report->rootport_total_cor_errs++;
> =20
>  =09if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
>  =09=09if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
> -=09=09=09aer_stats->rootport_total_fatal_errs++;
> +=09=09=09aer_report->rootport_total_fatal_errs++;
>  =09=09else
> -=09=09=09aer_stats->rootport_total_nonfatal_errs++;
> +=09=09=09aer_report->rootport_total_nonfatal_errs++;
>  =09}
>  }
> =20
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96..4b11a90107cb 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -346,7 +346,7 @@ struct pci_dev {
>  =09u8=09=09hdr_type;=09/* PCI header type (`multi' flag masked out) */
>  #ifdef CONFIG_PCIEAER
>  =09u16=09=09aer_cap;=09/* AER capability offset */
> -=09struct aer_stats *aer_stats;=09/* AER stats for this device */
> +=09struct aer_report *aer_report;=09/* AER report for this device */
>  #endif
>  #ifdef CONFIG_PCIEPORTBUS
>  =09struct rcec_ea=09*rcec_ea;=09/* RCEC cached endpoint association */
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1916209925-1747741120=:936--

