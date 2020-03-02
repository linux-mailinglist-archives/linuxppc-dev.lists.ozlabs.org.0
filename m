Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C76031765A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 22:13:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WXtT4l02zDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 08:13:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WXrn32FzzDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 08:11:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022KqXpX156668; Mon, 2 Mar 2020 16:08:15 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfjf4bjd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 16:08:15 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 022KtwmB168744;
 Mon, 2 Mar 2020 16:08:14 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfjf4bjct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 16:08:14 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 022L4pRX023307;
 Mon, 2 Mar 2020 21:08:14 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2yffk5wd3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 21:08:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022L8D6O41484636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 21:08:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A741AE05F;
 Mon,  2 Mar 2020 21:08:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10578AE05C;
 Mon,  2 Mar 2020 21:08:12 +0000 (GMT)
Received: from oc3272150783.ibm.com (unknown [9.160.73.190])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  2 Mar 2020 21:08:11 +0000 (GMT)
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
From: Paul Clarke <pc@us.ibm.com>
Message-ID: <91026159-1e83-6efd-c624-464b12b18b5c@us.ibm.com>
Date: Mon, 2 Mar 2020 15:08:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_08:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020137
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
Cc: mark.rutland@arm.com, ak@linux.intel.com, peterz@infradead.org,
 alexey.budankov@linux.intel.com, adrian.hunter@intel.com, acme@kernel.org,
 alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com,
 maddy@linux.ibm.com, paulus@samba.org, eranian@google.com,
 robert.richter@amd.com, namhyung@kernel.org, kim.phillips@amd.com,
 jolsa@redhat.com, mingo@redhat.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/1/20 11:23 PM, Ravi Bangoria wrote:
> Most modern microprocessors employ complex instruction execution
> pipelines such that many instructions can be 'in flight' at any
> given point in time. Various factors affect this pipeline and
> hazards are the primary among them. Different types of hazards
> exist - Data hazards, Structural hazards and Control hazards.
> Data hazard is the case where data dependencies exist between
> instructions in different stages in the pipeline. Structural
> hazard is when the same processor hardware is needed by more
> than one instruction in flight at the same time. Control hazards
> are more the branch misprediction kinds. 
> 
> Information about these hazards are critical towards analyzing
> performance issues and also to tune software to overcome such
> issues. Modern processors export such hazard data in Performance
> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
> AMD[3] provides similar information.
> 
> Implementation detail:
> 
> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
> If it's set, kernel converts arch specific hazard information
> into generic format:
> 
>   struct perf_pipeline_haz_data {
>          /* Instruction/Opcode type: Load, Store, Branch .... */
>          __u8    itype;

At the risk of bike-shedding (in an RFC, no less), "itype" doesn't convey enough meaning to me.  "inst_type"?  I see in 03/11, you use "perf_inst_type".

>          /* Instruction Cache source */
>          __u8    icache;

Possibly same here, and you use "perf_inst_cache" in 03/11.

>          /* Instruction suffered hazard in pipeline stage */
>          __u8    hazard_stage;
>          /* Hazard reason */
>          __u8    hazard_reason;
>          /* Instruction suffered stall in pipeline stage */
>          __u8    stall_stage;
>          /* Stall reason */
>          __u8    stall_reason;
>          __u16   pad;
>   };
> 
> ... which can be read by user from mmap() ring buffer. With this
> approach, sample perf report in hazard mode looks like (On IBM
> PowerPC):
> 
>   # ./perf record --hazard ./ebizzy
>   # ./perf report --hazard
>   Overhead  Symbol          Shared  Instruction Type  Hazard Stage   Hazard Reason         Stall Stage   Stall Reason  ICache access
>     36.58%  [.] thread_run  ebizzy  Load              LSU            Mispredict            LSU           Load fin      L1 hit
>      9.46%  [.] thread_run  ebizzy  Load              LSU            Mispredict            LSU           Dcache_miss   L1 hit
>      1.76%  [.] thread_run  ebizzy  Fixed point       -              -                     -             -             L1 hit
>      1.31%  [.] thread_run  ebizzy  Load              LSU            ERAT Miss             LSU           Load fin      L1 hit
>      1.27%  [.] thread_run  ebizzy  Load              LSU            Mispredict            -             -             L1 hit
>      1.16%  [.] thread_run  ebizzy  Fixed point       -              -                     FXU           Fixed cycle   L1 hit
>      0.50%  [.] thread_run  ebizzy  Fixed point       ISU            Source Unavailable    FXU           Fixed cycle   L1 hit
>      0.30%  [.] thread_run  ebizzy  Load              LSU            LMQ Full, DERAT Miss  LSU           Load fin      L1 hit
>      0.24%  [.] thread_run  ebizzy  Load              LSU            ERAT Miss             -             -             L1 hit
>      0.08%  [.] thread_run  ebizzy  -                 -              -                     BRU           Fixed cycle   L1 hit
>      0.05%  [.] thread_run  ebizzy  Branch            -              -                     BRU           Fixed cycle   L1 hit
>      0.04%  [.] thread_run  ebizzy  Fixed point       ISU            Source Unavailable    -             -             L1 hit

How are these to be interpreted?  This is great information, but is it possible to make it more readable for non-experts?  If each of these map 1:1 with hardware events, should you emit the name of the event here, so that can be used to look up further information?  For example, does the first line map to PM_CMPLU_STALL_LSU_FIN?
What was "Mispredict[ed]"? (Is it different from a branch misprediction?) And how does this relate to "L1 hit"?
Can we emit "Load finish" instead of "Load fin" for easier reading?  03/11 also has "Marked fin before NTC".
Nit: why does "Dcache_miss" have an underscore and none of the others?

> Also perf annotate with hazard data:

>          │    static int
>          │    compare(const void *p1, const void *p2)
>          │    {
>    33.23 │      std    r31,-8(r1)
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
>          │       {haz_stage: LSU, haz_reason: Load Hit Store, stall_stage: LSU, stall_reason: -, icache: L3 hit}
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: -, stall_reason: -, icache: L1 hit}
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
>     0.84 │      stdu   r1,-64(r1)
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: -, stall_reason: -, icache: L1 hit}
>     0.24 │      mr     r31,r1
>          │       {haz_stage: -, haz_reason: -, stall_stage: -, stall_reason: -, icache: L1 hit}
>    21.18 │      std    r3,32(r31)
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
>          │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
> 
> 
> Patches:
>  - Patch #1 is a simple cleanup patch
>  - Patch #2, #3, #4 implements generic and arch specific kernel
>    infrastructure
>  - Patch #5 enables perf record and script with hazard mode
>  - Patch #6, #7, #8 enables perf report with hazard mode
>  - Patch #9, #10, #11 enables perf annotate with hazard mode
> 
> Note:
>  - This series is based on the talk by Madhavan in LPC 2018[4]. This is
>    just an early RFC to get comments about the approach and not intended
>    to be merged yet.
>  - I've prepared the series base on v5.6-rc3. But it depends on generic
>    perf annotate fixes [5][6] which are already merged by Arnaldo in
>    perf/urgent and perf/core.
> 
> [1]: Book III, Section 9.4.10:
>      https://openpowerfoundation.org/?resource_lib=power-isa-version-3-0 
> [2]: https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf#G9.1106986

This document is also available from the "IBM Portal for OpenPOWER" under the "All IBM Material for OpenPOWER" https://www-355.ibm.com/systems/power/openpower/tgcmDocumentRepository.xhtml?aliasId=OpenPOWER, under each of the individual modules.  (Well hidden, it might be said, and not a simple link like you have here.)

> [3]: https://www.amd.com/system/files/TechDocs/24593.pdf#G19.1089550
> [4]: https://linuxplumbersconf.org/event/2/contributions/76/
> [5]: http://lore.kernel.org/r/20200204045233.474937-1-ravi.bangoria@linux.ibm.com
> [6]: http://lore.kernel.org/r/20200213064306.160480-1-ravi.bangoria@linux.ibm.com

PC
