Return-Path: <linuxppc-dev+bounces-8819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544AABF08A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2RfZ0bl6z3c1C;
	Wed, 21 May 2025 19:57:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747821430;
	cv=none; b=ZotmmYdwglVj+QC0QdtSle1emYbQoOB+sDUcAIoDVtfqlWW1THPbfWf+XWLHPRYG7uU25h0Cm2qKxIRkLlg8fBLkuRAwqcEohhLfrhuu6qvBTuhhICl+WIXo+ob/EGyhdwJMf3qCMrOhEGBbdvE+D2P+I03ZQ1uyzAxVQ0lxB2RXiEhh1TaKc9SvRnPGW/PrWGFugS4ofbaqUOnqvm+hEuiSXiiqkJXY8shAodvBeaQB3Zuc2MoxVCdtH2IGLigtPmk++6I39+0rnwH/cFENLiTCfWxYRbm949VYQZPsG9DbRHgeLTVUBANTOOcUXJK2e6ZAywJty1axy+4Y9Ar9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747821430; c=relaxed/relaxed;
	bh=shYl5slsyLlXvDU1fRn0/169R4wJalRqpBVGHmRm/3Y=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxRoUbiOhuITxybErcyujVQvoHszYB0tHa+jUb0syIQd/Hc2iTKscsLP84SAlsKkXPECLEvXBh04EcxpI4iITkJlEAcb1vxyAfIWuludPpxNaRFjcUNL5jcsDf+rZ+GIoblHzRXxDko8x2Ha0k/TKhEarZFPleBSh39r0YfJOvQIN166xiQDT6jH1ABDtIEeoFguM9annVmZlxuzOL23EwJ7AfPnkJv7Eod4eBx6Lo3vMZ6WFvmcLBEm2z5lgb+FYz6Qatxr7G3wU4liljsna/t59qhj+Pe0x4yQJgLQPSThqyolM50DSDGdD62yKRviiQgzcCZkcfklDUhgFlYuyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2RfX70LZz3c1B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:57:07 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2RZl5QMtz6L5BP;
	Wed, 21 May 2025 17:53:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BAC101400F4;
	Wed, 21 May 2025 17:57:02 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:57:01 +0200
Date: Wed, 21 May 2025 10:56:59 +0100
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
Subject: Re: [PATCH v7 13/17] PCI/AER: Make all pci_print_aer() log levels
 depend on error type
Message-ID: <20250521105659.000064bd@huawei.com>
In-Reply-To: <20250520215047.1350603-14-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-14-helgaas@kernel.org>
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

On Tue, 20 May 2025 16:50:30 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Karolina Stolarek <karolina.stolarek@oracle.com>
>=20
> Some existing logs in pci_print_aer() log with error severity by default.
> Convert them to depend on error type (consistent with rest of AER logging=
).
>=20
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

One comment inline. It is painful to have a non trivial comment
that says we didn't pass a parameter for 'reason X' when maybe
it would be simpler to just pass it and not care that it always
takes the same value?

Either way this is fine.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pci/pcie/aer.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f5e9961d2c63..4cdcf0ebd86d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -788,15 +788,21 @@ void pci_print_aer(struct pci_dev *dev, int aer_sev=
erity,
>  	layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
>  	agent =3D AER_GET_AGENT(aer_severity, status);
> =20
> -	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> +	aer_printk(info.level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +		   status, mask);
>  	__aer_print_error(dev, &info);
> -	pci_err(dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> -		aer_error_layer[layer], aer_agent_string[agent]);
> +	aer_printk(info.level, dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> +		   aer_error_layer[layer], aer_agent_string[agent]);
> =20
>  	if (aer_severity !=3D AER_CORRECTABLE)
> -		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> -			aer->uncor_severity);
> +		aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
> +			   aer->uncor_severity);
> =20
> +	/*
> +	 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
> +	 * tlp_header_valid is set, and info.level is always KERN_ERR in
> +	 * that case.

I wonder if it's easier to just pass the level in than have the
comment?

> +	 */
>  	if (tlp_header_valid)
>  		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
>  }


