Return-Path: <linuxppc-dev+bounces-9070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F575ACA898
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 06:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9h8G48Tkz2yMw;
	Mon,  2 Jun 2025 14:44:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2c18::80a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748839470;
	cv=pass; b=RJ7r+a1/hmp4g2uwYo+hX9cA6uQcwE8CqnV6cbxEHMfS2Gz2IvG8KEql3NoeGunugd/2xmLRmqviiibWA0aq2qDFqYms59bOqC/knx5U+Gy6tSf/xnmZdYBrz7fSx4yNnt/yl8j1cnrbw+gFk0U3cxAQm+EJooeINUW5TXkqSCRD4V3fl08Ht6oH7Q1g+twfF5zYCpahyiZbGk121ZewNeUY3XBvOGJmcLUdD4H8GYYxIuMMeD5SbzqWTySlnOuysy8sLJanVl5Dgh8k0RsTibNfuub8IimMYY+0yA/07UezAlAQCnI+QUXoujLy1kAIRxy36ztP+lzFNqJIKf/hqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748839470; c=relaxed/relaxed;
	bh=2RiWgaT1/3iPDhMFBF9I6gIdQAEfK5PtrRIYH0B1qGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dDYEL+CKRAteb66p158qeOl+HUZnPuexKgxcrRVqY1rSDukjgEuUO/t5DWoKVt/tX7Gwj93QKY2AkVOnEkB8Z8GRSqo019sKi81gyrJ6UPxdGV9FibF3ZDkWOqNItPbunGpCbaWVCCfaKJx/rwscZqOE31wvaqq0IxLX3fM3PHUfwhFQR39yEuFrTAniHRA30SyTRGwy2JuRRazKeKephGkGr62VCeoO7T62hAB6z5H79k32evziLkxFXkP2x82+p8FGkBzShfAlz0+O4V78s4Qv92zscoesytAFcpwopLMal4+fd8pwjRiLj/tQljFPuYdn3ZyYrmDF253DrEeyKg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=W5klesxR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2c18::80a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=W5klesxR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2c18::80a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2080a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2c18::80a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9h8F3Jwyz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 14:44:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/C2Bh/B8KSrN30o2qebscTb8/AeCRd7nE0as+9T1NKBiWHzj+wrKPNt2ELc2ythMA807kaKG7q18eAyjG6O0DIzsPEEk315UwTTmNlb300r+qHck/DnPtgglTwNE+ZkItTAbzeaeGPlMc7inrGWWeJBjX5n20ESAHeg7eGWTPiZLGollBydvFrgDjemGsPR2Ie2Jf4sDw5s9XZVL33VQ6xi5Om+U+ro23HPGCp0KChiKsZtt+x+jeOglgunRFeO5RrQdSvyEf9WKjyKwleSroX+hwBQuTfDTqyXSM+vlBXHHP81ZKR6wm3olz/OLoCrPWIV0UEjW7KekIC52CriOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RiWgaT1/3iPDhMFBF9I6gIdQAEfK5PtrRIYH0B1qGs=;
 b=vuNoYeoFIIfT6F1uKrZxHQi/dvw2dXsQcMiYoLt/NOwaqCPf34Y0fjiEaHbJPmRGD69z205M6fpH/JGU/mvvv+9d72LLwF+un47skJxjChbH3Y9EC5/66BrLp7DnUiZCiHkHHv1lMEIsRnfZFBe34Q6F2LmRZVTl0o0Abj46ki+ggO/rCpbEyYAZ4l3lzG8YiAxIhipxCeixxNfWrAYzTAMQGisuc75g07BvUKY5fzhSrHug9EKHB98Y5JPHAzbf9zcD2FHDArOi2L9ovxfz9M5ho2Peb7i7+e1bkxwwGRGZJd4qzNlGDZFixK7NFyMdNciUWGm9hqu1WDyuZUYrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RiWgaT1/3iPDhMFBF9I6gIdQAEfK5PtrRIYH0B1qGs=;
 b=W5klesxR6xhARTrfG8BTLC1BIFPuSwhbgKLBwSyzjfN8Y2PLNcHirDGeDSObsjPh6s7ydU+7LzgWgvD1EPgolYRfgkpayYHi7AoKpKXDpSIl/UDhBzl84s9oI1TVwR8mljri3YG/PJsqsyspWP7XuHkUYgyB49ZwSmbrR6OkTmDgiScARkc93p2mHGKnoAK0qpGjSl/O+t8iioAvU5CmEihi14GMYoP2XFh/oWYBwm7J3IDQgeFi65MHa8YcJTkeHYn8qs2FDKDnn3JGuYOaVlC0uN2pcEsWN8hbsbjHiFHJBWi+jPaNAf/RN/ySxPh/P2gAop6KCJKq3Mst5EcODA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA2PR02MB7787.namprd02.prod.outlook.com (2603:10b6:806:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 2 Jun
 2025 04:44:07 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8813.016; Mon, 2 Jun 2025
 04:44:07 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Alistair Popple <apopple@nvidia.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
CC: "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>, "jgg@ziepe.ca"
	<jgg@ziepe.ca>, "willy@infradead.org" <willy@infradead.org>,
	"david@redhat.com" <david@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nvdimm@lists.linux.dev"
	<nvdimm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-ext4@vger.kernel.org"
	<linux-ext4@vger.kernel.org>, "linux-xfs@vger.kernel.org"
	<linux-xfs@vger.kernel.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
	"hch@lst.de" <hch@lst.de>, "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>, "bjorn@kernel.org"
	<bjorn@kernel.org>, "balbirs@nvidia.com" <balbirs@nvidia.com>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-cxl@vger.kernel.org"
	<linux-cxl@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "John@Groves.net" <John@Groves.net>
Subject: RE: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Thread-Topic: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Thread-Index: AQHb0GROaEejup7DJECB0OaLLvji1LPtp3Iw
Date: Mon, 2 Jun 2025 04:44:06 +0000
Message-ID:
 <SN6PR02MB4157F8C860B0164C4115622CD462A@SN6PR02MB4157.namprd02.prod.outlook.com>
References:
 <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
In-Reply-To:
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA2PR02MB7787:EE_
x-ms-office365-filtering-correlation-id: fad27895-1d25-4be1-60b0-08dda1901b81
x-ms-exchange-slblob-mailprops:
 iS5pQZgsAQAsRVzdZadpos775QbI24X3vbC7sMvidW3c5hjd3nqK/+ifepDrykBRlQB6dKPJzSa++rUVSLiYXbYw9pJRIb9w3iyzRJ9sg3r7oWu21rK2CeOhIV1ABIsh336rISzS9h7hhLp2RpSAPaJ1DTr18i4IFMzK5pSS2ejxB9mgxsdrBeLiz3BTSFjq2/7nC2/D8+ZJ9MQT3SK+knABQYev3hv6MVCofZnIxtVCiFnp1wYMUISXXEJ+HtIwgUUBtbv5ZWPpHuKYB/I0fYgO1UIGhYksjWikc1xyi0G/m1eypclNQQUDXAw3t6BP0RV4ZX7oyChfEFD31F/8rMgnMiZ/jNfXfYHzPlRZCdNJbdjGApgiNeZrDlbcqffpTpMQPXfB/v4lwq2uN6KrRI7R8r6gtjE4BJ8ZV6yNQ7QNluxlcapvygLGAU0BekPTaUaXnGeB53uRzxSvL/dz/06fRIShnIRx3exyoAphR5efVNvbd+qEvecFKbxslytiAncupnYe4k9KVpNp62MLN8amF1tjwv0pMGgLt746JnwLbPuUy+e0pyYhywWkz1hPPg7vc7L4uu3Uc8YuGTQ6wmhkTCQoqhMExAb2UWEkUr1xOrgI/dBCuYF/sgBY5DU9kKZuPQv/q9rkIzUEbJW+amXyCrHZ7ZnNW3EMGenQf3beGt4IT05zZDS7TI06o0tmysuSpd+CqAL/ppauVr0YD5EgKccBJP7eDZuVRGOCtImCDGttZdC3AtR/QovwC9VHT/q/dM5OcovguO2EC9OhLb9scjG2keX1htblJS2r/ZgEtvnInJfGgkUJxw6fLJvY
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799009|8062599006|15080799009|41001999006|19110799006|102099032|1602099012|10035399007|4302099013|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vkrn156pVk1hhU/yJmXbf03jUgyaoGp3mo3vd1iKdtjUBEL74ltP2b4sVnOq?=
 =?us-ascii?Q?p8IPKJkxlm7cHNKiuAEG8KzznoSkEgyGdu8uc2tYIVYvC+jckYcj5fmioFZx?=
 =?us-ascii?Q?rjppN/TECVfYUwIN/iOzsocef6HcAUbFtTqZH9j7cXbivxBl8I+7LCdDDIMx?=
 =?us-ascii?Q?AuwrnrN2osXMJ03BaKV0cny8hedb9ysewcPOlgwbVzYsUjKHVZlqw/Ech98D?=
 =?us-ascii?Q?N4Jf+gtLVa9qyzO5OE2Y2XdYpxzH/oRwVwqZbexTD5RRXErL8ep9I2j0Uidy?=
 =?us-ascii?Q?klMdhKZKw92tu7QMcOw8wEXcmsJyBQGOjoI07GwSEyvO/4ZjXH87XWGYlPfH?=
 =?us-ascii?Q?w9hZsNfiZ8nBNjcXqbap7ugc9bWOMGVgyqHAuPKtK9eN6jgxgAy7NnhLHrB2?=
 =?us-ascii?Q?ABKfoDvmpVroQydgay531WFQkIDQ5Rr4cqrAKwDik9BzcpQBQhWSrWV+ZIA4?=
 =?us-ascii?Q?d6ow2SXvwxxJ8LZXN88aBZJ4Mq+Qbz+3bHQjhr+QmComnoA6Psz4SWyy7vyd?=
 =?us-ascii?Q?QP85Wt3pepTpZnU0/itcVnCnV8pWtmBq5bvFKki5M1XFnT2v/17tlgBrjU0s?=
 =?us-ascii?Q?MpmHdf4H6yWBuPH0ksoS/jpbqKW3wRRneIXTu1HyHwMt6GFyfHdnr7a+qNru?=
 =?us-ascii?Q?4m/96vKq/YGVgaHD5yiebDRzPBxqtE+bjRkrR9COerV9xh3xSFXfDjakvP2+?=
 =?us-ascii?Q?xils64nLgFSUCMxcMJoQUmvg7VuVSOF1KuOmckisDECrLVWOMpgXcPDedH2v?=
 =?us-ascii?Q?0mzbS1/2lTgqujb12xUYMTgJz8P7676tSpkYlxlzO2eP8KWZ0rewf6K8fZFl?=
 =?us-ascii?Q?a9BROx8yCHhas09CFthVqQxU6l1sHUHJGd5fN6VxixkN6oWyNBhWMC0rKq/i?=
 =?us-ascii?Q?xHtx0viSJYWGuY9ntULfQGJH3r8rgbjp73T5JhyFfPpoy5PGDNpprDoKvlA5?=
 =?us-ascii?Q?s2M9MOEYWuQamtCJ9anbIiY1rc67IgNFXtbWmy2EbJr0KKSzF7+jYbrAIf+q?=
 =?us-ascii?Q?WXYBRlLSLeO5dh/DdD/5oAuLP1norqNKFbihucsqtkLJMYnq44pymDcSWLPB?=
 =?us-ascii?Q?Y45LeaF3RCp9CFCo1H7jLIApEtYMZjHhfOHjaCBuBZ5ucQ+ogGKMvroBUoLz?=
 =?us-ascii?Q?G9DtCcraSrSRLC1W9N0vL7mNrnvCT6jWfgG1JmY5/1AiW510EImXsUAGzUFD?=
 =?us-ascii?Q?PrVq1yieQs6rvHfpL4ViQi3xISrx3BZesAtIj7dWx/uA2Z4j/NgZaHo4qx58?=
 =?us-ascii?Q?wmorkm5C1559rNm5rU+YEzMz//hW+MfrCj7qcKW/Mg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QKZIUgCAqpnwyOdj39X7o3AcVjNfSSvWLG/BGnxgBbnXSvkdRWXwnFaC4/iH?=
 =?us-ascii?Q?OuK8bgWcrWOwNsjK0n6h866WuouDq26MuSTNnDfgtQyUtqu9BFm/nRDjcyGe?=
 =?us-ascii?Q?421FShGm+2sZFPV4ll6uUANKMG0rLhkPkW/hzrXJlwAZDvXsQ+VT/jogmCGi?=
 =?us-ascii?Q?0smvoNhNcjyGPP1qDXpiuhpww7b18Ak0qp2Z8IcxwEViGuXke9Ai8mD0xair?=
 =?us-ascii?Q?YOWhDPvjYnl2EqIGhPHmfswkOkqhw9X68Hs8BSX9jZoFhTNJP5UMTtbqOYEU?=
 =?us-ascii?Q?0YCn2A4HJtkqnmLW5IGW8CGhc8qqu/ty9SeWIihPSsCpRw/OC0Xm7u2bt3Gm?=
 =?us-ascii?Q?17Gl/nKQJanUrdZg4TPO4O+y35b8RGSIhHR6YHWQBUF9jrSAqrx5qrkC8IVd?=
 =?us-ascii?Q?f7I5Y2/4pIub9aHzxO7ZZGec3TLnXOgkNNxj4lDohhGUeILwWrkRCyormgTE?=
 =?us-ascii?Q?QeZzNuIfp5f3QgRkt9f8x99lEFqnGXiyILVUPiFn71IFtfkBQeKoWYYGV0S8?=
 =?us-ascii?Q?DQN+GvWA+zkwuLdrMQWM4w3qwb7Qem42PkfVMDH40FPqBhUtrKNZW4jcn2bG?=
 =?us-ascii?Q?vn4aQ+jPLhzJYCfqglH9EpDjzEwBCES0p47aTyizJQtLpJ8Mw4Buz1Q2BVHg?=
 =?us-ascii?Q?QRv59u5bSZTmhwUBBDol85rQkSSmbmM56A/IXl7vVdMK+PBrLZynJUjSFK8K?=
 =?us-ascii?Q?Lzh00Xuw1T+CnoPDG5X4Pi26XkAb8d2J/0K5dmiDlMMjxx4DP7rwBhNWY0t3?=
 =?us-ascii?Q?1Lysh7ma36r3rINEJpwWyM3QW4pDebJ96MUYuXnsxKlM9vF5daTbk9ATVD61?=
 =?us-ascii?Q?gySHD0lBu6bKxj31dEAoDatJO9+Cfht+9nhrwkGF3Jn+x+Jr3aOStDB4uqBj?=
 =?us-ascii?Q?Ln+iZoACibKsHDTIET0Iv6J21O4jBGA7j2ZdXTWuf8qktpPHbrCzgSjzerDo?=
 =?us-ascii?Q?vqOeuinqSOZb2pYt3YCIbVWb50KpKzc+mL1XdKJ8/ez508SMFEuQ8lwjogb5?=
 =?us-ascii?Q?iR+t4g6Ia8SPXI0ioL7ul6kVx0xk6gwMbLGv6tev9shSksbVfdt7mfpw2PaG?=
 =?us-ascii?Q?CmvpIts697K8IBVWTuuyVLPngQx641rM4ywB5YpznsGYri/2TkglbaqK6y+E?=
 =?us-ascii?Q?yVGOduOpbdD7ZJ0IJbaWxq06Qc0gbNPHv8dDnkgVC9zobvKm0mrvwkzduIBi?=
 =?us-ascii?Q?eHFAeLLrtiQho49ts7UXWGuvD2lQXtghz6BTHJNmU6Nqu/+BQR4SaeABVJw?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fad27895-1d25-4be1-60b0-08dda1901b81
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 04:44:06.5107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7787
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Alistair Popple <apopple@nvidia.com> Sent: Wednesday, May 28, 2025 11=
:32 PM
>=20
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
>=20
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/mm/pat/memtype.c                |  6 +-
>  drivers/dax/device.c                     | 23 +++----
>  drivers/dax/hmem/hmem.c                  |  1 +-
>  drivers/dax/kmem.c                       |  1 +-
>  drivers/dax/pmem.c                       |  1 +-
>  drivers/dax/super.c                      |  3 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c  |  1 +-
>  drivers/gpu/drm/gma500/fbdev.c           |  3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c |  1 +-
>  drivers/gpu/drm/msm/msm_gem.c            |  1 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c       |  6 +--
>  drivers/gpu/drm/v3d/v3d_bo.c             |  1 +-
>  drivers/hwtracing/intel_th/msu.c         |  3 +-
>  drivers/md/dm-linear.c                   |  2 +-
>  drivers/md/dm-log-writes.c               |  2 +-
>  drivers/md/dm-stripe.c                   |  2 +-
>  drivers/md/dm-target.c                   |  2 +-
>  drivers/md/dm-writecache.c               | 11 +--
>  drivers/md/dm.c                          |  2 +-
>  drivers/nvdimm/pmem.c                    |  8 +--
>  drivers/nvdimm/pmem.h                    |  4 +-
>  drivers/s390/block/dcssblk.c             |  9 +--
>  drivers/vfio/pci/vfio_pci_core.c         |  5 +-
>  fs/cramfs/inode.c                        |  5 +-
>  fs/dax.c                                 | 50 +++++++--------
>  fs/ext4/file.c                           |  2 +-
>  fs/fuse/dax.c                            |  3 +-
>  fs/fuse/virtio_fs.c                      |  5 +-
>  fs/xfs/xfs_file.c                        |  2 +-
>  include/linux/dax.h                      |  9 +--
>  include/linux/device-mapper.h            |  2 +-
>  include/linux/huge_mm.h                  |  6 +-
>  include/linux/mm.h                       |  4 +-
>  include/linux/pfn.h                      |  9 +---
>  include/linux/pfn_t.h                    | 85 +-------------------------
>  include/linux/pgtable.h                  |  4 +-
>  include/trace/events/fs_dax.h            | 12 +---
>  mm/debug_vm_pgtable.c                    |  1 +-
>  mm/huge_memory.c                         | 27 +++-----
>  mm/memory.c                              | 31 ++++-----
>  mm/memremap.c                            |  1 +-
>  mm/migrate.c                             |  1 +-
>  tools/testing/nvdimm/pmem-dax.c          |  6 +-
>  tools/testing/nvdimm/test/iomap.c        |  7 +--
>  tools/testing/nvdimm/test/nfit_test.h    |  1 +-
>  45 files changed, 121 insertions(+), 250 deletions(-)
>  delete mode 100644 include/linux/pfn_t.h
>=20

[snip]

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c5345ee..12d9665 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3644,9 +3644,9 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vm=
a, unsigned long addr,
>  vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long=
 addr,
>  			unsigned long pfn, pgprot_t pgprot);
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long ad=
dr,
> -			pfn_t pfn);
> +			unsigned long pfn);
>  vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> -		unsigned long addr, pfn_t pfn);
> +		unsigned long addr, unsigned long pfn);
>  int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsig=
ned long len);
>=20
>  static inline vm_fault_t vmf_insert_page(struct vm_area_struct *vma,

[snip]

> diff --git a/mm/memory.c b/mm/memory.c
> index 6b03771..4eaf444 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2635,7 +2634,7 @@ EXPORT_SYMBOL(vmf_insert_mixed);
>   *  the same entry was actually inserted.
>   */
>  vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> -		unsigned long addr, pfn_t pfn)
> +		unsigned long addr, unsigned long pfn)
>  {
>  	return __vm_insert_mixed(vma, addr, pfn, true);
>  }

vmf_insert_mixed_mkwrite() is not used anywhere in the
kernel. The commit message for cd1e0dac3a3e suggests it was
originally used by DAX code, so presumably it could just go away.

On the flip side, I have a patch set in flight (see Patch 3 of [1])
that uses it to do mkwrite on a special PTE, and my usage
requires passing PFN_SPECIAL in order to pass the tests in
vm_mixed_ok(). But this may be dubious usage, and should not
be a blocker to your elimination of pfn_t. I'll either add
vmf_insert_special_mkwrite() or figure out an equivalent. Anyone
with suggestions in that direction would be appreciated as I'm
not an mm expert.

Michael

[1] https://lore.kernel.org/linux-hyperv/20250523161522.409504-1-mhklinux@o=
utlook.com/

