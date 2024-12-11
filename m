Return-Path: <linuxppc-dev+bounces-3992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A089ED2E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 17:58:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7hcy1l4Fz30RJ;
	Thu, 12 Dec 2024 03:58:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733936306;
	cv=none; b=a6uaX+GdaUtH8LYILpnkm/Nda5rkt54XSZP8KCrYZ4EHD0N62DzaT9MtEuOADYUOODnvV60R5CG0gneLihPQqQjMWoS30nbMgh+A3Vz/BgwsP2k86nkVlgMySm27uR9vUP2r5Abvc+Bn+i0V5Kmsu0eQSfJMWk9WFsR9671B/kgIX/bRz0Xo2ItcxnIDH9GskWClhg80UB2++GWAOtvPKvfyaf9Oy1TxlHcb/BJwfbZ2rnQnrUSYP49DmnFDGn3Ya3QneTeePHPtL47okLWpwh/H51ubRkqlgEeDwu+GIpGPVscn8gjq6ye6EPCmj4CeEA1LijCNxg0zWnYKM/HCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733936306; c=relaxed/relaxed;
	bh=YsSQ5PWOqY1DjPncfWijRqa6XfvetZCZqlLKKbI1uIE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FJ4E5CJlcCY3lzvxtBY+RmAb30z5/yc5XNPQLDPnHBxbxs8VUa12EBQGPWhBfrPFN68GplItGOjk48XaVpkgeyIRGUmkA39b9zhRhFESWhkck/IyAz97OeXmMJTo7YXvXESmWCCBhGMiT8Wo13MY5um6jpDxVZBZUQ5tQJxsWQ515D/I9QkBe3HW1IniCz/qlh7JFdtb83ZGgolLH4WKI/n6eIxe1tjBE0qJQtgZMmPH9/gmU1lc0XdpMyUxK1RKAnRRxj01VHdoi0lKcfJn9Tt2UOycWxLcm2R8++HdfJNNLE6rD+QHNl0kEQylRmW/zoVaNpsuYnhLDVghQYp1jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7hcx24WHz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 03:58:25 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7hWX3H1Hz6K6KJ;
	Thu, 12 Dec 2024 00:53:44 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EB781400CA;
	Thu, 12 Dec 2024 00:58:22 +0800 (CST)
Received: from localhost (10.48.145.145) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 17:58:21 +0100
Date: Wed, 11 Dec 2024 16:58:20 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 8/8] PCI/AER: Add prefixes to printouts
Message-ID: <20241211165820.000014fe@huawei.com>
In-Reply-To: <20240913143632.5277-9-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-9-ilpo.jarvinen@linux.intel.com>
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

On Fri, 13 Sep 2024 17:36:32 +0300
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> Only part of the AER diagnostic printouts use "AER:" prefix because
> they use low-level pci_printk() directly to allow selecting level.
>=20
> Add "AER:" prefix to lines that are printed with pci_printk().
>=20
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
Makes sense.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

