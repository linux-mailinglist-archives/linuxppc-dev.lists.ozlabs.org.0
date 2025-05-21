Return-Path: <linuxppc-dev+bounces-8816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62483ABF045
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2RM328d4z3btX;
	Wed, 21 May 2025 19:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747820623;
	cv=none; b=Q3LIn0KyT6Bw3FecRV6TKxOZBAJ+A0eFpKMkY2jS7KTGK7ofVO+cntRPRVlby2XMHvCR2TbnZ51ttkZTWZRKqX1WEGvLjQ3OmzGC3sLihP8X1JYlVdbCgTLluC3QS5DtuLOO26nYOfBg2m9E1EYuJqC0WIz3Vp4CTBJJWhMP/IhtHyBJN8N4AWZADwzzQU+Uk5RVrtHzzB0PoZ9btJjZZIKeWcRq3z72FCfnPpeFhOnFrNY6wfwUj4E/ggAHPkn4rialCEzjzoymOjIPF/zDBcYni9nVJKW+xCr87jxfdrb7revhEukfkuTmYop62Dfa41UHwSquyA/umPB0VFSJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747820623; c=relaxed/relaxed;
	bh=HFYrA7N43vhl8il3udAh0nx//GfeJKhcLQvUSPRxDW4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzwfR6RXWH3l7gU3HMPh20p9/ySOy3afewvyeHPQoYGkeKO0hQpe9myTNrdAwp/d72TN2PthiG4YbfSDBKx/OFnpKD3fp2TEuCvZTo8V/uSDd5JqkoP5k781aAEWplgjp7UUxQ9xM5k9NkVZE/sIiGHEPEBtuxondDgZuVeZTz1LFYlr6HJUYAcU1r+8qo1ByKMFCJqQ4EJiRIf2AGoo15TCmcBNnX8R6dj6R89ySDwLchGN+Uxdg7Ej70aiqWapJZyBPTbhyuW9yvsZNqvHAPEub4tmdkMuM4P5NMAW0Trx8KSAYADQpbz1zOBn6W6fZPJZmpaZ6nzyg2pfdpTJ0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2RM16tFSz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:43:40 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2RHD2zfWz6L55h;
	Wed, 21 May 2025 17:40:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5AF3614020A;
	Wed, 21 May 2025 17:43:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:43:34 +0200
Date: Wed, 21 May 2025 10:43:31 +0100
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
Subject: Re: [PATCH v7 10/17] PCI/AER: Update statistics early in logging
Message-ID: <20250521104331.00001a6a@huawei.com>
In-Reply-To: <20250520215047.1350603-11-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-11-helgaas@kernel.org>
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

On Tue, 20 May 2025 16:50:27 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

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
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>
Always felt odd that a stat got updated in a _print_ function
so even without the other reasoning this is a good change.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pci/pcie/aer.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d845079429f0..53b7559564a9 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -693,7 +693,6 @@ static void __aer_print_error(struct pci_dev *dev,
>  		aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
>  				info->first_error =3D=3D i ? " (First)" : "");
>  	}
> -	pci_dev_aer_stats_incr(dev, info);
>  }
> =20
>  static void aer_print_source(struct pci_dev *dev, struct aer_err_info *i=
nfo,
> @@ -714,6 +713,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_=
err_info *info)
>  	int id =3D pci_dev_id(dev);
>  	const char *level;
> =20
> +	pci_dev_aer_stats_incr(dev, info);
> +
>  	if (!info->status) {
>  		pci_err(dev, "PCIe Bus Error: severity=3D%s, type=3DInaccessible, (Unr=
egistered Agent ID)\n",
>  			aer_error_severity_string[info->severity]);
> @@ -782,6 +783,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
>  	info.status =3D status;
>  	info.mask =3D mask;
> =20
> +	pci_dev_aer_stats_incr(dev, &info);
> +
>  	layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
>  	agent =3D AER_GET_AGENT(aer_severity, status);
> =20


