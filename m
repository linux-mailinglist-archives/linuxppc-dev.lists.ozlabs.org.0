Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB29671719
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 10:07:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxfzl3WyJz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 20:07:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=acHG3Dpi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=acHG3Dpi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxfyl0Sp2z3fCs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 20:06:54 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I8pJmd013336;
	Wed, 18 Jan 2023 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=9zzP/mHDlGQFjVmk5TnmRkJwiKgIdYS6bU99nRANtS0=;
 b=acHG3Dpi37gNsHDnwHxbZZyky1gfCodaWUwIw4XzYwVhTqI5Y01SkzNZ6ICYjYsNgVlT
 O8s6jdJG/dR3F0mK58vB6brhUWlyIcXGV8uTDT+HjeEW2asSB15OuN3xaURBXyFUo4FZ
 8T6p3MpiFbrffkWr4EPBZgswmQL3U+EL5UHo9fvsmIapmZ017x8F0PfhE2EyWkz8ZtO1
 UC/Q4GK7Gx1CnsiFvbQzAoY0zQcnK0+EWGKwpC8j2sRpR/Lq7gagNR7DuZDEau7jTqjC
 M/faoYdHKB5h/xKu/3zt9GIrXC1ofLicOo4stXVEKVPYzu0VT/NQ1rMLAdU1ss+tkfeE 0Q== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6dmg8a66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 09:06:32 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HEkgbF027150;
	Wed, 18 Jan 2023 09:06:30 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n3m16kn5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 09:06:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I96S0B45679012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 09:06:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D88420043;
	Wed, 18 Jan 2023 09:06:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D03220049;
	Wed, 18 Jan 2023 09:06:25 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.55.224])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 18 Jan 2023 09:06:25 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 4/8] perf/core: Add perf_sample_save_brstack() helper
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230118060559.615653-5-namhyung@kernel.org>
Date: Wed, 18 Jan 2023 14:36:23 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <DEBEB1CB-6D72-4827-9CA9-ADE6CA1EFF2E@linux.vnet.ibm.com>
References: <20230118060559.615653-1-namhyung@kernel.org>
 <20230118060559.615653-5-namhyung@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i0MZM9hDi9zZUDPMk30hXgeYDivkECph
X-Proofpoint-GUID: i0MZM9hDi9zZUDPMk30hXgeYDivkECph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_03,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180078
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
Cc: Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Jan-2023, at 11:35 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> When it saves the branch stack to the perf sample data, it needs to
> update the sample flags and the dynamic size.  To make sure this,
> add the perf_sample_save_brstack() helper and convert all call sites.
>=20
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Acked-by: Jiri Olsa <jolsa@kernel.org>
> Tested-by: Jiri Olsa <jolsa@kernel.org>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Hi Namhyung,

Changes looks good to me.

Acked-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira

> ---
> arch/powerpc/perf/core-book3s.c |  3 +-
> arch/x86/events/amd/core.c      |  6 +--
> arch/x86/events/intel/core.c    |  6 +--
> arch/x86/events/intel/ds.c      |  9 ++---
> include/linux/perf_event.h      | 66 ++++++++++++++++++++-------------
> kernel/events/core.c            | 16 +++-----
> 6 files changed, 53 insertions(+), 53 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index bf318dd9b709..8c1f7def596e 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2313,8 +2313,7 @@ static void record_and_restart(struct perf_event =
*event, unsigned long val,
> 			struct cpu_hw_events *cpuhw;
> 			cpuhw =3D this_cpu_ptr(&cpu_hw_events);
> 			power_pmu_bhrb_read(event, cpuhw);
> -			data.br_stack =3D &cpuhw->bhrb_stack;
> -			data.sample_flags |=3D PERF_SAMPLE_BRANCH_STACK;
> +			perf_sample_save_brstack(&data, event, =
&cpuhw->bhrb_stack);
> 		}
>=20
> 		if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
> diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
> index d6f3703e4119..463f3eb8bbd7 100644
> --- a/arch/x86/events/amd/core.c
> +++ b/arch/x86/events/amd/core.c
> @@ -928,10 +928,8 @@ static int amd_pmu_v2_handle_irq(struct pt_regs =
*regs)
> 		if (!x86_perf_event_set_period(event))
> 			continue;
>=20
> -		if (has_branch_stack(event)) {
> -			data.br_stack =3D &cpuc->lbr_stack;
> -			data.sample_flags |=3D PERF_SAMPLE_BRANCH_STACK;
> -		}
> +		if (has_branch_stack(event))
> +			perf_sample_save_brstack(&data, event, =
&cpuc->lbr_stack);
>=20
> 		if (perf_event_overflow(event, &data, regs))
> 			x86_pmu_stop(event, 0);
> diff --git a/arch/x86/events/intel/core.c =
b/arch/x86/events/intel/core.c
> index 29d2d0411caf..14f0a746257d 100644
> --- a/arch/x86/events/intel/core.c
> +++ b/arch/x86/events/intel/core.c
> @@ -3036,10 +3036,8 @@ static int handle_pmi_common(struct pt_regs =
*regs, u64 status)
>=20
> 		perf_sample_data_init(&data, 0, event->hw.last_period);
>=20
> -		if (has_branch_stack(event)) {
> -			data.br_stack =3D &cpuc->lbr_stack;
> -			data.sample_flags |=3D PERF_SAMPLE_BRANCH_STACK;
> -		}
> +		if (has_branch_stack(event))
> +			perf_sample_save_brstack(&data, event, =
&cpuc->lbr_stack);
>=20
> 		if (perf_event_overflow(event, &data, regs))
> 			x86_pmu_stop(event, 0);
> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
> index 158cf845fc80..07c8a2cdc3ee 100644
> --- a/arch/x86/events/intel/ds.c
> +++ b/arch/x86/events/intel/ds.c
> @@ -1720,10 +1720,8 @@ static void setup_pebs_fixed_sample_data(struct =
perf_event *event,
> 		data->sample_flags |=3D PERF_SAMPLE_TIME;
> 	}
>=20
> -	if (has_branch_stack(event)) {
> -		data->br_stack =3D &cpuc->lbr_stack;
> -		data->sample_flags |=3D PERF_SAMPLE_BRANCH_STACK;
> -	}
> +	if (has_branch_stack(event))
> +		perf_sample_save_brstack(data, event, &cpuc->lbr_stack);
> }
>=20
> static void adaptive_pebs_save_regs(struct pt_regs *regs,
> @@ -1883,8 +1881,7 @@ static void =
setup_pebs_adaptive_sample_data(struct perf_event *event,
>=20
> 		if (has_branch_stack(event)) {
> 			intel_pmu_store_pebs_lbrs(lbr);
> -			data->br_stack =3D &cpuc->lbr_stack;
> -			data->sample_flags |=3D =
PERF_SAMPLE_BRANCH_STACK;
> +			perf_sample_save_brstack(data, event, =
&cpuc->lbr_stack);
> 		}
> 	}
>=20
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 569dfac5887f..7db0e9cc2682 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1102,6 +1102,31 @@ extern u64 perf_event_read_value(struct =
perf_event *event,
>=20
> extern struct perf_callchain_entry *perf_callchain(struct perf_event =
*event, struct pt_regs *regs);
>=20
> +static inline bool branch_sample_no_flags(const struct perf_event =
*event)
> +{
> +	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_NO_FLAGS;
> +}
> +
> +static inline bool branch_sample_no_cycles(const struct perf_event =
*event)
> +{
> +	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_NO_CYCLES;
> +}
> +
> +static inline bool branch_sample_type(const struct perf_event *event)
> +{
> +	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_TYPE_SAVE;
> +}
> +
> +static inline bool branch_sample_hw_index(const struct perf_event =
*event)
> +{
> +	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_HW_INDEX;
> +}
> +
> +static inline bool branch_sample_priv(const struct perf_event *event)
> +{
> +	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_PRIV_SAVE;
> +}
> +
>=20
> struct perf_sample_data {
> 	/*
> @@ -1210,6 +1235,21 @@ static inline void =
perf_sample_save_raw_data(struct perf_sample_data *data,
> 	data->sample_flags |=3D PERF_SAMPLE_RAW;
> }
>=20
> +static inline void perf_sample_save_brstack(struct perf_sample_data =
*data,
> +					    struct perf_event *event,
> +					    struct perf_branch_stack =
*brs)
> +{
> +	int size =3D sizeof(u64); /* nr */
> +
> +	if (branch_sample_hw_index(event))
> +		size +=3D sizeof(u64);
> +	size +=3D brs->nr * sizeof(struct perf_branch_entry);
> +
> +	data->br_stack =3D brs;
> +	data->dyn_size +=3D size;
> +	data->sample_flags |=3D PERF_SAMPLE_BRANCH_STACK;
> +}
> +
> /*
>  * Clear all bitfields in the perf_branch_entry.
>  * The to and from fields are not cleared because they are
> @@ -1827,30 +1867,4 @@ static inline void perf_lopwr_cb(bool mode)
> }
> #endif
>=20
> -#ifdef CONFIG_PERF_EVENTS
> -static inline bool branch_sample_no_flags(const struct perf_event =
*event)
> -{
> -	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_NO_FLAGS;
> -}
> -
> -static inline bool branch_sample_no_cycles(const struct perf_event =
*event)
> -{
> -	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_NO_CYCLES;
> -}
> -
> -static inline bool branch_sample_type(const struct perf_event *event)
> -{
> -	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_TYPE_SAVE;
> -}
> -
> -static inline bool branch_sample_hw_index(const struct perf_event =
*event)
> -{
> -	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_HW_INDEX;
> -}
> -
> -static inline bool branch_sample_priv(const struct perf_event *event)
> -{
> -	return event->attr.branch_sample_type & =
PERF_SAMPLE_BRANCH_PRIV_SAVE;
> -}
> -#endif /* CONFIG_PERF_EVENTS */
> #endif /* _LINUX_PERF_EVENT_H */
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 133894ae5e30..0218b6ffaf36 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7317,7 +7317,7 @@ void perf_output_sample(struct =
perf_output_handle *handle,
> 	}
>=20
> 	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
> -		if (data->sample_flags & PERF_SAMPLE_BRANCH_STACK) {
> +		if (data->br_stack) {
> 			size_t size;
>=20
> 			size =3D data->br_stack->nr
> @@ -7594,16 +7594,10 @@ void perf_prepare_sample(struct =
perf_event_header *header,
> 		data->sample_flags |=3D PERF_SAMPLE_RAW;
> 	}
>=20
> -	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
> -		int size =3D sizeof(u64); /* nr */
> -		if (data->sample_flags & PERF_SAMPLE_BRANCH_STACK) {
> -			if (branch_sample_hw_index(event))
> -				size +=3D sizeof(u64);
> -
> -			size +=3D data->br_stack->nr
> -			      * sizeof(struct perf_branch_entry);
> -		}
> -		data->dyn_size +=3D size;
> +	if (filtered_sample_type & PERF_SAMPLE_BRANCH_STACK) {
> +		data->br_stack =3D NULL;
> +		data->dyn_size +=3D sizeof(u64);
> +		data->sample_flags |=3D PERF_SAMPLE_BRANCH_STACK;
> 	}
>=20
> 	if (sample_type & (PERF_SAMPLE_REGS_USER | =
PERF_SAMPLE_STACK_USER))
> --=20
> 2.39.0.314.g84b9a713c41-goog
>=20

