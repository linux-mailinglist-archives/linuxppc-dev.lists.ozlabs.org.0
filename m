Return-Path: <linuxppc-dev+bounces-12272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4CB58CE5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQq0F4d7kz2yvv;
	Tue, 16 Sep 2025 14:38:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757997501;
	cv=none; b=ZeZJF5VF6NaYImr3Qhd5rFIfUAQXi1x7LoJnwUMaBzbMUrf/7+UrNEA900f1sB1nv7eIp0wna//AJVaWtyS0+oxA7ln/L4e2BLZlaEEQ31TyfVuxRNlWWJ79COaHby4KhdMishFFAPygERhbekYhgTq1glkRERaDbBBg3LFNpuWmHPbwQ1LdbqJHxz+h0YXhxG7IffZRTEvQWOrnoB3T6qMH7r3HWIZOMC72wuNR5SSw+0zLJp9ePDPP334KY6QfEpSrHokUDDbQLfygu94PjkRdKe0B2QO53F0nzXy3m6+/yky+NSfqQTyUFrZ4WDcQE+GpNP97j2sKxX7rkIh42w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757997501; c=relaxed/relaxed;
	bh=f85ojt1rNIzZlPwHAD2a6Tfw3kWCvhr9KIVzjwp+ZiQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hIh+iHUKnMQfxoFaXB+IMwYhORTpmTfNo+OnYgZYkVo6kqOOwh8aWCN0UUSY1qRpsLkEudoDEZMw3naJIOGhdRX459dquQp4RBkvj6yiqZMVQWQ3bZa2YGqe7e/ahpmig98UqH+X+q6+/Bqh6zf/RVdnaZmsjN51zfzzsNzZDAaGIYvP7HOW6zcVgI9GxoFvpklL0lTpTNRYFXZ8CvEwJEB3UvlLUJcC6bkRPEwdOPeiaaU+7qeIYJ2jrTwBdclsXleFq88dDh6Omwbv9pdu2zQGrQ4zEqXsIJrXBHVXrkYtR1RBW4goTdd4PtzoBpOw2XfVCIIvPCz+OXxmcZ+aUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fz6G48Qm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fz6G48Qm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQq0D2TXNz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:38:20 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3alpZ025368;
	Tue, 16 Sep 2025 04:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=f85ojt
	1rNIzZlPwHAD2a6Tfw3kWCvhr9KIVzjwp+ZiQ=; b=Fz6G48Qm70BkqHdub243eu
	jVL9AddS6vDYOblJULy1ttYlIqHPkDbWjeDIA7l8yK/fzD43bue+TB8RKdGg+ylE
	id8qutLrtxPPv8fk9cchp/0PdcVgE+bISuEzTeZARRyFV8bU4POBqeoUKBcHMTrQ
	h0JHsFhHwxHTzi2k1vhgyjx7mbgcx4CIc9cwCgdxrKZ1Ury05F6yXIEW7ZWk6fNA
	LX4VvKUkD7x2sBEkSh5h+wZjE++OVcNf8WqFxW6Hy6NBsg7xZH56KrBEuVFUFGoB
	LaKmrkWjMAS32V+E5/UfnzDfga8pE4TZznEliW/IxCDUESUB+5skQBNOy1mDsdKQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y6y66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:38:15 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4cFwD006248;
	Tue, 16 Sep 2025 04:38:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y6y64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:38:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G36rIV027268;
	Tue, 16 Sep 2025 04:38:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495men1yr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:38:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4cAuI46989586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:38:10 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A64520043;
	Tue, 16 Sep 2025 04:38:10 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAB0D20040;
	Tue, 16 Sep 2025 04:38:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.152])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Sep 2025 04:38:04 +0000 (GMT)
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
Subject: Re: [PATCH V2 2/6] tools/perf: process auxtrace events and display in
 perf report -D
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <067b6d80-1e37-4a73-a125-7975e670e315@intel.com>
Date: Tue, 16 Sep 2025 10:07:54 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8C2BEC21-7ED3-431E-B0AF-0AB0D753E008@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-3-atrajeev@linux.ibm.com>
 <067b6d80-1e37-4a73-a125-7975e670e315@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX6vZ/JKiirO7p
 xUOp4Qv/1SYg2KwCL6Q8knr8+CNpNZjC8Rb/4kB+qjS1LgTWBfJs7S39Ip8y1sZVxZ2ZVqX5stb
 GeiqlJP41IKICrd1Dwu211KyJH1+DMi3KP7eXF05j1QSRw51BPvidz9L6TcaelULEzWzWrzCDbp
 V+dBEN5K3orMj81HDK30ZAM2/6xOb3+RrDjvAYbl5ljQKD3jglOWZILEIYV8/7LHGd94EAbqqF8
 lJgAwy4oRgnjW70FpfGwJTDCl9oPd+oxjTwpSEUTQS3yiUQ8KWrZdrpGI80r6cUVUanPeb3/jO7
 SSulXS7GergoPX/9IuhO8pzc0Q3yRhQ9UhQP52Tk76+OkDwJer57WSYOuWFGK+jm8rMVGvt3mad
 IlOeYGDU
X-Authority-Analysis: v=2.4 cv=OPYn3TaB c=1 sm=1 tr=0 ts=68c8e9b7 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=mquHhlIcp2zkOtttQVsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 006xdHDh8L4d6QMDa6LrH3NyDa1D_WJ6
X-Proofpoint-ORIG-GUID: 2v8ZyIBNVNRpIGuxJGQxzr4KODt9Zz7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 8:38=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/09/2025 10:27, Athira Rajeev wrote:
>> Add vpa dtl pmu auxtrace process function for "perf report -D".
>> The auxtrace event processing functions are defined in file
>> "util/powerpc-vpadtl.c". Data structures used includes "struct
>> powerpc_vpadtl_queue", "struct powerpc_vpadtl" to store the auxtrace
>> buffers in queue. Different PERF_RECORD_XXX are generated
>> during recording. PERF_RECORD_AUXTRACE_INFO is processed first
>> since it is of type perf_user_event_type and perf session event
>> delivers perf_session__process_user_event() first. Define function
>> powerpc_vpadtl_process_auxtrace_info() to handle the processing of
>> PERF_RECORD_AUXTRACE_INFO records. In this function, initialize
>> the aux buffer queues using auxtrace_queues__init(). Setup the
>> required infrastructure for aux data processing. The data is =
collected
>> per CPU and auxtrace_queue is created for each CPU.
>>=20
>> Define powerpc_vpadtl_process_event() function to process
>> PERF_RECORD_AUXTRACE records. In this, add the event to queue using
>> auxtrace_queues__add_event() and process the buffer in
>> powerpc_vpadtl_dump_event(). The first entry in the buffer with
>> timebase as zero has boot timebase and frequency. Remaining data is =
of
>> format for "struct powerpc_vpadtl_entry". Define the translation for
>> dispatch_reasons and preempt_reasons, report this when dump trace is
>> invoked via powerpc_vpadtl_dump()
>>=20
>> Sample output:
>>=20
>>   ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>>   [ perf record: Woken up 1 times to write data ]
>>   [ perf record: Captured and wrote 0.300 MB perf.data ]
>>=20
>>   ./perf report -D
>>=20
>>   0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  =
ref: 0  idx: 0  tid: -1  cpu: 0
>>   .
>>   . ... VPA DTL PMU data: size 1680 bytes, entries is 35
>>   .  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
>>   .  00000030: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, =
ready_to_enqueue_time:187, waiting_to_ready_time:6611773
>>   .  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, =
waiting_to_ready_time:15359437
>>   .  00000090: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, =
ready_to_enqueue_time:232, waiting_to_ready_time:5100709
>>   .  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, =
waiting_to_ready_time:30714243
>>   .  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, =
waiting_to_ready_time:15350648
>>   .  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, =
waiting_to_ready_time:15353446
>>   .  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, =
waiting_to_ready_time:15355126
>>   .  00000180: dispatch_reason:decrementer interrupt, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, =
ready_to_enqueue_time:164, waiting_to_ready_time:5104665
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> Changelog:
>> Addressed review comments from Adrian
>> - Renamed dtl_entry to powerpc_vpadtl_entry in util/event.h
>> - Removed unused #includes in powerpc-vpadtl.c
>> - Added helper session_to_vpa to get "struct powerpc_vpadtl"
>> - Updated auxtrace_queues__add_event only for piped data
>> - Used zfree to free "struct powerpc_vpadtl_queue"
>>=20
>> tools/perf/util/Build            |   1 +
>> tools/perf/util/auxtrace.c       |   3 +
>> tools/perf/util/event.h          |  16 ++
>> tools/perf/util/powerpc-vpadtl.c | 263 =
+++++++++++++++++++++++++++++++
>> tools/perf/util/powerpc-vpadtl.h |   7 +
>> 5 files changed, 290 insertions(+)
>> create mode 100644 tools/perf/util/powerpc-vpadtl.c
>>=20
>> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
>> index 4959e7a990e4..5ead46dc98e7 100644
>> --- a/tools/perf/util/Build
>> +++ b/tools/perf/util/Build
>> @@ -136,6 +136,7 @@ perf-util-$(CONFIG_AUXTRACE) +=3D =
arm-spe-decoder/
>> perf-util-$(CONFIG_AUXTRACE) +=3D hisi-ptt.o
>> perf-util-$(CONFIG_AUXTRACE) +=3D hisi-ptt-decoder/
>> perf-util-$(CONFIG_AUXTRACE) +=3D s390-cpumsf.o
>> +perf-util-$(CONFIG_AUXTRACE) +=3D powerpc-vpadtl.o
>>=20
>> ifdef CONFIG_LIBOPENCSD
>> perf-util-$(CONFIG_AUXTRACE) +=3D cs-etm.o
>> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
>> index f294658bb948..6d10f3d61ff8 100644
>> --- a/tools/perf/util/auxtrace.c
>> +++ b/tools/perf/util/auxtrace.c
>> @@ -55,6 +55,7 @@
>> #include "hisi-ptt.h"
>> #include "s390-cpumsf.h"
>> #include "util/mmap.h"
>> +#include "powerpc-vpadtl.h"
>>=20
>> #include <linux/ctype.h>
>> #include "symbol/kallsyms.h"
>> @@ -1394,6 +1395,8 @@ int perf_event__process_auxtrace_info(struct =
perf_session *session,
>> err =3D hisi_ptt_process_auxtrace_info(event, session);
>> break;
>> case PERF_AUXTRACE_VPA_DTL:
>> + err =3D powerpc_vpadtl_process_auxtrace_info(event, session);
>> + break;
>> case PERF_AUXTRACE_UNKNOWN:
>> default:
>> return -EINVAL;
>> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
>> index e40d16d3246c..7ba208ae86fd 100644
>> --- a/tools/perf/util/event.h
>> +++ b/tools/perf/util/event.h
>> @@ -254,6 +254,22 @@ struct perf_synth_intel_iflag_chg {
>> u64 branch_ip; /* If via_branch */
>> };
>>=20
>> +/*
>> + * The powerpc VPA DTL entries are of below format
>> + */
>> +struct powerpc_vpadtl_entry {
>> + u8      dispatch_reason;
>> + u8      preempt_reason;
>> + u16     processor_id;
>> + u32     enqueue_to_dispatch_time;
>> + u32     ready_to_enqueue_time;
>> + u32     waiting_to_ready_time;
>> + u64     timebase;
>> + u64     fault_addr;
>> + u64     srr0;
>> + u64     srr1;
>> +};
>> +
>> static inline void *perf_synth__raw_data(void *p)
>> {
>> return p + 4;
>> diff --git a/tools/perf/util/powerpc-vpadtl.c =
b/tools/perf/util/powerpc-vpadtl.c
>> new file mode 100644
>> index 000000000000..2e8488a3dbd7
>> --- /dev/null
>> +++ b/tools/perf/util/powerpc-vpadtl.c
>> @@ -0,0 +1,263 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VPA DTL PMU support
>> + */
>> +
>> +#include <inttypes.h>
>> +#include "color.h"
>> +#include "evlist.h"
>> +#include "session.h"
>=20
> Should really also:
>=20
> #include "auxtrace.h"
> #include "data.h"
> #include "machine.h"
>=20
>> +#include "debug.h"
>> +#include "powerpc-vpadtl.h"
>> +
>> +/*
>> + * Structure to save the auxtrace queue
>> + */
>> +struct powerpc_vpadtl {
>> + struct auxtrace auxtrace;
>> + struct auxtrace_queues queues;
>> + struct auxtrace_heap heap;
>> + u32 auxtrace_type;
>> + struct perf_session *session;
>> + struct machine *machine;
>> + u32 pmu_type;
>> +};
>> +
>> +struct boottb_freq {
>> + u64     boot_tb;
>> + u64     tb_freq;
>> + u64     timebase;
>> + u64     padded[3];
>> +};
>> +
>> +struct powerpc_vpadtl_queue {
>> + struct powerpc_vpadtl *vpa;
>> + unsigned int queue_nr;
>> + struct auxtrace_buffer *buffer;
>> + struct thread *thread;
>> + bool on_heap;
>> + bool done;
>> + pid_t pid;
>> + pid_t tid;
>> + int cpu;
>> +};
>> +
>> +const char *dispatch_reasons[11] =3D {
>> + "external_interrupt",
>> + "firmware_internal_event",
>> + "H_PROD",
>> + "decrementer_interrupt",
>> + "system_reset",
>> + "firmware_internal_event",
>> + "conferred_cycles",
>> + "time_slice",
>> + "virtual_memory_page_fault",
>> + "expropriated_adjunct",
>> + "priv_doorbell"};
>> +
>> +const char *preempt_reasons[10] =3D {
>> + "unused",
>> + "firmware_internal_event",
>> + "H_CEDE",
>> + "H_CONFER",
>> + "time_slice",
>> + "migration_hibernation_page_fault",
>> + "virtual_memory_page_fault",
>> + "H_CONFER_ADJUNCT",
>> + "hcall_adjunct",
>> + "HDEC_adjunct"};
>> +
>> +#define dtl_entry_size sizeof(struct powerpc_vpadtl_entry)
>> +
>> +/*
>> + * Function to dump the dispatch trace data when perf report
>> + * is invoked with -D
>> + */
>> +static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa =
__maybe_unused,
>> +  unsigned char *buf, size_t len)
>> +{
>> + struct powerpc_vpadtl_entry *dtl;
>> + int pkt_len, pos =3D 0;
>> + const char *color =3D PERF_COLOR_BLUE;
>> +
>> + color_fprintf(stdout, color,
>> + ". ... VPA DTL PMU data: size %zu bytes, entries is %zu\n",
>> + len, len/dtl_entry_size);
>> +
>> + if (len % dtl_entry_size)
>> + len =3D len - (len % dtl_entry_size);
>> +
>> + while (len) {
>> + pkt_len =3D dtl_entry_size;
>> + printf(".");
>> + color_fprintf(stdout, color, "  %08x: ", pos);
>> + dtl =3D (struct powerpc_vpadtl_entry *)buf;
>> + if (dtl->timebase !=3D 0) {
>> + printf("dispatch_reason:%s, preempt_reason:%s, =
enqueue_to_dispatch_time:%d,"
>> + "ready_to_enqueue_time:%d, waiting_to_ready_time:%d\n",
>> + dispatch_reasons[dtl->dispatch_reason], =
preempt_reasons[dtl->preempt_reason],\
>> + be32_to_cpu(dtl->enqueue_to_dispatch_time),\
>> + be32_to_cpu(dtl->ready_to_enqueue_time), =
be32_to_cpu(dtl->waiting_to_ready_time));
>=20
> Better if these lines were 100 columns or less
>=20
>> + } else {
>> + struct boottb_freq *boot_tb =3D (struct boottb_freq *)buf;
>> +
>> + printf("boot_tb: %" PRIu64 ", tb_freq: %" PRIu64 "\n", =
boot_tb->boot_tb, boot_tb->tb_freq);
>=20
> Better if this lines was 100 columns or less
>=20
>=20
>> + }
>> +
>> + pos +=3D pkt_len;
>> + buf +=3D pkt_len;
>> + len -=3D pkt_len;
>> + }
>> +}
>> +
>> +static struct powerpc_vpadtl *session_to_vpa(struct perf_session =
*session)
>> +{
>> + return container_of(session->auxtrace, struct powerpc_vpadtl, =
auxtrace);
>> +}
>> +
>> +static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, =
unsigned char *buf,
>> +        size_t len)
>> +{
>> + printf(".\n");
>> + powerpc_vpadtl_dump(vpa, buf, len);
>> +}
>> +
>> +static int powerpc_vpadtl_process_event(struct perf_session *session =
__maybe_unused,
>> +  union perf_event *event __maybe_unused,
>> +  struct perf_sample *sample __maybe_unused,
>> +  const struct perf_tool *tool __maybe_unused)
>> +{
>> + return 0;
>> +}
>> +
>> +/*
>> + * Process PERF_RECORD_AUXTRACE records
>> + */
>> +static int powerpc_vpadtl_process_auxtrace_event(struct perf_session =
*session,
>> +   union perf_event *event,
>> +   const struct perf_tool *tool __maybe_unused)
>> +{
>> + struct powerpc_vpadtl *vpa =3D session_to_vpa(session);
>> + struct auxtrace_buffer *buffer;
>> + int fd =3D perf_data__fd(session->data);
>> + off_t data_offset;
>> + int err;
>> +
>> + if (!dump_trace)
>> + return 0;
>> +
>> + if (perf_data__is_pipe(session->data)) {
>> + data_offset =3D 0;
>> + } else {
>> + data_offset =3D lseek(fd, 0, SEEK_CUR);
>> + if (data_offset =3D=3D -1)
>> + return -errno;
>> + }
>> +
>> + err =3D auxtrace_queues__add_event(&vpa->queues, session, event,
>> + data_offset, &buffer);
>> +
>> + if (err)
>> + return err;
>> +
>> + /* Dump here now we have copied a piped trace out of the pipe */
>> + if (auxtrace_buffer__get_data(buffer, fd)) {
>> + powerpc_vpadtl_dump_event(vpa, buffer->data, buffer->size);
>> + auxtrace_buffer__put_data(buffer);
>> + }
>> +
>> + return 0;
>> +}
>> +
>> +static int powerpc_vpadtl_flush(struct perf_session *session =
__maybe_unused,
>> +  const struct perf_tool *tool __maybe_unused)
>> +{
>> + return 0;
>> +}
>> +
>> +static void powerpc_vpadtl_free_events(struct perf_session *session)
>> +{
>> + struct powerpc_vpadtl *vpa =3D session_to_vpa(session);
>> + struct auxtrace_queues *queues =3D &vpa->queues;
>> + struct powerpc_vpadtl_queue *vpaq;
>> +
>> + unsigned int i;
>> +
>> + for (i =3D 0; i < queues->nr_queues; i++) {
>=20
> Modern style allows int decl. inside for() e.g.
>=20
> for (int i =3D 0; i < queues->nr_queues; i++) {
>=20
>> + vpaq =3D queues->queue_array[i].priv;
>> + if (vpaq)
>> + zfree(&vpaq);
>=20
> free() can handle NULL, so vpaq not needed, just
>=20
> zfree(&queues->queue_array[i].priv);

Ok, got it

I will address these changes in V3

Thanks
Athira
>=20
>> + }
>> +
>> + auxtrace_queues__free(queues);
>> +}
>> +
>> +static void powerpc_vpadtl_free(struct perf_session *session)
>> +{
>> + struct powerpc_vpadtl *vpa =3D session_to_vpa(session);
>> +
>> + auxtrace_heap__free(&vpa->heap);
>> + powerpc_vpadtl_free_events(session);
>> + session->auxtrace =3D NULL;
>> + free(vpa);
>> +}
>> +
>> +static const char * const powerpc_vpadtl_info_fmts[] =3D {
>> + [POWERPC_VPADTL_TYPE] =3D "  PMU Type           %"PRId64"\n",
>> +};
>> +
>> +static void powerpc_vpadtl_print_info(__u64 *arr)
>> +{
>> + if (!dump_trace)
>> + return;
>> +
>> + fprintf(stdout, powerpc_vpadtl_info_fmts[POWERPC_VPADTL_TYPE], =
arr[POWERPC_VPADTL_TYPE]);
>> +}
>> +
>> +/*
>> + * Process the PERF_RECORD_AUXTRACE_INFO records and setup
>> + * the infrastructure to process auxtrace events. =
PERF_RECORD_AUXTRACE_INFO
>> + * is processed first since it is of type perf_user_event_type.
>> + * Initialise the aux buffer queues using auxtrace_queues__init().
>> + * auxtrace_queue is created for each CPU.
>> + */
>> +int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
>> +   struct perf_session *session)
>> +{
>> + struct perf_record_auxtrace_info *auxtrace_info =3D =
&event->auxtrace_info;
>> + size_t min_sz =3D sizeof(u64) * POWERPC_VPADTL_TYPE;
>> + struct powerpc_vpadtl *vpa;
>> + int err;
>> +
>> + if (auxtrace_info->header.size < sizeof(struct =
perf_record_auxtrace_info) +
>> + min_sz)
>> + return -EINVAL;
>> +
>> + vpa =3D zalloc(sizeof(struct powerpc_vpadtl));
>> + if (!vpa)
>> + return -ENOMEM;
>> +
>> + err =3D auxtrace_queues__init(&vpa->queues);
>> + if (err)
>> + goto err_free;
>> +
>> + vpa->session =3D session;
>> + vpa->machine =3D &session->machines.host; /* No kvm support */
>> + vpa->auxtrace_type =3D auxtrace_info->type;
>> + vpa->pmu_type =3D auxtrace_info->priv[POWERPC_VPADTL_TYPE];
>> +
>> + vpa->auxtrace.process_event =3D powerpc_vpadtl_process_event;
>> + vpa->auxtrace.process_auxtrace_event =3D =
powerpc_vpadtl_process_auxtrace_event;
>> + vpa->auxtrace.flush_events =3D powerpc_vpadtl_flush;
>> + vpa->auxtrace.free_events =3D powerpc_vpadtl_free_events;
>> + vpa->auxtrace.free =3D powerpc_vpadtl_free;
>> + session->auxtrace =3D &vpa->auxtrace;
>> +
>> + powerpc_vpadtl_print_info(&auxtrace_info->priv[0]);
>> +
>> + return 0;
>> +
>> +err_free:
>> + free(vpa);
>> + return err;
>> +}
>> diff --git a/tools/perf/util/powerpc-vpadtl.h =
b/tools/perf/util/powerpc-vpadtl.h
>> index 50a7aa24acbe..aa76f5beac2c 100644
>> --- a/tools/perf/util/powerpc-vpadtl.h
>> +++ b/tools/perf/util/powerpc-vpadtl.h
>> @@ -15,4 +15,11 @@ enum {
>>=20
>> #define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * =
sizeof(u64))
>>=20
>> +union perf_event;
>> +struct perf_session;
>> +struct perf_pmu;
>> +
>> +int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
>> +   struct perf_session *session);
>> +
>> #endif



