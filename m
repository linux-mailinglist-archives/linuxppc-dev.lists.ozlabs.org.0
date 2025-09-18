Return-Path: <linuxppc-dev+bounces-12361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5DBB83247
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 08:30:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS5N84q0Hz30Qk;
	Thu, 18 Sep 2025 16:30:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758177000;
	cv=none; b=TfIN4obV4shkB53r8XmezxlhLlJcOyiIo5MmuLgcNlgkmi9XdRge3+/FfsArHVjhwnuvIbV3cxSTg89lFRizwsFoC14IqlFyjaB73vR2RkbPDwWuIx1Wvmq9uXqkEqA3fqtwJ1A3/gW8aLOIDLztnJsqy0OqhmaskP/rvhbcT1Sf5TvkepyVAYdf9Ac8IJOsJNb0vFcliBpEtOJy8kqLBCix8j7BS2u3Of+NTZLOYkW8KsdFQ8Zs86To0CJaOyaH7SJbi5WKnAkxQQa+R+sB4EQTP1ZNzKrxUO0rZt8/r+QCrPK47v7gtDCgS/n/oP8Op9DU5R6fesynw9KHoDgPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758177000; c=relaxed/relaxed;
	bh=K2BE8Yo8RywSf7+l+DfoHnZQmjgB2tYEZiFwKB7IooU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZtF6hv8nmxzyy6jzMJ5HKID4IGkQOZHrZZKwuwF33dubDOcQRleXkobV9hvO5W2IoBqswpfNhx50T2zmITgOle+Uvd3S6JCJY4bk7DSwIcRTtOS2alXgNxa1Zv9mrsDv1yOFM/G8Hkx6wsA/b/UujhvcjfEoENKqpb0GU/WPq3gEchyCnMTZzb4WRdplmMw+W63XNhvuVrpQQLhgXfL83FxiBwu4i6xMatKjFrYsqeqeS+z4My3YwS90pkIkvBpX5A645YXLw2gXWCOVnFwaKRMzjjuo3wgAkF6pbaFTHf4/ZZCfXFUUrQpEpiWxlPt4q+zH3QRKjERKTmAoqke+Ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+l4MaxD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+l4MaxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS5N75kXpz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 16:29:59 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3fcgQ008245;
	Thu, 18 Sep 2025 06:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K2BE8Y
	o8RywSf7+l+DfoHnZQmjgB2tYEZiFwKB7IooU=; b=f+l4MaxD26u0ZdabXeIdHx
	Ir/ZA1aflC+jEuCK0+XgiWpYxq92lK7Smozy+a4zDm+ff5LnE2Aa1GEGJnKDDCXT
	WahYwVKjK1CxZgk7hwdIsipqqTGQHTvX0fgY3R8BbCp+NFE4gCmlT8Dy8yfTU5Yt
	U6Qp8NrJXgtcHSAze9RySmIeKfzQBcEaPFZXQMlh5IuLn5U5xFWnzvskEZxeOuS1
	Y+P2S2KqZxW8pwOgPfmCIQB+ZGExJ0vMzpPUHtpLVQjHZxAgHAEr1tAo/ilefH2Y
	/IhwZlLSGqKfx8tPghNLiglcvTFG9NTBGSTN8p75r8/tOMFVuzqqEBuPzZjLsCpQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4m7ykj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:29:53 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58I6TqrX028188;
	Thu, 18 Sep 2025 06:29:52 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4m7ykh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:29:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58I53ha3005923;
	Thu, 18 Sep 2025 06:29:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 495jxudf9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:29:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58I6Tlhl52887970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 06:29:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C695920040;
	Thu, 18 Sep 2025 06:29:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8795D20043;
	Thu, 18 Sep 2025 06:29:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.196])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 18 Sep 2025 06:29:41 +0000 (GMT)
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
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <edfcc1cf-365b-42c3-a714-7924a20fb0ef@linux.ibm.com>
Date: Thu, 18 Sep 2025 11:59:30 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <13ACBC01-3199-4EB0-8680-728B85EF4549@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
 <edfcc1cf-365b-42c3-a714-7924a20fb0ef@linux.ibm.com>
To: tejas05 <tejas05@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BhSVufexmv-U9W8y6CZZv1InR8NiELdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfX4lTrnm5sBTtI
 KboFBsA/cmmE/fGdfFZH27+MdNCo0YkfdU4gLdQkZlosbCxrikc/6tlLdXpr5s0InVSGHJjI4u5
 +VEvnfqf0Dc61FqjMlcnHXi+YUrvkn57L3uoXE0yblV1E3APuK7SgsB6zHyDeJYlzrwhkGdXZ5Q
 IV5WK4u33G7ZkZiVxTnbXX9x9fCHFCNZKHzEOCssFvE7dznM1zWp+odEHescJGL01+aS2TuNOXQ
 J9K/vDK1yR1Up04gOF4Oawzj4jLlG9YPkMqxir2xNLXuxPjnKwCIAZwSIt+qZzSUR0LIDNLT/ba
 VqSY4ITpzmdPy5s1TwsNp/q4hULlaECVbuMjTnwmkar/bleM84KpEPeIS/bOFfP18QVdZLxglgd
 z0mIGEny
X-Proofpoint-ORIG-GUID: 0PMJE9lzjrY4LldjDm3mL_q1Gp80bIFE
X-Authority-Analysis: v=2.4 cv=QrNe3Uyd c=1 sm=1 tr=0 ts=68cba6e1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=zD8-PHN1qx3goSSPQgsA:9 a=QEXdDO2ut3YA:10
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



> On 17 Sep 2025, at 2:31=E2=80=AFPM, tejas05 <tejas05@linux.ibm.com> =
wrote:
>=20
>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>> retrieve a log of dispatch and preempt events from the hypervisor
>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>> user can retrieve when and why each dispatch & preempt has occurred.
>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>> via perf.
>>=20
>> - Patch 1 to 6 is perf tools side code changes to enable perf
>>   report/script on perf.data file
>>=20
>> Kernel and tools patches is separated. Kernel patches are posted here =
:
>> V2: =
https://lore.kernel.org/linux-perf-users/20250915072224.98958-1-atrajeev@l=
inux.ibm.com/T/#t
>> V3: =
https://lore.kernel.org/linux-perf-users/2D40E056-6194-40CD-BF72-B474A3ACD=
CAA@linux.ibm.com/T/#t
>>=20
>> Infrastructure used
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> The VPA DTL PMU counters do not interrupt on overflow or generate any
>> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The =
timer
>> interval can be provided by user via sample_period field in nano =
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
>>  # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
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
>> Changelog is added for V3 in each individual patch
>>=20
>> Thanks
>> Athira
>>=20
>> Athira Rajeev (6):
>>   tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on =
powerpc
>>   tools/perf: process auxtrace events and display in perf report -D
>>   tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to
>>     present DTL samples
>>   tools/perf: Allocate and setup aux buffer queue to help co-relate =
with
>>     other events across CPU's
>>   tools/perf: Process the DTL entries in queue and deliver samples
>>   tools/perf: Enable perf script to present the DTL entries
>>=20
>>  tools/perf/arch/powerpc/util/Build      |   1 +
>>  tools/perf/arch/powerpc/util/auxtrace.c | 103 ++++
>>  tools/perf/builtin-script.c             |  30 +
>>  tools/perf/util/Build                   |   1 +
>>  tools/perf/util/auxtrace.c              |   4 +
>>  tools/perf/util/auxtrace.h              |   1 +
>>  tools/perf/util/event.h                 |  20 +
>>  tools/perf/util/powerpc-vpadtl.c        | 734 =
++++++++++++++++++++++++
>>  tools/perf/util/powerpc-vpadtl.h        |  23 +
>>  9 files changed, 917 insertions(+)
>>  create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
>>  create mode 100644 tools/perf/util/powerpc-vpadtl.c
>>  create mode 100644 tools/perf/util/powerpc-vpadtl.h
>=20
>=20
> Hi Athira,
>=20
> I have tested the above patchset on the mainline kernel [ 6.17.0-rc2], =
it is working fine. Please add the tag below, for the entire series.
>=20
> Tested-by: Tejas Manhas <tejas05@linux.ibm.com>
>=20
> Thanks & Regards,
>=20
> Tejas
Thanks Tejas for testing the patch series

Athira



