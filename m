Return-Path: <linuxppc-dev+bounces-8733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F6ABD61B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:08:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sHP0jCYz3bl7;
	Tue, 20 May 2025 21:08:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747739313;
	cv=none; b=kDcSwWiFAiiyO5YPAOFgfqc7aF6RMf4la3mpXPC62jtdajDXLrK8nIzBNhZMyUS5qwjKXcc/LKlr/v+O/nhQ5juK4fH8gi8Y6cuh+Vp62wGAkBkc9btDjov1mygH1JwS8RyudgZLtzF2KjYqBSBehE4m2xUY5WxbVeD+Io+SFB37iI0/Ca72jid/BbB/OuYeMF65pwp76xkQUl+WwoiWcXp9+ssJkrlTr0Xbu2zpvrHXSOH0TGrOBkhePOkz/qokvJ2MclVYWGOl2ZW/NyVQG9fjjwp7yL5w6V/8fypfgGYxtj42nbuIfpptV2+ZeTGr+cTcLXulu+eTUEvVEkWgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747739313; c=relaxed/relaxed;
	bh=Ur3VDzYTkCWByEa3zSRBDqZC4SOltpFT8VVu3pgmsVM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VGDj6IKpS1CIkq3ia5Of+vS26UqodJBFkZzS7BbZG3FvmtMhoGvVAmFMp5Vxmx7wHBQH+gg3xTVATt+2BmuaNTatOKRYikqN1ls/VhMZhjW8V4bSJ+R8mCA+jTrKoqBpohEkQoydIk3J+d0tbb//rAXqUVILKvGlEcUDCuNuewozqpZUEXKuabsE3wwisfFR9zs8siJrwY3NOJhm959/79kfgos8nLmPvbZZXeHvpm/Me6a+sOvmdgzZYWxwONlFN3sWLmuy1wzP+XEZ6MBl5NUDksh1/BGsHypZlj91zYbR4HLJd81NhGhd7QjNgtdjMeUA1Wf0PKC12hCyYxapxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MV13gbGe; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MV13gbGe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1sHN1XNfz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:08:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747739312; x=1779275312;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2prKnSO821SeuO9H2s4uOwiNlz7rB9Uw7dRLE80sspg=;
  b=MV13gbGeROrbrzCX0SvzKD4UmqTzxPDdn6LMi9ovIjb3uE7bXZBnMoBb
   g47COfPnkijLfh9ILquahTA72IZCXwUuWCB/k50m1ykreMxKSCooDTDYD
   B0PXKCoHJZn+ugOotTt3GIoY9uFU9DcBO7pDF4bN+b9MS/JPat+bQN91H
   gqUTnu/RTyK4yGlOA736tn2rlUqw/rkLDBFN9h70FT0ITznRn+xYGPf+1
   wPeFuAb0iBMZgFPclY3cTPQu8bT8rZS3PleNcZN+lD6gDcv094nQPK2dk
   cC/mYRgtNP0CeqjibWC0mUBpmr/M3p1EKY/0r+lXY9F3hgLoF9z/AZP5x
   A==;
X-CSE-ConnectionGUID: S58eOCIWTDWy6b4KC8tSww==
X-CSE-MsgGUID: WbtYKWITStGqPsJ2C6lM1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67222159"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67222159"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:08:30 -0700
X-CSE-ConnectionGUID: Psky762oSGWT9Xebg7dWIw==
X-CSE-MsgGUID: vN1G9CdjQXOh3FilZV04og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144914007"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:08:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 14:08:19 +0300 (EEST)
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
Subject: Re: [PATCH v6 10/16] PCI/AER: Combine trace_aer_event() with statistics
 updates
In-Reply-To: <20250519213603.1257897-11-helgaas@kernel.org>
Message-ID: <a6260206-a02f-2212-9610-66186d6e26a2@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-11-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-1580202455-1747739299=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1580202455-1747739299=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> As with the AER statistics, we always want to emit trace events, even if
> the actual dmesg logging is rate limited.
>=20
> Call trace_aer_event() directly from pci_dev_aer_stats_incr(), where we
> update the statistics.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index eb80c382187d..4683a99c7568 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -625,6 +625,9 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pd=
ev,
>  =09u64 *counter =3D NULL;
>  =09struct aer_stats *aer_stats =3D pdev->aer_stats;
> =20
> +=09trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
> +=09=09=09info->severity, info->tlp_header_valid, &info->tlp);
> +
>  =09if (!aer_stats)
>  =09=09return;
> =20
> @@ -741,9 +744,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>  out:
>  =09if (info->id && info->error_dev_num > 1 && info->id =3D=3D id)
>  =09=09pci_err(dev, "  Error of this Agent is reported first\n");
> -
> -=09trace_aer_event(dev_name(&dev->dev), (info->status & ~info->mask),
> -=09=09=09info->severity, info->tlp_header_valid, &info->tlp);
>  }
> =20
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -782,6 +782,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
> =20
>  =09info.status =3D status;
>  =09info.mask =3D mask;
> +=09info.tlp_header_valid =3D tlp_header_valid;
> +=09if (tlp_header_valid)
> +=09=09info.tlp =3D aer->header_log;
> =20
>  =09pci_dev_aer_stats_incr(dev, &info);
> =20
> @@ -799,9 +802,6 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
> =20
>  =09if (tlp_header_valid)
>  =09=09pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> -
> -=09trace_aer_event(pci_name(dev), (status & ~mask),
> -=09=09=09aer_severity, tlp_header_valid, &aer->header_log);
>  }
>  EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1580202455-1747739299=:936--

