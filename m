Return-Path: <linuxppc-dev+bounces-12039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CFAB539B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 18:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN3bJ3KL4z2xS9;
	Fri, 12 Sep 2025 02:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757609740;
	cv=pass; b=V7cYDKlOLGRM2ilvBpRyIvzCjM0Jc4WDOn2RKQlVzPCySmbaMBJ+d4HU2dXpo4qmGEBrGbUitkW6m2wrgFaWDkUZb4eDds2ALJ5DAxuBw+Vv+RL8hfTEin82GFE43LPDwN9Mhw3LjXxgDwOGcY+429uZHFtklHp0UzYd8HlL2mNsZtkok59fBxJOyZhocX8XHl9Z6jgnmMkjeUdKahnpsUB/Zar4zJUFsMXaMes+WPmiEUlpDB98RnMyE2PlJ5pMHfNTMrdKCcHyCVImyaVbWap1xx63sgd8Nt+5TuI757ShMl0WQjDjUqygrVpU1E2UhBEQd5byKEoknwLz9UOyyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757609740; c=relaxed/relaxed;
	bh=cHJIQDRXRxe/A5BO6Kyb/HdGn2RhuqHSl+ZW3QMssGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O/N8hugyRxXScSj7gRdc3BqAnddhxJimlx93nDSMuobtzPoDHT4FFyO3OrGRMsHka33mwiMexorj/lPJotdnMP9cNKHJAu2sUUkT0EcQfTTbhDjsJyntq4k/JmpJw19xdYEyx5VLuKG81gcVraKApAkFrLAHN/kGapVlTuYFeMZU/sVo2OBXk4xw5B5YYr0tuBFBSbOQiTkdNBVxOEAgf1+Rxejzc8RTpNv6M00bxoQ13PUqQYMZa/FFN/giH06i5N2Ie8xY3yVCvH2QB7MGhmsmocCPbOK/VQqSXS8noZcTCpmm8L4A3gCObY2ZoLNPiS2sZUs9PwHh9PqNO8KQpA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZhkXURv7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::624; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZhkXURv7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::624; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN3bH0QCtz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 02:55:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfpHBizKml4iW3JQJ0YcKx/nKtKSKRze5hND2qpJkdFecP40Kcp6yAxHRXj702lhnFmnDI8JfOhbQ7jPjrWa7LmGPf7uen8po7Qeu7g1+95OvtFwJ28LtQBezoMxVP/pTOZdjowGCko5NBtmtdS3tQFdh9Ex2Yix5I5M1GypfoqmZNqc/5v2PNsA/cbVl4CuuNhTrN25DK4mCXSBcsfTVbFZuQuhrigBR08L/R0xtsbEBUUcdV5b175EzWXAMoh2e/D+4g7EhyGU3McTJZKXfvsunninYmPrH3pEG1MkIAN3pduq8jeqUBFEMaPmSP6NtA9ObqZrYtGcneFUb6BR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHJIQDRXRxe/A5BO6Kyb/HdGn2RhuqHSl+ZW3QMssGE=;
 b=AtseyD99hw1e0beKj4qG9qnWk8+juuqRiGcAwz388stxLkunFhTbjgFxbg/+BdES0LjnSDmAzbvsbX9hjFp9PKgzJtI+Tdh24ZwiG0zE52iz2gNDW5ARuiMPi7SM0J1weGlaFHjx98rWmNAa0tup98eF5I12x3NUZRGX3Q9PSy6AIuUnDTK7Fw5W7seal9bb1EQsW/39wXFGmSfWXUqn25uyGOQOyaOw5DuaOZLJejNXE+1u7RQNnM7seKDbQN6Mu4y/8aOh0bH4ZHiFcHi9J4PTrTMn/A4MtB5T6httMuca3g689jfIrRoFskOOP1c2iiXfnxFqwifC/JIbw+KWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHJIQDRXRxe/A5BO6Kyb/HdGn2RhuqHSl+ZW3QMssGE=;
 b=ZhkXURv7AfjpCR1p4Qd3N18JFUEP1Jq3vDyR/buqjXVWxxvtcwr1uGXj0Cya7HLK2KrEAhkoxgNhzxbWPqYyoME78oVMtyGwvSxpF12d3hcR4U3N9tnFAwhYHWkBYxfL0NkbSPEqeCAML1ePYKLVV+GgBbaJTE5DbDSxB/ctaFg=
Received: from BL1P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::27)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 16:55:16 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::9e) by BL1P223CA0022.outlook.office365.com
 (2603:10b6:208:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 16:55:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 16:55:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 11 Sep
 2025 09:55:15 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Sep
 2025 11:55:15 -0500
Received: from [172.31.178.191] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Sep 2025 09:55:09 -0700
Message-ID: <1d406410-631d-487a-9b02-ed23d2cb8302@amd.com>
Date: Thu, 11 Sep 2025 22:25:07 +0530
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
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <vschneid@redhat.com>, <iii@linux.ibm.com>, <huschle@linux.ibm.com>,
	<rostedt@goodmis.org>, <dietmar.eggemann@arm.com>, <vineeth@bitbyteword.org>,
	<jgross@suse.com>, <pbonzini@redhat.com>, <seanjc@google.com>,
	<mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <gregkh@linuxfoundation.org>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-6-sshegde@linux.ibm.com>
 <d0aa1a34-2097-405c-b431-907fd973ad96@amd.com>
 <e3826a8d-98cc-4497-85ce-5d92e0556cea@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <e3826a8d-98cc-4497-85ce-5d92e0556cea@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: a124b2bb-9449-4113-ca6b-08ddf153fb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHZVM3NwY2xRNE5WWGR1MlFTTzYybjk2dVBhM2Mya09CendBZ2lyMHlYRkpz?=
 =?utf-8?B?YS9lbnMyYStCdC9zaFhhYXF2VkIwNmJjUTN2ajd3SWVQeGJjaUdHL25aSXd4?=
 =?utf-8?B?djNvQ29Wa3YxUllhdVR2YXdFV29WWE9ObEhKR3FmQ1lITm16VEg5RHAzZGZT?=
 =?utf-8?B?OUtZL082M2h3S3k1azBzSVNLV3hlY0dIYThMR0JTMTJxU254Q0VJaEo0YlNp?=
 =?utf-8?B?UnFsSjcvYS9mazk5Nzh5aGdjQjNuZE9FS2xzRVhTYWJtSlhuN1FhMEJGYm9l?=
 =?utf-8?B?UThKM0Vubk1qSitpYWVhaWFPMjMxMGovWHBuM2c4VDFXUmFwRmZsWXk5TEQ4?=
 =?utf-8?B?dkVvazlrQWxNNU1qU1BFUGZsVURYS1NEeVQ3SmlXN2hWdEYzbS9CMWtsL2hJ?=
 =?utf-8?B?MGZNQnlVR2pmUjFDdWVKeVlweGNva1BHMWovdHllRVB5OU40aENhaFMvajla?=
 =?utf-8?B?aVlOOHhLeGVWajBsY3lCWTQvc3dqWk9oOHA3Y0YrZVFxY0FVakx5U2F0ak5D?=
 =?utf-8?B?QnZ5QmVJV2J0dmZBb1ZYWHVSSG9MTFNZMFFmamVqQmIzbVJSTjZ1ZmZGNTU4?=
 =?utf-8?B?eDN3Rm51elRhWk42ZWpFdjNSQnBIMmdidEp4MFdLSFYzeDZzVDNnT25TZlVw?=
 =?utf-8?B?Y1RYVVJjNHZZUktHZlBaRWRoVThlZDV3N2FQQ0Y5Y2x1d3NJLzFWL3IxRHQv?=
 =?utf-8?B?WXdnUGpSQitRRFpmMW1oSDFtSHByaktCcDd2amZWd3dGVVo3ZmhVckdSMWl4?=
 =?utf-8?B?Rmc2NlhWbyszZ0ZUbEJ0ODZYbjcvd01SR0ZwaVdBK09TUWRQYVRTUU8yeHpD?=
 =?utf-8?B?RXFaKzh6VVlLZ1NOVXl3Q1lVREtxR1UvemkyMCtJYnREcHVwZVUycVdzdXJr?=
 =?utf-8?B?L2lOTG5FMS9PTFA4dk1XSEdBd3FWN1U2Q0t5SEcvSGFod0YvS1pVajNFb2xq?=
 =?utf-8?B?MXViWWRFUGJwNDBBeU5WKytTZEg3UW1hNWk4Z0VoTUp0NXlNTjVYbkhGZHdN?=
 =?utf-8?B?OW90dVdhTkFIbUtNV2o4S0hZQXdNbDV4QW9SQXloUlJpeVJBRWlIV3lhUlpP?=
 =?utf-8?B?dWdsbGhMeUNRUmROa2dja0ZVRUl0U3o4eEZkaEsyWWJ5OEtoeWlOYkJibmJU?=
 =?utf-8?B?ZXdzaUFPNTlITkVyTmpoUW0wMTQ1Slhwc3JYWWllQTFzbjdCVElpc0ZlcXBq?=
 =?utf-8?B?WVNRNzVLQ3c1MlhlRkVGZkxwV3JHYUgvNGZDRkNyKzk5RmZOUlRWWUdNdHVC?=
 =?utf-8?B?aEdFQXNocm5OMnRBaVN1UUVTMlNMMnZ1Y1RLSWR2WEZ2VGVBT2tOeHo3YzdK?=
 =?utf-8?B?eVhLTi9HSjBYSVBJQnR5TC9BTWFLZzlHM3J6ditLRlpQa3hCSmhmekFkUmdF?=
 =?utf-8?B?NU11YjhnY3FDRmErdVF4dFFuU3daVVJSdm9qWTRtRW1CUzVFVG0va0QxcHJT?=
 =?utf-8?B?K1R1aGpoQWEvSFRqcXhWaDNtMFlUY3YvakVsODhWb253U0M5eDllVG51R3Fa?=
 =?utf-8?B?WEdMTEVxVEx2K09adEtpcm55djFLN3ROK0ZxNUxrWE5mL05xWnR4YTBKUGU1?=
 =?utf-8?B?R0NJOUx5QXpSSUNBZHB5ZzB6NlR4TDFNS0N1NmlVOGRtQXpnNXpuOUhkNmdz?=
 =?utf-8?B?Wnk5UHNjN1JiS1ZGWUY2NjdzY0h4SVVVb2wvUXlKNEx4N1JVZlQ2UUYwTjlE?=
 =?utf-8?B?a3V0cmdIS0Zxa1NaMEgxN3grekVKNFd5NXRkNmRXbyt3Q0tzMHRjZlUzazQx?=
 =?utf-8?B?ZE1MSWcyY1o5OVMvQlltaVorT1l5cHRJK0M3Zzd3bEJ3RmdYUzRzUVcvRjND?=
 =?utf-8?B?d0txcGRvYnp6N2g0OEo2Wm44ditZcEFVSTVuQUxIUGtlbGwwL0Fwdk9MdU40?=
 =?utf-8?B?UVNCMTlQWDNiVE5mTCthejRudEc4K3V0V0w4QllMTmI2dThVU0FMem8xNHZO?=
 =?utf-8?B?N3NZeW12S1FGcnNmcDFtYmdFVkFrYi8yUlNZWllWbExRaE5xSk9JRDdPbGxi?=
 =?utf-8?B?Y1BCcXdtN1g5Z04yQTFaelFOWU1FSnZZa1FaRlVES0V6cEFwNldTNkU0ZWZL?=
 =?utf-8?Q?txLnJ6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 16:55:15.9819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a124b2bb-9449-4113-ca6b-08ddf153fb7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 9/11/2025 9:26 PM, Shrikanth Hegde wrote:
>>> +check_new_cpu:
>>> +    if (is_cpu_paravirt(new_cpu))
>>> +        return cpu;
>>> +    else
>>
>> nit. redundant else.
>>
> 
> Do you mean "is_cpu_paravirt(new_cpu) ? cpu; new_cpu"

Sorry for the confusion! I meant we can have:

	if (is_cpu_paravirt(new_cpu))
		return cpu;

	return new_cpu;

Since we return from the if clause, we don't need to specify else.

-- 
Thanks and Regards,
Prateek


