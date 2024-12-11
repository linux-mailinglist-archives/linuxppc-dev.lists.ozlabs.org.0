Return-Path: <linuxppc-dev+bounces-3990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4609ED299
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7hQM0QWdz304Z;
	Thu, 12 Dec 2024 03:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733935755;
	cv=none; b=T9RO2l1zwzGCihQMPLAEhfOEQG4CQ0HEYArtBknx8Q0UIkI4tG+nPrpxEVNuMwzDNJSzNDvy2bod1wra0I9DwdPxvEAsDF5ED10QF4qjB47m2RITG0iav/eWg7s9S7IjpId5XvqGxBxm9elvDPJZ+S/Z/bfpcGGT47WE6emIUjhKpp6uTkx51M3uEFndqb2WPyrZ+EmRPY9+l89zFUk9OCwhX+c0ibauNC1L4sACPxE8loa+pGf6NtMOFoNs+bQMo+QQ9qvps07paYjlI8TXkVGiVka6U/tLI2VYBIad7q1OxP+CilX0ZiqcGJAcw/V06dkA5vOYA/GUCD4oFgvG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733935755; c=relaxed/relaxed;
	bh=2vQM9g1xnkHyV5Y4uvX6cu1jZflOtluqtyss61LqcVY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Flo82UOP4NWTlRB0/1Z2dAohDEGbnzp89W4CSmKvSo47TIfWeuVMS7bYmVK+6a369rkcKkvIj9YNi5RfsJ/IA554YMxjWu3uz5OxS70ENcozGZrcKi72jhvZwYT6wYtbr0Hp247hiDwe+MXMUq90698mD9yaTffJ0UM73v9Ns/mvNSA5ZiAVQu4s5Qywx/CKCXbVO8hFP7xQ5ctNQ66eSqu5QEDXcfWdUb+4JKu77OrX5dCnShhvXRynLdP6zMhQE4VomRq7SgXV+03M11dM1xxx+hJos1wEadjAVlEZUDZioppc3RBK4Gt3SsOkVKk+VACKeb1a70UgUGkBekRgXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7hQK3K63z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:49:12 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7hJs0Zmqz6K5t9;
	Thu, 12 Dec 2024 00:44:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F0FBD1403A2;
	Thu, 12 Dec 2024 00:49:06 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:49:06 +0100
Date: Wed, 11 Dec 2024 16:49:04 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 6/8] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
Message-ID: <20241211164904.00007a02@huawei.com>
In-Reply-To: <20240913143632.5277-7-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-7-ilpo.jarvinen@linux.intel.com>
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

On Fri, 13 Sep 2024 17:36:30 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
> (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
>=20
> Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> TLP Prefix Log. The relevant registers are formatted identically in AER
> and DPC Capability, but has these variations:
>=20
> a) The offsets of TLP Prefix Log registers vary.
> b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
>=20
> Therefore callers must pass the offset of the TLP Prefix Log register
> and the entire length to pcie_read_tlp_log() to be able to read the
> correct number of TLP Prefix DWORDs from the correct offset.
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Trivial comments below
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Would have been nice if they'd just made the formats have the
same sized holes etc!

> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 65ac7b5d8a87..def9dd7b73e8 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -11,26 +11,65 @@

>  /**
>   * pcie_read_tlp_log - read TLP Header Log
Maybe update this to read TLP Header and Prefix Logs
>   * @dev: PCIe device
>   * @where: PCI Config offset of TLP Header Log
> + * @where2: PCI Config offset of TLP Prefix Log

Is it worth giving it a more specific name than where2?
Possibly renaming where as well!

> + * @tlp_len: TLP Log length (Header Log + TLP Prefix Log in DWORDs)
>   * @log: TLP Log structure to fill
>   *
>   * Fill @log from TLP Header Log registers, e.g., AER or DPC.
>   *
>   * Return: 0 on success and filled TLP Log structure, <0 on error.
>   */
> -int pcie_read_tlp_log(struct pci_dev *dev, int where,
> -		      struct pcie_tlp_log *log)
> +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> +		      unsigned int tlp_len, struct pcie_tlp_log *log)
>  {



