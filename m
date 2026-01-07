Return-Path: <linuxppc-dev+bounces-15370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87599CFCCFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtK593vz2ynf;
	Wed, 07 Jan 2026 20:19:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777561;
	cv=pass; b=o1GcOQ8IWA2vzuUh5C4C5T55UEICvb9ACAASzxGtviGTrrxNhHIJwKjeWnosmAiHlpx6Js91NLs1w2wo/sYnckNKJmJKOK3YcIPv0BDKUTHYhB/Xdfe+nN+RLgslxa164zGiwwMY1z4dNWFXJxV7Hs6osP5RKJF7U5R/who9uWRay6InT8K6+Xkkmjo5mGNC3uPlbQrx4pZ9Lid+EqMJJNfUVZdhN7wWlLz4JlzwkQtqDbYp53IM6ZArRHdt4whizX5QVBcb8/dega53LuDOIbX8wttmSo5pzCfsYDP8XaX52QDCtfLD/OUj8+8sevfvnP/kFXEXYvW/OPnga4XWfw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777561; c=relaxed/relaxed;
	bh=C9aj6PiUrCwqMql/PuF5C/6bsBspOVgysa2aa1exepM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NjKe4n7XUWknCMALx0yKd5Lz493/nUY0bdyiP6ZI49xpykUlIF2YVibHR6tXaXbOhGoHMovGzlXK5pcW7pup8HNM2qoSNPmQjZVrL4XA/16v2t5kS2m99YY+u4/hC7fTH2To+GMq9kqMoerZ5e+zda8sClxHjDZe9QL7cHxa5VOVx7PwsEALhloUrAMvwwnfluyntRdTXgx7a9bxWDbhxFJMRMdE+nIOeVosZ433TmxTTufo7ZlYBeEOm5M7BQ+OrzXiNO/BcvyfKnJ/ZLwJ6QzG1GwAtqRVnFrXA4q7ce4bFQiEFLLupuQazezkLq7DpujeI/kSOIXnQIM7wLkf4w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7E1c7P5; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7E1c7P5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtJ73JZz2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYXQLn4N3V3NXipG1clrByACJbEvXC2PgGXn+90agzR98trvGHkxnQQKtWd0ebhlYtvMHkVz/bcHoTKh/xzlW4buHwE5VAd7S9HPz+TWktoG9MtLbLy4JHinAC8+FOAgucVubABaLXKcAs98cSWM0jzvjqql5MzxzW1g7WbDSY96RzEP9/IYcKih6Dgu0C/FVNtPjgj6Dfq01/JO0HJ6P5hmE0KoFrFVzCzCVOh7U8CxabKb3cQiybuY6vJ0Se4+wJsRGaYY7rJ6bdllXByc+1eKinFBhPdIqZTLUfJkHKCc4rcJftZbyn0xY/okjmcKyW9pn/tSwXIyVVHsgAbFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9aj6PiUrCwqMql/PuF5C/6bsBspOVgysa2aa1exepM=;
 b=vsbzFl37a1LArBBQ217ArnKdy/l9SHfJ2M/cKDiiJMBnhxre5kib6rnAjtofOjpORz7pTbSbm8eYNxc6twOdT9gFXvuJ1JtSwnN7rlL7UIxR3pPDiB7Q8QzmoCkrPt7AGcFY5EdbV7ryiJGa3sjQJ5y3QFcs5080Q7YJBfN1RYh2nSfQViVr6wMIIiAwRVQ/tJnYmSm+s7yJ5k1F+NmbsoCMB8Gs3uoSFH895+vODJxRREU2xfLSfgP+Uka8XjjhEYH9IlAy+GnsRD8eiLkCmuHNODa1B4dfHeRJYijxsbBJrurs5seFJMr+Kh6Ot/QHtxwTlkZMbasykNQ65aeEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9aj6PiUrCwqMql/PuF5C/6bsBspOVgysa2aa1exepM=;
 b=K7E1c7P55UGTtlAeD9BBRWZqodkKz1msBJlkTaXcedRwyM6MHDdEXACwnvM1jvJPuCSG8lHH4rQL06Hne8FMH3y4RnhHwn+Jinez2JdqExljQl4o1NqK7PJzNuxyKtVLoXv8Rkpnh1lCQnj0akU0fqdd8zMZ6wmWtWGkHW0Z8hQuxx5pLQg4DY63DAlHG/l3xQEcRx3R5e0jCag4hwfrajmqPbPLHG+QmdRmmjxelmIoszMddmdUDeVjw3u/p1RnQO/r8TAzseS3FVIEjkXzx4PL5n0fS8U3fLcXhVXmDC0QZIGihTixMkL9RKdJeI+IvIi2NJPU/r01WJXj+nM2sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:59 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:59 +0000
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
Subject: [PATCH v2 07/11] mm: Add a new swap type for migration entries of device private pages
Date: Wed,  7 Jan 2026 20:18:19 +1100
Message-Id: <20260107091823.68974-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3f61c9a2-1e11-4bc3-5141-08de4dcdca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R75kbQcNyL/4Vk6JQaGbR6IDlp0GiskJWiDUUo0QhPrlsSrYn3Ti3rGdO26c?=
 =?us-ascii?Q?rVoUVwQAaGm/72vB0fwWrwQdKDfNKbJrieV3zH6Pa1nRIBPl0Isp466Tyqcc?=
 =?us-ascii?Q?slcyUeNgl5dQthmROKHDAvebslgDQhZJ4bZHHWnrjFwU3/oNCofcTkE11SRA?=
 =?us-ascii?Q?Z0bVvsQYp8135PIYS7WJpf6JHDibp0YTIf7dsWOmGghPgMc5PRNoMqiKGNyp?=
 =?us-ascii?Q?iHyMfUTVoApELrR+N8nH1Z4cxYxxqM9GccIL61sZTVnrgFnlFLqCU6BbersT?=
 =?us-ascii?Q?aBVy/v6zi12OCEC0wQ2YQaGZ9pzeHQoyiL7jjsQotUd27J4FB0TQHHiffy9l?=
 =?us-ascii?Q?+5CdKY1AXJznSJWjIh8yCSvSWc04iu19GxAm7W59WW29Oq5kxx3EwEWCZioi?=
 =?us-ascii?Q?LCj8vy+QAIPV7m6kDmfwpD7VrPvsMWVeAIqZajsNAHFVkFm07KsG7y8IACvc?=
 =?us-ascii?Q?4CParhIihA7tNhdMUoi4WDhk787GoaYreyZT4Heykq9+W4L7fu3ZzvOcCZ4X?=
 =?us-ascii?Q?As/rLCNJ3DcV3GRHhkstKOul5k7mkbAsa46cVrnOD2xzETMwsPMscDXtCiV8?=
 =?us-ascii?Q?KtF/TpfRJxqbpfV3vUiL8Jx/PfYbCQjRxphMn9maLdkIhyo1eadrw/Ix101i?=
 =?us-ascii?Q?ftEdg1wWdpY6PmElmlyBsBMtwUYFhVJE6XvmSRGRozzkZ1iwxYsM4yKZ+BSP?=
 =?us-ascii?Q?+Y3mNnV5tcXT5RRAwhAK57Sz1MF7NFb13i89vXLo+nJHi6JQCfAN122wAVoM?=
 =?us-ascii?Q?ddGb5sqm1kn38gqif5mx07sfFacCrnHu9rUKORzAj8WigJ7Mu8UV+CnbIuXl?=
 =?us-ascii?Q?l0Xq8MVTZxeIAhMPHn2kRj9CsFO+/yzupf0HiZZoqJyAgGW7BNkodx97H0rD?=
 =?us-ascii?Q?cUR21SjGOjEHf0Vn5gQ4WQz6rkR20cKFox2ZtTan1oDhhZ7W/bLE6mswWYh9?=
 =?us-ascii?Q?JSEQAuKq3vYSCZuqJNo0iE85iYNUQQsn2srWPs2QDCta6LjtSY+RfqQnKM9t?=
 =?us-ascii?Q?2SiPW+uj5WAsJqpEBtWs+wIeQnFfz8CvXoiTG6IK6yXKOihAlNuROBMHI6QV?=
 =?us-ascii?Q?QFBybtYmwJe0LianzPo7WRQ7NgGu3BVvX8SmjCSJNB39O0MLXCK1HGWt0g6e?=
 =?us-ascii?Q?qkGnlNcGKNltgr2GPZGiUvTxKx+lvFhf+hNKkmJCY1hMfJd3BFYLmuZYsMY3?=
 =?us-ascii?Q?FpJ1oeTR3Uk1aGrhf4O5S48VyxnvtBrZaAO5rG/m8da8Luj0cTvHOnXHRla1?=
 =?us-ascii?Q?rCv9gIw8jqoeWuvQ48IllJytJpcujQTd5cTRSeqVWQWj2OTjzfYr09JlkDHw?=
 =?us-ascii?Q?6trCSYLFDzdP1zaNQHbKmLQ4hI1oFn4y2gt4GDRt8dBOuLSMIu7xkNzCffXf?=
 =?us-ascii?Q?oHvlPXkya4YN2iTETFbbrQfZiU78BGq+tJy1oxpauuxUDzQZTrlMolXdN0Sa?=
 =?us-ascii?Q?7ElO0FVJhsHl4twB2yJdx46I1Ww1ane/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xqLLrA4SgKCEPCq80/Pt6k9/pbixGTWCx54lOKdcuHv5q+I+q5dwQGwlPvc9?=
 =?us-ascii?Q?8J5Wq2Xna3pJyF0uO99cpElH9j3H8WU8Til1YuwAmjIBTMKEWBP4g3hgSi1M?=
 =?us-ascii?Q?6D7q0lQaWV0RuYKmWquGvV7WOFWcQ8PPkbQjLDuXcvGvSSDelzO0RIFq9VTZ?=
 =?us-ascii?Q?iptdvlPCARKFgEMlQKHiZ20lLuu/P31RKVdRIAeX4k6zWdG0dYDtmw6aWcW/?=
 =?us-ascii?Q?bIgxJRBP6zqChFB5vbfsFnM0OWEaKg1j1vnQSez4LUq9XLsyApTutA4ve0/Y?=
 =?us-ascii?Q?HnX1EqAVOvleASr6W+RgJzFzS0vi4aYBJ+SoKwmyDXR8kYu0nlu+vuzTZ6h2?=
 =?us-ascii?Q?1fRiaylyEkfUZnyjsB5pJbVINbQbT0M4jXsPd0uzTgm9bsymA8vor6To1Vdo?=
 =?us-ascii?Q?F/Pbe9p8/7Rk9s52qnsrEN9+bReA1vyki+/yYYy9k+SQi7erp6JK6r72hANe?=
 =?us-ascii?Q?5EeXym3Rpm80MQ4NSBEcVK03j5gICQD0ebkC9Yx8JowiMQG/I8IOeTO5MIUA?=
 =?us-ascii?Q?4QEyDMpyvwrsV7UW5lCAcjD1m/DMx7I2C1S/P+wiwaxebSVXOKGqYnniy/Eo?=
 =?us-ascii?Q?fVFl+pZ0xl5Igzlm3/LOGgYKRhskzkKOJVrmdoczQlt85py9TNuyoETDXePl?=
 =?us-ascii?Q?B3aW/PRwmtBo/DKMOcpCbqA1up2XhrF8oCi/B7oOFs0aZcNoKTd5POiKDO2P?=
 =?us-ascii?Q?UdFHoxiOpYqlmbeQt3fBtqjtFzBx85nXVlfdfVv74BsCFiSJvMvoX/y7yijO?=
 =?us-ascii?Q?bgu9wOMucJuBKWa1vlJieNr4nZpvBt8y2OOnkYdaK+Dt/wt7ucs5SEO3WMbU?=
 =?us-ascii?Q?msOfNyrkG/Gl/frWuUHsWQBFsc+2B2gW+MJ9sZz+M86HoDx2YHrTWvdjUkxh?=
 =?us-ascii?Q?6AvJ9wPBXOgx4L336jwedEUW6STZUayPMvr9rL0GdmpnnSi4gQPTwbI83Xut?=
 =?us-ascii?Q?UXSdIvpnIucGKa/z6rr5p3l/bKbEuo4utnf7c00Ph4d7KcsEA9RPG5I5Xgz4?=
 =?us-ascii?Q?Fy+vUzIywLRwmFoRjfpWFu/mBfD83mOuLU1ZD4IDh16V0oJC07y0o1FBPwek?=
 =?us-ascii?Q?sg5fInAjpmVuLKAdlqfPxhnhjrOzQzkzOsTrxGlI4IlKZcwVTwJOPAzk8al1?=
 =?us-ascii?Q?tHf8Zgd4XUlgpBDNmw8Q5vsZMz9k84wMcp9NynZjHRywkRvvUlI0FB2SdoI6?=
 =?us-ascii?Q?ezfOTBGV2kL032L8+SZ7NGrEkr9JxMz7kXJyNACDffKAVTzYwjumLES/M0TI?=
 =?us-ascii?Q?pL/pVwEg0II5HWzHAUfNCboV1PXuRRQGOAHxLPoTinxSavAbSr5xSvwwUOT1?=
 =?us-ascii?Q?ysJr4ASggJqLWLyODyzNQIkQWJDeZGRIgJmwjA49AZUvVf4C1OzffI7ETzAX?=
 =?us-ascii?Q?cDqVh2hZ1Khik4U6hjVpzDSRiFy7ualfhIn0c/9nDPR7aZCTY2dt38623PDp?=
 =?us-ascii?Q?GBaSH91P/K2Q3vGiEqealBLpwYFySggXAF39TyX72bC8FRmEDPAF6Vb0+SZl?=
 =?us-ascii?Q?PObikY4Z0Y72jIjt+j9FcvxxyV1sjBvIt6fGEVZGxFsP+VMpV0lSfauMonLv?=
 =?us-ascii?Q?CyuRC4QZAJbv0pFmAQETziDTGvpPIEBfuHWSHrEPyTsZOF1a9sv7zBSwxJtP?=
 =?us-ascii?Q?gXWXGUARzL59TyNX63bKFZf4l9YQZBGYS/7jSUo4RB4hogdceCxrkzkKOSz0?=
 =?us-ascii?Q?5mpnEd3tJvKDYppBmF3E70khZZtURBCAWBonC12klzqIX1k4slwl4SNBJVSH?=
 =?us-ascii?Q?d0qdHZqLsA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f61c9a2-1e11-4bc3-5141-08de4dcdca35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:59.3024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVpjqozdUyvcVtlXp5Luhgiuw07R81PRLkZD30z2m5S3QvwJ8epU3m97kPsvaAl255kT65BLiiF41DL7RVWxYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page - this includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types:

  - SWP_MIGRATION_DEVICE_READ
  - SWP_MIGRATION_DEVICE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE

These correspond to

  - SWP_MIGRATION_READ
  - SWP_MIGRATION_WRITE
  - SWP_MIGRATION_READ_EXCLUSIVE

except the swap entry contains a device private offset.

The SWP_MIGRATION_DEVICE swap types are treated as specializations of
the SWP_MIGRATION types. That is, the existing helpers such as
is_writable_migration_entry() will still return true for a
SWP_MIGRATION_DEVICE_WRITE entry. Likewise, the
make_*__migration_entry_from_page() helpers will determine create either
a SWP_MIGRATION_DEVICE or a SWP_MIGRATION type as the page requires.

Introduce new helpers such as
is_writable_device_migration_private_entry() to disambiguate between a
SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.

Introduce corresponding softleaf types and helpers.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
v2:
  - Add softleaf_is_migration_device_private_read()
---
 include/linux/leafops.h | 86 +++++++++++++++++++++++++++++++++++++----
 include/linux/swap.h    |  8 +++-
 include/linux/swapops.h | 79 +++++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+), 9 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 2fde8208da13..2fa09ffe9e34 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,16 +199,75 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an readable device private migration
+ * entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
@@ -211,7 +279,8 @@ static inline bool softleaf_is_migration_write(softleaf_t entry)
  */
 static inline bool softleaf_is_migration_read(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
+	       softleaf_is_migration_device_private_read(entry);
 }
 
 /**
@@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index a9ad997bd5ec..bae76d3831fb 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline bool is_device_private_migration_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
+			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
+			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
+}
+
+static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
+}
+
+static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
+static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
+{
+	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_device_private_migration_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
+{
+	return false;
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
@@ -175,6 +242,10 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 
 static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
 
@@ -186,6 +257,10 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
 static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
 									    pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_exclusive_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
 
@@ -197,6 +272,10 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_writable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
 
-- 
2.34.1


