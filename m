Return-Path: <linuxppc-dev+bounces-15375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B1CFCD19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:20:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtX747tz2yjx;
	Wed, 07 Jan 2026 20:19:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.61.13 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777572;
	cv=pass; b=ldUlSkZMIPQy/wpSK3NwUg1CeVQxI2plTYlaYtVEKlb1x9twhNjTnbmytXPF1S5WRAhach3ohnGMxtWl7h2EdeVni6Om11+8JB9F1/Q04EoZ46ah4fpO8yPKw4xVL65GHFVcS4Scc4FpXoW1GPIaPtidaF7m7RZqV6ttke4oDDFaGP9yQB61A2Dcx6xiT7AUqGGNAkjOQQ2fMJSw018pBen1YdBvw/qEblrcfWTwI0DmjFYmH+FNYs4VXdaov8sYkSQfsCVAFxGA8DPRS6rlEP0tRCNTDiaPzNk5tqY9E4wwFhwzdesS9JQDZzxABshD4d3Xh9sqJsJDtLzDW5OBVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777572; c=relaxed/relaxed;
	bh=lD1YgRjHKutvEUCMXbItDWnQyct03W+owQY7GnvxPBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kY4KO1vJ7ubNuNw9px9sn1tNjIKFOnQ+RjgrUsaoqt5dJprrOwPpLRZP9XAKwAKLppKTPOsvr8W6eUdQ9cO+is2h+WyjMSCSORH2R+SIghtvZ2mKYC4B+2P9K3UoZ37NfrXZfhfMeH1BXFGE74eUJ2q7ke0mM9b5sa/lg8Njrwnekzu0uVLMmoGS5s/tJFJ0ziAxh418w24y0Jc29Uf3u/FdcSTSd22ND98LF7h9dZ5QVwViDkm55CinCf8iGvbkZED68scCCAgFBxLtE01kMXJDjbTe//c0XgrkgYJOUxOilEvuzEPoGjCsJUxnRl5aXFQgoLRe42Dz2rO24ex3KQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZEMSQ0ht; dkim-atps=neutral; spf=pass (client-ip=52.101.61.13; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZEMSQ0ht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.61.13; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtW6tQ5z2yGQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acMk6KDzHj9ixLSibYTD3yVfsghMYzOxRIPyqbkEN7agR/KlGY9xCHkfrNPqFn4BZJoriIr8fabBp+5vQ9LEGclExgiNRqRCl7lco0vwpkZ+/5umOi9WUy6z5BpZ85Lurzg8zb4BjGErsnlcYczDmzb0FPSd5OFaXWDVGqYz/X/FA80NRGOaTxbUDFthj/1v5X7JP0NjMaYteR6tERwSgixi/diwb42xwjAXFHDItqLYFLGRa3Ho2hvOGJ6qNSNTiomxrRGZpYcjzC1PYGFXIDskOko7itwN1iMurUTP9nN7XgH0avhmkG7HHcHwd0BhcGU1GcamLtJpV7reOspLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD1YgRjHKutvEUCMXbItDWnQyct03W+owQY7GnvxPBM=;
 b=ZtqlHxFVuBhZVtriJgWEsdngY+zexhVvCuc8K5G33TXn1Wp42fev1OZKyb34FxE6qnuOLg+O4aaQYP9HyoBeWL6mcPqImjVvsL4XSKDDR7AY4VnInUiexvusS0Pxg9GeYmSVVmdBXtqgK+yB974b4EO98kkAvKI3qiWFh8jC7PQbveBfXnWOmb3ldsSR4a6kilZoHxQOjdzC6VVnAuhpjSVejasmL26tyy1GXui/RXVgZd+J+CBLjcd6IMcG5BVQiEiGP9txA7qFkQSWlt08aje/UpLpG5Q0R3MTyT6tYpR2HtJ9a+lrkLAuQIqfpTi1OZZz1M3aGrjkcKKuyGyxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD1YgRjHKutvEUCMXbItDWnQyct03W+owQY7GnvxPBM=;
 b=ZEMSQ0ht27aI1SeLQxnolrucOAitj2ZTP+kDYVOcnC5Z7WquVH6o6GzTsfkNbh7Qx8mKoWCi0ZiTEsZTeUyiQ+Ft4WkYAGaCf8eNMbhyr6KijzIKROb31zvInd1SyIIpBzOLmWG860bwKXa0dlA2AsPdg64xa9pLx5vegPofxcFtr5nfrVrKrIWuDlpRgBdHio/0HEopGjgdJ/3h1pnQRtnn+fe1BdGIZoNopwEVKYAb8oLDhCvhgoXycKGLfvcLs8Izi0oGiOLD/2PzGI0NrJUUR5vJTaI++MT2tVfPuR0zhC6gIuy3PgGIyv+eyGXUHQd2Qj6Kj1wXnuUYR/t5yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:35 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:35 +0000
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
Subject: [PATCH v2 01/11] mm/migrate_device: Introduce migrate_pfn_from_page() helper
Date: Wed,  7 Jan 2026 20:18:13 +1100
Message-Id: <20260107091823.68974-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 77421d5e-6823-40ff-3168-08de4dcdbc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MPVAKCsLojM+nONmnN+T/cEeNXgT8Uw+c+yEoVRR1EKMH5DWDCkgaD+DymVa?=
 =?us-ascii?Q?PEAxXJ2PhNjAFwGfH8+KELxS0dfab5kaP9fOB2LgSEpPS71PImkduOhnap81?=
 =?us-ascii?Q?5BZ5BYuQuRVVNAkrGirj5JHK6DrpkjSA3ZiP8n2hVP+MF91aVy7QpRJCoa91?=
 =?us-ascii?Q?RDFuK6F9wB4bDQ7lm+A/0labKV4XfyVncx+ZcIZ0wAeZMbm3BnUIJVVgukmP?=
 =?us-ascii?Q?8Bt7f2aRW65DWFxhtfb01wwflToLpMJ5rsUseAkHHKKsIGhBc2m4XGJIjmeU?=
 =?us-ascii?Q?BPlcllFBkQn4e1J1XqPwebBDfOLsJGavJAzEn0yvM/X1Udv3upC/qeYkqO4Y?=
 =?us-ascii?Q?iD3BxfHiPXVLNeeXTf+FBTvlie2fp2Sxovxm+XNXDerMIs+iTVukOHqgfnPR?=
 =?us-ascii?Q?j5doxMq6r7dRax24mqGmLtItXe6xck5KMwFq5rycuecXjO3ycgYHu1BFt/P/?=
 =?us-ascii?Q?2P86VRqUrSFpFe8KbNUSYiNK7aR9j6XZlAL4k2lQORaBJ9faFFKeDeLaZERK?=
 =?us-ascii?Q?0jJMg9jIpbbbSL+gUprJFidVvPocBMZNxk6XyJDoq3gb1Fmae3ujUxdP4YNb?=
 =?us-ascii?Q?XLz87F2u/VehiIVmZW5oJOyyt3HocygqHbfpVHgksxAnslhLcKeHujQbzsbN?=
 =?us-ascii?Q?KD9zS4uFVY134ChxzZQmfB2DyNbT+R0Q7Ix3VqzscX9W3K8FhrpuudcU4FUz?=
 =?us-ascii?Q?MrUuvsavCk6Ze35zsSzTFjNGCT6sIHp9EZb86ipe+Lv4hAwOaFJdY1jdW3Ch?=
 =?us-ascii?Q?nFwXs0gcL9KroVv10ygTS626wE7e14xePe7EfFrVCYRJZJXacS6iFPh2FOwu?=
 =?us-ascii?Q?MlwlhVYfZPpMZjDe+PnsHYCDR2Tc05Ou+L/Rpw7b1MJzn7LhxoX9+U+tKxm1?=
 =?us-ascii?Q?lSzfw2t8NL8AcCMtP5KD9LAUOSE9gvwMPzukhbsgryBQAOfXwD9SBr0xt5TC?=
 =?us-ascii?Q?AOlmw6bYRvi2TusgAIH8DMp8bupTdYSjpo0l7e0IPoiuG6dRFSx/Q9rAicLf?=
 =?us-ascii?Q?v9GT8AOBBVKdIFV5jczAswNiAGFzz8KepH22NGzBagVdA9Hm0d8jls5QEsEn?=
 =?us-ascii?Q?GCL7t0+cITYCOdKmdcvyYgmAP39YzxaRYHx0BVbGaB2QcrZkTB8uiY6TDPSQ?=
 =?us-ascii?Q?h1GpGAkbhYOochst00QAFckDQBlkAYp98zbt4nvdYsQ3SbcetdpE4XkTz6J7?=
 =?us-ascii?Q?w5I0JG8Qc7aqg7/4b/lOkzW39GTKHYMQGT/qs+ftDbpIhVk5lbfSBgywiMEl?=
 =?us-ascii?Q?h+ageEGgvkx5kwt6rDBp7+MM1SKx/8KZPMjJE1ODtM/jQih+sBIb4gzEUmvb?=
 =?us-ascii?Q?5tiuBf08FdNacjuWHbDDm5NSA2+f20uXfi1lURHqitQs3xaaxIgc5nD2rUb7?=
 =?us-ascii?Q?turrNws23GF4a1CqpyvtcaS+OjxLwtlxsG158ShV49byFjgaaWO9FuHY3EGi?=
 =?us-ascii?Q?X45zNBx3UAtCEtulTUnvE1luPYK62y+e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3hM5zataBhIH13TAyztG1tgPaXz+GY3/TnecqS60B+JKyE0ePWEZfQQkm8yM?=
 =?us-ascii?Q?AKlaJ7/z1LvMOGSKOrZrWTqn7TeHJ57Dtts6wH8yTAugS7nvqZDFaS8rGvd1?=
 =?us-ascii?Q?9tc9c9z0Mt3Sci4axPxGrwny0urLCala/uwvYsf2UjLweSRb/7eEe4VgSspu?=
 =?us-ascii?Q?KwlmpJQzJSF4+ewb+udYzHaUZzf4zSJqXI6IrAgAxBI3PyGCIFrFq4RFKmD2?=
 =?us-ascii?Q?+5G/Pkq+kTm0Ppp6iWucUkJlda6+zc02n7z9FS14VnJcJLqk8TFbuThxW/iQ?=
 =?us-ascii?Q?fSj1akeMprrLdYUwq6yw2re2Qzr9V171NcvALJ0Y3bbREzeEU/ju+HDEULvm?=
 =?us-ascii?Q?LlvqYLgVOmysygVTtdPB0Jj5lPsLuiJehyrF1Qq79HunY5aR9njFQ6IA7/Vd?=
 =?us-ascii?Q?0v7PcEA4B4Gu5d/j4Bagm3fDKI7AwAthVBElipxCh9N+IYPm+AHWlmC7wsaU?=
 =?us-ascii?Q?qLULCSPGjo14e1KcPmPj4duQuAo52kwgPsoWE3HC7nPbVDZBpHx9vPRHwH0D?=
 =?us-ascii?Q?y8pH3EGOCRL+Ff8kU830KEkPaZ2ZHcJ9no4ipFvL1nMy078wzhKi1Vni/DAP?=
 =?us-ascii?Q?XHturVcH9b6MTyxFbjZkkZ9koBcPXPpR0EvcGEQ69GiwuNZKOWj9VrIkZmMO?=
 =?us-ascii?Q?LjR99cpdySw0zwViFtp79Zc89Ccz/d8VVmrNmw81TXyTxngBlhBySEWyAVh+?=
 =?us-ascii?Q?I8UG8vtXMfWinigSxY03a/k6gmCMQ5YfeIj+M3oD1HiOSBmQU/axNusC9BBV?=
 =?us-ascii?Q?WATszy1sgaayfWAyvapqXfFT7IP5n2xWruVak9Jun64dctqDZbjOKD2ngmer?=
 =?us-ascii?Q?FmTxmWVFl/cpw2vQxTXijDiSdNmarSubWL0CnxGjffoBUiFQgR+7MAjc9Eug?=
 =?us-ascii?Q?wJR3WD2piK9cJSVgT0bHr66gsKbmAVUNN5EWnNXduBPXA/zoTj34BzN8poqd?=
 =?us-ascii?Q?uNJPuJbJvBCYGOibMFLwga2HGpdqmEJgUHPt3MCoPE+eTTk+grs9F5OdeT0R?=
 =?us-ascii?Q?f42cgsCjYoLAx9nUmxMKJ6eX8Gp5gfpexHSeZjO7OB3G6IN8G8tskW3UHX3X?=
 =?us-ascii?Q?ic8/8dVW591YqQlkDDMKrH8DU9lgpOVD31Yj1GAZlghthmhAzr0XAR4TYaau?=
 =?us-ascii?Q?fvEHl91+AXrWgJ1p9vGBsJa2n0DTx/tBB9MXUIq914TVLTnoYhbCy0CVAjOZ?=
 =?us-ascii?Q?ytjs0WutDwVYsjG9UrCEHyYsU1gb5N2+vouWmT2TQcxAKhbknsn1f0f+kE+u?=
 =?us-ascii?Q?qDuCq2uSLc2hCjbIDA/5pUJ0yavMzPucsAn14/Gb63USPADG/uFw+5poYKk0?=
 =?us-ascii?Q?4Z/RFnpCXYi8wjOOA5aqYFu4XyizeNLYKolMDcla14gDz6RdYtTpexpTNfEB?=
 =?us-ascii?Q?YBiFI8IXJxkOUgpfFGfWZimiugff7dX3GTpI6w2+3op5DqDCc4bGp/+is0h7?=
 =?us-ascii?Q?vvP00W22LJ4DynLj2+z2YWBWuUnNDSOqcI1ZanFLEy9AxLAFAAWnxMMBEimE?=
 =?us-ascii?Q?umcZjOziqHYGd69V/TqESdcIspLasKrZo+EvGb7mi6KlZWGs3Kz/k6rMsAJw?=
 =?us-ascii?Q?+EJGw6bSfknVyyklcUv6XtwhaGegVQTBqd/Wu8tsR5NTegSwb9FzhvggQSZ/?=
 =?us-ascii?Q?r2E36wjmrSKTFy/sRXY3zzAup1Z+Ku8PPn0ATiQwzIWk1+w5S9F2iVar0dyw?=
 =?us-ascii?Q?6V+e7A2SPPbmf7S0S6rANQQI1ovxU5wEj+AkObvOFhZcgiAV5rcT23bZ4r5J?=
 =?us-ascii?Q?Leepk/mcAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77421d5e-6823-40ff-3168-08de4dcdbc4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:35.7511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pedSK3GvWVIYwFUs2o40r9PAhS58646kvoG/EJPGiwNAGvmkvArxySBu24GIczNHigfzyocK6jOPTXZykxDGTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To create a migrate from a given struct page, that page is first
converted to its pfn, before passing the pfn to migrate_pfn().

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new helper:

    - migrate_pfn_from_page()

This helper takes a struct page as parameter instead of a pfn. This will
allow more flexibility for handling the mpfn differently for device
private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
 include/linux/migrate.h                  |  5 +++++
 lib/test_hmm.c                           | 11 ++++++-----
 mm/migrate_device.c                      |  7 +++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..67910900af7b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn_from_page(dpage);
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af53e796ea1b..ca552c34ece2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
 				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] = migrate_pfn_from_page(dpage);
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 37d7cfbbb3e8..5ddf395847ef 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -490,7 +490,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto free_pages;
 
 		page = folio_page(folio, 0);
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		mpfn[i] = migrate_pfn_from_page(page);
 
 next:
 		if (page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..a7edcdca9701 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn_from_page(dpage);
 	if (order)
 		args.dst[0] |= MIGRATE_PFN_COMPOUND;
 	dfolio = page_folio(dpage);
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn_from_page(dpage);
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d269ec1400be 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+static inline unsigned long migrate_pfn_from_page(struct page *page)
+{
+	return migrate_pfn(page_to_pfn(page));
+}
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..7e5248404d00 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn_from_page(dpage) |
+				       write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn_from_page(dpage) | write;
 
 		if (is_large) {
 			int i;
@@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		if (dpage) {
 			lock_page(dpage);
-			*dst |= migrate_pfn(page_to_pfn(dpage));
+			*dst |= migrate_pfn_from_page(dpage);
 		}
 
 		for (i = 0; i < (1 << order); i++) {
@@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			if (!dpage && order) {
 				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 				lock_page(dpage);
-				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst[i] = migrate_pfn_from_page(dpage);
 				dst_page = pfn_to_page(page_to_pfn(dpage));
 				dpage = NULL; /* For the next iteration */
 			} else {
@@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 
 		/* TODO Support splitting here */
 		lock_page(dpage);
-		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		dst_pfns[i] = migrate_pfn_from_page(dpage);
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..1a2067f830da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			.vma = walk->vma,
 		};
 
-		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
-
-		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
+						| write
 						| MIGRATE_PFN_MIGRATE
 						| MIGRATE_PFN_COMPOUND;
 		migrate->dst[migrate->npages++] = 0;
@@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto again;
 			}
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn_from_page(page) |
 					MIGRATE_PFN_MIGRATE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
-- 
2.34.1


