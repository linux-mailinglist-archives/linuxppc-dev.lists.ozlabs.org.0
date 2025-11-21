Return-Path: <linuxppc-dev+bounces-14396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C2C77240
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:17:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCL4G2454z2yD5;
	Fri, 21 Nov 2025 14:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763695038;
	cv=pass; b=RP6Vk4Npi2KHOKrKnJYFWSYwurkQtyh3Umlq1j6yjAdSpOzAhesl7sIXqsfv5kTTAgY0w0WWHODXcZhjIcuUCmBEo/QNfWUSQPBDvLaQngr74uc8NSfAdOU7riqjmRoI7rK3lmSTua3kJrgleJKAdBdtMLo6v55PbClxrtpSPermdtr/zH2ehpTyG0y61TCPuM6KQLHlJ7jDAuHp3JxZkk5ketqs1XZaBBD9YR84rWGvjA/scPTJ5t6bbf1jqqurypbyqZUnNSy4dRSg4HcZLlq32Lb7RsQpPlX8jnrWQhn8QI3mYu2Qfd1EB4pvtxUeGhV5XbJHKXE5YJdUcujumg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763695038; c=relaxed/relaxed;
	bh=KKcWoxp5kL55HIr8z1NoDWFm2FwEt/vFLyFEdMDFHQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gfJ1h7oEecRTKC/FTPYb08MoEzrATS1ColiNIN32shALA2CB8d7W2DqEYQe6xvB4R8Ala0Ec5keI0GhxAcdYEt4meOeR8CitreaBPXUcbnde4+DsyO6Mucrysx78sPlU1G+bk1NIRaBrDymppIUsbHpAXHMsyCOx5EUic8DhFBJyz17us55ad8cEE84JZdGQa65GpK4KX4DgACq+AAAxPu2iBTrO2CLPeZVgxU0jsUqSTpG+DU1Wt8hXcE/67zh/0+9ZP+DZmcGlM8x09TEyJJHHbnksj3oGngO+uxZMNoz6ZxvH0nWGQ6W9vXbNGLhkPBhGSSiDjkt9YCDineA00g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EmAOJav2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EmAOJav2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCL4D3MnQz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:17:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTHq1WehUt9aVF/Y9dAig9RWeBMBaroO/KZmRZNT4hLUtTwGsqBYGkSMVBmyauRXvx1NlWPdPEVYdA0ohXJZFUFI4YH7pAl4q1GucayFoDpuCaWHpOvEuTDCKZ2dlBVHYxUByTV+AieXfCdHPWE+KJEl1WbOCKREf98LHXnQYzLFne2rBevfRXMSvTOW8Aa3F1I2QwQKc44zzedypVR8+c4VNCrPsFLW8msiBTC6vY2h4FtIp4tzGPcfEWPvzSBTebrE5h/ZwHfo0CVols5JOJ3PEDcl8OuxSSR2zdHg4ByV6RvHXbGH8om46EpD9opwmPY6JmI/S7xfhGABdI7bvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKcWoxp5kL55HIr8z1NoDWFm2FwEt/vFLyFEdMDFHQA=;
 b=ikr1Yr+romSwRv+K5H8rkav2q9xOQTyH0kC5zELphlvUQlYCAd2/OhwJXcnRFRw7Sl6m9d+ya7g/oFXMFUxnyPv2psBv5njT6KDX+9A7WB3OlDzPaQYAyc2jX+0NoNVQbNjrajM+h8MJT2Qflvvwe1GTs0WkgljZiKjIkQkghkOGl8ra9x2Z3bWev9JdAQuLqNbrEmaDSuXyj/hlgc4zvSQiLkurpK49SFpaWrAtfbKtACm8Vzx5a5fX0KulSYb5V2L6Fm7gxdOQRmLa1OzXvjSnp/3wbwnYe6TRCPoDgpAg8snEnIiXK2pG7M8KJ/raOcjnGJCYBVNR6YhpQn0PIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKcWoxp5kL55HIr8z1NoDWFm2FwEt/vFLyFEdMDFHQA=;
 b=EmAOJav2/m15afSK9duAEbTQmrJuTZpVh5tbAPiq3Ltu4BY/W76wFctuQBnEbOUi6mhqXk1iHXACi6nzuAZVTL8TlPx/N/VncP5DeHCH2jJCKk5jR0gUlI23+z9hMOXZDegG6ZBqB9Ey+JWPt6MQzb9Og8Xeo3LlnoTUMKom5os=
Received: from CH2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:610::48) by
 LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 03:16:50 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::18) by CH2PR05CA0035.outlook.office365.com
 (2603:10b6:610::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 03:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 03:16:50 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 19:16:49 -0800
Received: from [10.136.37.179] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 20 Nov 2025 19:16:44 -0800
Message-ID: <0f9ed7ce-3839-4d2b-98b3-25cc4045aa22@amd.com>
Date: Fri, 21 Nov 2025 08:46:39 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] sched/core: Add support for nohz_full CPUs
To: Shrikanth Hegde <sshegde@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
CC: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <srikar@linux.ibm.com>, <gregkh@linuxfoundation.org>,
	<pbonzini@redhat.com>, <seanjc@google.com>, <vschneid@redhat.com>,
	<iii@linux.ibm.com>, <huschle@linux.ibm.com>, <rostedt@goodmis.org>,
	<dietmar.eggemann@arm.com>, <christophe.leroy@csgroup.eu>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <20251119124449.1149616-10-sshegde@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20251119124449.1149616-10-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f96804-fa11-4c63-eb78-08de28ac695f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3BqTFg1aEI3eXpzeVl4cEx5ak5MY3dobzFhK1Ztd09oRzg2S3hXd2NZTng0?=
 =?utf-8?B?QTN4RTZ1aFRlKy9xbDVPa2J3ZjhDNmNPejg2UmVNMzhmdUFKZXoyMzJzVmEv?=
 =?utf-8?B?QlFtWU5UQ0dGSmYrcUFYQUQzbjI5R1hKQnRsWTBhRTFGRWcrc3BLdnBiMTZW?=
 =?utf-8?B?bm9ZM2JXMWE1Z0NjbmYwbVZKUC91cmFnYWYxTnlONmp2bDlnS0llNG9rN1Yv?=
 =?utf-8?B?NFVUOENhTXQzUzNFUkR6emxDTHE0ZkV1OHo3bDJkbEZzcG1mU1ltZGhycTFK?=
 =?utf-8?B?eEc2M1dZUW5OY3NicnBIMGxwc1pYbFEwZGp4cUZSUmh3MWJPRW1BOWZtclha?=
 =?utf-8?B?TUlJdUxvc2FLNE84UGI4Z2FZNldVT1B3V1JwaGpMSTlScFdOTGxJNkUzQWMx?=
 =?utf-8?B?alhCVW5wVjBBRW1pUGZQV0JSc1ZmcS96V3U4Z1AwVDlzQW51VHVLbHBGT3ox?=
 =?utf-8?B?QUxFNTlrQnlxL1hDMkdId0NRUjF3K28ycnByOGRxYWhDSlp6dWwyZlZnTDF0?=
 =?utf-8?B?dmU4dy9MbENoTXhSSE1aVWhOSVRzMGEyTkhBZ2dnL0Q2bUE0T05yWTc4Zldt?=
 =?utf-8?B?RGErNDNkZkhmbFVRSXZ5bGNBMkhHajh6SjNRMEtYVnBTMlAzb1BWMUJFTmk1?=
 =?utf-8?B?YVhlZTltZ0x3YmlSckpTc3l2Mm1xaUZCUTY1dUJjTHpiTldUVWN1V3ZnYUxp?=
 =?utf-8?B?bXByMTJXSTBJQ2JHY0tGOTI3WXlWV3hPN2JJSWNtV1pQNlBEM2kzTkVVZ3h0?=
 =?utf-8?B?K1BlcExpV0ZYK2tCMzNpckZNSzdSNXBKRzdHTHJUT3NzaWFubTQrSFhoY0lT?=
 =?utf-8?B?Nm55RlRmWnhzZ3VFOVhuV2lKUGh1WFNjczlBN2duQnRyejE1TUJGeDlTcWVJ?=
 =?utf-8?B?K2NPQWNpcjI1WEVJNnc1WDlKTDQrM2x6S1Jrc0E5cHgyVEVBMitiTFVSYXpX?=
 =?utf-8?B?aWs5NlQrZytYaWFIYjdEN0EyYlh1UGo0cWY3dkVLT1JZQzIrNktEUjI1endz?=
 =?utf-8?B?cS95d29qNVFMNTRndytRdGJZYlZDcEhIemNIM3BtZ0kzanNjeG40M2F2WEt6?=
 =?utf-8?B?RnBhWW8wL3hoVEdraWFKWFJXZ0xuaDNBMHZRaHd1aHlnbElTV2tVQjl2bit4?=
 =?utf-8?B?UzU5Z1ZHQUJlZEhQZEl1WitzSmFXcVpqNStNNXZBd0htc0w4U2xPU0pzaGRU?=
 =?utf-8?B?RHhPT2U1Ujl5MEMwamNCcHFzaXdyOHFKRm1RRkdKcTNGd084MkR0MUtWWlB0?=
 =?utf-8?B?UkZSSUJyeGtPYzNIMEFIdXdmZ3hKdzBMV3ZHVVJyL1Y1bVJiUWFnTXJFb2sv?=
 =?utf-8?B?YklIbzFmMHpQQUNldFVsUUFkdG5ONWVpQjQveEw5QUZhak1GSUozUWZOU1NO?=
 =?utf-8?B?NTVhWVkyT3JmeWw2ck1Qd0lvcU41S0hlbkxYMGs1eUo1ZjBKVW4xOWRwMUJL?=
 =?utf-8?B?Nlc0YmhqR0h4eDh3YmNmVENYRzZ6U1ZGbUpLYmVkYWZQYWZZMWhXbWhIZFpE?=
 =?utf-8?B?Q04vRG1GM1cwbTh3YnJ0VUYxU2Rzcit5TVRQeVZHaitlU3dqZkMvaVl0bWdn?=
 =?utf-8?B?Tk9PVHQ4ZGlKK1lkQnlrUVlleXFYSGQzQVEzSUg4SDBjY1dSNjZqUmZPYUF0?=
 =?utf-8?B?SWpXdEdqRUQvTHFoRVg0RkVJTFM4UENveTkvUFp4c2oyY2dCU1ZqbE9LRDhK?=
 =?utf-8?B?MEliQmJ0aHhLcG1rckZ3NnJPenVJQTRmUkxlZndsZ1hxcnk2LzFrbUFoWXMz?=
 =?utf-8?B?ekh5blJqa1ZVa2JXNnVSc3hvd1BmaFQ2Tlg3aWxLM2ZFUytMcnhpQmdaWS9C?=
 =?utf-8?B?VnVzaWdOdFFsWDU5ZUsvMitndndBeVkwdHY4cldjVXJLV3VYM0dqOENmbWlD?=
 =?utf-8?B?RDVzNldib1BBUHQzYURFZU8weTF3dG5LRXJpZ0NCbngzckVWcytsdVptbVY3?=
 =?utf-8?B?ZSt3QkxTZm1GMktobTk0VFFUcFRkWVBjT0tqM1J4aU8rY0xPL2I4ekJobmJU?=
 =?utf-8?B?aXdtSFVHL0QzYndMTkQ1L0RBSW1XNEZidlNScDlJSVB3MDlEZFJFcUtLM091?=
 =?utf-8?B?Y1pTYVIxNTAvUUV6c0ltaXJ0Y1kycFZWaGNORWVNelJZSG1QU1ovZm9WMUl4?=
 =?utf-8?Q?uIWU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 03:16:50.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f96804-fa11-4c63-eb78-08de28ac695f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 11/19/2025 6:14 PM, Shrikanth Hegde wrote:
> Enable tick on nohz full CPU when it is marked as paravirt.
> If there in no CFS/RT running there, disable the tick to save the power.

Wouldn't the task be pinned if it is running on a nohz CPU?
We don't push out pinned tasks so this seems unnecessary.
Am I missing something?

-- 
Thanks and Regards,
Prateek


