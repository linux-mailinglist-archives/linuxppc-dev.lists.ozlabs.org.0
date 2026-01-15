Return-Path: <linuxppc-dev+bounces-15766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71631D22B72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 08:07:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsDZm5Zvfz2yFm;
	Thu, 15 Jan 2026 18:07:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768460864;
	cv=pass; b=V5DOyht6Glx3ONfSWo8aSiV4cWYm8ykk2fy3ebwkbqTBQ5vJrSZos48y8xwjxYi0Y4hx8p9Mnyulj73E0f7i+n6x1kfFei8JuzLb1PHewii9TPB8VNxdlDGNMZW6iXcbE48c2/YtLkxxYpTZJVG/DAPL849A+NtRdYVc4ijUp25w6ZK/kuMz6Bk2lLU8ujiui2WSYEVfHnj3z9TT43ps8LpJNROmfeF3/14orYxF+cJX3x3wLQReln40iZA4P14INXTw8A5S5hqyqCcBo1lc7ePGDlmJZ/9JT0dpozXdaHErlONIM70ulZUX5amq/Er4/pJUrRwTK4C12gnRLncjOg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768460864; c=relaxed/relaxed;
	bh=t1uNCmaYCTppbO5zJ+AZNwXQx2fJLCX00XB9KqylZo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mS0mn/e3M6UzQCIdG/GeMHir3I7AY4IcpqxwqO1Gnj4YNGalksnK4Iyz3w4ZsXCWmL1iIdDDASztdcaFAH6J9ehgcX704tP17igfZMeES30cBoW3ANUWbIycNBh8smxamdErQpr/q+WjX47oK6oNN2jSIhNpJ4hNIOE1tFhlZUq+P0Eg5DDmCEvqVc4P+iJIR3Lv+xuTEBwnaBiZpsLWapwak8x5zJ1dQqSTtpM6LH+8rlUSib82ZtD5B1dszy88PzcHtjoMmoJ+/pw2rBlo1P2Akjy3/sWsM0X6WAiLVYDLlfdDiF8QAIKLIuLWKvG9jutxXbRMjctmKxzv5hdbpA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g7nluz8D; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g7nluz8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsDZk5tZ2z2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 18:07:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAL4RK8S1HDMe3+w4rdRVpsuN+9hm8iFDynPIvr7iC0z0FcWvwZuqlyU2VxYFJY3RtsM/iOTvX4GfStRshK47NWgobFeycW0ON7DE2YhtwB/Zya3eBbizZcMBorRnx4bx1GOWyilk/gfnGrjBMbDZx4+WobEJQeIz7nOWSytSF2oCuhob2bmG3rjIaVwEXgY+T9fAl0VI7Dct//00OQbxgjd7PjS3WbLX41MxJ/5Hp6Po+T6aExSgDbawxsmhKi5POZ0jGIePaq2uPEtfmzN4ztf37dCztcAHot+WQjNmPbcm6D2FArYn9jnDUXHQFdiEh2uEfhwcV16DQhzKLv/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1uNCmaYCTppbO5zJ+AZNwXQx2fJLCX00XB9KqylZo4=;
 b=KhindJSAlwM9n77Lagu3fkO4lV+VnxgUjMuCK77vY+c4yS1MUcB2MkDYkqusQKRa+SscVTLnvRRSb5sUzkqjyxZD11gvadpWsUjDh2eaowSc7l+4yv2LQ0Sf/Xb1+ATzXY3dPCsHEVYZPEuHGd4RosqPWy0sNf3SB/gcfUxZ/E0QziMtCOFsaEL2iftTzOLHfPry6fOht5QloSw3t/MkMsIRbz5Z7GcXASf21wylKZlEXX71h6qq0+d3kBNTuDUkBqRoHkKMRKTXzDsAzBo2KHyVJWsw1Wfh4pHFxePoeFO8NrTcl7bwEcndKVrDmdSUGJgyZ1trxiO31D4MaZOmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1uNCmaYCTppbO5zJ+AZNwXQx2fJLCX00XB9KqylZo4=;
 b=g7nluz8DIje/8X5RMr2+1xvnBXK09dkdtSSY3r0tKPB+mLivHUrn7Z7EJmwk4ewaTaKGR00ZKW9MijhYmYF5wdxI52y2ZfA1gkPgrtNM6bTlDWH0eM2K3W/oDpPhF1f8q6PGdUDU5W1CHoleKQXbK0AY4AbN07GtC7fkxPB39NW6B3wQgp4xiD5zk7uqLdwFSa29gkOh29znuSjmvuDH6ix58qPGtMRmL8JhwgBVQ9JQYH3q76NOFct5L/VaLAs5pzI3wznHE/Gly575LvdQUx2Oab0BpBIfMOnX/hyHsxo7+k2NDtmViY90uATMhUozAyThjbsGQ/ptDT5HYCCZSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA0PPF89A593F05.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:07:13 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:07:13 +0000
Date: Thu, 15 Jan 2026 18:07:08 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Zi Yan <ziy@nvidia.com>, 
	adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY8PR01CA0020.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::6) To DS0PR12MB7726.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA0PPF89A593F05:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b2d06f-b47e-474d-608f-08de5404b558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTUwbTdFbm8wQ21FbFpjVGp3ZHUvek43ZE0xWlVtam5ERmZWOGZvQU9Lbi9z?=
 =?utf-8?B?OTlVZDFVUzJnQzdmZm5qOEtYdjUzY2FMcVI4bXF1UEpOWlR0ZXI3a21OTlFz?=
 =?utf-8?B?SWhqckpTNE43eWRkYVZDTjdRQ29MUEV3NWNid3JvVW9jb3huRDBjTkNaa1p2?=
 =?utf-8?B?bjVza3lVaUhKRHdOdWg4dDlCN2gxbkhyd1BaaVdVSGNJc2pQMnR1ZjJwOHJ4?=
 =?utf-8?B?NnB3aXk1L3huUTh4dlkxcjd6WlhySnplbVQ0dzVORjFsVGcyWnZYQytHdWhq?=
 =?utf-8?B?dEQwREFzUFVzeVlDa3N0S0ZvMmF2dWJweC8yS0tCNGhvUmVueDVMMGFNbFFq?=
 =?utf-8?B?eitzV2RidzFQeW5QNlltV3B1ak5zSmJGYmFRUXJXbXdRYnRRSXEvcFVNSko5?=
 =?utf-8?B?VVFSNEFZanNqOUtlVE55b3VCY3FwbEZ3cFhCZFgxSjA3ZEFrb3NKK0RpRHl2?=
 =?utf-8?B?a3V3c29uVG1kcjE3ZmliK3l5aWNhVWJUbDl0SjUwbXBFQ3RCMWlXRksxUXph?=
 =?utf-8?B?ZlI3TG9WNWFuWjBiTFpDWk96bnZyRVU4OGJhMWF4STlHUWM5THZwR3Mza01Y?=
 =?utf-8?B?SmZINFByai9ZYmd2Slg0TDZSZVpXZDFhK2VMSlJkT2svcU9LUktsdFREYXcz?=
 =?utf-8?B?bkludEVvSVIrK3BPaEViQXRtYXNtUzFlUFVXZUswZm5RNUdzZFp6ZmhYeUQx?=
 =?utf-8?B?d21jM2FEbEdHdXNZK2tUcGJhazNpYnR3TU8xTHQzSkxKeU45QVZ5cjBzbHhX?=
 =?utf-8?B?ZVZKbVZXczNpcmM0RjhtYS82V1Q4ZnpIVDB3am1iUnQ2UHRGY1dSdHBMRHdu?=
 =?utf-8?B?RC85UmJoeDl5ZWxDSXd2NVFtUlhnc2lGTjJBWjlLZzRrV0t0VCtOclNhOWFD?=
 =?utf-8?B?c2N2a3UrZEROc3J0S3dzK1ZPU2dRS3E5cCt1M1V1R1Z6TWNjZHc4RUxZNWJz?=
 =?utf-8?B?MTZqUHQ1S2dxbTR5M3RabmVyR3FDTmtuRXpKREw2R1dwb3NwUnlTeGsyeU0x?=
 =?utf-8?B?enpuRDRpTmpubUdqRFo5QjArT3A2NFIyNWlUZGNZcVJ2OEljcjNEOFVMMHNW?=
 =?utf-8?B?QWt0eDZ6bHhEMkZHc01oTEJ3RUtPbDdzYWozSCtaRVlCZHRQSGVGV1k3MzdK?=
 =?utf-8?B?ZVVYUC9IKzN6dllsdEQ0RnplbTRBS09uemVXTFV1NFFqdGRlVWVQVWdPWFdH?=
 =?utf-8?B?RFJ1Ty94SkVNejZCK3JhN01BcXhoNU1JQXJudGFFTFhhMTRZclc5bFlPeWVQ?=
 =?utf-8?B?NTlSektSMDdTNlpMalpXOTNvQWpDTExIZ0hXcU1VOUtvZlRZNUsyYkltR1ZD?=
 =?utf-8?B?WHZsRVpEazVmbHFvb2xSS25mMllPa1JYUGZvdEZRdEtNOTg4TzNnQ1ZUZmRU?=
 =?utf-8?B?QW9uL01jRHBVTm96cHl3SGR5cmVGK2NXS3lVZHJTUmQwcW0zeStRbGQyZlJF?=
 =?utf-8?B?MjJUNVpSaE00RENKTFV6NW9FOERBNFpBRG1mUlUwS3R6ZVlmTzJ4YVdVRHlw?=
 =?utf-8?B?RkF3TGl1UlNRZStMMkE4UnpiSTVpRkUwSEs2c2dtQWFDQjNyZnhJbWNTNXFL?=
 =?utf-8?B?cytNZko0SUhMTERBeVlWNTVkcnNpMFh3RVFZNVh2YjJGMWZyOFlXaFRtNlpH?=
 =?utf-8?B?OWVlbDFXRnVzaTNmcm5tcXl4bmNZdVlUNEpPSFloUUxOK1lMNDJDNER4ZDRV?=
 =?utf-8?B?SG05YllJUXVSSFdrY2Zwb2s0WFVMbFlSZ0loclhiV21oemYrNGdsV25vcVhN?=
 =?utf-8?B?UHFmRVZSdElrcVBRWkNRNmtKZGlXZmRzY0t6bEN3T3NvdVE0QjhUSVdIUDN0?=
 =?utf-8?B?WmlpNEVzU3N0MEp3SGkzZXRVcndPb3VZZjl0QjYzcXg0OEJiMXVzS3h5Y3lG?=
 =?utf-8?B?S3VZRWVLWTBSR0MyY2o2N3FKODV1UnJWSWZ0dlFiNm9QQk80Rk9hb1JTREVD?=
 =?utf-8?B?RmVtZDgrbGdNUnQ5dlpmcVo0dGRKOXRiV3BENXkwY3dXcDdJRkhTeTJwSXZT?=
 =?utf-8?B?MkxKZnI5bzhDVWJJR2d4WXZodGE2Z3JDb1k1bEV5MjFUaFZ2VnN2L0ZkRWxw?=
 =?utf-8?B?Q1JmSWM0Z2hORjRwQnhjbHRyQUc2UjZuVFJyZGd3RnZrWG1xSCtuZmhvdm1q?=
 =?utf-8?Q?ctVM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnhPdUl0alpPbCt4UVdpWjhYajdUQW4xUHRwenZZSHgxajhKdXN2T3BvRjd0?=
 =?utf-8?B?MDZKTlBrRlAyUkFNTWNNZTA4TDJkUTBNYU52cTl4OWIwd1pkQ0RCUjBreFhI?=
 =?utf-8?B?bHBWd2lFSHMxZjZ0WE4yMGNRQ3JiRzZ3bDdPM1gwejBySElmRk82THpwWHBV?=
 =?utf-8?B?UXVOZ21yWnhuRldHU2hnQlJvK3pmMytzbGJ4dmNJTjJDOTFEODdJTmVEUXMx?=
 =?utf-8?B?YnV5eHRScDdMVzVTZkxpdHBMV3RlT2pZYUtzWTlYYTdEbzVYVTF1ZFBreVhI?=
 =?utf-8?B?ak9oMGNBZXRuS1Rrc1pCd3h6b1U5eHA0L2xKZllZUm5lckRLTm40ZnBFd3dH?=
 =?utf-8?B?M1JOc0cvTjNZbzdDNXRETjAweXREeHYyZmw5cEpCY1dzWTk5YlFhYlEvTjdu?=
 =?utf-8?B?QVAzR3M4eURRNis0UE5wa29hbzJDTURuSEhjQXlyZlJmSkVFMnlSeVBNdjc5?=
 =?utf-8?B?eW5tUVhCOUdYKzU3dUZSTnl2TVhpMlRUUWZ1ek8rQ3ZDUGNQLzMwYktpZkFG?=
 =?utf-8?B?cDRRT2tHb0hVTkFISlNCNGIxTklZcElaSXlNNHpVdXRpZC9HakhJVE1sWkJt?=
 =?utf-8?B?SFlTMG5aVGtCaElwTnZjZEJTTjVnUjN3V0U5N040RkIvQkFwOFBEREY0MlpJ?=
 =?utf-8?B?NnZzc092ODROeEJlc0QxSVpiMXZ3bnlvMjBGMk9qT2pBeDdZZXUzWVJDOG1V?=
 =?utf-8?B?aVVtYmRGdUJKMU1pZDIvcG52WkJsb21qNm5VekhtSDBmSVY5QVRTVjhycEkz?=
 =?utf-8?B?d2hIWnpuRXl3aytTamNldklPUVloNlArdUpGaHg0SHR2M29mM0tJSzMxWkY1?=
 =?utf-8?B?dWlOU1Q2YlBNemVKU3RqSVJjMHI0WEFNVlp6YUpsR2dPVHpvajhFVWhOUFZ4?=
 =?utf-8?B?STJMb2FYNk5IdldVREt2UlVNcHh5TWphM1Y0YmJObFdiRms0TmtTclRUcHZT?=
 =?utf-8?B?c0FUQVVTeUVGUE9tNzRMWXJWV01Zclh1dWczZkIwd0RYTWhDTUxBMG1uZTlC?=
 =?utf-8?B?di9XZUtybmxpSWZZVlBheWZEQXpxN2NjU3lJemZTcS9pTTViSi9RNDE2ZStW?=
 =?utf-8?B?Vy9ubGpFRU1oTGt4Z1lUSEJMaVdrMG1aUmVGTUhoQW8wdGU5N0xOZi9oeGN2?=
 =?utf-8?B?THFycGppV092ZjhWN1hFbTFGb1dPTmZzRHAvTGoxMmVUUWV2dy9YQzdiVGxR?=
 =?utf-8?B?TXFkVUxVS1g1UTc5b29EdU43em8vS2VHemRibU43ZlhHaFRmdU5JUnh4YWtt?=
 =?utf-8?B?RzEyZEpHRURGdGt6QjVNenQrNDd4WUVKVjBzM012RE1OK2JzamF5YmdOdi9S?=
 =?utf-8?B?cWM5cVV3bXg5NXpmSzBoUE9PUUR3azQ3c3ppSEV3Kys2OXB4T1JFN0Z3amhl?=
 =?utf-8?B?YzRSUzVnZ2h5TlRjbUlVTXM5a1pZOGpWd1VMOHl2R3NvZ1BaeldyUmc5dWhq?=
 =?utf-8?B?QVY3S0o4UXM4MkkzREwxb0QrR0s0U0tOd0hYRDBFQnNqaVJLZjY4NTYvUy9s?=
 =?utf-8?B?VDdZSngzdG80QnRNRDVuM0pRekR6SkM1VE85V1hOb0RrVno5VUpTcjA2Sjhm?=
 =?utf-8?B?dWxpeEd6VUgyNktKWm5HTzJyNmFpQnlnbzEyV1hvVHNSdk1vSTlPSTk3R0Rj?=
 =?utf-8?B?QkVKdktvNExmM1RKZlltY056TndxZGhsWExoanVCVFBCY296c0d0WU5KNXJ1?=
 =?utf-8?B?TzZPZzlobUk4TmhWZ2JzeUVDNDlBTEdTNjNkcnBTOGdrVnVPNlM1TDhObUR0?=
 =?utf-8?B?VnQ4T0llWmY2RFp0MTBQcG1FNitVeXBzamdzZnRNa203aFZWcjVhTGlQMTlI?=
 =?utf-8?B?dHo1Z1pPRDh2OEI0NGxZcGtxQ3VKckE3amI5THpLZzQ0dzc1OVYrMGZnSHBy?=
 =?utf-8?B?R3RmbGgrYTVwYk9tYi90bGFvb3JHbFVoVVhCVVJ5akRDZXJGclpHU0c0WFBo?=
 =?utf-8?B?NUFBbDJtNG9JUjl2N3NudVRDdUZjV3VTcjBHbGowanRubG1sbzBSRlB1cGQy?=
 =?utf-8?B?WnhBNkFTRStZbVZJRGkzR0VNV0Q2UzR5amNBeFRxaXdESy9GczlqbXpTNzV0?=
 =?utf-8?B?amhzOS8vaUthcU5KRUxneU9ac0tYMGp2aGkvR3VaN2pnUWtNdmYyRTFCTTJ6?=
 =?utf-8?B?YkZqcm1IYmVnSTRHdVJ1Y1YzUEtmOGFCdlBpa1NqSnVJYVVaUXBsSHRJanNN?=
 =?utf-8?B?WEtPQjRKTUZUYVMreHZWRW94RlZ3VUpNbEFEZm1ZTGE4bUovS0pxcmJqSFVj?=
 =?utf-8?B?aXc5RFBwQmpza09pcDRLRVI5NzBlMVpMemJ0THZGU0xUUlN4aTNublo2Mm5P?=
 =?utf-8?B?cmdpVnZ4Vy9wU2JFckJHekc0NHF2N1hLLzMwQVJrNUZFU29hb2ZKZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b2d06f-b47e-474d-608f-08de5404b558
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:07:13.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4npOedPRBpl/gGTfyeTEY1rhy4fez0TQkpFcER1U7xZC7bRYIB09/l6DbaIB8/EO0l9d9vPEQalLvSzECLU/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF89A593F05
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-15 at 17:18 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
> > On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> > > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > Reinitialize metadata for large zone device private folios in
> > > > zone_device_page_init prior to creating a higher-order zone device
> > > > private folio. This step is necessary when the folio’s order changes
> > > > dynamically between zone_device_page_init calls to avoid building a
> > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > must be passed in from the caller because the pgmap stored in the folio
> > > > page may have been overwritten with a compound head.
> > > 
> > > Thanks for fixing, a couple of minor comments below.
> > > 
> > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > Cc: kvm@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: nouveau@lists.freedesktop.org
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-cxl@vger.kernel.org
> > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > > >  include/linux/memremap.h                 |  9 ++++++---
> > > >  lib/test_hmm.c                           |  4 +++-
> > > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > index e5000bef90f2..7cf9310de0ec 100644
> > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > > >  
> > > >  	dpage = pfn_to_page(uvmem_pfn);
> > > >  	dpage->zone_device_data = pvt;
> > > > -	zone_device_page_init(dpage, 0);
> > > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > > >  	return dpage;
> > > >  out_clear:
> > > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > index af53e796ea1b..6ada7b4af7c6 100644
> > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > > >  	page = pfn_to_page(pfn);
> > > >  	svm_range_bo_ref(prange->svm_bo);
> > > >  	page->zone_device_data = prange->svm_bo;
> > > > -	zone_device_page_init(page, 0);
> > > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > > >  }
> > > >  
> > > >  static void
> > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > index 03ee39a761a4..c497726b0147 100644
> > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > > >  					struct drm_pagemap_zdd *zdd)
> > > >  {
> > > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > > -	zone_device_page_init(page, 0);
> > > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > > >  }
> > > >  
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > index 58071652679d..3d8031296eed 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > > >  	}
> > > >  
> > > > -	zone_device_folio_init(folio, order);
> > > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > > >  	return page;
> > > >  }
> > > >  
> > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > index 713ec0435b48..e3c2ccf872a8 100644
> > > > --- a/include/linux/memremap.h
> > > > +++ b/include/linux/memremap.h
> > > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > > >  }
> > > >  
> > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > +			   unsigned int order);
> > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > > >  
> > > >  unsigned long memremap_compat_align(void);
> > > >  
> > > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > > +static inline void zone_device_folio_init(struct folio *folio,
> > > > +					  struct dev_pagemap *pgmap,
> > > > +					  unsigned int order)
> > > >  {
> > > > -	zone_device_page_init(&folio->page, order);
> > > > +	zone_device_page_init(&folio->page, pgmap, order);
> > > >  	if (order)
> > > >  		folio_set_large_rmappable(folio);
> > > >  }
> > > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > > index 8af169d3873a..455a6862ae50 100644
> > > > --- a/lib/test_hmm.c
> > > > +++ b/lib/test_hmm.c
> > > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > > >  			goto error;
> > > >  	}
> > > >  
> > > > -	zone_device_folio_init(page_folio(dpage), order);
> > > > +	zone_device_folio_init(page_folio(dpage),
> > > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > > +			       order);
> > > >  	dpage->zone_device_data = rpage;
> > > >  	return dpage;
> > > >  
> > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > > --- a/mm/memremap.c
> > > > +++ b/mm/memremap.c
> > > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > > >  	}
> > > >  }
> > > >  
> > > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > +			   unsigned int order)
> > > >  {
> > > > +	struct page *new_page = page;
> > > > +	unsigned int i;
> > > > +
> > > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > > >  
> > > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > +		struct folio *new_folio = (struct folio *)new_page;
> > > > +
> > > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > 
> > > This seems odd to me, mainly due to the "magic" number. Why not just clear
> > > the flags entirely? Or at least explicitly just clear the flags you care about
> > > which would remove the need for the comment and  should let you use the proper
> > > PageFlag functions.
> > > 
> > 
> > I'm copying this from folio_reset_order [1]. My paranoia about touching
> > anything related to struct page is high, so I did the same thing
> > folio_reset_order does here.

So why not just use folio_reset_order() below?

> > 
> > [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
> > 
> 
> This immediately hangs my first SVM test...
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 6f46ab14662b..ef8c56876cf5 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>         for (i = 0; i < (1UL << order); ++i, ++new_page) {
>                 struct folio *new_folio = (struct folio *)new_page;
> 
> -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
> +               new_page->flags.f = 0;
>  #ifdef NR_PAGES_IN_LARGE_FOLIO
>                 ((struct folio *)(new_page - 1))->_nr_pages = 0;

This seems wrong to me - I saw your reply to Balbir but for an order-0 page
isn't this going to access a completely different, possibly already allocated,
page?

>  #endif
> 
> I can walk through exactly which flags need to be cleared, but my
> feeling is that likely any flag that the order field overloads and can
> possibly encode should be cleared—so bits 0–7 based on the existing
> code.
> 
> How about in a follow-up we normalize setting / clearing the order flag
> field with a #define and an inline helper?

Ie: Would something like the following work:

		ClearPageHead(new_page);
		clear_compound_head(new_page);
		folio_reset_order(new_folio);

Which would also deal with setting _nr_pages.

> Matt
> 
> > > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > +#endif
> > > > +		new_folio->mapping = NULL;
> > > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > 
> > > It would be nice if the FS DAX code actually used this as well. Is there a
> > > reason that change was dropped from the series?
> > > 
> > 
> > I don't have a test platform for FS DAX. In prior revisions, I was just
> > moving existing FS DAX code to a helper, which I felt confident about.
> > 
> > This revision is slightly different, and I don't feel comfortable
> > modifying FS DAX code without a test platform. I agree we should update
> > FS DAX, but that should be done in a follow-up with coordinated testing.

Fair enough, I figured something like this might be your answer :-) You
could update it and ask people with access to such a system to test it though
(unfortunately my setup has bit-rotted beyond repair).

But I'm ok leaving to for a future change.

> > 
> > Matt 
> > 
> > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > +	}
> > > > +
> > > >  	/*
> > > >  	 * Drivers shouldn't be allocating pages after calling
> > > >  	 * memunmap_pages().
> > > > -- 
> > > > 2.43.0
> > > > 

