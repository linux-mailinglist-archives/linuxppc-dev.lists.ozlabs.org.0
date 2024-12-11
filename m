Return-Path: <linuxppc-dev+bounces-3993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8A9ED2EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7hdg0VKrz30TC;
	Thu, 12 Dec 2024 03:59:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733936343;
	cv=none; b=oLyo5RDPcuwvXmTCrPqFqhoXUwMdfM+suQqLtqvcGBKbnBttnnyThqHRdGZ8XeLA9Cuh/q6TBwvZw0jXQ2HZIQpIdl/YwSj7fTTHDlseKK87ho6LxAnHSy00lolRiuXbyuoxUi7ARP8y514RlEgmH3uf48BFrrepsMqEFzamxUcl7zHb1+VMX+jyDMwMHyjGFZq2DoBG8X0ENOzTaJCA5ztr/KV3TbMZ9XNtHVlpwtMZYMU6KeF1LFvwto0jFluKD/2Lchc/jVMZB99kvvdJCiz9Rf+OMNI8DHmHqAWE+qgzcgGf0apE5bHW0xC6OJptHOvoJkbRLcowUKmjFhL5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733936343; c=relaxed/relaxed;
	bh=RhoBSQ82c7FvHa7SXNgLz9qnA6S2zwz/ZormGDyMcNo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JUNPUsUNqutNBx4uP+qTEZFJ//5MJyKCyxcx6k/kuJAAY9BftgLritF+JC/zyj68xE036zZzWNZ9I7JQ5OgIaT/3IFwum2tF8s12XdCqm7J/Qq2utnOJJgrv8lJrQYR5yj/lbbTzh4VH/Ax+FRyj9OEN2TfAiIEUbrFinruYuepW1+yStfAkU4ktQ6QtfZ9E4l6YWmVjDRDL/ZehZw2GrRz8sGiKvQ5a1HEhGQg4kFDimHVSZfC0pWEM51NVqMq29uOK6gnDxOdSq+6SfwPRSbTRilpEMO8El4FTqUkZ7MVNwObuaGZ2Jjhxeeh64RqQkKvQTspU3dx2eJQ1ZWsnDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7hdf1QGrz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:59:02 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7hYn1dd4z6D8dq;
	Thu, 12 Dec 2024 00:55:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B47E1400C9;
	Thu, 12 Dec 2024 00:58:58 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:58:57 +0100
Date: Wed, 11 Dec 2024 16:58:55 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 4/8] PCI: Use unsigned int i in pcie_read_tlp_log()
Message-ID: <20241211165855.000064f2@huawei.com>
In-Reply-To: <20240913143632.5277-5-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-5-ilpo.jarvinen@linux.intel.com>
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
X-Originating-IP: [10.48.145.145]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 13 Sep 2024 17:36:28 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> Loop variable i counting from 0 upwards does not need to be signed so
> make it unsigned int.
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
To me this is unnecessary noise, but it's harmless so no problem
if you really like it.

Jonathan

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


