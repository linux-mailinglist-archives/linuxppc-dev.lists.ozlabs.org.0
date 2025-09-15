Return-Path: <linuxppc-dev+bounces-12243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8780B5819B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 18:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQVLT2b8qz3f4Q;
	Tue, 16 Sep 2025 02:08:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757952481;
	cv=none; b=GqKGcmmm0RRG1wLfBAcp3g0d/rLjCAIQ6jJST3LogXvBW9zjk2Mp8Oqc6WxsNzv7HEj3lKn7NRYH7631xK3SDlUnG7UPMCjABoxOCNa17KcweGsHyenPsDa6mDhPEKqjYYs17IkFiNfbJeMkJmmo9Ypt1tRIbOAjZnEZT8nPqrbTsEP58iv3IX3VAze1TYw7JVV9QlpeXjB7DbSTLg6kD9rRhmUIHR/KEbQbIt+MVlWe3N+vRhiTvoT+/IUPjVtUCSYScvJtoL2JeYiS/L9cJhFL3/TxyPAjs6AOjI7yFW5px8tCMHgYGxbjrtjEj4+ii9O2Qdt53PUaIZYsoLP32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757952481; c=relaxed/relaxed;
	bh=tdjnjKBXP5VG+ZFfOCWRfDIttGV78TQBCTLNUVi5iNo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=e68NVnp03Joi/IRZC5Z5wQewM1a0nMBKfWLKaHuehtT5Wh+eBbLB3+Z34FEvFUvteYIhetcRDNHBMo8DzNmYLclfARJDWD5YqiTC5lDLw2lCql1Tvv3Bavu9VIERWZh0HtwFxvCca0UsmdjA7aJ37zY1p3RFAU3mYtBpnoupE70JXsjCO7EMZUUzWeMQ7jMP06RfPV04hVHFWX371m6kHzrmEqtiTEy/uohfVmNDr2Aws1rVBIkgSU5UeeG3OfNw3QFyHa4g+05bt9WlhSvbAal7F5WM/goHH8GymPZklglYunlXCBLvQnRvXoJEQI9THpxBnH33MyidBzht9JKmZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eqFpeijs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eqFpeijs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQVLS0mvGz3dDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 02:07:59 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDnNB5024021;
	Mon, 15 Sep 2025 16:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tdjnjK
	BXP5VG+ZFfOCWRfDIttGV78TQBCTLNUVi5iNo=; b=eqFpeijs/Hc1eHoBfijWPu
	i40ZG24K7mC9Hz/iDMpRjLs+JKtu9VqU8rK/3+lr1mZM6GxdJJYT7bnrFMghb3Nh
	IfSH269F12AKWXfMQb+BrjoZtFhMj1zLEGPO+6GUA90ef8VwRG0k9rdC+7sqLSc+
	1OVc0G59nCrVc9U9zDDRen4IHX7leU96kkr6IIAv2Bfg57XsJMvKoviYGgZ/Tx84
	GnKdPYbVv0NFNruND7ep0gkSJlB9AFhnNuJHYSMG7Wnei1xf3GEGMls9C7C75ES6
	pCWfFFxiL8ZYENRssTHsFQbSYUY/9DZR0wU15ucHrAKezhSP6rP8ckWqTuuCe8yA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnkq2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 16:07:53 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FG58sH011385;
	Mon, 15 Sep 2025 16:07:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnkq2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 16:07:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFGKHw027315;
	Mon, 15 Sep 2025 16:07:51 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495memy7hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 16:07:51 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FG7nAr22086296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 16:07:50 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9B4C58043;
	Mon, 15 Sep 2025 16:07:49 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFB325805D;
	Mon, 15 Sep 2025 16:07:45 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.248.92])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Sep 2025 16:07:44 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V2 0/6] perf/tools: Add interface to expose vpa dtl
 counters via
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20250915072754.99850-1-atrajeev@linux.ibm.com>
Date: Mon, 15 Sep 2025 21:37:32 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE75A1D8-A53D-413B-BA25-73842524FE6C@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fy40rc1mSfZONfPXQcMPBwHecLpxQZWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX4fVEX/ZXSJHw
 /tpkgIaaJGqkYBAVXR9GXEd33OLJDU6Itng3ZYQ6YA0wNdXC4mQVnIxKVDeROCj4Ch1yRnx8lsN
 biHYA66YblhYXB/HrnwazJMg/M+zySOHs6xqxHEbUnFmkROL++tKpZqHV7MFITIjAzA/ppmU4dM
 7d4Z635q5EdDNRawc2z1wXvumsI7VQSzC9TEbr4r36643yEPJI2TKE2LYWD4fwFaVTJnrDMWcMD
 zxyGSXTCxzejqIkBvBJvwkIq3awvDmv709jZdmuYFfsmIgWliYf71yu9GkNB7nmHqJn/U5vIUb0
 nkC/95OFhk9eGUsyoKEuElByeAmE2eImnqHkbnU6MHTlrm2xkzbV0LZ58+xCPEgcTFP53I59W9W
 EyGIrLxF
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c839d9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=2Ka_cbLXvaq1a0_Dp14A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Dj8IzpRV-AyLLQZFRY_LycgGtEdXi_wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 12:57=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>=20
> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
>=20
> - Patch 1 to 6 is perf tools side code changes to enable perf
>  report/script on perf.data file
>=20
> Kernel and tools patches is separated. Kernel patches are posted here =
:
> =
https://lore.kernel.org/linux-perf-users/20250915072224.98958-1-atrajeev@l=
inux.ibm.com/T/#t
>=20
> Infrastructure used
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The =
timer
> nterval can be provided by user via sample_period field in nano =
seconds.
> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL =
(Dispatch
> Trace Log) contains information about dispatch/preempt, enqueue time =
etc.
> We directly copy the DTL buffer data as part of auxiliary buffer and =
it
> will be processed later. This will avoid time taken to create samples
> in the kernel space. The PMU driver collecting Dispatch Trace Log =
(DTL)
> entries makes use of AUX support in perf infrastructure. On the tools =
side,
> this data is made available as PERF_RECORD_AUXTRACE records.
>=20
> To corelate each DTL entry with other events across CPU's, an =
auxtrace_queue
> is created for each CPU. Each auxtrace queue has a array/list of =
auxtrace buffers.
> All auxtrace queues is maintained in auxtrace heap. The queues are =
sorted
> based on timestamp. When the different PERF_RECORD_XX records are =
processed,
> compare the timestamp of perf record with timestamp of top element in =
the
> auxtrace heap so that DTL events can be co-related with other events
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record. Sometimes it could =
happen that
> one buffer is only partially processed. if the timestamp of occurrence =
of
> another event is more than currently processed element in the queue, =
it will
> move on to next perf record. So keep track of position of buffer to =
continue
> processing next time. Update the timestamp of the auxtrace heap with =
the timestamp
> of last processed entry from the auxtrace buffer.
>=20
> This infrastructure ensures dispatch trace log entries can be =
corelated
> and presented along with other events like sched.
>=20
> vpa-dtl PMU example usage
>=20
>  # ls /sys/devices/vpa_dtl/
>  events  format  perf_event_mux_interval_ms  power  subsystem  type  =
uevent
>=20
>=20
> To capture the DTL data using perf record:
>=20
>  # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>=20
> The result can be interpreted using perf report. Snippet of perf =
report -D:
>=20
>  # ./perf report -D
>=20
> There are different PERF_RECORD_XX records. In that records =
corresponding to
> auxtrace buffers includes:
>=20
> 1. PERF_RECORD_AUX
>   Conveys that new data is available in AUX area
>=20
> 2. PERF_RECORD_AUXTRACE_INFO
>   Describes offset and size of auxtrace data in the buffers
>=20
> 3. PERF_RECORD_AUXTRACE
>   This is the record that defines the auxtrace data which here in case =
of
>   vpa-dtl pmu is dispatch trace log data.
>=20
> Snippet from perf report -D showing the PERF_RECORD_AUXTRACE dump
>=20
> 0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  ref: =
0  idx: 0  tid: -1  cpu: 0
> .
> . ... VPA DTL PMU data: size 1680 bytes, entries is 35
> .  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
> .  00000030: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, =
ready_to_enqueue_time:187, waiting_to_ready_time:6611773
> .  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, =
waiting_to_ready_time:15359437
> .  00000090: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, =
ready_to_enqueue_time:232, waiting_to_ready_time:5100709
> .  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, =
waiting_to_ready_time:30714243
> .  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, =
waiting_to_ready_time:15350648
> .  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, =
waiting_to_ready_time:15353446
> .  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, =
waiting_to_ready_time:15355126
> .  00000180: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, =
ready_to_enqueue_time:164, waiting_to_ready_time:5104665
>=20
> Above is representation of dtl entry of below format:
>=20
> struct dtl_entry {
>        u8      dispatch_reason;
>        u8      preempt_reason;
>        u16     processor_id;
>        u32     enqueue_to_dispatch_time;
>        u32     ready_to_enqueue_time;
>        u32     waiting_to_ready_time;
>        u64     timebase;
>        u64     fault_addr;
>        u64     srr0;
>        u64     srr1;
> };
>=20
> First two fields represent the dispatch reason and preempt reason. The =
post
> procecssing of PERF_RECORD_AUXTRACE records will translate to =
meaninful data
> for user to consume.
>=20
> Visualize the dispatch trace log entries with perf report:
> # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>  [ perf record: Woken up 1 times to write data ]
>  [ perf record: Captured and wrote 0.300 MB perf.data ]
>=20
>  # ./perf report
>  # Samples: 321  of event 'vpa-dtl'
>  # Event count (approx.): 321
>  #
>  # Children      Self  Command  Shared Object      Symbol
>  # ........  ........  .......  .................  =
..............................
>  #
>     100.00%   100.00%  swapper  [kernel.kallsyms]  [k] =
plpar_hcall_norets_notrace
>=20
> Visualize the dispatch trace log entries with perf script:
>=20
>   # ./perf script
>            perf   13322 [002]   233.835807:                     =
sched:sched_switch: perf:13322 [120] R =3D=3D> migration/2:27 [0]
>     migration/2      27 [002]   233.835811:               =
sched:sched_migrate_task: comm=3Dperf pid=3D13322 prio=3D120 orig_cpu=3D2 =
dest_cpu=3D3
>     migration/2      27 [002]   233.835818:               =
sched:sched_stat_runtime: comm=3Dmigration/2 pid=3D27 runtime=3D9214 =
[ns]
>     migration/2      27 [002]   233.835819:                     =
sched:sched_switch: migration/2:27 [0] S =3D=3D> swapper/2:0 [120]
>         swapper       0 [002]   233.835822:                            =
    vpa-dtl: timebase: 338954486062657 =
dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:435,                      =
ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: =
202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>         swapper       0 [001]   233.835886:                            =
    vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,                     =
 ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: =
201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>=20
> Thanks
> Athira
>=20
> Athira Rajeev (6):
>  tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc
>  tools/perf: process auxtrace events and display in perf report -D
>  tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to
>    present DTL samples
>  tools/perf: Allocate and setup aux buffer queue to help co-relate =
with
>    other events across CPU's
>  tools/perf: Process the DTL entries in queue and deliver samples
>  tools/perf: Enable perf script to present the DTL entries
>=20
> tools/perf/arch/powerpc/util/Build      |   1 +
> tools/perf/arch/powerpc/util/auxtrace.c | 114 ++++
> tools/perf/builtin-script.c             |  27 +
> tools/perf/util/Build                   |   1 +
> tools/perf/util/auxtrace.c              |   4 +
> tools/perf/util/auxtrace.h              |   1 +
> tools/perf/util/event.h                 |  20 +
> tools/perf/util/powerpc-vpadtl.c        | 732 ++++++++++++++++++++++++
> tools/perf/util/powerpc-vpadtl.h        |  25 +
> 9 files changed, 925 insertions(+)
> create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
> create mode 100644 tools/perf/util/powerpc-vpadtl.c
> create mode 100644 tools/perf/util/powerpc-vpadtl.h
>=20
> --=20
> 2.47.1
>=20

Hello Athira,

Tested this patch set by applying on top of today=E2=80=99s mainline =
kernel, which was built by applying dtl enablement in PMU driver for =
PowerPC. Please refer below link for the patchiest

=
https://lore.kernel.org/all/20250915102947.26681-1-atrajeev@linux.ibm.com/=


And this patchiest works as expected.

As a side note, if for some reason, you are resending this patch set, =
please correct the interval spelling in the cover page.


Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.


