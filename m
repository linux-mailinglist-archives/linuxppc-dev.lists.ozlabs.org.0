Return-Path: <linuxppc-dev+bounces-11060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D614B28032
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 14:52:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3MT16yV4z3cfm;
	Fri, 15 Aug 2025 22:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755262341;
	cv=none; b=JTnKUz8IGUXVU8rOXvp877E3LEU/r5Sc2Nn+bZjcyPSKRCZz1MF2AEjxqGpCTkfxZi08knsFvVCc2eDMuAkzMT/YtTWyswd1Ec8RoFsujy1ookupg3eIy0puSrrVokwcOxftPPa1IkIoUCtXNHOzK1OmgdKtyEesfiEeD+b/D2wI3R37MdCtGzXxMNcb2H0CbGJQ4UCvISJ1MzVmPRSHMozP+jrv6MsGBLijXoLN5GyRIMCkoOrXnpEs1HqvX0GylqzV5FtPAcDRnD/SDWB/NGvMECsFKRazs/gc/lnofXWp+fz6oM84D+lPhgm9G8R4vBEGO/ZAmFabiF77mZc+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755262341; c=relaxed/relaxed;
	bh=RZ3mY92rLH4BpWGep+8PqB9OIKZpWT5OM2vQiIqBV8Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TDLK6Qt5fzzLe3ZK6wpoqlwur/muyKgsPrvr8Luio5RWvc6LCPMNPyCwBhnXx373T7IB3A+ukNj2aL0GWwpbLMd3eYcio+reYUQp/hsaVjwZ3ru/2ZzZhq3Xj7EjNW5G6b8H2C4xElh3QqhEhTqO8F6PfHZwIltFbF85dIzzpdr8Clb/nXgQu0DjJJv/9NLK7AfdfQXyLDhgt6q7ryzuy5I8/Rf7l4c+NRlgjcJi2XBTbRoV9UxYwGU5TCKBzcW1cCPpTUciICcGSAi5oVY4H4xTaGcz2z2GnsDbjh4LW1Qw1FANtbr9BOm0x4q94W2UGBLOgAkrfBA6SVuTim8iKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YGWO/YwX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YGWO/YwX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3MT106LQz3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 22:52:20 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EMrdqW019301;
	Fri, 15 Aug 2025 12:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RZ3mY9
	2rLH4BpWGep+8PqB9OIKZpWT5OM2vQiIqBV8Q=; b=YGWO/YwXLot7+U06sDroVw
	WOt8Hzgq/osYcZ7iK4335w/HOrOkRWrxH8kb8CVgfVSYZlMtfOs0v9QODmWPayQV
	pdRm9EACfJqkh23nRqx/lYNR5sVxEauDbJY3hVYC6tFgRESecbauXSWYw+tO2T2X
	Fcw1HIbPZ51qaGCMRPcC0C24ROzIT5wsbWUtKqcEohs5UOainjOdr+V5SH3Pvsvl
	AnJ2+JVbt/v1HhKg04jHTX01Hzb/xrolnxnQjaSHeuqJPpTyOjn3ZCR2/7WeoLjz
	ITdnwTIwAC88Z2EXSs2O2ndx+ogc9RUPjPwgYcFJp+wpqudoCqjS1TMODT1XrxSg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48gypehbcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 12:52:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57FCkW6c021226;
	Fri, 15 Aug 2025 12:52:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48gypehbc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 12:52:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F8ITFN028571;
	Fri, 15 Aug 2025 12:52:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ej5ngtvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 12:52:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57FCqA1Y36307444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 12:52:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 173802004B;
	Fri, 15 Aug 2025 12:52:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F7E82004D;
	Fri, 15 Aug 2025 12:52:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.240.145])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 15 Aug 2025 12:52:03 +0000 (GMT)
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
Subject: Re: [PATCH 00/14] Add interface to expose vpa dtl counters via perf
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <df16509f-36b2-4f0b-8de8-685fa8703ea1@linux.ibm.com>
Date: Fri, 15 Aug 2025 18:21:50 +0530
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD5A1BA3-B2A6-414A-A6EB-77C50A95C3F0@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <df16509f-36b2-4f0b-8de8-685fa8703ea1@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=eaU9f6EH c=1 sm=1 tr=0 ts=689f2d7f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=SzdPElzI3ZiouJfEAtwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TIK4H5xxFHvj3eLI82VhXCg6tol2mbcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE2NyBTYWx0ZWRfX3HIDcE+rpVHm
 5sfTwjmmL/Pwna0S1tzsdw4bseFGa0HhPEm3rKujdhhMqrWa/a2Z2KSsDxRDfi5bc7OQtgyn0lg
 ujkw8c7foCmTAkc92CIMG/o0ufRxxoQrS1DfdlFwFAJMNqZmPUpkkirEnu7CkzPp+Pm2DANUvT8
 KcNEM6mZ05s12KvvMYCJZ8si3aNNKxDmXQg8Bb7BuDl95JBsHeu8OemkmbFoLo1XAlACG+cv27K
 8DH4mUJvyBfJlIsELGBxtbe/Pke3vucF9dkGvXe+4S+OSTl+IXSvA0NzXiL+T5US7TiacSE0T7E
 KJxfIP6Fm8ubtEy2g9bf6k1+aWLzzlCnwO/cDTGgxTN1O9h3EzvDzO40kFsVonvVRI3Ra+a6wfa
 ST9lHD4L
X-Proofpoint-ORIG-GUID: hFBIqm88b-sblu2pwFRHoFbUdjQCBdwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508130167
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Aug 2025, at 5:47=E2=80=AFPM, Venkat Rao Bagalkote =
<venkat88@linux.ibm.com> wrote:
>=20
>=20
> On 15/08/25 2:03 pm, Athira Rajeev wrote:
>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>> retrieve a log of dispatch and preempt events from the hypervisor
>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>> user can retrieve when and why each dispatch & preempt has occurred.
>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>> via perf.
>>=20
>> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>>   trace in perf.data. And patch 14 has documentation update.
>> - Patch 7 to 13 is perf tools side code changes to enable perf
>>   report/script on perf.data file
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
>>   # ls /sys/devices/vpa_dtl/
>>   events  format  perf_event_mux_interval_ms  power  subsystem  type  =
uevent
>>=20
>>=20
>> To capture the DTL data using perf record:
>>=20
>>   # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep =
1
>>=20
>> The result can be interpreted using perf report. Snippet of perf =
report -D:
>>=20
>>   # ./perf report -D
>>=20
>> There are different PERF_RECORD_XX records. In that records =
corresponding to
>> auxtrace buffers includes:
>>=20
>> 1. PERF_RECORD_AUX
>>    Conveys that new data is available in AUX area
>>=20
>> 2. PERF_RECORD_AUXTRACE_INFO
>>    Describes offset and size of auxtrace data in the buffers
>>=20
>> 3. PERF_RECORD_AUXTRACE
>>    This is the record that defines the auxtrace data which here in =
case of
>>    vpa-dtl pmu is dispatch trace log data.
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
>>         u8      dispatch_reason;
>>         u8      preempt_reason;
>>         u16     processor_id;
>>         u32     enqueue_to_dispatch_time;
>>         u32     ready_to_enqueue_time;
>>         u32     waiting_to_ready_time;
>>         u64     timebase;
>>         u64     fault_addr;
>>         u64     srr0;
>>         u64     srr1;
>>  };
>>=20
>> First two fields represent the dispatch reason and preempt reason. =
The post
>> procecssing of PERF_RECORD_AUXTRACE records will translate to =
meaninful data
>> for user to consume.
>>=20
>> Visualize the dispatch trace log entries with perf report:
>>=20
>>   # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep =
1
>>   [ perf record: Woken up 1 times to write data ]
>>   [ perf record: Captured and wrote 0.300 MB perf.data ]
>>=20
>>   # ./perf report
>>   # Samples: 321  of event 'vpa-dtl'
>>   # Event count (approx.): 321
>>   #
>>   # Children      Self  Command  Shared Object      Symbol
>>   # ........  ........  .......  .................  =
..............................
>>   #
>>      100.00%   100.00%  swapper  [kernel.kallsyms]  [k] =
plpar_hcall_norets_notrace
>>=20
>> Visualize the dispatch trace log entries with perf script:
>>=20
>>    # ./perf script
>>             perf   13322 [002]   233.835807:                     =
sched:sched_switch: perf:13322 [120] R =3D=3D> migration/2:27 [0]
>>      migration/2      27 [002]   233.835811:               =
sched:sched_migrate_task: comm=3Dperf pid=3D13322 prio=3D120 orig_cpu=3D2 =
dest_cpu=3D3
>>      migration/2      27 [002]   233.835818:               =
sched:sched_stat_runtime: comm=3Dmigration/2 pid=3D27 runtime=3D9214 =
[ns]
>>      migration/2      27 [002]   233.835819:                     =
sched:sched_switch: migration/2:27 [0] S =3D=3D> swapper/2:0 [120]
>>          swapper       0 [002]   233.835822:                          =
      vpa-dtl: timebase: 338954486062657 =
dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:435,                      =
ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: =
202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>>          swapper       0 [001]   233.835886:                          =
      vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,            =
ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: =
201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>>=20
>> Aboorva Devarajan (1):
>>   powerpc/time: Expose boot_tb via accessor
>>=20
>> Athira Rajeev (11):
>>   powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for
>>     capturing DTL data
>>   powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
>>   powerpc/perf/vpa-dtl: Handle the writing of perf record when aux =
wake
>>     up is needed
>>   tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on =
powerpc
>>   tools/perf: process auxtrace events and display in perf report -D
>>   tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to
>>     present DTL samples
>>   tools/perf: Allocate and setup aux buffer queue to help co-relate =
with
>>     other events across CPU's
>>   tools/perf: Process the DTL entries in queue and deliver samples
>>   tools/perf: Add support for printing synth event details via =
default
>>     callback
>>   tools/perf: Enable perf script to present the DTL entries
>>   powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log =
PMU
>>=20
>> Kajol Jain (2):
>>   powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
>>   docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs
>>     event format entries for vpa_dtl pmu
>>=20
>>  .../sysfs-bus-event_source-devices-vpa-dtl    |  25 +
>>  Documentation/arch/powerpc/index.rst          |   1 +
>>  Documentation/arch/powerpc/vpa-dtl.rst        | 155 ++++
>>  arch/powerpc/include/asm/time.h               |   2 +
>>  arch/powerpc/kernel/time.c                    |   7 +-
>>  arch/powerpc/perf/Makefile                    |   2 +-
>>  arch/powerpc/perf/vpa-dtl.c                   | 605 ++++++++++++++
>>  tools/perf/arch/powerpc/util/Build            |   1 +
>>  tools/perf/arch/powerpc/util/auxtrace.c       | 122 +++
>>  tools/perf/builtin-script.c                   |  26 +
>>  tools/perf/util/Build                         |   1 +
>>  tools/perf/util/auxtrace.c                    |   4 +
>>  tools/perf/util/auxtrace.h                    |   1 +
>>  tools/perf/util/event.h                       |   1 +
>>  tools/perf/util/powerpc-vpadtl.c              | 756 =
++++++++++++++++++
>>  tools/perf/util/powerpc-vpadtl.h              |  45 ++
>>  16 files changed, 1752 insertions(+), 2 deletions(-)
>>  create mode 100644 =
Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
>>  create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
>>  create mode 100644 arch/powerpc/perf/vpa-dtl.c
>>  create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
>>  create mode 100644 tools/perf/util/powerpc-vpadtl.c
>>  create mode 100644 tools/perf/util/powerpc-vpadtl.h
>>=20
>=20
> Tested this patchset by applying on top of mainline kernel, and its =
working as expected. Hence for the entire series, please add below tag.
>=20
>=20
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>=20
>=20
> Regards,
>=20
> Venkat.
Thanks Venkat for checking.

Hi All,

I have CC-ed linuxppc-dev for powerpc specific patches and =
linux-perf-users for perf tools side related patches.

As mentioned in cover letter:
- Patches 1 to 6 has powerpc PMU driver code changes to capture trace =
data in perf.data, And patch 14 has documentation update.=20
- Patch 7 to 13 is perf tools side code changes to enable perf =
report/script on perf.data

Thanks
Athira


