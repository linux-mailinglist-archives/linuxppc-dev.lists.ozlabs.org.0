Return-Path: <linuxppc-dev+bounces-5845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FDCA27EA3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 23:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YndqG1KX4z30Gm;
	Wed,  5 Feb 2025 09:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738709402;
	cv=pass; b=d6zxsolzx3PZID33TDGPMqZZHAVZLLPenbdeXINlAhVrBEvL7Z/fvXHjtPrUuqbfgpLEi8KL6n7gaZmWTAMS2p3rcyjwb9Sag5as1oFiNokud/hjk4lNtCnkjKg5ToKaLiU/DEYM3iJxscX4PYVczfiNfSaqQQoBVm3bOEjQtJ8K2/ZPmtBOGnR/G7Lv+0VWKpyA1zqDkyLbVmi/oHUUx1Z2XDq8RS3xrN9ed7pNzrXFZBaarRh6J/GDKI9HPJ1P1F9qnImlyGwGF+hjDKrHuZDqimeJpjVSEoetbhfq5wv7VN/e/2t/itiJhHvY7T1psFcMfR4WVzPFwbMobU12pA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738709402; c=relaxed/relaxed;
	bh=mYnQeSJDsdh8zJILm06/U6yssHJr8C0RJVE8HHsEtbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CVxQdMR65AxyhAyEeB67+e0JoPnCVdCv6QX4O1PT4tllwF5JtLTQDoM8JxCVtzDfMy/kRcZIvcoXrY2U8bDPVo4SCOP6j+/XYNbk96TaemMmJvKMhdeJoX6aYeNNp99JS5j3aWyefyYkIEdOnaw8lG4po65BU+jtM3qGFI33gmBR3lx5RIHAx9F7cWPVqHjMAnOgyNEdrbrD5YoQNuzr3FP6+2Jb6JMI3isTwhpS7l1uirbQzPm82K4WmF9dIuVnapd0Qa2jgA/XBTLzA1uGDjiSTWJCsRiNUFCBqqNQHdnvVHXVGBT0RRucMjp5P9J4EAAxrFAtS1HJboY0jzlOJw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EmZyYUMR; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::603; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EmZyYUMR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::603; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YndqF503Fz30Jc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 09:50:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLL7DePuU3gXMHTXMFbUl8dm6RlBN3/yKed8IBQgml7ORoBTbG4JyY6DC+MOf+EUce0Syj7Qg/3sPXGdu3yiDjPEnIVTEgWvvUkIEbhWquIiH7C+sxnrDLk/7acYT2x+L2oaKbHkClifkY+/WWakMc3CoYeChg2ekjyDJvvZIsRnZGrQLAulbv7Y644B/7t9F/JwG//UUa9W7n3tiIJllP6ds78ZVxlS0CwA46aGhsLq8/3tkrR40r4S5nKyiVfLnccMgXSA2YECEGEhKqifSgqU5nmcQHY+11xcxfMZUAu+caEMqQCmlCFHKk6K2hxbxOVW9VX+FCDCAixfCjHrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYnQeSJDsdh8zJILm06/U6yssHJr8C0RJVE8HHsEtbE=;
 b=ACUZly1ddxIebw59uwf5hct5ZqmuNa7RuRStzlhf90eaOkyUDc4ljbWEr7n3BNnRW6mvP2By1Z9QD0dbEJNjbLYmkqVnRZ2iq3ZSHzyFvaxLJNJfSZJc5LbOd+Y0KvdaPv4YVJUQ++Js7gi/kPQ7D69olSPJoIS5kscvndSHOXjth6w8CB1G3tpNYMnaZiZRdGqtNm4A8X9KQj+4AdZ4vEyYnqoei4J12McOAkaAPl4fMjBMtQRcKXO2YNFdVVHyZ/qcc1xElsPSSs5aaFTXYy3RtMiJLpZRehSMQvjZJz2LtkxowRSE11hCWs9yKPotaP/8GHpZE1gpVwwkU0KxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYnQeSJDsdh8zJILm06/U6yssHJr8C0RJVE8HHsEtbE=;
 b=EmZyYUMRDfPFQBz6Q4rCU7DXLC9ZAyBdVkV+oIqiVUZRC6Tuu64rMdnkUFQUfM0j4Xofu+dGdeVRVq7L2tI1Hiyy7VeK1L92Iao+xf00uvsjUhm6VvP3GY7oI8wSw6cZbR7Go3B1VCt1KZgy/KQLDdFU+vNoPib5M4Y2/8I2YcxKs1LYSVbByjANaF6drBjq14w+hSpDPn+dLgGn4ytikHcg7y08bJwhUshFild4AYXlqXWMbME7T895rnZDxl5RuzeHlZFAFtGJkZzusyqogIDPbBwvWbjzokg6vujDN9Tmok4y/vVLReLD2gW3sO3eATsDjZbGbToFq0AjUg0yLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 22:49:56 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:49:56 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v7 17/20] mm/gup: Don't allow FOLL_LONGTERM pinning of FS DAX pages
Date: Wed,  5 Feb 2025 09:48:14 +1100
Message-ID: <76dec7814edcc56d29be711b2cd344fc98cc66e4.1738709036.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0121.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: cd03f03c-c9aa-4dfc-de1e-08dd456e3f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u68h/YQmayZ14xi4P1e4wOKgL3f5J90a3QuN4aLDmQchHhQuYLPi1ocna5RF?=
 =?us-ascii?Q?qlNX4Pl01Ept9lxlzS9wKC9ywU9f1H7OZQVTe/LFpXIZu1K17IA11Qmq6O2e?=
 =?us-ascii?Q?0idOm1hqD6a84z5M8JUN7gaUra3ZC18pbivVEATHiEPwzi3UpJyh3s/+m87W?=
 =?us-ascii?Q?idxTX/WRbUA2Cw9unI8sr3wLeTYkC6QsQi42oLFfmASiFxJMN8zqPK16JHPV?=
 =?us-ascii?Q?Ql68v1FhSlLU2bAFBI2AScIdVqihlTLEk25nufkUZYSCYKkvjHkF7IDIsNuC?=
 =?us-ascii?Q?Kbw+hiTRKdDMuOInH5aZsKBvY/5grd/asxKICZiW9MKSp2GxWj4tWDUNDVsa?=
 =?us-ascii?Q?BVUlGItPOFqJeDOJANPDgri2dZAgtF/xPf3PKcP90rOmxAA3fi4iA0as0b5C?=
 =?us-ascii?Q?D6y5eEHhi3dVp1fL8nvE6vAUqLSZMnZzuP3c+7OI/8QtZKVlBa6sCv7EvsCs?=
 =?us-ascii?Q?p2ZAzVm8iw/HjHOIm765tjUNfKD7BkguD6w3GnUAL5AAVkwUmAgGSgm2sMJX?=
 =?us-ascii?Q?BJphmea+DuSC+LeGb8/rROiv+Ra5NnEtZKuWCSL1db8o+z+HxFPNw2TaflFE?=
 =?us-ascii?Q?a6meVTpQOYZxdvIiMltzFD19KPuENbIQ9VQgkDnm/PT8Pe6NMtqtZzNuMoxs?=
 =?us-ascii?Q?Gj/HJqLY2yucgQFvB/K4Grqu2ShowJW1oczU/uN1LTMWt0zU7VFbc1FXO42e?=
 =?us-ascii?Q?Nvocp/tvVuYnIr2+MwlPdpyg3DWTUP2+ImOrN/jdS5KFveGcjilJasRtIn0Z?=
 =?us-ascii?Q?T1UH6gi/kAfyZj3QhoUO+GyeTpcnyacd0GARKK5kbDKBMXr5eJAH3rPaUGbm?=
 =?us-ascii?Q?IflowjG4Y3e8VuoMkneo+//eQxTjfN99IsTNkj9Y0XZVgZWciTboHPWuHRX0?=
 =?us-ascii?Q?3kiiWrKW4AUb1KEecSkeucRAdAm+mrMN2dXVA3vn1SPGn4s346bUMnxTWh3r?=
 =?us-ascii?Q?U1FaVYmNNqk86JtscXqymH7I+qLun8R/z5Xw+l+DP18IAqkH0t9ddBz4dr/H?=
 =?us-ascii?Q?/Dx8LXX/Humk+qNX+8mq5XQ8lxGMcvYo/2qT+Y/Gj4NaGJzAcKBrBes5JqAK?=
 =?us-ascii?Q?Ol62oMlYqCklAHenTiVCzXg4x9/1XO7kLqjpqfPDPyWWqaYqKfDB8R/+92OU?=
 =?us-ascii?Q?aWqpk1xgm3SQR/W0lLGrdv85QpQmpbSfg4ABvhqp0oH9LdEDHMfxQd9r95Ot?=
 =?us-ascii?Q?hLs7RiFSzcRXbhX29jdC7/csFk260E3ba4AnJ77QOlAli6x3b7om+9bhMAfM?=
 =?us-ascii?Q?2DAFx067brL7EaOfsI1sFZOrozmkihhGCsRZ5i+7fYZlAH5TX6uaXFbXa0Ug?=
 =?us-ascii?Q?/M2FzHlNjvZAR62JpA8FFKLDMBuabsWwg+6KOBXEgIbonyXQ+fkc08cUYRqX?=
 =?us-ascii?Q?8/wrsD/iKEfIo4Rr9zGvPxL+VdqY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cD3AK4STOMcHAbJUpk9OJ2Z+87624IW7iZSFnIW21bRA2f2KYLmjtrGw2Dze?=
 =?us-ascii?Q?Zp03QONfrfN1HvrAvYcCXq4/a+YFZZGBDb0FSplgTjVcN+Y5Xp7ZYOvemuzn?=
 =?us-ascii?Q?gmmUM+zbX7hWzqiter4L+a/tFlDajY7CI0toh9X5WKdN3Xym0FBkDnK4vLrf?=
 =?us-ascii?Q?e0eel5X9mTrSLO4ctPVibUVsLN3vph7aTHrMY3WUb62WRCDbjg5tIYQI1XVm?=
 =?us-ascii?Q?PuEeStDFBBwhxtkTQ9opDW2SM077Wi2sKiSuby6KiIGvzRC7WRZNQ+EFZIZd?=
 =?us-ascii?Q?sulvVTAYTGsxmOp96i6sDjHJl00SKQCESFHK/4NDn65YSgoYWBDKfANldHqT?=
 =?us-ascii?Q?cRDIoLeJOGvP+rp8wqbFntZXh2EHkq2rwV2f1ftgkYjM6O3M+tE3XQM5wD5Q?=
 =?us-ascii?Q?lF4hAbcCYj+gF8og+rS+wx0Ka259HN9scgK9Ikddlj3ukYwiD0iPJQ7Fxmrk?=
 =?us-ascii?Q?QF2X0crnB5gALGWNbviNwTYNYHuysGemBMq/Vi6E8qRT2O1+0jeYqT06nf3H?=
 =?us-ascii?Q?MjqkTDafGYAfW61bthPMgzkq1JzkOStZuuTuJKN0LH/N4uz8NuCRZ6lF3DwA?=
 =?us-ascii?Q?G6P9uJHdTY+nQ86l5iwwRTAkUQRTCaPMXzdesssIX0UwmJreNSJ9GnKTQkWi?=
 =?us-ascii?Q?W1/A2eqHe9Wc5dLEjsbiDNTG7NBkNVfLUbSwoLEOH+Bygdm9O0Lkt2x169r9?=
 =?us-ascii?Q?BbCNUNPzh6R7rsj1jqftOtnm8dTnXuHzQs9/SXB8WS6B04DmIGB1zqZDXIoI?=
 =?us-ascii?Q?uco6XmzuGR1bS7uC0RBtnOPtGfJvw5UW8zgyu43yU3WufF4KCJwV72GN4I/l?=
 =?us-ascii?Q?0wtkc6ReA0WUt/jHLaTfHyguF1FD9lHj7HECBX5cHa0e0lUu0BRLnai2ZoiX?=
 =?us-ascii?Q?QVJNTW+CvrcSCfJksCBriAf1Ojn/chhxtImokMBK8ZfAk4F1XleI3vyGn7RG?=
 =?us-ascii?Q?rCZ1TTnSDtsV/Jjd59pDYMBS8Sw/KbjLELcyIgp9Y+CO6X6Hs9zAeC87onf4?=
 =?us-ascii?Q?K2yJKjcWnCRh+UcN//plD7DMvpu+8E0aPGUx2LZuvnqL4WFKST3vDFza80C0?=
 =?us-ascii?Q?cR1DJcP0u0sNQaPW0EO2oKiMnhwezxWo0ZM1cnk6qVkjytMSYZSUp4fkhSMh?=
 =?us-ascii?Q?ELaQlSn0QGSHpXXg2gGJem09V5R1JJgzZzTsW12yWBdLZW+AkHnAxvqOUFY6?=
 =?us-ascii?Q?/TumAL3y5s4+vzDPBUi38kLWVfPwsiJq2jRLRLRCHF6YSnc2OaGF3qgxdRVv?=
 =?us-ascii?Q?ReD1fOrGUWR1MoLKdWuGM6H6t0TcyyGOsHxgGmpP03BQmnIPjA+t36tQvqEC?=
 =?us-ascii?Q?34Z389lhn38UPplvZeVW6Yw65PhuPMq9b8OqusTuudXVbHcOuUd82JI/D2mu?=
 =?us-ascii?Q?9UCGUDBkGcnEUIxX9CUAoFSahtC1Hiq1QecdI3lVMjUH8WgQfvcay4aNKv/H?=
 =?us-ascii?Q?FQvEGIyHj+6MB1ETL1+6W1/NaZ9gG6X3C3zC5iF9uAFopvN0j40Ty02Vk8EV?=
 =?us-ascii?Q?KsAwDzz/kqdOSvp47QERkzmQQb2sggTGTnrzzrLBcdc/45x7wphmoyTKPXi8?=
 =?us-ascii?Q?G/m1DlHRMPFdUdGISTNukfZpzGugvxnQy/trlKyb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd03f03c-c9aa-4dfc-de1e-08dd456e3f17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:49:56.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VS1qmIoHlXtxLLh9+M+Ubredh+Ag/uFnby230g7tmcEpVte8ptaOZKmOZaWU+RAGHDTxKyfk6MdHwPidCuUMxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Longterm pinning of FS DAX pages should already be disallowed by
various pXX_devmap checks. However a future change will cause these
checks to be invalid for FS DAX pages so make
folio_is_longterm_pinnable() return false for FS DAX pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memremap.h | 11 +++++++++++
 include/linux/mm.h       |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 0256a42..4aa1519 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -187,6 +187,17 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
 	return is_device_coherent_page(&folio->page);
 }
 
+static inline bool is_fsdax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_FS_DAX;
+}
+
+static inline bool folio_is_fsdax(const struct folio *folio)
+{
+	return is_fsdax_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6567ece..05a44ae 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2015,6 +2015,13 @@ static inline bool folio_is_longterm_pinnable(struct folio *folio)
 	if (folio_is_device_coherent(folio))
 		return false;
 
+	/*
+	 * Filesystems can only tolerate transient delays to truncate and
+	 * hole-punch operations
+	 */
+	if (folio_is_fsdax(folio))
+		return false;
+
 	/* Otherwise, non-movable zone folios can be pinned. */
 	return !folio_is_zone_movable(folio);
 
-- 
git-series 0.9.1

