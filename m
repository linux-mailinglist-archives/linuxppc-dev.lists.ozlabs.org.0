Return-Path: <linuxppc-dev+bounces-5348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A5A1474B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 02:05:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZ1kV1xXvz30VS;
	Fri, 17 Jan 2025 12:05:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737075938;
	cv=pass; b=NzRQ56UJZW3r5ohHWYz/ByzUcIotyS/SX5RCGCbrz1zqD0cGoPndn+IMBz3SK030X2TR8ri8XF1Dp38CIpwys4oHfX0eIu6PQFuEhezAHvkse6qMuTPGol32WJWMVWeI804GD5f53sO8+OxAjE/g+iy1TS12vg11Ik5CoXP51y9jMTlLFfVXqjzQ1ApZ4SnovoNoq+YNk4IEadwK/+UhYgG+6KdXy4wB+lBH5QXKIvSOZOWBV9W48uMwrPPvhBVTQVvdfXYJkVew1AlJ+DWKsnfx6MRp4UhFwr1T/oymHPDgyLkoJhkx61qIKT2/5do7WXIep5OCmou4FxMBkL0gFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737075938; c=relaxed/relaxed;
	bh=LCK7BCW5IdPxxlAn6VgHOLVA8DtcwOpat6zYaS1v/X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bjRsHaRB5VSw/p9qonn89aIP4Atv2Fb8zd5pKYQQI5ANBXJZYMiaWe50yBFOSgFTyVmJFR7v4S9LYKlaoK95npTueeTN9e9OQRoQpvYonsg6EFzgeKnvDhX+wfeXEqeR/Ff3XbxdO2/yFdGoWpDNi+QVyrb6nYcKbTnfVR0wFJATTtWmqQiIFKwni2Sa2Zb9VIlVqJDRbz1pyT4p5/UXRRl+ZeAYque7DOxFXPCwuGTgkt18VbfNGAZeRCBoI/CYsp/PWKfoqf3r4GFVK/VL4N/SabzOi7d8vmip5Sle391l3YXq7OBwMCl48F0dh+f/5itUza2UnrMihXtLDf2kxg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XasCY+YJ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::624; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XasCY+YJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::624; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZ1kT2lB7z30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 12:05:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkoTUfu87XxDak6qWUwxNl1DRIbdKw3BTzgh1v4jx9CcN6cXYdeWBfot6QiZNX5kF68usv2QXCEBje4swneOG8HZLnwTzN5WUimM2f118s25I4bj4GRUJCA+hE8NhGlFzIL85JrIverWqHh3UCfRhmNr9QN8ErwpundNjd3Uu5T7s5jc5ugMWdCcpzPRnKQ1DralxxsZO/TP1JON97Tencwzp8lAP6q1o2mHwInh9CrvVkDYeh/tLgPyMs1hgTzyJt0OeGI247Y8uShh+iTRtjFRkshFNkSh54zVJR50IvJXPTHMMtgWzNQVAextljtiONNa0Dty8wVU74rwyxJL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCK7BCW5IdPxxlAn6VgHOLVA8DtcwOpat6zYaS1v/X8=;
 b=qa2PiaiOgy/abRjGAqTOHdPHDnioZR/VbXgetriKFgPOqq1xeNcwIVyx3cn3nmLHVx3ch3LUlc5z8mMnH/KAaAL6wvIBSH/LEqFN8iUQWRMJYaO8mx8LwJz4S9FrY5Fl+7zuTLeHX1V1AucAc3h7zk0RS9T/zAVQS0lHnCCHfOKkc8kd5L72tZvlOdVIH7go8InU8k9H/riZshFCU5WHnzfewIXF47gy/Zh/ODYDxBlg1pm3SK+A/GDrHqBT+3Qz8a6hMBowda99hEXp+JEZijecy/tFQDtR23JHEnFMXoqx+UiqXQZStxtGL7KiNfrRLOJ7fsPmpZPGeAoRWuIaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCK7BCW5IdPxxlAn6VgHOLVA8DtcwOpat6zYaS1v/X8=;
 b=XasCY+YJGMQqnhkLegUA4mH9Vgh+S3V06KzbT12Vx2+5y65viS0ZoYhG6Wx2nxznEA2CbvXpu3pN6ESUbHYfnEWu8hajKwXipjB+XXafqWm95++6UFefOrP+MpFpufw9vR07bcqahrXH4eXv2byJwgG6h8Cjrl4tDLiWMYFM+0n4+XyD6WLdpG8mtudbz8snMg0usHCkGDpvzSr6IDRfrvtVoRJFJYr3OrfEIc86zkpaklzvoERiedizGlArMvuxBukX+NsEiPrKwZfpsXnNUePZN6NudSjNEtgbWo0h6zK65RkN5AJArhmPgRzcy+riJO4aVBuq40a7nFM9D3l0IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7164.namprd12.prod.outlook.com (2603:10b6:510:203::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 01:05:17 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 01:05:17 +0000
Date: Fri, 17 Jan 2025 12:05:13 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, 
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net, 
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, 
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 11/26] mm: Allow compound zone device pages
Message-ID: <hqiotgf3h26yqqlhg5rhotikswzjsouf4ihadgrfhhmnt4qqzz@csvdojr6ttjd>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <9210f90866fef17b54884130fb3e55ab410dd015.1736488799.git-series.apopple@nvidia.com>
 <927f9cef-3f97-4bef-b6d8-53e6ef1b78a8@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <927f9cef-3f97-4bef-b6d8-53e6ef1b78a8@redhat.com>
X-ClientProxiedBy: SY5PR01CA0052.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::12) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: ed05b6c0-10e5-4339-8ad7-08dd369301c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TbPgcvZaGehYfi4B35hAu5X2CYeFUK4J36Dj+ajYNDT31zPu22mnBB/DH09s?=
 =?us-ascii?Q?gJ3/1YsvkQfASi/SkVKkv1OsYbFJ/gfXsoEZRBYEVFE7tGC6VoGRp+2YuBy3?=
 =?us-ascii?Q?vBiwYEA+9rF2+AQlQNy7tx/ofAPSLSn0SgWY9YsEf01B8diXsF4/nQDR8u4c?=
 =?us-ascii?Q?lg0F62s3WrxfD5nOgPe3ByRAlEogKoJAVlR0YESonUlLjfU83Dr3mVCCCI/x?=
 =?us-ascii?Q?Z+Uld5ZBmY8SgOx9rMmdjP5HNe4rR6ptovBPBrK2NFuqi7IyxArF+v2tLY9I?=
 =?us-ascii?Q?rpx6diIpofh5YvODw7JnyllXxv/XSFWenqp6LybgObccVenthLgj9JGWTxBo?=
 =?us-ascii?Q?ETJDnODJkpMw8AK6GYeWqpmY6MLID5IZT2Cicn/6wfoxOkUgl1JnoepUnbLd?=
 =?us-ascii?Q?8A/3MXo8NrCz0y8L9AADldnUbQO/SIN1RU0KHxV2GO7KCLF7fNGXH+0gCEYm?=
 =?us-ascii?Q?QpB84wze3gwV6ckEKHOQJQh28hhXciSPwEBb+bfBOLvEO4RqPCqMRNgDX6vv?=
 =?us-ascii?Q?jbNee1t79TV8MPCHI3EULG5fH85/qZpsO7ludhMaSzPEm5SLRR0A1dn5mbhz?=
 =?us-ascii?Q?vwgEMMxt2YwPAnyzDAq+uHulktBwhfUIgYbLgg4ZFybH070lUWgvy9YPyvYA?=
 =?us-ascii?Q?sUxEQYRH06HE2pqSyAtpHd0O0JOBJWvrkMPdz4mCx72K8IaOj3SZ+ltPqspE?=
 =?us-ascii?Q?gA21XdQIINK/xwrK6qKllZEeQUpWI341sogGFAQNcMYpcPYVaqIzWSRoBnoS?=
 =?us-ascii?Q?NezKa732JZz0hRtd3+9QDQMxbBUxwkz2RG6tPDAigPiYccuu7el1YFXowfyz?=
 =?us-ascii?Q?ZkfWsnocUVBaQpJl5Ieqdhb5oeV5i972UsvqXbcG3uWrwDX72ACU1AVVZu8W?=
 =?us-ascii?Q?UkLevVBryZFYoLHK9vOLHxzbGuhbj6x1cicpVYrwcP22Rnw7/hVZyxtd6UYh?=
 =?us-ascii?Q?MCtfd+V/Wi4wTPYqVDAKKAPo6eBlMRnA2780OrwrraFQTa9cPLtGamf7i+ce?=
 =?us-ascii?Q?Sw+igM8YouGfJ4NtWlqqo5341WLWpUR1Y2w5qnSdZ4WTKprStA6qHTTISIr+?=
 =?us-ascii?Q?fBpcY3qcDK+vkzx3QgptSrq7xJGd1Pw7uKab+eJOT+xAEe/9jkh5QU6ZugX8?=
 =?us-ascii?Q?Ag1BO26KjzC45bmsdATm6Px6WyTWs/x7vtKfMlamteQjaqojItbQIXnJ9aCn?=
 =?us-ascii?Q?sC4Pq1XCpsjytVfxbTNGV4rHaI7Rlydchq7931ZnJuT/+R/LWM1yztIHHe2G?=
 =?us-ascii?Q?EY1g/jW23xBHOVpxo2LJ5nMnapRkQKJbOB2pw9XdWl44T8xE/flOKEVr+vRS?=
 =?us-ascii?Q?AsaKQEWMU82FLO2o3sRyMlIH2t6SaTSt1kT8Lp3ON0l9mzhqrY86u5B799Iu?=
 =?us-ascii?Q?pCh140W93RrJy/QeGifRJmpc3Qup?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7AtOpA48OWOV64WOtNJeoR96Mw68phE52o8NsfYOSuUcEvffpaqdcbQ4Uz9m?=
 =?us-ascii?Q?gkem3ZabvC2q/bWsvtlyJihI8bIwm3LAlrgQXWeq0teAW0d/2Id3KALRG+/8?=
 =?us-ascii?Q?0JJOu9ocWIlv/impc1aku8DLl+/yF2BIa6WLPNMgSLM94my0F42ywB8vrdhN?=
 =?us-ascii?Q?bdRvak7mZPoIBAmckexn0rlUpGXcR8kEz7dWbjSqRN2Vk7VmvvZhgRWRWRpj?=
 =?us-ascii?Q?5iRSjSrfpr9IxXr/kz/roMMVhYeBfBXw/8UDRnTUBYW27heLAWOXYlUMzamN?=
 =?us-ascii?Q?0MXb8AA3Iub61+E7ngYf/ar3UIoyuCRv1EiRZmMaTr+FQ2NDrRL2ECm06svm?=
 =?us-ascii?Q?jlPi+DetUQYOcRoHhUkM3GD4BnRHWe2Ocst5R/fiRgXuionVeMNpRqb2V050?=
 =?us-ascii?Q?HG7gtjIbF6YRxRVz31l0s+rRjn5gUe6IGMR8qG13HFM4ghXUblgdByhrzmik?=
 =?us-ascii?Q?H3H1JXVDpIrgmckwWm/GsnQz5Bn4iPctF78dNha+zMbpJFCNPg31nf/djMdW?=
 =?us-ascii?Q?zt8hL+tIef1WSLa0OUL94M/f3xjw0EV1BGf/kN3tbdHzRoBiDuhU2QlsKKF2?=
 =?us-ascii?Q?b4GJILwlx9lIVqSVIVhduvOUgVD4i1/hOyat7YoXcAP/W4CfhTbPfYSXp7gC?=
 =?us-ascii?Q?fkWaFsoFQcGLV2HXBpKX8nFVTQIJzrEwodf9gh64GOJeAOg6w03WBd04zaNS?=
 =?us-ascii?Q?jL4ktZE5Y7Iqwxe3Yv//6P5n6b/MYp7Ded1df9ayYMTFk7fCoy0XvUw1PMqb?=
 =?us-ascii?Q?TAVdjRJR1XO1U06FzGlnzKzuzhfx/lmZ0HPCM8BjNVN0aIiiIbLZ3vORtJpB?=
 =?us-ascii?Q?KrwILfPPKWhcHleCNIcCBsqT/nyCu/MkBCPnHRJ5Zl8O3GYRBUqVvD9HozUG?=
 =?us-ascii?Q?4RcBeexa+lvr/8SEAGHF41879PAVOlFgjmz8fefp4/vHxwqvUquARk7EnzuW?=
 =?us-ascii?Q?zekTKc20jb7qyIefagaUG3IKGAMLrfxXLzEmMhJEvLbJUDzwWf9ZOZpfIY7C?=
 =?us-ascii?Q?K+UooVHqcBKKcUcydiwyKMp0c19SaKlzPJ3EMn7FsNxdt5MF6iBj4BO50Yae?=
 =?us-ascii?Q?4kntJKNqD9n0A8SgE4M0SNTAyTMKAniVl7LmgW2u0NfrV9gOpOZljbDqI3Iu?=
 =?us-ascii?Q?aUCmIKPfvF+ghstQBLb72X8nWYAcOJrQWhZ0i1m4eEX52DrxcysMIXI7Cwba?=
 =?us-ascii?Q?poo06265CYw0x6gYT2+E7GTZPxDp271+Kez1FJjzeK0tyatYpSDwUIHyoU9Z?=
 =?us-ascii?Q?+4olODk2g7mo5PqBro4jQK1ApeZQprTASgNnuAiYV7kK/DYdfqCtmUFQDs4z?=
 =?us-ascii?Q?poOqTblmCL7vY08OjpKJhKD25oGTakHwYsDdA35SjDDuVhr604lMvaH9Byf4?=
 =?us-ascii?Q?4AOS8f6emYlM11BjSGhcUCB8VcSJMtQunX3qDulALACyUBcSTiZu9j37Xs/P?=
 =?us-ascii?Q?1Yuh5PKBygSJ24NyZbmGhBP84sdat5EY2eCddn87Z9clAw1YvXkwsMHy60Aj?=
 =?us-ascii?Q?QhAe01GXl/2J7mml1nbva46XlYghy9rCy0/3SBOhhWh0AsyVG21QlQHW+fPd?=
 =?us-ascii?Q?5SW696qqN4i6eZ7kMlxUzB+bKT7VRDUR5ZiL1Sgg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed05b6c0-10e5-4339-8ad7-08dd369301c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 01:05:17.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVKkXsXz/AYhNEjzfUSmaa4LVYUijwFfMTraYvxNupSaFYPwtQUnrRKE334EsJWnzgl45TKL/VjBjvoFQsUROQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7164
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 03:59:31PM +0100, David Hildenbrand wrote:
> On 10.01.25 07:00, Alistair Popple wrote:
> > Zone device pages are used to represent various type of device memory
> > managed by device drivers. Currently compound zone device pages are
> > not supported. This is because MEMORY_DEVICE_FS_DAX pages are the only
> > user of higher order zone device pages and have their own page
> > reference counting.
> > 
> > A future change will unify FS DAX reference counting with normal page
> > reference counting rules and remove the special FS DAX reference
> > counting. Supporting that requires compound zone device pages.
> > 
> > Supporting compound zone device pages requires compound_head() to
> > distinguish between head and tail pages whilst still preserving the
> > special struct page fields that are specific to zone device pages.
> > 
> > A tail page is distinguished by having bit zero being set in
> > page->compound_head, with the remaining bits pointing to the head
> > page. For zone device pages page->compound_head is shared with
> > page->pgmap.
> > 
> > The page->pgmap field is common to all pages within a memory section.
> > Therefore pgmap is the same for both head and tail pages and can be
> > moved into the folio and we can use the standard scheme to find
> > compound_head from a tail page.
> 
> The more relevant thing is that the pgmap field must be common to all pages
> in a folio, even if a folio exceeds memory sections (e.g., 128 MiB on x86_64
> where we have 1 GiB folios).

Thanks for pointing that out. I had assumed folios couldn't cross a memory
section. Obviously that is wrong so I've updated the commit message accordingly.

 - Alistair
 
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > 
> > ---
> > 
> > Changes for v4:
> >   - Fix build breakages reported by kernel test robot
> > 
> > Changes since v2:
> > 
> >   - Indentation fix
> >   - Rename page_dev_pagemap() to page_pgmap()
> >   - Rename folio _unused field to _unused_pgmap_compound_head
> >   - s/WARN_ON/VM_WARN_ON_ONCE_PAGE/
> > 
> > Changes since v1:
> > 
> >   - Move pgmap to the folio as suggested by Matthew Wilcox
> > ---
> 
> [...]
> 
> >   static inline bool folio_is_device_coherent(const struct folio *folio)
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index 29919fa..61899ec 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -205,8 +205,8 @@ struct migrate_vma {
> >   	unsigned long		end;
> >   	/*
> > -	 * Set to the owner value also stored in page->pgmap->owner for
> > -	 * migrating out of device private memory. The flags also need to
> > +	 * Set to the owner value also stored in page_pgmap(page)->owner
> > +	 * for migrating out of device private memory. The flags also need to
> >   	 * be set to MIGRATE_VMA_SELECT_DEVICE_PRIVATE.
> >   	 * The caller should always set this field when using mmu notifier
> >   	 * callbacks to avoid device MMU invalidations for device private
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index df8f515..54b59b8 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -129,8 +129,11 @@ struct page {
> >   			unsigned long compound_head;	/* Bit zero is set */
> >   		};
> >   		struct {	/* ZONE_DEVICE pages */
> > -			/** @pgmap: Points to the hosting device page map. */
> > -			struct dev_pagemap *pgmap;
> > +			/*
> > +			 * The first word is used for compound_head or folio
> > +			 * pgmap
> > +			 */
> > +			void *_unused_pgmap_compound_head;
> >   			void *zone_device_data;
> >   			/*
> >   			 * ZONE_DEVICE private pages are counted as being
> > @@ -299,6 +302,7 @@ typedef struct {
> >    * @_refcount: Do not access this member directly.  Use folio_ref_count()
> >    *    to find how many references there are to this folio.
> >    * @memcg_data: Memory Control Group data.
> > + * @pgmap: Metadata for ZONE_DEVICE mappings
> >    * @virtual: Virtual address in the kernel direct map.
> >    * @_last_cpupid: IDs of last CPU and last process that accessed the folio.
> >    * @_entire_mapcount: Do not use directly, call folio_entire_mapcount().
> > @@ -337,6 +341,7 @@ struct folio {
> >   	/* private: */
> >   				};
> >   	/* public: */
> > +				struct dev_pagemap *pgmap;
> 
> Agreed, that should work.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

