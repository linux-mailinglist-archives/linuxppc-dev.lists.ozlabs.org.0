Return-Path: <linuxppc-dev+bounces-3467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C29D5720
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xvd9v08L8z2yRD;
	Fri, 22 Nov 2024 12:41:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732239698;
	cv=pass; b=HI1fqvgFfbagWOO9jsYa7iGB7QdIFlw8yjETFfceNqFew5s+z65DgKta0njIwq+AF6yZSt4y4Q+qVmc7bLqhY6PeMBITztCK7H4rQGrfaQDpqrYSY3vcW5Twq3Z89u+YWGrH2LL2vFhrebLp0fvBADOQjJqUZzAjJvVfrglu+c/OlbyLen1xD96ZJNEX3x23lbArJXXXnAfHneDo4jzbPQKpFEDT2PFprBO906Nm4hqtuW1HxMDNJ5kR9bxv50gE8fEnFDCXtmZECyue2OoEHmNNRHnmIZKJ0WF802z+Kxqu4Z1b4YhbVZ2771vkuHP8pP4Z8t/9wVjcO0tJ247GGg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732239698; c=relaxed/relaxed;
	bh=0u1tQB5hAD9qXX/WaQRL1Fudxl6ATJhd8TdUy1t6AqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N/J0muoV4Lr8ob8N4OcdKXZSky6/V7LYNp4/S7unA8g/LAldGeLnYe4Jpb9R+a5QXAvuKaFl6kV6Hrr3Rm5NiRyRHC8CDoBJAGYsaqIwpwhQdy4+qzsWRUTu3zeIiXL0+ciZ9n2DEo4F+Nk+9fyJM3jk8xkw2crajgZgUmNRUa8x9KNNIvV3GmmbD2tdgVZm55MW8aS6tFs/ZciKfX2oe9tBnEKAE2au9V5FTenLymOyzlgjwz90zwSQH3attIBKHJ+HtYOAbMqbsKJM+ZnBKd02vi3yqDhj3ZvLPA9ZS2cNmjscOJISIfbFqImuPcvv6MxLqKXCtt8JtNww+QrsaA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G6oOuMXb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::60a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G6oOuMXb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::60a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xvd9t2mpjz2yjR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:41:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J47TTuVUbjSQOGkYjJ370BL4576UkAzQ9KTm0eu0pvk/qX0+Xtr8tZ5Jv179WnAyI8mJ7VkBvjp9yW5NtCpFo8wxC6GKXDSSKph6ULoPFQZvBaJrNxy4PrNLqEUoZjwtmVNGE0m1Lxh6oHVgoZc40AtfByIeeOLGhm5FFHQkOfqWVz3fdkAQ4HGZ+DprVPHlwNZe0JtjurXUG1f4SuXzMVOI7pFMyBj9/QwLGeRiHQ7o7/Exdwp2q8ghos22vv/+CSlkXaMcDuFPE2DVlVBodu/6zZyYOMKxL4o53rM9n+Z2EFP9R/SCYE5iJE9ISMstlwSia1nrdmCtzqqVZKyUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u1tQB5hAD9qXX/WaQRL1Fudxl6ATJhd8TdUy1t6AqQ=;
 b=vOqHPNYOmiIN4bl6NQbvYH+O+Jz7dWd0pmpvPy8+u9Au56mGkmG+acw4uRNwCrTZZdiA8fs4p2tNQaBfuJVfue6vw93Q7oEdI2sisYeRyix0ZUikhub1WFZO8AeCks0au061Db1zdYHjEXdqzqkpE+/eTjd0mIAMbruvOBF2hf93xhx/7uj6ZfchzQAAss23luw2PGDsUPVG1aPbCZ2xbVs10fcMERA2KKirtEzmk1NFtJs/LnMNajWzmLNRtlWVLA3TsC28AXayQNxbNtNVXQDUVv7CCMeP/IhtZvPEguTr9fMcZ2sbXz1Yk11je2sAIXPK3fSElUQxBP0tvwNUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u1tQB5hAD9qXX/WaQRL1Fudxl6ATJhd8TdUy1t6AqQ=;
 b=G6oOuMXb3zadelXmS5B4me2ArYXMW4AAT6imLQtQy5dULOBtgxQ8Umc4rf0JQTHpib7c4yNMUGvRLtPuKleHVIXlxXCx2hWsetMtNZzdoCSINosdgJe8GdYABCfWIRW9duIjN6i9GQUhkf4uMSTARmgpC5UnopA74I4mtjNsq3ExMVDKM1YEPvGX7cY5TH1beZALB5oyvarFQpPVh+w2TqrHn5jCQeON+LTdFk/HkbQ+7qpCYikz9BkvpUSkfjib4V8sUdQ9D6l79KKZhQdN8fhREBqW0QWy0sv1EP27NJaNOUfP5IDdv27H5gSw6aI8eYgP6uFRnc/mu4zMWPrBZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 01:41:23 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 01:41:23 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com
Subject: [PATCH v3 03/25] fs/dax: Don't skip locked entries when scanning entries
Date: Fri, 22 Nov 2024 12:40:24 +1100
Message-ID: <33af740975156cb93b883b4d796300657a0cf637.1732239628.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY0PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::16) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: f3930ed2-5eb2-4d6c-cdfd-08dd0a96c519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rJgGo8BNvB5K9PFN4GtdzN3uBLY24aRcttrCk/S1ykSAWw78cKdibxtA7C6Q?=
 =?us-ascii?Q?aSAnPN98+qeUFewAqUNPmwSh4MyJpmbjbgR3ODgpFI3zn0sy2v0nM8WZ8Z6N?=
 =?us-ascii?Q?2B9pSMlWpkV6hPDwdycVQOtgF2cDthujodz/mXirjBXQH1EVlm4GUW+/kALu?=
 =?us-ascii?Q?Sxrq3E0Ha6pn+42/Ku+Ip4J/QrOp/704HUdOU23m14dVVNbQa/Y612OUtlKM?=
 =?us-ascii?Q?z4hGJJZDoGGj/POYIaFsFW+Vjs5yFjFXHeyIO+GOtCmOIieSQD53edF7k+o/?=
 =?us-ascii?Q?tmICFOdJZaFvr2Fyf/Jvh5i0IirxNOn2dJWuyaqRAtbPodedJK7E/c9/xU9r?=
 =?us-ascii?Q?6EeYbuXfzIqybCLeDQoS7FsVW35gVfOE1XKL3AFgf9CRWDwshyQMbeWhtLSO?=
 =?us-ascii?Q?AWra8FPvaTY3ttDsTcvSV136NeYiDSkNt1E79CmWJpMHAJdtUtoxo8pR8RU5?=
 =?us-ascii?Q?g844wjFK+SAIFf95lhmYZDX1xNPCxMMKk9Mwt6U022Ku0s3F16FQwjChj83M?=
 =?us-ascii?Q?Ct16cjs5TooUrG4woBE013596PPIoiLzr54EUwE00taYaj0KE6cKFZGaWCe5?=
 =?us-ascii?Q?ZNDsutz1G0R3TYlcuEv0kpcYdOD6/HEaDwCI14ncR7r2tDSHHVPtUY2ASonz?=
 =?us-ascii?Q?AtEtZtS95Mb5ZBCUC++z1ZyvzdOR4WZgs9Q0hnQ+5xZI4lVB/wTYaKOjNm7Z?=
 =?us-ascii?Q?AV5c6Zah4wfF4B7qr3YbzvOzyubRXqlleqiN8Z3wEIPSrOWTDbvZWKxJME+2?=
 =?us-ascii?Q?r1NGbew0Uq1FeYgMmRjYuFYrv2JXOMC/taM1BSxC4HP5kB3QixD6ASAvGp8k?=
 =?us-ascii?Q?InsHzn921iKjtF8qoZcmGdi3tsGXU0bnZXlDl4dRscMNjW9YIRuvNbdIR+5l?=
 =?us-ascii?Q?sUL3Kf1hYH5EIZ2Bh+i/xoY9824iLD9s3M7kZ10z5XK11Nh8M1lrXtZNvuoE?=
 =?us-ascii?Q?Ug2LxPECgjGlnln7iZzLAWzx5QmIkX/nD/K9SA8uCjry0K244CUMayQWNdHE?=
 =?us-ascii?Q?fsL3ywDFdxjPovyRYtb/NHbuSyq7AkvWNRzSLK40uFgyyQfOOK5X64S24Q0e?=
 =?us-ascii?Q?v2SlOzSLnZZp6d9r/8JHvb1rLYEkhzcRZOsLWrFYjP81C6rBzNSmXPoYomNC?=
 =?us-ascii?Q?O1iH+WdHdsVEqN03yx3B6AftFCr6VSNyrykkTLh1spZQiNTvz9AKCReavn8q?=
 =?us-ascii?Q?1sns7FmqSjkH6T0CjaHP/kSbhyCKGgTdy0CHiXeVX9bo/MZL+2MZEff5eMWc?=
 =?us-ascii?Q?CUXbHZ3kRSkSfCosVXpRYbrkj5S/AfsSYIKlZmJ1irZlGMZjjtUadTe6fvbW?=
 =?us-ascii?Q?vXiaCwBhKlHWjvokdn5W2Be3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dYdogiIFP887dt6XI7P8m1sgAvcwmLBGYcQldY1C4ZIFdhiXnoUTnpr6avpQ?=
 =?us-ascii?Q?44heqWnRfOuOde1y/P2OMkw0W7xYcoEKDBzVoCBp8omlKog4ocoQtvL5E+yC?=
 =?us-ascii?Q?uUuf3YykCQ/Xi6CFG5WXKoTPMnDWHi4qMPS6h9XvHKK3MKoskzUDOtrcB5q3?=
 =?us-ascii?Q?D0nm4URjnVg8e3FqLUj5aFsb8krN2VI9JqQuQ5d7GHYVu27mNt+UuBHOPFI7?=
 =?us-ascii?Q?j8fSsaPXY8Zgkvr2uWTHPYXU3wJn9xt9EDB4MEJErdKIvaKweZWgV6Pj2Qw4?=
 =?us-ascii?Q?2XFd1lGdkmuplP5rjkVkhlDwtjQ0NQqW5GpktRo/SGQqlQ2cLNok4hLntoTr?=
 =?us-ascii?Q?kfqIPbrWUICYHrSIuDzXdMdctazACF+jNL1xCvkKsO6p7DByXvAR8B8bva5d?=
 =?us-ascii?Q?hqLr67AabZE5H0yE8G9uB8wiPIkhyHBUBN1CknvwD8vHpJ9nTiCMZ7alMFqM?=
 =?us-ascii?Q?G2eWVjHfdYsQfW7POqqDu5a073g1xsfFCBbWSZ16WjJgg410Q1mIZPqb1ntd?=
 =?us-ascii?Q?uGQro+k+PeKwKKkluxMwcmExUJ/bXhTy+gbUKZ2vMXImqRkIYzMwh2pzFYT6?=
 =?us-ascii?Q?RItZUNhesrQI6RLXY8nhU5rECImKfURiXtvYm/iseIuUvIf0I2qqWnM4HQ2Q?=
 =?us-ascii?Q?7uC3nPbfLXdnF8I4+tZp6Y+u8QB1pfvEIMZRSL+Ols77XOZ+fI/vUOgDhq8Z?=
 =?us-ascii?Q?2UrRBWxoy9SxaKScl89SlUJ+Yf3EcCie6wHQZa4non4fN+YXY2/O3cjqLnAe?=
 =?us-ascii?Q?J4tziM7JyZAH6uQXK1AA0ggCroy1QK3vixZN+FiMVfKtIWto61FXin10c9E/?=
 =?us-ascii?Q?5eD1KCDnn5QoxyBL4Mh+AeBWy4vQmCAG3t7Xr0Og1PnRTfjoRO1nEs4CYRuz?=
 =?us-ascii?Q?/95Mts2E5eqdOb1T1wbYc8/M7Y1fRQ+ghhh3gVYTesJt0rj8IdzdRxCDmp/d?=
 =?us-ascii?Q?i0Hv+oRu17mjG6mNMBM+WTfVHO0YL1BQVr/xKTwWMhysix9bqPayaTlBws7g?=
 =?us-ascii?Q?o8x0vN4oQ+RZd8htaJh5TliQU1hMJy5wVjWeHUxUG3Jd0yze2K3TFBV3XEvl?=
 =?us-ascii?Q?ftazrGdXsWGFnI29tp2sGlpcMqWZ54QcY23BF1F+S/p+HG1+7II1LZuDbA/Q?=
 =?us-ascii?Q?tEvbjc6ZJtQZRDZqOSpHIo+aO1tBnwwwfFs53xzL6/eRTgV0N2gEH4fnchyg?=
 =?us-ascii?Q?kk6IV/phxWu+y+JNbw+ucOfj8kROCTxkLd03I5TrJEHh/cpQrA1flVhoGTwu?=
 =?us-ascii?Q?0KV6W0saBxR8WJ8rA/X7HLWzUffl3w3GWyuW9cOYFUqf3K4PBg5Odl1v9zDu?=
 =?us-ascii?Q?QHCggQmBiGeDERnn65VNd2BpZfxyj4fSRz2y8oUVJ9yXM+Jr5RYYKSrmeA0O?=
 =?us-ascii?Q?KFbDUde2CA8v5o4FOB96AyBzDCeKkfITjUN8UIqG2cK6uXAFnoMCIhaemnYr?=
 =?us-ascii?Q?3PjUSu4u2CltOMYDPn8HqHIKgw4Al1xhnuQJDN1WB5SJHW6nGaVoHoqKXnB7?=
 =?us-ascii?Q?zshdvB2CzYydl0NUbDJ+EkTsVaXcbAMGJPxZgHus/OKZ2uXJRQKRR00XzuHQ?=
 =?us-ascii?Q?Lk621MKhThfV/vYI9h+e865K4+ZO6MzEnqIYrUVQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3930ed2-5eb2-4d6c-cdfd-08dd0a96c519
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:41:22.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OPFRNi5XuOJOS/wnkS/Ff5ecHwzMhiyIpd7DNrjO43u/+ivGmmM8WHkERaM7iu4jlHIpxDxEy580hkN4Qodow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several functions internal to FS DAX use the following pattern when
trying to obtain an unlocked entry:

    xas_for_each(&xas, entry, end_idx) {
	if (dax_is_locked(entry))
	    entry = get_unlocked_entry(&xas, 0);

This is problematic because get_unlocked_entry() will get the next
present entry in the range, and the next entry may not be
locked. Therefore any processing of the original locked entry will be
skipped. This can cause dax_layout_busy_page_range() to miss DMA-busy
pages in the range, leading file systems to free blocks whilst DMA
operations are ongoing which can lead to file system corruption.

Instead callers from within a xas_for_each() loop should be waiting
for the current entry to be unlocked without advancing the XArray
state so a new function is introduced to wait.

Also while we are here rename get_unlocked_entry() to
get_next_unlocked_entry() to make it clear that it may advance the
iterator state.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/dax.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index a675eb2..efc1d56 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -206,7 +206,7 @@ static void dax_wake_entry(struct xa_state *xas, void *entry,
  *
  * Must be called with the i_pages lock held.
  */
-static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
+static void *get_next_unlocked_entry(struct xa_state *xas, unsigned int order)
 {
 	void *entry;
 	struct wait_exceptional_entry_queue ewait;
@@ -236,6 +236,37 @@ static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
 }
 
 /*
+ * Wait for the given entry to become unlocked. Caller must hold the i_pages
+ * lock and call either put_unlocked_entry() if it did not lock the entry or
+ * dax_unlock_entry() if it did. Returns an unlocked entry if still present.
+ */
+static void *wait_entry_unlocked_exclusive(struct xa_state *xas, void *entry)
+{
+	struct wait_exceptional_entry_queue ewait;
+	wait_queue_head_t *wq;
+
+	init_wait(&ewait.wait);
+	ewait.wait.func = wake_exceptional_entry_func;
+
+	while (unlikely(dax_is_locked(entry))) {
+		wq = dax_entry_waitqueue(xas, entry, &ewait.key);
+		prepare_to_wait_exclusive(wq, &ewait.wait,
+					TASK_UNINTERRUPTIBLE);
+		xas_pause(xas);
+		xas_unlock_irq(xas);
+		schedule();
+		finish_wait(wq, &ewait.wait);
+		xas_lock_irq(xas);
+		entry = xas_load(xas);
+	}
+
+	if (xa_is_internal(entry))
+		return NULL;
+
+	return entry;
+}
+
+/*
  * The only thing keeping the address space around is the i_pages lock
  * (it's cycled in clear_inode() after removing the entries from i_pages)
  * After we call xas_unlock_irq(), we cannot touch xas->xa.
@@ -250,7 +281,7 @@ static void wait_entry_unlocked(struct xa_state *xas, void *entry)
 
 	wq = dax_entry_waitqueue(xas, entry, &ewait.key);
 	/*
-	 * Unlike get_unlocked_entry() there is no guarantee that this
+	 * Unlike get_next_unlocked_entry() there is no guarantee that this
 	 * path ever successfully retrieves an unlocked entry before an
 	 * inode dies. Perform a non-exclusive wait in case this path
 	 * never successfully performs its own wake up.
@@ -580,7 +611,7 @@ static void *grab_mapping_entry(struct xa_state *xas,
 retry:
 	pmd_downgrade = false;
 	xas_lock_irq(xas);
-	entry = get_unlocked_entry(xas, order);
+	entry = get_next_unlocked_entry(xas, order);
 
 	if (entry) {
 		if (dax_is_conflict(entry))
@@ -716,8 +747,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	xas_for_each(&xas, entry, end_idx) {
 		if (WARN_ON_ONCE(!xa_is_value(entry)))
 			continue;
-		if (unlikely(dax_is_locked(entry)))
-			entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
 		if (entry)
 			page = dax_busy_page(entry);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -750,7 +780,7 @@ static int __dax_invalidate_entry(struct address_space *mapping,
 	void *entry;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, 0);
+	entry = get_next_unlocked_entry(&xas, 0);
 	if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
 		goto out;
 	if (!trunc &&
@@ -776,7 +806,9 @@ static int __dax_clear_dirty_range(struct address_space *mapping,
 
 	xas_lock_irq(&xas);
 	xas_for_each(&xas, entry, end) {
-		entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
+		if (!entry)
+			continue;
 		xas_clear_mark(&xas, PAGECACHE_TAG_DIRTY);
 		xas_clear_mark(&xas, PAGECACHE_TAG_TOWRITE);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -940,7 +972,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 	if (unlikely(dax_is_locked(entry))) {
 		void *old_entry = entry;
 
-		entry = get_unlocked_entry(xas, 0);
+		entry = get_next_unlocked_entry(xas, 0);
 
 		/* Entry got punched out / reallocated? */
 		if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
@@ -1938,7 +1970,7 @@ dax_insert_pfn_mkwrite(struct vm_fault *vmf, pfn_t pfn, unsigned int order)
 	vm_fault_t ret;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, order);
+	entry = get_next_unlocked_entry(&xas, order);
 	/* Did we race with someone splitting entry or so? */
 	if (!entry || dax_is_conflict(entry) ||
 	    (order == 0 && !dax_is_pte_entry(entry))) {
-- 
git-series 0.9.1

