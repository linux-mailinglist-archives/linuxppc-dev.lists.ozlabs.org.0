Return-Path: <linuxppc-dev+bounces-15374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC30CFCD15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtP3DpPz2yY9;
	Wed, 07 Jan 2026 20:19:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777565;
	cv=pass; b=TQ6pt+loRKNugycLxiL7XcvubQm69fy5jMUQzkwWRfK0LLeUAn0ir4uOYJTjL9+/Glj0dGZO+IfwW366TRGbyg9c9Bq0SS5gjABtKIAwTzUi2oUPr8NYKRNckHDr4iLBs5Jdx7U6Zq3fjEIYo/dX5523o8h1JSYm2ZbfK6BOl/7LjGRf9lx8K6czDyY5xMdJK9Qe404oib7Vi2yVrewpcAYHGAzTBEgq1cvu/6uNCDFn9wGxsUl5QDN+uwmBf+hcm/m4oF9MTPy+2D95DjkeM2ukKisoVJCkPlbytjfq/5Ks2i241orb8gVBtwLF8EU2uRX9cnQqNgmjXnlJAAjaFg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777565; c=relaxed/relaxed;
	bh=HtcWKucFsZkDVDAu3g0xVqexFcnMtLPneHWdLl7WLag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iQKRC5xcfIWXolPRHLoBGcZBmOzDu1tSxzUMBbvzCktVeYZoRosld7lX2umQP/vTSRoQHf5gMmeuuayBfDf2Eq91SaVvh+n4c7D4lc6TYvRWuXmoh0CJlDDK0ZXo/lvZVNkSWnA/MYyLYd0Zt96WTNN48X1Vl/5f6TseIAus82pcVz7B0tpLrBuGCb3MRGh1cS6JXhKKtBJSBsYd2+vj675aKdGZV1poEaKcCW66AAlQIBcXCKbPc8+i3xiZDu5m8ffqS/cdC/gwFMc5JTbFn3woQbcNAHEZQTXw/GwlsCUBQchLpfBucJXcIo5qpGjecH0fegDxg2UNsqDSDiu89g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ud2GIAiR; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ud2GIAiR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtN0Dj4z2yv9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9L2nZhdrcFtvoUUdAdrcpYy+v1kiSx5G6K90tvSSN+2WFaUMdsyEaZWybCcK06uuGAC3XNZdDInLsM/OvXtTYfYB/fDpi40bJljYyEg8repOjFhvjUPuaZIyt16qPH3QszxLHqLRFZ5IHWxhdaWBzPfRdqJlgt8ezA57ZO1cBXOrV7F3Z44ehhpOJitIbAOcojMBzLRJvsArJDWbiYrQNKulhqGA96htrVJRsEMBcAieJ2mJdb+TZhZHQWq17jcOItCDyMliw5pIg4WU9S0n+zKBMcbzEpfrl6oBWgjUvABBSMoTA1LE0WnZ/C+Ps8fI0Zq4O9k/6+5aS5S6NyN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtcWKucFsZkDVDAu3g0xVqexFcnMtLPneHWdLl7WLag=;
 b=gfASZZ1m8CQmNNzFSlXVd/U9M/4qrgaKncGtZwHL20hccYFHe98Nnm9CDYU4hSNBBqsKS/L5WE9gSIQ2+r/pZL708JPJiAa/Hm5z5Z4pn06d8WLJvNM6oig33qba8/8KkfORCAT9XIhqNWMNrW+cef8ppXvNOCM5KC77I/h2RwwrUBCgVBO38k/3laT1tRX05AuwRY+JtWqBOHR/P8Y9MY8JrLrVsmwoWuT4n0QcixBPNKC31mQkUQTEktEEx/caCSvlFujeYxcmFmzJWX8kx4O5Wq9jODenngIn84/Q4Kh+HUQ5t62UPR3UtNAUJwF9qXBKopqStbhkWsQveY8JZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtcWKucFsZkDVDAu3g0xVqexFcnMtLPneHWdLl7WLag=;
 b=ud2GIAiRtvVeLUhFxO3FGNyeP9BJcrcvCCMc1zln5vSdmgC5hVmumz2GUj1zjC+Ou0FvonMatxrqIYHwEyDmtxWFnIx64l5JwwdXCB4GfuMnybqOfHLTQigQlShj/43sDlyDs7/uMJ5FfirXsxWNWmiKL2uXWdCYEG9PYy2FPdvwFH2ML+FO0puOZnt2eAi8psoauJlle7IsVSOxem41RSYKmJgocnPg31iIkc6oDT1mKidactcw4uJ8Du3dxdeLOMnW6d+CxAtBPCUavD3BNbUa1rWVyRjCdXsbuIG7aROiZgyB+ZuoQk0m67vJ4vqmwE369B0K/4iI0jTdSu11ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:19:15 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:19:15 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com
Subject: [PATCH v2 11/11] mm: Remove device private pages from the physical address space
Date: Wed,  7 Jan 2026 20:18:23 +1100
Message-Id: <20260107091823.68974-12-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a77b30-d652-4d56-52f8-08de4dcdd37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4hV3EJ6WBeYbAPh+2CgPHf7H0vLLGGGf4I18V7M7J7eqz6cIUskM8CwF02t7?=
 =?us-ascii?Q?DAqOEn85IGVDrdYw288y8JGosB5QZkIGLiVWkRFl8dPQG2C61/eR4+qXgGZi?=
 =?us-ascii?Q?Jvq/D8jVAKTiHLpzGCBlluB5BztNJlWE3xYZUH0r54mtR0lsQfkyEHFLuMML?=
 =?us-ascii?Q?3/EULiHe7yWPFV9z8OMzTVIi07kaE5GnQt+PR8WngMlLkTi8VmSND98xb+p1?=
 =?us-ascii?Q?3gjnOkCQ+KQ4tPEPBFzVoAhZOcBfzeA51soBo1Yj7EfLZYdZSr0E9lqcwjTT?=
 =?us-ascii?Q?SUu4QZeuhAcvydEcWCtQVL/2etko7OQ+ShJfN9ilgHnXt2boiUZN/jcjew21?=
 =?us-ascii?Q?j/xDXDnJ5GECM33DnUbukilp9AAHy5iQlX03EwqOtTnV33h0zd1Voue8twXu?=
 =?us-ascii?Q?GIC+g9riREymODjz6kujx4iEA8AtQA25BWXwgLRatYLrqVgG8dNTDvQNNDvz?=
 =?us-ascii?Q?eG9n7G+GmEX5TMA+CBW44yO2pGrtaEgLfKVGedoWE/rpOJemYZIvUSUaiy6J?=
 =?us-ascii?Q?gebVRIUcMEmBtY0kSCTUI4u6yfLP7WBk6B1AfQpIR7RRYv/UQUvhysH4WV6E?=
 =?us-ascii?Q?XQhk5/CDEOvWysaGjHxCkxcUMnakX38mM85KMwLQVsC7FIjG613HQa1kDep+?=
 =?us-ascii?Q?6kfdbXbeL+Rtf5V/xCzf4H7LEb9m3WhuntuYKStvSoxnkrbMq20JvfzgfgxF?=
 =?us-ascii?Q?riGisti6EWM6ZDWEAttMxkFM2TqO/WcoezQpqm+UX0Zi7xZ7QwM2oJFF7JAm?=
 =?us-ascii?Q?eseYWwtNs5rxuo9Xwd7mTNcC6wEZWossnkb6pSGby1j+GaEwM1aiIvQkqvO6?=
 =?us-ascii?Q?mG+7m8kY4reXtIhJpPL279smmbqEZ4IaRzXTM+ee5oASxQvMCL0RB3ITys+f?=
 =?us-ascii?Q?1VxHzs4w3bBs4znoFx03L/MDaUQmm3wa65Rrmnjy+YROlq0cmeysSzvvQzl6?=
 =?us-ascii?Q?noudC5nusXcYaHEfvU8YvfgQocoCYMdcylyzndJk+6TFm4o+cQfBx4uFZtuW?=
 =?us-ascii?Q?oVzeFTcTklYs8TufifhFb2zvzQOM39/3UzkTO8JxUE8Ij+WJ6dww2xkPQ2Ne?=
 =?us-ascii?Q?mrlrJPA5vJ9cD9bD/NCqLF4aw88F+XM7KqT1aT4Zn+81oTaHMjhT2DyXKkAP?=
 =?us-ascii?Q?FCosJbaDyiroeU3jtKAagpUd/1cpAdifmGaRB3LNAtelb9njBNZ8xL3LVch/?=
 =?us-ascii?Q?Uxe5SSS15+lEMV2lGhXm3cb/p1++mfenmxGZPwGm8/oVvuF70vWjN/1RD1sa?=
 =?us-ascii?Q?Z8YQF4Kz9cW27wXWgRhXexQZfTga1qhOhNAytecfYlUegR9XZ/OkeQ4JW9/a?=
 =?us-ascii?Q?ID/RFFaARv5kA1txzxf32DuF1nkTxc4AnfBX6xy98Sjo26h+Dd+PbjTC8OAe?=
 =?us-ascii?Q?XiyhB3zItjw7lAbqGgWAEFBqS7k/WWLgwQMPT0eTmMeKYTFKn0quzr8zxG/W?=
 =?us-ascii?Q?elXwx+TdFfPi/Gu0QZ7YYQ1H+X752NGz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/zpS/hbxQXGhGn5CHG8N1bweZmkFT+vPj0ELog3Z8JEPiYFhpYxdsHdFhZcu?=
 =?us-ascii?Q?GcVCK7Z392/xUCByGeWJSbWVNvAKetXU755X3PIFfuKcliVwnoyfAAeG3K5k?=
 =?us-ascii?Q?qgNFdYLSqBDXX33wyePjg5nBiMkDphujfLQaqLL+OaTuEScx98H8sJgzl5Fa?=
 =?us-ascii?Q?BXGQp3sobwN2zS3lX9AydN17id32Qh4uc9ZUVRSOZwg6gtuTjWnREfM5Mxnv?=
 =?us-ascii?Q?ef78jw578+gzyUGkKs/M+DqzV6UfyW2RlgR6IEcpQ0DA2O86Jv9kLTTKEULR?=
 =?us-ascii?Q?ZnM4dSilKtG0TdH09im2SNmZXgOP/bXcKBOveibzmNIy9pk4sqnAoa9XFZWZ?=
 =?us-ascii?Q?4u2U5cKjDwqaQvADlb1h9SpCkF0bfBjEhVmVNyava8jNKdI1sVo+GjEmpk2l?=
 =?us-ascii?Q?08+N6ApMqU0D95E5+NNQ2tUky43PgkkXY6JHS3AOgZF3+44X6pOTbRO6ZitX?=
 =?us-ascii?Q?8/M32JfFOKtUANOBcG3uw5rOpnao+CywGHZ1I0OgCh325uWoFew0gGDp55ct?=
 =?us-ascii?Q?abss9QccNbIm7zcVU4xBIRYsJRx8OfMD8t9EZXQCl+0T69Nrn8uvEI1fbDYC?=
 =?us-ascii?Q?wlw4YEtoTYSJcNn5MW2PaVteKlkrkoBWOsVnd5qCx6/4SzUkZcnAKX4jY9is?=
 =?us-ascii?Q?gxYxFa8fk06BvQci1JeJrI/ZjTv513+FCGNzwKj4RRerIAD2v5IAYe/+zskc?=
 =?us-ascii?Q?npDidNuyxeyM8GYRMIu/3/d6xbRFNJ61dfC/c68zLoszrltU4XfiWqh6LKjo?=
 =?us-ascii?Q?KSYkfRoY802gWbRxeAR0UtCWiRl8NCgy1qG4q3aDf6Py8rjguU/HNlrB0128?=
 =?us-ascii?Q?y9yKmM8VNETs9ZZgxzVXfHiRn1e/NKzzN1nZMxfnIJn8Gxpb3gF7DR2aLGv9?=
 =?us-ascii?Q?36QxblC1Rm9V1uGMuGy+2keP/nKVnvfYWvx6O0g3N5xOajGktQOEoG75CY0R?=
 =?us-ascii?Q?9tixO68lW9e+hcE8gRAYZk3+GDEpefCBcPz2mFbiYpylo4Q2qkA2bsHpEC2s?=
 =?us-ascii?Q?qirqcwtCIkw6Jqrm+v8fG43uPrl69Y+AC6TVRgvZiD9UKjlgacw4YEWvbqPk?=
 =?us-ascii?Q?ijgvqKnn53lD+3RIXLCvF2w/NucA3ask2jahDmJr4APLQGZJmyV4vl5kNmjR?=
 =?us-ascii?Q?H4bGCtaJVRZBaWIosxFpq1BdOkMFUqph9Zht67tvLVHhqM9rP//TNLTr3KPX?=
 =?us-ascii?Q?QPTxySlEfzbJtQo2Qn2jNy2rr94jc3KsF+jGbJLZOAqQY6jDKNutgVKKNOVx?=
 =?us-ascii?Q?/1ffhyAVfcUCoZCyeNpqCJb6PLaTYoTgEFEjftbSBZf9wyDVEA7W+t5h2QBc?=
 =?us-ascii?Q?PcELGIlp/yo1oOIGdaexN9i5jxalpi7hmTJSajEPWLsaFNnY/xJPtavQLTzz?=
 =?us-ascii?Q?NJywy9u72LJMg4HG3gJZeCvUGp0+HnT4wXLpynoylEeLiP6MEm3fPEZxFVF0?=
 =?us-ascii?Q?nvpuB6GKIpQKu7TkmC6g2ClzAg8As8DOMTy6VNoAhsClSBvcfqDCARF7FuJZ?=
 =?us-ascii?Q?kE9/TEoV7EmiWpgvV/VJpECGP/sFk48o880ovTW+TeKqKYgBWSjDj6fVDDkt?=
 =?us-ascii?Q?3KowpXFmn/CD5OI54HkXfoMvkFmycV1jW+LZ2sJe1bhs8C+sQsUGJRS0YowA?=
 =?us-ascii?Q?L6cASBp3/73ywUTZOyjSt5UJa55qr/BTaqw+2dAqt0fqx3Ni3rIz+XsBSLkN?=
 =?us-ascii?Q?liWsUlBgJL6h/B4cMIlhYekIa/pAQ8Ma6ypCGfKg9Fn0dXY3+NzeplB9wAlK?=
 =?us-ascii?Q?jIxCj7IwvQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a77b30-d652-4d56-52f8-08de4dcdd37c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:19:14.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVNjhbtwEjfzOmw+y5CGx6oWbYbspNWZ1mWliW9w+Iqiy2ingrytWbJpk4+ZBapvgDxvDky+ND75nhYdmgQBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently when creating these device private struct pages, the first
step is to use request_free_mem_region() to get a range of physical
address space large enough to represent the devices memory. This
allocated physical address range is then remapped as device private
memory using memremap_pages().

Needing allocation of physical address space has some problems:

  1) There may be insufficient physical address space to represent the
     device memory. KASLR reducing the physical address space and VM
     configurations with limited physical address space increase the
     likelihood of hitting this especially as device memory increases. This
     has been observed to prevent device private from being initialized.

  2) Attempting to add the device private pages to the linear map at
     addresses beyond the actual physical memory causes issues on
     architectures like aarch64 meaning the feature does not work there.

Instead of using the physical address space, introduce a device private
address space and allocate devices regions from there to represent the
device private pages.

Introduce a new interface memremap_device_private_pagemap() that
allocates a requested amount of device private address space and creates
the necessary device private pages.

To support this new interface, struct dev_pagemap needs some changes:

  - Add a new dev_pagemap::nr_pages field as an input parameter.
  - Add a new dev_pagemap::pages array to store the device
    private pages.

When using memremap_device_private_pagemap(), rather then passing in
dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
be remapped, dev_pagemap::nr_ranges will always be 1, and the device
private range that is reserved is returned in dev_pagemap::range.

Forbid calling memremap_pages() with dev_pagemap::ranges::type =
MEMORY_DEVICE_PRIVATE.

Represent this device private address space using a new
device_private_pgmap_tree maple tree. This tree maps a given device
private address to a struct dev_pagemap, where a specific device private
page may then be looked up in that dev_pagemap::pages array.

Device private address space can be reclaimed and the assoicated device
private pages freed using the corresponding new
memunmap_device_private_pagemap() interface.

Because the device private pages now live outside the physical address
space, they no longer have a normal PFN. This means that page_to_pfn(),
et al. are no longer meaningful.

Introduce helpers:

  - device_private_page_to_offset()
  - device_private_folio_to_offset()

to take a given device private page / folio and return its offset within
the device private address space.

Update the places where we previously converted a device private page to
a PFN to use these new helpers. When we encounter a device private
offset, instead of looking up its page within the pagemap use
device_private_offset_to_page() instead.

Update the existing users:

 - lib/test_hmm.c
 - ppc ultravisor
 - drm/amd/amdkfd
 - gpu/drm/xe
 - gpu/drm/nouveau

to use the new memremap_device_private_pagemap() interface.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

NOTE: The updates to the existing drivers have only been compile tested.
I'll need some help in testing these drivers.

v1:
- Include NUMA node paramater for memremap_device_private_pagemap()
- Add devm_memremap_device_private_pagemap() and friends
- Update existing users of memremap_pages():
    - ppc ultravisor
    - drm/amd/amdkfd
    - gpu/drm/xe
    - gpu/drm/nouveau
- Update for HMM huge page support
- Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE

v2:
- Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
---
 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
 drivers/gpu/drm/xe/xe_svm.c              |  28 +---
 include/linux/hmm.h                      |   3 +
 include/linux/leafops.h                  |  16 +-
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |   6 +-
 include/linux/mm.h                       |   2 +
 include/linux/rmap.h                     |   5 +-
 include/linux/swapops.h                  |  10 +-
 lib/test_hmm.c                           |  69 ++++----
 mm/debug.c                               |   9 +-
 mm/memremap.c                            | 193 ++++++++++++++++++-----
 mm/mm_init.c                             |   8 +-
 mm/page_vma_mapped.c                     |  19 ++-
 mm/rmap.c                                |  43 +++--
 mm/util.c                                |   5 +-
 19 files changed, 391 insertions(+), 199 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..27067a6a2408 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -276,17 +276,12 @@ These can be allocated and freed with::
     struct resource *res;
     struct dev_pagemap pagemap;
 
-    res = request_free_mem_region(&iomem_resource, /* number of bytes */,
-                                  "name of driver resource");
     pagemap.type = MEMORY_DEVICE_PRIVATE;
-    pagemap.range.start = res->start;
-    pagemap.range.end = res->end;
-    pagemap.nr_range = 1;
+    pagemap.nr_pages = /* number of pages */;
     pagemap.ops = &device_devmem_ops;
-    memremap_pages(&pagemap, numa_node_id());
+    memremap_device_private_pagemap(&pagemap, numa_node_id());
 
-    memunmap_pages(&pagemap);
-    release_mem_region(pagemap.range.start, range_len(&pagemap.range));
+    memunmap_device_private_pagemap(&pagemap);
 
 There are also devm_request_free_mem_region(), devm_memremap_pages(),
 devm_memunmap_pages(), and devm_release_mem_region() when the resources can
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 67910900af7b..948747db8231 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -636,7 +636,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 		mutex_lock(&kvm->arch.uvmem_lock);
 
 		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-			uvmem_page = pfn_to_page(uvmem_pfn);
+			uvmem_page = device_private_offset_to_page(uvmem_pfn);
 			pvt = uvmem_page->zone_device_data;
 			pvt->skip_page_out = skip_page_out;
 			pvt->remove_gfn = true;
@@ -721,7 +721,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 	pvt->gpa = gpa;
 	pvt->kvm = kvm;
 
-	dpage = pfn_to_page(uvmem_pfn);
+	dpage = device_private_offset_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
 	zone_device_page_init(dpage, 0);
 	return dpage;
@@ -888,7 +888,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-		uvmem_page = pfn_to_page(uvmem_pfn);
+		uvmem_page = device_private_offset_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		/*
@@ -906,7 +906,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-		uvmem_page = pfn_to_page(uvmem_pfn);
+		uvmem_page = device_private_offset_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		pvt->remove_gfn = false; /* it continues to be a valid GFN */
@@ -1017,7 +1017,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 static void kvmppc_uvmem_folio_free(struct folio *folio)
 {
 	struct page *page = &folio->page;
-	unsigned long pfn = page_to_pfn(page) -
+	unsigned long pfn = device_private_page_to_offset(page) -
 			(kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT);
 	struct kvmppc_uvmem_page_pvt *pvt;
 
@@ -1159,8 +1159,6 @@ int kvmppc_uvmem_init(void)
 {
 	int ret = 0;
 	unsigned long size;
-	struct resource *res;
-	void *addr;
 	unsigned long pfn_last, pfn_first;
 
 	size = kvmppc_get_secmem_size();
@@ -1174,27 +1172,18 @@ int kvmppc_uvmem_init(void)
 		goto out;
 	}
 
-	res = request_free_mem_region(&iomem_resource, size, "kvmppc_uvmem");
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		goto out;
-	}
-
 	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
-	kvmppc_uvmem_pgmap.range.start = res->start;
-	kvmppc_uvmem_pgmap.range.end = res->end;
 	kvmppc_uvmem_pgmap.nr_range = 1;
+	kvmppc_uvmem_pgmap.nr_pages = size / PAGE_SIZE;
 	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
 	/* just one global instance: */
 	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
-	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
-	if (IS_ERR(addr)) {
-		ret = PTR_ERR(addr);
-		goto out_free_region;
-	}
+	ret = memremap_device_private_pagemap(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
+	if (ret)
+		goto out;
 
-	pfn_first = res->start >> PAGE_SHIFT;
-	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
+	pfn_first = kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT;
+	pfn_last = pfn_first + (range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT);
 	kvmppc_uvmem_bitmap = bitmap_zalloc(pfn_last - pfn_first, GFP_KERNEL);
 	if (!kvmppc_uvmem_bitmap) {
 		ret = -ENOMEM;
@@ -1204,9 +1193,7 @@ int kvmppc_uvmem_init(void)
 	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
 	return ret;
 out_unmap:
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-out_free_region:
-	release_mem_region(res->start, size);
+	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
 out:
 	return ret;
 }
@@ -1216,8 +1203,6 @@ void kvmppc_uvmem_free(void)
 	if (!kvmppc_uvmem_bitmap)
 		return;
 
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-	release_mem_region(kvmppc_uvmem_pgmap.range.start,
-			   range_len(&kvmppc_uvmem_pgmap.range));
+	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
 	bitmap_free(kvmppc_uvmem_bitmap);
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1a07a8b92e8f..1e7768b91d9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1024,9 +1024,9 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 {
 	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
 	struct dev_pagemap *pgmap;
-	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
+	int ret;
 
 	/* Page migration works on gfx9 or newer */
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
@@ -1047,11 +1047,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
 		pgmap->type = MEMORY_DEVICE_COHERENT;
 	} else {
-		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-		if (IS_ERR(res))
-			return PTR_ERR(res);
-		pgmap->range.start = res->start;
-		pgmap->range.end = res->end;
+		pgmap->nr_pages = size / PAGE_SIZE;
 		pgmap->type = MEMORY_DEVICE_PRIVATE;
 	}
 
@@ -1062,14 +1058,19 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	/* Device manager releases device-specific resources, memory region and
 	 * pgmap when driver disconnects from device.
 	 */
-	r = devm_memremap_pages(adev->dev, pgmap);
-	if (IS_ERR(r)) {
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+		ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
+	} else {
+		r = devm_memremap_pages(adev->dev, pgmap);
+		if (IS_ERR(r))
+			ret = PTR_ERR(r);
+	}
+
+	if (ret) {
 		pr_err("failed to register HMM device memory\n");
-		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
-			devm_release_mem_region(adev->dev, res->start, resource_size(res));
 		/* Disable SVM support capability */
 		pgmap->type = 0;
-		return PTR_ERR(r);
+		return ret;
 	}
 
 	pr_debug("reserve %ldMB system memory for VRAM pages struct\n",
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index adfa3df5cbc5..37fe1cfba414 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -109,7 +109,7 @@ static struct nouveau_drm *page_to_drm(struct page *page)
 unsigned long nouveau_dmem_page_addr(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
-	unsigned long off = (page_to_pfn(page) << PAGE_SHIFT) -
+	unsigned long off = (device_private_page_to_offset(page) << PAGE_SHIFT) -
 				chunk->pagemap.range.start;
 
 	return chunk->bo->offset + off;
@@ -297,9 +297,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
-	struct resource *res;
 	struct page *page;
-	void *ptr;
 	unsigned long i, pfn_first, pfn;
 	int ret;
 
@@ -309,39 +307,28 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 		goto out;
 	}
 
-	/* Allocate unused physical address space for device private pages. */
-	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
-				      "nouveau_dmem");
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		goto out_free;
-	}
-
 	chunk->drm = drm;
 	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	chunk->pagemap.range.start = res->start;
-	chunk->pagemap.range.end = res->end;
 	chunk->pagemap.nr_range = 1;
+	chunk->pagemap.nr_pages = DMEM_CHUNK_SIZE * NR_CHUNKS / PAGE_SIZE;
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
 	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
 				 &chunk->bo);
 	if (ret)
-		goto out_release;
+		goto out_free;
 
-	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
-	if (IS_ERR(ptr)) {
-		ret = PTR_ERR(ptr);
+	ret = memremap_device_private_pagemap(&chunk->pagemap, numa_node_id());
+	if (ret)
 		goto out_bo_free;
-	}
 
 	mutex_lock(&drm->dmem->mutex);
 	list_add(&chunk->list, &drm->dmem->chunks);
 	mutex_unlock(&drm->dmem->mutex);
 
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
-	page = pfn_to_page(pfn_first);
+	page = device_private_offset_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
 
 	pfn = pfn_first;
@@ -350,12 +337,12 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 
 		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
 			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
-				page = pfn_to_page(pfn);
+				page = device_private_offset_to_page(pfn);
 				page->zone_device_data = drm->dmem->free_pages;
 				drm->dmem->free_pages = page;
 			}
 		} else {
-			page = pfn_to_page(pfn);
+			page = device_private_offset_to_page(pfn);
 			page->zone_device_data = drm->dmem->free_folios;
 			drm->dmem->free_folios = page_folio(page);
 			pfn += DMEM_CHUNK_NPAGES;
@@ -382,8 +369,6 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 
 out_bo_free:
 	nouveau_bo_unpin_del(&chunk->bo);
-out_release:
-	release_mem_region(chunk->pagemap.range.start, range_len(&chunk->pagemap.range));
 out_free:
 	kfree(chunk);
 out:
@@ -543,9 +528,7 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 		nouveau_bo_unpin_del(&chunk->bo);
 		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
-		memunmap_pages(&chunk->pagemap);
-		release_mem_region(chunk->pagemap.range.start,
-				   range_len(&chunk->pagemap.range));
+		memunmap_device_private_pagemap(&chunk->pagemap);
 		kfree(chunk);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f82790d7e7e6..cce7b4fc5db9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -404,7 +404,7 @@ static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	u64 pfn = page_to_pfn(page);
+	u64 pfn = device_private_page_to_offset(page);
 	u64 offset;
 
 	xe_assert(vr->xe, is_device_private_page(page));
@@ -1471,39 +1471,27 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
-	struct resource *res;
-	void *addr;
 	int ret;
 
-	res = devm_request_free_mem_region(dev, &iomem_resource,
-					   vr->usable_size);
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		return ret;
-	}
-
 	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	vr->pagemap.range.start = res->start;
-	vr->pagemap.range.end = res->end;
 	vr->pagemap.nr_range = 1;
+	vr->pagemap.nr_pages = vr->usable_size / PAGE_SIZE;
 	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
 	vr->pagemap.owner = xe_svm_devm_owner(xe);
-	addr = devm_memremap_pages(dev, &vr->pagemap);
+	ret = devm_memremap_device_private_pagemap(dev, &vr->pagemap);
 
 	vr->dpagemap.dev = dev;
 	vr->dpagemap.ops = &xe_drm_pagemap_ops;
 
-	if (IS_ERR(addr)) {
-		devm_release_mem_region(dev, res->start, resource_size(res));
-		ret = PTR_ERR(addr);
-		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
-			tile->id, ERR_PTR(ret));
+	if (ret) {
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+			tile->id, ret);
 		return ret;
 	}
-	vr->hpa_base = res->start;
+	vr->hpa_base = vr->pagemap.range.start;
 
 	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
-		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
+		tile->id, vr->io_start, vr->io_start + vr->usable_size, &vr->pagemap.range);
 	return 0;
 }
 #else
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index d8756c341620..25bb4df298f7 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -68,6 +68,9 @@ enum hmm_pfn_flags {
  */
 static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
 {
+	if (hmm_pfn & HMM_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
+
 	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
 }
 
diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 2fa09ffe9e34..5c315af273a5 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -455,7 +455,13 @@ static inline unsigned long softleaf_to_flags(softleaf_t entry)
  */
 static inline struct page *softleaf_to_page(softleaf_t entry)
 {
-	struct page *page = pfn_to_page(softleaf_to_pfn(entry));
+	struct page *page;
+
+	if (softleaf_is_migration_device_private(entry) ||
+	    softleaf_is_device_private(entry))
+		page = device_private_entry_to_page(entry);
+	else
+		page = pfn_to_page(softleaf_to_pfn(entry));
 
 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
 	/*
@@ -475,7 +481,13 @@ static inline struct page *softleaf_to_page(softleaf_t entry)
  */
 static inline struct folio *softleaf_to_folio(softleaf_t entry)
 {
-	struct folio *folio = pfn_folio(softleaf_to_pfn(entry));
+	struct folio *folio;
+
+	if (softleaf_is_migration_device_private(entry) ||
+	    softleaf_is_device_private(entry))
+		folio = page_folio(device_private_entry_to_page(entry));
+	else
+		folio = pfn_folio(softleaf_to_pfn(entry));
 
 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
 	/*
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 713ec0435b48..7fad53f0f6ba 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -37,6 +37,7 @@ struct vmem_altmap {
  * backing the device memory. Doing so simplifies the implementation, but it is
  * important to remember that there are certain points at which the struct page
  * must be treated as an opaque object, rather than a "normal" struct page.
+ * Unlike "normal" struct pages, the page_to_pfn() is invalid.
  *
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/mm/hmm.rst.
@@ -126,8 +127,12 @@ struct dev_pagemap_ops {
  * @owner: an opaque pointer identifying the entity that manages this
  *	instance.  Used by various helpers to make sure that no
  *	foreign ZONE_DEVICE memory is accessed.
- * @nr_range: number of ranges to be mapped
- * @range: range to be mapped when nr_range == 1
+ * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
+ * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
+ * @nr_range: number of ranges to be mapped. Always == 1 for
+ *	MEMORY_DEVICE_PRIVATE.
+ * @range: range to be mapped when nr_range == 1. Used as an output param for
+ *	MEMORY_DEVICE_PRIVATE.
  * @ranges: array of ranges to be mapped when nr_range > 1
  */
 struct dev_pagemap {
@@ -139,6 +144,8 @@ struct dev_pagemap {
 	unsigned long vmemmap_shift;
 	const struct dev_pagemap_ops *ops;
 	void *owner;
+	unsigned long nr_pages;
+	struct page *pages;
 	int nr_range;
 	union {
 		struct range range;
@@ -224,7 +231,14 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
+void __init_zone_device_page(struct page *page, unsigned long pfn,
+	unsigned long zone_idx, int nid,
+	struct dev_pagemap *pgmap);
 void zone_device_page_init(struct page *page, unsigned int order);
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid);
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap);
+int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
+void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -234,6 +248,15 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
 
+struct page *device_private_offset_to_page(unsigned long offset);
+struct page *device_private_entry_to_page(softleaf_t entry);
+pgoff_t device_private_page_to_offset(const struct page *page);
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return device_private_page_to_offset((const struct page *)&folio->page);
+}
+
 static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
 {
 	zone_device_page_init(&folio->page, order);
@@ -276,6 +299,23 @@ static inline void devm_memunmap_pages(struct device *dev,
 {
 }
 
+static inline int devm_memremap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)
+{
+	/*
+	 * Fail attempts to call devm_memremap_device_private_pagemap() without
+	 * ZONE_DEVICE support enabled, this requires callers to fall
+	 * back to plain devm_memremap() based on config
+	 */
+	WARN_ON_ONCE(1);
+	return -ENXIO;
+}
+
+static inline void devm_memunmap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)
+{
+}
+
 static inline struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
 {
 	return NULL;
@@ -296,6 +336,26 @@ static inline void zone_device_private_split_cb(struct folio *original_folio,
 						struct folio *new_folio)
 {
 }
+
+static inline struct page *device_private_offset_to_page(unsigned long offset)
+{
+	return NULL;
+}
+
+static inline struct page *device_private_entry_to_page(softleaf_t entry)
+{
+	return NULL;
+}
+
+static inline pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	return 0;
+}
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return 0;
+}
 #endif /* CONFIG_ZONE_DEVICE */
 
 static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 5fd2ee080bc0..2921b3abddf3 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -133,6 +133,10 @@ static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
 	if (!(mpfn & MIGRATE_PFN_VALID))
 		return NULL;
+
+	if (mpfn & MIGRATE_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(mpfn >> MIGRATE_PFN_SHIFT);
+
 	return pfn_to_page(mpfn >> MIGRATE_PFN_SHIFT);
 }
 
@@ -144,7 +148,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
 	if (is_device_private_page(page))
-		return migrate_pfn(page_to_pfn(page)) |
+		return migrate_pfn(device_private_page_to_offset(page)) |
 		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e65329e1969f..b36599ab41ba 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
  */
 static inline unsigned long folio_pfn(const struct folio *folio)
 {
+	VM_BUG_ON(folio_is_device_private(folio));
+
 	return page_to_pfn(&folio->page);
 }
 
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 57c63b6a8f65..c1561a92864f 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
 static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
 {
 	if (folio_is_device_private(folio))
-		return page_vma_walk_pfn(folio_pfn(folio)) |
+		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
 		       PVMW_PFN_DEVICE_PRIVATE;
 
 	return page_vma_walk_pfn(folio_pfn(folio));
@@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
 
 static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
 {
+	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+
 	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
 }
 
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index f7d85a451a2b..def1d079d69b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -141,7 +141,7 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
 								       pgoff_t flags)
 {
-	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+	return swp_entry(SWP_DEVICE_READ, device_private_page_to_offset(page) | flags);
 }
 
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
@@ -152,7 +152,7 @@ static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
 								       pgoff_t flags)
 {
-	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+	return swp_entry(SWP_DEVICE_WRITE, device_private_page_to_offset(page) | flags);
 }
 
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
@@ -268,7 +268,7 @@ static inline swp_entry_t make_readable_migration_entry_from_page(struct page *p
 {
 	if (is_device_private_page(page))
 		return make_readable_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
@@ -283,7 +283,7 @@ static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(stru
 {
 	if (is_device_private_page(page))
 		return make_readable_exclusive_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
@@ -298,7 +298,7 @@ static inline swp_entry_t make_writable_migration_entry_from_page(struct page *p
 {
 	if (is_device_private_page(page))
 		return make_writable_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 872d3846af7b..b6e20041e448 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -497,7 +497,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
-	struct resource *res = NULL;
+	bool device_private = false;
 	unsigned long pfn;
 	unsigned long pfn_first;
 	unsigned long pfn_last;
@@ -510,13 +510,9 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	switch (mdevice->zone_device_type) {
 	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
-		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-					      "hmm_dmirror");
-		if (IS_ERR_OR_NULL(res))
-			goto err_devmem;
-		devmem->pagemap.range.start = res->start;
-		devmem->pagemap.range.end = res->end;
+		device_private = true;
 		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		devmem->pagemap.nr_pages = DEVMEM_CHUNK_SIZE / PAGE_SIZE;
 		break;
 	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
 		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
@@ -525,13 +521,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		devmem->pagemap.range.end = devmem->pagemap.range.start +
 					    DEVMEM_CHUNK_SIZE - 1;
 		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
+		devmem->pagemap.nr_range = 1;
 		break;
 	default:
 		ret = -EINVAL;
 		goto err_devmem;
 	}
 
-	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
 
@@ -551,13 +547,20 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		mdevice->devmem_capacity = new_capacity;
 		mdevice->devmem_chunks = new_chunks;
 	}
-	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR_OR_NULL(ptr)) {
-		if (ptr)
-			ret = PTR_ERR(ptr);
-		else
-			ret = -EFAULT;
-		goto err_release;
+
+	if (device_private) {
+		ret = memremap_device_private_pagemap(&devmem->pagemap, numa_node_id());
+		if (ret)
+			goto err_release;
+	} else {
+		ptr = memremap_pages(&devmem->pagemap, numa_node_id());
+		if (IS_ERR_OR_NULL(ptr)) {
+			if (ptr)
+				ret = PTR_ERR(ptr);
+			else
+				ret = -EFAULT;
+			goto err_release;
+		}
 	}
 
 	devmem->mdevice = mdevice;
@@ -567,15 +570,21 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	mutex_unlock(&mdevice->devmem_lock);
 
-	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
+	pr_info("added new %u MB chunk (total %u chunks, %u MB) %sPFNs [0x%lx 0x%lx)\n",
 		DEVMEM_CHUNK_SIZE / (1024 * 1024),
 		mdevice->devmem_count,
 		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
+		device_private ? "device " : "",
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
 	for (pfn = pfn_first; pfn < pfn_last; ) {
-		struct page *page = pfn_to_page(pfn);
+		struct page *page;
+
+		if (device_private)
+			page = device_private_offset_to_page(pfn);
+		else
+			page = pfn_to_page(pfn);
 
 		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
 			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
@@ -616,9 +625,6 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-		release_mem_region(devmem->pagemap.range.start,
-				   range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
@@ -696,8 +702,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		spage = migrate_pfn_to_page(*src);
 		if (WARN(spage && is_zone_device_page(spage),
-		     "page already in device spage pfn: 0x%lx\n",
-		     page_to_pfn(spage)))
+		     "page already in device spage mpfn: 0x%lx\n",
+		     migrate_pfn_from_page(spage)))
 			goto next;
 
 		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
@@ -752,8 +758,9 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
-		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		pr_debug("migrating from sys to mpfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage),
+			 migrate_pfn_from_page(dpage));
 
 		*dst = migrate_pfn_from_page(dpage) | write;
 
@@ -1462,10 +1469,10 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 			spin_unlock(&mdevice->lock);
 
 			dmirror_device_evict_chunk(devmem);
-			memunmap_pages(&devmem->pagemap);
 			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
+				memunmap_device_private_pagemap(&devmem->pagemap);
+			else
+				memunmap_pages(&devmem->pagemap);
 			kfree(devmem);
 		}
 		mdevice->devmem_count = 0;
@@ -1710,7 +1717,12 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 		return;
 	}
 
-	offset = folio_pfn(tail) - folio_pfn(head);
+	tail->pgmap = head->pgmap;
+
+	if (folio_is_device_private(head))
+		offset = device_private_folio_to_offset(tail) - device_private_folio_to_offset(head);
+	else
+		offset = folio_pfn(tail) - folio_pfn(head);
 
 	rpage_tail = folio_page(rfolio, offset);
 	tail->page.zone_device_data = rpage_tail;
@@ -1719,7 +1731,6 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 	rpage_tail->mapping = NULL;
 
 	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
-	tail->pgmap = head->pgmap;
 	folio_set_count(page_folio(rpage_tail), 1);
 }
 
diff --git a/mm/debug.c b/mm/debug.c
index 77fa8fe1d641..04fcc62d440f 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -77,9 +77,11 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
 	if (page_mapcount_is_type(mapcount))
 		mapcount = 0;
 
-	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,
-			folio->index + idx, pfn);
+			folio->index + idx,
+			folio_is_device_private(folio) ? "device " : "",
+			pfn);
 	if (folio_test_large(folio)) {
 		int pincount = 0;
 
@@ -113,7 +115,8 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
 	 * inaccuracy here due to racing.
 	 */
 	pr_warn("%sflags: %pGp%s\n", type, &folio->flags,
-		is_migrate_cma_folio(folio, pfn) ? " CMA" : "");
+		(!folio_is_device_private(folio) &&
+		 is_migrate_cma_folio(folio, pfn)) ? " CMA" : "");
 	if (page_has_type(&folio->page))
 		pr_warn("page_type: %x(%s)\n", folio->page.page_type >> 24,
 				page_type_name(folio->page.page_type));
diff --git a/mm/memremap.c b/mm/memremap.c
index 4c2e0d68eb27..f0fe92c3227a 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,9 +12,12 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include <linux/maple_tree.h>
 #include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
+static struct maple_tree device_private_pgmap_tree =
+	MTREE_INIT(device_private_pgmap_tree, MT_FLAGS_ALLOC_RANGE);
 
 /*
  * The memremap() and memremap_pages() interfaces are alternately used
@@ -113,9 +116,10 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 {
 	int i;
 
+	WARN_ONCE(pgmap->type == MEMORY_DEVICE_PRIVATE, "Type should not be MEMORY_DEVICE_PRIVATE\n");
+
 	percpu_ref_kill(&pgmap->ref);
-	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    pgmap->type != MEMORY_DEVICE_COHERENT)
+	if (pgmap->type != MEMORY_DEVICE_COHERENT)
 		for (i = 0; i < pgmap->nr_range; i++)
 			percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
 
@@ -144,7 +148,6 @@ static void dev_pagemap_percpu_release(struct percpu_ref *ref)
 static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		int range_id, int nid)
 {
-	const bool is_private = pgmap->type == MEMORY_DEVICE_PRIVATE;
 	struct range *range = &pgmap->ranges[range_id];
 	struct dev_pagemap *conflict_pgmap;
 	int error, is_ram;
@@ -190,7 +193,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (error)
 		goto err_pfn_remap;
 
-	if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
+	if (!mhp_range_allowed(range->start, range_len(range), true)) {
 		error = -EINVAL;
 		goto err_kasan;
 	}
@@ -198,30 +201,19 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	mem_hotplug_begin();
 
 	/*
-	 * For device private memory we call add_pages() as we only need to
-	 * allocate and initialize struct page for the device memory. More-
-	 * over the device memory is un-accessible thus we do not want to
-	 * create a linear mapping for the memory like arch_add_memory()
-	 * would do.
-	 *
-	 * For all other device memory types, which are accessible by
-	 * the CPU, we do want the linear mapping and thus use
+	 * All device memory types except device private memory are accessible
+	 * by the CPU, so we want the linear mapping and thus use
 	 * arch_add_memory().
 	 */
-	if (is_private) {
-		error = add_pages(nid, PHYS_PFN(range->start),
-				PHYS_PFN(range_len(range)), params);
-	} else {
-		error = kasan_add_zero_shadow(__va(range->start), range_len(range));
-		if (error) {
-			mem_hotplug_done();
-			goto err_kasan;
-		}
-
-		error = arch_add_memory(nid, range->start, range_len(range),
-					params);
+	error = kasan_add_zero_shadow(__va(range->start), range_len(range));
+	if (error) {
+		mem_hotplug_done();
+		goto err_kasan;
 	}
 
+	error = arch_add_memory(nid, range->start, range_len(range),
+				params);
+
 	if (!error) {
 		struct zone *zone;
 
@@ -248,8 +240,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	return 0;
 
 err_add_memory:
-	if (!is_private)
-		kasan_remove_zero_shadow(__va(range->start), range_len(range));
+	kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
 	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
@@ -281,22 +272,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
-			WARN(1, "Device private memory not supported\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
-			WARN(1, "Missing migrate_to_ram method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops->folio_free) {
-			WARN(1, "Missing folio_free method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->owner) {
-			WARN(1, "Missing owner\n");
-			return ERR_PTR(-EINVAL);
-		}
+		WARN(1, "Use memremap_device_private_pagemap()\n");
+		return ERR_PTR(-EINVAL);
 		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (!pgmap->ops->folio_free) {
@@ -394,6 +371,31 @@ void devm_memunmap_pages(struct device *dev, struct dev_pagemap *pgmap)
 }
 EXPORT_SYMBOL_GPL(devm_memunmap_pages);
 
+static void devm_memremap_device_private_pagemap_release(void *data)
+{
+	memunmap_device_private_pagemap(data);
+}
+
+int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
+{
+	int ret;
+
+	ret = memremap_device_private_pagemap(pgmap, dev_to_node(dev));
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
+			pgmap);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_memremap_device_private_pagemap);
+
+void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
+{
+	devm_release_action(dev, devm_memremap_device_private_pagemap_release, pgmap);
+}
+EXPORT_SYMBOL_GPL(devm_memunmap_device_private_pagemap);
+
 /**
  * get_dev_pagemap() - take a new live reference on the dev_pagemap for @pfn
  * @pfn: page frame number to lookup page_map
@@ -495,3 +497,110 @@ void zone_device_page_init(struct page *page, unsigned int order)
 		prep_compound_page(page, order);
 }
 EXPORT_SYMBOL_GPL(zone_device_page_init);
+
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid)
+{
+	unsigned long dpfn, dpfn_first, dpfn_last = 0;
+	unsigned long start;
+	int rc;
+
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE) {
+		WARN(1, "Not device private memory\n");
+		return -EINVAL;
+	}
+	if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
+		WARN(1, "Device private memory not supported\n");
+		return -EINVAL;
+	}
+	if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
+		WARN(1, "Missing migrate_to_ram method\n");
+		return -EINVAL;
+	}
+	if (!pgmap->owner) {
+		WARN(1, "Missing owner\n");
+		return -EINVAL;
+	}
+
+	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,
+			       GFP_KERNEL);
+	if (!pgmap->pages)
+		return -ENOMEM;
+
+	rc = mtree_alloc_range(&device_private_pgmap_tree, &start, pgmap,
+			       pgmap->nr_pages * PAGE_SIZE, 0,
+			       1ull << MAX_PHYSMEM_BITS, GFP_KERNEL);
+	if (rc < 0)
+		goto err_mtree_alloc;
+
+	pgmap->range.start = start;
+	pgmap->range.end = pgmap->range.start + (pgmap->nr_pages * PAGE_SIZE) - 1;
+	pgmap->nr_range = 1;
+
+	init_completion(&pgmap->done);
+	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
+		GFP_KERNEL);
+	if (rc < 0)
+		goto err_ref_init;
+
+	dpfn_first = pgmap->range.start >> PAGE_SHIFT;
+	dpfn_last = dpfn_first + (range_len(&pgmap->range) >> PAGE_SHIFT);
+	for (dpfn = dpfn_first; dpfn < dpfn_last; dpfn++) {
+		struct page *page = device_private_offset_to_page(dpfn);
+
+		__init_zone_device_page(page, dpfn, ZONE_DEVICE, nid, pgmap);
+		page_folio(page)->pgmap = (void *) pgmap;
+	}
+
+	return 0;
+
+err_ref_init:
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+err_mtree_alloc:
+	kvfree(pgmap->pages);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(memremap_device_private_pagemap);
+
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap)
+{
+	percpu_ref_kill(&pgmap->ref);
+	wait_for_completion(&pgmap->done);
+	percpu_ref_exit(&pgmap->ref);
+	kvfree(pgmap->pages);
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+}
+EXPORT_SYMBOL_GPL(memunmap_device_private_pagemap);
+
+struct page *device_private_offset_to_page(unsigned long offset)
+{
+	struct dev_pagemap *pgmap;
+
+	pgmap = mtree_load(&device_private_pgmap_tree, offset << PAGE_SHIFT);
+	if (WARN_ON_ONCE(!pgmap))
+		return NULL;
+
+	return &pgmap->pages[offset - (pgmap->range.start >> PAGE_SHIFT)];
+}
+EXPORT_SYMBOL_GPL(device_private_offset_to_page);
+
+struct page *device_private_entry_to_page(softleaf_t entry)
+{
+	unsigned long offset;
+
+	if (!((softleaf_is_device_private(entry) ||
+	    (softleaf_is_migration_device_private(entry)))))
+		return NULL;
+
+	offset = softleaf_to_pfn(entry);
+	return device_private_offset_to_page(offset);
+}
+
+pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	struct dev_pagemap *pgmap = (struct dev_pagemap *) page_pgmap(page);
+
+	VM_BUG_ON_PAGE(!is_device_private_page(page), page);
+
+	return (pgmap->range.start >> PAGE_SHIFT) + ((page - pgmap->pages));
+}
+EXPORT_SYMBOL_GPL(device_private_page_to_offset);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index fc2a6f1e518f..4a9420cb610c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1004,9 +1004,9 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
+void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
+				   unsigned long zone_idx, int nid,
+				   struct dev_pagemap *pgmap)
 {
 
 	__init_single_page(page, pfn, zone_idx, nid);
@@ -1038,7 +1038,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * Please note that MEMINIT_HOTPLUG path doesn't clear memmap
 	 * because this is done early in section_activate()
 	 */
-	if (pageblock_aligned(pfn)) {
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE && pageblock_aligned(pfn)) {
 		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 96c525785d78..141fe5abd33f 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
 static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 {
 	unsigned long pfn;
+	bool device_private = false;
 	pte_t ptent = ptep_get(pvmw->pte);
 
 	if (pvmw->flags & PVMW_MIGRATION) {
@@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		if (!softleaf_is_migration(entry))
 			return false;
 
+		if (softleaf_is_migration_device_private(entry))
+			device_private = true;
+
 		pfn = softleaf_to_pfn(entry);
 	} else if (pte_present(ptent)) {
 		pfn = pte_pfn(ptent);
@@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 			return false;
 
 		pfn = softleaf_to_pfn(entry);
+
+		if (softleaf_is_device_private(entry))
+			device_private = true;
 	}
 
+	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
 	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
@@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 }
 
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
-static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
+static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
 {
+	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
 	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
@@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 
 				if (!softleaf_is_migration(entry) ||
 				    !check_pmd(softleaf_to_pfn(entry),
+					       softleaf_is_device_private(entry) ||
+					       softleaf_is_migration_device_private(entry),
 					       pvmw))
 					return not_found(pvmw);
 				return true;
@@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			if (likely(pmd_trans_huge(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
 					return not_found(pvmw);
-				if (!check_pmd(pmd_pfn(pmde), pvmw))
+				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
 					return not_found(pvmw);
 				return true;
 			}
diff --git a/mm/rmap.c b/mm/rmap.c
index 6a63333f8722..3f708ed5c89f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1860,7 +1860,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long nr_pages = 1, end_addr;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 	int ptes = 0;
 
@@ -1967,15 +1967,20 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
-			pfn = softleaf_to_pfn(entry);
+			if (softleaf_is_device_private(entry) ||
+			    softleaf_is_migration_device_private(entry))
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2289,7 +2294,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	struct page *subpage;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 
 	/*
@@ -2328,7 +2333,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
-			__maybe_unused unsigned long pfn;
+			__maybe_unused softleaf_t entry;
 			__maybe_unused pmd_t pmdval;
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
@@ -2340,12 +2345,17 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 			pmdval = pmdp_get(pvmw.pmd);
+			entry = softleaf_from_pmd(pmdval);
 			if (likely(pmd_present(pmdval)))
-				pfn = pmd_pfn(pmdval);
-			else
-				pfn = softleaf_to_pfn(softleaf_from_pmd(pmdval));
+				nr = pmd_pfn(pmdval) - folio_pfn(folio);
+			else if (softleaf_is_device_private(entry) ||
+				 softleaf_is_migration_device_private(entry)) {
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			} else {
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+			}
 
-			subpage = folio_page(folio, pfn - folio_pfn(folio));
+			subpage = folio_page(folio, nr);
 
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
@@ -2368,15 +2378,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
-			pfn = softleaf_to_pfn(entry);
+			if (softleaf_is_device_private(entry) ||
+			    is_device_private_migration_entry(entry))
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2436,7 +2451,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 			writable = pte_write(pteval);
 		} else if (likely(pte_present(pteval))) {
-			flush_cache_page(vma, address, pfn);
+			flush_cache_page(vma, address, pte_pfn(pteval));
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
 				/*
diff --git a/mm/util.c b/mm/util.c
index 65e3f1a97d76..8482ebc5c394 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1244,7 +1244,10 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	struct folio *foliop;
 	int loops = 5;
 
-	ps->pfn = page_to_pfn(page);
+	if (is_device_private_page(page))
+		ps->pfn = device_private_page_to_offset(page);
+	else
+		ps->pfn = page_to_pfn(page);
 	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 
 again:
-- 
2.34.1


