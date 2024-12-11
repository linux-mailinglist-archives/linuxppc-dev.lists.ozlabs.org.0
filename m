Return-Path: <linuxppc-dev+bounces-3986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545069ED162
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:26:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7gvZ1VB7z2xmk;
	Thu, 12 Dec 2024 03:26:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733934362;
	cv=none; b=C66FpYFtQc79CvC8p+Xce5s62GoKke4vbV1okQSfJPtt6kqupBMf2BSoXbEUx7Gy/aP4iSAO9Vt5UG+r4e6YyQUq1l3AuTrOCgUx2+WUIrIo04y+j/XuRiOih3eS3WZ9xqu9o2jRHu/szpYmowdyWkoKUM3NY9efU7ZQFXS1FD4O0FgFi5SVungrMlyrWITpagFnPOojUhIYDq40NYYWD6Ez/9bbeg1sAgRlgHWAq4Y6vH5IL00IFDIzIhZww+Wh7wzMJLS7oJLMAeW6Je7cnEP5zsfz1pYuQH07Og3r9hW2Log9uAH8+I3D5j4mzOetwAs4qlSTmzTcaoG/gqeQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733934362; c=relaxed/relaxed;
	bh=hPQ8VXlwA8GOB1w3iWzAiNzFcsHRJ+KDLPEtj88gxF8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6StSeKn8bYNBVth0nDR1Shym/ADawlffw5g4JxQuyR9pEyIqqd/sVqXYaq8gbClyS0hyr4dpVrv3pqbLu9MhApvbbUEYv1LkN1A6QYMYCuI6cYl0ad4FKn5ilEnKyINPbVdel8r8qq28N8nW4tXcGGt+7yGsA6u70BGs1BPUNMIMAAIdmlRvY+i/0zFu0pQrjQKAjmt2TBEswSI/tJ88T2TsJZozAUrJsAxRsef1Hdg31Dd2lNzma5sNHQ79vQSnBRxr3eCQNupNCLjyaQ24zgqCrlSdNvakWhwwM+lhV3YSdBmGB37gF2Zvxz/AMAUuRs+6PZHOShUyzQ02HYaOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 222 seconds by postgrey-1.37 at boromir; Thu, 12 Dec 2024 03:26:00 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7gvX6B48z2xbP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:26:00 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7gqj1gmpz6D8c1;
	Thu, 12 Dec 2024 00:22:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F071B140AB8;
	Thu, 12 Dec 2024 00:25:57 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:25:57 +0100
Date: Wed, 11 Dec 2024 16:25:55 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 2/8] PCI: Move TLP Log handling to own file
Message-ID: <20241211162555.00000968@huawei.com>
In-Reply-To: <20240913143632.5277-3-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-3-ilpo.jarvinen@linux.intel.com>
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

On Fri, 13 Sep 2024 17:36:26 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> TLP Log is PCIe feature and is processed only by AER and DPC.
> Configwise, DPC depends AER being enabled. In lack of better place, the
> TLP Log handling code was initially placed into pci.c but it can be
> easily placed in a separate file.
>=20
> Move TLP Log handling code to own file under pcie/ subdirectory and
> include it only when AER is enabled.
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Can sort of see this might get used outside AER sometime in the future
but for now this seems sensible.

Jonathan

