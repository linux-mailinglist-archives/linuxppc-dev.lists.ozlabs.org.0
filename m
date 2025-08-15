Return-Path: <linuxppc-dev+bounces-11059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CBB27FDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 14:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3LjM4jXxz3cdm;
	Fri, 15 Aug 2025 22:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755260279;
	cv=none; b=B9MZlnng1chRkT7EXOiUwxyH/shMAc7SgiV3Fa7ntEi6nPEdaoD6+V7heISsleGXphsJWEbBJ2ezsmErPlEbZphsMeaOXysqmjzVKHZPGTIDfi7XAs6b1c3QAflQKpCM/gt+73brJJhSYKPb5YvCw1rne/aZpksn6mXnLa1ve8YdJcvk2nawikj6T+R1LLhegXQbYro2g40rK2K5kGfn2QbB6oEnavyvyr6zcpOktaZwlwG/hc88wj3zqMnc8QxOXaW3BTtlgPFF4iCPLLAe32Twos3bAECw4z232DEusAVegveH4KlLM2AmFCHwjslH6541BgbPgb27upDFqOS7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755260279; c=relaxed/relaxed;
	bh=6RwrLo5ps6Q4wQG5+Jjks5AFb/FNHW9I0+dlmRKW60E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j51Qp4oOzmnQuAeV1enuku7qWlnUE81RzUT54SXZQQ021SDad0VKl8Bg1o2bz4Slmjsf5QHRKFmr6RvxX43ErmMSxm2WSUdAKB8aBtmrX2MqGuEhEMzRA0dNzu/PET90gzqIt/rW5yyp1Bjl3g3hOs5HtxRjZs13tZISv2f6hC3mzsmKwPSDICKK9vccAEYDrfUq3a0ae93kBCtW3WrkvtTmcNTNFOIS1FCUdFqSyfI0FyIGphmtfptg7uGMQsOSQcxbEFTvEqdfO/wqda8JPRlN9U0EIGQYaTrcrOftbNNq9kx3CwLyHd5OOBoPASPAg/7A3/BABgTqPyHo2KmxCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ox5kJPDI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ox5kJPDI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3LjL4VLkz3cb5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 22:17:58 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F0rUda022466;
	Fri, 15 Aug 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6RwrLo
	5ps6Q4wQG5+Jjks5AFb/FNHW9I0+dlmRKW60E=; b=Ox5kJPDIVD6tXAVHmTtDTb
	OrMyjt5YBXw1yigKg595r/eLsNDB8pMG14tEO8lXsculA2p1ahPKz7uxy/iZX54/
	3yPbHdL1haM+AIBOUvEjwH+Xqob3J2oDz5qjpZE7izthcGE81CAU5DBKzNMQWnG6
	8loYQdZuyf3h1Wi/S4L6U3Y3LocmHJ2mwNmBO4v2qJd/OMHgNHzo679/AVClcpVV
	W+lWpC7hF9eOrxUSbCKEB5aTznxHdGjkbVvdLTKXPBX+gWYW8+lJm+ptdwaXnvgF
	o/bFmyGlkfDV01pwO1WMWC0rcD4MzNz3o6uVn2b1UEojUesSiFdb863fQ4AADABA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14y6wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 12:17:53 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57FCDxow023472;
	Fri, 15 Aug 2025 12:17:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14y6wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 12:17:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57FCFFSN028582;
	Fri, 15 Aug 2025 12:17:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ej5ngq1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 12:17:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57FCHnJ08913806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 12:17:50 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA3875804B;
	Fri, 15 Aug 2025 12:17:49 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A567058059;
	Fri, 15 Aug 2025 12:17:44 +0000 (GMT)
Received: from [9.61.255.87] (unknown [9.61.255.87])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 12:17:44 +0000 (GMT)
Message-ID: <df16509f-36b2-4f0b-8de8-685fa8703ea1@linux.ibm.com>
Date: Fri, 15 Aug 2025 17:47:42 +0530
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
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oGg2d6HnU7iucdi8M6CrC3E8Zpq29LEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfXwV07VuPdTg7e
 pHlh0LQ3Phk1mhOUfwji6r7Brx77tlF0QguXfV4jA8dzlobVOxmPk+t9xXNaRBTdpyn/opZa5g3
 FK3YDFxdT0+SVQsSqhY16kVO6apG6deJukUC6jSr4fljoW3uGfeyUnYnj9zwxlL+H0dGxsDzb7o
 glOm1M0lxA8shwFi/Mb+7jy9jb+u386N2tUhzMD5k/vkhTGWkCR0VGwvKAR7kNbLXpMw7f4dAFV
 lK42rAuBAnsQtsIqsUNQpTgSFMcU+mr459SBaqZE/Wa2LqwSlptLLuYKchSg6uRlJwky2z5MzvQ
 c1HVixKTVsFfSZ1+NzY4/PHXe2xdoXehAt/MCdE2X55JSZIuimYt2rc5zIl6QFR2ocY8jMTdeF4
 YQOPNgUn
X-Proofpoint-GUID: ap8HlvcAPM71HJfb5GSvLLeT6Et65eFV
X-Authority-Analysis: v=2.4 cv=fLg53Yae c=1 sm=1 tr=0 ts=689f2571 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=pLHpZT9vZImYFbgc-OIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 15/08/25 2:03 pm, Athira Rajeev wrote:
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

Tested this patchset by applying on top of mainline kernel, and its 
working as expected. Hence for the entire series, please add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


