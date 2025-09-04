Return-Path: <linuxppc-dev+bounces-11701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3939AB433E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 09:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHWGq5BTQz2yrZ;
	Thu,  4 Sep 2025 17:25:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756970739;
	cv=none; b=ACkbkBaygFv7E/4Jqu+VoO/yabgt6POtAMaxYa8ZO8kq6scoe4YVw6XMwDVZFqb5Zn2n9VRsJywrL5ODMeTsCUB1vm8Tgz6VfS43vSygz1Q1qOGV8jfPy8BzsCb3+8MRNeqya3fC4TWmeFzkzE3ue+bHozOgHWEQJCyexKzepGE2mcpMeOUoRJ1OObGl9/qCS++d9KDWVyuTTRm0zjbH3kVMxdw7yLVxmbKe133rUN0IPbOMr5JQnTOYoVroFrB5IhIHzn0ROZcdoqf85X2P60zIlnJT9fs4EcVc+UcQT5xNI5JUHXz3ktdeJQY5kbo2Gq7dLArsqz8LeaL6OCp+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756970739; c=relaxed/relaxed;
	bh=4N1xXaD4Lo/AQH86BCIG+nsN6NdrxIiHs+rz0WgNkp0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=A4kMUU6MH+jQCbdMarKF3eJjrzCxXXq8tULdsHeNfxWY76isH85+x5BJW1Xfi3k/px8n2FcJoStNpuaNRhlh4jOcmtgZau2mnDlkJfSD6caEyEsO3SSqd7lID7+GAnIhsEcyd8aShPM5OVSLkclWz2VOcd29RIJvHpfVn4aNA6m1GnYvB0gw2MtwgoBmzaZeOLWIlfS28fsPYEgJ0bKkRhkm9bQVtxDuvG+QZbOO933DpOIP4dN38CcMctrlz7PG7UIa7FMxzCKR1D4Gh69f51zCDHpl1V5nyKow1ng1LBBjtklQoNIm/EEdjlVdiTSbsUNNvEMctDV4NrUAzArZRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dmGEcNdl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dmGEcNdl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHWGp2xtLz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 17:25:38 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583LOHsI000416;
	Thu, 4 Sep 2025 07:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4N1xXa
	D4Lo/AQH86BCIG+nsN6NdrxIiHs+rz0WgNkp0=; b=dmGEcNdlmYEp3eHFVwQ45k
	hCmpFyvVwgFhI4CF5NFz/0cQdPOD8wEoWXvukPjJJoA+z4xxyZ9Wx7T+GtVOBZcs
	/GViqXtiecF7BjrOZuRkGJPmO0zxhKdlBLYFYn7OIo7kjKfiJx0EGXPa5dw8+0MB
	oPTL8bwKQ3k1vUJDBHMxse5HIrgEt8t6Mm9QKy4Vxc4Ycu/6BfR9eEb3MD+85Nll
	bmIUNVmG1S/i8j3o4ojMCvV/cZu5V8MTCtldiKWvu0Ud8lH24B9RI55T9kCl87k4
	bBTwX8VNw3Wxz4tF0lwrzFAIfVjF/O1+sZyvpkWRG+1Mv+ze/ZL8pjPfy7weexfw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf4efs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 07:25:30 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5847NGjt018818;
	Thu, 4 Sep 2025 07:25:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf4efq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 07:25:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5846vBse017612;
	Thu, 4 Sep 2025 07:25:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vc10udy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 07:25:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5847PQxt55837152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Sep 2025 07:25:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D3AF20040;
	Thu,  4 Sep 2025 07:25:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 874512004B;
	Thu,  4 Sep 2025 07:25:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.110])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  4 Sep 2025 07:25:19 +0000 (GMT)
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
Subject: Re: [PATCH 02/14] powerpc/vpa_dtl: Add interface to expose vpa dtl
 counters via perf
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <e6830e48-0356-4057-9b73-74b8fef0bd3b@linux.ibm.com>
Date: Thu, 4 Sep 2025 12:55:05 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EA52F01F-33DC-4CEB-9327-D7E386BD649D@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-3-atrajeev@linux.ibm.com>
 <e6830e48-0356-4057-9b73-74b8fef0bd3b@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HB9zPtCLvuBTy9nnbaFf_33VrpGUXA3z
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68b93eea cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=PTHvKxOmyM_zpjdSv2QA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: T37iDAIyYUcOil10ibpQcR4zJvog2ZY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfXzFG/LSOqloAl
 WnqoBKWWZTsziTe/I70fFkU0+MqRJTkgU4ys2iTbr2ddVvQ1MsGg6E3/UXscDfxkqmu62nofS++
 N0TswmVA1g8cENLMA7/EVmHed5/w72SAuMmI7D3xPkkL3J2g+VL1exvU8HIv0aaLmHYHtaX6n1F
 lC7Lo23Poy+VeCQcakwsmpXuKKUaJYyfNVffeOJQL4G9CYB4alw0QPbKl6fELRzZpTd1Yk7QulA
 YbQ8bGx5VxFXET+NcZHRxVayes3nXqPWQwt0K86QiypYaXCkKYHSX6zicUM+SoN/GkBY8OlI2Rc
 WTwFse4u/qKE+jE/RYjY0Dx79WSbCzrLINWMSamUKz1GZaKZ9eFGPrwDGTnbn6f2xQRa64vRtj1
 YfP3Bm/l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 20 Aug 2025, at 5:23=E2=80=AFPM, Shrikanth Hegde =
<sshegde@linux.ibm.com> wrote:
>=20
>=20
>=20
> On 8/15/25 14:03, Athira Rajeev wrote:
>> From: Kajol Jain <kjain@linux.ibm.com>
>> The pseries Shared Processor Logical Partition(SPLPAR) machines
>> can retrieve a log of dispatch and preempt events from the
>> hypervisor using data from Disptach Trace Log(DTL) buffer.
>> With this information, user can retrieve when and why each dispatch &
>> preempt has occurred. Added an interface to expose the Virtual =
Processor
>> Area(VPA) DTL counters via perf.
>> The following events are available and exposed in sysfs:
>>  vpa_dtl/dtl_cede/ - Trace voluntary (OS initiated) virtual processor =
waits
>>  vpa_dtl/dtl_preempt/ - Trace time slice preempts
>>  vpa_dtl/dtl_fault/ - Trace virtual partition memory page faults.
>>  vpa_dtl/dtl_all/ - Trace all (dtl_cede/dtl_preempt/dtl_fault)
>> Added interface defines supported event list, config fields for the
>> event attributes and their corresponding bit values which are =
exported
>> via sysfs. User could use the standard perf tool to access perf =
events
>> exposed via vpa-dtl pmu.
>> The VPA DTL PMU counters do not interrupt on overflow or generate any
>> PMI interrupts. Therefore, the kernel needs to poll the counters, =
added
>> hrtimer code to do that. The timer interval can be provided by user =
via
>> sample_period field in nano seconds. There is one hrtimer added per
>> vpa-dtl pmu thread.
>> To ensure there are no other conflicting dtl users (example: debugfs =
dtl
>> or /proc/powerpc/vcpudispatch_stats), interface added code to use
>> "down_write_trylock" call to take the dtl_access_lock. The =
dtl_access_lock
>> is defined in dtl.h file. Also added global reference count variable =
called
>> "dtl_global_refc", to ensure dtl data can be captured per-cpu. Code =
also
>> added global lock called "dtl_global_lock" to avoid race condition.
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/Makefile  |   2 +-
>>  arch/powerpc/perf/vpa-dtl.c | 349 =
++++++++++++++++++++++++++++++++++++
>>  2 files changed, 350 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/powerpc/perf/vpa-dtl.c
>> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
>> index 7f53fcb7495a..78dd7e25219e 100644
>> --- a/arch/powerpc/perf/Makefile
>> +++ b/arch/powerpc/perf/Makefile
>> @@ -14,7 +14,7 @@ obj-$(CONFIG_PPC_POWERNV) +=3D imc-pmu.o
>>  obj-$(CONFIG_FSL_EMB_PERF_EVENT) +=3D core-fsl-emb.o
>>  obj-$(CONFIG_FSL_EMB_PERF_EVENT_E500) +=3D e500-pmu.o e6500-pmu.o
>>  -obj-$(CONFIG_HV_PERF_CTRS) +=3D hv-24x7.o hv-gpci.o hv-common.o
>> +obj-$(CONFIG_HV_PERF_CTRS) +=3D hv-24x7.o hv-gpci.o hv-common.o =
vpa-dtl.o
>>    obj-$(CONFIG_VPA_PMU) +=3D vpa-pmu.o
>>  diff --git a/arch/powerpc/perf/vpa-dtl.c =
b/arch/powerpc/perf/vpa-dtl.c
>> new file mode 100644
>> index 000000000000..e92756f88801
>> --- /dev/null
>> +++ b/arch/powerpc/perf/vpa-dtl.c
>> @@ -0,0 +1,349 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Perf interface to expose Dispatch Trace Log counters.
>> + *
>> + * Copyright (C) 2024 Kajol Jain, IBM Corporation
>> + */
>> +
>> +#ifdef CONFIG_PPC_SPLPAR
>> +#define pr_fmt(fmt) "vpa_dtl: " fmt
>> +
>> +#include <asm/dtl.h>
>> +#include <linux/perf_event.h>
>> +#include <asm/plpar_wrappers.h>
>> +
>> +#define EVENT(_name, _code)     enum{_name =3D _code}
>> +
>> +/*
>> + * Based on Power Architecture Platform Reference(PAPR) =
documentation,
>> + * Table 14.14. Per Virtual Processor Area, below Dispatch Trace =
Log(DTL)
>> + * Enable Mask used to get corresponding virtual processor dispatch
>> + * to preempt traces:
>> + *   DTL_CEDE(0x1): Trace voluntary (OS initiated) virtual
>> + *   processor waits
>> + *   DTL_PREEMPT(0x2): Trace time slice preempts
>> + *   DTL_FAULT(0x4): Trace virtual partition memory page
>> + faults.
>> + *   DTL_ALL(0x7): Trace all (DTL_CEDE | DTL_PREEMPT | DTL_FAULT)
>> + *
>> + * Event codes based on Dispatch Trace Log Enable Mask.
>> + */
>> +EVENT(DTL_CEDE,         0x1);
>> +EVENT(DTL_PREEMPT,      0x2);
>> +EVENT(DTL_FAULT,        0x4);
>> +EVENT(DTL_ALL,          0x7);
>> +
>> +GENERIC_EVENT_ATTR(dtl_cede, DTL_CEDE);
>> +GENERIC_EVENT_ATTR(dtl_preempt, DTL_PREEMPT);
>> +GENERIC_EVENT_ATTR(dtl_fault, DTL_FAULT);
>> +GENERIC_EVENT_ATTR(dtl_all, DTL_ALL);
>> +
>> +PMU_FORMAT_ATTR(event, "config:0-7");
>> +
>> +static struct attribute *events_attr[] =3D {
>> + GENERIC_EVENT_PTR(DTL_CEDE),
>> + GENERIC_EVENT_PTR(DTL_PREEMPT),
>> + GENERIC_EVENT_PTR(DTL_FAULT),
>> + GENERIC_EVENT_PTR(DTL_ALL),
>> + NULL
>> +};
>> +
>> +static struct attribute_group event_group =3D {
>> + .name =3D "events",
>> + .attrs =3D events_attr,
>> +};
>> +
>> +static struct attribute *format_attrs[] =3D {
>> + &format_attr_event.attr,
>> + NULL,
>> +};
>> +
>> +static const struct attribute_group format_group =3D {
>> + .name =3D "format",
>> + .attrs =3D format_attrs,
>> +};
>> +
>> +static const struct attribute_group *attr_groups[] =3D {
>> + &format_group,
>> + &event_group,
>> + NULL,
>> +};
>> +
>> +struct vpa_dtl {
>> + struct dtl_entry *buf;
>> + u64 last_idx;
>> + bool active_lock;

Hi Shrikanth,

Thanks for taking time to review this patchset.=20
>=20
> How is this active_lock being used?
> I see it is set/unset, but couldn't figure out how it is used.

It was used in initial design. But missed to remove it when I posted the =
final one.
Thanks for catching this
>=20
>> +};
>> +
>> +static DEFINE_PER_CPU(struct vpa_dtl, vpa_dtl_cpu);
>> +
>> +/* variable to capture reference count for the active dtl threads */
>> +static int dtl_global_refc;
>> +static spinlock_t dtl_global_lock =3D =
__SPIN_LOCK_UNLOCKED(dtl_global_lock);
>> +
>> +/*
>> + * Function to dump the dispatch trace log buffer data to the
>> + * perf data.
>> + */
>> +static void vpa_dtl_dump_sample_data(struct perf_event *event)
>> +{
>> + return;
>> +}
>> +
>> +/*
>> + * The VPA Dispatch Trace log counters do not interrupt on overflow.
>> + * Therefore, the kernel needs to poll the counters to avoid missing
>> + * an overflow using hrtimer. The timer interval is based on =
sample_period
>> + * count provided by user, and minimum interval is 1 millisecond.
>> + */
>> +static enum hrtimer_restart vpa_dtl_hrtimer_handle(struct hrtimer =
*hrtimer)
>> +{
>> + struct perf_event *event;
>> + u64 period;
>> +
>> + event =3D container_of(hrtimer, struct perf_event, hw.hrtimer);
>> +
>> + if (event->state !=3D PERF_EVENT_STATE_ACTIVE)
>> + return HRTIMER_NORESTART;
>> +
>> + vpa_dtl_dump_sample_data(event);
>> + period =3D max_t(u64, NSEC_PER_MSEC, event->hw.sample_period);
>> + hrtimer_forward_now(hrtimer, ns_to_ktime(period));
>> +
>> + return HRTIMER_RESTART;
>> +}
>> +
>> +static void vpa_dtl_start_hrtimer(struct perf_event *event)
>> +{
>> + u64 period;
>> + struct hw_perf_event *hwc =3D &event->hw;
>> +
>> + period =3D max_t(u64, NSEC_PER_MSEC, hwc->sample_period);
>> + hrtimer_start(&hwc->hrtimer, ns_to_ktime(period), =
HRTIMER_MODE_REL_PINNED);
>> +}
>> +
>> +static void vpa_dtl_stop_hrtimer(struct perf_event *event)
>> +{
>> + struct hw_perf_event *hwc =3D &event->hw;
>> +
>> + hrtimer_cancel(&hwc->hrtimer);
>> +}
>> +
>> +static void vpa_dtl_reset_global_refc(struct perf_event *event)
>> +{
>> + spin_lock(&dtl_global_lock);
>> + dtl_global_refc--;
>> + if (dtl_global_refc <=3D 0) {
>> + dtl_global_refc =3D 0;
>> + up_write(&dtl_access_lock);
>> + }
>> + spin_unlock(&dtl_global_lock);
>> +}
>> +
>> +/* Allocate dtl buffer memory for given cpu. */
>=20
> The above comment is self explainable, may not be needed.
Ok, will remove it
>=20
>> +static int vpa_dtl_mem_alloc(int cpu)
>> +{
>> + struct vpa_dtl *dtl =3D &per_cpu(vpa_dtl_cpu, cpu);
>> + struct dtl_entry *buf =3D NULL;
>> +
>> + /* Check for dispatch trace log buffer cache */
>> + if (!dtl_cache)
>> + return -ENOMEM;
>> +
>> + buf =3D kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, =
cpu_to_node(cpu));
>=20
> You probably need GFP_ATOMIC here, since this is called when spinlocks =
are held.
Sure, I will check and add GFP_ATOMIC
>=20
>> + if (!buf) {
>> + pr_warn("buffer allocation failed for cpu %d\n", cpu);
>> + return -ENOMEM;
>> + }
>> + dtl->buf =3D buf;
>> + return 0;
>> +}
>> +
>> +static int vpa_dtl_event_init(struct perf_event *event)
>> +{
>> + struct hw_perf_event *hwc =3D &event->hw;
>> + struct vpa_dtl *dtl =3D &per_cpu(vpa_dtl_cpu, event->cpu);
>> +
>> + /* test the event attr type for PMU enumeration */
>> + if (event->attr.type !=3D event->pmu->type)
>> + return -ENOENT;
>> +
>> + if (!perfmon_capable())
>> + return -EACCES;
>> +
>> + /* Return if this is a counting event */
>> + if (!is_sampling_event(event))
>> + return -EOPNOTSUPP;
>> +
>> + /* no branch sampling */
>> + if (has_branch_stack(event))
>> + return -EOPNOTSUPP;
>> +
>> + /* Invalid eventcode */
>> + switch (event->attr.config) {
>> + case DTL_LOG_CEDE:
>> + case DTL_LOG_PREEMPT:
>> + case DTL_LOG_FAULT:
>> + case DTL_LOG_ALL:
>> + break;
>> + default:
>> + return -EINVAL;
>> + }
>> +
>> + spin_lock(&dtl_global_lock);
>> +
>> + /*
>> +  * To ensure there are no other conflicting dtl users
>> +  * (example: /proc/powerpc/vcpudispatch_stats or debugfs dtl),
>> +  * below code try to take the dtl_access_lock.
>> +  * The dtl_access_lock is a rwlock defined in dtl.h, which is used
>> +  * to unsure there is no conflicting dtl users.
>> +  * Based on below code, vpa_dtl pmu tries to take write access lock
>> +  * and also checks for dtl_global_refc, to make sure that the
>> +  * dtl_access_lock is taken by vpa_dtl pmu interface.
>> +  */
>> + if (dtl_global_refc =3D=3D 0 && =
!down_write_trylock(&dtl_access_lock)) {
>> + spin_unlock(&dtl_global_lock);
>> + return -EBUSY;
>> + }
>> +
>> + /* Allocate dtl buffer memory */
>> + if (vpa_dtl_mem_alloc(event->cpu)) {
>> + spin_unlock(&dtl_global_lock);
>> + return -ENOMEM;
>> + }
>> +
>> + /*
>> +  * Increment the number of active vpa_dtl pmu threads. The
>> +  * dtl_global_refc is used to keep count of cpu threads that
>> +  * currently capturing dtl data using vpa_dtl pmu interface.
>> +  */
>> + dtl_global_refc++;
>> +
>> + /*
>> +  * active_lock is a per cpu variable which is set if
>> +  * current cpu is running vpa_dtl perf record session.
>> +  */
>> + dtl->active_lock =3D true;
>> + spin_unlock(&dtl_global_lock);
>> +
>> + hrtimer_setup(&hwc->hrtimer, vpa_dtl_hrtimer_handle, =
CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +
>> + /*
>> +  * Since hrtimers have a fixed rate, we can do a static =
freq->period
>> +  * mapping and avoid the whole period adjust feedback stuff.
>> +  */
>=20
> I didn't get this comment. What is meant by hrtimers have fixed rate? =
You can adjust the
> the period value for next expiry always.
>=20

We can adjust, but here we are not changing. There is no need to =
re-initialize the hrtimer every time we start it because we know the =
frequency.
The below logic is done to avoid adjusting of frequency. When we use =
hrtimer, we want to avoid adjusting of frequency that the perf subsystem =
does otherwise.=20

Reference commit:=20
commit ba3dd36c6775264ee6e7354ba1aabcd6e86d7298

Also last period is used as value for =E2=80=9Cperiod=E2=80=9D in =
sample. If its not set to sample_period, it will be set to default 1

Reference: commit 778141e3cf0bf29f91cd3cb5c314ea477b9402a7

For other changes,=20
I will address in V2

Thanks
Athira



>=20
>> + if (event->attr.freq) {
>> + long freq =3D event->attr.sample_freq;
>> +
>> + event->attr.sample_period =3D NSEC_PER_SEC / freq;
>> + hwc->sample_period =3D event->attr.sample_period;
>> + local64_set(&hwc->period_left, hwc->sample_period);
>> + hwc->last_period =3D hwc->sample_period;
>> + event->attr.freq =3D 0;
>> + }
>=20
> I am not very familiar with PMU stuff.
> What does the above do? what is period_left?


>=20
>> +
>> + event->destroy =3D vpa_dtl_reset_global_refc;
>> + return 0;
>> +}
>> +
>> +static int vpa_dtl_event_add(struct perf_event *event, int flags)
>> +{
>> + int ret, hwcpu;
>> + unsigned long addr;
>> + struct vpa_dtl *dtl =3D &per_cpu(vpa_dtl_cpu, event->cpu);
>> +
>> + /*
>> +  * Register our dtl buffer with the hypervisor. The
>> +  * HV expects the buffer size to be passed in the second
>> +  * word of the buffer. Refer section '14.11.3.2. H_REGISTER_VPA'
>> +  * from PAPR for more information.
>> +  */
>> + ((u32 *)dtl->buf)[1] =3D cpu_to_be32(DISPATCH_LOG_BYTES);
>> + dtl->last_idx =3D 0;
>> +
>> + hwcpu =3D get_hard_smp_processor_id(event->cpu);
>> + addr =3D __pa(dtl->buf);
>> +
>> + ret =3D register_dtl(hwcpu, addr);
>> + if (ret) {
>> + pr_warn("DTL registration for cpu %d (hw %d) failed with %d\n",
>> + event->cpu, hwcpu, ret);
>> + return ret;
>> + }
>> +
>> + /* set our initial buffer indices */
>> + lppaca_of(event->cpu).dtl_idx =3D 0;
>> +
>> + /*
>> +  * Ensure that our updates to the lppaca fields have
>> +  * occurred before we actually enable the logging
>> +  */
>> + smp_wmb();
>> +
>> + /* enable event logging */
>> + lppaca_of(event->cpu).dtl_enable_mask =3D event->attr.config;
>> +
>> + vpa_dtl_start_hrtimer(event);
>> +
>> + return 0;
>> +}
>> +
>> +static void vpa_dtl_event_del(struct perf_event *event, int flags)
>> +{
>> + int hwcpu =3D get_hard_smp_processor_id(event->cpu);
>> + struct vpa_dtl *dtl =3D &per_cpu(vpa_dtl_cpu, event->cpu);
>> +
>> + vpa_dtl_stop_hrtimer(event);
>> + unregister_dtl(hwcpu);
>> + kmem_cache_free(dtl_cache, dtl->buf);
>> + dtl->buf =3D NULL;
>> + lppaca_of(event->cpu).dtl_enable_mask =3D 0x0;
>> + dtl->active_lock =3D false;
>> +}
>> +
>> +/*
>> + * This function definition is empty as vpa_dtl_dump_sample_data
>> + * is used to parse and dump the dispatch trace log data,
>> + * to perf data.
>> + */
>> +static void vpa_dtl_event_read(struct perf_event *event)
>> +{
>> +}
>> +
>> +static struct pmu vpa_dtl_pmu =3D {
>> + .task_ctx_nr =3D perf_invalid_context,
>> +
>> + .name =3D "vpa_dtl",
>> + .attr_groups =3D attr_groups,
>> + .event_init  =3D vpa_dtl_event_init,
>> + .add         =3D vpa_dtl_event_add,
>> + .del         =3D vpa_dtl_event_del,
>> + .read        =3D vpa_dtl_event_read,
>> + .capabilities =3D PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_EXCLUSIVE,
>> +};
>> +
>> +static int vpa_dtl_init(void)
>> +{
>> + int r;
>> +
>> + if (!firmware_has_feature(FW_FEATURE_SPLPAR)) {
>> + pr_debug("not a shared virtualized system, not enabling\n");
>> + return -ENODEV;
>> + }
>> +
>> + /* This driver is intended only for L1 host. */
>> + if (is_kvm_guest()) {
>> + pr_debug("Only supported for L1 host system\n");
>> + return -ENODEV;
>> + }
>> +
>> + r =3D perf_pmu_register(&vpa_dtl_pmu, vpa_dtl_pmu.name, -1);
>> + if (r)
>> + return r;
>> +
>> + return 0;
>> +}
>> +
>> +device_initcall(vpa_dtl_init);
>> +#endif //CONFIG_PPC_SPLPAR



