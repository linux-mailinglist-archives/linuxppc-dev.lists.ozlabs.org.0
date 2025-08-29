Return-Path: <linuxppc-dev+bounces-11476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A311B3B608
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:32:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCs2M42rWz2ymg;
	Fri, 29 Aug 2025 18:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756456331;
	cv=none; b=ZlW1gTgBFhNTwFTG21IuWSZmcLNb5tPEcXKsvpVCfygpruuPJ8fMnv+BzRYAK6uFiSuJp3GwAjywYjySxUxwX0ohrjVBpXu7CleBskeKrTjzZ3AZvg4VxKsJWSutSydLzUZOaoDRShikqMRLx7D6RQXfYsqD8AxvzCP9UkpvPnflbBuX1v6Vyms+Cbz4s1AbcQpA+I0dRmslrmzhP/QmP8mliemiuV481H4SNuODjgpTWHVB+u+jBh2EhtKJtwvW9tLvSOLbvDFFkxRYTPdKUWQg82mm6C2yE3GfD2eaDafKEERZAWspFUAwCjfRNFzli6n4jg0hPEr6TQtyrR9oZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756456331; c=relaxed/relaxed;
	bh=/gR7gfbYryrn3KdsnBEpMdkPVdA9t3qnXDVJ7IjT5D8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JNc/8WmbyWkMyM0lBHbYbG2uQT5NpDkI1YI9U/XgI063n47Cpbfw51P/Zsnqlu35WnVHTxFcN6KbBpgwPAY6hdRYoo9VsnJDPH4W7+4/Uy/W3eY/6tCZKaGjbftXrHzU48EdMJZ6Q2P3G5bwyrWfYt1oHyiACgDuGt27qrFkSw0l2SK6WI8WeHIaVS/9d3JIVq+0IC7asjlBn0Lcj8Jh7Ll+mN1R6Zwoc9IotryimPj+BcKpUV2gN6RitcQs5vHphgUudvzcZB3C4xNh7G6lYJzvOVjm6G9ejTuYy6BAOeDdzLhC7PVQUX7D9hNyjpACAp7UKQsGRcg+Xi7R8DVyQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bPzt5bbU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bPzt5bbU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCs2L4X1Vz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:32:10 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8HT47021067;
	Fri, 29 Aug 2025 08:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/gR7gf
	bYryrn3KdsnBEpMdkPVdA9t3qnXDVJ7IjT5D8=; b=bPzt5bbUM8dJLL6zGSwzhT
	21Y5xaL4eJyFi4sSTbXUUgpvwLgC3z+l9yuig9gXHitHY3JB3J68kC1u7x9FQyzj
	d+ngK706cxyThmdMVL4Zs1R3ILuPEums0OmiskE9qlIkWKG9XHQY1GUsFokWm3nU
	D5TFuDNElueW9P7klj2qx1NVtwN5Y0TXJ8ELAlwgemF6tUsirFd3E3qrkpGw2A4F
	Ip6Ij4kWPD9rqa0H+PkQDQUHVOOckR6U2N41b8HtDYnYyLrRAF5k/Z4TdToYxTyO
	iswEtnsNyT2BL65EmIILH5py0L/ZuuVDX27k8URx2s1Ht46hudzxy4WvxAX1QVPg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rw9j00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:32:04 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57T8W352014361;
	Fri, 29 Aug 2025 08:32:03 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rw9hyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:32:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57T7mOxt002512;
	Fri, 29 Aug 2025 08:32:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qryq0y7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:32:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57T8VwRl21365118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:31:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEDE72004B;
	Fri, 29 Aug 2025 08:31:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C48AA20040;
	Fri, 29 Aug 2025 08:31:51 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 Aug 2025 08:31:51 +0000 (GMT)
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
Subject: Re: [PATCH 08/14] tools/perf: process auxtrace events and display in
 perf report -D
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <e598c888-0635-4de8-814b-5bf38d0fec9a@intel.com>
Date: Fri, 29 Aug 2025 14:01:37 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E984B389-08BD-4880-BE1F-EAB2C24C0EC0@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-9-atrajeev@linux.ibm.com>
 <e598c888-0635-4de8-814b-5bf38d0fec9a@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ymeCdoxRcF7k7K9JAUovgvJ1zQGCfCa_
X-Authority-Analysis: v=2.4 cv=fbCty1QF c=1 sm=1 tr=0 ts=68b16584 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=mquHhlIcp2zkOtttQVsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 85cabH4JaS1QIJqTooMCSymNhRzFehzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA1NSBTYWx0ZWRfX24pRRDDBRIPM
 b4a6AHs1Wruq2uhB24mOBhDlBnoovoYgXhxM9waKAyeq6os91A8hQOC3hJ6iZhcaSdHlaN7RgFr
 IvbrJjD0EMLCyaJea48/eS9/L/Oy3eQCuzan9XgNBIU/+mlGPL8LNebxQizb3+2oVzlWa0Fz36S
 8gdnp5fLBlozrSRfdwI01z1Te0JIjJ/DOTT/fwlRrqOmsaZRJVt85dS7Ef9uX4CyIMqLERoEtDl
 UYCvLDAgVjtPsC9DVdK8xG+H0SYQAxCJrl5PTuSYJWQMniIPCmHw4Lgtp9dSvgPN6C1wl3iT8PO
 Zj0r4TLP0qAFtu2ZnQ+RdYuViOkkRBKOXNNo5StPvrL8umHlwouJgQnEOkayuEHan0W5293dFGu
 /IlP8ETe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 27 Aug 2025, at 10:58=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/08/2025 11:34, Athira Rajeev wrote:
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
>> format for "struct dtl_entry". Define the translation for
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
>> tools/perf/util/Build            |   1 +
>> tools/perf/util/auxtrace.c       |   2 +
>> tools/perf/util/powerpc-vpadtl.c | 299 =
+++++++++++++++++++++++++++++++
>> 3 files changed, 302 insertions(+)
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
>> index f587d386c5ef..bd1404f26bb7 100644
>> --- a/tools/perf/util/auxtrace.c
>> +++ b/tools/perf/util/auxtrace.c
>> @@ -1395,6 +1395,8 @@ int perf_event__process_auxtrace_info(struct =
perf_session *session,
>> err =3D hisi_ptt_process_auxtrace_info(event, session);
>> break;
>> case PERF_AUXTRACE_VPA_PMU:
>> + err =3D powerpc_vpadtl_process_auxtrace_info(event, session);
>> + break;
>> case PERF_AUXTRACE_UNKNOWN:
>> default:
>> return -EINVAL;
>> diff --git a/tools/perf/util/powerpc-vpadtl.c =
b/tools/perf/util/powerpc-vpadtl.c
>> new file mode 100644
>> index 000000000000..ea7b59c45f4a
>> --- /dev/null
>> +++ b/tools/perf/util/powerpc-vpadtl.c
>> @@ -0,0 +1,299 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VPA DTL PMU support
>> + */
>> +
>> +#include <endian.h>
>> +#include <errno.h>
>> +#include <byteswap.h>
>> +#include <inttypes.h>
>> +#include <linux/kernel.h>
>> +#include <linux/types.h>
>> +#include <linux/bitops.h>
>> +#include <linux/log2.h>
>> +#include <elf.h>
>> +#include <limits.h>
>> +
>> +#include "cpumap.h"
>> +#include "color.h"
>> +#include "evsel.h"
>> +#include "evlist.h"
>> +#include "machine.h"
>> +#include "session.h"
>> +#include "util.h"
>> +#include "thread.h"
>> +#include "debug.h"
>> +#include "auxtrace.h"
>> +#include "powerpc-vpadtl.h"
>> +#include "map.h"
>> +#include "symbol_conf.h"
>> +#include "symbol.h"
>=20
> Are all these #includes really needed
>=20
>> +
>> +/*
>> + * The DTL entries are of below format
>> + */
>> +struct dtl_entry {
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
>=20
> struct dtl_entry is moved in a later patch.
> Maybe call it vpadtl_entry or powerpc_vpadtl_entry and
> put it in perf/util/event.h since it is eventually needed
> in perf/builtin-script.c
Sure


>=20
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
>> +#define dtl_entry_size 48
>=20
> sizeof(struct dtl_entry) ?
>=20
>> +
>> +/*
>> + * Function to dump the dispatch trace data when perf report
>> + * is invoked with -D
>> + */
>> +static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa =
__maybe_unused,
>> +  unsigned char *buf, size_t len)
>> +{
>> + struct dtl_entry *dtl;
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
>> + pkt_len =3D 48;
>=20
> dtl_entry_size ?
Yes, thanks for pointing out. Will change in V2
>=20
>> + printf(".");
>> + color_fprintf(stdout, color, "  %08x: ", pos);
>> + dtl =3D (struct dtl_entry *)buf;
>> + if (dtl->timebase !=3D 0) {
>> + printf("dispatch_reason:%s, preempt_reason:%s, =
enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d, =
waiting_to_ready_time:%d\n",
>> + dispatch_reasons[dtl->dispatch_reason], =
preempt_reasons[dtl->preempt_reason], =
be32_to_cpu(dtl->enqueue_to_dispatch_time),
>> + be32_to_cpu(dtl->ready_to_enqueue_time), =
be32_to_cpu(dtl->waiting_to_ready_time));
>=20
> Lines are getting a bit long

Will split these.
>=20
>> + } else {
>> + struct boottb_freq *boot_tb =3D (struct boottb_freq *)buf;
>> +
>> + printf("boot_tb: %" PRIu64 ", tb_freq: %" PRIu64 "\n", =
boot_tb->boot_tb, boot_tb->tb_freq);
>> + }
>> +
>> + pos +=3D pkt_len;
>> + buf +=3D pkt_len;
>> + len -=3D pkt_len;
>> + }
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
>> + struct powerpc_vpadtl *vpa =3D container_of(session->auxtrace, =
struct powerpc_vpadtl,
>> +      auxtrace);
>=20
> Might be worth adding a helper like
>=20
> static struct powerpc_vpadtl *session_to_vpa(struct perf_session =
*session)
> {
> return container_of(session->auxtrace, struct powerpc_vpadtl, =
auxtrace);
> }
Ok Adrian
>=20
>> + struct auxtrace_buffer *buffer;
>> + off_t data_offset;
>> + int fd =3D perf_data__fd(session->data);
>> + int err;
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
>> +  data_offset, &buffer);
>=20
> auxtrace_queues__add_event() is only needed here if there is no
> auxtrace index, however an auxtrace index is always written for
> new perf.data files.  The index gets processed and data queued
> by auxtrace_queues__process_index() which is added in patch 11.
>=20
> Piped data, on the other hand, has no index and needs to be
> handled here.
>=20
> So:
>=20
> if (perf_data__is_pipe(session->data)) {
> err =3D auxtrace_queues__add_event(&vpa->queues, session, event, 0, =
&buffer);
> if (err)
> return err;
> }
>=20
>=20

Ok, will handle this change

>> + if (err)
>> + return err;
>> +
>> + /* Dump here now we have copied a piped trace out of the pipe */
>> + if (dump_trace) {
>> + if (auxtrace_buffer__get_data(buffer, fd)) {
>> + powerpc_vpadtl_dump_event(vpa, buffer->data,
>> +      buffer->size);
>=20
> Unnecessary line wrap
>=20
>> + auxtrace_buffer__put_data(buffer);
>> + }
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
>> +static void powerpc_vpadtl_free_queue(void *priv)
>> +{
>> + struct powerpc_vpadtl_queue *vpaq =3D priv;
>> +
>> + if (!vpaq)
>> + return;
>> +
>> + free(vpaq);
>> +}
>> +
>> +static void powerpc_vpadtl_free_events(struct perf_session *session)
>> +{
>> + struct powerpc_vpadtl *vpa =3D container_of(session->auxtrace, =
struct powerpc_vpadtl,
>> +      auxtrace);
>> + struct auxtrace_queues *queues =3D &vpa->queues;
>> + unsigned int i;
>> +
>> + for (i =3D 0; i < queues->nr_queues; i++) {
>> + powerpc_vpadtl_free_queue(queues->queue_array[i].priv);
>=20
> This is the same as free(queues->queue_array[i].priv)
>=20
>> + queues->queue_array[i].priv =3D NULL;
>=20
> Could all be reduced to zfree(queues->queue_array[i].priv)
Sure
>=20
>> + }
>> + auxtrace_queues__free(queues);
>> +}
>> +
>> +static void powerpc_vpadtl_free(struct perf_session *session)
>> +{
>> + struct powerpc_vpadtl *vpa =3D container_of(session->auxtrace, =
struct powerpc_vpadtl,
>> +      auxtrace);
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



