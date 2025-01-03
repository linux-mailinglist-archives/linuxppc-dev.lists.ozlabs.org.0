Return-Path: <linuxppc-dev+bounces-4644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FEA00C24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 17:38:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPq5H1s2Sz30VQ;
	Sat,  4 Jan 2025 03:38:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735922307;
	cv=none; b=QmLUB2C144nlT2usI9KbcA3jswlzs1o0vFRtrlqacAkhXE5seYDnT004pPZjiUFpwFgR9fOxCLtVvvaIp8LMDk/lFCaAfwWBKf7//wfQ6r/rwuL+OOnXvhe8rlo5hjwG6bwBR/+4EXLBAbhmyw9w7eAe5W3jhSjM1NWYhX3/FguOrqmCgWO3Ib9QcXaGiEApGQj2KBMfvnPx8FGad4u8HdmiQcUnUiHptGA2AIJx2BnMyNIkYD8rcGXTkm3jFQNt0HbaCCr6ToojvzYDGINqyfNMDpWkuuufn5iviuFDSCb+d793GnVdyzJWArfHdFRyreGPXLqp/8dJfXkbb+Rkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735922307; c=relaxed/relaxed;
	bh=ii+D7DuNSjq3GCNvA41DLEPYjkm0oAMOoxLaWaDcmIo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICfukOj8kwLsjJsfnNkn11P9wMpCMTEQk36Kg074OwbOdBLFT5XtTn5XldQ0zXJio0NiU1BUpd8i8LUK2v5Nyov4VK6XvYZIGjkU7Bypk3sTl8HYMgd84MPL1YF1CLq8czHkzsSsjGk0p4CDEf3B7Khm12iuHUmdus3UbfBTyMt7B4vvroIDmsgRxD413VQ/oF3vGbfFNcRS/5bgcukt0cEfLHjwy+KFK07QLJr1iHs+kMUR3buFT96tiXTLwP7w0wI6OaIAeUSH8jNaWjSdtfWZuBaBajTqrpp76LdkIJX3Ve4pxsW7o6O/jKpBFkx7itzzujDRVNfzW1B/rFR3Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPq5G04J6z30VP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 03:38:25 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YPq091Y2Rz6K61Y;
	Sat,  4 Jan 2025 00:34:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A59A1404C4;
	Sat,  4 Jan 2025 00:38:23 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 3 Jan
 2025 17:38:22 +0100
Date: Fri, 3 Jan 2025 16:38:21 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Lukas Wunner
	<lukas@wunner.de>, Yazen Ghannam <yazen.ghannam@amd.com>,
	<linux-kernel@vger.kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v8 4/7] PCI: Use unsigned int i in pcie_read_tlp_log()
Message-ID: <20250103163821.00005521@huawei.com>
In-Reply-To: <20241218143747.3159-5-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
	<20241218143747.3159-5-ilpo.jarvinen@linux.intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 18 Dec 2024 16:37:44 +0200
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> Loop variable i counting from 0 upwards does not need to be signed so
> make it unsigned int.
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Whilst I find it hard to care, it is harmless so up to Bjorn if he
wants the churn or not.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/pci/pcie/tlp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 2bf15749cd31..65ac7b5d8a87 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -24,7 +24,8 @@
>  int pcie_read_tlp_log(struct pci_dev *dev, int where,
>  		      struct pcie_tlp_log *log)
>  {
> -	int i, ret;
> +	unsigned int i;
> +	int ret;
> =20
>  	memset(log, 0, sizeof(*log));
> =20


