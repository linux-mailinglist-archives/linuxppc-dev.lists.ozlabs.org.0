Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0018A1A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 18:37:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jHKv724wzDr2r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 04:37:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam11-co1-obe.outbound.protection.outlook.com
 (client-ip=40.107.220.49; helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=kim.phillips@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=n31xjwa0; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jHJK16PTzDqwt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 04:36:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU7A9oNPqnZy6zS6ZTC+iyVmVhgh96TApqG5Q0d2DHfbCpD4Y4umOyd8XlplfN4UJuwStepnXi076sImESSJf9vpbXad1c3EoWIy6tNBsF0721R3vu6tgj+d7PFH/5uxSPiB6nu3PtFJ6aTG3uTUEh1qmJUFIuqmW9rVT1BBwQr5Nf5Ss4oUNj89y5ufwLdNgK4SMqgtYYWwX8MdDF9/IflciLWTF/D+StMskrI9qP6vM3yMe/qPYgYRsle1XAdXxAwguuu+Ph0zitN3D8jPThNij+PEscmaUIpQ4qFSmisLlrgF/V8KZyjpvhQ8jMWL4R+Rlbs4Ps12PFj77Re4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CkXXnUXmwtBbdQzGmh5nd7fbu4EJQyb9XMEXNgRISM=;
 b=SuDCEdxGQba0BYIHOlhJ2s30LtnPMWNd1ghviwe/JP9EQM+FfN+QM8aZ4U2Mhn1AczcCLHw4VNS6NjXy3AF+rty9F4px6ZakHGNfF92DNzrwWPAmyzOBM2icnfMgz+EQYqMzCixPRoAeIUX0kvn543/LBVhB4RuhiON2Kmg/vr6M+qWNEa8JvRZHepEVep5ILaX9VGcGQgJPMR7MawtcmMxConmHGTZwF6C+xT4JCNI6KxMQO93YSW/RCxyBgOAi8W5Ly+r7zxXDHE+1In5M/Ey8q3xFMVkMCVNV1PVjmN6OxnRLfqypSAj8NgLtEMstRd/VrmVfBsIXr0bylRzqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CkXXnUXmwtBbdQzGmh5nd7fbu4EJQyb9XMEXNgRISM=;
 b=n31xjwa02FbiXtzr3nE7E8VHstZpVCDM1uGgFj/PtkYDXe8P7Fjkd9Dq5T85zSmem1fQlS6UwNjJAXTpnIpb6Lh3VIJ5a7sy246WrRWLu4LzloOZxBmtGY904LL4AoSVvG+xGt7XBm3nzKFi8K7N2sWnlAgKEYv78tfi4v5KaEQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=kim.phillips@amd.com; 
Received: from SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 by SN6PR12MB2766.namprd12.prod.outlook.com (2603:10b6:805:78::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19; Wed, 18 Mar
 2020 17:35:23 +0000
Received: from SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b]) by SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b%7]) with mapi id 15.20.2814.019; Wed, 18 Mar 2020
 17:35:23 +0000
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
From: Kim Phillips <kim.phillips@amd.com>
Message-ID: <8803550e-5d6d-2eda-39f5-e4594052188c@amd.com>
Date: Wed, 18 Mar 2020 12:35:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <0c5e94a3-e86e-f7cb-d668-d542b3a8ae29@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN6PR1201CA0003.namprd12.prod.outlook.com
 (2603:10b6:405:4c::13) To SN6PR12MB2845.namprd12.prod.outlook.com
 (2603:10b6:805:75::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.4.17] (165.204.84.11) by
 BN6PR1201CA0003.namprd12.prod.outlook.com (2603:10b6:405:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Wed, 18 Mar 2020 17:35:20 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 082f63c9-7a5c-4a3a-6921-08d7cb62bcb5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2766:|SN6PR12MB2766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27660F799A67129B26C7940687F70@SN6PR12MB2766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(2616005)(956004)(31686004)(4326008)(2906002)(7416002)(26005)(186003)(44832011)(16526019)(478600001)(66946007)(6486002)(66476007)(110136005)(66556008)(54906003)(86362001)(5660300002)(31696002)(52116002)(53546011)(8676002)(36756003)(81166006)(81156014)(316002)(8936002)(16576012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2766;
 H:SN6PR12MB2845.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDm37z0L3Wqg/NDwpgfC1C0xqmmxrZXPp1spAkzNGjUUi7DXEi4PDuvB6gWsiTEcw0Wkn5B4YjUVDZis0nds84P6jBwud6ZndUjAY93cqGvJDGXH98niGe7aijDRsS8jILFyix8EGHh4+BWvuudBK3ji0OqQN+PZ41WA2h7HMSjXpSzdxj+DGeCf3kvB/L1R2MPxdOnLfJhT8mJU+zRROoU/W7kleebfX7vVuJvh2RyQbMeYi+rnK9+h3aAW7iQ9fX+hD2/uVrc8IrYbnrCByFQbsqTYLJjzph8+VHJkwPzI4o0lwl6ojOT2H+u7vV6rofiCgPX3UXx7TJwYAKq+QBg9tLGNbNQkN6Tv/iNMqUy0iAYlK2+sEZv7Bl3P02TTfV5uZXMKlzXuOW6U1hxZw+qCeaAdyjf5sFRcJgAjRyL9rJzvaiCjD83D51uzuIls
X-MS-Exchange-AntiSpam-MessageData: pASXu1u3JE5y9Ye/OaUy68aIX+dN9XPomRvrfnbWgMa+FJPS8LCWH3KNP/zOVf6yocNyWCEpi+8Mhj0aIUG/ZUubAHgqmy6ZRkoZVnw94D7FKaqio2Re4fBnpIHg431/+CdKkIde2jYphRUKCY/aHA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082f63c9-7a5c-4a3a-6921-08d7cb62bcb5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 17:35:23.4499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1yXH4ZwzZI8SsOnW9TaezoS1AOexK/8ly2+5nIVoPALlgLThchHziuOVORQZODZvCNu2W6r4pOQlGUXs7zE5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2766
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

Hi Maddy,

On 3/17/20 1:50 AM, maddy wrote:
> On 3/13/20 4:08 AM, Kim Phillips wrote:
>> On 3/11/20 11:00 AM, Ravi Bangoria wrote:
>>> On 3/6/20 3:36 AM, Kim Phillips wrote:
>>>>> On 3/3/20 3:55 AM, Kim Phillips wrote:
>>>>>> On 3/2/20 2:21 PM, Stephane Eranian wrote:
>>>>>>> On Mon, Mar 2, 2020 at 2:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>>>>>>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>>>>>>>> Modern processors export such hazard data in Performance
>>>>>>>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>>>>>>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>>>>>>>> AMD[3] provides similar information.
>>>>>>>>>
>>>>>>>>> Implementation detail:
>>>>>>>>>
>>>>>>>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>>>>>>>> If it's set, kernel converts arch specific hazard information
>>>>>>>>> into generic format:
>>>>>>>>>
>>>>>>>>>      struct perf_pipeline_haz_data {
>>>>>>>>>             /* Instruction/Opcode type: Load, Store, Branch .... */
>>>>>>>>>             __u8    itype;
>>>>>>>>>             /* Instruction Cache source */
>>>>>>>>>             __u8    icache;
>>>>>>>>>             /* Instruction suffered hazard in pipeline stage */
>>>>>>>>>             __u8    hazard_stage;
>>>>>>>>>             /* Hazard reason */
>>>>>>>>>             __u8    hazard_reason;
>>>>>>>>>             /* Instruction suffered stall in pipeline stage */
>>>>>>>>>             __u8    stall_stage;
>>>>>>>>>             /* Stall reason */
>>>>>>>>>             __u8    stall_reason;
>>>>>>>>>             __u16   pad;
>>>>>>>>>      };
>>>>>>>> Kim, does this format indeed work for AMD IBS?
>>>>>> It's not really 1:1, we don't have these separations of stages
>>>>>> and reasons, for example: we have missed in L2 cache, for example.
>>>>>> So IBS output is flatter, with more cycle latency figures than
>>>>>> IBM's AFAICT.
>>>>> AMD IBS captures pipeline latency data incase Fetch sampling like the
>>>>> Fetch latency, tag to retire latency, completion to retire latency and
>>>>> so on. Yes, Ops sampling do provide more data on load/store centric
>>>>> information. But it also captures more detailed data for Branch instructions.
>>>>> And we also looked at ARM SPE, which also captures more details pipeline
>>>>> data and latency information.
>>>>>
>>>>>>> Personally, I don't like the term hazard. This is too IBM Power
>>>>>>> specific. We need to find a better term, maybe stall or penalty.
>>>>>> Right, IBS doesn't have a filter to only count stalled or otherwise
>>>>>> bad events.  IBS' PPR descriptions has one occurrence of the
>>>>>> word stall, and no penalty.  The way I read IBS is it's just
>>>>>> reporting more sample data than just the precise IP: things like
>>>>>> hits, misses, cycle latencies, addresses, types, etc., so words
>>>>>> like 'extended', or the 'auxiliary' already used today even
>>>>>> are more appropriate for IBS, although I'm the last person to
>>>>>> bikeshed.
>>>>> We are thinking of using "pipeline" word instead of Hazard.
>>>> Hm, the word 'pipeline' occurs 0 times in IBS documentation.
>>> NP. We thought pipeline is generic hw term so we proposed "pipeline"
>>> word. We are open to term which can be generic enough.
>>>
>>>> I realize there are a couple of core pipeline-specific pieces
>>>> of information coming out of it, but the vast majority
>>>> are addresses, latencies of various components in the memory
>>>> hierarchy, and various component hit/miss bits.
>>> Yes. we should capture core pipeline specific details. For example,
>>> IBS generates Branch unit information(IbsOpData1) and Icahce related
>>> data(IbsFetchCtl) which is something that shouldn't be extended as
>>> part of perf-mem, IMO.
>> Sure, IBS Op-side output is more 'perf mem' friendly, and so it
>> should populate perf_mem_data_src fields, just like POWER9 can:
>>
>> union perf_mem_data_src {
>> ...
>>                  __u64   mem_rsvd:24,
>>                          mem_snoopx:2,   /* snoop mode, ext */
>>                          mem_remote:1,   /* remote */
>>                          mem_lvl_num:4,  /* memory hierarchy level number */
>>                          mem_dtlb:7,     /* tlb access */
>>                          mem_lock:2,     /* lock instr */
>>                          mem_snoop:5,    /* snoop mode */
>>                          mem_lvl:14,     /* memory hierarchy level */
>>                          mem_op:5;       /* type of opcode */
>>
>>
>> E.g., SIER[LDST] SIER[A_XLATE_SRC] can be used to populate
>> mem_lvl[_num], SIER_TYPE can be used to populate 'mem_op',
>> 'mem_lock', and the Reload Bus Source Encoding bits can
>> be used to populate mem_snoop, right?
> Hi Kim,
> 
> Yes. We do expose these data as part of perf-mem for POWER.

OK, I see relevant PERF_MEM_S bits in arch/powerpc/perf/isa207-common.c:
isa207_find_source now, thanks.

>> For IBS, I see PERF_SAMPLE_ADDR and PERF_SAMPLE_PHYS_ADDR can be
>> used for the ld/st target addresses, too.
>>
>>>> What's needed here is a vendor-specific extended
>>>> sample information that all these technologies gather,
>>>> of which things like e.g., 'L1 TLB cycle latency' we
>>>> all should have in common.
>>> Yes. We will include fields to capture the latency cycles (like Issue
>>> latency, Instruction completion latency etc..) along with other pipeline
>>> details in the proposed structure.
>> Latency figures are just an example, and from what I
>> can tell, struct perf_sample_data already has a 'weight' member,
>> used with PERF_SAMPLE_WEIGHT, that is used by intel-pt to
>> transfer memory access latency figures.  Granted, that's
>> a bad name given all other vendors don't call latency
>> 'weight'.
>>
>> I didn't see any latency figures coming out of POWER9,
>> and do not expect this patchseries to implement those
>> of other vendors, e.g., AMD's IBS; leave each vendor
>> to amend perf to suit their own h/w output please.
> 
> Reference structure proposed in this patchset did not have members
> to capture latency info for that exact reason. But idea here is to
> abstract  as vendor specific as possible. So if we include u16 array,
> then this format can also capture data from IBS since it provides
> few latency details.

OK, that sounds a bit different from the 6 x u8's + 1 u16 padded
struct presented in this patchset.

IBS Ops can report e.g.:

15 tag-to-retire cycles bits,
15 completion to retire count bits,
15 L1 DTLB refill latency bits,
15 DC miss latency bits,
5 outstanding memory requests on mem refill bits, and so on.

IBS Fetch reports 15 bits of fetch latency, and another 16
for iTLB latency, among others.

Some of these may/may not be valid simultaneously, and
there are IBS specific rules to establish validity.

>> My main point there, however, was that each vendor should
>> use streamlined record-level code to just copy the data
>> in the proprietary format that their hardware produces,
>> and then then perf tooling can synthesize the events
>> from the raw data at report/script/etc. time.
>>
>>>> I'm not sure why a new PERF_SAMPLE_PIPELINE_HAZ is needed
>>>> either.  Can we use PERF_SAMPLE_AUX instead?
>>> We took a look at PERF_SAMPLE_AUX. IIUC, PERF_SAMPLE_AUX is intended when
>>> large volume of data needs to be captured as part of perf.data without
>>> frequent PMIs. But proposed type is to address the capture of pipeline
>> SAMPLE_AUX shouldn't care whether the volume is large, or how frequent
>> PMIs are, even though it may be used in those environments.
>>
>>> information on each sample using PMI at periodic intervals. Hence proposing
>>> PERF_SAMPLE_PIPELINE_HAZ.
>> And that's fine for any extra bits that POWER9 has to convey
>> to its users beyond things already represented by other sample
>> types like PERF_SAMPLE_DATA_SRC, but the capturing of both POWER9
>> and other vendor e.g., AMD IBS data can be made vendor-independent
>> at record time by using SAMPLE_AUX, or SAMPLE_RAW even, which is
>> what IBS currently uses.
> 
> My bad. Not sure what you mean by this. We are trying to abstract
> as much vendor specific data as possible with this (like perf-mem).

Perhaps if I say it this way: instead of doing all the 
isa207_get_phazard_data() work past the mfspr(SPRN_SIER)
in patch 4/11, rather/instead just put the raw sier value in a 
PERF_SAMPLE_RAW or _AUX event, and call perf_event_update_userpage.
Specific SIER capabilities can be written as part of the perf.data
header.  Then synthesize the true pipe events from the raw SIER
values later, and in userspace.

I guess it's technically optional, but I think that's how
I'd do it in IBS, since it minimizes the record-time overhead.

Thanks,

Kim

> Maddy
>>
>>>>   Take a look at
>>>> commit 98dcf14d7f9c "perf tools: Add kernel AUX area sampling
>>>> definitions".  The sample identifier can be used to determine
>>>> which vendor's sampling IP's data is in it, and events can
>>>> be recorded just by copying the content of the SIER, etc.
>>>> registers, and then events get synthesized from the aux
>>>> sample at report/inject/annotate etc. time.  This allows
>>>> for less sample recording overhead, and moves all the vendor
>>>> specific decoding and common event conversions for userspace
>>>> to figure out.
>>> When AUX buffer data is structured, tool side changes added to present the
>>> pipeline data can be re-used.
>> Not sure I understand: AUX data would be structured on
>> each vendor's raw h/w register formats.
>>
>> Thanks,
>>
>> Kim
>>
>>>>>>> Also worth considering is the support of ARM SPE (Statistical
>>>>>>> Profiling Extension) which is their version of IBS.
>>>>>>> Whatever gets added need to cover all three with no limitations.
>>>>>> I thought Intel's various LBR, PEBS, and PT supported providing
>>>>>> similar sample data in perf already, like with perf mem/c2c?
>>>>> perf-mem is more of data centric in my opinion. It is more towards
>>>>> memory profiling. So proposal here is to expose pipeline related
>>>>> details like stalls and latencies.
>>>> Like I said, I don't see it that way, I see it as "any particular
>>>> vendor's event's extended details', and these pipeline details
>>>> have overlap with existing infrastructure within perf, e.g., L2
>>>> cache misses.
>>>>
>>>> Kim
>>>>
> 
