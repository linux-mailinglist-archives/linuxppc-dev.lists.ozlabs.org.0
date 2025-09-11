Return-Path: <linuxppc-dev+bounces-12019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C6B52827
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 07:24:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMmFW10N2z2yFJ;
	Thu, 11 Sep 2025 15:24:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757568255;
	cv=pass; b=kNPqlSRinIolV7QZy/Yjzo3XwXtDGRMwNn+QFlR/ej9ypdMBcVNqW8MLJCnrQ5+r3VxHZpAenjjp568fBcFhMsAiHh7T4Zjt1nYc51ZORqVnjZS+8GdYICTXPbIRLHJ8s2SfBJRYetJb6H/6Jae9N2UK/PE4uekZGhDqgcK1DP/SVISAYT9GcgHjE9ktRYKfChCorTOyZJTsXZNm+iV1HPvTjIgbGt1ML0igYPZUH4yH5T5tXGOjfdVs7LC32gaR/QAgvU2sp885xby6zdyLY6O1XhFSRLe9yPS/XTp+EaYfEvV8z/yawjYNoTK4mSAVI+PCkaxD32oJXBG3wWNuGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757568255; c=relaxed/relaxed;
	bh=qvEITJGt4muzZ5ZG/2EuHbpuDGgYN8xsxL+TkBrreRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jz/9VUvo82dez/o9HR5vcPE0XFc7KpoQ+KbABsMyXRq8Np6xR8BGCBTCmx6leb8M495l7/3EIst6XO/ZW24cqp3aeUVQwb3GfbxhMe4b8uIKNL+4v5JDVrU9nCv4zbi9c2LK3NM1e/Iadfgn4S5610TFU5F9DwsrYSzCQ58Ml3Et7P5IaLdWD+EfqJRm/w/Ir51V5PsMHo3YH36EjpUJXnT5zmWRy7Jjq+i6PPcQBkOWYu/rGG/7upBs1uWiuKJm0aHWdsApQidH+jm+DMBxJykjqfK2hVuVhDgONcS2dNsEQ1l+S0pG8p0ezSf/RM4cOt/VkKjAFlbJuLUBmn8vTg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZeqzCKza; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::61f; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZeqzCKza;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::61f; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMmFV24fwz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 15:24:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtFr9RCIvp+LrUm2TRsU/WbQPkcRZ/bI77eqPsADbRi/J0p8w45Dwu8FRq77FJC/sdxElOG6JjC+UTyJa1VbbdyWRMFi0nItZUSRa7ihdKEj7hYFrSuB38uP1W2T3CaUwGkkYD2IGkA4BE3NsemZERYgu/Lc9RC2XXcy8Oxqjm7KRMLa9wTZPGivVatxQjNYKMdT7RKCMlYUWLZOsUw4Jjv/wmE3vC56A7SykTJ4GvIRSNNnBLzVGsgNgpAQepDsQqgWa4j8qmq61e0pEDS2Obd91AnOYagSEqgpn+n4dPphRzuFrwdvyS0hQi9VKcpiMP6guK6SxcyphDNl8awD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvEITJGt4muzZ5ZG/2EuHbpuDGgYN8xsxL+TkBrreRY=;
 b=GD1QOiQ4zSZsR6xdsLR2YRp0/AVbvLQHPEWI7K/n2e//RGbhs/PFnZSXKWd9HyzD+UcPwFW9xRXFk2kdLD8jAuAmMWHDqcnMqz6tR9IG9plfumnHjVzfRicho9tx13mVFv4JnHejiZ4szfs3luIdIiOK42txykLvY2KQqpvq7YVttt/9OKmFxqwD78OElUGe/TLoySGq9vG2qvg8GsN66bA8EcXM+96EyevjYn06wLysxbSEysUtJxGN58lAxMddHwute6P9EdBFpKJSaY5M749ajt1gpZFtJQlldZ4sX5D/IwfKU8udUQhnbH5Z3KrjDXuo7b1VOnudhNplyOCyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvEITJGt4muzZ5ZG/2EuHbpuDGgYN8xsxL+TkBrreRY=;
 b=ZeqzCKzakELZcyb4Smaj7htPjnICiPIT+le34WmCwFIhZrUQuX1PFFO2nKfGF6scxv3MrY3KgdZSlAT6NBPzeDctZW3zrCfwSHLLuEqkvAaDkHsIkVU0pafNoESRMQsvtIKGx5Q+r2e3rWsZIDguwQlnz4mnIetEa0mFvjSD1uk=
Received: from CH2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:5a::36)
 by SA5PPF37951B1C9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 05:23:54 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b6) by CH2PR08CA0026.outlook.office365.com
 (2603:10b6:610:5a::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Thu,
 11 Sep 2025 05:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 05:23:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 10 Sep
 2025 22:23:52 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Sep
 2025 00:23:52 -0500
Received: from [172.31.178.191] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 22:23:46 -0700
Message-ID: <d0aa1a34-2097-405c-b431-907fd973ad96@amd.com>
Date: Thu, 11 Sep 2025 10:53:45 +0530
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
Subject: Re: [RFC PATCH v3 05/10] sched/fair: Don't consider paravirt CPUs for
 wakeup and load balance
To: Shrikanth Hegde <sshegde@linux.ibm.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <gregkh@linuxfoundation.org>
CC: <vschneid@redhat.com>, <iii@linux.ibm.com>, <huschle@linux.ibm.com>,
	<rostedt@goodmis.org>, <dietmar.eggemann@arm.com>, <vineeth@bitbyteword.org>,
	<jgross@suse.com>, <pbonzini@redhat.com>, <seanjc@google.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-6-sshegde@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250910174210.1969750-6-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SA5PPF37951B1C9:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abfbc73-fd64-4e6b-507b-08ddf0f36635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WitqQjFCRnZGeXdsSDg3eGJKRW9Sb2E1MWRBWml0QzM0VmUrWTNxYmJJUm0x?=
 =?utf-8?B?L2JSMFgrN1ZQcGhlZjVJL01PQXdwbm4yTWxQM3pZZEVZK0V2aXk3bXVobGJE?=
 =?utf-8?B?SldaVXN5dE1QSWNSTzhXbWtLRERSZXpGRmUwOXdLWmRDRGhNcDRMY1hybmdh?=
 =?utf-8?B?ZCtyRVFpRTlLeGRlTm1FQlZUMHo0MzRZUnJKMEZteU16a1NOMk4rbGQzVjdU?=
 =?utf-8?B?UlhlanpDeEg2dkpnOU5od0dRU3ZRZ29OWnU1ZnRXUzFsSDE0U0crV010VlRm?=
 =?utf-8?B?MUdXeTBoTHVXUXBHNTNkRWljKzd6RmlqY3pOTTBZR3lkSWU1dnJ3SWhya0NJ?=
 =?utf-8?B?WlNHcSt2a0xQZ2dFVzRIcmN2Mk1nVGlXSUI2cEkwTzFMaTZEMEs3OGFXS3hv?=
 =?utf-8?B?ZHhsZmlIRUVEeTloaXpOSmhhcGEvbmJMTjl3c0hCdDZYSHAwVlJ2WEJKaTh3?=
 =?utf-8?B?NVlxeStOU2tGamYzYjlwS3NoMGM5VG8zZXVuRGkxOWJqS2QvamkzTkF2YWJG?=
 =?utf-8?B?YWNpNVArWmV1OCtsMFNUZ0lqOWdMN0M5SG1UOW1rNjFwbUVDc1lYVGl5d3lj?=
 =?utf-8?B?Tm5Xa2IrMmR1aS9sT0kvRy96WjJSSlNUYUdzUU5TMkhkWDF1eVlxYTBwa0NB?=
 =?utf-8?B?ZXd1UDZqWkhmRThXVndsbDdMQ3ZMOFYyK2Rad1prR0M1OWpOT2p4T0RGbFhy?=
 =?utf-8?B?eHgvb3ludVd3RkZsL1FEeCtvOXVaZ1VLNUJWdVFOeFNyTGJrS1djcFdBbVhs?=
 =?utf-8?B?K21PM21pRDhNUDN0aFdHemJJb0hlaGZFRk1ESEdvMFZnVE42aThyV2M3dDVE?=
 =?utf-8?B?R0pzdzlVQm5CUmQ4eStZSG9MZ1F5YnNNRWF3VW9hZzJuV0pQMXVsZzlwb3J2?=
 =?utf-8?B?YlliSkNvR2dqWTZ3cGlFa2dzZ3B0bG1uSDc1cGVMMUs2em02TVg1S1VDMWdI?=
 =?utf-8?B?Tm56ZlM5dndoNlhSVlNnWmJFYy80NmdDbVFmWEEwQkV6L3dlQ0U4bWdhVFRo?=
 =?utf-8?B?a2wxQjc2QjB2NG1XWjNNeG90WFZVZ3c4NDZBaUt1bnhBbGkyV0lvN1l5Q0I1?=
 =?utf-8?B?SkpSQ3hXY2ZXMzlLMkNwWjIvWHJrUFNEUlpHc1NKc1pPMDBPSWJIWThaYnFj?=
 =?utf-8?B?Q2RJNE9hQzVrd3huL1dFZkNYRjBuRE0rYnVnL3dhR1IyVUJJcTBHbVErb1NH?=
 =?utf-8?B?dWNKVzBNNHBuM1JjVzR5eEIzWXdQY2FvMUlIelo0aFRwUXhCMDdleUxlQXFv?=
 =?utf-8?B?bmU3U3MwdHFIMVgrOHNrM1NZNE1CRnltbkp6S0paYTVOS01GZDFBSEkyNHFS?=
 =?utf-8?B?MXlZeDNPRzFzQ2lZY1ZiM2JvSld1TFA1Zzc4ZS9xdVFMVCs0dTN3TkRqdWVu?=
 =?utf-8?B?NlNteVZRRmRQRWNlQldwdVlrYlk2ZzBBd25TUEY3L1V6WEhNTzRYdlpId2Jv?=
 =?utf-8?B?TXVaTDI3aHRTSzFxcHJrNjV2NTFXVTlZZVB3dGZhWHpRTFpMbUZUTkdWam91?=
 =?utf-8?B?Tkd0MlYyNzhGbGVXb3J1aXlkckwzVHR3dTZOK2RucmdHT2JPZ2ZZSy9KZGIr?=
 =?utf-8?B?NXUwcjdkcUU1allwT2xSU2FpMnQrQkxKQnROTkdsT1NyaTQrZUtjZUc1bjE0?=
 =?utf-8?B?VUl4bmRrb1oveHJXSC95WWEwbkJMbEdiRlJDeWNpYnpIUUx1WTMyMUhmdGZX?=
 =?utf-8?B?eVB1OXdDZDJKc0kwaTJkZzBtSStBUENzM2JaekduWWFrbUM0elBUMElEbzVD?=
 =?utf-8?B?VHI1UU1La0ZSSVNuQTdrcExVUTFlMzRyemVRRzQ4eUV4ZWpjZUIxNzdtSkFy?=
 =?utf-8?B?NDdIWDVTWDl6TzMwY3JERThkZlc2cEtDVFF1UjlzSlZpdm9mdGR6ZzNmTDBN?=
 =?utf-8?B?cTNwZ2g1WDN3WFNDQVJObG1wOFJFUitGSlRXV3ZmWTBFU3h1OUg2YlVGR2xE?=
 =?utf-8?B?UDdLQlRGQ1p4S2c4VFYzaWxHSDQyUlFtUlh3VlVpVEtDQ3crd0NFZGRkRXZV?=
 =?utf-8?B?S0h0L0hVSU5SL2xUYjA1dFR6ZHdlTDNHVUpieVE0cFMxZGl2Z1U5aTZXa3Jm?=
 =?utf-8?B?RjYvbmRXSVQwaE0zekZ5NFlObVg5dkRWQVR2QT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 05:23:53.8412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abfbc73-fd64-4e6b-507b-08ddf0f36635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF37951B1C9
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 9/10/2025 11:12 PM, Shrikanth Hegde wrote:
> @@ -8563,7 +8563,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		if (!is_rd_overutilized(this_rq()->rd)) {
>  			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
>  			if (new_cpu >= 0)
> -				return new_cpu;
> +				goto check_new_cpu;

Should this fallback to the overutilized path if the most energy
efficient CPU is found to be paravirtualized or should
find_energy_efficient_cpu() be made aware of it?

>  			new_cpu = prev_cpu;
>  		}
>  
> @@ -8605,7 +8605,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	}
>  	rcu_read_unlock();
>  
> -	return new_cpu;
> +	/* If newly found or prev_cpu is a paravirt cpu, use current cpu */
> +check_new_cpu:
> +	if (is_cpu_paravirt(new_cpu))
> +		return cpu;
> +	else

nit. redundant else.

> +		return new_cpu;
>  }
>  
>  /*
> @@ -11734,6 +11739,12 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  
>  	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
>  
> +#ifdef CONFIG_PARAVIRT
> +	/* Don't spread load to paravirt CPUs */
> +	if (static_branch_unlikely(&cpu_paravirt_push_tasks))
> +		cpumask_andnot(cpus, cpus, cpu_paravirt_mask);
> +#endif

Can something similar be also be done in select_idle_sibling() and
sched_balance_find_dst_cpu() for wakeup path?

> +
>  	schedstat_inc(sd->lb_count[idle]);
>  
>  redo:
-- 
Thanks and Regards,
Prateek


