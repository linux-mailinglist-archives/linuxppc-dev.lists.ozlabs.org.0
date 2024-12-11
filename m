Return-Path: <linuxppc-dev+bounces-3987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0819ED16C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7gw420Tlz2xvh;
	Thu, 12 Dec 2024 03:26:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733934388;
	cv=none; b=bQu5A+a7J3nbJA0pLOF+u6U2sEx2ea47GWQmPiiUrbZ3GxaGV8WvfK9gUnG6vKDWoBo8S9OhYxQvitoJa2swZouEmBlwh3vWTC8aQGVf6HLeZDmfCQn2TDOsIogOQsT2Wf7nuL1inbHp/q79mcNt3HPGvSeV3uPFEus4rXooha6RpNegdU/JN9qd5GWSP3bqMaJ5S0e//XsTZ2ABgS8pZKxKqBic3kvUsD09P++C93qcbZhqVtaZe/kj5KSLGZjVRSLzte2rflN+OpdK07UphgPDs1W5sBE2QM40eJZSwSdV/Tx25WQqPWuRE0aV4I2vRlgHPp19LpSPPDU6QpTtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733934388; c=relaxed/relaxed;
	bh=TjwtmRyuULJ+JNo0a8DdJRb63bWXAawkuH/n7S56JmY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrJVVqhQ+tv/cD7tMP/316A3lhxrUvR+LMPUcGf2dumyAmtW7GB7VB4GRR9UscVLLCcjLy9NvqzfpuS039cE94d/n5h+wBwbrheIqxtXa27RLZc3Nd0g21BWV6C1V2tN0BC5CMW71Hq/ZJfrzxofPHw6L95XOehtdIbpdPtrAl6hnfqD6MGqko3QpnHlZtCX7XIj9mG62NHVtO8IE0aR6joHM+4cA7iEhSFCsT6pFqbAaEXwIHej1wOYtadvfX7f/DYMVuVhACnGzS9/ZUCgNZYkUp2iiU4F+KIhTSGY69O0ETuhzCoceeDiP7UpzqM3CLrF225VuSSx+ibzHq/vSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7gw333M4z2xbP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:26:27 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7gpd74z5z6GC4d;
	Thu, 12 Dec 2024 00:21:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D01F21400C9;
	Thu, 12 Dec 2024 00:26:23 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:26:23 +0100
Date: Wed, 11 Dec 2024 16:26:21 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 3/8] PCI: Make pcie_read_tlp_log() signature same
Message-ID: <20241211162621.00007e61@huawei.com>
In-Reply-To: <20240913143632.5277-4-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-4-ilpo.jarvinen@linux.intel.com>
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

On Fri, 13 Sep 2024 17:36:27 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> pcie_read_tlp_log()'s prototype and function signature diverged due to
> changes made while applying.
>=20
> Make the parameters of pcie_read_tlp_log() named identically.
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
Good to clean this up.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

