Return-Path: <linuxppc-dev+bounces-8817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98053ABF063
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2RQj24l5z3c0n;
	Wed, 21 May 2025 19:46:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747820813;
	cv=none; b=ekAE0rILJHTKJC+3YsIGREcb+z1q7I5iksdMk4P8B1IMVM+9+0SlY8vVDevoAhEpOVWNdmIGBOTiXfql+XrpMA80DsZeCVnBSTScDwDLFplFRvEHzxJ1zuQH8XN0Wb7f4BjM1JZbSvaNQ3CIhg0AsBuWmtaqsCHCsTR+THVKjRI3N7bJf4nkO7rIUhBgusUB/7DopTabCc5uU6SRJ9K/FtCSiNjnAGIRTG97KWe1042E037Rtq1NTzgbPDTLNiiDMvP8kQ707ANlOelKWtc049CDgf59pZRIKkd/VSCTEa7bQt3aG7OTozW+G6E/xI/3dGfjft8mZNMmMQ3ZpVLlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747820813; c=relaxed/relaxed;
	bh=Jlcd4MM6Bt3SnRP4YHH5XeiydF/pwtD0MVd3dz4QGbI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DADk9hzcLTIYR3v3dHX3ighRMgICCWT0rO6TqfSv9+XUaftGxfkNHer/oQWXb9qPt+WpvW0KvWvVZm2sx89Sdoj3SJ5WQX78j65u3ooZt3eWAfkkms8Gi/YLt5qwd7ftKFFThiuDUDznKH/YdFe+kD8eXguom137WNfNt0YqGjdLnkcMH1xvhuZwSKgM8REBL6Y86i5g1qOmrTcWZKtUKmUO7tBFgCuVvUaLsa7RZQKqgC4S9FTnsYz/I8MUS3REfzC9DlldwPhiiV9vuAXIoPd69V2YEXQVMwHz2anJxg39ieX+ynAVPURVT930jdK/DwV7nZvXkyQp/M97dNt+tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2RQh14fhz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:46:52 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2RK14kKNz6D9ct;
	Wed, 21 May 2025 17:41:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D890F1404F4;
	Wed, 21 May 2025 17:46:48 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:46:44 +0200
Date: Wed, 21 May 2025 10:46:42 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Jon Pan-Doh <pandoh@google.com>, "Karolina
 Stolarek" <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller
	<ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, "Anil
 Agrawal" <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, Ilpo
 =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Sathyanarayanan
 Kuppuswamy" <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver
 O'Halloran" <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, "Keith
 Busch" <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, Terry Bowman
	<terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, Dave Jiang
	<dave.jiang@intel.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 11/17] PCI/AER: Combine trace_aer_event() with
 statistics updates
Message-ID: <20250521104642.00003648@huawei.com>
In-Reply-To: <20250520215047.1350603-12-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-12-helgaas@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 16:50:28 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> As with the AER statistics, we always want to emit trace events, even if
> the actual dmesg logging is rate limited.
>=20
> Call trace_aer_event() directly from pci_dev_aer_stats_incr(), where we
> update the statistics.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>

Hmm. This runs a bit counter to what I liked in previous patch.
Whilst convenient to issue trace points in the stats update function
it's not obvious behavior given naming.  Maybe just duplicate the call
and call it immediately after the pci_dev_aer_stats_incr() calls?

> ---
>  drivers/pci/pcie/aer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 53b7559564a9..ec63825a808e 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -625,6 +625,9 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pd=
ev,
>  	u64 *counter =3D NULL;
>  	struct aer_stats *aer_stats =3D pdev->aer_stats;
> =20
> +	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
> +			info->severity, info->tlp_header_valid, &info->tlp);
> +
>  	if (!aer_stats)
>  		return;
> =20
> @@ -741,9 +744,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>  out:
>  	if (info->id && info->error_dev_num > 1 && info->id =3D=3D id)
>  		pci_err(dev, "  Error of this Agent is reported first\n");
> -
> -	trace_aer_event(dev_name(&dev->dev), (info->status & ~info->mask),
> -			info->severity, info->tlp_header_valid, &info->tlp);
>  }
> =20
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -782,6 +782,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
> =20
>  	info.status =3D status;
>  	info.mask =3D mask;
> +	info.tlp_header_valid =3D tlp_header_valid;
> +	if (tlp_header_valid)
> +		info.tlp =3D aer->header_log;
> =20
>  	pci_dev_aer_stats_incr(dev, &info);
> =20
> @@ -799,9 +802,6 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
> =20
>  	if (tlp_header_valid)
>  		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> -
> -	trace_aer_event(pci_name(dev), (status & ~mask),
> -			aer_severity, tlp_header_valid, &aer->header_log);
>  }
>  EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> =20


