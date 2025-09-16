Return-Path: <linuxppc-dev+bounces-12273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E7B58CE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQq0Y18RVz30NF;
	Tue, 16 Sep 2025 14:38:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757997517;
	cv=none; b=WZ9LsN8qFpAaWrX37Fp3RMrsMhJnNliUZSSNdmn9VTKTTaQPxuU1w3wXUlYqVhk+iR6GbP086Eg67jXFvb3bSTz/7RFn1MrnoNgry1XCWhPfsayJiDjuuzEgkBqOw8BHk3/1wMpWfHhfP+hBN2UDzN9A3Msvm6oY+f2wiP/n7Qtn38b/waw5Sfy5Vqd9kssZbVM6sw0DXn1PKYwAVCT2jsVrQiB0h5uUBZLsELzhuF5m2c1fDBXJgr7NYA/pX/ZxVAre9/npb5efq8JxOS22lhw7rQCUQzb3HTyk6XfhW8NzyDpV7jzHKy0W/qkrYfyWspiQ4QgMuNzWgh+Rc4++uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757997517; c=relaxed/relaxed;
	bh=CG4eTq6NSovu2CHnqKChL2Wu/YQrZL9OKnE0pyG6ekc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=H5ruHE+zz58m4G4xzNJGwBNrsI5elnuBW2adernAXEg+d28z4eH7O0azh/Oj22AI0fngSWUarSOIV2HzzMA+gFwZIFcdHKb5aEJLPl9DeLRmfYerjBo6PfuGAYPrhF5rMDDfgNunOSYnJErVkisZ7pDKiYS2vtm6DqY0CsSksgQvWYuRDX9uZzYjW5eD9t7xwcg+QheQ1lLJCxPdwvi/dfX+OWsd5mki79XxFkRW5jlDos+EdLBh0fjC+Hh6IaPzghTek8/dSTo3IqzZF9SaXrtfUwk4ADSAgo353wkHi3OJQZb2iwaOdGJ7M3IY4M6ISWe5DCWvrsEElgcZqu9NZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L+RBvHw0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L+RBvHw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQq0X36yXz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:38:36 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FH5WYS018883;
	Tue, 16 Sep 2025 04:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CG4eTq
	6NSovu2CHnqKChL2Wu/YQrZL9OKnE0pyG6ekc=; b=L+RBvHw02ZaJd7AXhze5HT
	uYMjn765vGR6jzqxgY3wzmpoh3fChHTwwrgpGE1hZ4opMB0FNAF83sOK1kyHcWpv
	mRhHk/GT5SjypF1WZiJ+2O+SD4iX3bZxIfw1eRArFAXMuuW1P6tQseAoe+4KcIYy
	zUeDJTrqBvkW3pII02BZXmMS1RNfPGRqmj+N3NKqYgU/X3aekq4frVgfA+tD6X8k
	vKEAMAJJ4+5Bv8A1VQuXRaXQ+ejEYI32CWtybNzGd1QctI/HkSvehWaRj6AV+0sq
	8RdETMfJiLkJqiug6upzZI80QROVsaKIQA6voKJZBugcmCq9wqmL14Jed7hE+L0g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat56um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:38:32 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4SDpH015144;
	Tue, 16 Sep 2025 04:38:32 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat56uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:38:32 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G4DnTn009363;
	Tue, 16 Sep 2025 04:38:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn39qud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:38:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4cRJV57540914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:38:27 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27F2D20043;
	Tue, 16 Sep 2025 04:38:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DA8B20040;
	Tue, 16 Sep 2025 04:38:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.152])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Sep 2025 04:38:21 +0000 (GMT)
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
Subject: Re: [PATCH V2 6/6] tools/perf: Enable perf script to present the DTL
 entries
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <744d4dcd-c8dd-4335-8e3a-a81adda36b57@intel.com>
Date: Tue, 16 Sep 2025 10:08:11 +0530
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
Message-Id: <A25D4BF6-6929-4522-A1DB-AE927AAF2735@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-7-atrajeev@linux.ibm.com>
 <744d4dcd-c8dd-4335-8e3a-a81adda36b57@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c8e9c8 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=yxc6M1-5OtljeOBRFtcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BsWeCGUUey5540g1H6QQjDF-AvgJ-ptv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX/ENzSX5PUuQP
 BD613VbbXaosO4c+0hYUWWsVB42HOhBxJWJhYyBU8Oby9kw+MOhrlMb0WQIdxFKRvk5++po2ze4
 l+rCOFHmgaQoGGCCI6iTeL+JaOgACqSIo4QW6uqXb1Vu90KzO9FgKHAx1Y2gJ7FE0lkBKFaju8b
 nvxhkShQlTpj9KDFBM/GlmcccI/H7cdjFVd/Tw5pDjDc3uyJ/8gJp5Mf4GD3x3CazkqYDSJeULm
 p77+6LfBpxeLRN1ko1DyjSao8qPo+mzWb1d1UgWKccojP55xog0Vytatsaiw59tkeVotFTM+Ad2
 FAzzYH+woX2Vzq2pulICbXIxLzpbSr6iMdnRzGWtuW5cZR0dulm2yLg8HeGpoXZIeJQ2lsKosx0
 itu03ymC
X-Proofpoint-ORIG-GUID: zde1sWhGbJ0K6AV3gShaSrgTgVhFTmFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 8:39=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/09/2025 10:27, Athira Rajeev wrote:
>> The process_event() function in "builtin-script.c" invokes
>> perf_sample__fprintf_synth() for displaying PERF_TYPE_SYNTH
>> type events.
>>=20
>>   if (attr->type =3D=3D PERF_TYPE_SYNTH && PRINT_FIELD(SYNTH))
>>    perf_sample__fprintf_synth(sample, evsel, fp);
>>=20
>> perf_sample__fprintf_synth() process the sample depending on the =
value
>> in evsel->core.attr.config. Introduce =
perf_sample__fprintf_synth_vpadtl()
>> and invoke this for PERF_SYNTH_POWERPC_VPA_DTL
>>=20
>> Sample output:
>>=20
>>   ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>>   [ perf record: Woken up 1 times to write data ]
>>   [ perf record: Captured and wrote 0.300 MB perf.data ]
>>=20
>>   ./perf script
>>            perf   13322 [002]   233.835807:                     =
sched:sched_switch: perf:13322 [120] R =3D=3D> migration/2:27 [0]
>>     migration/2      27 [002]   233.835811:               =
sched:sched_migrate_task: comm=3Dperf pid=3D13322 prio=3D120 orig_cpu=3D2 =
dest_cpu=3D3
>>     migration/2      27 [002]   233.835818:               =
sched:sched_stat_runtime: comm=3Dmigration/2 pid=3D27 runtime=3D9214 =
[ns]
>>     migration/2      27 [002]   233.835819:                     =
sched:sched_switch: migration/2:27 [0] S =3D=3D> swapper/2:0 [120]
>>         swapper       0 [002]   233.835822:                           =
     vpa-dtl: timebase: 338954486062657 =
dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, =
enqueue_to_dispatch_time:435, ready_to_enqueue_time:0, =
waiting_to_ready_time:34775058, processor_id: 202 c0000000000f8094 =
plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>>         swapper       0 [001]   233.835886:                           =
     vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, =
preempt_reason:H_CEDE, enqueue_to_dispatch_time:542, =
ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: =
201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> Changelog:
>> Addressed review comments from Adrian
>> - Removed default callback and used perf_sample__fprintf_synth_vpadtl
>> - fix build failure when using NO_AUXTRACE=3D1 by
>>  adding code around HAVE_AUXTRACE_SUPPORT
>>=20
>> tools/perf/builtin-script.c | 27 +++++++++++++++++++++++++++
>> tools/perf/util/event.h     |  3 +++
>> 2 files changed, 30 insertions(+)
>>=20
>> diff --git a/tools/perf/builtin-script.c =
b/tools/perf/builtin-script.c
>> index d9fbdcf72f25..8a03fdbfce5e 100644
>> --- a/tools/perf/builtin-script.c
>> +++ b/tools/perf/builtin-script.c
>> @@ -43,6 +43,7 @@
>> #include <linux/stringify.h>
>> #include <linux/time64.h>
>> #include <linux/zalloc.h>
>> +#include <linux/unaligned.h>
>> #include <sys/utsname.h>
>> #include "asm/bug.h"
>> #include "util/mem-events.h"
>> @@ -2003,6 +2004,30 @@ static int =
perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
>> return len + perf_sample__fprintf_pt_spacing(len, fp);
>> }
>>=20
>> +#ifdef HAVE_AUXTRACE_SUPPORT
>> +static int perf_sample__fprintf_synth_vpadtl(struct perf_sample =
*data, FILE *fp)
>> +{
>> + struct powerpc_vpadtl_entry *dtl =3D (struct powerpc_vpadtl_entry =
*)data->raw_data;
>> +
>> + fprintf(fp, "timebase: %" PRIu64 " dispatch_reason:%s, =
preempt_reason:%s,\n"
>> + "enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d, =
waiting_to_ready_time:%d, processor_id: %d",\
>=20
> Unnecessary line continuation, also line length exceeds 100 columns
>=20
>> + get_unaligned_be64(&dtl->timebase),
>> + dispatch_reasons[dtl->dispatch_reason],
>> + preempt_reasons[dtl->preempt_reason],
>> + be32_to_cpu(dtl->enqueue_to_dispatch_time),
>> + be32_to_cpu(dtl->ready_to_enqueue_time),
>> + be32_to_cpu(dtl->waiting_to_ready_time),
>> + be16_to_cpu(dtl->processor_id));
>> +
>> + return 1;
>=20
> Other __fprintf_*() are returning the number of char printed.

Will send a V3 with this change

Thanks
Athira
>=20
>> +}
>> +#else
>> +static int perf_sample__fprintf_synth_vpadtl(struct perf_sample =
*data __maybe_unused, FILE *fp __maybe_unused)
>> +{
>> + return 0;
>> +}
>> +#endif
>> +
>> static int perf_sample__fprintf_synth(struct perf_sample *sample,
>>       struct evsel *evsel, FILE *fp)
>> {
>> @@ -2025,6 +2050,8 @@ static int perf_sample__fprintf_synth(struct =
perf_sample *sample,
>> return perf_sample__fprintf_synth_evt(sample, fp);
>> case PERF_SYNTH_INTEL_IFLAG_CHG:
>> return perf_sample__fprintf_synth_iflag_chg(sample, fp);
>> + case PERF_SYNTH_POWERPC_VPA_DTL:
>> + return perf_sample__fprintf_synth_vpadtl(sample, fp);
>> default:
>> break;
>> }
>> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
>> index 7e0e58979e9c..64c63b59d617 100644
>> --- a/tools/perf/util/event.h
>> +++ b/tools/perf/util/event.h
>> @@ -271,6 +271,9 @@ struct powerpc_vpadtl_entry {
>> u64     srr1;
>> };
>>=20
>> +extern const char *dispatch_reasons[11];
>> +extern const char *preempt_reasons[10];
>> +
>> static inline void *perf_synth__raw_data(void *p)
>> {
>> return p + 4;



