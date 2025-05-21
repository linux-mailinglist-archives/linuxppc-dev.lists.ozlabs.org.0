Return-Path: <linuxppc-dev+bounces-8811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E77ABEF8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:22:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Qtp0NbPz3c18;
	Wed, 21 May 2025 19:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747819362;
	cv=none; b=nPk41TqwfHk4OzHErrdqVuAX2V04yVIWOjJ/L1IUPbmFRwmnDmSp+Jm1Jnp76TFtizofZFLQmGs+YlfE+WMDbLrqBNWQYMHR7qKwQQDVCmBIfL/O5DlYjWOqJIIhEticsF3Q7lGDwvLhyM1EgnJzz4UadrZ4gjPSb3quXfy14HhqbiB8T3MCTqk8uF60TBFZbXKoMtjL5EPjKUA1XqZRmrocmhrefnEzIYnhCDAT2FzDjsCIxuI7xBFFat6/NrYYJgZc58zTjNKyo79K7yfezJ0eINS+keLjDQnLAVjjbaJxD+KOa4Pz2ZGmllE0PIW82IRJsq6hHXMffnKs/22AcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747819362; c=relaxed/relaxed;
	bh=bCmT3vfeUi4izEBzYuy7AQHOHeQpWT2kMw2gXQ95Ijk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qtl1EG2PgLOMHbUHmjbYuYfAX3Qv+yWOlfUjK4uHmD1EqsDLvslV3QiLcDybABTjg4o948EGCv6t+mbO+hLJRSQZFVIiNbfi4LxauQpib8yh/4P6DbiOWGqhm5Uje5nxZ673GqoZ1RGe3rETMIscD/8tp+7JEwSrH03ssf6v6jMiu6qn+HJcewy+IC+oprP9jCVaeSahsnHNVddjkMMdxb5u0D0um7NYBLijGhFON55nGHOBJ4sI/E1fZ43zyDoxbflM5kMyVemEWPs5T8IBZnlgTwRfyp/FWqtBSTmjA+y8Q8d1PyJRufEBXguhH7IZ0UvbG+uCv7PdAhqoVWcQsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Qtn0WSpz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:22:41 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2Qn60w5Xz6D9Cy;
	Wed, 21 May 2025 17:17:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 597331400F4;
	Wed, 21 May 2025 17:22:37 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:22:36 +0200
Date: Wed, 21 May 2025 10:22:34 +0100
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
Subject: Re: [PATCH v7 06/17] PCI/AER: Rename aer_print_port_info() to
 aer_print_source()
Message-ID: <20250521102234.00005ba9@huawei.com>
In-Reply-To: <20250520215047.1350603-7-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-7-helgaas@kernel.org>
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

On Tue, 20 May 2025 16:50:23 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Jon Pan-Doh <pandoh@google.com>
>=20
> Rename aer_print_port_info() to aer_print_source() to be more descriptive.
> This logs the Error Source ID logged by a Root Port or Root Complex Event
> Collector when it receives an ERR_COR, ERR_NONFATAL, or ERR_FATAL Message.
>=20
> [bhelgaas: aer_print_rp_info() -> aer_print_source()]
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>
Makes sense.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

