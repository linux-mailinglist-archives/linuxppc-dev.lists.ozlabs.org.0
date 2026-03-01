Return-Path: <linuxppc-dev+bounces-17481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPhnKx3OpGl9rwUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 00:39:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 169BC1D1F2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 00:39:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPJRs0HYFz2xRq;
	Mon, 02 Mar 2026 10:39:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772408344;
	cv=pass; b=OXJ/cSjtbEObabOB+R1Ue/BFGwnkVhTesMxf873H1mmocq+GSufBPYvjzgirklh8X6qVEu7qKB/9N4USynh2xn+cpbp550VG9UvQQ+B3yD8+ani8gSTfo8OaJgpnZpiiBE90JVNpC+AlFwqmuPHy7yGxNy02e1e8f/BQowwvfH/VtieaWgKqUWUVhBAiFXenKiZ/eyVkJmbpAi3KNkk3Uger3xcqPnyatSrtJLFkxNW0hFg4XP+tc+ZT9vQZE7flzuzKymFVKMbYrwoFqhrH1sR262+QrZzUj7L/2oNvR+wrRniu8TNTv7sICI2Jh5CSf5A3Eef6veHQb2UDX9LQ5w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772408344; c=relaxed/relaxed;
	bh=xXGU8D2g6poycTThIVXAeaBENw9W4dcUWvij/5gETeU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IlTN6ig/zZbLClO6t6DOpdLdne2PLQp3s02pzU5zc9ZDkgNNRQWFxpAIpjIi0NbTBg+ksbt6oBWeJEHDI9cqnC5bTfnJvYUU+c/ht/TqxSazyLUM5KhOGVmqT58x7kqZTPyFjoLmFg4/eSkgZ+tOKbI6E1SEfiSS/fvmWYzQ/f/PHHelX39zugNUHYxwWgqMW5SfcB8bvivsN+FtPjvNBhfLYBzZcb0funAWV/HsCMa1aTSm7bdfiKS4fDAcuDqg3YZh8ITLPiA/unf8eFULg+QANk+Z9RnaSvFXkwzgC72xgoDK//j3jSNhiHPOFFq9Y/RL7fhxU+r5kWwfzW3v1g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VO4xK/F+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VO4xK/F+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPJRq0z0lz2xNC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 10:39:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+10p451V7jDpXvxoCPQCDDfNnhVHsBH+kG0QCR80sGgpS8JF1gqPPSW3R7TvVEifYzS9WjbrCIpKwKnEQQ8a0kmv4VsdX97kBbHSlxFWn25JtBGlSJzNG0riyVw+u89sDzLWnGgiVdl4IEU02TKXceXJCLA+xv7pbTJT84UDEGWWleXT8ER1mhfdnQs20bUlnj7Nxi1U+JVcOMeHVEa5jbO372zV3YJVBX3uG+pkm12X+iDvxOo0khlfNRTjq2HSeEfIrcjcOjNRbu+HcdmIESRjDAg6R3F6RT/X1kOnhpZq1pFoC2t2di403835y3T54QivSdBkUeIB4dzxDR6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXGU8D2g6poycTThIVXAeaBENw9W4dcUWvij/5gETeU=;
 b=wchDaJSWsWutb60PKxkxBsKHoXDQE/6F8+Amr2LAFb72jZZBbRLT3uw2vY/tcqaB5QjOIEUfG/9LlGzDpXKbU/3VO2Bt6AEk6B9VPec/1/5yQHMrG2hMHWBTkG3oHRw5MZvkQ/kztEOYLQZIWvPHIb6h4B1wBHBnB2WxCD8n7Ugf3IZwEzHT/b2oByyk2VfKtP7vUndYGAibD0SUWde11uUXAsmo0dtJ+9Ks5mkWyx9ohFIAu1R32hDHPMcFMgB3cSh0mCSIeVfxyLTv3+livjUN3GySPrHKRD2iCp6JRvdqv1YbTBtkb7+usmCwMX11rpkgSG0xuO9mFKqJWzuvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXGU8D2g6poycTThIVXAeaBENw9W4dcUWvij/5gETeU=;
 b=VO4xK/F+6VkSTamKBR7Xnx4PTjOiv1ZrqYj5NPWgoJl5Lozf5eeTfH0UQSPLhUSgME4X/76f2sC0YeN+oFSqDXYfaNKGsvWvmXm8A6YRcLAbNHpAoirZOK0jAMZekdwsRoBri0dMXbiBjav8rTbbPNyEh8wksyncZOHhm4Fhc7ZXkZFC+a5uE09UuD41bzfEDaETPD2wIZBo0Oq0F60a1F5bStfv433ZWmaZnrn1gkNLz7bn4UVusE9n9hyWZMRExJyd2BCY9UQFN9NsumSrf9pyD32d6mtk9bZpl30TgQUoYJwENqkg/fRZiJZ7zWsLOhV7l+hwrv5Yjs/QO7vCUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Sun, 1 Mar 2026 23:38:39 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::32dc:be07:3859:b4e3]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::32dc:be07:3859:b4e3%4]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 23:38:38 +0000
Message-ID: <cf547dbb-af45-49d0-87a0-5267dedf0470@nvidia.com>
Date: Mon, 2 Mar 2026 10:38:24 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ziy@nvidia.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org, linuxppc-dev@lists.ozlabs.org,
 intel-xe@lists.freedesktop.org, jgg@ziepe.ca, Felix.Kuehling@amd.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 ying.huang@linux.alibaba.com
References: <20260202113642.59295-1-jniethe@nvidia.com>
 <20260202113642.59295-2-jniethe@nvidia.com>
 <9ee22635-a219-47bb-a397-bc4e141b408d@kernel.org>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <9ee22635-a219-47bb-a397-bc4e141b408d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: fc19446b-688d-4ae4-de5d-08de77eba9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	JeJfczj4WhKKXskzqi5TiMQMXWRSA2aXSy5FGEQcVVEppqxBRUqrcm/CvnYLo+7usvON7V+5bOeQBxVOSapbxZJ++e7ryr6AkhuSmDTZqwxwlpDzY2Tyy7q7L3uOcFDJgiCXQjBITOLafNKvbUTE1/vxySo5tqeCeU4ua9bA7BNbTIJ+YSCCbQ+AfOcLwAOTWaYJASh6zK1/gIXFWjeaA9GnkYixU/41lQ/15kTyiInMxV1Q3nZ0aRD/E4Bz+dwxW00K4D0AdgSIuiO0x4mY5cbG0CjM5aEf2/DKV3P3ijJEHG/wD1QTLJpifPVcnkmVccG8moWjsGxAcdfDOLIAgvQVI2ktxVLTz3ZRshpx53/WZhlRZyw2Lcp1kYzx2yolodWmNz+9OEEGzvynbeqNsY8EwDw+8KOXEDZMNFpEn6AwesfezYPwGP1wJGINNjIIKNQkk+GkDSa2I9GBIFyUqq8fsN5Vbo2fRj2463024RnAvq8OWlrOmyuN6C8jzLi0hNAj/JdBLRCjR1Nf4dHEAdVTpF1jkj+xU+Z8KS5DmXtUZVrqhAQC3EWwdoQtJuZ3uD8asoh1vUSufWigqHgWO+NhhCmC28erwIiYgMWqnauLWk6mlK9kmOJIAwB07nK7Iyo7XgMEzixZXV9y9/a2/81zyOe3A6yrZIs+71ZldZdhjti0u/J9pPhUC0Q/YI9zhFvwVj6nejr4QyZueqLEZjbw149YOfvvpPKnWBVKjGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MklhK0xDTjJGMFplcVpPazJtMmhyNnArRGc5ZTdjRU1BUWpDa0lMKzNkK3Rp?=
 =?utf-8?B?RWViTzdnYXdxOXJCS01sekkzMlYyazZDckM2SVdjcUJ2M1pKNVUvMFdJV3lo?=
 =?utf-8?B?VU4xdm03bHFGMTNmVlBlS2JsWmtGNzZpazBDVVEvVlR1ZUhtRWs4WmUrR3kw?=
 =?utf-8?B?K2g5N2pZdWhqK0hhMDdKRENkWEFnb1RNTngwL3pnc1FHUXVCVlJqdldidllS?=
 =?utf-8?B?dnJuYkMzd0xlTk1Gcno4TmV4UkVoNW9IbG5RdkJObzU0L1RxTllabk96VFR5?=
 =?utf-8?B?UXRFODhSUnFkdkZZTm1EbmJYTFNJK2lJblRpci9NYnNXeVJ6V1BkdDQ4dEZw?=
 =?utf-8?B?bXRSZWRiZGg1QW5hcC9LMWYrWUphb05kQk1aN2JzdFRZZ2wzVXNDV0l1UTA4?=
 =?utf-8?B?MUYxY1hFbFZQYzVhTGl1bk9XNUxFQUxNNllidzZQTjRZTGMwU2hqUWdLSjFN?=
 =?utf-8?B?bm5xUjNFMDQ5VWRJWjZDU3JoR3g2L3Axa3dEZXBJY3B4Q3kza3dNUVk1eTBx?=
 =?utf-8?B?cUJDNWc5dUttRVdmOU1mUkpyVHNQZ1MrNm9PS00yVGpySXNEaUY5b2gycEFJ?=
 =?utf-8?B?Q1MxUlBPS0k3ZitWdDYxVjJpK1crNUx2M0xJZ1RnL0VSTFNYV2NNd1FDNHpV?=
 =?utf-8?B?SFk0TTBTY2VFY2ZmY3p2ZVZHMXJUMk8vMFhJOTRsWjdyMk5xdUM1c011SktJ?=
 =?utf-8?B?YVl0Y3c0V0JHZ2ZKODMzVVdkRVRhVlUvU2Y4Z3hqQ0t0UnlHb3piaUM5Rk5i?=
 =?utf-8?B?ODRBR1JFc3FqY3pRdHcvR1BTVUVaSW0wNUZOdXgzK1BLazJ5YVRWWS9JS2ox?=
 =?utf-8?B?bFdURUhPQnFuOTMxT1hwYTE1R1E5cXc2ZmwvYzAzcWJvdk10OXlsWU0rak9q?=
 =?utf-8?B?TWtIUW0xNitUYjlqTksvOGFrY2pWbEtZd1c2RjN3TjNGSkFoZmh5eGcyOGQx?=
 =?utf-8?B?RzZLUHQ2VzhQSW4yKzhFOFlXUEF0Zk01TFczaHpuK0svaVlDVGlMT2Rlb2RB?=
 =?utf-8?B?NFlhVzhUMjEwUHRmNDNJL2cxdnlRYnJ5T0hDTmt0YS9kRnRpeHMxdVRTdTB1?=
 =?utf-8?B?RU1oUktOUzIzU29kcDJZa2dvelk0NGtKNXBuVkxBeVBpVjVTV3NPNnRYUzh2?=
 =?utf-8?B?NWZBRlV1L1V2RnFJa00zcUpjZXRZTE9EeEg0SEl3K3l4QVFnMXNkd1Axb1lR?=
 =?utf-8?B?LytQOFpKSzVtQ0lFY0tRU2xmR3pReFByMVZiVmxSSUg3YmhhR1k0WXg0UThh?=
 =?utf-8?B?aTZFQUNOS3ZkS2JRNkU5L09xNU4vRUllcXZiN3BhVUpNVGV3VkhaZThaVXF1?=
 =?utf-8?B?bDR1SlRybWRhb1dTazZzNy9NbHNPcFhvajJNdlUxblNZTmdhd3QzcDltUit2?=
 =?utf-8?B?S2xwMzN2K0NJR1VYYTVFN1Zia0JNNmJTN2hRc3ZUR2d1QmdJYU9tUFI0NUNa?=
 =?utf-8?B?MUd6Q0sva0hIWXV6RlhpUS9SMjJsZ0pFeHIySm41VmdQK0l6ejBKS0xGcFlB?=
 =?utf-8?B?Vnh6WnBrNXhNWDJDbVZjaVdFMGUxbjNXMWRxK3Ivc0RjR0NWVmZHbTVFeGkr?=
 =?utf-8?B?MkRoK2JMdC9xbml4aEZubTZkbDN5Z0MxR1NyNFdFTXJKNG43eisyZWRhV1dj?=
 =?utf-8?B?VVBRVkpXMWFhdHQ0Vnh2UC9YdnhJbVlHVUI4WkFxL2RoNmNla29hamFxR0di?=
 =?utf-8?B?UjArMmxhM1ludTY5MkxWbm5HSUZ2TDJCbWNmTklXVlovUnVELzdBbTBJQ011?=
 =?utf-8?B?TEtjQ000MHJtL1hFQitCN2o4NHVaVG5RWXgxYnlqcWRxYlhCQ1BOeXZxSDEz?=
 =?utf-8?B?c2xPYkRCT2FDNVpqQXRYV0VIdnNIVmM1QXdUUVJZcUhzQThTYmxlNTllaEpE?=
 =?utf-8?B?ZjNSRnpLZ0Z4aG84RnU5RzF4N0NWR0dDV3NNOGZzQ0IyRm1wcDFPVVI4MXVw?=
 =?utf-8?B?VjlDbklUMDF5c09wREZHMXNFV0RTeTdDZkFFSnVnaEFrajQ4UlRrM25WUmNw?=
 =?utf-8?B?Z0J6LzdUQ2pXczE0ME4vaVFpWERoYW4rWEduOU9HYXNEcFRnVm40b2dFRThN?=
 =?utf-8?B?NUdCRUV1anRUZDFtdmJwR2xCTGh3K25TSnN3OTE4NmMzM1hhdzlCdGNiZDFI?=
 =?utf-8?B?U0dudE1ldmpQaEFyelRuYkNPSlJDWmM2ak1zL3prbjNoK1F2QnNXN0srcEJG?=
 =?utf-8?B?MlVjU0VkeEhPVzRRRGZyT0wrWnNRTWV0NFliMFVNTE4zVVowZlMyOFROV3pY?=
 =?utf-8?B?Wmp2QWhBSEczYVlTY2JYOVM0VXRlb2tTejVsUDBvZ3ZhL0FZV0F0MHVrVEpM?=
 =?utf-8?B?cklQZElhTGJ0cmNLRW41eCtkNzAzMTdqY1pNSWpCSXE3YWRxaW5ZUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc19446b-688d-4ae4-de5d-08de77eba9f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 23:38:38.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNvETC7qel3nJblcuiBqvNAFKzUOkYGp1uquV2vEvQuIVIpDxpbTplR9fwFyuNRKH5z9HJIo13Ci7j9DdX/L/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17481-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,oracle.com,redhat.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,amd.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 169BC1D1F2B
X-Rspamd-Action: no action

Hi,

On 28/2/26 08:11, David Hildenbrand (Arm) wrote:
> On 2/2/26 12:36, Jordan Niethe wrote:
>> To create a migrate entry from a given struct page, that page is first
>> converted to its pfn, before passing the pfn to migrate_pfn().
>>
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have a
>> pfn and must be handled separately.
>>
>> Prepare for this with a new helper:
>>
>>      - migrate_pfn_from_page()
>>
>> This helper takes a struct page as parameter instead of a pfn. This will
>> allow more flexibility for handling the mpfn differently for device
>> private pages.
>>
>> Reviewed-by: Balbir Singh <balbirs@nvidia.com>
>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> ---
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks David,
Jordan.

> 


