Return-Path: <linuxppc-dev+bounces-12067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905BCB545D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 10:48:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNSl362DFz3ckj;
	Fri, 12 Sep 2025 18:48:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::630" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757666927;
	cv=pass; b=iHx3gSiVULOoz1puMuTlTBllAmUTCUM3BVaTC8ZiQwGQnZusM2/fONsRD4ZBLt+z8wA00RPNZfjFcog4mg8Vp6mfnLbBmq0dQnUymVxvklGmqeUjw+EuMeZcmTWYUKIOQyKr70DhT8IzVcVv9mQBDujzmwRv0nW+DIoAW4dUYYZgUWBVhTVtMhjdoFxBBWTOXRn7N+eDBAVYXjDV1YG/XnR8eNrrT3OnZ2cFkoyTEs1TnOif6UtyCO3fscMEqzCJucvDD7sTy28q7TQAHmoihLl5Lm5wLnHdTbtTHLFE6flm9ndBSt25nWDAJmBRz0IFGPZ5lE4DzzEUHKBvJY7wVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757666927; c=relaxed/relaxed;
	bh=ElnuLfm1kMRgcvfzQa2+eOXQ9hb3bQEJkwLXeAEv++I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LubWR6o+SgA5dDlLqh+GUr+eOaSbm+ElESFg7Z9E1HZzbX7G1C9qfkMU9EZsGgIQF1ot9WTFILXGKlbkkDT1hfW1vwjBKIWYji9kPNKeyEc5VoCllJRfIMe61aZm4NDj+/bSLGVnD/Em2MWOcYnwadf2uBh3JXGh/6J+kH8GAFc5cr5cXoa0KGZ94F0/MgFW6oPxHYmNiakkCK3OyjrCQa1fuwa6z6gvhMarHTTALNRXH4hTPnc1E4x7wczxjERI6cL8SiRw2t4ujKzdmYmNj+STG+ZURY9wl93REcXyNIj6j73qlIe9bF8Sdi/B0ukGZySjiocPD1uANlJPtLeWVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TfFHUyvi; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::630; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TfFHUyvi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2413::630; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20630.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNSl162D7z3ckL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:48:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7raq0DpjyZtHXIo++VwyRayBJXww20wDJ7Th8tSyjvRRS/wB87qZHfR7WFYwtj6ESlcB6UD1LNXk8w4YX3w+/QlPG4RW8r+jJIVj6MwfHCJcLaVIwhc7hPs/BsLSQDplBG4ra/iVnb/4jna92Pal1/obbqdLr9Qq63lOqbB4zgZChrvnl6G2O0L/lRgIfYAYO98YOzd36m0vsybJwTmZwK2vvNbKtAF3oYtQiQTNIkJEZ4IiY2E8Lydnpr91/uKSNK15drimzQvY0ZU1co8cew8PgJ8SGI01oz6mXQJiu2YtKZ4ZHn7ORJ86CRTAdaSnBy9yTnW8nf2tH4i5HxlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElnuLfm1kMRgcvfzQa2+eOXQ9hb3bQEJkwLXeAEv++I=;
 b=I9mm2YFGYjnQrJ5AW1sS7kWqFBgx5btMJOGR6x7N42oTszj46rWW3Ximo7CTp1HunjOo0Wax0HWP99DOi8H+cyhC8dZwY5KyD5cnLh9ZItTAB2se/356fgtkU4878zDR/CTUub7ixFqMvubDOyDx9e7PkQE5HA/FZ46Qvd1kVGZpxQVevTDnUyFReULJhutYh207TX3Nj3KKeNgTAR7OWCHRThwuXUC+gF2DikAbgnWADP7Hd408eUBIFNiJTcAfuO1/DaIRoqywyiax0BD+DOZ668YdQPErDmbDMULWAWnHTlt2E6Uk5jXZXM/RxFqGqf/+FENp9MHDpCY2OBRt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElnuLfm1kMRgcvfzQa2+eOXQ9hb3bQEJkwLXeAEv++I=;
 b=TfFHUyviMzRjz3W+uqxoF9fdHIpj2RhEGXxRLv01eL+/SniI2Z3GyBiE9BInnEX7y4AcAgc4nURxQWP5bJf+no6N++K6P3br/xORoNDaW/ElwHjJ6Cd98cH/1pgmS9++BDH0c1tkpHcvbYlkIpsTa45JU1o/Kr4e9WiPUAIVmng=
Received: from BYAPR11CA0058.namprd11.prod.outlook.com (2603:10b6:a03:80::35)
 by DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 08:48:23 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::61) by BYAPR11CA0058.outlook.office365.com
 (2603:10b6:a03:80::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 08:48:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 08:48:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Sep
 2025 01:48:22 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Sep
 2025 01:48:22 -0700
Received: from [10.136.41.4] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Sep 2025 01:48:16 -0700
Message-ID: <2e97c804-c67a-4c92-94c9-d47a6648439c@amd.com>
Date: Fri, 12 Sep 2025 14:18:15 +0530
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
Subject: Re: [RFC PATCH v3 07/10] sched/core: Push current task from paravirt
 CPU
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <vschneid@redhat.com>, <iii@linux.ibm.com>, <huschle@linux.ibm.com>,
	<rostedt@goodmis.org>, <dietmar.eggemann@arm.com>, <vineeth@bitbyteword.org>,
	<jgross@suse.com>, <pbonzini@redhat.com>, <seanjc@google.com>,
	<mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <gregkh@linuxfoundation.org>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-8-sshegde@linux.ibm.com>
 <7227822a-0b4a-47cc-af7f-190f6d3b3e07@amd.com>
 <1617b0fb-273a-4d86-8247-c67968c07b3b@linux.ibm.com>
 <5493a681-4438-4854-9cf4-c1e71ad2dbed@amd.com>
 <36042e33-772d-4c4e-ba6d-8461c8f6e29b@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <36042e33-772d-4c4e-ba6d-8461c8f6e29b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DM4PR12MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3e16bc-1d52-4553-caf5-08ddf1d92191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU5HMC9CKzJhQzNHVUFoT2ZmQzdnaVBqTFh2ZnNVU1daWVhnbTMyMGxQNDV0?=
 =?utf-8?B?UjBmSEs4STBYbTZOY1EzdUk0dVVtZDl3T00vaU5vbng2WkdVK0lsc3FRM3NO?=
 =?utf-8?B?Nkx3T2JYaW54SDZQQUpWdkZZRzI4bHJZR1luTURIREtFaFV6aUxBWTY5bHRo?=
 =?utf-8?B?aGgzWW0yN0EwMjd3ZFhBbnBlTGl2bnlQekJQTmxiWkUzU0pwbEY0QUJ0aHdG?=
 =?utf-8?B?c0hIb3luMGVvYXd4bWppVWlldStiRmU4OURZR1BqWFdOUnYxN3paNUE4M1Zl?=
 =?utf-8?B?SzBqSm5NV1lDclFwSlpVd2xqd3hZbTY5TGZySGFML2ZRZkRDYlZDQ2NZVkFI?=
 =?utf-8?B?TWc3ZnFVTHFIVndnYlNOV2w5Qnl6MDlvdkRLNzZIYlFXNWV6SERRc1lqaTcx?=
 =?utf-8?B?LzF2OVpodUlrakM1ZWJXL1JpakZMQVNRMkhKY2ZYUDVzZjZQMXNHNW5HeG5z?=
 =?utf-8?B?eis0c0VDcmswYVVUb2VSSUlZUWMyNG5iMFlXQnJYUlFMdUN3UTVVczF2UVor?=
 =?utf-8?B?L2lna3M5dGlUMWcrSnl5eVNWUE8xbjdxMmtaeFk1MGd0ZFhjZ1RNYU96R0dR?=
 =?utf-8?B?bDA4ZGZaU3loQnhtRjF0UXBIVk5jQm1OUTdPRXRkeTY4b2tJY3d0dW8zRndO?=
 =?utf-8?B?alMzRk9icUNkclUyWVc3MVNaL2hMSWNJSm8vOGJ6MTBIWFFzUUN2U0YxVHBx?=
 =?utf-8?B?VkdXaDFqNU9HMUEzUVErbEZ4ZXR5VHFHQ0VrN1h5b1Blb0NtY0pIOTlCZ2xp?=
 =?utf-8?B?UlFGeTM0SWV0N2xleG5XTmJkbXdSVndZN0VqQVFxUTlBZWpJWGNIRkNFVzFm?=
 =?utf-8?B?ck8xekhtYkxhTVhQU3BxSXdTekl3ckRpMDJQSWxhdkttRXV4cjJrVGgwaEJE?=
 =?utf-8?B?ZlJFclNacU9Yci9uTTJwRW9sZ0k0Y3pEL013dU5wUmFqZE5BWW1CRW5kRjFi?=
 =?utf-8?B?c3FNZ0ExTTY3cU1iYUtzdVhGbGVnMDBibWJDbFpxN0Nka2NDRGc2QkY3UGxV?=
 =?utf-8?B?RWM1ZVpwQ3Y3Umtsc1pOQ21IMzN0aDVVQ1ZhNTExTHB1c2FkTTdVMUN5QmVP?=
 =?utf-8?B?bmxJVzVGTFdpNGlHQWN0T2JhS2xrNGVOR1NBNVFFWXc2RHNnU2ZQRVp6OVJy?=
 =?utf-8?B?NWFBQ1BPZ0lPaFNPZDRzSmN5TXcxYzliQXd2UnFyUHlYUzMyaGdReWtTV1lq?=
 =?utf-8?B?bU50aXh3NkRIeWVxVG1MWENBS0J3WmVqaHBHQ3BoRmRoWFQxN21Kc2JFTzF0?=
 =?utf-8?B?Rlo5cE5LSFZXdzZldDhSSkRTeHFGYzF3dUlUMGRrZkcrdXIxbXl4ZVQySUVC?=
 =?utf-8?B?ekw0YU1ycitXamJxMloySVpBUDFKZmJQak5QSDNwV1Zjd3VLeWJaNlA3MU01?=
 =?utf-8?B?Wkh5UTBmV0ExSHV6a0xEQzhycC9jdEdFNFEvY0NUa3pWN2dITmNuY0dITTRv?=
 =?utf-8?B?MVRyVHEvNHR1ZmI4Y0ZWNXcyaGdLa0FpcHUvSkVsdmZ3Z0F1d2FqeGVqcFJ0?=
 =?utf-8?B?c0ZnMEpjU05tcWMzelR6cXE4NkplZTh2ZXdOeEI2MXppYnNSZk1iUDVHTlBG?=
 =?utf-8?B?eVV3QVdJL2UrS3R4OG1obUhyVWgrbjlOVkk2K2k5VHQ0MnhjZXFuQWE1MitX?=
 =?utf-8?B?OEtWSTVUdmcyZE1MbXhWQ0IrNnpMb2RIZ2lWU2NQN1dwdU1DaS8wZDlLYkxq?=
 =?utf-8?B?cC93Yk91YTdRTUV6Tktib2hJdmN2bS9kaktTbldzZnNJczVPSzczUkh0RFRt?=
 =?utf-8?B?NHd5aE94MlZ2K0EvVVRjU3NLZWtLMGk1cnAreWhXTXdBWnFRd0tNZmtiZUx3?=
 =?utf-8?B?aE41dFA3STZwVUN3ZUZ6L1VMN1VEbVdKZVQwMlUydXF3aTFOajFOaVQ0OHkv?=
 =?utf-8?B?eSs0ZlIxK2V6UzMyV0lZMDRyUkxyRFd2V1JtK1JOaTJJeW80ZEdqZVZGWnNK?=
 =?utf-8?B?dmZSZkd1bXR1MjJac3ZhUUs1NmthclRYMGNMWmNtVDM3NGlIQURaVUREbG5w?=
 =?utf-8?B?SmMrS3cxakx0MkpJUWRUZEpONjVLSnhDWWs5S3Y5QThMUTBKNHJ3UlRvK1JB?=
 =?utf-8?B?aWNrTVNUUmg5MEZmLzVJckVaNjdRajZwb2ZuUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 08:48:22.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3e16bc-1d52-4553-caf5-08ddf1d92191
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 9/12/2025 10:52 AM, Shrikanth Hegde wrote:
> 
> 
> On 9/11/25 10:36 PM, K Prateek Nayak wrote:
>> Hello Shrikanth,
>>
>> On 9/11/2025 10:22 PM, Shrikanth Hegde wrote:
>>>>> +    if (is_cpu_paravirt(cpu))
>>>>> +        push_current_from_paravirt_cpu(rq);
>>>>
>>>> Does this mean paravirt CPU is capable of handling an interrupt but may
>>>> not be continuously available to run a task?
>>>
>>> When i run hackbench which involves fair bit of IRQ stuff, it moves out.
>>>
>>> For example,
>>>
>>> echo 600-710 > /sys/devices/system/cpu/paravirt
>>>
>>> 11:31:54 AM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
>>> 11:31:57 AM  598    2.04    0.00   77.55    0.00   18.37    0.00    1.02    0.00    0.00    1.02
>>> 11:31:57 AM  599    1.01    0.00   79.80    0.00   17.17    0.00    1.01    0.00    0.00    1.01
>>> 11:31:57 AM  600    0.00    0.00    0.00    0.00    0.00    0.00    0.99    0.00    0.00   99.01
>>> 11:31:57 AM  601    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
>>> 11:31:57 AM  602    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
>>>
>>>
>>> There could some workloads which doesn't move irq's out, for which needs irqbalance change.
>>> Looking into it.
>>>
>>>   Or is the VMM expected to set
>>>> the CPU on the paravirt mask and give the vCPU sufficient time to move the
>>>> task before yanking it away from the pCPU?
>>>>
>>>
>>> If the vCPU is running something, it is going to run at some point on pCPU.
>>> hypervisor will give the cycles to this vCPU by preempting some other vCPU.
>>>
>>> It is that using this infra, there is should be nothing on that paravirt vCPU.
>>> That way collectively VMM gets only limited request for pCPU which it can satify
>>> without vCPU preemption.
>>
>> Ack! Just wanted to understand the usage.
>>
>> P.S. I remember discussions during last LPC where we could communicate
>> this unavailability via CPU capacity. Was that problematic for some
>> reason? Sorry if I didn't follow this discussion earlier.
>>
> 
> Thanks for that questions. Gives a opportunity to retrospect.
> 
> Yes. That's where we started. but that has a lot of implementation challenges.
> Still an option though.
> 
> History upto current state:
> 
> 1. At LPC24 presented the problem statement, and why existing approaches such as hotplug,
>    cpuset cgroup or taskset are not viable solution. Hotplug would have come handy if the cost was low.
>    The overhead of sched domain rebuild and serial nature of hotplug makes it not viable option.
>    One of the possible approach was CPU Capacity.

Ack. Is creating an isolated partition on the fly too expensive too?
I don't think creation of that partition is serialized and it should
achieve a similar result with a single sched-domain rebuild and I'm
hoping VMM doesn't change the paravirt mask at an alarming rate.

P.S. Some stupid benchmarking on a 256CPU machine:

    mkdir /sys/fs/cgroup/isol/
    echo isolated >  /sys/fs/cgroup/isol/cpuset.cpus.partition

    time for i in {1..1000}; do \
    echo "8-15" > /sys/fs/cgroup/isol/cpuset.cpus.exclusive; \
    echo "16-23" > /sys/fs/cgroup/isol/cpuset.cpus.exclusive; \
    done

    real    2m50.016s
    user    0m0.198s
    sys     1m47.708s

So that is about (170sec / 2000) ~ 85ms per cpuset operation.
Definitely more expensive than setting the paravirt but compare that to:

    for i in {8..15}; do echo 0 > /sys/devices/system/cpu/cpu$i/online; done; \
    for i in {8..15}; do echo 1 > /sys/devices/system/cpu/cpu$i/online; done; \
    for i in {16..23}; do echo 0 > /sys/devices/system/cpu/cpu$i/online; done; \
    for i in {16..23}; do echo 1 > /sys/devices/system/cpu/cpu$i/online; done;'

    real    0m5.046s
    user    0m0.014s
    sys     0m0.110s

Definitely less expensive than a full hotplug.

> 
> 1. Issues with CPU Capacity approach:
>    a. Need to make group_misfit_task as the highest priority. That alone will break big.LITTLE
>       since it relies on group misfit and group_overload should have higher priority there.
>    b. At high concurrency tasks still moved those CPUs with CAPACITY=1.
>    c. A lot of scheduler stats would need to be aware of change in CAPACITY specially load balance/wakeup.

Ack. Thinking out loud: Can capacity go to 0 via H/W pressure interface?
Maybe we can toggle the "sched_asym_cpucapacity" static branch without
actually having SD_ASYM_CAPACITY in these special case to enable
asym_fits_cpu() steer away from these 0 capacity CPUs.

>    d. in update_group_misfit - need to set the misfit load based on capacity. the current code sets to 0,
>       because of task_fits_cpu stuff
>    e. More challenges in RT.
> 
> That's when Tobias had introduced a new group type called group_parked.
> https://lore.kernel.org/all/20241204112149.25872-2-huschle@linux.ibm.com/
>   It has relatively cleaner implementation compared to CPU CAPACITY.
> 
> It had a few disadvantages too:
> 1. It use to take around 8-10 seconds for tasks to move out of those CPUs. That was the main
>    concern.
> 2. Needs a few stats based changes in update_sg_lb_stats. might be tricky in all scenarios.
> 
> That's when we were exploring how the tasks move out when the cpu goes offline. It happens quite fast too.
> So tried a similar mechanism and this is where we are right now.

I agree push is great from that perspective.

> 
>> [..snip..]
>>>>> +    local_irq_save(flags);
>>>>> +    preempt_disable();
>>>>
>>>> Disabling IRQs implies preemption is disabled.
>>>>
>>>
>>> Most of the places stop_one_cpu_nowait called with preemption & irq disabled.
>>> stopper runs at the next possible opportunity.
>>
>> But is there any reason to do both local_irq_save() and
>> preempt_disable()? include/linux/preempt.h defines preemptible() as:
>>
>>      #define preemptible()   (preempt_count() == 0 && !irqs_disabled())
>>
>> so disabling IRQs should be sufficient right or am I missing something?
>>
> 
> f0498d2a54e79 (Peter Zijlstra) "sched: Fix stop_one_cpu_nowait() vs hotplug"
> could be the answer you are looking for.

I think in all the cases covered by that commit, "task_rq_unlock(...)" would
have enabled interrupts which required that specified pattern but here we
have preempt_disable() within a local_irq_save() section which might not be
necessary.

> 
>>>
>>> stop_one_cpu_nowait
>>>   ->queues the task into stopper list
>>>      -> wake_up_process(stopper)
>>>         -> set need_resched
>>>           -> stopper runs as early as possible.
>>>          
> 

-- 
Thanks and Regards,
Prateek


