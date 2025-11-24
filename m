Return-Path: <linuxppc-dev+bounces-14435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BEC7EF38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 05:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFChX73f1z2yvd;
	Mon, 24 Nov 2025 15:36:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763959004;
	cv=pass; b=I1Q5siaHdTMOdyrpwj5YxitwwznB2AnXzGAmGbaIQG+faLmJtCU+N3hDglxo2jbIhnkWu0xwJB7+aG/HzUB6g4LjaPb3OBm/XTBY6Ec/iGLGKQPOOmyWab1RcCAcHzlhplg4602LmaCa0lxwCB0vP8OZo6HvveJtQdImo4eQLpkVLAI/nUI6kNo3B8I1BREVDRdAMKkWodch7C0P6yswAOix+2nF5S7W9esDAVDeFqzZHnMDueOagIu82avwtdjrxam1JO9Y8IOkl3BEWdVro7W9hf8pLw5Ph6zt92B4q0TfJ6PgIT641D+3rQ2ZcHEI1rZB6knl7JeJ5EsDQqRMFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763959004; c=relaxed/relaxed;
	bh=6j9yfmsDzuyuE6mMPQUXGe+WUbUJggmEkZGHrhmwxsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WRWmgKHBHFJFJYTbLGa8HeHgsEX2JibsO2XVzCInNpUUzwAn3wf9SDGRWNf/nUOv5bah3bFamRgrSdQLMpqv9GR6d5N3/JYBH0lr+uZ/pKQVhNjSBrSYpqkoDZalStarAGOaKMc1/DqBjJh9yLgWcBF9sArarARb9TV4V6ZIEzAbNbzDhbBQycUvqEgThN/1W0LFHEUnJbyBjCyBiaTL3Bn3wbUDCVJOZaQVWUF0H88MZs1N4yJIkm9p5EKTW5MP8tZhGG6mQCdPQq+HsLL0oQU53iBvLmj9kESqjmYQJCxEyo+2741FUChFL/fBMYEAE8vA9gXJOk0A3eshovj9mw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QP+vitkW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QP+vitkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFChV6gPQz2yvB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 15:36:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti45sReRCRt+20mFNCLN8u+vcYFwnGxFfUbMiuV9dPEN8YL/co76taRv7uNBVilNnaWC9lcMo95BKZyxUNymF6QmNqkLjBvGR74ZSO6wWw3n8o/nzjZur1a5rFeS4tFFpQGxBaTf9oVA+VURsfgugVtcIfiX0aiAwjFMb57OmfaEycCaF7iEtxwo2qd4exEvUxrFR/TeWrspoVZiCkax0Pg+cAuNn23UXRGDlsNH8ELIF/W0bNg9d8k7Mqqm191XsFn6iK7Wl7skFVplc4aF0zToLU9LoN09iun8/+w7KbnV/a/NwgonzmPo3uwotnxK68p6a+3fYYBL4RlbiknUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j9yfmsDzuyuE6mMPQUXGe+WUbUJggmEkZGHrhmwxsc=;
 b=bAt4AgXHn9ymB4p+lUjYh32UzN92O/Dnw7xjbmukM8R0azNRn2oiCgEiUbTB3jDdGLqKrHww1t2WtHfucZyKGe7dZyi/gGD9EZRRJKNWAiSWv8uHNmh8lafm33Koeq1mwKquNfmaA5PbeffWikncxLH3clreWhCgjeOLVPOQqRRZkcWUN0mqMBMkL2OQX5iGeyBlMrkYxIfPq8NdZ+Ulfjknh2OR7US7DIQCkfgWt9YfTOJTWxE+ViA5y7wzPR7mbVJ/p1HviI4t8YFLOIyeiOMNXz270dOLNTcYsIllqVv7Cxks1SjP2RD+t0CV+M+wjkqll88s/Y8hUd71PzU2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6j9yfmsDzuyuE6mMPQUXGe+WUbUJggmEkZGHrhmwxsc=;
 b=QP+vitkWWJ4dtuxM79XD8ZFl7vXLebGoN+r78+JOdHsxULNWAaW/SBwYzOZosnVqjrkIMAcKI59VtPHg63TbuMnVT3x+OZBRQ3u2zS06WNs6CX1cd41cF4rjem3eusfe8sCCsNNsC1NVZovczIOBNNdeAMu92rWhqHwQJR+LV9A=
Received: from SJ0PR05CA0121.namprd05.prod.outlook.com (2603:10b6:a03:33d::6)
 by IA0PR12MB7531.namprd12.prod.outlook.com (2603:10b6:208:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 04:36:13 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::63) by SJ0PR05CA0121.outlook.office365.com
 (2603:10b6:a03:33d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.9 via Frontend Transport; Mon,
 24 Nov 2025 04:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 04:36:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 23 Nov
 2025 22:36:12 -0600
Received: from [10.136.36.40] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 23 Nov 2025 20:36:07 -0800
Message-ID: <ce4a239b-271c-415f-81d1-ef8360f3fd09@amd.com>
Date: Mon, 24 Nov 2025 10:06:06 +0530
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
 <0f9ed7ce-3839-4d2b-98b3-25cc4045aa22@amd.com>
 <08ff261e-7ac8-4a1d-bceb-b1bf792171ae@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <08ff261e-7ac8-4a1d-bceb-b1bf792171ae@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|IA0PR12MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 641e0f2d-c4e1-4848-c0e1-08de2b12ffb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1B1OS9rMlB3V3ZwbDRVdm1vR01pLzlyeVpJK3Yzb1dSZ2tYM3dzSEZLNEZ1?=
 =?utf-8?B?ZjNKNTFCVG1uQUZ6Y1d2SkJNdnk1ZEVQR0ovREhBNy9HTWdpNVNXOTJtTnVq?=
 =?utf-8?B?bVZkcXpXT3U1VXBQT1l0RXg1TWhsS3RLMi82YWRTNUo2N3FKU29ubm5TVWlY?=
 =?utf-8?B?aGh6TG9VWnJ0Z2RWQTQ5R25xZGd2RjhjT0hSRmhkV0pYL04venZQdVFQbWFR?=
 =?utf-8?B?OUZUK2VteHc2ZDM2ZHpxT2QzRWM1dGgyN2N4aGk3Q0p2TnY2QjQ1MXpYeWRt?=
 =?utf-8?B?b2pGRmNCcmtGcUNsY1VzamRzOFpWMWhPQlJrQXZObVNRV2NLUEhPWFhQTUZu?=
 =?utf-8?B?M2RRV3U5azN6SFo5M0dKVSswSUNtZVJ2SVF1TXpmd0g1SklvZ1pLT1hYTU41?=
 =?utf-8?B?NTFsZTUvVzFacnQzdURZdmpRWWJJS1h1ZGtnTDdLN1ZTV09SZ2hFbXpHeGh2?=
 =?utf-8?B?MVJKR2g3aUtpaTQ4K1g2Vlh1eThrR1B0Z1dhakNKTDdHU1hzU0sxSkwwN2pN?=
 =?utf-8?B?SExMV1RPS1dlMzBON1F5ODRoNkF5OG9uT0JyWW1BRW9FazBBbWRZaU9GRFBN?=
 =?utf-8?B?aG92eExXN0NQY0RKUVJxVlJWaklmNVNCUW5zRG84RUdwREltbTJwVzVEOWZI?=
 =?utf-8?B?ZUhLV2hCdTRtK2VlMUFkQ3h3clV2SHJuZkViOUNjWVVRT2hPcy9iYWRKNHMx?=
 =?utf-8?B?QU50NVBCWWEvMWkyeVVtMy9XZ1MxbHI5Z0NWQndzcE03THpaSUhjSE9ncnZs?=
 =?utf-8?B?SExVaGtCMzdXUHZnU00zSmNlQjN1TU9yVmx5dXhBd0FkdTdZMi9WNS82S1lm?=
 =?utf-8?B?N2lRZksvdDM5U3dHWnZQdnZwY1o1cXdrb0svOXNxdlA2VGltNExpMGNIOTVi?=
 =?utf-8?B?Z2E1SGZDdTZyU3hiRnZMOGZVTGdKdEUvbDI4SVRPZEQrTUlDT2ZPbEJZQVA0?=
 =?utf-8?B?R3JTQUU0dEJXVVNlMklJb3Z5eURSbERjNWJsLzlnSXZYSVRPSmllc3FwbThh?=
 =?utf-8?B?MDR4cUNROFFla25IbFNEUjRJbUw2aWZwcktwS2RyTmIyM0Mzb051eHZFY2tz?=
 =?utf-8?B?d1VwWEpIdVp2RFlkalNlQ0xFK25Tdmp3MkFGdHdpMktPTDQ1WHBZNGNsWlVL?=
 =?utf-8?B?MndOUHB4cVFYemhwN1NaTnRvRHhVdHM3UlQ1Ri9Ra3NubzQ3R2krV2FkQU5q?=
 =?utf-8?B?NGpjVWxFSU9RdWlNUkluUTc2Vk96NmpMTVlHYmxPWFlCRHVKSklzYW82NWNR?=
 =?utf-8?B?YWk4UmJQN2VHcG5jeXlOcWtkc01WMWx3ME9IQ2xtTFp2UnJkWFhHRzMxbWhW?=
 =?utf-8?B?cjliM0l4Wm9keG0vZjg0dDJLc0R3U0JUbUoyYkUwQjBURlBWSW5KbE1LL0RE?=
 =?utf-8?B?RXFKakNXbE1IUzZMZWNtekdBWXVqSFUzRUlUNXUyM3k3ZHU0cmluUW9pUXBk?=
 =?utf-8?B?bGt5VTJQeVIyeDNQNkRxb1NycG9DNVhzTHh5RFRaY0hQMGk3N1NiMmdUZVJs?=
 =?utf-8?B?L0FXaEEvOXVUNHd5UDBhQzhoYkJVNy9UVjhVQkc1dXF0Vmp4N2dXMHZSV3FC?=
 =?utf-8?B?ZmEyczZrb3JzT0RSTENQTDhaMU9sd0xXTzVsR3dUSGhrekcvN3dHbUcyc0Nl?=
 =?utf-8?B?ZFNWaWdDNThMT2w2TjNGTUlBVmoyazNiYWw2T3RPT2FWZzJCNUpVaWJZUVRK?=
 =?utf-8?B?ZTBFQ1FuWG9PZzlpRHNJaGJRaVNHK1F1Y3pMMkZwUUxxcEhjRDZKMnNvZHFa?=
 =?utf-8?B?Zjl6enpHWGVsSUUvUlNXRnJRdTJlUTNsb2hNbzB2bjMwck9NaDk1QlJWcnpJ?=
 =?utf-8?B?a0xZbmFtMVU4dHQ2RGJFKzdvQUhucWkwOXBsOVhmTkVjNkgxVzJoYURFTklS?=
 =?utf-8?B?SjlPTWJzYUR5MXc1eGJCTTVIZERjRjVXSjVYWFFUZFl4M1JqNlliVEZZaUJY?=
 =?utf-8?B?RTJZOXN5Ti9JeFJBNTY2TEYzUmIyY0daeTVDVWM0ZmphL0ZJWlVpQ09temw3?=
 =?utf-8?B?Sml6QXl6b21SUUx0YjFPcGxFSDZLWS96YnFYVndicm5NdTR3Rnp0UlpjdzY2?=
 =?utf-8?B?eEhlWGFCRE5ySFVQWFdxY09TQjFpMTI3SjlxRll4L2RiTGc5SFBYOWpUUjVt?=
 =?utf-8?Q?Uaac=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 04:36:13.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641e0f2d-c4e1-4848-c0e1-08de2b12ffb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 11/21/2025 10:10 AM, Shrikanth Hegde wrote:
>> Wouldn't the task be pinned if it is running on a nohz CPU?
>> We don't push out pinned tasks so this seems unnecessary.
>> Am I missing something?
>>
> 
> No. Task will not be pinned if it running on nohz_full unless
> user has done a taskset. They are still part of sched domains.
> 
> Pinning is usually true for isolcpus. You need to explicity set taskset
> for isolcpus since by default you won't go to those CPUs.

TIL! I was under the impression that nohz_full is a superset of isolcpus
but I was clearly mistaken. Thank you for clarifying.

-- 
Thanks and Regards,
Prateek


