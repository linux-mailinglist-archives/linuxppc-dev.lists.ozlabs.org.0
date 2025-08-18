Return-Path: <linuxppc-dev+bounces-11109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E196EB2B41B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 00:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5S9P2JlXz307q;
	Tue, 19 Aug 2025 08:31:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755528117;
	cv=none; b=iNYr2rdEwtDR50Rg5bUHqDT8FpRxZnjtr5Dm0SwlL+0MkI8ot2dTDQPq1ANcTx39lD6mVVEH43d9ObQCmVc/XeYu5jv/TPl9JIYT42r4hI9NjilRtBVgFuNGYBfXtnqX1Z6xvWUWLUGi7hYQRDkyeas+2wPd8arV927edhCbuCmRwpq4tuuw07CInJBEZArN1Xu/bEWdZ48ZP9uWf08Bq03enRRcKqn0P0RhsDIotSmt02b21pP2See4XRBbRohA7sb4P09wgO6J1uw6d5+mKEcaHo346evgICh06lEnLXmMXzY1xgGI06bJ6Ib8hpo6UJsWX1C4leIL21ZSuSTNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755528117; c=relaxed/relaxed;
	bh=NDECN2hxmFhNM8l6UKmoQmN7m91gbZbYgvduBH1FGaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4O5abaq5ZHvDtyPlI9pr0BrjtpJ5srufqdd0H4lqPupBw29nS6yFgarDdcHoZMZFW69gcW0XhEpIottkuVItWDeU41PpdSnGcnPXWsqrIyk7NJJ3h+WHKa5LMFqeYGUeatO1Zv2QAnhVQQ2HUCzQ9UeYc9wXInkvSH75iRSPxPi4bu32WYcrwu3SAXkTtQmy3ObGU5zIu0co3UrM1MI5SF6LdW4XHE5Um/TN/xcJ5+dk33QYLOTRvVGsKjXmkUHwf55yezN3qFro/RUYxvFS3hgWB4vLwrl9wk4Sy5vyYc02QfR0h0XeUrXrteGlheGi1Xa5sy0kCbLs0Cb9QTdRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IDoT5Vtg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tejas05@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IDoT5Vtg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tejas05@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5Fm22H5Fz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 00:41:53 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7fHU2008582;
	Mon, 18 Aug 2025 14:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NDECN2
	hxmFhNM8l6UKmoQmN7m91gbZbYgvduBH1FGaw=; b=IDoT5Vtgl1R4rS/yUCjOCT
	BlmpRQHRFT2clB4jCj3lcbpn8zCX8BDwY6S/rBHQHA4tnlWG4qlZTvBuoHWibOQM
	Kyep7C98Ho3xW3QySuRU0ANfSTfySqx8FmeJ3ZB+Y+q4Ui8dGQ7z3duyOEuDJEbJ
	5MsnnEcVDNBU+9yHHTyc0qHAV9IVMOZMrNVcDwN+rwZ6i9EZAFbnzlj2iHyPTXUe
	B/+wWU4NRmEke2MX5EnZXsNT2w3RgEleFRYC+tFGqyyRbZKlLml2Zk/3rO+6ElxZ
	dqFIBfhiPL8peZYjcn3mPvIt+J6pHjbCR2ZRdqZRjNPI7J0A0MSRxoxz4z64oQCQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48jhn3sg7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 14:41:40 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57IEYZMk010776;
	Mon, 18 Aug 2025 14:41:40 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48jhn3sg79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 14:41:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57IENkwW029152;
	Mon, 18 Aug 2025 14:41:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48k5ape6vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 14:41:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57IEfZkN61866288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Aug 2025 14:41:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E76420040;
	Mon, 18 Aug 2025 14:41:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6E4C20043;
	Mon, 18 Aug 2025 14:41:32 +0000 (GMT)
Received: from [9.79.202.156] (unknown [9.79.202.156])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Aug 2025 14:41:32 +0000 (GMT)
Message-ID: <0d2e2413-a23d-406c-9822-6580cd193a35@linux.ibm.com>
Date: Mon, 18 Aug 2025 20:11:31 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add interface to expose vpa dtl counters via perf
To: Athira Rajeev <atrajeev@linux.ibm.com>, acme@kernel.org, jolsa@kernel.org,
        adrian.hunter@intel.com, maddy@linux.ibm.com, irogers@google.com,
        namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, kjain@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
Content-Language: en-US
From: tejas05 <tejas05@linux.ibm.com>
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4pQVyZR_DUMFu9VGl5m6sdTOtgf9BhPp
X-Authority-Analysis: v=2.4 cv=L6wdQ/T8 c=1 sm=1 tr=0 ts=68a33ba4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=pLHpZT9vZImYFbgc-OIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1vWDVTr7CETACjqt_vxzi8fCdrQRydck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNyBTYWx0ZWRfX5pHSlT4lgBuN
 EAlcmgXU5zNIhm49AVd/NPbUbfg+udXbN16aNcQPGKxOFhxbkYk4yDEOjxSfRyOC88B6TUx3F8r
 eN9Fci2culmkeMRediBC0Nel6BwOjcdIRRdUXqiMlXKipbUCXn3q/eo2+oPyyL8wW0rrHpewSgy
 9O7a92D+LW70y2kcDsqpvB6sZx0REud6L9YkG2d8MhqifDDj7t65pAbSDfgn3AyCXeiz/TqfeuA
 toGzMOGUOQUs3oYry800XFzV3xktk64xYwu957a23RMZa6sukTMqTSyVcPqdDbMXsGHvX6b1Drz
 4U0I8nOuOBRMKpXtg7TRgEXfLpGpJBgEH+nwbwxjDd8IJz9lErwX6B5iK3LI9mg1RaQdsbwyLdJ
 88fGLh5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/15/25 14:03, Athira Rajeev wrote:

> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
>
> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>    trace in perf.data. And patch 14 has documentation update.
> - Patch 7 to 13 is perf tools side code changes to enable perf
>    report/script on perf.data file
>
> Infrastructure used
> ===================
>
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The timer
> nterval can be provided by user via sample_period field in nano seconds.
> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL (Dispatch
> Trace Log) contains information about dispatch/preempt, enqueue time etc.
> We directly copy the DTL buffer data as part of auxiliary buffer and it
> will be processed later. This will avoid time taken to create samples
> in the kernel space. The PMU driver collecting Dispatch Trace Log (DTL)
> entries makes use of AUX support in perf infrastructure. On the tools side,
> this data is made available as PERF_RECORD_AUXTRACE records.
>
> To corelate each DTL entry with other events across CPU's, an auxtrace_queue
> is created for each CPU. Each auxtrace queue has a array/list of auxtrace buffers.
> All auxtrace queues is maintained in auxtrace heap. The queues are sorted
> based on timestamp. When the different PERF_RECORD_XX records are processed,
> compare the timestamp of perf record with timestamp of top element in the
> auxtrace heap so that DTL events can be co-related with other events
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record. Sometimes it could happen that
> one buffer is only partially processed. if the timestamp of occurrence of
> another event is more than currently processed element in the queue, it will
> move on to next perf record. So keep track of position of buffer to continue
> processing next time. Update the timestamp of the auxtrace heap with the timestamp
> of last processed entry from the auxtrace buffer.
>
> This infrastructure ensures dispatch trace log entries can be corelated
> and presented along with other events like sched.
>
> vpa-dtl PMU example usage
>
>    # ls /sys/devices/vpa_dtl/
>    events  format  perf_event_mux_interval_ms  power  subsystem  type  uevent
>
>
> To capture the DTL data using perf record:
>
>    # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>
> The result can be interpreted using perf report. Snippet of perf report -D:
>
>    # ./perf report -D
>
> There are different PERF_RECORD_XX records. In that records corresponding to
> auxtrace buffers includes:
>
> 1. PERF_RECORD_AUX
>     Conveys that new data is available in AUX area
>
> 2. PERF_RECORD_AUXTRACE_INFO
>     Describes offset and size of auxtrace data in the buffers
>
> 3. PERF_RECORD_AUXTRACE
>     This is the record that defines the auxtrace data which here in case of
>     vpa-dtl pmu is dispatch trace log data.
>
> Snippet from perf report -D showing the PERF_RECORD_AUXTRACE dump
>
> 0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  ref: 0  idx: 0  tid: -1  cpu: 0
> .
> . ... VPA DTL PMU data: size 1680 bytes, entries is 35
> .  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
> .  00000030: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, ready_to_enqueue_time:187, waiting_to_ready_time:6611773
> .  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, waiting_to_ready_time:15359437
> .  00000090: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, ready_to_enqueue_time:232, waiting_to_ready_time:5100709
> .  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, waiting_to_ready_time:30714243
> .  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, waiting_to_ready_time:15350648
> .  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, waiting_to_ready_time:15353446
> .  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, waiting_to_ready_time:15355126
> .  00000180: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, ready_to_enqueue_time:164, waiting_to_ready_time:5104665
>
> Above is representation of dtl entry of below format:
>
> struct dtl_entry {
>          u8      dispatch_reason;
>          u8      preempt_reason;
>          u16     processor_id;
>          u32     enqueue_to_dispatch_time;
>          u32     ready_to_enqueue_time;
>          u32     waiting_to_ready_time;
>          u64     timebase;
>          u64     fault_addr;
>          u64     srr0;
>          u64     srr1;
>   };
>
> First two fields represent the dispatch reason and preempt reason. The post
> procecssing of PERF_RECORD_AUXTRACE records will translate to meaninful data
> for user to consume.
>
> Visualize the dispatch trace log entries with perf report:
>
>    # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>    [ perf record: Woken up 1 times to write data ]
>    [ perf record: Captured and wrote 0.300 MB perf.data ]
>
>    # ./perf report
>    # Samples: 321  of event 'vpa-dtl'
>    # Event count (approx.): 321
>    #
>    # Children      Self  Command  Shared Object      Symbol
>    # ........  ........  .......  .................  ..............................
>    #
>       100.00%   100.00%  swapper  [kernel.kallsyms]  [k] plpar_hcall_norets_notrace
>
> Visualize the dispatch trace log entries with perf script:
>
>     # ./perf script
>              perf   13322 [002]   233.835807:                     sched:sched_switch: perf:13322 [120] R ==> migration/2:27 [0]
>       migration/2      27 [002]   233.835811:               sched:sched_migrate_task: comm=perf pid=13322 prio=120 orig_cpu=2 dest_cpu=3
>       migration/2      27 [002]   233.835818:               sched:sched_stat_runtime: comm=migration/2 pid=27 runtime=9214 [ns]
>       migration/2      27 [002]   233.835819:                     sched:sched_switch: migration/2:27 [0] S ==> swapper/2:0 [120]
>           swapper       0 [002]   233.835822:                                vpa-dtl: timebase: 338954486062657 dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:435,                      ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: 202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>           swapper       0 [001]   233.835886:                                vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,                      ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: 201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>
> Aboorva Devarajan (1):
>    powerpc/time: Expose boot_tb via accessor
>
> Athira Rajeev (11):
>    powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for
>      capturing DTL data
>    powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
>    powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake
>      up is needed
>    tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc
>    tools/perf: process auxtrace events and display in perf report -D
>    tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to
>      present DTL samples
>    tools/perf: Allocate and setup aux buffer queue to help co-relate with
>      other events across CPU's
>    tools/perf: Process the DTL entries in queue and deliver samples
>    tools/perf: Add support for printing synth event details via default
>      callback
>    tools/perf: Enable perf script to present the DTL entries
>    powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU
>
> Kajol Jain (2):
>    powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
>    docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs
>      event format entries for vpa_dtl pmu
>
>   .../sysfs-bus-event_source-devices-vpa-dtl    |  25 +
>   Documentation/arch/powerpc/index.rst          |   1 +
>   Documentation/arch/powerpc/vpa-dtl.rst        | 155 ++++
>   arch/powerpc/include/asm/time.h               |   2 +
>   arch/powerpc/kernel/time.c                    |   7 +-
>   arch/powerpc/perf/Makefile                    |   2 +-
>   arch/powerpc/perf/vpa-dtl.c                   | 605 ++++++++++++++
>   tools/perf/arch/powerpc/util/Build            |   1 +
>   tools/perf/arch/powerpc/util/auxtrace.c       | 122 +++
>   tools/perf/builtin-script.c                   |  26 +
>   tools/perf/util/Build                         |   1 +
>   tools/perf/util/auxtrace.c                    |   4 +
>   tools/perf/util/auxtrace.h                    |   1 +
>   tools/perf/util/event.h                       |   1 +
>   tools/perf/util/powerpc-vpadtl.c              | 756 ++++++++++++++++++
>   tools/perf/util/powerpc-vpadtl.h              |  45 ++
>   16 files changed, 1752 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
>   create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
>   create mode 100644 arch/powerpc/perf/vpa-dtl.c
>   create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
>   create mode 100644 tools/perf/util/powerpc-vpadtl.c
>   create mode 100644 tools/perf/util/powerpc-vpadtl.h
>
Hi,

I have tested the above patchset on the mainline kernel [ 6.17.0-rc2], 
it is working fine. The vpa-dtl pmu is recognizable and the perf record 
report works as expected. Please add the tag below, for the entire series.

Tested-by: Tejas Manhas <tejas05@linux.ibm.com>

Thanks & Regards,

Tejas

