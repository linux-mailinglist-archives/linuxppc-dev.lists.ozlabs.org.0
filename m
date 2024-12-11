Return-Path: <linuxppc-dev+bounces-3988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E469ED225
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7h7t4hfJz2yRZ;
	Thu, 12 Dec 2024 03:36:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733935002;
	cv=none; b=LsLw9CbI/l8k+XL92l3qwWYGmAjDMkRWqoXQTcNQFUad48+PaKzOim4aUvSCgg0F41n11PwclVkr0ymkLhyFnQZsSxx1TYRMBijetfQyzhK3mhCR2NMNHtLRRo+8rNPaOsYMiJadeoeINIZFAsUw4zF2i4gPKLz0uIEGS75iO399aU9dnQ1E2dnE29b06rjRIZcwEPbUdHPW8KUAWD3vbBosl5Ja8CNFFDS4yho823yDw7//uOV+pznroBnM0qSClvQ3FHcMZpt6x76bXJcZAiE/X6l7nZvmh+U5cgPHP/Tq/qYzH5A/kNcpnk3ku8YRB+Y0Clza+LE/CLvt12BkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733935002; c=relaxed/relaxed;
	bh=aQV5OgIgkDh6LDDVc+p+5YkyubYhZZJkE1nmCFnI/mc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THlVjp60SsAY+BLubhHLj+kFIoqrpTGFWSulc538QqQtsHvt6Hg6daAp17kwmH6jTNjujVYXWxkWaR2gKtHxVJVdwc/mnBr9rD+P2NHOEKxRXbihveV9auJYGh7U8T3izCX+FH7gch6cn/eBepwyjbHj89ED76A3h3TkNQGfif7swdC460T2QASEZhcnEma8oxvPYsF1AXhPc7NgWuIjKfayM7riA0ZtPxsbd/XadZSm2tVd2NFQLZhME2DRiaBtPpdBs3uFyLsTnRr0zexLyT+Bow8L61R56S5Ifr9rHCeEwBwKszipRhzWvxRRT8YL67yLVhOfvbHjDMjykBaHIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7h7q0nXwz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:36:36 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7h2L3n3mz6K5mB;
	Thu, 12 Dec 2024 00:31:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 63AD21400CA;
	Thu, 12 Dec 2024 00:36:32 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:36:31 +0100
Date: Wed, 11 Dec 2024 16:36:29 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 5/8] PCI: Store # of supported End-End TLP Prefixes
Message-ID: <20241211163629.00002937@huawei.com>
In-Reply-To: <20240913143632.5277-6-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-6-ilpo.jarvinen@linux.intel.com>
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
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 13 Sep 2024 17:36:29 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> eetlp_prefix_path in the struct pci_dev tells if End-End TLP Prefixes
> are supported by the path or not, the value is only calculated if
> CONFIG_PCI_PASID is set.
>=20
> The Max End-End TLP Prefixes field in the Device Capabilities Register
> 2 also tells how many (1-4) End-End TLP Prefixes are supported (PCIe r6
> sec 7.5.3.15). The number of supported End-End Prefixes is useful for
> reading correct number of DWORDs from TLP Prefix Log register in AER
> capability (PCIe r6 sec 7.8.4.12).
>=20
> Replace eetlp_prefix_path with eetlp_prefix_max and determine the
> number of supported End-End Prefixes regardless of CONFIG_PCI_PASID so
> that an upcoming commit generalizing TLP Prefix Log register reading
> does not have to read extra DWORDs for End-End Prefixes that never will
> be there.
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/ats.c             |  2 +-
>  drivers/pci/probe.c           | 14 +++++++++-----
>  include/linux/pci.h           |  2 +-
>  include/uapi/linux/pci_regs.h |  1 +
>  4 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index c570892b2090..e13433dcfc82 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -377,7 +377,7 @@ int pci_enable_pasid(struct pci_dev *pdev, int featur=
es)
>  	if (WARN_ON(pdev->pasid_enabled))
>  		return -EBUSY;
> =20
> -	if (!pdev->eetlp_prefix_path && !pdev->pasid_no_tlp)
> +	if (!pdev->eetlp_prefix_max && !pdev->pasid_no_tlp)
>  		return -EINVAL;
> =20
>  	if (!pasid)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index b14b9876c030..0ab70ea6840c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2228,8 +2228,8 @@ static void pci_configure_relaxed_ordering(struct p=
ci_dev *dev)
> =20
>  static void pci_configure_eetlp_prefix(struct pci_dev *dev)
>  {
> -#ifdef CONFIG_PCI_PASID
>  	struct pci_dev *bridge;
> +	unsigned int eetlp_max;
>  	int pcie_type;
>  	u32 cap;
> =20
> @@ -2241,15 +2241,19 @@ static void pci_configure_eetlp_prefix(struct pci=
_dev *dev)
>  		return;
> =20
>  	pcie_type =3D pci_pcie_type(dev);
> +
> +	eetlp_max =3D FIELD_GET(PCI_EXP_DEVCAP2_EE_PREFIX_MAX, cap);
> +	/* 00b means 4 */
> +	eetlp_max =3D eetlp_max ?: 4;
> +
>  	if (pcie_type =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
>  	    pcie_type =3D=3D PCI_EXP_TYPE_RC_END)
> -		dev->eetlp_prefix_path =3D 1;
> +		dev->eetlp_prefix_max =3D eetlp_max;
>  	else {
>  		bridge =3D pci_upstream_bridge(dev);
> -		if (bridge && bridge->eetlp_prefix_path)
> -			dev->eetlp_prefix_path =3D 1;
> +		if (bridge && bridge->eetlp_prefix_max)

What happens if they disagree?  That is the bridge supports 2
and the device 3?


> +			dev->eetlp_prefix_max =3D eetlp_max;
>  	}
> -#endif
>  }



> =20


