Return-Path: <linuxppc-dev+bounces-15395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56251D0015F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 22:03:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmgVW4vqwz2xHt;
	Thu, 08 Jan 2026 08:03:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.56 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767819795;
	cv=pass; b=DwIJlhyhRC8E36qg5oMLAnHICBAkXhPPRzRPtGRZ2X2MpFhgUW/rUZ5Fzr/dTYIRCjSjegpml9ZKbwKWi2UMOG1snMvBMtlvejYqHz4Ep4MQUEhUyf1JbgYFFDWZ16r4Wot/vaYhtbqxB5WiOwjzRUGnIcBCvPLoEABBNu8ROtzB3VN8M2tjnlTHpCquFQZCYfjsYzdRxUt20Lq9Wd3CNOAaUDCAoPy2tOIG3e9SVwNXdQ5QInowacDEFILLC7QZwDQuTsrNNcRVJyppox9XO/wd9cd/aPb5EaVJ2IuVbwFSkuQdTObOC2U4dwLl+f2fun6zxemhY0a/HPsa5ut1OA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767819795; c=relaxed/relaxed;
	bh=swAUCZxgAJwsCrP0iBvWMfPhsmnhIrxfbsUSHAYYT3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KPWEmyi+fm/40Awcu+FFIYU4bkAminr2wk4RK3adN7KKFugGjf2V1to/TlGFmntVa9aVYVR9FXWUsqry+x7UZOQH1TbEt+p4TuKTNfwvl6/8h7XKbJMBilezeRIHLlbbFkaKL0TqWP1CRPntcrKRIPLQ7nrENbBxWFjcSaL5/VS8PrZ98cBFv32o7n05HMqP/y5nYkbnj/Y2u3KLZQH3mGg7t6ulxf1vqXekQNL7LbUrROHrbkE30AenC0nyOCUYMZqv5SALevmZ5XaAWu7LvkKrMbakgvolGNx5l5AnKj2n9VLgmjQD4hN8ceWn1CotmkzE8lXD9ACNBOBKBPm//A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=po79M7gv; dkim-atps=neutral; spf=pass (client-ip=40.107.201.56; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=po79M7gv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.201.56; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmgVV70tpz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 08:03:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpUebXD0lyl7QaviQ8DS0rKFePdXRkb+HNvounvZtVA5g1QkQQOIlwZI29653Gi8haWSX0zwNuzVynlSgbQEAO24FgKi+LMoyAORYhqmMP6rRrPLATs2tcwfD7PqFJAXHHjX0FsT39O5pbIcbpHrp1O2KcG4vmpbULQ/Rxwhfe6Pl5z85nvw7M6peuB2KF7/7FM2K+CwJ9m/7FRISAe0S5J5512aXs35t2XUXK/GkNwHU79kZ8PnbC1GbFsMuHiESDu3Gpn8klBPsMFnYgZRafmvkI09VedOA1zhyHkz5tYrwKR3z/euNyqWPNXUfSQIzcWOQd50knZ6pHvFadGYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swAUCZxgAJwsCrP0iBvWMfPhsmnhIrxfbsUSHAYYT3A=;
 b=KTckA9gFcgnhe0cnzDl4hcPL/GhiMuhfi7ei/9pbroLF+2F8QHHM+VcKLJCAm8UszZOftZK8kbhJ1zlmZlwhWULfUYYucyFKG8yy9bOpHfWnc50n6TV+hJShhZXpJxwAD2/G5AtUh9rC/FoPw3Az1pmQk2r987gjOhQnVQjYY2E5d52QuxQfAy0Gw/3qVl3tsRPY9CemWqm5M5vx/SKSWIq6BpVnJ6+QRSQZDiKpfJJWR5GmzmbPt9fs7YOTl4H6DDhnA/ITva0g0la2LWOm2bCIkFMHHAO9E348uXN5d4N2I6hwpd7JjvPGZ4R9ArHuJmrf+fI0Gt/h2GrCdXl0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swAUCZxgAJwsCrP0iBvWMfPhsmnhIrxfbsUSHAYYT3A=;
 b=po79M7gv41XACuj+/WPvPfrdkyot3yCLJTBPCJ7U38BXwZd+AL455rJrMIyJTbtOm8UzS25SNVTtDeVcTxpPSQXTtUmw6bNnmZCkXsBAA+K1VIoUOM3OzeG/mu64CU/o6BUykF0KYTZ+Fguj776hJEYDe23Fq9zxsV9XeFkkrPMOEfq0jefDRY9uN+u641ZlgoruQwBzYsj8XDrsUMIe2r2GbgVzITbxkq/iQkTuIpLrNCQ+u6G9/1ubEnQdkwAerdBkKty0ioYrPcApw8LKRFi4uMPiU9zlXZkaEsp74D4VBzaK3JMWPELzc/YjQBR0O+Rw4iikmKzJ8bvmb6I66A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 21:02:31 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 21:02:31 +0000
Message-ID: <c288bda8-66c4-4971-9322-e1450855f93b@nvidia.com>
Date: Thu, 8 Jan 2026 08:02:25 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
To: Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org,
 matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, willy@infradead.org, linuxppc-dev@lists.ozlabs.org,
 intel-xe@lists.freedesktop.org, Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
 <20260107205404.GI293394@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260107205404.GI293394@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::43) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA0PR12MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ca71d2-bd00-4b32-2b04-08de4e3012c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUdYVkNqL2JLWHlxSXRpU1FIaE8vQkxmL3NIYndCaVo2RWxCOXVtTG9obGpy?=
 =?utf-8?B?QnMyTnVLcmtFdHhxWGpMVVdEbDFuanhxMFdYYzNLZjh6U1poREtXTytuYThz?=
 =?utf-8?B?UkpYUlRuWExBMkw3Sjh0U0RVZzByeUF4SmZoSkFqOTFoMFlEMjMvVFVqUEJ4?=
 =?utf-8?B?WTZYMFJHQklBc0xtajV1NmpNekowQ1RSYUtxN1NOaXFpakkrbzlhbERsaW9F?=
 =?utf-8?B?d2hpbk5GZERoYmtjTDY3U3JzN3J0bVVXeUVSRmhEd0JtSlIyUnFTL0c4SVhl?=
 =?utf-8?B?YmZvVzY4OVBvUmpOWUhGc1g4WTRUZzZrS2NId0xtaks1VzNEZWZiL1h4YVRN?=
 =?utf-8?B?L3BPWVJTVFFVQng2YTdFK1hQVGtjaDBBbG10M2hnRnR2N2JWejIxbm1ONXFa?=
 =?utf-8?B?ZUYrMzJJQzk0dkN0VjBDSmZVeSsxOTVHa2FkS3Yyd05aLzliMjdaMDExOTRs?=
 =?utf-8?B?Y2I0SmtrdXFENWIzeHVTSnlGTkFBTFFBRzgydk9Lc2VFMVd1ZG5EM3BQeTlP?=
 =?utf-8?B?RDRJWHNHaEZ3S0ltWXBjajhXSjAxOVA4d3BqWkFQVkpBNkR6ZWRRRHM1eW1a?=
 =?utf-8?B?ME9NdnkxWDJXYUx4YWkyYi9HRGt5eGtIMXBMdW85YjN2SVIxc0tYNEVrNjR6?=
 =?utf-8?B?SjlRbzcxdnExWkZDbzFzVXoyblA4dzBmdTVIOHExSWZ3Y2o0WTJLRjM0VEtQ?=
 =?utf-8?B?dlRCZndnQWZ3MS9XdnNjb20vcGJWQmkxcWZOb2xTV1hnelhCeVhpbEdkTHlh?=
 =?utf-8?B?djlqVXNJaDc4d29qcUtSRDIxR05nd2U3UTdQaG9ycGlncEtXQUQrbkhqRW5D?=
 =?utf-8?B?elJwTmduS0Frdk45SFdGZVpmdDdDQW5EMUtxQzUxSlhHL2N2cHMyOFluaUd2?=
 =?utf-8?B?QVZJWGx2Y0VJRzFtbVgyQjFXM1BaQzdRbkY5ME1iR01aY0FqeW9kTUFlTXFq?=
 =?utf-8?B?UHpLbGZxbjVuRlZoOTk2RW1mMzVIQ1h3WlFvUVVrTjZja3NhZlVqOFdmUlpS?=
 =?utf-8?B?T0hlY1lnOVdjWXVVWmJFRVdTRE5qWW9SRndXdTJ5UE41bFIwcG44V3h0TXhJ?=
 =?utf-8?B?OStjT2pHUzhCcWVWcGJrZDY2eTBHbGgvaXB0bW9aNE9veHlxVXpoMExaRE9Q?=
 =?utf-8?B?WGVlV25Bb1QvU3ZySnBuZTB5a2wxVksrclFWU2ZiUy9JTDNtK1FnbmdFSWVK?=
 =?utf-8?B?YzgxMCtGM2V4Yk8xUStJaHUwdkNZeG1kdG9iNDllNXc5ZWtvL3BvU1hENUNj?=
 =?utf-8?B?OTR0N3EwSWRpeHdpcVBmR3hmQVNJZjR6TXlOMElWbUF2Q05PV0VPa3FHYWtk?=
 =?utf-8?B?YWRhMXFHUWtBYTFOM09xMjFzOUFzeEpCTUR5N3pPSldaVUtuZnl0Q0d4K2VK?=
 =?utf-8?B?YzhNcUNyWU8xN2hKdjFkY2xQY0VWQ1k3dWQ3aGlCeXdWN3JlWGVISzdnUllo?=
 =?utf-8?B?dlI5Ui8reHF3UTczQVU1V3ovTElVSmxNWjNkYVErdG1HYmJKOXdIOXdsejZX?=
 =?utf-8?B?R2NaVm13NU15VStlU2MzTlh1NUQ0bXZHWjJUTElscmNXaCtRWjRZT0gxSGtn?=
 =?utf-8?B?dnF1SlRxNVQxbE5xZklaS1NKODRodFB6bFJHS0hQbWpPZ0FQdHdYQWQrbGVh?=
 =?utf-8?B?blEydWM0Z0dYaGJId0h3UHZweE9xejI3eC9uZTdnbHJEckdPWksyUXg1L0la?=
 =?utf-8?B?V3l2Q0lRODNWRjBrZGxIbnRuMklqYTlJK1ZvRHBSRlBGVy9xMlNLaEdJN0E4?=
 =?utf-8?B?V1dTZlNOTkdLUlZ2Q0ZCV2ZVd1VqMHFMNFFRZlFtZk5QL3JaaHpyajZoU0U1?=
 =?utf-8?B?MUZvbXRUYVowZEF2NjNJY3duZ2J4enJCM3RYd2lQMlR5TS9oSWt1NXlnb1lI?=
 =?utf-8?B?dWNjOFo5K2lpNHNwbG9zbC9FakpMZkwrV2pTd0xiNHJONTZieEV3clMyWEVH?=
 =?utf-8?Q?D3rI+IORTw3X5rVdXIvM94KhMh9uDYek?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjJiOGFJSG8rL2huWmxxaDdqQnlPenBOcWhveGVLT014LzA3anBVY2RWSm81?=
 =?utf-8?B?dStjUHN2UGYraVVKTXErRWJyL2puelA3ZFFtcTVURGsyZkVldWk5VzJmcDBp?=
 =?utf-8?B?R3hZTzZQK2pnR0xQQU9BQ3FGcW43akFFV3FxTXZlQzN5ODc5b21PQzdQZm0v?=
 =?utf-8?B?djc0dDI2bE9NZlNIZjM4QkFCQU03MmY3MXVURVdYVkdHTWRaK2JIa3hKbERK?=
 =?utf-8?B?VW5kOFpoS0tNMlFxRVIwb1h2ZXFTYzVIMm5WeGRqdHNFYURGYUJaL3JXdHZi?=
 =?utf-8?B?dkxFL0VDSkM5cFp1bi9rY1dQMWVLdHgvZXFtV0hLS3VpQ2tuNkZXajBFYWY0?=
 =?utf-8?B?YzhpaUJSSFlnUlJueWpsd3o1TUcwcWJuZVNwU25sS09xN1NCRUlmSXdRQzky?=
 =?utf-8?B?ckZvc0J4aHk4SDdlbk81WXdNSVJ3S3QzTjY1UGZLK2tiYTFFZDBlNTZwL3NY?=
 =?utf-8?B?ZHBQQ1F3NW1uWTdhSGVrSTRDTWgrMnRsYU1OMi9SUHRPemQrdDgzbWd4YWdj?=
 =?utf-8?B?SU1ZZldWVVErWExaVTFrb0JCWjN1S1VNTXFObHVCN3JWY1Rzcm1FMTVrUlU4?=
 =?utf-8?B?UGcwRzNuN3FDdnlkUjByaFpGVmdpM0M2cWxQU3RScjlCcmtBc0tMYVczUnJT?=
 =?utf-8?B?RzNtUE9oekhkV21jT2xRcEpkdHY5VVFKS1N3bWVLQWJ6SDJZMDBTLy81UjhC?=
 =?utf-8?B?cGgwd1Y0YVBqbXQ3WGFUUU1rVjRxWmxBV1JTbWtjeXM5WjYvaSt3bC9XNk5l?=
 =?utf-8?B?UkZEdndiYncwMzdQQXBlVThYQmdxemFxOHNpZjhReDMySWNGVUFRbXRTRnQ1?=
 =?utf-8?B?eG1tVmNXUGp1S2JMU1E1MDZQWm1lNEZKaG9NV0lBL01CMURkSDBIK2UyVE1a?=
 =?utf-8?B?ajBKN0dkOFVJS0IyQWwrSmV5Mm9hMDNzRUhHaytCN2xhZ0E1SlQyZmFPMVRk?=
 =?utf-8?B?NE1pOVlINzdweUVxUmxiOGNRZDZqa3Z6THBkNW4zQ2FWOVFMSnNRSWtRVUhK?=
 =?utf-8?B?dFVjd0RIazczQ0lFbnFjaURIM1J6UDRnNjB1cE93NExSSW1TOEdOWS8rbWt0?=
 =?utf-8?B?R2RaYkozNENRbStJM2NqL0c1QjRKN0NaRTVTYTF3RTZYRVQ5NUJpV3VLVHNw?=
 =?utf-8?B?SkdTQ0hlc2xGRk9UVjNweFZvNXp5NFV4UlVSb21WZVE0ZkhscWRaQlBsMlZv?=
 =?utf-8?B?OUJSNW9hdzUrY2ZRc3l5RGZSNDBWbTlGT2hTMjAwWTRQVzZzVlIxRXliRlJi?=
 =?utf-8?B?MHVKRjFqTXVrQ1V1K05WcUZqNFNaWjVIYmxsemZhdnljNmNEWUJvMDE3OVUr?=
 =?utf-8?B?WENxMFFqV0V4RTQ2WmlEMm0ySlg0aU5jcm5SR0ttZGtONzduZUZSZVBHQnlJ?=
 =?utf-8?B?bmgxMXloYU1NUWNNdWxvdTZ5ZXhlcWNHb3JEaGNJVEZGcE9yaWw1WFBBN2dq?=
 =?utf-8?B?Ri9uTTRtekV1MUxqNzBISnVKRHh5NllZY1FJU2VCRU8wbEczSzBTcUtaZzYv?=
 =?utf-8?B?bFR0T0tFZG9nR1hJK1RjTW1pckFmUGhMVzlPYTByWFlXT1NpZ0RpRmZQY3RM?=
 =?utf-8?B?RXB4Njd6RFdML3VBa2RYS05KRHNUd0JDN293UDRJZERuRFk1bjJRQmVYSHBL?=
 =?utf-8?B?UUlrMGRxblQrVDRkY0c3czhWQStKN2JOOXNoa25Wb05JWVJNeElYMFBmUkxw?=
 =?utf-8?B?a2tZeVVnUFBrSW11djRoSmFoN0t3SVBndzlYWit1L0wwV01Fck1yRnlCSVB3?=
 =?utf-8?B?THJLVEdSUFdjN2RLUVdrZ3luNXpONk5PaTRUSGtWMGNteUl2cEZnRWFLM2g0?=
 =?utf-8?B?TkhvRDJFMXlLM1NOTFdFSnF4VGI2QUFSYjQxMlI5WWFZZW9VMS9ySzQ4Q1Fj?=
 =?utf-8?B?L1ZoNzM1TEdBdDZSYUF0RG5hT2QxQlZYUmhIcGtpMnE3VTVESjkzcTJYN2FJ?=
 =?utf-8?B?d0xveTBDVlpyVEMvVkM1QXVYTFM2dkZmUGt3djI2NWk5N1JPOFJZbHVIaEhQ?=
 =?utf-8?B?UjB0OTA2c1h6aGFMV1VXY29UQkZKbXFCeHpHQ2ZNd1U0M2x3MnJNMUNvNDhp?=
 =?utf-8?B?aXNzV29GT1MvZFRPRTlxdzZZaXJkZ3huWnJvL0hEekxXNlFEdjRydTBIT1VF?=
 =?utf-8?B?RHJJSXpEQU1qdlNsQWIrYVUwWVo3WEVaUlNpa3BsS1RWMnlzQ015WHpCaXRt?=
 =?utf-8?B?UXRlb2tRZSt2RWtXUGhLYXBINnhmNzhyUzZrM3hSTWltTk83TXBjbU1icGFR?=
 =?utf-8?B?bW9ncFA5MW1HSWFoeTV6TWxhcGNNWWhQU3A5ckpaL3RCRkJ5MjczZmVPcWIx?=
 =?utf-8?B?dXlSa2RYV3BwUlhlWVpsTFlwNWlTQ0QrVmUyMEJwVWRDcm5ramRsU2N3a0xN?=
 =?utf-8?Q?SKOo57DEzaInQo4y7o589A+HqiWw9rb2Wexqx3NE4qNWw?=
X-MS-Exchange-AntiSpam-MessageData-1: Jht4B071kJBCDQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ca71d2-bd00-4b32-2b04-08de4e3012c8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:02:31.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/lWBRVtu9+Uy83Q+EiwixRd2v0NT0I9qIxlekpPhmds3o0M4WNhfHTAVORQO6yQHQkLp/6gu+9d3vsUq9KiEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/8/26 06:54, Jason Gunthorpe wrote:
> On Wed, Jan 07, 2026 at 12:06:08PM -0800, Andrew Morton wrote:
> 
>>>   2) Attempting to add the device private pages to the linear map at
>>>      addresses beyond the actual physical memory causes issues on
>>>      architectures like aarch64  - meaning the feature does not work there [0].
>>
>> Can you better help us understand the seriousness of these problems? 
>> How much are our users really hurting from this?
> 
> We think it is pretty serious, in the future HW support sense, as it
> means real systems being built do not work :)
> 
> Also Willy and others were cheering this work on at LPC. I think the
> possible followup to move DEVICE_PRIVATE from struct page and reduce
> the memory allocation would be well celebrated.
> 
> The Intel Xe and AMD GPU teams are the two drivers most important to
> be testing this as they consume the feature.
> 

And the ultravisor usage in powerpc as well (book3s_hv_uvmem).

Balbir

