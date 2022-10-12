Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746E5FC224
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 10:40:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnR1t4ndJz3dqd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 19:40:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tyR/Ah2M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.244.40; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tyR/Ah2M;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnR0W1Mbtz3bwQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 19:39:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNGm3CnIIlIn5LEDFEHErOCZlZGmb4JJCIdoJloLm4HQIZOPNLPQDqw8heVh1NqoYo5Xx9Z0Gp8uTdUTIpypPcgZZ0nI3NkBc+7y0TVwAhR2Zz0qpeifIY+II47Ym5E6QY04pCM1bi5sAbgSl902jmUQuleH7EuIrYs3uGhq8LnrTzSWmHXwoIE4ZOJD5IOcm+1/VbjVjR7QNoiqx7loTU9EHcHyYB2fcJLEYaE+b1JkWIVbBzBCqc5lgTVJ+5P9U8Km+n2zh6l74F6tUgZYAYbxZgtPj/ak3DfHFSHQRAjNCEBWfomqC6dmrMPFEgQclf31VnNXz3CFo2ihs6KV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe1RCL6meOk4b8p9K/ABM+a2gAxB1xyyUr6drtmF24g=;
 b=AIuKsEFNL/HBOequ6v+7r2xx4JxRCErdI1AuWx8p9qo8ydJMJH9MHmYC84415jwHUaWSYpG/OS2gq6Ogv7CUw1nTQbvfSGA795ziIy0SSX1BTWoa8zUVEi8zsTiyB7/YOB2r0d1AW+OBxBM+QyOIbhj1kCNvsSBnnUYwC7thyqEMUfPHvTScaE5TtrgFvMvypgdnYMCeVIC2Ut15X+ilyVM4xQPhBubPvA5xM8BmeqGD3fIpuSsdYGwinyO4ex2e3amYb5lTO9zsTDh68LRhUvdL0fJivmpszbK4a9ELX1jaN7iILxC8wKkkICgtkwUmCc8RX+Ra34h/XkQzXz4IbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe1RCL6meOk4b8p9K/ABM+a2gAxB1xyyUr6drtmF24g=;
 b=tyR/Ah2MQp72rnv2cqH7BG0J4t2VPASgYHqs9hUEefbX/xcf2rEOoaNWfP5wNMV94gkbqYTDKnCYuUgy9YTHB9/D6kMqwyjSWTCfcHxZO0gNrNEOcx46hIir4vN5kg70HNJay9TBW5uB9hNGkN0rkyiA2wgZH0hdDZ5IWZWboEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 08:39:16 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::6216:d15b:e4a3:58af]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::6216:d15b:e4a3:58af%3]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 08:39:16 +0000
Message-ID: <174fb540-ec18-eeca-191d-c02e1f1005d2@amd.com>
Date: Wed, 12 Oct 2022 14:09:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20221008062424.313-1-ravi.bangoria@amd.com>
 <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
 <ba47d079-6d97-0412-69a0-fa15999b5024@amd.com>
 <Y0V3kOWInrvCvVtk@hirez.programming.kicks-ass.net>
 <Y0WsRItHmfI5uaq3@hirez.programming.kicks-ass.net>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <Y0WsRItHmfI5uaq3@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::16) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: b59651a1-350f-4894-5d51-08daac2d3f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xvgWZx37wCygyuqWhoiS9FfISdnjjV7Au+UxjPy4EvkK1qI1WBalvzs+tpi2j2+vW39xLQzstFx1KfEWkEu7u1LfYf0efmhboUCo1l3EgDrz5zkSK3JZyvEJm3KWlzH92mIQHq6/cMuGdPcryHxgbyrpb96gUr0/fh+6FNuatwotiMcZEwvPQXRb1gzXkPwWJ+couq6OxxyLK6H1dkvV2YMWkBCwDcGGR4szJwOUtqcml75pmvoC8EWMvoeOdndcDIFbIMCQSzSiyNo3CHeeousLA5tuX6NmedYiBFwlFDNmWmTuY0a5lAllUA9N+f+DSiCW2+aoEsaN8AioDRvmHpPNGo3tsrVMV53OTSTK+ThBuyShNZPucvgIPfgw2v8kQx7EEdmTErhUULGnNZhOxgBkeiPQnyFHUl+OaoTUaC6Nv76FC6s5aSh7Dn32+6qcMDouyklHkM//ROQkQCxW5na681r0gEX/DUWmgO4bEPYv4Z/TEs4MsW4H/de8WRcu85+mLJXKCuIN6lQihCrsUMmJ00nEF1/1JCHZ3OSEnqNEyju2ItPJ0JqTWrhi6obMXsz5OPtcZ+A8iTc6cF3ICR78OrewzPVV4rlq5CMBYEwpVrtdyUgmEyjwSnQoGpBYdGHEGKXpTVHy2c9YcysfPApj8LLaKxdyrQlIl0uHyqQP0xuW3xx8lym28zVJWNCjxZ+O347QZ3sLCEreb2MJr5TGIcFWCZwriJOiT1tJXQKqkbefZDx9xed16o5S28hXPeu3PnLEF/XNH4iUEB4T+Xn+XDlzz65ucSZnoJnTR+A6oeldLhelRkH0WT1XPaSz
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(26005)(86362001)(6486002)(6916009)(316002)(8676002)(36756003)(66476007)(8936002)(66556008)(44832011)(41300700001)(2906002)(4326008)(66946007)(83380400001)(2616005)(478600001)(5660300002)(7416002)(6666004)(186003)(53546011)(6506007)(66899015)(31696002)(38100700002)(6512007)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VlJQQmdrZHhXa243ZEFvK20xbHZPNndvcEFnazJReWdRdHJxTU0rWHJvYzJu?=
 =?utf-8?B?UDJJSlBWK1ZiQ0lXdms3czhKSlNzRmVpcklVMlA4VFY1bXM4ZXV2RTVzYlp6?=
 =?utf-8?B?eXM4ZGNMQmV0TnI2dkZSZmZYYVdUd1FWYzk0KzBNUElEYmVoYysxZlltUUxB?=
 =?utf-8?B?cWl3L05SMmdCMXc3RVJBTDNCSEJxVHhoalY1NXNJdnFma0MvbkJxSkdxSGll?=
 =?utf-8?B?d3l5UlNZK3J3UmpHU0hzalljUGpjUjg4Zmx5ZWVtMnNqVkRPdGVSRnRnaTl4?=
 =?utf-8?B?U3F1R1R1UEVxZG9jbHc3cXB4TFpzdUR0QnFYOUk0OUxacE9FMzFiM2Mrd01y?=
 =?utf-8?B?QTBtaDJsZVg5OWY4emorbEpHS3IzelgxazNsS1FpalpsZU1OTTFXZllxYk5P?=
 =?utf-8?B?eTc5OEpQZkZQNzhlK1MyUWthWVBYc0hlSmV3aEZmSVlER2tYKzlNdVVtdEpF?=
 =?utf-8?B?RlJ2NnVzMFJLdEFQTStEZTF5YWtHeVlIQmxoM1psV0N3QUZmMVBmditINGRY?=
 =?utf-8?B?akhSQ3FpeUgyallXU2tRS3dXenNMNnhYQ0l3OWZjNnlvSjYwVWZ1WU9LcXN0?=
 =?utf-8?B?bit1MVJweVBPRGNNTDVBOGVIUVp1cjkyaXpZRUFaTGVyK05sNStEZm9COVpB?=
 =?utf-8?B?bXh1U1pIa3FvUkRWc2wxSU1GN1JYOHVzZGp2ZFNHRTFOaGRSSG9GYzlpRmdl?=
 =?utf-8?B?c1R0bWY0cTJFVUdUU21oY2Q1QkR5WEcwK2hIWEF2TFAxV2xWaGNqOXkvbVNN?=
 =?utf-8?B?TXNvNUZGbDBWaVdOTnJGSWN5YmRTWFlGVmxKeWh5R3dZY2JkSzZJNnllaGdM?=
 =?utf-8?B?c05PK2ZScWdCb1RMTERCbENCYlJjZ2FCOFRycG9YeExlMW5TTFI0SWkzd0J0?=
 =?utf-8?B?S05JeWZFa3d3QXZKOGp2dU9OSkF1TjRUUDdKc0RBaWo3RmI1MTZJNnJLVDJq?=
 =?utf-8?B?SDQybC95OFlnSm5DenVVVnVGWm5rQUZQTkZkZ2szZGg1M2l0YkZ3L2VNcEFD?=
 =?utf-8?B?T2tidW5CTmoweThSKzZldlBvMDMrV1N5bDAxL3Mycy9NYnlrNHJTZi8yYjR3?=
 =?utf-8?B?NXpMT1ZQbzN1bHlrUEhWb2FUUkNkaTZKdlArWjlTWTY0bnVHUVlSTTJqRG1Y?=
 =?utf-8?B?WkM5Rmg4L2RmOFk5ZzhaN2RhVm1CMVVWdW8yTnhuZVcrQ2lpaXVlSkU0NmtC?=
 =?utf-8?B?WGlIemt4ODJGQVUxbk1jN1gyYkJCeHAxb0tUdVQxaTZmL05CVGRSS1AvMENZ?=
 =?utf-8?B?SHV6Y3lWUDdXK29kWk5xY2VvMDhjMlRzdmdQYTBxY04rUXJpM2RsQjNCTm9j?=
 =?utf-8?B?MHRoT210N2dGaXBLbWpQMmZWZER5N2szU2xHempkcjNLRWZpOXFxMUsrcW5O?=
 =?utf-8?B?bkJiSC9sMjR0YlZPNVoxbCtVNFBOQ0QwMWpuVmE2b0txQVhnK3BWQ281WkNl?=
 =?utf-8?B?NVo1MW5HSmwrK09UaG9ucGVWeEttUUd6OEl1WVFYVWI4NEl2NmtkME95UjlJ?=
 =?utf-8?B?b1ZobUgxTDhaQnhCMmN6bGdtWnhQMzArdjhXRTBkOXhpWU9PeGJ2UW5qL1NP?=
 =?utf-8?B?LzNGUlVKMTFiQWFiQlFGdThmWHRUcjRVVEt3VzZqT05zVUczVnA3U000Zmt0?=
 =?utf-8?B?N2w4V0ZOU0dxM2YvNmplbldtSmpnYlNxOUh2aVZJWHhtcEtuZE5FbkFaSHox?=
 =?utf-8?B?OVhlcUZJYUNiWTZyZE9VRUZoVHZtdFIzQ2Z6R09EZnNTSTFYTW5wU09iUFVC?=
 =?utf-8?B?MUVJTzRxNHZCOU0rTERGOTVCeTR3ZkRUb3hUYmhlaVUwWUIyR2NxdHM4Wi9i?=
 =?utf-8?B?a3VtZk1sbmdtLytIS2hKYlBjQlBiVFlLRGd1SlUyK0t4bGRZRzF6MUxZZ0d1?=
 =?utf-8?B?UDYrRjVYQ0QwdysrMEpTc1hGNzNkRnpEN291V3dUeklyQUFTSVRLbnNEUUdJ?=
 =?utf-8?B?RzA0bkszUkhuelYwWmFqa3ExVENHV0czS1FMWlhleEtCTDRaV0FJdFFITkxt?=
 =?utf-8?B?bmZ6Qyt1b3hEdzdyZTdxNllnbDVtVW4rQXZtTDNwRHVtcTZFUmJIK1B0WFdy?=
 =?utf-8?B?WWpMNEZ4TksrWm1mQThORlBWUmRhRUdOUms4MldVa3NRNUZVYk5reEUxMWkw?=
 =?utf-8?Q?VdixamEttITdLOAXy/ChKGOYu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59651a1-350f-4894-5d51-08daac2d3f55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 08:39:16.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wVRYOwmVc9Ac+S2ibKpHvQ0QSty8Hi9WdanhUx6VtGxiiDSVEekCOLe5RiVHCvz3UcAnAwn7R043UVtDUkGwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, srw@sladewatkins.net, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11-Oct-22 11:17 PM, Peter Zijlstra wrote:
> On Tue, Oct 11, 2022 at 04:02:56PM +0200, Peter Zijlstra wrote:
>> On Tue, Oct 11, 2022 at 06:49:55PM +0530, Ravi Bangoria wrote:
>>> On 11-Oct-22 4:59 PM, Peter Zijlstra wrote:
>>>> On Sat, Oct 08, 2022 at 11:54:24AM +0530, Ravi Bangoria wrote:
>>>>
>>>>> +static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
>>>>> +					  struct perf_event_context *next_ctx)
>>>>> +{
>>>>> +	struct perf_event_pmu_context *prev_epc, *next_epc;
>>>>> +
>>>>> +	if (!prev_ctx->nr_task_data)
>>>>> +		return;
>>>>> +
>>>>> +	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
>>>>> +				    struct perf_event_pmu_context,
>>>>> +				    pmu_ctx_entry);
>>>>> +	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
>>>>> +				    struct perf_event_pmu_context,
>>>>> +				    pmu_ctx_entry);
>>>>> +
>>>>> +	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
>>>>> +	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
>>>>> +
>>>>> +		WARN_ON_ONCE(prev_epc->pmu != next_epc->pmu);
>>>>> +
>>>>> +		/*
>>>>> +		 * PMU specific parts of task perf context can require
>>>>> +		 * additional synchronization. As an example of such
>>>>> +		 * synchronization see implementation details of Intel
>>>>> +		 * LBR call stack data profiling;
>>>>> +		 */
>>>>> +		if (prev_epc->pmu->swap_task_ctx)
>>>>> +			prev_epc->pmu->swap_task_ctx(prev_epc, next_epc);
>>>>> +		else
>>>>> +			swap(prev_epc->task_ctx_data, next_epc->task_ctx_data);
>>>>
>>>> Did I forget to advance the iterators here?
>>>
>>> Yeah. Seems so. I overlooked it too.
>>
>> OK; so I'm not slowly going crazy staring at this code ;-) Let me go add
>> it now then. :-)
>>
>> But first I gotta taxi the kids around for a bit, bbl.
> 
> OK, so I've been going over the perf_event_pmu_context life-time thing
> as well, there were a bunch of XXXs there and I'm not sure Im happy with
> things, but I'd also forgotten most of it.
> 
> Ideally epc works like it's a regular member of ctx -- locking wise that
> is, but I'm not sure we can make that stick -- see the ctx->mutex issues
> we have with put_ctx().
> 
> As such, I'm going to have to re-audit all the epc usage to see if
> pure ctx->lock is sufficient.
> 
> I did do make epc RCU freed, because pretty much everything is and that
> was easy enough to make happen -- it means we don't need to worry about
> that.
> 
> But I'm going cross-eyes from staring at this all day, so more tomorrow.
> The below is what I currently have.
> 
> ---
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -833,13 +833,13 @@ struct perf_event {
>   *           `--------[1:n]---------'     `-[n:1]-> pmu <-[1:n]-'
>   *
>   *
> - * XXX destroy epc when empty
> - *   refcount, !rcu
> + * epc lifetime is refcount based and RCU freed (similar to perf_event_context).
> + * epc locking is as if it were a member of perf_event_context; specifically:
>   *
> - * XXX epc locking
> + *   modification, both: ctx->mutex && ctx->lock
> + *   reading, either: ctx->mutex || ctx->lock
>   *
> - *   event->pmu_ctx            ctx->mutex && inactive
> - *   ctx->pmu_ctx_list         ctx->mutex && ctx->lock
> + * XXX except this isn't true ... see put_pmu_ctx().
>   *
>   */
>  struct perf_event_pmu_context {
> @@ -857,6 +857,7 @@ struct perf_event_pmu_context {
>  	unsigned int			nr_events;
>  
>  	atomic_t			refcount; /* event <-> epc */
> +	struct rcu_head			rcu_head;
>  
>  	void				*task_ctx_data; /* pmu specific data */
>  	/*
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -1727,6 +1727,10 @@ perf_event_groups_next(struct perf_event
>  	return NULL;
>  }
>  
> +#define perf_event_groups_for_cpu_pmu(event, groups, cpu, pmu)		\
> +	for (event = perf_event_groups_first(groups, cpu, pmu, NULL);	\
> +	     event; event = perf_event_groups_next(event, pmu))
> +
>  /*
>   * Iterate through the whole groups tree.
>   */
> @@ -3366,6 +3370,14 @@ static void perf_event_sync_stat(struct
>  	}
>  }
>  
> +#define list_for_each_entry_double(pos1, pos2, head1, head2, member)	\
> +	for (pos1 = list_first_entry(head1, typeof(*pos1), member),	\
> +	     pos2 = list_first_entry(head2, typeof(*pos2), member);	\
> +	     !list_entry_is_head(pos1, head1, member) &&		\
> +	     !list_entry_is_head(pos2, head2, member);			\
> +	     pos1 = list_next_entry(pos1, member),			\
> +	     pos2 = list_next_entry(pos2, member))
> +
>  static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
>  					  struct perf_event_context *next_ctx)
>  {
> @@ -3374,16 +3386,9 @@ static void perf_event_swap_task_ctx_dat
>  	if (!prev_ctx->nr_task_data)
>  		return;
>  
> -	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
> -				    struct perf_event_pmu_context,
> -				    pmu_ctx_entry);
> -	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
> -				    struct perf_event_pmu_context,
> -				    pmu_ctx_entry);
> -
> -	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
> -	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
> -
> +	list_for_each_entry_double(prev_epc, next_epc,
> +				   &prev_ctx->pmu_ctx_list, &next_ctx->pmu_ctx_list,
> +				   pmu_ctx_entry) {

There are more places which can use list_for_each_entry_double().
I'll fix those.

>  		WARN_ON_ONCE(prev_epc->pmu != next_epc->pmu);
>  
>  		/*
> @@ -3706,7 +3711,6 @@ static noinline int visit_groups_merge(s
>  		perf_assert_pmu_disabled((*evt)->pmu_ctx->pmu);
>  	}
>  
> -
>  	min_heapify_all(&event_heap, &perf_min_heap);
>  
>  	while (event_heap.nr) {
> @@ -3845,7 +3849,6 @@ ctx_sched_in(struct perf_event_context *
>  		/* start ctx time */
>  		__update_context_time(ctx, false);
>  		perf_cgroup_set_timestamp(cpuctx);
> -		// XXX ctx->task =? task
>  		/*
>  		 * CPU-release for the below ->is_active store,
>  		 * see __load_acquire() in perf_event_time_now()
> @@ -4815,6 +4818,15 @@ find_get_pmu_context(struct pmu *pmu, st
>  
>  	__perf_init_event_pmu_context(new, pmu);
>  
> +	/*
> +	 * XXX
> +	 *
> +	 * lockdep_assert_held(&ctx->mutex);
> +	 *
> +	 * can't because perf_event_init_task() doesn't actually hold the
> +	 * child_ctx->mutex.
> +	 */
> +
>  	raw_spin_lock_irq(&ctx->lock);
>  	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
>  		if (epc->pmu == pmu) {
> @@ -4849,6 +4861,14 @@ static void get_pmu_ctx(struct perf_even
>  	WARN_ON_ONCE(!atomic_inc_not_zero(&epc->refcount));
>  }
>  
> +static void free_epc_rcu(struct rcu_head *head)
> +{
> +	struct perf_event_pmu_context *epc = container_of(head, typeof(*epc), rcu_head);
> +
> +	kfree(epc->task_ctx_data);
> +	kfree(epc);
> +}
> +
>  static void put_pmu_ctx(struct perf_event_pmu_context *epc)
>  {
>  	unsigned long flags;
> @@ -4859,7 +4879,14 @@ static void put_pmu_ctx(struct perf_even
>  	if (epc->ctx) {
>  		struct perf_event_context *ctx = epc->ctx;
>  
> -		// XXX ctx->mutex
> +		/*
> +		 * XXX
> +		 *
> +		 * lockdep_assert_held(&ctx->mutex);
> +		 *
> +		 * can't because of the call-site in _free_event()/put_event()
> +		 * which isn't always called under ctx->mutex.
> +		 */

Yes. I came across the same and could not figure out how to solve
this. So Just kept XXX as is.

>  
>  		WARN_ON_ONCE(list_empty(&epc->pmu_ctx_entry));
>  		raw_spin_lock_irqsave(&ctx->lock, flags);
> @@ -4874,17 +4901,15 @@ static void put_pmu_ctx(struct perf_even
>  	if (epc->embedded)
>  		return;
>  
> -	kfree(epc->task_ctx_data);
> -	kfree(epc);
> +	call_rcu(&epc->rcu_head, free_epc_rcu);
>  }
>  
>  static void perf_event_free_filter(struct perf_event *event);
>  
>  static void free_event_rcu(struct rcu_head *head)
>  {
> -	struct perf_event *event;
> +	struct perf_event *event = container_of(head, typeof(*event), rcu_head);
>  
> -	event = container_of(head, struct perf_event, rcu_head);
>  	if (event->ns)
>  		put_pid_ns(event->ns);
>  	perf_event_free_filter(event);
> @@ -12643,13 +12668,6 @@ perf_event_create_kernel_counter(struct
>  		goto err_alloc;
>  	}
>  
> -	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
> -	if (IS_ERR(pmu_ctx)) {
> -		err = PTR_ERR(pmu_ctx);
> -		goto err_ctx;
> -	}
> -	event->pmu_ctx = pmu_ctx;
> -
>  	WARN_ON_ONCE(ctx->parent_ctx);
>  	mutex_lock(&ctx->mutex);
>  	if (ctx->task == TASK_TOMBSTONE) {
> @@ -12657,6 +12675,13 @@ perf_event_create_kernel_counter(struct
>  		goto err_unlock;
>  	}
>  
> +	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
> +	if (IS_ERR(pmu_ctx)) {
> +		err = PTR_ERR(pmu_ctx);
> +		goto err_unlock;
> +	}
> +	event->pmu_ctx = pmu_ctx;

We should call find_get_pmu_context() with ctx->mutex held and thus
above perf_event_create_kernel_counter() change. Is my understanding
correct?

> +
>  	if (!task) {
>  		/*
>  		 * Check if the @cpu we're creating an event for is online.
> @@ -12668,13 +12693,13 @@ perf_event_create_kernel_counter(struct
>  			container_of(ctx, struct perf_cpu_context, ctx);
>  		if (!cpuctx->online) {
>  			err = -ENODEV;
> -			goto err_unlock;
> +			goto err_pmu_ctx;
>  		}
>  	}
>  
>  	if (!exclusive_event_installable(event, ctx)) {
>  		err = -EBUSY;
> -		goto err_unlock;
> +		goto err_pmu_ctx;
>  	}
>  
>  	perf_install_in_context(ctx, event, event->cpu);
> @@ -12683,9 +12708,10 @@ perf_event_create_kernel_counter(struct
>  
>  	return event;
>  
> +err_pmu_ctx:
> +	put_pmu_ctx(pmu_ctx);
>  err_unlock:
>  	mutex_unlock(&ctx->mutex);
> -err_ctx:
>  	perf_unpin_context(ctx);
>  	put_ctx(ctx);
>  err_alloc:
> @@ -12702,9 +12728,7 @@ static void __perf_pmu_remove(struct per
>  {
>  	struct perf_event *event, *sibling;
>  
> -	for (event = perf_event_groups_first(groups, cpu, pmu, NULL);
> -	     event; event = perf_event_groups_next(event, pmu)) {
> -
> +	perf_event_groups_for_cpu_pmu(event, groups, cpu, pmu) {
>  		perf_remove_from_context(event, 0);
>  		unaccount_event_cpu(event, cpu);
>  		put_pmu_ctx(event->pmu_ctx);
> @@ -12998,7 +13022,7 @@ void perf_event_free_task(struct task_st
>  	struct perf_event_context *ctx;
>  	struct perf_event *event, *tmp;
>  
> -	ctx = rcu_dereference(task->perf_event_ctxp);
> +	ctx = rcu_access_pointer(task->perf_event_ctxp);

We dereference ctx pointer but with mutex and lock held. And thus
rcu_access_pointer() is sufficient. Is my understanding correct?

Thanks,
Ravi
