Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0475F9D36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmGDt0vpbz3c38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:01:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GyKwSCVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.102.48; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GyKwSCVv;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmGCs0KNhz3bhh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 22:00:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN8vaHplcP2tzp/tqGaY/JBAKQV06BwNboybozgtqaWtAeO88r6YGp9ugaAj2kwM48p0H4O7MAdnJfeuO3KARClVQCIF2s6+5rtm2r+0OtDYG7ULCASrk9iEYCr71D6D+rVpmJIa1OZZgMtypLJ1vS413snRVYY+7nbqwR+pbCCID05ssNcW5O3CtdkFUdwvAVqPuW1nKU/EgGiYnIqVOzk7NJ1AISxLMtVrpEfJ9T1XSqy7bgOwW/G98BK5E4y3uqGJMRwYnXU3aCm+ccpCzhFS4/n11XgziosX9yMp42MUiSAflitAfbGsw1Nd+fmRMwvkBbOxZmmOywTaO2pW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvbLCsVgqSSYj5HBtQqqIdcpp2QxjCyPZs24Xo6xsD4=;
 b=GsQ4KE3AjspdqhzXq4YDgNIF7cZh0NQBCLA65RNIlxZlEKB3tKjzD1AFCV3HL42K+LW7m1KqBDVXdu/K4CBYueyct8mAAnnEbW+wC1TDF6bh2vlM4bFiJyLYP3ots7ZCcdbvlz9PITZ9eAz8jdwnHQeack0yTZV9nt6ZSPBqnThiJhPDEdPDlIMGZ2q7BTq862tatFUTHkRBYYTW3zaCm5n4/2i6HRUpKk02sRO34G5OTDuTpp3UbUlPUjfEC/JVrSy5ngX7l8yvNFYTDq1kE1SIOugCc2b5e2XVoWRn3kLl6sxXUm0whisiYztIFtpXPlsnX+oPkh30OIyqvjkadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvbLCsVgqSSYj5HBtQqqIdcpp2QxjCyPZs24Xo6xsD4=;
 b=GyKwSCVva14Vf6d9soGPkjWPYEmEw2JbRSQBZGKaVnqTpsRZ58hCqC+kO21BI/P7UrwElSATtwAS5Eo8FsmndvDeTBhbDZHoEmNd1RnJ/jwUJN/5K9ZgiWFkvfWWtC+hKRCCafR1us4qJAvgDc7JpSbZuHxvXF3QxY+HAUe4FKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 11:00:02 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::4a1c:7d22:b1b:1adc]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::4a1c:7d22:b1b:1adc%6]) with mapi id 15.20.5676.032; Mon, 10 Oct 2022
 11:00:02 +0000
Message-ID: <aa2484ea-03b1-f3fd-339e-145e3fb79c78@amd.com>
Date: Mon, 10 Oct 2022 16:29:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
 <e1d933d1-4772-1357-9cf1-6e5b842508c8@amd.com>
 <Y0PwgBz6asJOHSan@hirez.programming.kicks-ass.net>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <Y0PwgBz6asJOHSan@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::16) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: a6859159-301d-46cf-88ce-08daaaae9451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fsRmK0sZ8Sq2jNZzNhMFbYfIKpO0pK71euV5GXRyM+36nfPZeDfExYo7HIgA9wLsMsgWfpDbAdWMeWTvM13kK7twRfqStcr5KHBDy9542YWbW6Vg6JJr/TjltAGGPVlVL3BQu4+/3A8JuXwGPcdW0pPZ9eLxVv6qTqcXTAPEJn9wxIDNAKRjOcJX9fozVqThKJxW+tywNDyHL8hNDxl3T04eVq7UDLLk5lZ6cNfOy5dGd+8Luxel+kxkE9jWrreTW6YgoBweC/MBdn/m50GxVK9L6Lb31zacSvTzTNq5wShuW2j68hvOkummDeVIv4lHXDWkgd1Lua+n6cwh9qZDLaBLihQkYMJPh0EtwJN5gkOwzYIQ+OCk0j8LdghksBFJgcxhp6ME1GcFWm8RTYbudArzvHTtegBQUOXrB+G/p05FMCJkJukYt3eAs68P4L85XOYItczON9i7VVd6+m/Abmlwxt8u+hstv+lhuLbY64PwjNB1iT+8ZUXFcUUiI03MDZhdq6Y1AFE/+cSZ2UJKd7iTEoWxPJviqu2cAAaaDN4R3ePmnYMuIgzPAn7L6TEzyubBPNY0k31XllZCEHHLoOIGU4xMF691ZMN/iUCKlU4TgWSyHGSfBc1d09uVXk+lR4v/fnA5vHZR4WG7CWFyy7ako8r3Vhfw7gExf+StwN4vGjsimXhgobB0GH62kDOXZajm/l6auggPeGD4BBBK4pC8Dj7XLzQ/yebQUAskvHZ0JjHv+A10sR8Ad0nGu0FcTGinye+qPLLskYkO2RkinR9CE0Hc1JhzwyjbOCSIP3/oIeqXeBhmC3Xx2vzsNC5I
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(86362001)(31696002)(38100700002)(316002)(36756003)(6916009)(478600001)(6486002)(8936002)(7416002)(5660300002)(44832011)(4326008)(66946007)(66476007)(2906002)(41300700001)(66556008)(83380400001)(6506007)(53546011)(6666004)(8676002)(2616005)(6512007)(26005)(186003)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ekV4TVlPMW5iNEIySmNVczlsUWc5clY3NDgwQVZ4dEVOVkI2d29mRUhqbjRw?=
 =?utf-8?B?RzUxamt5TVlPb3JqSzJaK3dhck9sSGZicnZCOUM0ZWhEYmpwc0VXZDJLQzN3?=
 =?utf-8?B?MTh1dGN3QitKNXpKU0JPazZLWVpVQTFaV3loMGFlUWFwUXc4S2xZZm5NclRs?=
 =?utf-8?B?ODBGN2tCeWpsZDdjM0dxekFsVG5CV1ZzNVlJTytla1ZtYjJFdUJIcDR3dkZw?=
 =?utf-8?B?TENhRWR5WktyMUVEN2Nid1JFUW00UENtODhSOW93NjYvdVYwNXMzcnpRUlR3?=
 =?utf-8?B?RHd3UHlzN0dVNjVqeHh2L0l3c1lkUHhOUjZnVk16RHJyL2RpWnp3TzFOVFQ5?=
 =?utf-8?B?OTZ2Q1JLalhQRlVrUmg3VW1IM0ZIc2UrZmxPeW1HSzNXRjU1bHV3dGV2WnhX?=
 =?utf-8?B?eHpobnIzZ3lMTG9PcnVPYzdnMk9wVlpBL29jU3c1VW9WQ1NESEZ4amRhcWth?=
 =?utf-8?B?NzFSUG9YS1dlREc5cXhXV0xVMVFPNWlwTnVRbWFFLzJCTkhZcDl4MkNaUTcw?=
 =?utf-8?B?WmczZGp1NG4yZ2cwb01tSGx0R2wyZ2o0TjAyd3J0TWtXWEtRc2dLbTVFekxE?=
 =?utf-8?B?RWtHZmdWUWZsTUY2Ty9wZlhNYnFISmx6dGoyd09oeEd3c1ljOU5HUHNyZVlH?=
 =?utf-8?B?V2gzcnZZcHZCdmRwVExENS9idENjRlNpTDQzUUNvdlV0b1VhaFZ0dXdhYzIx?=
 =?utf-8?B?VUhWSStxZXVOb253SHNJSG1tTCsrdm9xdWhKcmVXb0VnbnJha3dIc2FNSi9o?=
 =?utf-8?B?SHBpQmJ2STlIZlhqN0ZKTHdHUmMzeW9uRktkZ2RwdEVVVTZ2YW9YT0FkV25l?=
 =?utf-8?B?QTFYWWMzN29nU3o1VUFjZEd3a3NYcmxmVDZZTTYvc202V3ZiSm9QNS9xcFgy?=
 =?utf-8?B?WkVQN1pLeldQN0RldFNjeXJnVDh6NmpzR3BsbVowRzFiaGg5WTFyS2ZveTgv?=
 =?utf-8?B?RjkxQ2RxSXE5ZmJFSXpQZjlKb3ZrRnc3SDYzV2pKS05PSGNISWdsRW8zZW9r?=
 =?utf-8?B?S3lUQW9abXdPYUN4TVFBWGtyQUkwWk9HcWtENmthMEJLMkFVL0VBTjZFdHYz?=
 =?utf-8?B?ZU5LTFdRa29jUms3UEgxMkdhMlhvLzRGZzhPNWNqaTREZDR2ZHJ2eUdvZGJW?=
 =?utf-8?B?V2ltSWJObFJpSTZLd3RIeDVtZGFBMVhDVFlWTmVMd2xoYXRCWWRDWGtKbVo2?=
 =?utf-8?B?bnI5MkcrN3pmY2doNDU1V1lScTQzMEFPTFA0RGdtNGhmalg5dU9iZi9zTjJm?=
 =?utf-8?B?ZXlRb2d2ekRnd2JyeEhLbXpSZmw2TzNtTVJiRG9TU0NiTExSVXAxZ2lWN2pE?=
 =?utf-8?B?bVBRQVBsS0pIaGRWa3NqU0NhZTA2aC9QT0RWZW13MjJITlhzem9YRUNiNU1m?=
 =?utf-8?B?R1Vna2U2SzZ6RHR3dzJ3TmEvOEZYWkhZbFoxZExpZ0k3eGVYVFFwOVFMbnRX?=
 =?utf-8?B?SHpNc21SUnBmUU9LSGFUdXgvc2pCMnRqQzM2aVdJSTZiR3luUnAwM2FoSkpN?=
 =?utf-8?B?UkcyQkwwQ1dXMVlCV004aDA0TzdlMHczMDFRV3Vjd3pqTkVDMTk2Q3JlVFpk?=
 =?utf-8?B?eEtsQ0kvL1F0MUVFK3ZRUXExV3lRTzdsaGM0eFArUXhaMi91Y2FCbFNva09L?=
 =?utf-8?B?Nk13TFdQeEtWY0JZdWx6M0hLcFBnM0ROL3FwUGFXOWN3blFWSC9seDVRMndL?=
 =?utf-8?B?R091NHhiK00yM0E1MDFxUDRNdFFEb0RIK09aK0ZHUzN0RTdBbmtLR2J6NzR2?=
 =?utf-8?B?WEYwK0FjcmZZOHhma1JlRUdmRmp3Y3NvY0MzbDdlZ1ZSck1DZ3I0Y29vQzNL?=
 =?utf-8?B?aDhwdjl6cHQ4c2xFdnh0MWhvN05Ud2ZFcGxhMk43VVhUeEVFNTNiNzZsWFVo?=
 =?utf-8?B?N2NHdmUvY2RvK1VNSHUyaStMTTN4TjZZd2hJdTNqWmlOdE1iTW9VU3ZFcnd4?=
 =?utf-8?B?UE1SS25iV2tlMnJkYUNwVUZCb2RHdEx4NHhHTkZ2WWpPNktvaVMyUDVvUkR0?=
 =?utf-8?B?bGZjSnRhUFpwZVpCMnpvY0cyV1ZnOGpMZk5zaGZRSS9WeHYzcVFsQlZRQThx?=
 =?utf-8?B?a3NMWUVQcVB6RWVRV0kyUCtvRjI4SDQ2Zk1PY3pudlpmNS9uVWFNcjRmV1Bu?=
 =?utf-8?Q?e284L3iuPVLyzM+kk5+7N40kD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6859159-301d-46cf-88ce-08daaaae9451
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 11:00:01.9810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59EthyghzGF0rpskTNtgzOLp8wME86RGWyjIzFbJanziGi5mtpKGfqjSIqR93WvEXg1p4j4n66SwLXUtmsj44g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10-Oct-22 3:44 PM, Peter Zijlstra wrote:
> On Wed, Sep 07, 2022 at 04:58:49PM +0530, Ravi Bangoria wrote:
>>> -static void
>>> -ctx_flexible_sched_in(struct perf_event_context *ctx,
>>> -		      struct perf_cpu_context *cpuctx)
>>> +/* XXX .busy thingy from Peter's patch */
>>> +static void ctx_flexible_sched_in(struct perf_event_context *ctx, struct pmu *pmu)
>>
>> This one turned out to be very easy. Given that, we iterate over each
>> pmu, we can just return error if we fail to schedule any flexible event.
>> (It wouldn't be straight forward like this if we needed to implement
>> pmu=NULL optimization.)
>>
>> ---
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index e0232e0bb74e..923656af73fe 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -3751,6 +3751,7 @@ static int merge_sched_in(struct perf_event *event, void *data)
>>  			cpc = this_cpu_ptr(event->pmu_ctx->pmu->cpu_pmu_context);
>>  			perf_mux_hrtimer_restart(cpc);
>>  			group_update_userpage(event);
>> +			return -EBUSY;
>>  		}
>>  	}
>>  
> 
> I'm afraid this breaks things; consider:
> 
>   f79256532682 ("perf/core: fix userpage->time_enabled of inactive events")
> 
> I totally hate this -- because it means we *HAVE* to iterate the
> inactive events, but alas.

Sure. Will drop this.

Thanks,
Ravi
