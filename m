Return-Path: <linuxppc-dev+bounces-8804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA932ABEE96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 10:52:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2QCw38yBz3bkf;
	Wed, 21 May 2025 18:52:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747817548;
	cv=none; b=Fc7cXhy9P6bJTxbTLBy0467NxfHpKp3K3+gWmRXmMCXohoOwxw0J/QRctN4STprfh0fWQCOkyKGu2ms8pwFs7UtCc6IiXQ0fVeJxw//FYvlaDPMxMVRn/fvoQTdHXFAfmCNovBhMbpBU/29/Df1w+yUPABamEfu4w8TAxM/mUD8BgXXHqhn6ZtsQT8i8wFfycFjhWPkpQdCpykXCXiIfGFpca+6GDfOrpN2K52c1vtnsNWoG++q651BJVulQ/dlQLTApSZk8DtvT6Cd4jcOd6C/UI36mMGyy7eiFDyQwXoN4Qm0CHoaskI7Q9SSvs/jocYprIUKIVv4iCrsgCeknmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747817548; c=relaxed/relaxed;
	bh=tlam0s0W3NDQh1bBnP7Bz7mO7SVJY7j0wuTia8ideCs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvUDAAS3dVx0LT0ZJhSPYxazFzGPjvdpYyPbgX81qbuhz2B70iRPFMeOH0Cx+2tyerYFJufF2/0J19tujCEDFoFqXIAep80XemeM0abqfOv76l47mY4A+bnG1tU26c5LzNf/NMF4wix8vymYVh00d/3jGlN/bI5gv5X89uB4R2CFtHa9Gj0HlDCaJt2C0rkvI+DqpYtI7a0WNoJAj9oItrJlM4zo8rJ7T4QrYAgxXL+jC4PnFJJnRJ2iGmaXDoA42onvQ5TAUutxWWet3ei+JJsB/iB0drtbElYLgBKlYDLTu4sR15yk3gJQ+9Lb/mOt/GLO14fGk3xzPayQxX1vKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2QCv3536z2ydl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 18:52:25 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2Q860q9kz6H7mn;
	Wed, 21 May 2025 16:49:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E8D9C14020A;
	Wed, 21 May 2025 16:52:20 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 10:52:19 +0200
Date: Wed, 21 May 2025 09:52:18 +0100
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
Subject: Re: [PATCH v7 01/17] PCI/DPC: Initialize aer_err_info before using
 it
Message-ID: <20250521095218.0000045d@huawei.com>
In-Reply-To: <20250520215047.1350603-2-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-2-helgaas@kernel.org>
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
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 16:50:18 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously the struct aer_err_info "info" was allocated on the stack
> without being initialized, so it contained junk except for the fields we
> explicitly set later.
>=20
> Initialize "info" at declaration so it starts as all zeros.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>

I chased this through a bit and looks like at least some unset fields would
result in garbage prints.  So maybe needs a fixes tag?
info->tlp_header_valid is an easy one to follow as only set in some paths.

Otherwise absolutely makes sense.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/pci/pcie/dpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index df42f15c9829..3daaf61c79c9 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_=
dev *dev,
>  void dpc_process_error(struct pci_dev *pdev)
>  {
>  	u16 cap =3D pdev->dpc_cap, status, source, reason, ext_reason;
> -	struct aer_err_info info;
> +	struct aer_err_info info =3D {};
> =20
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);


