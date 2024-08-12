Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3394E5E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 06:51:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6pNuXN4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj2CY2Ljxz2yGY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 14:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6pNuXN4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj2Bq2dxYz2xT9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 14:50:26 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C40X0c027894;
	Mon, 12 Aug 2024 04:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=PYVecJ8PzloBnayrXuWEpXnJYp8aUALq3QUMpCJ5niA=; b=j6pNuXN4rpxD
	QHLvmEQFJ/Ue6BTiI9D5vtlsno/T2gw1rYRa/uIaZAIL+r/rsULbJmvgXIaiBIq+
	u7tVNdJwP88ED9ROSnK4aG+h+V98vIaWGl7NgZsY4flD9krfNzX/pkS8miTFFAvY
	FqMKtqk2tDf7ePRads/TznlebmCUtYPYDsgNkbhY64q6vog9K9yhcQTWE2KIjYUM
	k0QE6qPaLoTL0/CKf7XJtMThm8iBvEqaOy21LlMpauEvkM+SlCbZB1+utbS4UTWs
	ngLidJ47PmQt0yiCL5sMuLq/ZuFgY+XDcBwoEkDGrFu9TXIGw/2gLHbGLvZTa7Lp
	FToFHx/EKg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wyq8kxg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 04:50:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47C3ZFUL030516;
	Mon, 12 Aug 2024 04:50:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40xmrm4ksx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 04:50:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47C4oDNK48038350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2024 04:50:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 640E22004E;
	Mon, 12 Aug 2024 04:50:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A8BE20040;
	Mon, 12 Aug 2024 04:50:09 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.122.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 12 Aug 2024 04:50:08 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC 1/2] powerpc/vpa_pmu: Add interface to expose vpa counters
 via perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240805095500.15844-1-kjain@linux.ibm.com>
Date: Mon, 12 Aug 2024 10:19:54 +0530
Message-Id: <A5A262A2-B42B-4858-85A2-1AEAC32326B3@linux.vnet.ibm.com>
References: <20240805095500.15844-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nkrrzMX4npMPrc-JHgHLdAFyF4wWsxIj
X-Proofpoint-ORIG-GUID: nkrrzMX4npMPrc-JHgHLdAFyF4wWsxIj
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120033
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, adubey@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 5 Aug 2024, at 3:24=E2=80=AFPM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> The pseries Shared Processor Logical Partition(SPLPAR) machines
> can retrieve a log of dispatch and preempt events from the
> hypervisor using data from Disptach Trace Log(DTL) buffer.
> With this information, user can retrieve when and why each dispatch &
> preempt has occurred. Added an interface to expose the Virtual Processor
> Area(VPA) DTL counters via perf.
>=20
> The following events are available and exposed in sysfs:
>=20
> vpa_dtl/dtl_cede/ - Trace voluntary (OS initiated) virtual processor waits
> vpa_dtl/dtl_preempt/ - Trace time slice preempts
> vpa_dtl/dtl_fault/ - Trace virtual partition memory page faults.
> vpa_dtl/dtl_all/ - Trace all (dtl_cede/dtl_preempt/dtl_fault)
>=20
> Added interface defines supported event list, config fields for the
> event attributes and their corresponding bit values which are exported
> via sysfs. User could use the standard perf tool to access perf events
> exposed via vpa-dtl pmu.
>=20
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, the kernel needs to poll the counters, added
> hrtimer code to do that. The timer interval can be provided by user via
> sample_period field in nano seconds.
>=20
> Result on power10 SPLPAR system with 656 cpu threads.
> In the below perf record command with vpa_dtl pmu, -c option is used
> to provide sample_period whch corresponding to 1000000000ns i.e; 1sec
> and the workload time is also 1 second, hence we are getting 656 samples:
>=20
> [command] perf record -a -R -e vpa_dtl/dtl_all/ -c 1000000000 sleep 1
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.828 MB perf.data (656 samples) ]
>=20
> There is one hrtimer added per vpa-dtl pmu thread. Code added to handle
> addition of dtl buffer data in the raw sample. Since DTL does not provide
> IP address for a sample and it just have traces on reason of
> dispatch/preempt, we directly saving DTL buffer data to perf.data file as
> raw sample. For each hrtimer restart call, interface will dump all the
> new dtl entries added to dtl buffer as a raw sample.
>=20
> To ensure there are no other conflicting dtl users (example: debugfs dtl
> or /proc/powerpc/vcpudispatch_stats), interface added code to use
> "write_trylock" call to take the dtl_access_lock. The dtl_access_lock
> is defined in dtl.h file. Also added global reference count variable call=
ed
> "dtl_global_refc", to ensure dtl data can be captured per-cpu. Code also
> added global lock called "dtl_global_lock" to avoid race condition.
>=20
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@li=
nux.vnet.ibm.com>>

Thanks
Athira

> ---
> arch/powerpc/perf/Makefile  |   2 +-
> arch/powerpc/perf/vpa-pmu.c | 469 ++++++++++++++++++++++++++++++++++++
> include/linux/cpuhotplug.h  |   1 +
> 3 files changed, 471 insertions(+), 1 deletion(-)
> create mode 100644 arch/powerpc/perf/vpa-pmu.c
>=20
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index 4f53d0b97539..7118b5c0c641 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -14,7 +14,7 @@ obj-$(CONFIG_PPC_POWERNV) +=3D imc-pmu.o
> obj-$(CONFIG_FSL_EMB_PERF_EVENT) +=3D core-fsl-emb.o
> obj-$(CONFIG_FSL_EMB_PERF_EVENT_E500) +=3D e500-pmu.o e6500-pmu.o
>=20
> -obj-$(CONFIG_HV_PERF_CTRS) +=3D hv-24x7.o hv-gpci.o hv-common.o
> +obj-$(CONFIG_HV_PERF_CTRS) +=3D hv-24x7.o hv-gpci.o hv-common.o vpa-pmu.o
>=20
> obj-$(CONFIG_PPC_8xx) +=3D 8xx-pmu.o
>=20
> diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
> new file mode 100644
> index 000000000000..7fe4c8ff83ed
> --- /dev/null
> +++ b/arch/powerpc/perf/vpa-pmu.c
> @@ -0,0 +1,469 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Perf interface to expose Virtual Processor counters.
> + *
> + * Copyright (C) 2024 Kajol Jain, IBM Corporation
> + */
> +
> +#define pr_fmt(fmt) "vpa-pmu: " fmt
> +
> +#include <asm/dtl.h>
> +#include <linux/perf_event.h>
> +#include <asm/plpar_wrappers.h>
> +
> +#define EVENT(_name, _code)     enum{_name =3D _code}
> +
> +/*
> + * Based on Power Architecture Platform Reference(PAPR) documentation,
> + * Table 14.14. Per Virtual Processor Area, below Dispatch Trace Log(DTL)
> + * Enable Mask used to get corresponding virtual processor dispatch
> + * to preempt traces:
> + *   DTL_CEDE(0x1): Trace voluntary (OS initiated) virtual
> + *   processor waits
> + *   DTL_PREEMPT(0x2): Trace time slice preempts
> + *   DTLFAULT(0x4): Trace virtual partition memory page
> + faults.
> + *   DTL_ALL(0x7): Trace all (DTL_CEDE | DTL_PREEMPT | DTL_FAULT)
> + *
> + * Event codes based on Dispatch Trace Log Enable Mask.
> + */
> +EVENT(DTL_CEDE,         0x1);
> +EVENT(DTL_PREEMPT,      0x2);
> +EVENT(DTL_FAULT,        0x4);
> +EVENT(DTL_ALL,          0x7);
> +
> +GENERIC_EVENT_ATTR(dtl_cede, DTL_CEDE);
> +GENERIC_EVENT_ATTR(dtl_preempt, DTL_PREEMPT);
> +GENERIC_EVENT_ATTR(dtl_fault, DTL_FAULT);
> +GENERIC_EVENT_ATTR(dtl_all, DTL_ALL);
> +
> +PMU_FORMAT_ATTR(event, "config:0-7");
> +
> +static struct attribute *events_attr[] =3D {
> + GENERIC_EVENT_PTR(DTL_CEDE),
> + GENERIC_EVENT_PTR(DTL_PREEMPT),
> + GENERIC_EVENT_PTR(DTL_FAULT),
> + GENERIC_EVENT_PTR(DTL_ALL),
> + NULL
> +};
> +
> +static struct attribute_group event_group =3D {
> + .name =3D "events",
> + .attrs =3D events_attr,
> +};
> +
> +static struct attribute *format_attrs[] =3D {
> + &format_attr_event.attr,
> + NULL,
> +};
> +
> +static const struct attribute_group format_group =3D {
> + .name =3D "format",
> + .attrs =3D format_attrs,
> +};
> +
> +static const struct attribute_group *attr_groups[] =3D {
> + &format_group,
> + &event_group,
> + NULL,
> +};
> +
> +struct vpa_dtl {
> + struct dtl_entry *buf;
> + u64 last_idx;
> + bool active_lock;
> +};
> +
> +static DEFINE_PER_CPU(struct vpa_dtl, vpa_cpu_dtl);
> +
> +/* variable to capture reference count for the active dtl threads */
> +static int dtl_global_refc;
> +static spinlock_t dtl_global_lock =3D __SPIN_LOCK_UNLOCKED(dtl_global_lo=
ck);
> +
> +/*
> + * Function to dump the dispatch trace log buffer data to the
> + * perf raw sample.
> + */
> +static void vpa_dtl_dump_sample_data(struct perf_event *event)
> +{
> + struct perf_sample_data data;
> + struct perf_raw_record raw;
> + struct pt_regs regs;
> + u64 cur_idx, last_idx, i;
> + char *buf;
> +
> + /* actual number of entries read */
> + long n_read =3D 0, read_size =3D 0;
> +
> + /* number of entries added to dtl buffer */
> + long n_req;
> +
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, event->cpu);
> + int version =3D 1;
> +
> + /* Setup perf sample */
> + perf_sample_data_init(&data, 0, event->hw.last_period);
> + memset(&regs, 0, sizeof(regs));
> + memset(&raw, 0, sizeof(raw));
> +
> + cur_idx =3D be64_to_cpu(lppaca_of(event->cpu).dtl_idx);
> + last_idx =3D dtl->last_idx;
> +
> + if (last_idx + N_DISPATCH_LOG <=3D cur_idx)
> + last_idx =3D cur_idx - N_DISPATCH_LOG + 1;
> +
> + n_req =3D cur_idx - last_idx;
> +
> + /* no new entry added to the buffer, return */
> + if (n_req <=3D 0)
> + return;
> +
> + dtl->last_idx =3D last_idx + n_req;
> +
> + buf =3D kzalloc((n_req * sizeof(struct dtl_entry)) + sizeof(version) +
> + sizeof(tb_ticks_per_sec) + sizeof(n_req), GFP_KERNEL);
> + if (!buf) {
> + pr_warn("buffer alloc failed for perf raw data for cpu%d\n",
> + event->cpu);
> + return;
> + }
> + raw.frag.data =3D buf;
> +
> + /* Save current version of dtl sampling support */
> + memcpy(buf, &version, sizeof(version));
> + buf +=3D sizeof(version);
> +
> + /* Save tb_ticks_per_sec to convert timebase to sec */
> + memcpy(buf, &tb_ticks_per_sec, sizeof(tb_ticks_per_sec));
> + buf +=3D sizeof(tb_ticks_per_sec);
> +
> + /* Save total number of dtl entries added to the dtl buffer */
> + memcpy(buf, &n_req, sizeof(n_req));
> + buf +=3D sizeof(n_req);
> +
> + i =3D last_idx % N_DISPATCH_LOG;
> +
> + /* read the tail of the buffer if we've wrapped */
> + if (i + n_req > N_DISPATCH_LOG) {
> + read_size =3D N_DISPATCH_LOG - i;
> + memcpy(buf, &dtl->buf[i], read_size * sizeof(struct dtl_entry));
> + i =3D 0;
> + n_req -=3D read_size;
> + n_read +=3D read_size;
> + buf +=3D read_size * sizeof(struct dtl_entry);
> + }
> +
> + /* .. and now the head */
> + memcpy(buf, &dtl->buf[i], n_req * sizeof(struct dtl_entry));
> + n_read +=3D n_req;
> +
> + raw.frag.size =3D n_read * sizeof(struct dtl_entry) + sizeof(version) +
> + sizeof(tb_ticks_per_sec) + sizeof(n_req);
> +
> + perf_sample_save_raw_data(&data, &raw);
> + perf_event_overflow(event, &data, &regs);
> +}
> +
> +/*
> + * The VPA Dispatch Trace log counters do not interrupt on overflow.
> + * Therefore, the kernel needs to poll the counters to avoid missing
> + * an overflow using hrtimer. The timer interval is based on sample_peri=
od
> + * count provided by user, and minimum interval is 1 millisecond.
> + */
> +static enum hrtimer_restart vpa_dtl_hrtimer_handle(struct hrtimer *hrtim=
er)
> +{
> + struct perf_event *event;
> + u64 period;
> +
> + event =3D container_of(hrtimer, struct perf_event, hw.hrtimer);
> +
> + if (event->state !=3D PERF_EVENT_STATE_ACTIVE)
> + return HRTIMER_NORESTART;
> +
> + vpa_dtl_dump_sample_data(event);
> + period =3D max_t(u64, 1000000, event->hw.sample_period);
> + hrtimer_forward_now(hrtimer, ns_to_ktime(period));
> +
> + return HRTIMER_RESTART;
> +}
> +
> +static void vpa_dtl_start_hrtimer(struct perf_event *event)
> +{
> + u64 period;
> + struct hw_perf_event *hwc =3D &event->hw;
> +
> + period =3D max_t(u64, 1000000, hwc->sample_period);
> + hrtimer_start(&hwc->hrtimer, ns_to_ktime(period), HRTIMER_MODE_REL_PINN=
ED);
> +}
> +
> +static void vpa_dtl_stop_hrtimer(struct perf_event *event)
> +{
> + struct hw_perf_event *hwc =3D &event->hw;
> +
> + hrtimer_cancel(&hwc->hrtimer);
> +}
> +
> +static void vpa_dtl_reset_global_refc(struct perf_event *event)
> +{
> + spin_lock(&dtl_global_lock);
> + dtl_global_refc--;
> + if (dtl_global_refc <=3D 0) {
> + dtl_global_refc =3D 0;
> + write_unlock(&dtl_access_lock);
> + }
> + spin_unlock(&dtl_global_lock);
> +}
> +
> +static int vpa_dtl_event_init(struct perf_event *event)
> +{
> + struct hw_perf_event *hwc =3D &event->hw;
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, event->cpu);
> +
> + /* test the event attr type for PMU enumeration */
> + if (event->attr.type !=3D event->pmu->type)
> + return -ENOENT;
> +
> + if (!perfmon_capable())
> + return -EACCES;
> +
> + /* Return if this is a counting event */
> + if (!is_sampling_event(event))
> + return -EOPNOTSUPP;
> +
> + if (!(event->attr.sample_type & PERF_SAMPLE_RAW)) {
> + pr_debug("To enable perf sampling, run with -R/raw-samples option");
> + return -EOPNOTSUPP;
> + }
> +
> + /* Invalid eventcode */
> + switch (event->attr.config) {
> + case DTL_LOG_CEDE:
> + case DTL_LOG_PREEMPT:
> + case DTL_LOG_FAULT:
> + case DTL_LOG_ALL:
> + break;
> + default:
> + return -EINVAL;
> + }
> +
> + spin_lock(&dtl_global_lock);
> +
> + /*
> + * To ensure there are no other conflicting dtl users
> + * (example: /proc/powerpc/vcpudispatch_stats or debugfs dtl),
> + * below code try to take the dtl_access_lock.
> + * The dtl_access_lock is a rwlock defined in dtl.h, which is used
> + * to unsure there is no conflicting dtl users.
> + * Based on below code, vpa_dtl pmu tries to take write access lock
> + * and also checks for dtl_global_refc, to make sure that the
> + * dtl_access_lock is taken by vpa_dtl pmu interface.
> + */
> + if (dtl_global_refc =3D=3D 0 && !write_trylock(&dtl_access_lock)) {
> + spin_unlock(&dtl_global_lock);
> + return -EBUSY;
> + }
> +
> + /*
> + * Increment the number of active vpa_dtl pmu threads. The
> + * dtl_global_refc is used to keep count of cpu threads that
> + * currently capturing dtl data using vpa_dtl pmu interface.
> + */
> + dtl_global_refc++;
> +
> + /*
> + * active_lock is a per cpu variable which is set if
> + * current cpu is running vpa_pmu perf record session.
> + */
> + dtl->active_lock =3D true;
> + spin_unlock(&dtl_global_lock);
> +
> + hrtimer_init(&hwc->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> + hwc->hrtimer.function =3D vpa_dtl_hrtimer_handle;
> +
> + /*
> + * Since hrtimers have a fixed rate, we can do a static freq->period
> + * mapping and avoid the whole period adjust feedback stuff.
> + */
> + if (event->attr.freq) {
> + long freq =3D event->attr.sample_freq;
> +
> + event->attr.sample_period =3D NSEC_PER_SEC / freq;
> + hwc->sample_period =3D event->attr.sample_period;
> + local64_set(&hwc->period_left, hwc->sample_period);
> + hwc->last_period =3D hwc->sample_period;
> + event->attr.freq =3D 0;
> + }
> +
> + event->destroy =3D vpa_dtl_reset_global_refc;
> + return 0;
> +}
> +
> +static int vpa_dtl_event_add(struct perf_event *event, int flags)
> +{
> + int ret, hwcpu;
> + unsigned long addr;
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, event->cpu);
> +
> + /*
> + * Register our dtl buffer with the hypervisor. The
> + * HV expects the buffer size to be passed in the second
> + * word of the buffer. Refer section '14.11.3.2. H_REGISTER_VPA'
> + * from PAPR for more information.
> + */
> + ((u32 *)dtl->buf)[1] =3D cpu_to_be32(DISPATCH_LOG_BYTES);
> + dtl->last_idx =3D 0;
> +
> + hwcpu =3D get_hard_smp_processor_id(event->cpu);
> + addr =3D __pa(dtl->buf);
> +
> + ret =3D register_dtl(hwcpu, addr);
> + if (ret) {
> + pr_warn("DTL registration for cpu %d (hw %d) failed with %d\n",
> + event->cpu, hwcpu, ret);
> + return ret;
> + }
> +
> + /* set our initial buffer indices */
> + lppaca_of(event->cpu).dtl_idx =3D 0;
> +
> + /*
> + * Ensure that our updates to the lppaca fields have
> + * occurred before we actually enable the logging
> + */
> + smp_wmb();
> +
> + /* enable event logging */
> + lppaca_of(event->cpu).dtl_enable_mask =3D event->attr.config;
> +
> + vpa_dtl_start_hrtimer(event);
> +
> + return 0;
> +}
> +
> +static void vpa_dtl_event_del(struct perf_event *event, int flags)
> +{
> + int hwcpu =3D get_hard_smp_processor_id(event->cpu);
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, event->cpu);
> +
> + vpa_dtl_dump_sample_data(event);
> + vpa_dtl_stop_hrtimer(event);
> + unregister_dtl(hwcpu);
> + lppaca_of(event->cpu).dtl_enable_mask =3D 0x0;
> + dtl->active_lock =3D false;
> +}
> +
> +static void vpa_dtl_event_read(struct perf_event *event)
> +{
> + /*
> + * This function defination is empty as vpa_dtl_dump_sample_data
> + * is used to parse and dump the dispatch trace log data,
> + * to perf raw sample.
> + */
> +}
> +
> +/* Allocate dtl buffer memory for given cpu. */
> +static int vpa_dtl_mem_alloc(int cpu)
> +{
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, cpu);
> + struct dtl_entry *buf =3D NULL;
> +
> + if (dtl->buf)
> + return 0;
> + dtl->active_lock =3D false;
> +
> + /* Check for dispatch trace log buffer cache */
> + if (!dtl_cache)
> + return -ENOMEM;
> +
> + buf =3D kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, cpu_to_node(cpu));
> + if (!buf) {
> + pr_warn("buffer allocation failed for cpu %d\n", cpu);
> + return -ENOMEM;
> + }
> + dtl->buf =3D buf;
> + return 0;
> +}
> +
> +static int vpa_dtl_cpu_online(unsigned int cpu)
> +{
> + return vpa_dtl_mem_alloc(cpu);
> +}
> +
> +static int vpa_dtl_cpu_offline(unsigned int cpu)
> +{
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, cpu);
> +
> + /* Reduce the ref count if dtl event running on this cpu */
> + spin_lock(&dtl_global_lock);
> + if (dtl_global_refc && dtl->active_lock)
> + dtl_global_refc--;
> + if (dtl_global_refc <=3D 0) {
> + dtl_global_refc =3D 0;
> + write_unlock(&dtl_access_lock);
> + }
> + spin_unlock(&dtl_global_lock);
> + return 0;
> +}
> +
> +static int vpa_dtl_cpu_hotplug_init(void)
> +{
> + return cpuhp_setup_state(CPUHP_AP_PERF_POWERPC_VPA_DTL_ONLINE,
> +  "perf/powerpc/vpa_pmu:online",
> +  vpa_dtl_cpu_online,
> +  vpa_dtl_cpu_offline);
> +}
> +
> +static void vpa_dtl_clear_memory(void)
> +{
> + int i;
> +
> + for_each_online_cpu(i) {
> + struct vpa_dtl *dtl =3D &per_cpu(vpa_cpu_dtl, i);
> +
> + kmem_cache_free(dtl_cache, dtl->buf);
> + dtl->buf =3D NULL;
> + }
> +}
> +
> +static struct pmu vpa_dtl_pmu =3D {
> + .task_ctx_nr =3D perf_invalid_context,
> +
> + .name =3D "vpa_dtl",
> + .attr_groups =3D attr_groups,
> + .event_init  =3D vpa_dtl_event_init,
> + .add         =3D vpa_dtl_event_add,
> + .del         =3D vpa_dtl_event_del,
> + .read        =3D vpa_dtl_event_read,
> + .capabilities =3D PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_EXCLUSIVE,
> +};
> +
> +static int vpa_pmu_init(void)
> +{
> + int r;
> +
> + if (!firmware_has_feature(FW_FEATURE_SPLPAR)) {
> + pr_debug("not a shared virtualized system, not enabling\n");
> + return -ENODEV;
> + }
> +
> + /* This driver is intended only for L1 host */
> + if (is_kvm_guest()) {
> + pr_debug("Only supported for L1 host system\n");
> + return -ENODEV;
> + }
> +
> + /* init cpuhotplug */
> + r =3D vpa_dtl_cpu_hotplug_init();
> + if (r) {
> + vpa_dtl_clear_memory();
> + return r;
> + }
> +
> + r =3D perf_pmu_register(&vpa_dtl_pmu, vpa_dtl_pmu.name, -1);
> + if (r)
> + return r;
> +
> + return 0;
> +}
> +
> +device_initcall(vpa_pmu_init);
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 9316c39260e0..749feee5fab5 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -234,6 +234,7 @@ enum cpuhp_state {
> CPUHP_AP_PERF_POWERPC_TRACE_IMC_ONLINE,
> CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
> CPUHP_AP_PERF_POWERPC_HV_GPCI_ONLINE,
> + CPUHP_AP_PERF_POWERPC_VPA_DTL_ONLINE,
> CPUHP_AP_PERF_CSKY_ONLINE,
> CPUHP_AP_TMIGR_ONLINE,
> CPUHP_AP_WATCHDOG_ONLINE,
> --=20
> 2.39.3
>=20

