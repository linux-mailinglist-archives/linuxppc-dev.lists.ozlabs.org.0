Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EF17B137
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 23:09:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YPzV0CpzzDqrX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 09:09:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam02-cy1-obe.outbound.protection.outlook.com
 (client-ip=40.107.76.73; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=kim.phillips@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=OiRMEtlu; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YPxc6CNxzDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 09:07:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYND0VQRxxfOplPQ0bJWQ8ZRpzOkI+m+ZPgQ7QZHUlVsDBD09N/Hbk/TE1aA1o+RXzHmhZ0f7H6aBgaMARGR6Ua+LROMZzJJqkx86D2tNqqT8ZlrBGtX8rtdcXeXQnU0kiXwPFVjJF9J5SR0Gamo7IRSdQJ8hOxhdQPx3rC7XcdDntOwc+LpFU+EbjUVYZQ5bu2x5m6ea9NA0jrr4ctIYb0EKmqAV9UFX5j3oUN8sf7zOv850vJ/RmeKCsVOz378frEJCgvB5TGVlqGK/FA0Bl7hd4HHXthfrw4TzJ94QPnEXYzdD6ESoQ3+jBsoeplqlgWNR+8736V9wlMLnB1MTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvaJvMAO4X/6KtlJktfWtK6KTJ3YKH2bT8+MOJZYH+Q=;
 b=Wq/Tqb9rp28SgWz/swZtAJlf5xrPupf1KXEyc1NEBoUUTPX0/lBxZPpxV98RQ8zrA7Nql+HDd3x54LWjWafVhMUFHupOjPl9qoOE2bzfY4C0EtShX31k+pmntW4AwSetRDknU4l0cnvJg2LQgQMt2Xdmf9kOC+QVQR/CAfLO9J98shTLPwmr2hPAWHmWkOPTW1ioHx28tfs2o9o0DlbbsB/z1xYP1V57XkSl/t5Zn0CLx4qVCkOiH8nGjZaVLXXCmtb9Epidj3fNLcmF4+00tcc9sXA+4MPEMNbKMYHP6vWI3AVOX0aoOWfO/X6zsln64iDDDovYLodKhN076RsSKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvaJvMAO4X/6KtlJktfWtK6KTJ3YKH2bT8+MOJZYH+Q=;
 b=OiRMEtluv8+AjNkOq7MHG5XxmJRoHLONc4ni+J9Pg7QWrwjTLF4Fj5bRkOMgQRjdtyI9gPX4RmvuBwv5r3CsA154VUiGEngJJPfu5VCug04W7Z5eTGI10nfWlmAoKIi3cfA47GtNrbUuIiLBqmszDTu1Da4SeBhzxyppjtW1sfk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=kim.phillips@amd.com; 
Received: from SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Thu, 5 Mar
 2020 22:06:59 +0000
Received: from SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b]) by SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b%7]) with mapi id 15.20.2793.013; Thu, 5 Mar 2020
 22:06:59 +0000
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
 <CABPqkBSzwpR6p7UZs7g1vWGCJRLsh565mRMGc6m0Enn1SnkC4w@mail.gmail.com>
 <df966d6e-8898-029f-e697-8496500a1663@amd.com>
 <2550ec4d-a015-4625-ca24-ff10632dbe2e@linux.ibm.com>
From: Kim Phillips <kim.phillips@amd.com>
Message-ID: <d3c82708-dd09-80e0-4e9f-1cbab118a169@amd.com>
Date: Thu, 5 Mar 2020 16:06:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <2550ec4d-a015-4625-ca24-ff10632dbe2e@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0021.prod.exchangelabs.com (2603:10b6:805:b6::34)
 To SN6PR12MB2845.namprd12.prod.outlook.com
 (2603:10b6:805:75::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.247] (165.204.77.1) by
 SN6PR01CA0021.prod.exchangelabs.com (2603:10b6:805:b6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18 via Frontend Transport; Thu, 5 Mar 2020 22:06:58 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 247a078f-1247-4889-d972-08d7c151869f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:|SN6PR12MB2751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2751542223B6575A1BB1820987E20@SN6PR12MB2751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(16576012)(316002)(81166006)(2906002)(81156014)(53546011)(956004)(478600001)(54906003)(2616005)(66946007)(44832011)(52116002)(6486002)(8936002)(8676002)(5660300002)(31686004)(66556008)(6916009)(66476007)(86362001)(186003)(16526019)(26005)(4326008)(31696002)(36756003)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2751;
 H:SN6PR12MB2845.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3wy1n78yHKbo1yOTw0br2y0U2+ybLHpiE9arrdmwNEcIwG9v0MOcMRbJs4AFlWsgUsR9F6T3z+fAs4k7g/Ev25Ka6Q1TAJvOIN47GqoTA/8JVQzSb7mOf4J2Xcdcu1ef5Ou/3NLAt9R82ZY82tvJtrKWlyGWfcKrisM8A5bk6jr/2yKvaZ8MfzOSFGCN6baLS/g8M/UWjYX2F0hbIWoCflrZxTmOsva/Y/eKvD4Z8KIlfBZQB3caQZyO0Ldt1D0k2eNBecuAmcdK2UoeJti+IpZU7xrn3TuK5OJMCIZXP+rmPLlamY0RxTd1A5k7/ztpjDQjvFbNJO27RoaI1NETGH4coV788e6CUoHDDPlGJ3iARBQH9w51pHJGMiBC1jB3/3gZs5lLFm28xMpSXcw1BiaRsqZW7V9pX1Df7COiQ5pSKMfEz6LlAbWvXxvE69H
X-MS-Exchange-AntiSpam-MessageData: pdcyoGlB0kdn6NcbczrywneCcIt8TFBr+J1wiM9KDRC/QA9qe0t+ZilunFVmoTdZxtICCn0xXtwZCkG9mZ7UCijWwbsYjlpANYn2O2uK7V2PFZl17YQEvEv47GZJ72nfa6ryvJwf45hQ2BipItCnsQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247a078f-1247-4889-d972-08d7c151869f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 22:06:59.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YSiA6ZTZmnA9NNF6icuBw7YzVBmcY+8kHN2Lu25xAB1g0jNZKXBn0Z2BX8ug/jSJJSv11oaoqPDc3JsAuUWXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>,
 maddy@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 Jiri Olsa <jolsa@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 yao.jin@linux.intel.com, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Robert Richter <robert.richter@amd.com>, Namhyung Kim <namhyung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexey Budankov <alexey.budankov@linux.intel.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/4/20 10:46 PM, Ravi Bangoria wrote:
> Hi Kim,

Hi Ravi,

> On 3/3/20 3:55 AM, Kim Phillips wrote:
>> On 3/2/20 2:21 PM, Stephane Eranian wrote:
>>> On Mon, Mar 2, 2020 at 2:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>>>
>>>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>>>> Modern processors export such hazard data in Performance
>>>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>>>> AMD[3] provides similar information.
>>>>>
>>>>> Implementation detail:
>>>>>
>>>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>>>> If it's set, kernel converts arch specific hazard information
>>>>> into generic format:
>>>>>
>>>>>    struct perf_pipeline_haz_data {
>>>>>           /* Instruction/Opcode type: Load, Store, Branch .... */
>>>>>           __u8    itype;
>>>>>           /* Instruction Cache source */
>>>>>           __u8    icache;
>>>>>           /* Instruction suffered hazard in pipeline stage */
>>>>>           __u8    hazard_stage;
>>>>>           /* Hazard reason */
>>>>>           __u8    hazard_reason;
>>>>>           /* Instruction suffered stall in pipeline stage */
>>>>>           __u8    stall_stage;
>>>>>           /* Stall reason */
>>>>>           __u8    stall_reason;
>>>>>           __u16   pad;
>>>>>    };
>>>>
>>>> Kim, does this format indeed work for AMD IBS?
>>
>> It's not really 1:1, we don't have these separations of stages
>> and reasons, for example: we have missed in L2 cache, for example.
>> So IBS output is flatter, with more cycle latency figures than
>> IBM's AFAICT.
> 
> AMD IBS captures pipeline latency data incase Fetch sampling like the
> Fetch latency, tag to retire latency, completion to retire latency and
> so on. Yes, Ops sampling do provide more data on load/store centric
> information. But it also captures more detailed data for Branch instructions.
> And we also looked at ARM SPE, which also captures more details pipeline
> data and latency information.
> 
>>> Personally, I don't like the term hazard. This is too IBM Power
>>> specific. We need to find a better term, maybe stall or penalty.
>>
>> Right, IBS doesn't have a filter to only count stalled or otherwise
>> bad events.  IBS' PPR descriptions has one occurrence of the
>> word stall, and no penalty.  The way I read IBS is it's just
>> reporting more sample data than just the precise IP: things like
>> hits, misses, cycle latencies, addresses, types, etc., so words
>> like 'extended', or the 'auxiliary' already used today even
>> are more appropriate for IBS, although I'm the last person to
>> bikeshed.
> 
> We are thinking of using "pipeline" word instead of Hazard.

Hm, the word 'pipeline' occurs 0 times in IBS documentation.

I realize there are a couple of core pipeline-specific pieces
of information coming out of it, but the vast majority
are addresses, latencies of various components in the memory
hierarchy, and various component hit/miss bits.

What's needed here is a vendor-specific extended
sample information that all these technologies gather,
of which things like e.g., 'L1 TLB cycle latency' we
all should have in common.

I'm not sure why a new PERF_SAMPLE_PIPELINE_HAZ is needed
either.  Can we use PERF_SAMPLE_AUX instead?  Take a look at
commit 98dcf14d7f9c "perf tools: Add kernel AUX area sampling
definitions".  The sample identifier can be used to determine
which vendor's sampling IP's data is in it, and events can
be recorded just by copying the content of the SIER, etc.
registers, and then events get synthesized from the aux
sample at report/inject/annotate etc. time.  This allows
for less sample recording overhead, and moves all the vendor
specific decoding and common event conversions for userspace
to figure out.

>>> Also worth considering is the support of ARM SPE (Statistical
>>> Profiling Extension) which is their version of IBS.
>>> Whatever gets added need to cover all three with no limitations.
>>
>> I thought Intel's various LBR, PEBS, and PT supported providing
>> similar sample data in perf already, like with perf mem/c2c?
> 
> perf-mem is more of data centric in my opinion. It is more towards
> memory profiling. So proposal here is to expose pipeline related
> details like stalls and latencies.

Like I said, I don't see it that way, I see it as "any particular
vendor's event's extended details', and these pipeline details
have overlap with existing infrastructure within perf, e.g., L2
cache misses.

Kim
