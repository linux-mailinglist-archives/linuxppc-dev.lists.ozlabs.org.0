Return-Path: <linuxppc-dev+bounces-12363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D5B83262
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 08:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS5Qq6SVXz30QJ;
	Thu, 18 Sep 2025 16:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758177139;
	cv=none; b=hUgt358/LqwsvuFMDfqn7KqcZrRJAhqrrmJ03AaBvw1bCt0tdG7+YSK3U2rBCeEncKPDzgM62TELmej11lNtT40iR75J4LIgGhDFIi/mp8/jAE7DhK0WRiNzgJNYm3uZdqM8k17BnT66rRRG+iUDlCDMUqNkULy6oln5ttS+u6/l4AElDWIt9d/ipPJJs0xLnbVWTrzkjMMOtlQKPWT7S316fmrrgn8tdZVdwUoPxf9YrQqRlsCnMjk3gi1j+A542Jb4Tw4xF8vSlf7ELXGn0T7IMWvxXLalGOkOeYr3iLczPpV0R+8QqzeIOspKBDwtsDZn5SGnCJFDDQUuNlbqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758177139; c=relaxed/relaxed;
	bh=H9tfQyAC4Gx4mo6LouK3v6FHJ4z4tYi4hMskYq2Uz2k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=j7EyV1NfU/rNXW/mqeag9Rp1usGly45JfAyTD2kYTZE18s6YP62oRn8R7r4MkOTTTsLbTzdMZp/yl1B+FvYy52pOv80AsWiVKhEeRMOn8Gp2QmN8RSIeTOFF7ELJbMhw4KbW6svscWqMqPs0yUWKjB/xwOC2o9UlX5p3Bk8HWEEyY1UhupuFgIoOMdFZihbtcbNLa4cAjBJEsUjWuuhIoURpvZUQkfv4JOudRE7EgcE+o/ca8ILzVEG0In38KoZlvOomohi/yn7k7y8o3eNLNRPiABUqlBLszWmxtvMm//npM1CVLtHYkxc9lUqT+za7Vl1RaGAhhW8Gd8mqwOOUZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSpzFGV+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSpzFGV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS5Qp2WTDz30Jc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 16:32:18 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HKBs8v020261;
	Thu, 18 Sep 2025 06:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=H9tfQy
	AC4Gx4mo6LouK3v6FHJ4z4tYi4hMskYq2Uz2k=; b=QSpzFGV+pLhGXhZvINfZi5
	vnYdGOJd/jUMjVdRw8ATlF47F+TCcANCM8BwwbTslvlp3Jn6R0Bh4cyCKf1TMEAx
	/e0bVVo/ErxTX/6g6D1IdX4fn8p0c/u6Gp53FYnp/vTW+HJJth+Rwd9kcZpRuZmV
	XgfrCYhYJXvbm3/AsOOFSmqfHGz7Bqq4cZoy2s6xE5gD+pNJXpm5fiBfQN0yH6bl
	4flC/Xmi2sugRMh1TzPXAi61Rgg13Qv4MdEA/1q5CA6xOhvj8kj7D4cypuL/hREV
	ZccrgK8gJBeIcCRJMbobZM87oUkr4ET9dN1+FdtOmIWSBy8paX8Pra/Q7ABOTOoQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4m7yya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:32:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58I6WAPb000351;
	Thu, 18 Sep 2025 06:32:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4m7yy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:32:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5aUPd029514;
	Thu, 18 Sep 2025 06:32:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb15ewg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:32:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58I6W4sA28377466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 06:32:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9561420043;
	Thu, 18 Sep 2025 06:32:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A49520040;
	Thu, 18 Sep 2025 06:31:59 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.196])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 18 Sep 2025 06:31:58 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH V2 0/6] perf/tools: Add interface to expose vpa dtl
 counters via
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <FE75A1D8-A53D-413B-BA25-73842524FE6C@linux.ibm.com>
Date: Thu, 18 Sep 2025 12:01:45 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <39BD0290-B8B5-430B-ACDD-287D4E75E328@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <FE75A1D8-A53D-413B-BA25-73842524FE6C@linux.ibm.com>
To: Venkat <venkat88@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5lMuutPWAVNhZLIMD644J94nXSUAWz9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfX1lhH1qZOB2Je
 zpcU/dD73O8RfQ+lFyEkaA3ExQN6c9fllVJvWK/4ZNz4WN4ixLLenOEKK8hC365sqiOb8P/Px+5
 nEJRx7BvKLhss1esfHG+WvmvEEMh1ElY2iCAD4zFSeFDQDYcG4uLY12WNXasl907MWG89TtgXbM
 RDObnx3r92Wpupve9osJzUsr+FdG1LI3YzMr4D9PmgVnB2Mh9c9MFbR6KX+5yKnXYFeMXGXrBGu
 Fh9nGJUTlJVbEZUtqaEIiVs+3sUNZPP9GsQb8ngwG0Lljc2iZosFDHQRw/WqsaLWSgfxAKL/2YZ
 oBpf+GDLhYfps6hn7bC8WeoAJ+KSr1tbNpXjAnhn6VIi2zJjwrEaA5KL6LJAvqszU1J9pLDsLkx
 UmItpxoe
X-Proofpoint-ORIG-GUID: tTJ-Krlw3qMbaVo9b0EWOsaphs19FqE3
X-Authority-Analysis: v=2.4 cv=QrNe3Uyd c=1 sm=1 tr=0 ts=68cba76b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=gKltO6aA3UH7W0zgcOQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160204
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 9:37=E2=80=AFPM, Venkat <venkat88@linux.ibm.com> =
wrote:
>=20
>=20
>=20
>> On 15 Sep 2025, at 12:57=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>>=20
>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>> retrieve a log of dispatch and preempt events from the hypervisor
>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>> user can retrieve when and why each dispatch & preempt has occurred.
>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>> via perf.
>>=20
>> - Patch 1 to 6 is perf tools side code changes to enable perf
>> report/script on perf.data file
>>=20
>> Kernel and tools patches is separated. Kernel patches are posted here =
:
>> =
https://lore.kernel.org/linux-perf-users/20250915072224.98958-1-atrajeev@l=
inux.ibm.com/T/#t
>>=20
>> Infrastructure used
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> The VPA DTL PMU counters do not interrupt on overflow or generate any
>> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The =
timer
>> nterval can be provided by user via sample_period field in nano =
seconds.
>> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL =
(Dispatch
>> Trace Log) contains information about dispatch/preempt, enqueue time =
etc.
>> We directly copy the DTL buffer data as part of auxiliary buffer and =
it
>> will be processed later. This will avoid time taken to create samples
>> in the kernel space. The PMU driver collecting Dispatch Trace Log =
(DTL)
>> entries makes use of AUX support in perf infrastructure. On the tools =
side,
>> this data is made available as PERF_RECORD_AUXTRACE records.
>>=20
>> To corelate each DTL entry with other events across CPU's, an =
auxtrace_queue
>> is created for each CPU. Each auxtrace queue has a array/list of =
auxtrace buffers.
>> All auxtrace queues is maintained in auxtrace heap. The queues are =
sorted
>> based on timestamp. When the different PERF_RECORD_XX records are =
processed,
>> compare the timestamp of perf record with timestamp of top element in =
the
>> auxtrace heap so that DTL events can be co-related with other events
>> Process the auxtrace queue if the timestamp of element from heap is
>> lower than timestamp from entry in perf record. Sometimes it could =
happen that
>> one buffer is only partially processed. if the timestamp of =
occurrence of
>> another event is more than currently processed element in the queue, =
it will
>> move on to next perf record. So keep track of position of buffer to =
continue
>> processing next time. Update the timestamp of the auxtrace heap with =
the timestamp
>> of last processed entry from the auxtrace buffer.
>>=20
>> This infrastructure ensures dispatch trace log entries can be =
corelated
>> and presented along with other events like sched.
>>=20
>> vpa-dtl PMU example usage
>>=20
>> # ls /sys/devices/vpa_dtl/
>> events  format  perf_event_mux_interval_ms  power  subsystem  type  =
uevent
>>=20
>>=20
>> To capture the DTL data using perf record:
>>=20
>> # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>>=20
>> The result can be interpreted using perf report. Snippet of perf =
report -D:
>>=20
>> # ./perf report -D
>>=20
>> There are different PERF_RECORD_XX records. In that records =
corresponding to
>> auxtrace buffers includes:
>>=20
>> 1. PERF_RECORD_AUX
>>  Conveys that new data is available in AUX area
>>=20
>> 2. PERF_RECORD_AUXTRACE_INFO
>>  Describes offset and size of auxtrace data in the buffers
>>=20
>> 3. PERF_RECORD_AUXTRACE
>>  This is the record that defines the auxtrace data which here in case =
of
>>  vpa-dtl pmu is dispatch trace log data.
>>=20
>> Snippet from perf report -D showing the PERF_RECORD_AUXTRACE dump
>>=20
>> 0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  ref: =
0  idx: 0  tid: -1  cpu: 0
>> .
>> . ... VPA DTL PMU data: size 1680 bytes, entries is 35
>> .  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
>> .  00000030: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, =
ready_to_enqueue_time:187, waiting_to_ready_time:6611773
>> .  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, =
waiting_to_ready_time:15359437
>> .  00000090: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, =
ready_to_enqueue_time:232, waiting_to_ready_time:5100709
>> .  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, =
waiting_to_ready_time:30714243
>> .  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, =
waiting_to_ready_time:15350648
>> .  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, =
waiting_to_ready_time:15353446
>> .  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, =
waiting_to_ready_time:15355126
>> .  00000180: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, =
ready_to_enqueue_time:164, waiting_to_ready_time:5104665
>>=20
>> Above is representation of dtl entry of below format:
>>=20
>> struct dtl_entry {
>>       u8      dispatch_reason;
>>       u8      preempt_reason;
>>       u16     processor_id;
>>       u32     enqueue_to_dispatch_time;
>>       u32     ready_to_enqueue_time;
>>       u32     waiting_to_ready_time;
>>       u64     timebase;
>>       u64     fault_addr;
>>       u64     srr0;
>>       u64     srr1;
>> };
>>=20
>> First two fields represent the dispatch reason and preempt reason. =
The post
>> procecssing of PERF_RECORD_AUXTRACE records will translate to =
meaninful data
>> for user to consume.
>>=20
>> Visualize the dispatch trace log entries with perf report:
>> # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>> [ perf record: Woken up 1 times to write data ]
>> [ perf record: Captured and wrote 0.300 MB perf.data ]
>>=20
>> # ./perf report
>> # Samples: 321  of event 'vpa-dtl'
>> # Event count (approx.): 321
>> #
>> # Children      Self  Command  Shared Object      Symbol
>> # ........  ........  .......  .................  =
..............................
>> #
>>    100.00%   100.00%  swapper  [kernel.kallsyms]  [k] =
plpar_hcall_norets_notrace
>>=20
>> Visualize the dispatch trace log entries with perf script:
>>=20
>>  # ./perf script
>>           perf   13322 [002]   233.835807:                     =
sched:sched_switch: perf:13322 [120] R =3D=3D> migration/2:27 [0]
>>    migration/2      27 [002]   233.835811:               =
sched:sched_migrate_task: comm=3Dperf pid=3D13322 prio=3D120 orig_cpu=3D2 =
dest_cpu=3D3
>>    migration/2      27 [002]   233.835818:               =
sched:sched_stat_runtime: comm=3Dmigration/2 pid=3D27 runtime=3D9214 =
[ns]
>>    migration/2      27 [002]   233.835819:                     =
sched:sched_switch: migration/2:27 [0] S =3D=3D> swapper/2:0 [120]
>>        swapper       0 [002]   233.835822:                            =
    vpa-dtl: timebase: 338954486062657 =
dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:435,                      =
ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: =
202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>>        swapper       0 [001]   233.835886:                            =
    vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,                     =
 ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: =
201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>>=20
>> Thanks
>> Athira
>>=20
>> Athira Rajeev (6):
>> tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc
>> tools/perf: process auxtrace events and display in perf report -D
>> tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to
>>   present DTL samples
>> tools/perf: Allocate and setup aux buffer queue to help co-relate =
with
>>   other events across CPU's
>> tools/perf: Process the DTL entries in queue and deliver samples
>> tools/perf: Enable perf script to present the DTL entries
>>=20
>> tools/perf/arch/powerpc/util/Build      |   1 +
>> tools/perf/arch/powerpc/util/auxtrace.c | 114 ++++
>> tools/perf/builtin-script.c             |  27 +
>> tools/perf/util/Build                   |   1 +
>> tools/perf/util/auxtrace.c              |   4 +
>> tools/perf/util/auxtrace.h              |   1 +
>> tools/perf/util/event.h                 |  20 +
>> tools/perf/util/powerpc-vpadtl.c        | 732 =
++++++++++++++++++++++++
>> tools/perf/util/powerpc-vpadtl.h        |  25 +
>> 9 files changed, 925 insertions(+)
>> create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
>> create mode 100644 tools/perf/util/powerpc-vpadtl.c
>> create mode 100644 tools/perf/util/powerpc-vpadtl.h
>>=20
>> --=20
>> 2.47.1
>>=20
>=20
> Hello Athira,
>=20
> Tested this patch set by applying on top of today=E2=80=99s mainline =
kernel, which was built by applying dtl enablement in PMU driver for =
PowerPC. Please refer below link for the patchiest
>=20
> =
https://lore.kernel.org/all/20250915102947.26681-1-atrajeev@linux.ibm.com/=

>=20
> And this patchiest works as expected.
>=20
> As a side note, if for some reason, you are resending this patch set, =
please correct the interval spelling in the cover page.
>=20
>=20
> Please add below tag.
>=20
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>=20
> Regards,
> Venkat.

Thanks Venkat for testing the patch series
Athira
>=20


