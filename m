Return-Path: <linuxppc-dev+bounces-8820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910EABF09B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Rhz5mCCz3c2K;
	Wed, 21 May 2025 19:59:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747821555;
	cv=none; b=RkBgr9VGc1YEy3zBaBCPqR96pqaJ0VZ+Dlcm1CVP3kd5nolssJ1aP0xVm6gSNbysMuYRCWvM7AKjl3jFkiAHNv0OcW3HAoKOm/0D/rvjelY6xGBgpfs+GjDycMDt2hUMlX/CjH6q/empWYXAvXTrcfUuzPNn15PoTMamgiYjzHnDrq2W7h6bYNJiz7592L6e78DTTmNuWbyNagJsqI7iRpVUQrJQeU8B89XNQ7QUhtuHuD+JGWXMxiXb3YZDzJL1Aw/qzXGDuvyAa7deF33z6JEYGC1fiHGpAvOP66z/Dm5JP1ahGk5bIYTJxdbIfHHvIpobCZmvpZEFy5pawmWDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747821555; c=relaxed/relaxed;
	bh=aVKNovIlIgiN/Yt2TbWAYza/i7PM9bMGgpl9JyNT0kQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzxL2kyxnXGAxUxHt6J4BYb0nt0aZ6OURLfzuHfNsCzv+wqfhtsH+tGHcdPsA2Q3fS5blT4HAQpb6qv/mWMDUOjpSaSX5QS4xgeT74HzipwqH/Zv3PKbhn3T97k9DyLwa/UCNv5213OcaK+5yPDZqyc41oW6rekOFaGK+US0YxzGmh2fqoW45s3jw2miQbs3LPQdYSi0jegJU/m5DjLXn9sCoBD2syPA/5gahbgub6S7hHh+ldUIccfeK38oAGYFjHye3QSqfv1jdbBHoh7axxqHmK7KsoBPC/XxjtLgrKQGjPp9Gjc3Yj/AT3dmFTw+vFnpypMqZ+egaZ6AppMbKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Rhy736Rz3c2G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:59:14 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2RbJ47krz6D9XP;
	Wed, 21 May 2025 17:54:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D13AE140557;
	Wed, 21 May 2025 17:59:11 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:59:10 +0200
Date: Wed, 21 May 2025 10:59:08 +0100
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
Subject: Re: [PATCH v7 14/17] PCI/AER: Rename struct aer_stats to aer_info
Message-ID: <20250521105908.0000622b@huawei.com>
In-Reply-To: <20250520215047.1350603-15-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-15-helgaas@kernel.org>
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

On Tue, 20 May 2025 16:50:31 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Karolina Stolarek <karolina.stolarek@oracle.com>
>=20
> Update name to reflect the broader definition of structs/variables that a=
re
> stored (e.g. ratelimits). This is a preparatory patch for adding rate lim=
it
> support.
>=20
> [bhelgaas: "aer_report" -> "aer_info"]
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

