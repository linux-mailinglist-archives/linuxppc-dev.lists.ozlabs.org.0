Return-Path: <linuxppc-dev+bounces-12270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B57B58CE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpzd74sTz2yvv;
	Tue, 16 Sep 2025 14:37:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757997469;
	cv=none; b=Im9IjlaRJPEwy0kPi8YW2Fh6eUrfAW+W4x5KRPRvGZGIkyoJQ4dLXeDvBUBcXr5ON5P3h8+q4Pbbx1YwK7+jU7EIYVYZ8GItpgZcYhCqBU6Eii/+RtbWjhgHQI4Y5t34248M5+/t8PPvJ7aPB81n2Hyl/nITrXhagtB5EuVlsuWKYhzSnyFLIhDKoou7ed4/xQCeOgNT1dLcxB+eiBaVomBEqAZ9SkRU6FlpQWRBUhsVCqFwzqenqdokn1c+h5LX+lNGrp9JdlpNcwfmsbWweYu4L2XcsSKZ0r3WjC2RQjk8zlk5Iei6exqzG6tjhxVjDe0D58eLDbJ3Ybdq1Kct5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757997469; c=relaxed/relaxed;
	bh=Bc018ZCtwOpoZ+2gGHFbjV4KpaKp9t7RIPjYiJD0GjI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OkuwfITBAkGmrcTmReohhrVlSbQjHaiFcS/C4c8HPx3v0N1AEnHORrX2tmXen9oDtqN8TLRXQx7ynnrZGtmef3Rq68aoRV3/ib9riuIhI8jVYgmBvMPqt49lY07dpbjYbqZYd+1jf6YwZXM72X/qVntD0W3/cJP7xSAEzC5raAyKoPkhKXGaVTkZ9xfYA3ZbmSIoCX4eCDoMfg3hv25l69Rafww/0shNW8MBdFeo8HqqFn4xOsX3H06lOf5WTLtOv+o9F9iy36LB6woMWJNtUm8JYS5wZkG1EiqGB6iw2W6tkSQB5l/IwvxCG/wigY3PBzxYymZpK17TVbbo7AnoZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VfuHdiyH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VfuHdiyH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQpzc5lhTz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:37:48 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FIKjJg017350;
	Tue, 16 Sep 2025 04:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Bc018Z
	CtwOpoZ+2gGHFbjV4KpaKp9t7RIPjYiJD0GjI=; b=VfuHdiyHr8iLQllmkwjC35
	vtZtpmnkmTU8rxEnrGrtnImTudSLrs4vhIhrHKSdrhadenqIbb7d9DhmxB2fwQuk
	vS1f6yVjC+t9EHITVckIgBX9BYnxBpTkc/tBsP5rVr/Uf4VKa3wyfNLTqESSt+Q6
	fVEch3xFmIquF07j2dlZO9FqFJP/K6DKJCt9KlnXEyvfrQpFMZzy5scIjbfTiTfQ
	3VlItGRZfVhZVwrWLHdb5RaL8W7Qhufzp4d8vBqpE6tBPQYMZBhjjBZkr2e6Y/me
	PqvrG9/AFiegOGmlbyPOqWWXWvHkplA/Xcq3Rr5F7jC1W2n4DknntCNHVYTLottw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496g534yas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:37:41 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4aYqB016168;
	Tue, 16 Sep 2025 04:37:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496g534yar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:37:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3BkmQ027358;
	Tue, 16 Sep 2025 04:37:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495men1ypb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:37:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4baja62390758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:37:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ED382004D;
	Tue, 16 Sep 2025 04:37:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9A2D20043;
	Tue, 16 Sep 2025 04:37:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.152])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Sep 2025 04:37:30 +0000 (GMT)
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
Subject: Re: [PATCH V2 1/6] tools/perf: Add basic CONFIG_AUXTRACE support for
 VPA pmu on powerpc
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <bd19b37e-6dfb-495a-bc05-47a347962515@intel.com>
Date: Tue, 16 Sep 2025 10:07:16 +0530
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
Message-Id: <BE1E3777-3460-42A0-850D-C021FFA97D22@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-2-atrajeev@linux.ibm.com>
 <bd19b37e-6dfb-495a-bc05-47a347962515@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UeuM8CFSjO_nBtB4I1w30nd0_Fy2H65H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX2Lzei0B4NhmH
 Skw/nTpcwz1gSW4oPyv4M2LFh44Ih2CL5loXpvmAo2oAq7zDUs9x6yI0x0+0Rrf0N75Hvyxut2G
 4g9au00O99YvgM/P2QR6WWZbP6QQ4aqe3Q1+eqoDUJcM8GodiF3M64n0/hv1iBdQgw05KVkSmwX
 qdsst5vZagRYN301FTm7FS5mXBGiYI+bWox0KjU5xujIWz1WhWK2eciOhR/9Gn2mcj24IYH0/DY
 W818Xx+WOHUgEVo4/tg83VrcujjS8wGty/GIkOwWO6B6c/9KP9wu81W9J32vBvzUBuOjKxK8gAq
 vHQJUsW3kr1TJhl5bxrgj1lsJ7CVLw9yqddp6nmfYKFsn7bLU2kM4H+JaqHuk/Ttp0wN5biaNHQ
 V9BzP4eI
X-Proofpoint-ORIG-GUID: 5B6l3aC-B9NtzKCChmfTWxwERKa4KSGB
X-Authority-Analysis: v=2.4 cv=UJ7dHDfy c=1 sm=1 tr=0 ts=68c8e995 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=V7cUskRflTsJUJfQGFIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 8:37=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/09/2025 10:27, Athira Rajeev wrote:
>> The powerpc PMU collecting Dispatch Trace Log (DTL) entries makes use =
of
>> AUX support in perf infrastructure. The PMU driver has the =
functionality
>> to collect trace entries in the aux buffer. On the tools side, this =
data
>> is made available as PERF_RECORD_AUXTRACE records. This record is
>> generated by "perf record" command. To enable the creation of
>> PERF_RECORD_AUXTRACE, add functions to initialize auxtrace records ie
>> "auxtrace_record__init()". Fill in fields for other callbacks like
>> info_priv_size, info_fill, free, recording options etc. Define
>> auxtrace_type as PERF_AUXTRACE_VPA_DTL. Add header file to define vpa
>> dtl pmu specific details.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> Changelog:
>> Addressed review comments from Adrian:
>> - Return VPADTL_AUXTRACE_PRIV_SIZE in powerpc_vpadtl_info_priv_size
>> - Remove unused powerpc_vpadtl_parse_snapshot_options
>> - Some of the function parameters had "__maybe_unused", corrected it.
>> - Used PERF_AUXTRACE_VPA_DTL instead of PERF_AUXTRACE_VPA_PMU
>> - Moved powerpc_vpadtl_process_auxtrace_info to next patch
>>=20
>> tools/perf/arch/powerpc/util/Build      |   1 +
>> tools/perf/arch/powerpc/util/auxtrace.c | 114 =
++++++++++++++++++++++++
>> tools/perf/util/auxtrace.c              |   1 +
>> tools/perf/util/auxtrace.h              |   1 +
>> tools/perf/util/powerpc-vpadtl.h        |  18 ++++
>> 5 files changed, 135 insertions(+)
>> create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
>> create mode 100644 tools/perf/util/powerpc-vpadtl.h
>>=20
>> diff --git a/tools/perf/arch/powerpc/util/Build =
b/tools/perf/arch/powerpc/util/Build
>> index fdd6a77a3432..a5b0babd307e 100644
>> --- a/tools/perf/arch/powerpc/util/Build
>> +++ b/tools/perf/arch/powerpc/util/Build
>> @@ -10,3 +10,4 @@ perf-util-$(CONFIG_LIBDW) +=3D skip-callchain-idx.o
>>=20
>> perf-util-$(CONFIG_LIBUNWIND) +=3D unwind-libunwind.o
>> perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
>> +perf-util-$(CONFIG_AUXTRACE) +=3D auxtrace.o
>> diff --git a/tools/perf/arch/powerpc/util/auxtrace.c =
b/tools/perf/arch/powerpc/util/auxtrace.c
>> new file mode 100644
>> index 000000000000..803c582c0c6f
>> --- /dev/null
>> +++ b/tools/perf/arch/powerpc/util/auxtrace.c
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VPA support
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/types.h>
>> +#include <linux/bitops.h>
>> +#include <linux/log2.h>
>=20
> Are bitops.h and log2.h needed?
>=20
>> +#include <linux/string.h>
>> +#include <time.h>
>> +
>> +#include "../../util/cpumap.h"
>=20
> Is cpumap.h needed?
>=20
>> +#include "../../util/evsel.h"
>> +#include "../../util/evlist.h"
>> +#include "../../util/session.h"
>> +#include "../../util/util.h"
>> +#include "../../util/pmu.h"
>=20
> Is pmu.h needed?
>=20
>> +#include "../../util/debug.h"
>> +#include "../../util/auxtrace.h"
>> +#include "../../util/powerpc-vpadtl.h"
>> +#include "../../util/record.h"
>> +#include <internal/lib.h> // page_size
>> +
>> +#define KiB(x) ((x) * 1024)
>> +
>> +static int
>> +powerpc_vpadtl_recording_options(struct auxtrace_record *ar =
__maybe_unused,
>> + struct evlist *evlist __maybe_unused,
>> + struct record_opts *opts)
>> +{
>> + opts->full_auxtrace =3D true;
>> +
>> + /*
>> +  * Set auxtrace_mmap_pages to minimum
>> +  * two pages
>> +  */
>> + if (!opts->auxtrace_mmap_pages) {
>> + opts->auxtrace_mmap_pages =3D KiB(128) / page_size;
>> + if (opts->mmap_pages =3D=3D UINT_MAX)
>> + opts->mmap_pages =3D KiB(256) / page_size;
>> + }
>> +
>> + return 0;
>> +}
>> +
>> +static size_t powerpc_vpadtl_info_priv_size(struct auxtrace_record =
*itr __maybe_unused,
>> + struct evlist *evlist __maybe_unused)
>> +{
>> + return VPADTL_AUXTRACE_PRIV_SIZE;
>> +}
>> +
>> +static int
>> +powerpc_vpadtl_info_fill(struct auxtrace_record *itr __maybe_unused,
>> + struct perf_session *session __maybe_unused,
>> + struct perf_record_auxtrace_info *auxtrace_info,
>> + size_t priv_size __maybe_unused)
>> +{
>> + auxtrace_info->type =3D PERF_AUXTRACE_VPA_DTL;
>> +
>> + return 0;
>> +}
>> +
>> +static void powerpc_vpadtl_free(struct auxtrace_record *itr)
>> +{
>> + free(itr);
>> +}
>> +
>> +static u64 powerpc_vpadtl_reference(struct auxtrace_record *itr =
__maybe_unused)
>> +{
>> + return 0;
>> +}
>> +
>> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist,
>> + int *err)
>> +{
>> + struct auxtrace_record *aux;
>> + struct evsel *pos;
>> + char *pmu_name;
>> + int found =3D 0;
>> +
>> + evlist__for_each_entry(evlist, pos) {
>> + pmu_name =3D strdup(pos->name);
>> + pmu_name =3D strtok(pmu_name, "/");
>> + if (strstarts(pmu_name, "vpa_dtl")) {
>=20
> pmu_name is leaked, but maybe it is not needed at all e.g.
>=20
> if (strstarts(pos->name, "vpa_dtl")) {
>=20
>> + found =3D 1;
>> + pos->needs_auxtrace_mmap =3D true;
>> + break;
>> + }
>> + }
>> +
>> + if (!found)
>> + return NULL;
>> +
>> + /*
>> +  * To obtain the auxtrace buffer file descriptor, the auxtrace =
event
>> +  * must come first.
>> +  */
>> + evlist__to_front(pos->evlist, pos);
>> +
>> + aux =3D zalloc(sizeof(*aux));
>> + if (aux =3D=3D NULL) {
>> + pr_debug("aux record is NULL\n");
>> + *err =3D -ENOMEM;
>> + return NULL;
>> + }
>> +
>> + aux->recording_options =3D powerpc_vpadtl_recording_options;
>> + aux->info_priv_size =3D powerpc_vpadtl_info_priv_size;
>> + aux->info_fill =3D powerpc_vpadtl_info_fill;
>> + aux->free =3D powerpc_vpadtl_free;
>> + aux->reference =3D powerpc_vpadtl_reference;
>> + return aux;
>> +}
>> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
>> index ebd32f1b8f12..f294658bb948 100644
>> --- a/tools/perf/util/auxtrace.c
>> +++ b/tools/perf/util/auxtrace.c
>> @@ -1393,6 +1393,7 @@ int perf_event__process_auxtrace_info(struct =
perf_session *session,
>> case PERF_AUXTRACE_HISI_PTT:
>> err =3D hisi_ptt_process_auxtrace_info(event, session);
>> break;
>> + case PERF_AUXTRACE_VPA_DTL:
>> case PERF_AUXTRACE_UNKNOWN:
>> default:
>> return -EINVAL;
>> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
>> index f001cbb68f8e..e0a5b39fed12 100644
>> --- a/tools/perf/util/auxtrace.h
>> +++ b/tools/perf/util/auxtrace.h
>> @@ -50,6 +50,7 @@ enum auxtrace_type {
>> PERF_AUXTRACE_ARM_SPE,
>> PERF_AUXTRACE_S390_CPUMSF,
>> PERF_AUXTRACE_HISI_PTT,
>> + PERF_AUXTRACE_VPA_DTL,
>> };
>>=20
>> enum itrace_period_type {
>> diff --git a/tools/perf/util/powerpc-vpadtl.h =
b/tools/perf/util/powerpc-vpadtl.h
>> new file mode 100644
>> index 000000000000..50a7aa24acbe
>> --- /dev/null
>> +++ b/tools/perf/util/powerpc-vpadtl.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * VPA DTL PMU Support
>> + */
>> +
>> +#ifndef INCLUDE__PERF_POWERPC_VPADTL_H__
>> +#define INCLUDE__PERF_POWERPC_VPADTL_H__
>> +
>> +#define POWERPC_VPADTL_NAME "powerpc_vpadtl_"
>=20
> Never used

Hi Adrian

Thanks for reviewing the patchset and sharing your comments

I will address these changes in V3

Thanks
Athira
>=20
>> +
>> +enum {
>> + POWERPC_VPADTL_TYPE,
>> + VPADTL_AUXTRACE_PRIV_MAX,
>> +};
>> +
>> +#define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * =
sizeof(u64))
>> +
>> +#endif



