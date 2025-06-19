Return-Path: <linuxppc-dev+bounces-9524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC132AE0012
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 10:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNDbb0y1Yz2xjN;
	Thu, 19 Jun 2025 18:41:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::62f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750322475;
	cv=pass; b=n5b+UUr0UXzHe95BSRZr/EwVs3wanH7eMBy9/P2AB9J761ykiYQ5qbF08Rq/s1cBwHIZD6gyqZY/XxOSvmybwXBt05ed5n5kwfJZyRP/QBjMJ/SGLe6dxWs6uzOGo4fhF6fFabAJgdcqf1juY/dz8iJlirN4lmDk7fI27tUyVhZO3s14uPVKb4eCnOI0eTzm4JlCgb0a9Ue0uRRFQwdwUs//cMAEShbQy8OQBgP3uNmr6izgi8yx8ZMJf3zKxkZa0NP4CubGL0+8nkx3XGz2/Xdh9DKWOvVjKaZKXh50cYm/40CsKkxt7MquKJbt+/j8KaVqND6zmOiwMdC/+JNyWg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750322475; c=relaxed/relaxed;
	bh=/APESILuLdeMQcvbDqlXVLACGWdbI/TPz9uyYusvHsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aKCQgSUKjjz56BFOJRouH7GLQVcRkYDzgXd7Ukq6ZZcLhb22DW4QJjsvPZIp9UNw0V/jWAAzWJNqUUuW74my6oo3Ccn2gbG/Nxz16e+ALWfFgMhXuGNUDfVnsk9FZNXg0QyJQqE7aOyDVQznKJDPSuXgOZZSw9fdi7H0OrqIfDxhYw8xAi3BGACPk5a6/tv0zmfY3onUxtUVmFkgYU5Hb16bj8QrZHElZ6OU49FUFr9rPOufF4Mf+noRIy43WdK5etn2UPptUJrW+eDDTB3EdZbCs5x770ltNgRgzX8Hf6b7/gociCXusYkbmj/8TtERBzVWc7ndUBnipRs8kx0Y9Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OWuelqMN; dkim-atps=neutral; spf=temperror (client-ip=2a01:111:f403:2416::62f; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OWuelqMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::62f; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNDbT0tV3z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 18:40:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxZNUPS8wWkhxoFzmIm4ExRJmEjhEM0QFlJ7K8sbdrLaZfSI1HmZOM/TjtZBohZEdIPv9aVH6pYwrEEAb/pyfzqFEbBcE2pzgJWzvvT2mDzjWeE2QO9yzm5Yha78JO1lbwyYG/5jonzh2UD0W+dKZLvXfKc//sHdw0eSMYqQD7fMmX+Ei6NJ5N9XG6+JobkMHlUo8ZRpD3ONJF/y0I14rl4Eo7OmgpOvcpx5banIDC1HgUUVoyOagOJ0ePjjlBz/FMt4FwBzITRSizIQ9NCW16Ma/OJlvGMGCAAZGnfor4OtPUUem2gOfyCKwlk8l/P5TnojP7EeHFrQinSCX0fNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/APESILuLdeMQcvbDqlXVLACGWdbI/TPz9uyYusvHsk=;
 b=TE2uOSsto7jYYwanfKruPJwrbaevFklxIFKZlya5MR4bydmsRT/CW22P5WbALmrtPGcfsFXMQjKR0MDFE91X88s2GnPeq1VSxcOqBnjYoaYg3GTmKS2XVt89O80qy4mobX/4M/GrQw/t2aXuvrJ4THAO328c41hzQD4PAigK3YAj+mD1c++PamQ7yGWv5tUazTYzkepVV+t8pi6lOhvX3OyLvDr7tCQmyMXVBbuHoRFMOBFV8ZhkzC34P0vavLtpD/0+4tkwwe4SYJIzgLL8xnSbTMrlb2vqoMEqxTgiTV+cvuGWiAkpIQWX/H0I2dViAy23zACQwyaRRsnlTnlIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/APESILuLdeMQcvbDqlXVLACGWdbI/TPz9uyYusvHsk=;
 b=OWuelqMNnWxNUyFoEHIgOp037/y0FoJ0g/YtyylxAbb60HFRTWxgo5XNFu8oncBtzo3zg4L0LFJPxNlk7n+j0+OK7DtNGyTp/134j7wBrt1/sPllGPgBmbhKVXZeMDjMP+EBMNIg1RMFQ/eoYNb6zFTnlwfLyiqA+Tf8Ua0MOCnjYPBLc/CjNx6plD9ENc0IjFpq03/MzO+VpL1r/GwxyIoyopcOyDnryR6MIuyq3Cj/jUp9K5bskM8PfoFLEYi8mBPGneICdKhzKhthlU2FMBHqRUorEbktQdhLg94OXInEPfnxLaBoyUUPvi8QEFdn3XEgG2oZw2gJ4chwp0iwEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Thu, 19 Jun
 2025 08:40:29 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 08:40:29 +0000
Date: Thu, 19 Jun 2025 18:40:24 +1000
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, 
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com, 
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, John@groves.net, m.szyprowski@samsung.com, 
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 01/14] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <oxfnukq5ebffpycvwsjs237zkc7r2kyg6piwvoxnmuczavxv6b@wwjljv5zmcbv>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <361009510f346090fad328c53ec228d99bb955ee.1750075065.git-series.apopple@nvidia.com>
 <bf855ce0-d0ba-4bd6-bfc1-8be2fdbdfe70@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf855ce0-d0ba-4bd6-bfc1-8be2fdbdfe70@redhat.com>
X-ClientProxiedBy: SYBPR01CA0049.ausprd01.prod.outlook.com
 (2603:10c6:10:2::13) To CY8PR12MB7705.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 26384549-292d-4295-de44-08ddaf0cf1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YnNYhnIryYgcsvMOiIFtjx+k0f9gYGxOpCQzWDOgj7wdEHdCuQs3CjFCu61N?=
 =?us-ascii?Q?DYnvAIvQxXVB64LJHtzsls5UYJr2NvEIm0IFK8aevXhVNfwQKyupdmqiBM2q?=
 =?us-ascii?Q?XZHQtDc+7n8CYVDAxl4szvJFmx5fVXXn2qsQd/cTBq1O+8Xugu/BrmwUwO0Z?=
 =?us-ascii?Q?LwA2PBN9sydYeY5GxTCfXLCef1xZBwwuhuJ1fFfqT3a3OyekELKmgOkjUBpw?=
 =?us-ascii?Q?hvV34OF8YWlFi+5hdoVLx/ChJeFCQiaOjFJmOA+7G5gWQdtwwDREgES8JUt9?=
 =?us-ascii?Q?Jqv5JjRZDChzntr3SQd+CS2DPps7jESW+qZCkmRNPbKGAVylvsXHAgIhC47J?=
 =?us-ascii?Q?jC7feojeEpU5RxahdyyU582V7fk4cjQlYQLmuyl6x8M8R9Qnj77YOa8rPyVi?=
 =?us-ascii?Q?e7h79YcKgl5brm7O08eXzxr0vNRcwBVS7fonmv58DiiiYT5wJDUlX1THfaug?=
 =?us-ascii?Q?Vm6oc2DzxQ7wpObHNk/zNDMzLLmuBexKRZb32gZiJoBSVkxZ9OsZ/EjEbhIM?=
 =?us-ascii?Q?cnlPJgZjl6ar4HjjKjo8sY4OAw1SqW3V/7okcZsHuTlJPSM+jwVPLrbv6kje?=
 =?us-ascii?Q?aHViNFJqo/pTObj1o+NhK/Mb51DZPJ3CXr7FN6aBLg0Occffckid4IoY9Fki?=
 =?us-ascii?Q?IOW1cKFIL4yE4OiiiCXI+tpMcNTpkgr/X9gHGKrEdBTUgeaxgw7oaysf0NXc?=
 =?us-ascii?Q?u1HN0M2vF26Ua1UXrqomCwWO0fpOH3rZQRCh+DsgmBztfkFHTEDJGpPUigS7?=
 =?us-ascii?Q?kAaPMOND6tYvZwBMfl/4BVjhPEPfaM77XZA8XWScRIkrsxO0LXlUPiddzkZG?=
 =?us-ascii?Q?HQgqOCNRVmikUzFe2pxplYoczG/wyNeF5JAytfaMkRlDpPLWmojCjamHsRz3?=
 =?us-ascii?Q?3HPbeBc62KNlVFJjRClYQnBBlLigshu6nbWhmJS3pSqVNIpCIiG4vfT+CIvf?=
 =?us-ascii?Q?wK17cVqPsSVl9zfn9TGNI+nRp+/vx2eg4dhUoLPor6/2l73HlwD5ZYDNW3xu?=
 =?us-ascii?Q?XlwqcTHRu7y0Ww/yD+MdpucL3nxahnVGPqsYCqMkjubHAcEn9Z86rjCVIwbW?=
 =?us-ascii?Q?lc5G8SooUx8+VSF5IXUd/BCkYWinOkMZ69ybCTcL3B/Eu83oEg9pQgm7v5RU?=
 =?us-ascii?Q?zFq3U/5cT39IN3RuKwFFl6UtshGyXfej8KXHWsA0TIb1N5R6q2k/CdfrIHAi?=
 =?us-ascii?Q?76buXhGFmyJN+mE86sgmJRzkxAKfYiQOR0tdYC10LnIdOg4PVyJ+gtVKjMTH?=
 =?us-ascii?Q?jvinCKumXQlp8VKGkEkti912W1qH7uVRYwZBj7/9ykVN4Rt0J86FBOSOhm/U?=
 =?us-ascii?Q?tR2dQR0BbUgxnj1squSM5PrSRGV/+8cf46efeYNDJTR8KcXZ9eadUXvRY3LG?=
 =?us-ascii?Q?k88glxo2egDPzDPvcBUt0ui7NJUUYzd8OiMd34C6d3H+9vxXfR/Bw2B+Yqpe?=
 =?us-ascii?Q?MMF0ZZ+cRP0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1BIRC8ebNzJojU9IWpb03BXCuSKv8UA2gI7DftJ69fJ/VtnhPXVKZZKfTHWw?=
 =?us-ascii?Q?Z0zcJDItw6Ok2y6AYEXlJ2ZC1WsCI8dbsGEarIbRERqoe2VYFQWliRL5NTay?=
 =?us-ascii?Q?rwza12NyjHMm4TbqbT3uPJ6dSs5yg8Lb+34jDLa965Luu3BGYjjW3nuz1uLQ?=
 =?us-ascii?Q?H1B3X99t9f5p/C38wYbNgZCXNHtne8TkPwEQ+P6Mtr/nxdWkRrwr3Pzezua2?=
 =?us-ascii?Q?g+NZopsCZ4JYcl7hkeLrN6aJMSeitCmFzbBpKE0u5VXTUKVvLir2quLI5ejN?=
 =?us-ascii?Q?K/A0jq6R2HjGXYScnHMvUTzICXWVxp1ntUZMF8tS0SdrQBz8NAcZaUHrMSx1?=
 =?us-ascii?Q?33ZahucBpbd+AG9vv8eeAMNVYN/SigsXYD/K447MRuH+AkHp4kivWQMwtBQl?=
 =?us-ascii?Q?3+ce19nyGC3S4vIrzkfHt7h0ortyQWWG+sIsjZAdScN8I1Hh4OAKN4AjGM5s?=
 =?us-ascii?Q?ijECRJilm3qcI/5DS7oHLXmuGqCpD4uVxJj0COWS71AT7tSRsJ86DZTBaeeD?=
 =?us-ascii?Q?sh827a2MAfOUvKxHlVfrBZrjQ25Bh1n1oSo1L36x9/S7UGbH2tcD7lKg0Pzr?=
 =?us-ascii?Q?T1dEfkckwEUbMMiTyl/U/zbJ2wR8KPvSRKyHpdbww1ZeY6Jh62VwKsk3oLkA?=
 =?us-ascii?Q?tb1+JEg+zdD4qvgzWvEUcI3i9bnEhZXhd1q20AcrNRhJqRNlUqmSz7SC1/rw?=
 =?us-ascii?Q?e5A/aFSaRVeEeqhkvc0S8snb8+6VRKcgHBs6Ia9pjpwEacqFh27Qc/QHv8A0?=
 =?us-ascii?Q?RAflAALH7AdV7xMdJy946+yy4dynBvmAVD6rNKC2EfTfmGPXsJp95Eb8NMR6?=
 =?us-ascii?Q?ThSi96xLWEkq3CYarQ5VgCpcBsR15Gt9mIUNYxZh9+TKaqNJpSAQKF4MaGCd?=
 =?us-ascii?Q?AjY2laZAOvGAK2Tu9pJoQ5zD2b7Qc4sKE1jBV4IYC2NuerOJuUD1JtHQXbMu?=
 =?us-ascii?Q?gW+1RTmHq9KR34O3SYq2nzlV+gwfkBn+cBiqlqi3WM1fCF0USNG1FjOcRXJf?=
 =?us-ascii?Q?GXso3LpZGXzPfkchYzrsARTLVfdCvYI8Iedptz3x7zgJv0KuwgGOpXZ5N7OP?=
 =?us-ascii?Q?qMw2BM4dRXXnNTlUtYU/aXyreF1gra94sGw2JrfZWwE+YFPKlR5RxONGcfUU?=
 =?us-ascii?Q?Zy5MDd6kO8XEDINk3fHt9EGH3wKQ5uuizhu2d6XffqHILyPQrkgIu8D8OWJ6?=
 =?us-ascii?Q?N/9nLXWCEBa8Buo8I8O1lX8iMZ4X9rkt0wWxt3rA+NMDxLIOktEbo86kkcic?=
 =?us-ascii?Q?5mQjjFVd7IzQasxPi2GeE4Zx9+3fkhqxHBp8jqwsQYnJIZsp1pO5HgifGFbw?=
 =?us-ascii?Q?Pexq7nDzp8UHyB0EwxJzgnLgyb7ub6kBUWGB4uCWsG0tWTWjTzNaWs9roP2N?=
 =?us-ascii?Q?5zm8yp3CyIY+F2FUAF1on0zMuD//g0A6KbTgcwGy62qdaGi1ZKAd4D6iX7ne?=
 =?us-ascii?Q?EXJUxRrj4uzGh2ZbEyNA0xNot6gSca/URZkzFonGQKDu4DUFj5fz+MSZMjRT?=
 =?us-ascii?Q?9ySAnedzQzifFJH7tP2gw1nVxuefjEr9fEFX2uJ1o+MAii9g1dCp+jJiLWRF?=
 =?us-ascii?Q?zVbskoc7mV+SEryG98d0TMCksYifpqwZYHFDoJs6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26384549-292d-4295-de44-08ddaf0cf1aa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:40:28.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EY1NgozUq4ApkAmyh0mocnA6g5ioPWsM3lX+4YedOAZTByj5xGGvAeU/XijncjGlOj3Catu+bYM0PK9rrIj9nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274
X-Spam-Status: No, score=-2.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FORGED_SPF_HELO,SPF_HELO_PASS,T_SPF_TEMPERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 17, 2025 at 11:19:34AM +0200, David Hildenbrand wrote:
> On 16.06.25 13:58, Alistair Popple wrote:
> > Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> > pages. Therefore page walkers that want to exclude DAX pages can check
> > pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> > meaning dax pages are mapped as normal pages.
> > 
> > Ensure page walkers that currently use pXd_devmap to skip DAX pages
> > continue to do so by adding explicit checks of the VMA instead.
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > 
> > ---
> > 
> > Changes from v1:
> > 
> >   - Remove vma_is_dax() check from mm/userfaultfd.c as
> >     validate_move_areas() will already skip DAX VMA's on account of them
> >     not being anonymous.
> 
> This should be documented in the patch description above.

Ok.

> > ---
> >   fs/userfaultfd.c | 2 +-
> >   mm/hmm.c         | 2 +-
> >   mm/userfaultfd.c | 6 ------
> >   3 files changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index ef054b3..a886750 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -304,7 +304,7 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
> >   		goto out;
> >   	ret = false;
> > -	if (!pmd_present(_pmd) || pmd_devmap(_pmd))
> > +	if (!pmd_present(_pmd) || vma_is_dax(vmf->vma))
> >   		goto out;
> 
> VMA checks should be done before doing any page table walk.

Actually upon review I think this check was always redundant as well -
vma_can_userfault() checks limit userfaultfd to anon/hugetlb/shmem vma's. Boy we
sure have a lot of these "normal vma" checks around the place ... at least for
certain definitions of normal.

Anyway will remove this and add a note to the commit (and apologies for not
catching this last time as I think you may have ready mentioned this or at least
the general concept).

> >   	if (pmd_trans_huge(_pmd)) {
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index feac861..5311753 100644
> > --- a/mm/hmm.c
> > +++ b/mm/hmm.c
> > @@ -441,7 +441,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
> >   		return hmm_vma_walk_hole(start, end, -1, walk);
> >   	}
> > -	if (pud_leaf(pud) && pud_devmap(pud)) {
> > +	if (pud_leaf(pud) && vma_is_dax(walk->vma)) {
> >   		unsigned long i, npages, pfn;
> >   		unsigned int required_fault;
> >   		unsigned long *hmm_pfns;
> 
> Dito.

Actually I see little reason to restrict this only to DAX for HMM ... we don't
end up doing that for the equivalent PMD path so will drop this as well. Thanks!

> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index 58b3ad6..8395db2 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -1818,12 +1818,6 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
> >   		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
> >   		if (ptl) {
> > -			if (pmd_devmap(*src_pmd)) {
> > -				spin_unlock(ptl);
> > -				err = -ENOENT;
> > -				break;
> > -			}
> > -
> >   			/* Check if we can move the pmd without splitting it. */
> >   			if (move_splits_huge_pmd(dst_addr, src_addr, src_start + len) ||
> >   			    !pmd_none(dst_pmdval)) {
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
> 

