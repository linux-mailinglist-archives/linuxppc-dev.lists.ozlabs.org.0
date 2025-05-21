Return-Path: <linuxppc-dev+bounces-8828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C5ABF172
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2SFw1M9dz3c3g;
	Wed, 21 May 2025 20:24:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747823060;
	cv=none; b=WLPTBWn315G+B1qNyPxEbPoK7ukj9APP5xCPxNjkFSNLbL91wMN49RbTxbaTJR0R3tRAZZNQpcJbhnM4tTpIZm95eYKFqIiElsaR0dmj4lES/uZZil0l+9cOvnQREpg+KOVFz/eikvt7DCKRpx42Tmna7SW9fH1Dyq1OUbgVmIEEu0FvZYlDWMKEhPczc3r1hJncg5MaAQ5hNpElXdbgi9VIDBwqPqc1IscIj43LajV1JTVXgKzTbAWYz29SrUjpPJIGsftKsjxqM1bDtq4ALNemaAtz2ipnfVW9oc2MBlRzHbf+UJJmlGJzKBig/RTPQPaIuWFlZ6wAPX8W6KVOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747823060; c=relaxed/relaxed;
	bh=2nai+BUcQnHWg1hpJZe7Xtn/H75eBEtiB7ZJdQs+9Hc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CCccjg5RfUAGW9lOdxKWHnwOTIOHkPOyi89fp8dLUajqiuNsAHsDyiIUrBcXL0tO5yRxvC86ATLJS7smgFM4MmCIcKZkvZ6Z0Jka1sUjOyAl6qyAVI39sK0E/pBLT4Yh/02tYOiTdsRB9AwLLmzWAO+A5F75JuKgxhKMldcTVNclVePOh9Qv7tR7f5AXmFwLHkmO+YemOmp9F7w2hHA4CInKyRsSVeMHm7j92tfAzzwoPcLdSf7p8YVhAbEtJuuChvPl2JUjcL4sHXp5lEdP/dlScokrfOKWKblp3KSJv0pPy49SrTd70GnYFo6w2hhi5qsxSGEfEuaZZ86vHlSA3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I6OVH/8N; dkim-atps=neutral; spf=none (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I6OVH/8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2SFs1m54z3c2l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:24:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747823057; x=1779359057;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QT+ZRXmQW3xGIwS8YUEuvwknhFtt2KUvctGSee3lUTM=;
  b=I6OVH/8NQkyxh9ocyFj/ZZlgfLq6L2VwNQQgKTsCw9UHnRChKd6JzCiU
   lgwlVkMp1I+bbErhQSxXijai9sPd6kW0jmgz1CdM1OXwrWa0ZYyl1+Fe9
   TVmBKrs49kEY6B6ZzmLWmr39FNzdysrc6Mbt0hGs4yT8qxRO2Z3Hh8Tsn
   phSAszK9hC+lALbz2MO8ZJAlyBzUeC0QK2wD/aTJ0ZaM/tdawAjGiyWRW
   YjGRpL97uQGR9uZao310etCfcpnwBotBnEKlQB/T6PuagD2aQQnrItaRK
   7kuE0ebZQ9FGRDllmFx3T+y8DwnDD9cAAdKS7CsDWdPleRmlPBDYGTxLn
   Q==;
X-CSE-ConnectionGUID: v3uDsPQsTCGvlP0hsKjRPQ==
X-CSE-MsgGUID: iByux+j4Tk2NIU3kz3hOMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60452563"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60452563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:24:13 -0700
X-CSE-ConnectionGUID: NLexAi0OT0iqeJ9fviJxmw==
X-CSE-MsgGUID: 6WwmvMZETxiuSev+BW/SKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="163285282"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:24:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 13:24:02 +0300 (EEST)
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
Subject: Re: [PATCH v7 15/17] PCI/AER: Ratelimit correctable and non-fatal
 error logging
In-Reply-To: <20250520215047.1350603-16-helgaas@kernel.org>
Message-ID: <cb2df523-866a-f3c6-741d-b68358b4569d@linux.intel.com>
References: <20250520215047.1350603-1-helgaas@kernel.org> <20250520215047.1350603-16-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-2051602385-1747823042=:946"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2051602385-1747823042=:946
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 May 2025, Bjorn Helgaas wrote:

> From: Jon Pan-Doh <pandoh@google.com>
>=20
> Spammy devices can flood kernel logs with AER errors and slow/stall
> execution. Add per-device ratelimits for AER correctable and non-fatal
> uncorrectable errors that use the kernel defaults (10 per 5s).  Logging o=
f
> fatal errors is not ratelimited.
>=20
> There are two AER logging entry points:
>=20
>   - aer_print_error() is used by DPC and native AER
>=20
>   - pci_print_aer() is used by GHES and CXL
>=20
> The native AER aer_print_error() case includes a loop that may log detail=
s
> from multiple devices.  This is ratelimited such that we log all the
> details we find if any of the devices has not hit the ratelimit.  If no
> such device details are found, we still log the Error Source from the ERR=
_*
> Message, ratelimited by the Root Port or RCEC that received it.
>=20
> The DPC aer_print_error() case is not ratelimited, since this only happen=
s
> for fatal errors.
>=20
> The CXL pci_print_aer() case is ratelimited by the Error Source device.
>=20
> The GHES pci_print_aer() case is via aer_recover_work_func(), which
> searches for the Error Source device.  If the device is not found, there'=
s
> no per-device ratelimit, so we use a system-wide ratelimit that covers al=
l
> error types (correctable, non-fatal, and fatal).
>=20
> Sargun at Meta reported internally that a flood of AER errors causes RCU
> CPU stall warnings and CSD-lock warnings.
>=20
> Tested using aer-inject[1]. Sent 11 AER errors. Observed 10 errors logged
> while AER stats (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) show
> true count of 11.
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.=
git
>=20
> [bhelgaas: commit log, factor out trace_aer_event() and aer_print_rp_info=
()
> changes to previous patches, collect single aer_err_info.ratelimit as uni=
on
> of ratelimits of all error source devices, don't ratelimit fatal errors,
> "aer_report" -> "aer_info"]
> Reported-by: Sargun Dhillon <sargun@meta.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.


> ---
>  drivers/pci/pci.h      |  3 +-
>  drivers/pci/pcie/aer.c | 66 ++++++++++++++++++++++++++++++++++++++----
>  drivers/pci/pcie/dpc.c |  1 +
>  3 files changed, 64 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 705f9ef58acc..65c466279ade 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -593,7 +593,8 @@ struct aer_err_info {
>  =09unsigned int id:16;
> =20
>  =09unsigned int severity:2;=09/* 0:NONFATAL | 1:FATAL | 2:COR */
> -=09unsigned int __pad1:5;
> +=09unsigned int ratelimit:1;=09/* 0=3Dskip, 1=3Dprint */
> +=09unsigned int __pad1:4;
>  =09unsigned int multi_error_valid:1;
> =20
>  =09unsigned int first_error:5;
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 4f1bff0f000f..f9e684ac7878 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -28,6 +28,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/delay.h>
>  #include <linux/kfifo.h>
> +#include <linux/ratelimit.h>
>  #include <linux/slab.h>
>  #include <acpi/apei.h>
>  #include <acpi/ghes.h>
> @@ -88,6 +89,10 @@ struct aer_info {
>  =09u64 rootport_total_cor_errs;
>  =09u64 rootport_total_fatal_errs;
>  =09u64 rootport_total_nonfatal_errs;
> +
> +=09/* Ratelimits for errors */
> +=09struct ratelimit_state cor_log_ratelimit;
> +=09struct ratelimit_state uncor_log_ratelimit;
>  };
> =20
>  #define AER_LOG_TLP_MASKS=09=09(PCI_ERR_UNC_POISON_TLP|=09\
> @@ -379,6 +384,11 @@ void pci_aer_init(struct pci_dev *dev)
> =20
>  =09dev->aer_info =3D kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
> =20
> +=09ratelimit_state_init(&dev->aer_info->cor_log_ratelimit,
> +=09=09=09     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> +=09ratelimit_state_init(&dev->aer_info->uncor_log_ratelimit,
> +=09=09=09     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> +
>  =09/*
>  =09 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
>  =09 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
> @@ -672,6 +682,18 @@ static void pci_rootport_aer_stats_incr(struct pci_d=
ev *pdev,
>  =09}
>  }
> =20
> +static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
> +{
> +=09struct ratelimit_state *ratelimit;
> +
> +=09if (severity =3D=3D AER_CORRECTABLE)
> +=09=09ratelimit =3D &dev->aer_info->cor_log_ratelimit;
> +=09else
> +=09=09ratelimit =3D &dev->aer_info->uncor_log_ratelimit;
> +
> +=09return __ratelimit(ratelimit);
> +}
> +
>  static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *=
info)
>  {
>  =09const char **strings;
> @@ -715,6 +737,9 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
> =20
>  =09pci_dev_aer_stats_incr(dev, info);
> =20
> +=09if (!info->ratelimit)
> +=09=09return;
> +
>  =09if (!info->status) {
>  =09=09pci_err(dev, "PCIe Bus Error: severity=3D%s, type=3DInaccessible, =
(Unregistered Agent ID)\n",
>  =09=09=09aer_error_severity_string[info->severity]);
> @@ -785,6 +810,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
> =20
>  =09pci_dev_aer_stats_incr(dev, &info);
> =20
> +=09if (!aer_ratelimit(dev, info.severity))
> +=09=09return;
> +
>  =09layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
>  =09agent =3D AER_GET_AGENT(aer_severity, status);
> =20
> @@ -815,8 +843,19 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>   */
>  static int add_error_device(struct aer_err_info *e_info, struct pci_dev =
*dev)
>  {
> +=09/*
> +=09 * Ratelimit AER log messages.  "dev" is either the source
> +=09 * identified by the root's Error Source ID or it has an unmasked
> +=09 * error logged in its own AER Capability.  If any of these devices
> +=09 * has not reached its ratelimit, log messages for all of them.
> +=09 * Messages are emitted when "e_info->ratelimit" is non-zero.
> +=09 *
> +=09 * Note that "e_info->ratelimit" was already initialized to 1 for the
> +=09 * ERR_FATAL case.
> +=09 */
>  =09if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
>  =09=09e_info->dev[e_info->error_dev_num] =3D pci_dev_get(dev);
> +=09=09e_info->ratelimit |=3D aer_ratelimit(dev, e_info->severity);
>  =09=09e_info->error_dev_num++;
>  =09=09return 0;
>  =09}
> @@ -914,7 +953,7 @@ static int find_device_iter(struct pci_dev *dev, void=
 *data)
>   * e_info->error_dev_num and e_info->dev[], based on the given informati=
on.
>   */
>  static bool find_source_device(struct pci_dev *parent,
> -=09=09struct aer_err_info *e_info)
> +=09=09=09       struct aer_err_info *e_info)
>  {
>  =09struct pci_dev *dev =3D parent;
>  =09int result;
> @@ -1140,9 +1179,10 @@ static void aer_recover_work_func(struct work_stru=
ct *work)
>  =09=09pdev =3D pci_get_domain_bus_and_slot(entry.domain, entry.bus,
>  =09=09=09=09=09=09   entry.devfn);
>  =09=09if (!pdev) {
> -=09=09=09pr_err("no pci_dev for %04x:%02x:%02x.%x\n",
> -=09=09=09       entry.domain, entry.bus,
> -=09=09=09       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
> +=09=09=09pr_err_ratelimited("%04x:%02x:%02x.%x: no pci_dev found\n",
> +=09=09=09=09=09   entry.domain, entry.bus,
> +=09=09=09=09=09   PCI_SLOT(entry.devfn),
> +=09=09=09=09=09   PCI_FUNC(entry.devfn));
>  =09=09=09continue;
>  =09=09}
>  =09=09pci_print_aer(pdev, entry.severity, entry.regs);
> @@ -1283,7 +1323,21 @@ static void aer_isr_one_error_type(struct pci_dev =
*root,
>  =09bool found;
> =20
>  =09found =3D find_source_device(root, info);
> -=09aer_print_source(root, info, found ? "" : " (no details found");
> +
> +=09/*
> +=09 * If we're going to log error messages, we've already set
> +=09 * "info->ratelimit" to non-zero (which enables printing) because
> +=09 * this is either an ERR_FATAL or we found a device with an error
> +=09 * logged in its AER Capability.
> +=09 *
> +=09 * If we didn't find the Error Source device, at least log the
> +=09 * Requester ID from the ERR_* Message received by the Root Port or
> +=09 * RCEC, ratelimited by the RP or RCEC.
> +=09 */
> +=09if (info->ratelimit ||
> +=09    (!found && aer_ratelimit(root, info->severity)))
> +=09=09aer_print_source(root, info, found ? "" : " (no details found");
> +
>  =09if (found)
>  =09=09aer_process_err_devices(info);
>  }
> @@ -1317,12 +1371,14 @@ static void aer_isr_one_error(struct pci_dev *roo=
t,
>  =09=09aer_isr_one_error_type(root, &e_info);
>  =09}
> =20
> +=09/* Note that messages for ERR_FATAL are never ratelimited */
>  =09if (status & PCI_ERR_ROOT_UNCOR_RCV) {
>  =09=09int fatal =3D status & PCI_ERR_ROOT_FATAL_RCV;
>  =09=09int multi =3D status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
>  =09=09struct aer_err_info e_info =3D {
>  =09=09=09.id =3D ERR_UNCOR_ID(e_src->id),
>  =09=09=09.severity =3D fatal ? AER_FATAL : AER_NONFATAL,
> +=09=09=09.ratelimit =3D fatal ? 1 : 0,
>  =09=09=09.level =3D KERN_ERR,
>  =09=09=09.multi_error_valid =3D multi ? 1 : 0,
>  =09=09};
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 6c98fabdba57..530c5e2cf7e8 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -271,6 +271,7 @@ void dpc_process_error(struct pci_dev *pdev)
>  =09=09=09 status);
>  =09=09if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
>  =09=09    aer_get_device_error_info(pdev, &info)) {
> +=09=09=09info.ratelimit =3D 1;=09/* ERR_FATAL; no ratelimit */
>  =09=09=09aer_print_error(pdev, &info);
>  =09=09=09pci_aer_clear_nonfatal_status(pdev);
>  =09=09=09pci_aer_clear_fatal_status(pdev);
>=20
--8323328-2051602385-1747823042=:946--

