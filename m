Return-Path: <linuxppc-dev+bounces-14693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7181CADF30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 18:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ8rG28z0z2xKx;
	Tue, 09 Dec 2025 04:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765216766;
	cv=pass; b=PaSv6Id5czgsfNlQTQRhoK8yEj67dw5ZUUgyehJR+ocIUHrW6rNw3P2yjPlvYJE7uRUDYJ+8W+7zLZfPFNalf9q6T9T2DDc5oFsMRiCffmHbvCCQ3zf98fz4dkKKK2blhw/EL6esFJe4TYyqsF7cXZ2lwUAovZUIrY5VzSD2fC0/Av2TIBOWCx4biktsto9svCqyLbDKP0C1x+ZKhKNmC5eeHR0UYWCxD2DY1zRToy8ersSjnju6le1TC2pThzvVuldeaDNB1I5eJruWa6oefpbRKhJiZUKllFP8q5e+40PWGYrqsNe911EqwJbkXn2WMrVBDeTX+Kw57cwFF6Kq2w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765216766; c=relaxed/relaxed;
	bh=OLlbPLYH5CUsR+UO4TbdS7wknHH9BXxtRQSL/X5vhCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kgMypYyWnMLN1mHNtquNOSIqSgIdjDxX7MxAUmClmxQAAqzRI7TPHseI/oYTh6TQjzd7QVxJe/YvYG6UWpl+7YlMBfZN/pXZ/hytZ2bDtGD+Iw7RXtja+SoMSG8QX8N7Kw6vOuWbjArtM6zTNIzkfYyR1a6TrWMxgF273syZSmiq5Vf9Q8sDC3MiMsiP39Zg0eY/JAdvUdZ6ZnpwAoa0MJz8MUvagRx/2AjSWiL8PA8KLWo3cWwouClcX3ZmZYxIz/CNrmyNpSHz4WLp6T44FPhz5mOcp4bjSlcxdfFTfc1W7LgZ9pacXu8v7tWrIadYYSUmvftLW/T5qSeBFnPi+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nerM4H5P; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nerM4H5P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ8rC4dl0z2xFS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 04:59:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsDn68oVvH7/wQHUXqh1Q2Is+xWFIeH1JB1t4Uq7WKVBex37b/kzAJ+VQZ28qSZRNHe/fRPlD0WIAASTUjk5sH1tW2KybnCiRmMyTdb1EYDCmz0ax3oizHlQMj3M+oVn8/LFk9aaJPhy+ZaRXwK6qdgUPRdTQuIMCDzi8uBok6A8kmSRPIYIxdtJbNdvRE1C/I4a+vh6ebk/KeLSsPtMpZ6ouAWOvX9Yul+28dfF+SHuidtWWuciPrOipYWC0LZ5QFyXlV8OEH9OSvNkv4eT70KCbqDaEnlon9xrh177yFaDOnPRYdk1pkYFPZMgOD1JrkyH4bAnCNGI5gzpqhTjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLlbPLYH5CUsR+UO4TbdS7wknHH9BXxtRQSL/X5vhCw=;
 b=yt7dqx1obs1bdrMSLFLDR3euIDcX7sr//hcGgPNNTthxwDVAtPUC2SKqhESlSoFiCKQOYPZ1mfV4y6QRlKxCDpaVxT7MAsZWmUTNUfJf//htbEBBd88bBHxoCMEO4dTTGDI408/UyvJYjoQDYZQ0cbUt13tAtazKC8MvVXn663jyKwYJkoM4HuV56dLuK2JOgL6sXbJDSlUsKzuPS8BXSWn0PDkHSGdy0W0D2FaNaL+wL50CEnMUdPFRUnXL6UbN0hL0x4wGtEhnwNxzJ28SFrF5tIEwt6auOOWCXk7txXXeIuzrOQzmoVLtgT7V74/Lkz1ivfNCKLPipiIXN8BPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLlbPLYH5CUsR+UO4TbdS7wknHH9BXxtRQSL/X5vhCw=;
 b=nerM4H5Pzm7ux/0RUmZobQgyipxKP26N9FWlpSXLKkhs8vvTkV3xYemmjVer/RqjX/BldX6+x0qN+7BRkHaroFglt2zI87WSfCGd5Hx6xl15+too9tDJx3Q0bMMW5E00Px9LPPb4b7PeXSaJWEusYLN+tLi9nqmlZoiK3JYIhm0=
Received: from CH2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:610:50::37)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:58:56 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::4f) by CH2PR16CA0027.outlook.office365.com
 (2603:10b6:610:50::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 17:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 17:58:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 8 Dec
 2025 11:58:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Dec
 2025 11:58:54 -0600
Received: from [172.31.184.125] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 09:58:48 -0800
Message-ID: <4e2a57f3-d6c9-465e-8af3-dc2d509f09db@amd.com>
Date: Mon, 8 Dec 2025 23:28:46 +0530
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
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <srikar@linux.ibm.com>, <gregkh@linuxfoundation.org>,
	<pbonzini@redhat.com>, <seanjc@google.com>, <vschneid@redhat.com>,
	<iii@linux.ibm.com>, <huschle@linux.ibm.com>, <rostedt@goodmis.org>,
	<dietmar.eggemann@arm.com>, <christophe.leroy@csgroup.eu>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <2f7877bd-afb4-45c1-a370-d22c2f2955f4@amd.com>
 <ec2e5cc1-958d-43aa-bc74-65640b5b8f78@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <ec2e5cc1-958d-43aa-bc74-65640b5b8f78@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c4fe86-67ff-4ad1-5aa0-08de36837485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnAyT2xyR3BHQmQyVU5kSTRNYTlhdzBYbHBWY2Y4bGRQQStnSkIxd2VIS1FV?=
 =?utf-8?B?SEd3cld4UXAzN3h5WTBjVmUxOGZXbVNGaFZEZXVnNXcxbUo0eVd2K0hNLytj?=
 =?utf-8?B?cXZxQ0ZTajAvdHc1ZjBjc1REMEJjU3BrWEp6am03cjl2V0xXM1VVZXBwandk?=
 =?utf-8?B?UjhVenowaU5JM1pHQ3FUSFR6YkJWZnhQcE1ZVVoxSlJpMW0zUlo3eVlJcVlU?=
 =?utf-8?B?SXY4WGsxWCt2eXphdktEVE5PeFdYcG5kTHB5WjJGUFdEOEp4dDhoSno5d1BU?=
 =?utf-8?B?eXNvMVpEMUthYXNnSFlnci9BN1NMeW1aWWRaOHhOSWVSVm1WTEJVSDA2eWtZ?=
 =?utf-8?B?cHNyVDBvZG9Ya28vZmYvZkpGL28rN2Qza3dSOVNIS1l5eUlrS0NWeTI2NGxa?=
 =?utf-8?B?QlNCc1BIS0k1UmVWR3RiVjk1MlRKcEp0bGYwSXcyYjRDRUljTWxWR3IrZ2dJ?=
 =?utf-8?B?dTRUbWwyVGw2OUN2K2p3TjRwSlM2TjVubXY2Ny9GbHJXTnVGN0pLWGV5YlQw?=
 =?utf-8?B?WE9zUWozK1pWV1lubHFCYnRqTGZHUXMvRTEzWXg2QVk2UDRITERaQW1STFVr?=
 =?utf-8?B?MjMrZnhlS2xTTGVEMFB3SmVXM242WG0zU2JYdEtaTmJiUTY0WC9zbm9qNjlI?=
 =?utf-8?B?TmNjVUFNSndZUWxCV2x1STM4TTVRbytQRnRST1VRcGNQWnhmU2N6MzlRa3ZE?=
 =?utf-8?B?R3VROEJsVDc3WlhkeEFwQTZLa0xQaXB2RTFOdWcremZVOG5HZytaWlBTdlor?=
 =?utf-8?B?VzYxaEFDVDBsenBQTjF4eWZJdlNuSG9XN0dyZ1JYOUpkRW9tN2JUR1FsNy9m?=
 =?utf-8?B?UUdGMW1FV1NWNFdJZlNkVHhacnlMNTNCZytRbTBuZnpBNUFvMmdIdVZVUWdD?=
 =?utf-8?B?OEZEbWpTZEhqbGdIL1h1Z0psaDlKdmRKVzZ4ZXdGZlkwaEdSclBGbWVqNEF6?=
 =?utf-8?B?VnlvTHJWOHpEQnVjdFZzSmliOXZUUnUrUWZITmR3OFkycmhrRXBmOUpqY2U1?=
 =?utf-8?B?SmVwcE12SEg4MnZJdlZVK2Y2aHQzOHdxbTUwdVhlb0Y0YVdPdSswT0NFZzJB?=
 =?utf-8?B?anZSLzl6dVkzUUg4cGJyVEUzYng2WTRTd1o5Rzk0ZWhtRDBJQWRlV2FRN2RT?=
 =?utf-8?B?TVphTkNBdzl0d1JFUVg5WnRvWk8ybVpZRktQRUNEaWtKS083RkF5NUZsdXgx?=
 =?utf-8?B?Q2ZmeVZqa3dPdnpoNk5tVW00dlB6UG94QVdMak81enpTYVUrYW5ZUmhOUS9q?=
 =?utf-8?B?WVZhUkdSVWM5eGdLM3VpNHRuRjhLMUJLaG5TVVhKUzMzRktjbkFkQjQvVnRD?=
 =?utf-8?B?ZnZINUV3ai80ZjhHZ1lWNVQvc1JHemZaQyt3eEdvWmJJMEVPU3NtZzZTQ2pH?=
 =?utf-8?B?TU5UejRwTlBEU2NveDc5ekdhWXdRSWV4VjdXcnJ1NEhHcm50N3MySzJDckIy?=
 =?utf-8?B?VENBYjBkTmFDYjJ2VWY2MmFDZTRzYXdLY3NaUll0MGRWdURmbnB6cENOVkJS?=
 =?utf-8?B?MURhYndFdC9iTi9CTmV4S1BYOEFySThjUENBTWE4ckFYVUxKKzdvTFdRNk1K?=
 =?utf-8?B?NDdiNG44bEwvMVUySnBubm9zMDRlbVRMUnMvcVNQSzROR252ZHgxc0hKS3Vl?=
 =?utf-8?B?NnE0MlpseXB1WjZzWHZ2d1JIa2dUWmJHTzJIcjllcjlXdzJWUTVIR1NvNDdm?=
 =?utf-8?B?WnlZV3NoUXlzQ0ZyTXZiOXVxdHFkQlM1N2Q0d3dMRlFHOHhlR0JHWnpOQzlQ?=
 =?utf-8?B?N29hU3RWcjBOMXVvWEJZakRtZmxOV2pqWldEbnFGdk5rRkNmM1ZIRGJrNXVn?=
 =?utf-8?B?YWtYSlJpc3pra09MTktRS3haTkRyT1hmcWNBdmMxTmVXWUxxSCtUMlVKQkd5?=
 =?utf-8?B?VmgzcFBqT3B4N2dmaW0xN2N2NGJiWk8wOEJnMTRDWEdtQTdqaTFSTDVhVEZy?=
 =?utf-8?B?M3Rza0MxK0krQ2NzSlk5Zis5N2pCQyt4RmhKUUtNN1g3dWFjQTljczVQZ3VH?=
 =?utf-8?B?eGo5RTZ1Y2ZJRko3ZkhFWmxoMXU2YVg5WlBYQU5ndC82b2VqaWJQcjRxaWtM?=
 =?utf-8?B?S1lKRTVPM1I4V3RYaUhmdGdVRXRFWHh6cW1HMDBwMUVscHdyYXJ5ZGZ0QmE1?=
 =?utf-8?Q?5x20=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:58:55.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c4fe86-67ff-4ad1-5aa0-08de36837485
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

Thank you for taking a look at the PoC.

On 12/8/2025 3:27 PM, Shrikanth Hegde wrote:
> Hi Prateek.
> 
> Thank you very much for going throguh the series.
> 
> On 12/8/25 10:17 AM, K Prateek Nayak wrote:
>> On 11/19/2025 6:14 PM, Shrikanth Hegde wrote:
>>> Detailed problem statement and some of the implementation choices were
>>> discussed earlier[1].
>>>
>>> [1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
>>>
>>> This is likely the version which would be used for LPC2025 discussion on
>>> this topic. Feel free to provide your suggestion and hoping for a solution
>>> that works for different architectures and it's use cases.
>>>
>>> All the existing alternatives such as cpu hotplug, creating isolated
>>> partitions etc break the user affinity. Since number of CPUs to use change
>>> depending on the steal time, it is not driven by User. Hence it would be
>>> wrong to break the affinity. This series allows if the task is pinned
>>> only paravirt CPUs, it will continue running there.
>>
>> If maintaining task affinity is the only problem that cpusets don't
>> offer, attached below is a very naive prototype that seems to work in
>> my case without hitting any obvious splats so far.
>>
>> Idea is to keep task affinity untouched, but remove the CPUs from
>> the sched domains.
>>
>> That way, all the balancing, and wakeups will steer away from these
>> CPUs automatically but once the CPUs are put back, the balancing will
>> automatically move tasks back.
>>
>> I tested this with a bunch of spinners and with partitions and both
>> seem to work as expected. For real world VM based testing, I pinned 2
>> 6C/12C VMs to a 8C/16T LLC with 1:1 pinning - 2 virtual cores from
>> either VMs pin to same set of physical cores.
>>
>> Running 8 groups of perf bench sched messaging on each VM at the same
>> time gives the following numbers for total runtime:
>>
>> All CPUs available in the VM:      88.775s & 91.002s  (2 cores overlap)
>> Only 4 cores available in the VM:  67.365s & 73.015s  (No cores overlap)
>>
>> Note: The unavailable mask didn't change in my runs. I've noticed a
>> bit of delay before the load balancer moves the tasks to the CPU
>> going from unavailable to available - your mileage may vary depending
> 
> Depends on the scale of systems. I have seen it unfolding is slower
> compared to folding on large systems.
> 
>> on the frequency of mask updates.
>>
> 
> What do you mean "The unavailable mask didn't change in my runs" ?
> If so, how did it take effect?

The unavailable mask was set with the last two cores so that there
is no overlap in the pCPU usage. The mask remained same throughout
the runtime of the benchmarks - no dynamism in modifying the masks
within the VM.

> 
>> Following is the diff on top of tip/master:
>>
>> (Very raw PoC; Only fair tasks are considered for now to push away)
>>
> 
> I skimmed through it. It is very close to the current approach.
> 
> Advantage:
> Happens immediately instead of waiting for tick.
> Current approach too can move all the tasks at one tick.
> the concern could be latency being high and races around the list.
> 
> Disadvantages:
> 
> Causes a sched domain rebuild. Which is known to be expensive on large systems.
> But since steal time changes are not very aggressive at this point, this overhead
> maybe ok.
> 
> Keeping the interface in cpuset maybe tricky. there could multiple cpusets, and different versions
> complications too. Specially you can have cpusets in nested fashion. And all of this is
> not user driven. i think cpuset is inherently user driven.

For that reason I only kept this mask for root cgroup. Putting any
CPU on it is as good as removing them from all partitions.

> 
> Impementation looks more complicated to me atleast at this point.
> 
> Current poc needs to enhanced to make arch specific triggers. That is doable.
> 
>> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
>> index 2ddb256187b5..7c1cfdd7ffea 100644
>> --- a/include/linux/cpuset.h
>> +++ b/include/linux/cpuset.h
>> @@ -174,6 +174,10 @@ static inline void set_mems_allowed(nodemask_t nodemask)
>>   }
>>     extern bool cpuset_node_allowed(struct cgroup *cgroup, int nid);
>> +
>> +void sched_fair_notify_unavaialable_cpus(struct cpumask *unavailable_mask);
>> +const struct cpumask *cpuset_unavailable_mask(void);
>> +bool cpuset_cpu_unavailable(int cpu);
>>   #else /* !CONFIG_CPUSETS */
>>     static inline bool cpusets_enabled(void) { return false; }
>> diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
>> index 337608f408ce..170aba16141e 100644
>> --- a/kernel/cgroup/cpuset-internal.h
>> +++ b/kernel/cgroup/cpuset-internal.h
>> @@ -59,6 +59,7 @@ typedef enum {
>>       FILE_EXCLUSIVE_CPULIST,
>>       FILE_EFFECTIVE_XCPULIST,
>>       FILE_ISOLATED_CPULIST,
>> +    FILE_UNAVAILABLE_CPULIST,
>>       FILE_CPU_EXCLUSIVE,
>>       FILE_MEM_EXCLUSIVE,
>>       FILE_MEM_HARDWALL,
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 4aaad07b0bd1..22d38f2299c4 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -87,6 +87,19 @@ static cpumask_var_t    isolated_cpus;
>>   static cpumask_var_t    boot_hk_cpus;
>>   static bool        have_boot_isolcpus;
>>   +/*
>> + * CPUs that may be unavailable to run tasks as a result of physical
>> + * constraints (vCPU being preempted, pCPU handling interrupt storm).
>> + *
>> + * Unlike isolated_cpus, the unavailable_cpus are simply excluded from
>> + * HK_TYPE_DOMAIN but leave the tasks affinity untouched. These CPUs
>> + * should be avoided unless the task has specifically asked to be run
>> + * only on these CPUs.
>> + */
>> +static cpumask_var_t    unavailable_cpus;
>> +static cpumask_var_t    available_tmp_mask;    /* For intermediate operations. */
>> +static bool         cpu_turned_unavailable;
>> +
> 
> This unavailable name is not probably right. When system boots, there is available_cpu
> and that is fixed and not expected to change. It can confuse users.

Ack! Just some name that I thought was appropriate. Too much
thought wasn't put into it ;)

> 
>>   /* List of remote partition root children */
>>   static struct list_head remote_children;
>>   @@ -844,6 +857,7 @@ static int generate_sched_domains(cpumask_var_t **domains,
>>           }
>>           cpumask_and(doms[0], top_cpuset.effective_cpus,
>>                   housekeeping_cpumask(HK_TYPE_DOMAIN));
>> +        cpumask_andnot(doms[0], doms[0], unavailable_cpus);
>>             goto done;
>>       }
>> @@ -960,11 +974,13 @@ static int generate_sched_domains(cpumask_var_t **domains,
>>                * The top cpuset may contain some boot time isolated
>>                * CPUs that need to be excluded from the sched domain.
>>                */
>> -            if (csa[i] == &top_cpuset)
>> +            if (csa[i] == &top_cpuset) {
>>                   cpumask_and(doms[i], csa[i]->effective_cpus,
>>                           housekeeping_cpumask(HK_TYPE_DOMAIN));
>> -            else
>> -                cpumask_copy(doms[i], csa[i]->effective_cpus);
>> +                cpumask_andnot(doms[i], doms[i], unavailable_cpus);
>> +             } else {
>> +                cpumask_andnot(doms[i], csa[i]->effective_cpus, unavailable_cpus);
>> +             }
>>               if (dattr)
>>                   dattr[i] = SD_ATTR_INIT;
>>           }
>> @@ -985,6 +1001,7 @@ static int generate_sched_domains(cpumask_var_t **domains,
>>                   }
>>                   cpumask_or(dp, dp, csa[j]->effective_cpus);
>>                   cpumask_and(dp, dp, housekeeping_cpumask(HK_TYPE_DOMAIN));
>> +                cpumask_andnot(dp, dp, unavailable_cpus);
>>                   if (dattr)
>>                       update_domain_attr_tree(dattr + nslot, csa[j]);
>>               }
>> @@ -1418,6 +1435,17 @@ bool cpuset_cpu_is_isolated(int cpu)
>>   }
>>   EXPORT_SYMBOL_GPL(cpuset_cpu_is_isolated);
>>   +/* Get the set of CPUs marked unavailable. */
>> +const struct cpumask *cpuset_unavailable_mask(void)
>> +{
>> +    return unavailable_cpus;
>> +}
>> +
>> +bool cpuset_cpu_unavailable(int cpu)
>> +{
>> +    return  cpumask_test_cpu(cpu, unavailable_cpus);
>> +}
>> +
>>   /**
>>    * rm_siblings_excl_cpus - Remove exclusive CPUs that are used by sibling cpusets
>>    * @parent: Parent cpuset containing all siblings
>> @@ -2612,6 +2640,53 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
>>       return 0;
>>   }
>>   +/**
>> + * update_exclusive_cpumask - update the exclusive_cpus mask of a cpuset
>> + * @cs: the cpuset to consider
>> + * @trialcs: trial cpuset
>> + * @buf: buffer of cpu numbers written to this cpuset
>> + *
>> + * The tasks' cpumask will be updated if cs is a valid partition root.
>> + */
>> +static int update_unavailable_cpumask(const char *buf)
>> +{
>> +    cpumask_var_t tmp;
>> +    int retval;
>> +
>> +    if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
>> +        return -ENOMEM;
>> +
>> +    retval = cpulist_parse(buf, tmp);
>> +    if (retval < 0)
>> +        goto out;
>> +
>> +    /* Nothing to do if the CPUs didn't change */
>> +    if (cpumask_equal(tmp, unavailable_cpus))
>> +        goto out;
>> +
>> +    /* Save the CPUs that went unavailable to push task out. */
>> +    if (cpumask_andnot(available_tmp_mask, tmp, unavailable_cpus))
>> +        cpu_turned_unavailable = true;
>> +
>> +    cpumask_copy(unavailable_cpus, tmp);
>> +    cpuset_force_rebuild();
> 
> I think this rebuilding sched domains could add quite overhead.

I agree! But I somewhat dislike putting a cpumask_and() in a
bunch of places where we deal with sched_domain when we can
simply adjust the sched_domain to account for it - it is
definitely not performant but IMO, it is somewhat cleaner.

But if CPUs are transitioning in and out of the paravirt mask
as such a high rate, wouldn't you just end up pushing the
tasks away only to soon pull them back?

What changes so suddenly in the hypervisor that a paravirt
CPU is now fully available after a sec or two?

On a sidenote, we do have vcpu_is_preempted() - isn't that
sufficient enough to steer tasks away if we start being a
bit more aggressive about it? Do we need a mask?

> 
>> +out:
>> +    free_cpumask_var(tmp);
>> +    return retval;
>> +}
>> +
>> +static void cpuset_notify_unavailable_cpus(void)
>> +{
>> +    /*
>> +     * Prevent being preempted by the stopper if the local CPU
>> +     * turned unavailable.
>> +     */
>> +    guard(preempt)();
>> +
>> +    sched_fair_notify_unavaialable_cpus(available_tmp_mask);
>> +    cpu_turned_unavailable = false;
>> +}
>> +
>>   /*
>>    * Migrate memory region from one set of nodes to another.  This is
>>    * performed asynchronously as it can be called from process migration path
>> @@ -3302,11 +3377,16 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>>                       char *buf, size_t nbytes, loff_t off)
>>   {
>>       struct cpuset *cs = css_cs(of_css(of));
>> +    int file_type = of_cft(of)->private;
>>       struct cpuset *trialcs;
>>       int retval = -ENODEV;
>>   -    /* root is read-only */
>> -    if (cs == &top_cpuset)
>> +    /* root is read-only; except for unavailable mask */
>> +    if (file_type != FILE_UNAVAILABLE_CPULIST && cs == &top_cpuset)
>> +        return -EACCES;
>> +
>> +    /* unavailable mask can be only set on root. */
>> +    if (file_type == FILE_UNAVAILABLE_CPULIST && cs != &top_cpuset)
>>           return -EACCES;
>>         buf = strstrip(buf);
>> @@ -3330,6 +3410,9 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>>       case FILE_MEMLIST:
>>           retval = update_nodemask(cs, trialcs, buf);
>>           break;
>> +    case FILE_UNAVAILABLE_CPULIST:
>> +        retval = update_unavailable_cpumask(buf);
>> +        break;
>>       default:
>>           retval = -EINVAL;
>>           break;
>> @@ -3338,6 +3421,8 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>>       free_cpuset(trialcs);
>>       if (force_sd_rebuild)
>>           rebuild_sched_domains_locked();
>> +    if (cpu_turned_unavailable)
>> +        cpuset_notify_unavailable_cpus();
>>   out_unlock:
>>       cpuset_full_unlock();
>>       if (of_cft(of)->private == FILE_MEMLIST)
>> @@ -3386,6 +3471,9 @@ int cpuset_common_seq_show(struct seq_file *sf, void *v)
>>       case FILE_ISOLATED_CPULIST:
>>           seq_printf(sf, "%*pbl\n", cpumask_pr_args(isolated_cpus));
>>           break;
>> +    case FILE_UNAVAILABLE_CPULIST:
>> +        seq_printf(sf, "%*pbl\n", cpumask_pr_args(unavailable_cpus));
>> +        break;
>>       default:
>>           ret = -EINVAL;
>>       }
>> @@ -3524,6 +3612,15 @@ static struct cftype dfl_files[] = {
>>           .flags = CFTYPE_ONLY_ON_ROOT,
>>       },
>>   +    {
>> +        .name = "cpus.unavailable",
>> +        .seq_show = cpuset_common_seq_show,
>> +        .write = cpuset_write_resmask,
>> +        .max_write_len = (100U + 6 * NR_CPUS),
>> +        .private = FILE_UNAVAILABLE_CPULIST,
>> +        .flags = CFTYPE_ONLY_ON_ROOT,
>> +    },
>> +
>>       { }    /* terminate */
>>   };
>>   @@ -3814,6 +3911,8 @@ int __init cpuset_init(void)
>>       BUG_ON(!alloc_cpumask_var(&top_cpuset.exclusive_cpus, GFP_KERNEL));
>>       BUG_ON(!zalloc_cpumask_var(&subpartitions_cpus, GFP_KERNEL));
>>       BUG_ON(!zalloc_cpumask_var(&isolated_cpus, GFP_KERNEL));
>> +    BUG_ON(!zalloc_cpumask_var(&unavailable_cpus, GFP_KERNEL));
>> +    BUG_ON(!zalloc_cpumask_var(&available_tmp_mask, GFP_KERNEL));
>>         cpumask_setall(top_cpuset.cpus_allowed);
>>       nodes_setall(top_cpuset.mems_allowed);
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index ee7dfbf01792..13d0d9587aca 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -2396,7 +2396,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>         /* Non kernel threads are not allowed during either online or offline. */
>>       if (!(p->flags & PF_KTHREAD))
>> -        return cpu_active(cpu);
>> +        return (cpu_active(cpu) && !cpuset_cpu_unavailable(cpu));
>>         /* KTHREAD_IS_PER_CPU is always allowed. */
>>       if (kthread_is_per_cpu(p))
>> @@ -3451,6 +3451,26 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>>               goto out;
>>           }
>>   +        /*
>> +         * Only user threads can be forced out of
>> +         * unavaialable CPUs.
>> +         */
>> +        if (p->flags & PF_KTHREAD)
>> +            goto rude;
>> +
>> +        /* Any unavailable CPUs that can run the task? */
>> +        for_each_cpu(dest_cpu, cpuset_unavailable_mask()) {
>> +            if (!task_allowed_on_cpu(p, dest_cpu))
>> +                continue;
>> +
>> +            /* Can we hoist this up to goto rude? */
>> +            if (is_migration_disabled(p))
>> +                continue;
>> +
>> +            if (cpu_active(dest_cpu))
>> +                goto out;
>> +        }
>> +rude:
>>           /* No more Mr. Nice Guy. */
>>           switch (state) {
>>           case cpuset:
>> @@ -3766,7 +3786,7 @@ bool call_function_single_prep_ipi(int cpu)
>>    * via sched_ttwu_wakeup() for activation so the wakee incurs the cost
>>    * of the wakeup instead of the waker.
>>    */
>> -static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
>> +void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
>>   {
>>       struct rq *rq = cpu_rq(cpu);
>>   @@ -5365,7 +5385,9 @@ void sched_exec(void)
>>       int dest_cpu;
>>         scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
>> -        dest_cpu = p->sched_class->select_task_rq(p, task_cpu(p), WF_EXEC);
>> +        int wake_flags = WF_EXEC;
>> +
>> +        dest_cpu = select_task_rq(p, task_cpu(p), &wake_flags);
> 
> Whats this logic?

WF_EXEC path would not care about the unavailable CPUs and won't run
the select_fallback_rq() path if the sched_class->select_task() is
called directly.

> 
>>           if (dest_cpu == smp_processor_id())
>>               return;
>>   diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index da46c3164537..e502cccdae64 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -12094,6 +12094,61 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>>       return ld_moved;
>>   }
>>   +static int unavailable_balance_cpu_stop(void *data)
>> +{
>> +    struct task_struct *p, *tmp;
>> +    struct rq *rq = data;
>> +    int this_cpu = cpu_of(rq);
>> +
>> +    guard(rq_lock_irq)(rq);
>> +
>> +    list_for_each_entry_safe(p, tmp, &rq->cfs_tasks, se.group_node) {
>> +        int target_cpu;
>> +
>> +        /*
>> +         * Bail out if a concurrent change to unavailable_mask turned
>> +         * this CPU available.
>> +         */
>> +        rq->unavailable_balance = cpumask_test_cpu(this_cpu, cpuset_unavailable_mask());
>> +        if (!rq->unavailable_balance)
>> +            break;
>> +
>> +        /* XXX: Does not deal with migration disabled tasks. */
>> +        target_cpu = cpumask_first_andnot(p->cpus_ptr, cpuset_unavailable_mask());
> 
> This can cause it to go first CPU always and then load balancer to move it later on.
> First should check the nodemask the current cpu is on to avoid NUMA costs.

Ack! I agree there is plenty of room for optimizations.

> 
>> +        if ((unsigned int)target_cpu < nr_cpumask_bits) {
>> +            deactivate_task(rq, p, 0);
>> +            set_task_cpu(p, target_cpu);
>> +
>> +            /*
>> +             * Switch to move_queued_task() later.
>> +             * For PoC send an IPI and be done with it.
>> +             */
>> +            __ttwu_queue_wakelist(p, target_cpu, 0);
>> +        }
>> +    }
>> +
>> +    rq->unavailable_balance = 0;
>> +
>> +    return 0;
>> +}
>> +
>> +void sched_fair_notify_unavaialable_cpus(struct cpumask *unavailable_mask)
>> +{
>> +    int cpu, this_cpu = smp_processor_id();
>> +
>> +    for_each_cpu_wrap(cpu, unavailable_mask, this_cpu + 1) {
>> +        struct rq *rq = cpu_rq(cpu);
>> +
>> +        /* Balance in progress. Tasks will be pushed out. */
>> +        if (rq->unavailable_balance)
>> +            return;
>> +
> 
> Need to run stopper, if there is active current task. otherise that work
> can be done here itself.

Ack! My thinking was to not take a rq_lock early and let stopper
run and then push all queued fair tasks out with rq_lock held.

> 
>> +        stop_one_cpu_nowait(cpu, unavailable_balance_cpu_stop,
>> +                    rq, &rq->unavailable_balance_work);
>> +        rq->unavailable_balance = 1;
>> +    }
>> +}
>> +

-- 
Thanks and Regards,
Prateek


