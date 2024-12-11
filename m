Return-Path: <linuxppc-dev+bounces-3989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C739ED250
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7hG8191zz2ydQ;
	Thu, 12 Dec 2024 03:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733935328;
	cv=none; b=W1jGpt3MN5S9BbZDCU9fyXLeIV6oOo5SCYNHCv1KvpPMudaVxz+GLXnxmr/zx3x3N4zuEuvBPJL5k7pdn3Fv5QwVZZpytraPLykJEpkI+m9PMnnQf1ETY/TFHhdfQMAD2OK1jB6Cog6knKPgLuYQBgAfi27Thhjb2UC2Hhq2ySrRjcYPYo+pEAYW3+fyLSV5m6ReYYaKkPtzWZ0EHNRCE3M4bj0ddV53oZPaK+ihiHjecpwm59XLVJ3KjEpAOpunQz0o1iRGjFmbTUkPyAWBIE9wnXyfJf/BO2hOlpkgS6hF+Jv680BppsrbVqAkDf9YKukv3zx8lYpLlPsyqzTLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733935328; c=relaxed/relaxed;
	bh=FUC8BJaJFGh4VNJK9vqN8iQhdGWQbLwg1ZUHVW/gigA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3LS54qvno3qVdA1wFrmckRUBhR9PsfZ44qD+x3h7soCzDazsaJPuDDXHXexN0JwaTKMEmnlmTCannrpH8yUyu4KY7Eq6t2STHbYvH2q7uiNYXkzBe4DY7nrZk9DQqLuE6ZELogZ8iZEoKf7kgnvH6IUjzTv2/xmkMIOjgItXuN8aEM2Xk6r2UoXiFqDguYh+J5Li9FFwajSFXOmUkr67H2vIsF12Qo1jn/6T2pkfvxHOc21nnwrzu6vNBE/Kgy1/3LTCXH5qVEZXc66JrinJv8uQpRFYUtMuejTDJz1pLyvSz+btTH+b/EZCGLMqSqxJ4akKckezFef+uS/Hk/uOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7hG62YTFz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:42:06 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7gp42hL9z6D9Cn;
	Thu, 12 Dec 2024 00:21:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BABF21400CA;
	Thu, 12 Dec 2024 00:22:10 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:22:10 +0100
Date: Wed, 11 Dec 2024 16:22:07 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 1/8] PCI: Don't expose pcie_read_tlp_log() outside of
 PCI subsystem
Message-ID: <20241211162207.00004bd6@huawei.com>
In-Reply-To: <20240913143632.5277-2-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-2-ilpo.jarvinen@linux.intel.com>
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

On Fri, 13 Sep 2024 17:36:25 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> pcie_read_tlp_log() was exposed by the commit 0a5a46a6a61b ("PCI/AER:
> Generalize TLP Header Log reading") but this is now considered a
> mistake. No drivers outside of PCI subsystem should build their own
> diagnostic logging but should rely on PCI core doing it for them.
>=20
> There's currently one driver (ixgbe) doing it independently which was
> the initial reason why the export was added but it was decided by the
> PCI maintainer that it's something that should be eliminated.
>=20
> Remove the unwanted EXPORT of pcie_read_tlp_log() and remove it from
> include/linux/aer.h.
>=20
> Link: https://lore.kernel.org/all/20240322193011.GA701027@bhelgaas/
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
FWIW LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

