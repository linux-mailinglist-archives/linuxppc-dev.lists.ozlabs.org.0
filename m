Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9581B0350
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:44:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495JcV6H14zDqFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:44:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495Hrj5cT0zDqsH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:09:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K7381Q013996
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:09:54 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghu5f44a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:09:53 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.ibm.com>;
 Mon, 20 Apr 2020 08:09:02 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:08:55 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K79iLo49414164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:09:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37B5F4C044;
 Mon, 20 Apr 2020 07:09:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14C914C04A;
 Mon, 20 Apr 2020 07:09:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.59.237])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 07:09:35 +0000 (GMT)
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: Kim Phillips <kim.phillips@amd.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
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
 <ee86b3e9-9e6e-8601-b381-9556cb7b67de@amd.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Date: Mon, 20 Apr 2020 12:39:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ee86b3e9-9e6e-8601-b381-9556cb7b67de@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20042007-0020-0000-0000-000003CB0D68
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-0021-0000-0000-00002223FF18
Message-Id: <960e39ae-4d9a-05e5-9fbc-0a11706dce70@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200058
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



On 3/27/20 1:18 AM, Kim Phillips wrote:
>
> On 3/26/20 5:19 AM, maddy wrote:
>>
>> On 3/18/20 11:05 PM, Kim Phillips wrote:
>>> Hi Maddy,
>>>
>>> On 3/17/20 1:50 AM, maddy wrote:
>>>> On 3/13/20 4:08 AM, Kim Phillips wrote:
>>>>> On 3/11/20 11:00 AM, Ravi Bangoria wrote:
>>>>>> On 3/6/20 3:36 AM, Kim Phillips wrote:
>>>>>>>> On 3/3/20 3:55 AM, Kim Phillips wrote:
>>>>>>>>> On 3/2/20 2:21 PM, Stephane Eranian wrote:
>>>>>>>>>> On Mon, Mar 2, 2020 at 2:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>>>>>>>>>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>>>>>>>>>>> Modern processors export such hazard data in Performance
>>>>>>>>>>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>>>>>>>>>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>>>>>>>>>>> AMD[3] provides similar information.
>>>>>>>>>>>>
>>>>>>>>>>>> Implementation detail:
>>>>>>>>>>>>
>>>>>>>>>>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>>>>>>>>>>> If it's set, kernel converts arch specific hazard information
>>>>>>>>>>>> into generic format:
>>>>>>>>>>>>
>>>>>>>>>>>>        struct perf_pipeline_haz_data {
>>>>>>>>>>>>               /* Instruction/Opcode type: Load, Store, Branch .... */
>>>>>>>>>>>>               __u8    itype;
>>>>>>>>>>>>               /* Instruction Cache source */
>>>>>>>>>>>>               __u8    icache;
>>>>>>>>>>>>               /* Instruction suffered hazard in pipeline stage */
>>>>>>>>>>>>               __u8    hazard_stage;
>>>>>>>>>>>>               /* Hazard reason */
>>>>>>>>>>>>               __u8    hazard_reason;
>>>>>>>>>>>>               /* Instruction suffered stall in pipeline stage */
>>>>>>>>>>>>               __u8    stall_stage;
>>>>>>>>>>>>               /* Stall reason */
>>>>>>>>>>>>               __u8    stall_reason;
>>>>>>>>>>>>               __u16   pad;
>>>>>>>>>>>>        };
>>>>>>>>>>> Kim, does this format indeed work for AMD IBS?
>>>>>>>>> It's not really 1:1, we don't have these separations of stages
>>>>>>>>> and reasons, for example: we have missed in L2 cache, for example.
>>>>>>>>> So IBS output is flatter, with more cycle latency figures than
>>>>>>>>> IBM's AFAICT.
>>>>>>>> AMD IBS captures pipeline latency data incase Fetch sampling like the
>>>>>>>> Fetch latency, tag to retire latency, completion to retire latency and
>>>>>>>> so on. Yes, Ops sampling do provide more data on load/store centric
>>>>>>>> information. But it also captures more detailed data for Branch instructions.
>>>>>>>> And we also looked at ARM SPE, which also captures more details pipeline
>>>>>>>> data and latency information.
>>>>>>>>
>>>>>>>>>> Personally, I don't like the term hazard. This is too IBM Power
>>>>>>>>>> specific. We need to find a better term, maybe stall or penalty.
>>>>>>>>> Right, IBS doesn't have a filter to only count stalled or otherwise
>>>>>>>>> bad events.  IBS' PPR descriptions has one occurrence of the
>>>>>>>>> word stall, and no penalty.  The way I read IBS is it's just
>>>>>>>>> reporting more sample data than just the precise IP: things like
>>>>>>>>> hits, misses, cycle latencies, addresses, types, etc., so words
>>>>>>>>> like 'extended', or the 'auxiliary' already used today even
>>>>>>>>> are more appropriate for IBS, although I'm the last person to
>>>>>>>>> bikeshed.
>>>>>>>> We are thinking of using "pipeline" word instead of Hazard.
>>>>>>> Hm, the word 'pipeline' occurs 0 times in IBS documentation.
>>>>>> NP. We thought pipeline is generic hw term so we proposed "pipeline"
>>>>>> word. We are open to term which can be generic enough.
>>>>>>
>>>>>>> I realize there are a couple of core pipeline-specific pieces
>>>>>>> of information coming out of it, but the vast majority
>>>>>>> are addresses, latencies of various components in the memory
>>>>>>> hierarchy, and various component hit/miss bits.
>>>>>> Yes. we should capture core pipeline specific details. For example,
>>>>>> IBS generates Branch unit information(IbsOpData1) and Icahce related
>>>>>> data(IbsFetchCtl) which is something that shouldn't be extended as
>>>>>> part of perf-mem, IMO.
>>>>> Sure, IBS Op-side output is more 'perf mem' friendly, and so it
>>>>> should populate perf_mem_data_src fields, just like POWER9 can:
>>>>>
>>>>> union perf_mem_data_src {
>>>>> ...
>>>>>                    __u64   mem_rsvd:24,
>>>>>                            mem_snoopx:2,   /* snoop mode, ext */
>>>>>                            mem_remote:1,   /* remote */
>>>>>                            mem_lvl_num:4,  /* memory hierarchy level number */
>>>>>                            mem_dtlb:7,     /* tlb access */
>>>>>                            mem_lock:2,     /* lock instr */
>>>>>                            mem_snoop:5,    /* snoop mode */
>>>>>                            mem_lvl:14,     /* memory hierarchy level */
>>>>>                            mem_op:5;       /* type of opcode */
>>>>>
>>>>>
>>>>> E.g., SIER[LDST] SIER[A_XLATE_SRC] can be used to populate
>>>>> mem_lvl[_num], SIER_TYPE can be used to populate 'mem_op',
>>>>> 'mem_lock', and the Reload Bus Source Encoding bits can
>>>>> be used to populate mem_snoop, right?
>>>> Hi Kim,
>>>>
>>>> Yes. We do expose these data as part of perf-mem for POWER.
>>> OK, I see relevant PERF_MEM_S bits in arch/powerpc/perf/isa207-common.c:
>>> isa207_find_source now, thanks.
>>>
>>>>> For IBS, I see PERF_SAMPLE_ADDR and PERF_SAMPLE_PHYS_ADDR can be
>>>>> used for the ld/st target addresses, too.
>>>>>
>>>>>>> What's needed here is a vendor-specific extended
>>>>>>> sample information that all these technologies gather,
>>>>>>> of which things like e.g., 'L1 TLB cycle latency' we
>>>>>>> all should have in common.
>>>>>> Yes. We will include fields to capture the latency cycles (like Issue
>>>>>> latency, Instruction completion latency etc..) along with other pipeline
>>>>>> details in the proposed structure.
>>>>> Latency figures are just an example, and from what I
>>>>> can tell, struct perf_sample_data already has a 'weight' member,
>>>>> used with PERF_SAMPLE_WEIGHT, that is used by intel-pt to
>>>>> transfer memory access latency figures.  Granted, that's
>>>>> a bad name given all other vendors don't call latency
>>>>> 'weight'.
>>>>>
>>>>> I didn't see any latency figures coming out of POWER9,
>>>>> and do not expect this patchseries to implement those
>>>>> of other vendors, e.g., AMD's IBS; leave each vendor
>>>>> to amend perf to suit their own h/w output please.
>>>> Reference structure proposed in this patchset did not have members
>>>> to capture latency info for that exact reason. But idea here is to
>>>> abstract  as vendor specific as possible. So if we include u16 array,
>>>> then this format can also capture data from IBS since it provides
>>>> few latency details.
>>> OK, that sounds a bit different from the 6 x u8's + 1 u16 padded
>>> struct presented in this patchset.
>>>
>>> IBS Ops can report e.g.:
>>>
>>> 15 tag-to-retire cycles bits,
>>> 15 completion to retire count bits,
>>> 15 L1 DTLB refill latency bits,
>>> 15 DC miss latency bits,
>>> 5 outstanding memory requests on mem refill bits, and so on.
>>>
>>> IBS Fetch reports 15 bits of fetch latency, and another 16
>>> for iTLB latency, among others.
>>>
>>> Some of these may/may not be valid simultaneously, and
>>> there are IBS specific rules to establish validity.
>>>
>>>>> My main point there, however, was that each vendor should
>>>>> use streamlined record-level code to just copy the data
>>>>> in the proprietary format that their hardware produces,
>>>>> and then then perf tooling can synthesize the events
>>>>> from the raw data at report/script/etc. time.
>>>>>
>>>>>>> I'm not sure why a new PERF_SAMPLE_PIPELINE_HAZ is needed
>>>>>>> either.  Can we use PERF_SAMPLE_AUX instead?
>>>>>> We took a look at PERF_SAMPLE_AUX. IIUC, PERF_SAMPLE_AUX is intended when
>>>>>> large volume of data needs to be captured as part of perf.data without
>>>>>> frequent PMIs. But proposed type is to address the capture of pipeline
>>>>> SAMPLE_AUX shouldn't care whether the volume is large, or how frequent
>>>>> PMIs are, even though it may be used in those environments.
>>>>>
>>>>>> information on each sample using PMI at periodic intervals. Hence proposing
>>>>>> PERF_SAMPLE_PIPELINE_HAZ.
>>>>> And that's fine for any extra bits that POWER9 has to convey
>>>>> to its users beyond things already represented by other sample
>>>>> types like PERF_SAMPLE_DATA_SRC, but the capturing of both POWER9
>>>>> and other vendor e.g., AMD IBS data can be made vendor-independent
>>>>> at record time by using SAMPLE_AUX, or SAMPLE_RAW even, which is
>>>>> what IBS currently uses.
>>>> My bad. Not sure what you mean by this. We are trying to abstract
>>>> as much vendor specific data as possible with this (like perf-mem).
>>> Perhaps if I say it this way: instead of doing all the
>>> isa207_get_phazard_data() work past the mfspr(SPRN_SIER)
>>> in patch 4/11, rather/instead just put the raw sier value in a
>>> PERF_SAMPLE_RAW or _AUX event, and call perf_event_update_userpage.
>>> Specific SIER capabilities can be written as part of the perf.data
>>> header.  Then synthesize the true pipe events from the raw SIER
>>> values later, and in userspace.
>> Hi Kim,
>>
>> Would like to stay away from SAMPLE_RAW type for these comments in perf_events.h
>>
>> *      #
>> *      # The RAW record below is opaque data wrt the ABI
>> *      #
>> *      # That is, the ABI doesn't make any promises wrt to
>> *      # the stability of its content, it may vary depending
>> *      # on event, hardware, kernel version and phase of
>> *      # the moon.
>> *      #
>> *      # In other words, PERF_SAMPLE_RAW contents are not an ABI.
>> *      #
> The "it may vary depending on ... hardware" clause makes it sound
> appropriate for the use-case where the raw hardware register contents
> are copied directly into the user buffer.


Hi Kim,

Sorry for the delayed response.

But perf tool side needs infrastructure to handle the raw sample
data from cpu-pmu (used by tracepoints). I am not sure whether
his is the approach we should look here.

peterz any comments?

>
>> Secondly, sorry I didn't understand your suggestion about using PERF_SAMPLE_AUX.
>> IIUC, SAMPLE_AUX will go to AUX ring buffer, which is more memory and more
>> challenging when correlating and presenting the pipeline details for each IP.
>> IMO, having a new sample type can be useful to capture the pipeline data
>> both in perf_sample_data and if _AUX is enabled, can be made to push to
>> AUX buffer.
> OK, I didn't think SAMPLE_AUX and the aux ring buffer were
> interdependent, sorry.
>
> Thanks,
>
> Kim

