Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5B5A94C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 12:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJHY355gJz2yyd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 20:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GtS6Ryls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.100.57; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GtS6Ryls;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJHXG0FDGz2xZ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 20:36:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfxaWdes4PUs+oPZDs8VZyzYdw1VjpI6EpsE0tRKBdhfYGQWARDqwseyl1c8GjRRPHxc1M+iHa6KoxZYKakDUNoFeCQTINOt/YjNBQ2vmTIQXWKjCVOuXOsx/apLQVtdftJ68hIGrMpaxo2oDhbiLQ1+AFTR9o9cIGmo4rZ4caXkjGb+B++c03fu/Fy/Yzv7G4QVD5qUk0zqaafsCQ/1xho7E+KCF1ezU3f6XNJl/feKkSaim2nvSyRexGB09lTl7d7DMn6MVD7Zbpo9t9qWihdN5ws92sBN9+9MjkAIGUM0/mNzKLMRLvHRXt6nsZLlB3aDe68k5aV4J97iY0FT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH92cuMwS6n/ybagev9dAYT5CUWIIHJy5czEC6iAMTQ=;
 b=VLkbLxfoLcH3/19S2WpFYn9WocbYS3c/GolCKDXA6KvNLd+mDgwoht0Dq2TIC5X8SwgONskHu2SDisS4a/x/gKnuDgJ7Lz4ElMt3k2dh4IUR1exNfVUht898WNKYaj5QkvVMsoZH7EiN3wrRxqVw4xRbIQkQXUjd78mkcLLsq63G5qL1UNnObOiJ/IGMFrFtXNoBO+V0jWmsZ2ewfGds5813RcnzssAOBMwzbHhpoTUrJQIY1YL4Z3ZCl8mlAfCiebYTxTQAJzs7pi/kVAaYX/Tae07nrFbpKOAU+XkmemLAPKiOTL04msNrWCg5D2FDWlHrTW8irkdnsgBBIbEcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH92cuMwS6n/ybagev9dAYT5CUWIIHJy5czEC6iAMTQ=;
 b=GtS6RylsV7rn+rxiDiF7irjqGW8fxQqXUzytMZuXB/GNZ7jrQNJnxacaLTStNEN1sP9+Mecf8F1MHIUszidqlOfbiJYC/Ml420FhtJonWKwSeeKF3HJryC3na/QlU+4hhhL46fg4RucZU4EMvzLRVpH/35TzQCTgN9GuAgAr5KY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 10:36:06 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::d058:d925:c09b:de2]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::d058:d925:c09b:de2%5]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 10:36:06 +0000
Message-ID: <c5a6aea9-4f3a-495e-78fa-e426de9b0496@amd.com>
Date: Thu, 1 Sep 2022 16:05:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
 <YwyrUYS30gVbxc2D@hirez.programming.kicks-ass.net>
 <YwzP+AFWCx4Ni/kx@hirez.programming.kicks-ass.net>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <YwzP+AFWCx4Ni/kx@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9820242a-ec4c-45c0-324f-08da8c05c6a5
X-MS-TrafficTypeDiagnostic: IA1PR12MB6627:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DxNvT0ZbL46OdXy17Cs7f7+Cdf0Sto6jdvhgd2RBDb6QSiSktiRT2s+ZXEFQlc/3vH+fgGugAdMR3wQ5URwk9WNZ/4/JH4/GSgBOZkJdyRiEE8Ys0Gr0DfXLVI9x9jA6vrJT9IJjgyIitgiVM0SZtprKS6d0boOz9k69UvMJeHQFUpLHMuIr0Z/BkdFZDA7+W/ZWzD8dQ4wAlt2KMq9TVt1jJL70xjWh+hXwPNiVvLeH6sTl5uTsqGmNs5iznm8g967kCe07GJCBm7UIZLrMGDzFTyCtYX9A+Nyz43N94LCdJ8JuLGa+j0hzobcik+0xculLhu7HAhKBPqOXJapIejfRLLFZGk6gAcVroI3dltuhTFZ8XchAMupIAnZYOzMhv6ozwQUsDp3/zCImIDBMejxjlEO4mrr6vs1Sr0ximsUkxhNlbMWzB0ShAIjdWNcivL35CnO7jNOwcjAP/GVmDuFdHJtMcCFvFohHbb2bnYc89TEyhzh8nSFNgegcycn0QzpXFsxyfHg7wGyNAkr3YTc61veDZgAcR+5yTEBSgS0UhAbGte4OVge7JDt3y4LqVUume0j1vlcS980C/L8rwVpGoZwGYErMRr9ny3xjlfYMhkX3ZpJ2ylwCVggjvzNWTCgDXjV0xHGHduLPgllg6Wh+dEkwNtVv2SyLWaksji0Hwu9wjRLsoHDTN3kIYKFY5pBbYrBLt6E0L7RxLuUfQHhYFcXGwDLlxQklr6N1eGTt65coJWdeOwAnMrgQFuyI4xmPXU96C03LfVa+66UnjsoSWX5h1HkfiDhKRkMSkudNsz/ilDhar6D003EVXvVp
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(8936002)(53546011)(6506007)(186003)(41300700001)(478600001)(6916009)(83380400001)(6512007)(5660300002)(2616005)(6666004)(7416002)(2906002)(44832011)(316002)(8676002)(4326008)(38100700002)(31696002)(66946007)(26005)(66556008)(6486002)(66476007)(36756003)(31686004)(4744005)(86362001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?L1d6QUNweEtJVFRiRU1MZERtZ3ZyUElLVVZEL1o4NzRJellleGZkaVhmaU91?=
 =?utf-8?B?aWtMVDdpQmhyVHB6YUxRQk5vVEphQ1ROVjE1SW5UVUdaUWJLNnkvdHdNTHpp?=
 =?utf-8?B?L3JlMlpqQ1VHMG8xdDhCcTJJSTBLWFlWWWtGZmRhbGFlNnd4SG41L0hxM2dE?=
 =?utf-8?B?alN4bnM1WTRaZ04vNlN1YXJrUm9EVzJiSVV5ZzUvaHZERHpSamRvMEQ5MVcv?=
 =?utf-8?B?bFJ6c0crZnRCL0RnSnhLQUFrdnk5TXVuaHFyc0VxdXpnR0FnV2R3MkRCcDls?=
 =?utf-8?B?OFpnSTdWcXY0dVNiVlpMZG1nbUl4MnQxbTNSZWtzZDRPVWliOFJXdjI4QVp2?=
 =?utf-8?B?aEMzV2pXbW9yM2ZEQ3ZUVzlGakdIMytNbjJVM3pPQ1pMRm9uSmtOM1pxOWN1?=
 =?utf-8?B?SU4rMDQxYkdiSFhQVXN6cFlEVWI5WkdmWUNleUZTNE9IYTF4UElLQ0djWFpI?=
 =?utf-8?B?T1VUNXk2eEhMZXpUM2tRa2t0aS81VjVOblgxTDUvamNJSng1NDl3OVZHWGR3?=
 =?utf-8?B?S1BUeEkrVG9FbVliSGxCRTZyeGRzaEtVMmpwU2lTQURxWDYvMUhkK3ZQdG1a?=
 =?utf-8?B?dmZzSUhsbmg0TFBMRCtCSHNHSmxPVyt5U3dvQ2VBWmFXSHp3a0FnQWJacGVP?=
 =?utf-8?B?OHZSR2FibW13MGZWY3FDbFRIVDNYcnJDbkNZVzNBMEkyWFRvSTBMLzcwZUR2?=
 =?utf-8?B?MDN3ZVVYQzFlcCtEeDZDaFJIUkM0VVVPUE1XZWhHT01rKy9FQ3N5WGMvUk9K?=
 =?utf-8?B?b2ovM3JRenhZV3pKdEJaRWZwc2tIcmFjakJWOHRNcDVvd2EyU25KanFCaDY3?=
 =?utf-8?B?WDI1RmxlSDZtaU51eGlmKzBxR1dUMUY0d3pyK00wTHgwVEhNZ2JlRDYwT2dw?=
 =?utf-8?B?akRlY3RjWVg4WjZ3VHF3VG9OblRDMno2VDhUb2Nvc1RVYzBLMi9YdkJDRkRj?=
 =?utf-8?B?UEUwcmRFZWpSRExxSXc2anA0TVV0V1FWbEZkaDhtUnUwYnZBZ3lqZ3RyZTh5?=
 =?utf-8?B?ZmV6MUlCOC9hNWJUK2ZIMTJLZzhENHFXc2E4dXMwUUx4R2FReUM4TzZHSDhX?=
 =?utf-8?B?M0dGZzlxaDROWForY1FnUjlSOThOUmNSRnJObnhXME5taDZhRWZUVTI5QVlw?=
 =?utf-8?B?UktXYlRmSExVS0NBUG9xVTJ1VU1ZNkIxRlE2ZWJIczlBN08vdmJYbnRqM1Bx?=
 =?utf-8?B?S2M0SW4xVHpCM3ZqK2N0ampiWjFscHhXNjRrcVRIRmg1b3NKb1RTYk5HSXdk?=
 =?utf-8?B?UWRHaU5pRWZPcTJ2VXUrZGpWZ1RoMnF5cys0NjlXcWRaZjlKOWQxUk1ocWd2?=
 =?utf-8?B?bmQvMUVFY01YeTVHc1U0RGM5bVJYYTZtYVRqL3RjbnJpazlLWWlwUUE0a2Js?=
 =?utf-8?B?WU1BN2VxalpVeUtsd2JNb0RUK0d1SVJ6LzNIMWRQL2FrZHhKOEJjZnBpSUtB?=
 =?utf-8?B?NlNHVG92K04yU1d4ZDNCdXRwbXBIdk5CY1FmbWM1U3diY2F4UW1jc1dVeDNZ?=
 =?utf-8?B?dmdRU25tdjdVRkJTN0dkcjBtNkl5QnRLS0J0NXdONkY5YUEyT29ob1dsK3JP?=
 =?utf-8?B?N2owSHZaNm5vcVo0aFp3UytqN2JTQU8xUmJ6ZHdvVmdzMmZrM0NEY1pMSjdw?=
 =?utf-8?B?a2FwRVE2UG9IdUdWZ3UxMUJuUWNhdy9za2EvQmRoUUppOGVqMUR4SE54Q0lv?=
 =?utf-8?B?MUNHZnprRTBNbnNQOSt6eXhlQU91bUQvb1NwWkxCNkYydS9Fa2lJa1ZvRk5x?=
 =?utf-8?B?eTVWT2hFZjJVcEM4emZxSGtya2Jrd2syVDhkaXBFajRFekljZDJEbWZmZFBP?=
 =?utf-8?B?Q3JZL0xyUGI4UmVsaENMdnk0VisxWkVrZDF2SFNnWTJNNnBiNmZQM2lWdTNB?=
 =?utf-8?B?OEUra1pFZ2MwTUMrWi9uUzVBeDUzWG5tbzJQWkJXWWZvcGdoQk5xMUE2Y05o?=
 =?utf-8?B?WnowcndrWk0wSFlWMEh2cldGSm1uVU0vSDFqYzRYWjVRb2JaWnAzK1hPS2tj?=
 =?utf-8?B?eVpKTXhMemVkaWV2TnFzY0ovdWxZR3FJTkpHeUsrdWlZRXBzS2U3RUdNMjBE?=
 =?utf-8?B?L25ocnp2SWlMU3FpczRpY1dVZ0RHTGNEUktJN3JndXUrWldJNjN0U1BGVHdk?=
 =?utf-8?Q?sOSMKVuFuPuaRdFwyANqOocRp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9820242a-ec4c-45c0-324f-08da8c05c6a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 10:36:06.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3dzTv12C+49+QVg52kTGhInCHr30ol5JLdW++VHzCBozPrYzkmd0PkLttTguFVkOJeDKOhPZn2CHTMaPAYt3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, ravi.bangoria@amd.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29-Aug-22 8:10 PM, Peter Zijlstra wrote:
> On Mon, Aug 29, 2022 at 02:04:33PM +0200, Peter Zijlstra wrote:
>> On Mon, Aug 29, 2022 at 05:03:47PM +0530, Ravi Bangoria wrote:
>>> @@ -12598,6 +12590,7 @@ EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
>>>  
>>>  void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
>>>  {
>>> +#if 0 // XXX buggered - cpu hotplug, who cares
>>>  	struct perf_event_context *src_ctx;
>>>  	struct perf_event_context *dst_ctx;
>>>  	struct perf_event *event, *tmp;
>>> @@ -12658,6 +12651,7 @@ void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
>>>  	}
>>>  	mutex_unlock(&dst_ctx->mutex);
>>>  	mutex_unlock(&src_ctx->mutex);
>>> +#endif
>>>  }
>>>  EXPORT_SYMBOL_GPL(perf_pmu_migrate_context);
>>>  
>>
>> Note to self; fix this :-) I'll see if I have time for that later today.
> 
> Urgh, while going through that it appears the whole refcounting thing
> isn't fully done either.

Not sure I follow. Can you please elaborate.

Thanks,
Ravi
