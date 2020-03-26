Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873F1947E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 20:51:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pFxL3m5YzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 06:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-dm6-obe.outbound.protection.outlook.com
 (client-ip=40.107.243.63; helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=kim.phillips@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=2n/ebWv/; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pFv31ml4zDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 06:49:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg5Fh/OObs3YwmAdPv2vsXtfm5j1N+9Oku3zIn4MxVoqdOa34cQeY+AjnSFbU88y1QS8cA0vI3LDnLdl6dPDjXiq6LftOHNaDDyNSNFuVEm9va0Z3PizB0UyKld2k8u6lVbZhqX2xfoSFb4KFqzjHplxBvDS95GuT4o6LM1ZuoUAPAVFtb0Ai+VkzJVXZ7VCmEyr6O6P4eJojoxPIT1B3dIBT1IUvqU9kRtqHFT4iK1BAc7+oFvJw3KkCoFCpg8SNM2Lqx/kLb8xDsoSLHq/Iv4lNsQ3uem5KDCL4dVFsD7osvphP4vgXA44uABpkK7xlr+I35QMw2HNNyXrLDAl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz1PxbV7qoMuZD4yORNkPbIP6evGLkd8L27CvkwaMGs=;
 b=XVHun1+RlBy41wO6LA6MWdaJZB3RxSrLuwWZ3QiI+PDpOW/cfyNwKIchHyNxe11d9cIe01Nw3aJqUMXTvNVMOHA110cjPTRgGY1EsdqS35i0zsVd28ZRgYOcjll8nvsFGQj0rBcaWMAHyE+/E03E3pxhDcqrAd80PtJgVWsmxA8EQ/2B9UIqjla7T2q1/mt7veaSodC5uE2bJvnnSHCYopWCz+BrXStkIaXDaJE/XAPkHmZRxS4uUXt5UGBSJqP7lymJLFQEIPrR8w0DsTUOLfCp6d8EA9s6Ka7wvEpL+7Z7EMVMm/hLjCMoA6juYqJImR7o6DKpMKungnZnLamRKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz1PxbV7qoMuZD4yORNkPbIP6evGLkd8L27CvkwaMGs=;
 b=2n/ebWv/0AHokG/SmOjjDjmZdVlnZilrVOk2ZGYos11Nj/baqE2m7QvqMXwppv1PJxdHHoEvbp6CwlK4vf48r5UQRZEc/f/eN7d4N6cxE8ECanOEdkZvuJjCPc6PELGXM+5Oze5l+z4Y9RvVsDgm9kNAenhV9lQE/50HxxRHMlQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=kim.phillips@amd.com; 
Received: from SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 by SN6PR12MB2799.namprd12.prod.outlook.com (2603:10b6:805:77::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Thu, 26 Mar
 2020 19:48:43 +0000
Received: from SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b]) by SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b%7]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 19:48:43 +0000
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: maddy <maddy@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
 <CABPqkBSzwpR6p7UZs7g1vWGCJRLsh565mRMGc6m0Enn1SnkC4w@mail.gmail.com>
 <df966d6e-8898-029f-e697-8496500a1663@amd.com>
 <2550ec4d-a015-4625-ca24-ff10632dbe2e@linux.ibm.com>
 <d3c82708-dd09-80e0-4e9f-1cbab118a169@amd.com>
 <8a4d966c-acc9-b2b7-8ab7-027aefab201c@linux.ibm.com>
 <f226f4c5-6310-fd6b-ee76-aebd938ec212@amd.com>
 <0c5e94a3-e86e-f7cb-d668-d542b3a8ae29@linux.ibm.com>
 <8803550e-5d6d-2eda-39f5-e4594052188c@amd.com>
 <965dba09-813a-59a7-9c10-97ed1c892245@linux.ibm.com>
From: Kim Phillips <kim.phillips@amd.com>
Message-ID: <ee86b3e9-9e6e-8601-b381-9556cb7b67de@amd.com>
Date: Thu, 26 Mar 2020 14:48:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <965dba09-813a-59a7-9c10-97ed1c892245@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:408:d4::34) To SN6PR12MB2845.namprd12.prod.outlook.com
 (2603:10b6:805:75::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.194] (165.204.84.11) by
 BN8PR04CA0060.namprd04.prod.outlook.com (2603:10b6:408:d4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19 via Frontend Transport; Thu, 26 Mar 2020 19:48:40 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78b2a839-edc5-40e8-5d10-08d7d1beb045
X-MS-TrafficTypeDiagnostic: SN6PR12MB2799:|SN6PR12MB2799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2799AA44353FB2688D7F24B687CF0@SN6PR12MB2799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(2616005)(956004)(2906002)(186003)(478600001)(16526019)(8936002)(44832011)(31686004)(31696002)(110136005)(7416002)(8676002)(81166006)(86362001)(81156014)(53546011)(4326008)(36756003)(54906003)(16576012)(316002)(66556008)(26005)(66946007)(52116002)(5660300002)(6486002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2799;
 H:SN6PR12MB2845.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/1cy4AfSIf104a6PPJbaAwrBWeO53O0GhjqI/gkGuLc7jJyXm39IXsFm2wXyNQpeIiOJRBRa3OQf2dQDplXqt+TW7uQhymDIIwzcO8rsnLvscwcKny/KlxJ5XIj4HEribHF+UMiHuhskNR6yAzuDtcH1ozFK84diR+wA2HnxgSwa/oO93E77P2ySzCVw+GQVfOzbeFb1R1V5llYmxZ7mb7R3tzKY6jwj8eug9C6yCHfgrDuvSN3DFl/x6CphkVniK9t1FnsKFKeIY8cN9ZQOXCEHERRIv9EZ3k6GRUp5d/dsYpUoSQKUXRGtjQzIB08s245ZNC9NBO3jjfO+45ze+qOjbUPIKGZ9reCaacpROeyJ7jqM3Qim0oE9iNaSbFgM5YMEtZIc2pCwf1gqWow6HT8kIANGmlMW+WzN9p61dt6umFSI/z+xSrp5r/V/NY1
X-MS-Exchange-AntiSpam-MessageData: j9hZfECd77bqZcMwX1rRCFUbgVJWyJAFW3usC6LDk/MI7EeaI6/D79rYDw+YBnvK2WfIGzFVnybCoocFogdcc0TPhHTJMjak3UzucM6e7qnGG/bPvQgbflDT50qvRr9/9catbN52qljHOI5mWsv3uA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b2a839-edc5-40e8-5d10-08d7d1beb045
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 19:48:43.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FfYAe0v95BmvzFDb421xf5iAbGnLavp0lv6br+1SNmNJpCJwaZ3FF01DeIYymFsunZPbsrIlMX/l+ydpQrffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2799
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
 Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
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



On 3/26/20 5:19 AM, maddy wrote:
> 
> 
> On 3/18/20 11:05 PM, Kim Phillips wrote:
>> Hi Maddy,
>>
>> On 3/17/20 1:50 AM, maddy wrote:
>>> On 3/13/20 4:08 AM, Kim Phillips wrote:
>>>> On 3/11/20 11:00 AM, Ravi Bangoria wrote:
>>>>> On 3/6/20 3:36 AM, Kim Phillips wrote:
>>>>>>> On 3/3/20 3:55 AM, Kim Phillips wrote:
>>>>>>>> On 3/2/20 2:21 PM, Stephane Eranian wrote:
>>>>>>>>> On Mon, Mar 2, 2020 at 2:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>>>>>>>>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>>>>>>>>>> Modern processors export such hazard data in Performance
>>>>>>>>>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>>>>>>>>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>>>>>>>>>> AMD[3] provides similar information.
>>>>>>>>>>>
>>>>>>>>>>> Implementation detail:
>>>>>>>>>>>
>>>>>>>>>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>>>>>>>>>> If it's set, kernel converts arch specific hazard information
>>>>>>>>>>> into generic format:
>>>>>>>>>>>
>>>>>>>>>>>       struct perf_pipeline_haz_data {
>>>>>>>>>>>              /* Instruction/Opcode type: Load, Store, Branch .... */
>>>>>>>>>>>              __u8    itype;
>>>>>>>>>>>              /* Instruction Cache source */
>>>>>>>>>>>              __u8    icache;
>>>>>>>>>>>              /* Instruction suffered hazard in pipeline stage */
>>>>>>>>>>>              __u8    hazard_stage;
>>>>>>>>>>>              /* Hazard reason */
>>>>>>>>>>>              __u8    hazard_reason;
>>>>>>>>>>>              /* Instruction suffered stall in pipeline stage */
>>>>>>>>>>>              __u8    stall_stage;
>>>>>>>>>>>              /* Stall reason */
>>>>>>>>>>>              __u8    stall_reason;
>>>>>>>>>>>              __u16   pad;
>>>>>>>>>>>       };
>>>>>>>>>> Kim, does this format indeed work for AMD IBS?
>>>>>>>> It's not really 1:1, we don't have these separations of stages
>>>>>>>> and reasons, for example: we have missed in L2 cache, for example.
>>>>>>>> So IBS output is flatter, with more cycle latency figures than
>>>>>>>> IBM's AFAICT.
>>>>>>> AMD IBS captures pipeline latency data incase Fetch sampling like the
>>>>>>> Fetch latency, tag to retire latency, completion to retire latency and
>>>>>>> so on. Yes, Ops sampling do provide more data on load/store centric
>>>>>>> information. But it also captures more detailed data for Branch instructions.
>>>>>>> And we also looked at ARM SPE, which also captures more details pipeline
>>>>>>> data and latency information.
>>>>>>>
>>>>>>>>> Personally, I don't like the term hazard. This is too IBM Power
>>>>>>>>> specific. We need to find a better term, maybe stall or penalty.
>>>>>>>> Right, IBS doesn't have a filter to only count stalled or otherwise
>>>>>>>> bad events.  IBS' PPR descriptions has one occurrence of the
>>>>>>>> word stall, and no penalty.  The way I read IBS is it's just
>>>>>>>> reporting more sample data than just the precise IP: things like
>>>>>>>> hits, misses, cycle latencies, addresses, types, etc., so words
>>>>>>>> like 'extended', or the 'auxiliary' already used today even
>>>>>>>> are more appropriate for IBS, although I'm the last person to
>>>>>>>> bikeshed.
>>>>>>> We are thinking of using "pipeline" word instead of Hazard.
>>>>>> Hm, the word 'pipeline' occurs 0 times in IBS documentation.
>>>>> NP. We thought pipeline is generic hw term so we proposed "pipeline"
>>>>> word. We are open to term which can be generic enough.
>>>>>
>>>>>> I realize there are a couple of core pipeline-specific pieces
>>>>>> of information coming out of it, but the vast majority
>>>>>> are addresses, latencies of various components in the memory
>>>>>> hierarchy, and various component hit/miss bits.
>>>>> Yes. we should capture core pipeline specific details. For example,
>>>>> IBS generates Branch unit information(IbsOpData1) and Icahce related
>>>>> data(IbsFetchCtl) which is something that shouldn't be extended as
>>>>> part of perf-mem, IMO.
>>>> Sure, IBS Op-side output is more 'perf mem' friendly, and so it
>>>> should populate perf_mem_data_src fields, just like POWER9 can:
>>>>
>>>> union perf_mem_data_src {
>>>> ...
>>>>                   __u64   mem_rsvd:24,
>>>>                           mem_snoopx:2,   /* snoop mode, ext */
>>>>                           mem_remote:1,   /* remote */
>>>>                           mem_lvl_num:4,  /* memory hierarchy level number */
>>>>                           mem_dtlb:7,     /* tlb access */
>>>>                           mem_lock:2,     /* lock instr */
>>>>                           mem_snoop:5,    /* snoop mode */
>>>>                           mem_lvl:14,     /* memory hierarchy level */
>>>>                           mem_op:5;       /* type of opcode */
>>>>
>>>>
>>>> E.g., SIER[LDST] SIER[A_XLATE_SRC] can be used to populate
>>>> mem_lvl[_num], SIER_TYPE can be used to populate 'mem_op',
>>>> 'mem_lock', and the Reload Bus Source Encoding bits can
>>>> be used to populate mem_snoop, right?
>>> Hi Kim,
>>>
>>> Yes. We do expose these data as part of perf-mem for POWER.
>> OK, I see relevant PERF_MEM_S bits in arch/powerpc/perf/isa207-common.c:
>> isa207_find_source now, thanks.
>>
>>>> For IBS, I see PERF_SAMPLE_ADDR and PERF_SAMPLE_PHYS_ADDR can be
>>>> used for the ld/st target addresses, too.
>>>>
>>>>>> What's needed here is a vendor-specific extended
>>>>>> sample information that all these technologies gather,
>>>>>> of which things like e.g., 'L1 TLB cycle latency' we
>>>>>> all should have in common.
>>>>> Yes. We will include fields to capture the latency cycles (like Issue
>>>>> latency, Instruction completion latency etc..) along with other pipeline
>>>>> details in the proposed structure.
>>>> Latency figures are just an example, and from what I
>>>> can tell, struct perf_sample_data already has a 'weight' member,
>>>> used with PERF_SAMPLE_WEIGHT, that is used by intel-pt to
>>>> transfer memory access latency figures.  Granted, that's
>>>> a bad name given all other vendors don't call latency
>>>> 'weight'.
>>>>
>>>> I didn't see any latency figures coming out of POWER9,
>>>> and do not expect this patchseries to implement those
>>>> of other vendors, e.g., AMD's IBS; leave each vendor
>>>> to amend perf to suit their own h/w output please.
>>> Reference structure proposed in this patchset did not have members
>>> to capture latency info for that exact reason. But idea here is to
>>> abstract  as vendor specific as possible. So if we include u16 array,
>>> then this format can also capture data from IBS since it provides
>>> few latency details.
>> OK, that sounds a bit different from the 6 x u8's + 1 u16 padded
>> struct presented in this patchset.
>>
>> IBS Ops can report e.g.:
>>
>> 15 tag-to-retire cycles bits,
>> 15 completion to retire count bits,
>> 15 L1 DTLB refill latency bits,
>> 15 DC miss latency bits,
>> 5 outstanding memory requests on mem refill bits, and so on.
>>
>> IBS Fetch reports 15 bits of fetch latency, and another 16
>> for iTLB latency, among others.
>>
>> Some of these may/may not be valid simultaneously, and
>> there are IBS specific rules to establish validity.
>>
>>>> My main point there, however, was that each vendor should
>>>> use streamlined record-level code to just copy the data
>>>> in the proprietary format that their hardware produces,
>>>> and then then perf tooling can synthesize the events
>>>> from the raw data at report/script/etc. time.
>>>>
>>>>>> I'm not sure why a new PERF_SAMPLE_PIPELINE_HAZ is needed
>>>>>> either.  Can we use PERF_SAMPLE_AUX instead?
>>>>> We took a look at PERF_SAMPLE_AUX. IIUC, PERF_SAMPLE_AUX is intended when
>>>>> large volume of data needs to be captured as part of perf.data without
>>>>> frequent PMIs. But proposed type is to address the capture of pipeline
>>>> SAMPLE_AUX shouldn't care whether the volume is large, or how frequent
>>>> PMIs are, even though it may be used in those environments.
>>>>
>>>>> information on each sample using PMI at periodic intervals. Hence proposing
>>>>> PERF_SAMPLE_PIPELINE_HAZ.
>>>> And that's fine for any extra bits that POWER9 has to convey
>>>> to its users beyond things already represented by other sample
>>>> types like PERF_SAMPLE_DATA_SRC, but the capturing of both POWER9
>>>> and other vendor e.g., AMD IBS data can be made vendor-independent
>>>> at record time by using SAMPLE_AUX, or SAMPLE_RAW even, which is
>>>> what IBS currently uses.
>>> My bad. Not sure what you mean by this. We are trying to abstract
>>> as much vendor specific data as possible with this (like perf-mem).
>> Perhaps if I say it this way: instead of doing all the
>> isa207_get_phazard_data() work past the mfspr(SPRN_SIER)
>> in patch 4/11, rather/instead just put the raw sier value in a
>> PERF_SAMPLE_RAW or _AUX event, and call perf_event_update_userpage.
>> Specific SIER capabilities can be written as part of the perf.data
>> header.  Then synthesize the true pipe events from the raw SIER
>> values later, and in userspace.
> 
> Hi Kim,
> 
> Would like to stay away from SAMPLE_RAW type for these comments in perf_events.h
> 
> *      #
> *      # The RAW record below is opaque data wrt the ABI
> *      #
> *      # That is, the ABI doesn't make any promises wrt to
> *      # the stability of its content, it may vary depending
> *      # on event, hardware, kernel version and phase of
> *      # the moon.
> *      #
> *      # In other words, PERF_SAMPLE_RAW contents are not an ABI.
> *      #

The "it may vary depending on ... hardware" clause makes it sound
appropriate for the use-case where the raw hardware register contents
are copied directly into the user buffer.

> Secondly, sorry I didn't understand your suggestion about using PERF_SAMPLE_AUX.
> IIUC, SAMPLE_AUX will go to AUX ring buffer, which is more memory and more
> challenging when correlating and presenting the pipeline details for each IP.
> IMO, having a new sample type can be useful to capture the pipeline data
> both in perf_sample_data and if _AUX is enabled, can be made to push to
> AUX buffer.

OK, I didn't think SAMPLE_AUX and the aux ring buffer were
interdependent, sorry.

Thanks,

Kim
