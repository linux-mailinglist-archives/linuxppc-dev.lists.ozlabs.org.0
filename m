Return-Path: <linuxppc-dev+bounces-16079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFBeBb8DcGmUUgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 23:37:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D534D14C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 23:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwhzb3mHXz2xrL;
	Wed, 21 Jan 2026 09:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768948667;
	cv=pass; b=a96+lKGk3UNTLEGcAZbGdMul/HLK48kL59YnB6dPEnVDUW128ykMXWA9RurOG8vQ/cBjfgBWlCDf5eDTFsl03MDKEB6x5XGLNNtXkY1GO1C2sH/eq4eyiqHEPDhak0ew1Ik0wrUsFX5vNKi4yvsYGH4Vlz+IZa32K6GP0P04tjaCfFOmvdxqErAQtqFrr4jHydfDdaEJD0tCYdIvXUJYUZ9AfQgf3cNulHWVVqsOm6CD9J9Wutl+v7VukRWCsLHjHiLjMRR09VucMcMMpPzT05akD1hSWxMipanKY6aE+aejAsOD/7yKx7wSZqiFmOEEn9FA0pfb29pq/m1+za2VpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768948667; c=relaxed/relaxed;
	bh=V02FSuUTdC4IGFyrMcMeYU2JZx7RjI34GAb3T3cau80=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S2LlTxZDTPDPP3BIOxhAfHerrvd7c3Ns2OBNHhZnQXbv1YSJ/CHMvSu6KFMZWwJqFOuNGiDMyQ1JmDCSxTsgLSk7yoHjLbGcH20Qlq8j8C1timRjxGl5vGLa9AXacVZb+08PbxE3ikz+A9BlpqnsbZPAICMNnVYjs32jbMuMKbOBJcdUCVx09MVUWmGvJPoJd6aHzKBgdNOf99/egWcslZgL9zBfWwG3Uu73LVa7MkpiEKECpr5jhKE9mEIrfXvOjm9wfS4AlGQtL7tUVUhk201Hb8/mcy1A221eUAuMtnWZqKwTGAL7g7eK4MWevfEwb9kls9s+hVY/t2MjnUVuEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LILWGVAm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LILWGVAm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwhzZ3j77z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 09:37:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQmUsXNjfJA9EK6LwHYhj6XEmC9CzEl3bU1rdFU+QjcTNXAEHyIZbZioLRnISp26NdM+H2axP74cgRBw3ry2DDH7T+cLgmtzJLCAmugey7AcuL4seyGfF2Q2DmZtz6PUXaboU/+S7s95SpDz2mTCyHDE326kgv1csDlH2WLlEtSU4z+5gAUeZsdRU56T05tHeu3XjHK3xpRId/KdlfqwWGk41TRGbkc3XWaXmvQdSj+gv8+sTzpj7o0epg5JUtw2C5PXFOYSZvp42aEgsV6y2pJcnTHJahOqIQMrTiAmsXw5Iu2LB0C+L7w77/JGEwfW8V+UaQoFHSJb9Na3lmZAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V02FSuUTdC4IGFyrMcMeYU2JZx7RjI34GAb3T3cau80=;
 b=elzGUrhxXJkPjdzKx17zpWAlJkPjS7MV/cYXeL1rekCa53Gv2kw/81hGbqYpbZUNDOXZSBHzpgjvSyu+RoGS912VK0B5aRfExT0LuBgcA+u+pV06+2hQMf4OHM3NmAemk8232p3Rav4mNG+xDPIvstucc2XaQ1XwyVymSXdFkfR93LIIuPim3JA5FarEWwj4peU5SdU2p5+eHXmqTnKaLZQJTVWjLMBCucPB35DE0JVYjwPeydmhumtKBAUl1AVWRcF4Tf6303VNlKVKsLJfdGCqbJRdyv+ErGKyA2BnY66fH8PoNy5mlmzqENgIS/QH4agSu0Omb9560+kjRdPamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V02FSuUTdC4IGFyrMcMeYU2JZx7RjI34GAb3T3cau80=;
 b=LILWGVAmEbI2borhXYbQ8A8RMQBwAL3Bk7MQdgK7V4qqqChxVI0prPSPx3A5Y7g0uu6jNapEucuRJGJHjn8Q0ZgNp74w1S3IV3USrYepvCJgysdGJT7WSlb6cy54GUHpMZKDK0CTi3/1dRYmaVaNYXWynRGO8NnTzzDcjNRc+v/4Vvbr0gUjcUn+c2qQOG3Yv71GXEc4o1ocoipO5ALps1PG2Ptn0TOrDXngcHDjtTTiDD6X/sir8TG4VUwb/0RgVwUOWJDvFAtJOEI2ltXyj3isfvIlXaF/GuXa0p/xzHvqwh/8gTz+soCipoJjDm91VgbqWmylnxemJtg2CZ5XCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:37:21 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 22:37:21 +0000
Message-ID: <e28edba2-889c-4590-ab2c-6ff377c36f05@nvidia.com>
Date: Wed, 21 Jan 2026 09:37:12 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] mm/page_vma_mapped: Add flags to
 page_vma_mapped_walk::pfn to track device private pages
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-6-jniethe@nvidia.com>
 <FAA66997-D211-4145-A49A-8A21E0FA0376@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <FAA66997-D211-4145-A49A-8A21E0FA0376@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 06cd8ea4-5d86-44fe-c971-08de58747974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGxFbnRDL2RmYlorUGhXMGY1aTJraHBiTk1aTDRIUktxMlg1UUtMUnlheXI0?=
 =?utf-8?B?a2RsWWM2USs5V0MzekhBRHA2b0NuSHRkS3BTekZVQzd6RGlpSjAwbW4xUFA4?=
 =?utf-8?B?UkdYbzE4Rm1uQXlGSjBrUVg0dnZ4QVNJd21zT2NKOEZoOE03SmZhWi9ycW5D?=
 =?utf-8?B?Ykk5YmpBc25qMVN5akNpQklGR1liUnJUOVNYV0Z6a214cGErTVJlQ1ZtSFAw?=
 =?utf-8?B?TE41VDhMbllSbUpzRGx3NEIzaTNVcGFubDc0ZkdETGlFanJibFcxOTVYc3J3?=
 =?utf-8?B?VGhjaGt1WnNSdzlUV2cwTlA0Y04wd2VYVmRPTFpyTFRSSUVKTEc5K3g5NENO?=
 =?utf-8?B?NzM0aGZKMzY2eXUvRmNLWVZRWFpUOGtBaUtrMXpxdVpvVnkyanUvN05iWEx0?=
 =?utf-8?B?UjdaMUgyVXg4TzU4aFNjV0VNOFdTcXZLSjlGRG5iVyszZ0lCSFNTdk1BaGhY?=
 =?utf-8?B?Y25kS256azZMcS8wd3YvKzZxRlIyRnJ5TVZMS1Z0Rlk1dzQ5SHlxNkVlei9m?=
 =?utf-8?B?SkFRV1ZZRjZReldoMDB5OXFONmhlZElsTGF4eVFSMHBxM1F1NXpyUTlKbGxX?=
 =?utf-8?B?TUtmMjhWd2dpT1gzbUM0b3hjVHBZWjNieU1vZnlBZzBZSXdWMG5jNk91RjQz?=
 =?utf-8?B?eklYampib1dhZENUUm5kVzVGekhHY2FLMTBKeWJ6WnlEc1M3V1VXZS9xanl1?=
 =?utf-8?B?a1o5aU1UWXpPdmUyYTg0WFRZb2hqUE1PY3Y5Vk1saHVHaE9meEkrVndUU1lF?=
 =?utf-8?B?YWFhNi9ub2ZVVlZPZEpBbDA1VFpBUktTSFhGSXBWdjB2WmFSVDZHNFQyRDVq?=
 =?utf-8?B?eDljKzc2YlQ4TVdsMThLZ1RvMmVzOHlVMytFbkk1ekhneTkwZHFHY0l4VExO?=
 =?utf-8?B?OFNIc0JLUVIzQXQxYnlDck9IbldCSFNNWXZkVzF6SzFnbk90YmdNemFtblZW?=
 =?utf-8?B?ZHBBVGJpeTVIZVpPSVNIaiszSU9tOVhNaXlYREtabU1vbDdZZG55a2F4QjR4?=
 =?utf-8?B?UzVHWUxqcS92N05TajBiSHlmTGJTa0pOVlg5T0w2SWxnLzV6V2NNdm53NDB3?=
 =?utf-8?B?MWl6UC90RElZbm9KSnlucm1KTzlWQkhCUGlBRTl5T09YU3Zmenk0Y0w3MzVY?=
 =?utf-8?B?MEFoNjROZmo4aU0yaHdINk1pM3lyQW5HYWgrQnZlL1JUR212WkZLek5ZeVhV?=
 =?utf-8?B?L2FWNkpENlJ2ZGxVZmxTaVlUM25qTFM5QzdWUW9mbjJBRS9rRmZlaGd1ZU5X?=
 =?utf-8?B?Nk5TbU1VZndvOTJnNGtqMEFTeEU0a2krZ2U3SzJSa25hTXRPbi83dklwenl5?=
 =?utf-8?B?bDRlVjZheU1UdExNK1R1SnE0clNpUnhheVFRV0tqZkx6UWEvOWJ0T1k0Qnkw?=
 =?utf-8?B?U3RQWUl1TlhQOXRKdnVxUVpxTllEUGFvYnNRbmNoNHNuajZPMTUycENuTjh5?=
 =?utf-8?B?dU5TRVN5ZE83MFB0VTNNak40Q1NscnczNHNFUVJjU2NMQVdRa1pYbVpqTG82?=
 =?utf-8?B?aG80d29CT0hYL2ZUSkRTMW9xaUVNaDhQOEl1VGl6SnBjb0J2TlFwdUFNM0dp?=
 =?utf-8?B?ZWczUkYyYmE0bWh5aWJ4UU9McURtTW4vd1ZvcW1sUmVJR0JCMmsvSGFndVF3?=
 =?utf-8?B?dkR0VjQyTUYydzZld2JPcWZIUVFvMXcwK2w5akVmYm16bS9mSTA4TFM2ekRZ?=
 =?utf-8?B?M3R4MnArWkIwQys2ajFiUjlFbENjWTlvbmhFU3RiYnBQZGpwZlE5dkZUOXJj?=
 =?utf-8?B?VURjODdvcU1zazArVHZFeS9jVmV6bUw0a0RBd0YyTWJRcWFmQXhNbCtkZWRG?=
 =?utf-8?B?R0t0SCtkaDR1elRIaTBMSFlvYlB3NndUWHg4aVMrL1FMTWk4UTNtVjgxMlo4?=
 =?utf-8?B?UytnMHVubm9OZkdJSTNueUQ3R0dIRVFENk9lRDVRbHdkV1hHanRlQUtJS0g0?=
 =?utf-8?B?a2JVNWMxTlRoa2IxT0UzLzIrbUZVSUo5eHRxVVlYazRyQkhrOFJNbXNoTnkv?=
 =?utf-8?B?aEhXelZYUlBJMVpodXZUbGdkcnFPaXQ2c2xjejhoRTlnYlN4OG9hdTZ0Y0sr?=
 =?utf-8?B?dzc3RkE2VXpzdm9jSmM2TVN3RWkvK21WdytXSkkyOHZOTUNxM2dVVTBRM2pi?=
 =?utf-8?Q?Khck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sjh1UmpTaXlZQjdiNlNpL29JT2g4bU5aQXRQTlhZelA4d3RSeW9VWHc5Rk1a?=
 =?utf-8?B?aW1zK1o4c1lkNGhHcXk0dDNBY0IwT0N0aDBnVVdPMmltUnd1WTdxNEhucVlw?=
 =?utf-8?B?MER5aFNjSjhvYnZwU0x3a2NHcjFXdkIxd1AzTHFwZHQvclkyWlBTNW42di96?=
 =?utf-8?B?ZHZtZEdXYTFWaXEybTR3aDlSTlZVZUNqcnlWZERqTWlxcHY4M1RrN2NKcHAv?=
 =?utf-8?B?UE04OWtjaVRXL3BpMW52WkVyanNpMnMramhPT0ZLdm45SGJDejFacHkzdTkv?=
 =?utf-8?B?Z3FzWDdSMUY3bmFGanVzQmNjOXlHR1lsS2FMOTFlUWJBWmhHc0FPMEdSYk1P?=
 =?utf-8?B?blNuV0RpV2JMZnFJSmhFYTdRRllwci9PWndiSHJpOXpIZGtMQWRxcmN3MnlH?=
 =?utf-8?B?ZXBOanYwNUh4YXNmd1N1SkMwSXVESVRqWSs4aHR2bDdPWTFlY1BYWEFRVk1x?=
 =?utf-8?B?c01IVEtOSlJqa3F6dDJ2WEdRR2ZENnBzVXlHVWtramRQdWNESU11WkhWcG5E?=
 =?utf-8?B?YjVsYStETXlseHRZbWlsR0lXd0xiSXU1cnJGM0F0Z0c2dVdoVmV2ZkFTalZT?=
 =?utf-8?B?TnBPcXQyRG1BRjJJZGpKRGcxK1ZuMVF2TDlOaHFSSy9Hd3J0RG8zSnhUOGJV?=
 =?utf-8?B?VFcwRldCbXFZS1hRUGk2NkJyNVZpbzFkbERqQlFBRnJ6Kzk0QjhhMEd1WHg5?=
 =?utf-8?B?NWFOSzl0TSs4UjJKakVLWEc5djVPRzRtR1A5RHo0RTU3d1dBZWZuT29jY3JK?=
 =?utf-8?B?S2RDbWp0T2hScFhpa1JzdytCL0hWL210SHdKM1dQaEZwbUhobDJCR1RSMkll?=
 =?utf-8?B?WFlmU2R0d0hobnNYeHNZY3JDbE4rU3U3aU5DQ0lBQkxZVTJtaTdkVkcyellj?=
 =?utf-8?B?OXRBSnB5T29SRlhSZDlVZk5qNXVBVzgvVHRLbHUxVVFud0lRSVphSisrbzJT?=
 =?utf-8?B?TzY1RHBvSnphWU13R2luMkJINzlUa2FIODErSTB0Tk8ycWNiUHZFM0tYY3li?=
 =?utf-8?B?TkdVV0x4UDJlVjNJaDhHTFNGaTl0eDVQZENSREk0ZTFCNzZESnFBZU1jS08x?=
 =?utf-8?B?Y1Z6a0laeUhvNVNveExja1RlY3djR0JhMWlORElPM2xOZExXN294M2Q1WE1a?=
 =?utf-8?B?cm02ZkJCdjF3U0gzZGF5U29tVVhabDRKT3ZtMHFHRnZsaWdOYUxhbm5nYjZO?=
 =?utf-8?B?S2RZRjExYlJ3WTExamdCaWl3ZEk0MTVrZjRnazhuNGpRNVBFNFZrUWV3dzNW?=
 =?utf-8?B?ejFIa0xKS2xVdmh3dW9ielAvOEZxMjZ2bGdzbmt3d3FlMTBLVngydHpxT29C?=
 =?utf-8?B?OEtQVkxGTlJzM0txTDFYcjNjMkd1Y1RtYTdkd0ZsZDBjOXhqTWJEcmZ1VVhR?=
 =?utf-8?B?YTRNekpGT0pvSURSOEc2S3lhQW1pNmh2M3gzWmxqRXRQS0VJem1CdWd2V3Vo?=
 =?utf-8?B?R2JDOWRMbFlrb2ZEdkZJU0NOTHFDb0U3N05FWVRISGYwUHA0TFpHOHN3c09s?=
 =?utf-8?B?dHl4cmdhWkp5YUIxbE9KY1pkeFJWR2trV3pmcG5kUWNjc1haZGRLQ2tDK3k4?=
 =?utf-8?B?Tys4WE9ranMxbHdXdXJ0N1FFZ0lnQmUzNFdwOGxDRGlCeno5d0JhNHRkQVQx?=
 =?utf-8?B?WVdJbHFPd2g1eW51cTBpR0ZURDVDM1dCdCtzOFlVb3YrMDBWK044UmlLWFAr?=
 =?utf-8?B?YW9hdE9LY1U4WXhaRVUxSGRIZUczNmNDUDU4R2ZzdW95MXZ2eU1XcTlpalAw?=
 =?utf-8?B?SDAyTUVyUjJBZ21mTHZERGVsaGZmRXhTa0QrQ25iWllDazQrL0xJaFF6M0JG?=
 =?utf-8?B?THMxZkNXajJKbjJheGxhNzloazNxVnd6d2VYMFd6VllvVXF5bmtTcWQrSG1h?=
 =?utf-8?B?S0g0aUpBUHZ4QTlqTFBhNkVsL0h2SThaV1JRcUdVVENyTkhTOFptMkoyYzF4?=
 =?utf-8?B?OXpVWGxESk9Ddm52ejhtNEZlMzBqNHRKai9jdWNFVm1nb21qZG42UzRhZE9i?=
 =?utf-8?B?S2x0ak83SEdCc1IyMVU4QUhQUzlhSlRIQ1NMQWdqaXhJSjc1V29uZlBPdjIz?=
 =?utf-8?B?SG1IMFY0VEZmWGc4ak1qQVFvbFlLaEV3Mi9NcWVzMjNwMTg1Z09ZanNQaHkv?=
 =?utf-8?B?Y3BhZ2ZndFM5cHVtNVFpdDVNNkdIN0xpY08xTU5wbFV3QU5aVUtUR00zWlRQ?=
 =?utf-8?B?dHp5SHhEUFBqb1BlQWJjMjhiS3ZHWG1OamhJTDdOeThpdTR4RklRNTJCd3I0?=
 =?utf-8?B?UXE4aStrVC9XazdRSVNBNkRia2EzcUhBRWFmZTlBOTlLTGVEWmJOMDZVQkU2?=
 =?utf-8?B?SEdFSzVnV1Zld1RtZ2RQRDlmc0RsVWlHMHhHdU8yRkgyTHB3cEdJUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cd8ea4-5d86-44fe-c971-08de58747974
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:37:21.2197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cATth11Oi3B+VUddM1UmMQtIq6SsMrIJtegP+FXd8ZeLV0hmwbXsM+dz293fYmK4tktoFS0STtukobAYb3W+CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16079-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 21D534D14C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 14/1/26 06:44, Zi Yan wrote:
> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
> 
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have
>> normal PFN and must be handled separately.
>>
>> Prepare for this by modifying page_vma_mapped_walk::pfn to contain flags
>> as well as a PFN. Introduce a PVMW_PFN_DEVICE_PRIVATE flag to indicate
>> that a page_vma_mapped_walk::pfn contains a PFN for a device private
>> page.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>> v1:
>>    - Update for HMM huge page support
>> v2:
>>    - Move adding device_private param to check_pmd() until final patch
>> ---
>>   include/linux/rmap.h | 30 +++++++++++++++++++++++++++++-
>>   mm/page_vma_mapped.c | 13 +++++++------
>>   mm/rmap.c            |  4 ++--
>>   mm/vmscan.c          |  2 +-
>>   4 files changed, 39 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index daa92a58585d..57c63b6a8f65 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -939,9 +939,37 @@ struct page_vma_mapped_walk {
>>   	unsigned int flags;
>>   };
>>
>> +/* pfn is a device private offset */
>> +#define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
>> +#define PVMW_PFN_SHIFT		1
>> +
>> +static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>> +{
>> +	return (pfn << PVMW_PFN_SHIFT);
>> +}
>> +
>> +static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>> +{
>> +	if (folio_is_device_private(folio))
>> +		return page_vma_walk_pfn(folio_pfn(folio)) |
>> +		       PVMW_PFN_DEVICE_PRIVATE;
>> +
>> +	return page_vma_walk_pfn(folio_pfn(folio));
>> +}
>> +
>> +static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>> +{
>> +	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>> +}
>> +
>> +static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
>> +{
>> +	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
>> +}
>> +
>>   #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
>>   	struct page_vma_mapped_walk name = {				\
>> -		.pfn = folio_pfn(_folio),				\
>> +		.pfn = folio_page_vma_walk_pfn(_folio),			\
>>   		.nr_pages = folio_nr_pages(_folio),			\
>>   		.pgoff = folio_pgoff(_folio),				\
>>   		.vma = _vma,						\
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index b38a1d00c971..96c525785d78 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -129,9 +129,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   		pfn = softleaf_to_pfn(entry);
>>   	}
>>
>> -	if ((pfn + pte_nr - 1) < pvmw->pfn)
>> +	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> 
> Can you add a helper function for (pvmw->pfn >> PVMW_PFN_SHIFT)? It is impossible
> to tell why pfn does not need >> PVMW_PFN_SHIFT.

Sure, something like page_vma_walk_pfn_to_offset()?

Thanks,
Jordan.

> 
>>   		return false;
>> -	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
>> +	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
> 
> Ditto.
> 
>>   		return false;
>>   	return true;
>>   }
>> @@ -139,9 +139,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>   static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>   {
>> -	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
>> +	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> 
> Ditto.
>>   		return false;
>> -	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
>> +	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
> 
> Ditto.
>>   		return false;
>>   	return true;
>>   }
>> @@ -254,7 +254,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>   				entry = softleaf_from_pmd(pmde);
>>
>>   				if (!softleaf_is_migration(entry) ||
>> -				    !check_pmd(softleaf_to_pfn(entry), pvmw))
>> +				    !check_pmd(softleaf_to_pfn(entry),
>> +					       pvmw))
>>   					return not_found(pvmw);
>>   				return true;
>>   			}
>> @@ -350,7 +351,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
>>   {
>>   	const struct folio *folio = page_folio(page);
>>   	struct page_vma_mapped_walk pvmw = {
>> -		.pfn = page_to_pfn(page),
>> +		.pfn = folio_page_vma_walk_pfn(folio),
>>   		.nr_pages = 1,
>>   		.vma = vma,
>>   		.flags = PVMW_SYNC,
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index f955f02d570e..79a2478b4aa9 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1112,7 +1112,7 @@ static bool mapping_wrprotect_range_one(struct folio *folio,
>>   {
>>   	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
>>   	struct page_vma_mapped_walk pvmw = {
>> -		.pfn		= state->pfn,
>> +		.pfn		= page_vma_walk_pfn(state->pfn),
>>   		.nr_pages	= state->nr_pages,
>>   		.pgoff		= state->pgoff,
>>   		.vma		= vma,
>> @@ -1190,7 +1190,7 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
>>   		      struct vm_area_struct *vma)
>>   {
>>   	struct page_vma_mapped_walk pvmw = {
>> -		.pfn		= pfn,
>> +		.pfn		= page_vma_walk_pfn(pfn),
>>   		.nr_pages	= nr_pages,
>>   		.pgoff		= pgoff,
>>   		.vma		= vma,
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 670fe9fae5ba..be5682d345b5 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>>   	pte_t *pte = pvmw->pte;
>>   	unsigned long addr = pvmw->address;
>>   	struct vm_area_struct *vma = pvmw->vma;
>> -	struct folio *folio = pfn_folio(pvmw->pfn);
>> +	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
>>   	struct mem_cgroup *memcg = folio_memcg(folio);
>>   	struct pglist_data *pgdat = folio_pgdat(folio);
>>   	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
>> -- 
>> 2.34.1
> 
> 
> Best Regards,
> Yan, Zi


