Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5C5FB341
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 15:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmxJ94B6Vz3dqS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 00:21:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5u5ytv2w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.92.56; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5u5ytv2w;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmxH95Cdpz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 00:20:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyIyC/uOAiiQbkW/N+mdeuaVRqHV03N/oaIAOXP5NKwzROLfSJcDC6z5LIpYPpzoJu7Up3F3erDNtlCduMf1i1AlHUVQ/sptvfJaBF5YPHUhjOv9OeQASnnCMO9feRX6Pu8Odq3NDP5mNBzfgraI+So8WxqiLvpFRiK/nHd9g2Kif4DQo0eNuPhw8v7o+B6mnxZcYTPcFSCYShjTeXZLoou1N7jw6CKKmmw+M0HVU9VvWqKojX5z9c8ABSy4d9RFQkmFpxglGJkpqHD02tr4ADnVBO2nz/5O85yaoSkbPjQA4RQnmY/+7G7ktjpuXaoI/R0YEhmTPRXlhHyIJJMKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uDDdNQRtnMiVbMZUpFcACT7p0EQtw8QygLM3CiGSHU=;
 b=BOZB9Q3P98a9jsACFoEBrhC8puJ/hsnraykiRuXlHGBKJsUQaJxoae1yUrSKSFTuy4FTJFCWjT44Qmc3VBwUv2pSPPdpt0wv6Qf4fQs1xgyMtzfSLBNimj/1Jaq1xbjcsNPYa2l2URAL7yUqL2ryQvQM4Z4P4ZCvM276I9gaVKA5ckgcHYpZ3w4L16cCEoH9AZ2nHPZJ3WH2bqYSJ8ThIvufyvOnMsV19DEOq6DlwCGZ5iI5h3ugauXWptZFPawzg1SYMs2XowfkSR+ZviMgY0JCUj4Qcw3Wd0xAp2LmbiPEJtEW1iEcUuPHDDaCoWtl3k2lKy+JaBx7D9KYTQ0SfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uDDdNQRtnMiVbMZUpFcACT7p0EQtw8QygLM3CiGSHU=;
 b=5u5ytv2wCKtiQryLNQqnMos9yuuWMlqhLiPs14NXXXzcSbSPf+gRrw5eoLfDWPKu178/+f4V8RwbXhz1xqvFDmobziWuu0a9ABvkrAxu9WN9OIcKRXmsO+p2W/C0HHNTIhOX/m7rZqxBe+tTAQRYMvPrnTCxuLdR1VV8rSwIsJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 13:20:14 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::4a1c:7d22:b1b:1adc]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::4a1c:7d22:b1b:1adc%6]) with mapi id 15.20.5676.032; Tue, 11 Oct 2022
 13:20:14 +0000
Message-ID: <ba47d079-6d97-0412-69a0-fa15999b5024@amd.com>
Date: Tue, 11 Oct 2022 18:49:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20221008062424.313-1-ravi.bangoria@amd.com>
 <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 0644ac64-882f-4178-1562-08daab8b5530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jdZcImlqCz211+QqByTyCGKEgiEv3uJqubagbVoOcBwcsJMtRFt4T9/qCieOtNvfPUiC8VE2LALhXDcjOBaOFxxrX//Snx/SpuyZhdQArK/MyBcfSF/j77hsctwlEez46JhGDMKvGf/ZTYcj6mpYUwCFOx1xJKoA5LLMSiqhObR4Ez16+RLynFTIDQ5ElfttW2TVmcay1nAil5CH+FLy1BQ2wbDS2q4e7MLCg/t9NzIXp/gziZPPSS2JCK9kS2Tk3/aO+G3NJsvC68ENmeGHhR00LnGBiSfW3u+IZNCeeaw0EcFXHTzzoa7HymGb+buGEU6PV9BrQAL+Vexf2Mrg0LkkkpwryII/Czc2uF9UeozPI/P7uL7/G+YBsUZDrZHaiiX0YFQa8k5w3mSkKoR8UodbpNdJ9CDABYw1lQRlBloBQ7kRe6c7BTTUf/oeB4ADgYMGGdwX6RfevNabOXrRnD0yPIjT4cbUsgfrDn9vRX+/GX/OcS/oSoPmPDaiGjza3xscgvUryu8gNWBwmXl55mPIgAghou4vH2XW3FJyakM5ncLtUQrxVh27Lxja08nenzMjOtplcGFJViUDivr8KKI/q8AfRNeP50Gg5uyi6qnck9BWHpZhXB5pg/lEc/u0jpOfPWMlogsZ4rdS4BqZTJzQA791HPMdfaV8eNG9LglRWANIrWe2uqUu8aJFhHUmNhQbkz3fkHJz9mcDmNfC08EnPtHYrheuV0fL4egCYahvOyGBK0Rgkd86VWp430OweVlnugi9tc/aK6leoZKbliX3FxUgf6rvf59JhaPNbe8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(31686004)(36756003)(6666004)(6506007)(26005)(6512007)(2616005)(186003)(53546011)(6486002)(478600001)(2906002)(44832011)(38100700002)(4326008)(41300700001)(31696002)(6916009)(86362001)(66946007)(66476007)(66556008)(7416002)(8676002)(8936002)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QkRlTlFhRlFtQjlWcHB3MDlEZ0RSRFZ4dUFYVVNWU0pzLzgyZTJ0a0RVYXFu?=
 =?utf-8?B?L3haUUlORlVlYllFYnRya0FpMXcxNUFLQzBheUVhV0Y1Y1lGLyt2TjZrKzBm?=
 =?utf-8?B?MEJTcnNWMy91Z0twMWZnbnQ4bGJlbTFZV2FRbStaRGpLc1hPVm9JS0k0bGpW?=
 =?utf-8?B?ZlNWd1orcUNhRFZJMXB2a25iWElsZHRnTmZ2Y0lENWFMbkpYWlBFRTA1UTV0?=
 =?utf-8?B?QUdadjFmTm1HeTgzUE5sWDVZZW83RHpUT20xY2Z5Mk5La2VteEhZMEYyVGZj?=
 =?utf-8?B?QVhFbTlybW5nRXQ1QXBpMzNqOTYvRm9kbEFiazNHVlppRlNLblZGbTl5RzA3?=
 =?utf-8?B?T3BvdjhtbVhhbDIrL1RGVFVaOUZybVM0V3VrN1JKRHAzR2trT1VLaWFDczd1?=
 =?utf-8?B?ZUlZcE0vZENHWm9LZUtMOHBydHQ3azdOZm9Td0R1WUNMMVJVcEs4SytqMzZB?=
 =?utf-8?B?Mmx1T29IVUJ5RVpLTXA4bXN3aG80YlRrM0duYWRCeCt6U21saEh1MmdGcDFQ?=
 =?utf-8?B?OHJZVmlWZ0cyNGpyaGdQUWE5ZmFJYk9iT2dxbDBjb1Q5Vmp4djdxeHBZUFpM?=
 =?utf-8?B?bWVvdE9FK2NoZ0R4VlRNdDRMUDc2REhmc3RPR0pWWVVkSU1PQ2NISWJwZ28w?=
 =?utf-8?B?ZUNhWUxidWpGQVBCRlM4Z1Ywb0ViQUFOU0tvcHNSYTZRVXBiT3htQjB1OGI5?=
 =?utf-8?B?UFlYWUdldXBjdVVMNHpjSFVaOUQzcnFZSDlQUXZZUnhtNGtKdmdmWmYxUG5u?=
 =?utf-8?B?VndHdHl4Q2RTS0M1VTJGdkdhQ1NvZ3lLWjMwTTFWM1FtWFlpWlhDZ1RBN2pH?=
 =?utf-8?B?N0lJMDcxeWh2SGkreGtGQSt4emJZNzNYczZ1RWxJVUpaTzM1NUl0Wkc4STVE?=
 =?utf-8?B?Ulc4ajlZRzdYL2tWVHV6RFYwR0tRRHpvamhZVnFqdzU5aloxWHhLSzVwODg5?=
 =?utf-8?B?YjVUMDZ6Tkc3OWtZeG9GZVZLVjl3cVZ6dXRpU244d2FkVGZyMWJxVDB0RWpN?=
 =?utf-8?B?d3loWndqU1ZlUFNlUy9CTnF3SmhqYzhxVUZEbHFhTDRWVVd2NHcvNGpiTnpY?=
 =?utf-8?B?KzROa1ZWV2xnK0I3bzZSSzVWRmRycEUxbFFqSyt6L2dUQmdWMTFGQTAwSnZu?=
 =?utf-8?B?U09BYWtLSVJxcHhWVnM5Sjd0aFQ0UjJqOFVueHRvUGdDMnp2eEoyK2FHQUtL?=
 =?utf-8?B?Z0FzWTU2UEp1QStIb0kzNkhzUXZ6YjhWOTRiNnI0Njg1RTZiVlR5UnJ6cXpl?=
 =?utf-8?B?VHJ1bDZNNkZjK3RxRGl3TzRVYXBsZE81UVJMYVh6QW9qWEdUbTJtajcreXJI?=
 =?utf-8?B?bGFQMm5ZOXlSV2gzNXJmdlNJcGd0YnJUM0o0M2l0UG5uamtBMytpdWVSSkNo?=
 =?utf-8?B?ZXJkZit4L3dSb2ZZYzdvSXM3b3BEVVRpWXlRbFBScGhVWEhOSFBydXd3OTdp?=
 =?utf-8?B?TjdqMWR1OVRCY3c2S3JCMHF4ZlFjRHYvdXJzWEVRYkMwL0RYTFBQblhLczNv?=
 =?utf-8?B?QXF0Y1QvZ3lydmsrMVdQKzJOZ3Z0VnhhMUg2enlVNzJXRnZsSG1oNmdVRjlx?=
 =?utf-8?B?Q0U2TXRHdElHNzJPWHI0VXE2YzhYdVAwR091c01qR3pMc0YvKzVPTkU1cW1z?=
 =?utf-8?B?TzJJSXFTZXkxeW1COUZPNjNrMHc4cS9sVGVjY000ay9McWd2eUVmWGU1Z0xt?=
 =?utf-8?B?RGZCY2FMeU9QNlZFU3k3VXhSQlRETTc3QkpvdnhxY3Z2Y0RaZXdKalpkTWY3?=
 =?utf-8?B?aVY0UzdYMkFvdlZQa0pXWkpZM21vcHR5eHFvODRTcUlRMDBQRU5rYk5JMDFY?=
 =?utf-8?B?eWhuK2cxV0tUMnhKdWVHb1hKc21QOEFpRXRBQ3pjRmhlM1c0bnE2NWtUNk03?=
 =?utf-8?B?VWxDWlhRMmk3RDcxWkFOQ3JIUVdKeUNhTW1TK1ZxUyswbU15cFQ1aFlZbjFI?=
 =?utf-8?B?aGVMOGVBcDlSOStYeityTmlKMFk2SEQ4N2Qzc0NyM3doSlllbDc3QUdxVXVr?=
 =?utf-8?B?T3NqQktmNFpiNEsrSDNwVmYxUVpobVR1Rk9CaGlzUkI4dTVhTkx1ZXE1blNt?=
 =?utf-8?B?a0owTHhabDNNb2ZSWXBsL3RJTi81d3plOUFQcDladFRZZXY4K29PYTU3VUlK?=
 =?utf-8?Q?Ya8tjN8RI7HBLbsMjTJB7vsBg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0644ac64-882f-4178-1562-08daab8b5530
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 13:20:14.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 633TzDeNA+t7Oo8jETcdVLvVZ3APB2kjakF0s3ssc1IGMgxziBLNTWsl9E+isqFoWH/FB8weL8TwUKpWXiZMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381
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

On 11-Oct-22 4:59 PM, Peter Zijlstra wrote:
> On Sat, Oct 08, 2022 at 11:54:24AM +0530, Ravi Bangoria wrote:
> 
>> +static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
>> +					  struct perf_event_context *next_ctx)
>> +{
>> +	struct perf_event_pmu_context *prev_epc, *next_epc;
>> +
>> +	if (!prev_ctx->nr_task_data)
>> +		return;
>> +
>> +	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
>> +				    struct perf_event_pmu_context,
>> +				    pmu_ctx_entry);
>> +	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
>> +				    struct perf_event_pmu_context,
>> +				    pmu_ctx_entry);
>> +
>> +	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
>> +	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
>> +
>> +		WARN_ON_ONCE(prev_epc->pmu != next_epc->pmu);
>> +
>> +		/*
>> +		 * PMU specific parts of task perf context can require
>> +		 * additional synchronization. As an example of such
>> +		 * synchronization see implementation details of Intel
>> +		 * LBR call stack data profiling;
>> +		 */
>> +		if (prev_epc->pmu->swap_task_ctx)
>> +			prev_epc->pmu->swap_task_ctx(prev_epc, next_epc);
>> +		else
>> +			swap(prev_epc->task_ctx_data, next_epc->task_ctx_data);
> 
> Did I forget to advance the iterators here?

Yeah. Seems so. I overlooked it too.

Thanks,
Ravi
