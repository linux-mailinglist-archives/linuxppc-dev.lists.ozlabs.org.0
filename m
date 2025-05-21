Return-Path: <linuxppc-dev+bounces-8813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA0ABEF9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2QxL1TxVz3c2L;
	Wed, 21 May 2025 19:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747819494;
	cv=none; b=WZCf75JG1NQvLnLkxN1N4Fv5XvYCd03FieeZ4frcoeTo5WCFgyikG6dkQBSpuTRA5kacUiEv0LNL2xZaHuOzNP4ouuwG8v8uEgLEHrSTxRCN8tgG5yI+Z8Zksmhg0ppUD4eh5N/1VaIlAXWYYFl+PNZ9NRtOeQlfOF3uXxvETk3EcFNBXDt8KeC9Y3IWycrRGpv8w6PcSccOF+tQIC3LNUwLVrSSBP8RW0fouEL1XvKALUglolWfwIS9KADDteBQTxeHde0dU8z7KY4MH8e2GuoAf5JfsojnK1oPJDQpECqJBMVx9BPkLNAEo9wmzH2Wxh3Ff/2pCs4moMqKzBXj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747819494; c=relaxed/relaxed;
	bh=hmzHA/ou0TIbwe7DOuI/mmtNQgWVAbjXyxrvvyXVYWw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4r3SVDw2tGUtyKAUWOWzojxKPi6B8X2vIfAy6/4Ni7ARo29DWAisyA0rdkihqXVe32t0hri1xtK+82FRvx+pbyx99WcA9Ti10oqa7pDaEFZ0DPTvZcosv4nt1B/tRqj8uywT9l7vMzc06pUPRe+B/d2i6IFih+Rwm8dlMDYZ8Bs0OOTdbAUt4mVL8DUumVZ7n/E4isJjlicv+nnYJHi1F76NfiDmHRtmlMzbhcIgoo85db5/eYbNmX+32ZoEtUjez/ay3I2Q88t2D4qzOhNTEY9Qb0ah0ZKofcP8A0KEPzkGVkxUiMpBAhP4jZDmzlBIz3EACY/BUN+IFtg5XcCPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2QxK1y81z3c2K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:24:53 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2Qqf6C55z6D92Z;
	Wed, 21 May 2025 17:19:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1867E1402FC;
	Wed, 21 May 2025 17:24:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:24:49 +0200
Date: Wed, 21 May 2025 10:24:47 +0100
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
Subject: Re: [PATCH v7 08/17] PCI/AER: Initialize aer_err_info before using
 it
Message-ID: <20250521102447.00000d94@huawei.com>
In-Reply-To: <20250520215047.1350603-9-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-9-helgaas@kernel.org>
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
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 16:50:25 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously the struct aer_err_info "e_info" was allocated on the stack
> without being initialized, so it contained junk except for the fields we
> explicitly set later.
>=20
> Initialize "e_info" at declaration with a designated initializer list,
> which initializes the other members to zero.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com
Ah. Here it is :)  Ignore earlier comment.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


>  drivers/pci/pcie/aer.c | 39 +++++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 520c21ed4ba9..e6693f910a23 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1289,9 +1289,9 @@ static void aer_isr_one_error_type(struct pci_dev *=
root,
>   * @e_src: pointer to an error source
>   */
>  static void aer_isr_one_error(struct pci_dev *root,
> -		struct aer_err_source *e_src)
> +			      struct aer_err_source *e_src)
>  {
> -	struct aer_err_info e_info;
> +	u32 status =3D e_src->status;
> =20
>  	pci_rootport_aer_stats_incr(root, e_src);
> =20
> @@ -1299,30 +1299,25 @@ static void aer_isr_one_error(struct pci_dev *roo=
t,
>  	 * There is a possibility that both correctable error and
>  	 * uncorrectable error being logged. Report correctable error first.
>  	 */
> -	if (e_src->status & PCI_ERR_ROOT_COR_RCV) {
> -		e_info.id =3D ERR_COR_ID(e_src->id);
> -		e_info.severity =3D AER_CORRECTABLE;
> -
> -		if (e_src->status & PCI_ERR_ROOT_MULTI_COR_RCV)
> -			e_info.multi_error_valid =3D 1;
> -		else
> -			e_info.multi_error_valid =3D 0;
> +	if (status & PCI_ERR_ROOT_COR_RCV) {
> +		int multi =3D status & PCI_ERR_ROOT_MULTI_COR_RCV;
> +		struct aer_err_info e_info =3D {
> +			.id =3D ERR_COR_ID(e_src->id),
> +			.severity =3D AER_CORRECTABLE,
> +			.multi_error_valid =3D multi ? 1 : 0,
> +		};
> =20
>  		aer_isr_one_error_type(root, &e_info);
>  	}
> =20
> -	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> -		e_info.id =3D ERR_UNCOR_ID(e_src->id);
> -
> -		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
> -			e_info.severity =3D AER_FATAL;
> -		else
> -			e_info.severity =3D AER_NONFATAL;
> -
> -		if (e_src->status & PCI_ERR_ROOT_MULTI_UNCOR_RCV)
> -			e_info.multi_error_valid =3D 1;
> -		else
> -			e_info.multi_error_valid =3D 0;
> +	if (status & PCI_ERR_ROOT_UNCOR_RCV) {
> +		int fatal =3D status & PCI_ERR_ROOT_FATAL_RCV;
> +		int multi =3D status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
> +		struct aer_err_info e_info =3D {
> +			.id =3D ERR_UNCOR_ID(e_src->id),
> +			.severity =3D fatal ? AER_FATAL : AER_NONFATAL,
> +			.multi_error_valid =3D multi ? 1 : 0,
> +		};
> =20
>  		aer_isr_one_error_type(root, &e_info);
>  	}


