Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EA183CB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:44:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dkRD56mszDqNC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:44:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam02-bl2-obe.outbound.protection.outlook.com
 (client-ip=40.107.75.45; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=kim.phillips@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=eZ8EvdUj; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dkJT2rmKzDqpL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:38:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ7T0Al52pPfsrCwEgnDkvENlzrHOg5VKlkgz05iWiXGYv1CLD3mjCxXwYs7zK1/9p/JWptgm1zTL90bfmIin/iea6BaHy8kylD1tzrMx3RC+A6olU1w5ULSUkP3iDJWKeuE84g73/swLhciBTBKOw+KNDiW0pgnK1WRoberytfUGDk/y9Xkr1ZTyXjJl/YNn4+pEDQn641BIWsdalpJQneQOc98zmN+ITqIxu8tpIYN9TwPBcNewjHlF3YL38B/cVDaWoHAjVL2JLbqpryaMubckD6Y/SiEI9oObX6oB1K3R2qBd6M+c3jmMn+afKC1Hm8s+QWCMBzLP8NvwSGDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vNQXkkaqZ/bYcH5EBsRrT0C29tQCqUAgfWKAq2Yzss=;
 b=kQJMYweJoYG2ckAnXwTaT9wmqzqs0NIvc+jgCg4WrcFNESLsuLCSaxtScTKQHB1Cl5E8HQnNACRDzhjYeM5IA9sNTBqn+3ujK0ZAkW5jiMVbxsxp6J95LnT4EFEVWrKY60zQ70b6v5+KdbUdFlc/gbEKfYG6k2R4YT33FkgJulDlQ+NCahzT9Ci4NoiZDx7xDifhzlBV5P0ejmo3hVIeqHAaGtFBXD9LkF+xniOwMNvSbKVT65PJbK0P4UM+76fqP/djH12oeMEqAQy/4iMKW0J9CidDe17+fjO1AL1nrWgAJSdVCsQIcZqS4M4zqSuy/A0082Z8AxM4ey+ObjMdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vNQXkkaqZ/bYcH5EBsRrT0C29tQCqUAgfWKAq2Yzss=;
 b=eZ8EvdUj/OFSBIlzeSQ1y3npcT1ODYKcnTHpv4UQnyRNyQIXFfOPg0NgIV2+JG74zIz5tdnNmCLWK/fOWKIDrT1tlvlv2krvKUM83xTycPBdxqAHFH7g9f4FsEnTdri6DVVDKx3CSEsh84BdW3sovwyY8FEQnXZxiO/casruTAM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=kim.phillips@amd.com; 
Received: from SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 by SN6PR12MB2734.namprd12.prod.outlook.com (2603:10b6:805:76::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 22:38:41 +0000
Received: from SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b]) by SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 22:38:41 +0000
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
 <CABPqkBSzwpR6p7UZs7g1vWGCJRLsh565mRMGc6m0Enn1SnkC4w@mail.gmail.com>
 <df966d6e-8898-029f-e697-8496500a1663@amd.com>
 <2550ec4d-a015-4625-ca24-ff10632dbe2e@linux.ibm.com>
 <d3c82708-dd09-80e0-4e9f-1cbab118a169@amd.com>
 <8a4d966c-acc9-b2b7-8ab7-027aefab201c@linux.ibm.com>
From: Kim Phillips <kim.phillips@amd.com>
Message-ID: <f226f4c5-6310-fd6b-ee76-aebd938ec212@amd.com>
Date: Thu, 12 Mar 2020 17:38:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <8a4d966c-acc9-b2b7-8ab7-027aefab201c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM3PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:0:52::32) To SN6PR12MB2845.namprd12.prod.outlook.com
 (2603:10b6:805:75::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.247] (165.204.77.1) by
 DM3PR08CA0022.namprd08.prod.outlook.com (2603:10b6:0:52::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Thu, 12 Mar 2020 22:38:39 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 973c21ca-3420-496b-e232-08d7c6d61d0c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2734:|SN6PR12MB2734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2734959F437410E0112BC91F87FD0@SN6PR12MB2734.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(199004)(31696002)(186003)(16526019)(66946007)(66556008)(54906003)(53546011)(66476007)(6486002)(16576012)(316002)(956004)(2616005)(478600001)(26005)(86362001)(7416002)(44832011)(5660300002)(36756003)(6916009)(52116002)(2906002)(31686004)(81166006)(8676002)(8936002)(81156014)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2734;
 H:SN6PR12MB2845.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXKQXYG3H7IwAa5vyE/euHCgwTpBUI+TcUKsjSIg7DlwyqvjIKCflh5oUb5bklMVK+mLySKlb5hNOuPYA253mDagtvSXjD9aXFW1ZDqhwgMApjm47825UQSmNfjZ/eVR/4p2X3pVApUZMP5KUrwqqke+/6/YR1BD6zFpcG+bzLJxeQs+9VEgkwp88PIuHUH9U5yqpvNWS6XiRb0BO76iJ4dUyyaCLCiqnzxFLKQ43O1SMX7Y3u/dQPjIz6ffzy9TstXhhkEaPO8112nM2et4MfMZXD+G+U++6fOY1e7hgdmS2jnkOCl/YCvZng7J2ST81lKu2TzN8vxQsZhPzm8/Ul8ZbxupdfJR1H3eP3Iw69sn1Df1v/cXsIRNkrq/rJAREb0oUT4cuqDBAbX+c0DpVsPYhFuV2KtTLPBtfwkQkHI8q49OKL+1hoS0RgfOU6Ub
X-MS-Exchange-AntiSpam-MessageData: cgFoneCnDAm+sAU9jCXWLHPCGvPKBSBDF4mcY7g6tz8CxlSG9V6VbomUX3GqfxLPD0XwXt8qfY69mGFgd6yS/uuHFC1sdcj256CO1fwgFplseBhx+izA91uXCHJWLap++C/jaDc0cGqVL2ajvCe6Fw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973c21ca-3420-496b-e232-08d7c6d61d0c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 22:38:41.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULFQqPrkhq7Qvhd3aTwA2rNbpqorn1ZbUrxOVrBAClPUkAAxHdmSG6rgHzOI17WlgHmSGtZ5urR2MgaP02eR1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2734
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

On 3/11/20 11:00 AM, Ravi Bangoria wrote:
> Hi Kim,

Hi Ravi,

> On 3/6/20 3:36 AM, Kim Phillips wrote:
>>> On 3/3/20 3:55 AM, Kim Phillips wrote:
>>>> On 3/2/20 2:21 PM, Stephane Eranian wrote:
>>>>> On Mon, Mar 2, 2020 at 2:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>>>>>
>>>>>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>>>>>> Modern processors export such hazard data in Performance
>>>>>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>>>>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>>>>>> AMD[3] provides similar information.
>>>>>>>
>>>>>>> Implementation detail:
>>>>>>>
>>>>>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>>>>>> If it's set, kernel converts arch specific hazard information
>>>>>>> into generic format:
>>>>>>>
>>>>>>>     struct perf_pipeline_haz_data {
>>>>>>>            /* Instruction/Opcode type: Load, Store, Branch .... */
>>>>>>>            __u8    itype;
>>>>>>>            /* Instruction Cache source */
>>>>>>>            __u8    icache;
>>>>>>>            /* Instruction suffered hazard in pipeline stage */
>>>>>>>            __u8    hazard_stage;
>>>>>>>            /* Hazard reason */
>>>>>>>            __u8    hazard_reason;
>>>>>>>            /* Instruction suffered stall in pipeline stage */
>>>>>>>            __u8    stall_stage;
>>>>>>>            /* Stall reason */
>>>>>>>            __u8    stall_reason;
>>>>>>>            __u16   pad;
>>>>>>>     };
>>>>>>
>>>>>> Kim, does this format indeed work for AMD IBS?
>>>>
>>>> It's not really 1:1, we don't have these separations of stages
>>>> and reasons, for example: we have missed in L2 cache, for example.
>>>> So IBS output is flatter, with more cycle latency figures than
>>>> IBM's AFAICT.
>>>
>>> AMD IBS captures pipeline latency data incase Fetch sampling like the
>>> Fetch latency, tag to retire latency, completion to retire latency and
>>> so on. Yes, Ops sampling do provide more data on load/store centric
>>> information. But it also captures more detailed data for Branch instructions.
>>> And we also looked at ARM SPE, which also captures more details pipeline
>>> data and latency information.
>>>
>>>>> Personally, I don't like the term hazard. This is too IBM Power
>>>>> specific. We need to find a better term, maybe stall or penalty.
>>>>
>>>> Right, IBS doesn't have a filter to only count stalled or otherwise
>>>> bad events.  IBS' PPR descriptions has one occurrence of the
>>>> word stall, and no penalty.  The way I read IBS is it's just
>>>> reporting more sample data than just the precise IP: things like
>>>> hits, misses, cycle latencies, addresses, types, etc., so words
>>>> like 'extended', or the 'auxiliary' already used today even
>>>> are more appropriate for IBS, although I'm the last person to
>>>> bikeshed.
>>>
>>> We are thinking of using "pipeline" word instead of Hazard.
>>
>> Hm, the word 'pipeline' occurs 0 times in IBS documentation.
> 
> NP. We thought pipeline is generic hw term so we proposed "pipeline"
> word. We are open to term which can be generic enough.
> 
>>
>> I realize there are a couple of core pipeline-specific pieces
>> of information coming out of it, but the vast majority
>> are addresses, latencies of various components in the memory
>> hierarchy, and various component hit/miss bits.
> 
> Yes. we should capture core pipeline specific details. For example,
> IBS generates Branch unit information(IbsOpData1) and Icahce related
> data(IbsFetchCtl) which is something that shouldn't be extended as
> part of perf-mem, IMO.

Sure, IBS Op-side output is more 'perf mem' friendly, and so it
should populate perf_mem_data_src fields, just like POWER9 can:

union perf_mem_data_src {
...
                __u64   mem_rsvd:24,
                        mem_snoopx:2,   /* snoop mode, ext */
                        mem_remote:1,   /* remote */
                        mem_lvl_num:4,  /* memory hierarchy level number */
                        mem_dtlb:7,     /* tlb access */
                        mem_lock:2,     /* lock instr */
                        mem_snoop:5,    /* snoop mode */
                        mem_lvl:14,     /* memory hierarchy level */
                        mem_op:5;       /* type of opcode */


E.g., SIER[LDST] SIER[A_XLATE_SRC] can be used to populate
mem_lvl[_num], SIER_TYPE can be used to populate 'mem_op',
'mem_lock', and the Reload Bus Source Encoding bits can
be used to populate mem_snoop, right?

For IBS, I see PERF_SAMPLE_ADDR and PERF_SAMPLE_PHYS_ADDR can be
used for the ld/st target addresses, too.

>> What's needed here is a vendor-specific extended
>> sample information that all these technologies gather,
>> of which things like e.g., 'L1 TLB cycle latency' we
>> all should have in common.
> 
> Yes. We will include fields to capture the latency cycles (like Issue
> latency, Instruction completion latency etc..) along with other pipeline
> details in the proposed structure.

Latency figures are just an example, and from what I
can tell, struct perf_sample_data already has a 'weight' member, 
used with PERF_SAMPLE_WEIGHT, that is used by intel-pt to
transfer memory access latency figures.  Granted, that's
a bad name given all other vendors don't call latency
'weight'.

I didn't see any latency figures coming out of POWER9,
and do not expect this patchseries to implement those
of other vendors, e.g., AMD's IBS; leave each vendor
to amend perf to suit their own h/w output please.

My main point there, however, was that each vendor should
use streamlined record-level code to just copy the data
in the proprietary format that their hardware produces,
and then then perf tooling can synthesize the events
from the raw data at report/script/etc. time.

>> I'm not sure why a new PERF_SAMPLE_PIPELINE_HAZ is needed
>> either.  Can we use PERF_SAMPLE_AUX instead?
> 
> We took a look at PERF_SAMPLE_AUX. IIUC, PERF_SAMPLE_AUX is intended when
> large volume of data needs to be captured as part of perf.data without
> frequent PMIs. But proposed type is to address the capture of pipeline

SAMPLE_AUX shouldn't care whether the volume is large, or how frequent
PMIs are, even though it may be used in those environments.

> information on each sample using PMI at periodic intervals. Hence proposing
> PERF_SAMPLE_PIPELINE_HAZ.

And that's fine for any extra bits that POWER9 has to convey
to its users beyond things already represented by other sample
types like PERF_SAMPLE_DATA_SRC, but the capturing of both POWER9
and other vendor e.g., AMD IBS data can be made vendor-independent
at record time by using SAMPLE_AUX, or SAMPLE_RAW even, which is
what IBS currently uses.

>>  Take a look at
>> commit 98dcf14d7f9c "perf tools: Add kernel AUX area sampling
>> definitions".  The sample identifier can be used to determine
>> which vendor's sampling IP's data is in it, and events can
>> be recorded just by copying the content of the SIER, etc.
>> registers, and then events get synthesized from the aux
>> sample at report/inject/annotate etc. time.  This allows
>> for less sample recording overhead, and moves all the vendor
>> specific decoding and common event conversions for userspace
>> to figure out.
> 
> When AUX buffer data is structured, tool side changes added to present the
> pipeline data can be re-used.

Not sure I understand: AUX data would be structured on
each vendor's raw h/w register formats.

Thanks,

Kim

>>>>> Also worth considering is the support of ARM SPE (Statistical
>>>>> Profiling Extension) which is their version of IBS.
>>>>> Whatever gets added need to cover all three with no limitations.
>>>>
>>>> I thought Intel's various LBR, PEBS, and PT supported providing
>>>> similar sample data in perf already, like with perf mem/c2c?
>>>
>>> perf-mem is more of data centric in my opinion. It is more towards
>>> memory profiling. So proposal here is to expose pipeline related
>>> details like stalls and latencies.
>>
>> Like I said, I don't see it that way, I see it as "any particular
>> vendor's event's extended details', and these pipeline details
>> have overlap with existing infrastructure within perf, e.g., L2
>> cache misses.
>>
>> Kim
>>
> 
