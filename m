Return-Path: <linuxppc-dev+bounces-11475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FBB3B603
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCs0Z24czz2xnM;
	Fri, 29 Aug 2025 18:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756456238;
	cv=none; b=ZFY0eSAao/YRE5OH7YMMMMFLSCU4XyyDUlol6flotMIOC3SBniG9Hduqzxu2bc7K2r6o8L6+9tidNGlhLD2asqYCjYfa6CCZOe+IYS7lxT0XgxcppBPCaE46sjKuGJ3A3NxEbQiSDh9N3frLHF3VWK14VlukXhTgo+NVfpkNNhlJV/jr9rG6FOp4OvXFHvidKRUxkh9AOTKeFL3d5/MJn2E21WgAPFwcvOGb+sb+stYmU0FTUdm10yZud4PJx2WpZTtIAHlB7YvWeJ5MZiF9493HfGFm4eyqCKL5Od6UDwUrEGZgnRmRaFslmUKbQ08eX5KYTtVtyyCt6e7JR43gpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756456238; c=relaxed/relaxed;
	bh=VUxLfH67n0rOesHWqNLKz/cVH/yoLLPca9YRvHd2q88=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QEhQcMJMNz8Ek5ZegKO9bKYkkUOVuOK1AM3zozlnvzByxReU2E7iYCpa3uEMXhThKHj4MmUJsrzdVSw9Q6L77PzduNUgB/03vPpBZoas8F5bF3f+xV3mC/msjgMQSx+4C2pCD6E21u2fS/K5ZhSGwrbhguWzSa16DVwcVJUDw3ZMcv9i+1mu82462DkQjLI+YvOXqjC/tlwrDbrhcJvpAXPf8fUlejvYCljS7g5FEx9vkPhMsqMVyGigwSCzwf3WG1zPizkMl5YBBgpXKFmMy6OY0qt/uJGsWnL5VhMJKXGZXFEgB7vLvphSXh/7NWZ9pTEmYuzkyinchfcMlIYdhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WSNgbDUw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WSNgbDUw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCs0Y06Hsz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:30:36 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SK8UAI020934;
	Fri, 29 Aug 2025 08:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VUxLfH
	67n0rOesHWqNLKz/cVH/yoLLPca9YRvHd2q88=; b=WSNgbDUw9t+q7vYPJlVD0u
	kSWgSnMnfnbxxKbRBaI7eBAxGTVdoAUUTrJauA2pP/zshaA2lN/5COtMiFPA3vXt
	T9ywlvdGj18tTFPG6MgAsIhm3q9LsXPvG9ENRANP1Hfyzp4AaH1u7Jm03sB5zdd4
	Pur3EyxjNk/VjrlpUjoIgpWrMpcpArvAucMXjkbv5o4Q+BQpcQtGHkuQpgMa2qt0
	W6yQfQnTjRDikf/M1bxqRNwvR65s0y/cWnJ78cKF0kAdT60IP7Fzj3S4nBLqxoNC
	Wm4W5grNJSFLem1YQ5xfZ7XXHmm8aF6g8sR7mJiGQeXSMKweV57mM2gCh+zGE6SQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqe90j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:30:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57T8UNg8022136;
	Fri, 29 Aug 2025 08:30:23 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqe90f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:30:23 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57T40L0O002654;
	Fri, 29 Aug 2025 08:30:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mrrk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:30:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57T8UItu32047816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:30:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB8C22004B;
	Fri, 29 Aug 2025 08:30:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A54B920040;
	Fri, 29 Aug 2025 08:30:11 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 Aug 2025 08:30:11 +0000 (GMT)
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
Subject: Re: [PATCH 07/14] tools/perf: Add basic CONFIG_AUXTRACE support for
 VPA pmu on powerpc
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <fae72739-8df2-463d-8d1f-e3ae1e36f781@intel.com>
Date: Fri, 29 Aug 2025 13:59:56 +0530
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
Message-Id: <C0788B7A-4EE9-466F-A583-1D4E1D4F60A2@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-8-atrajeev@linux.ibm.com>
 <fae72739-8df2-463d-8d1f-e3ae1e36f781@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX4JyuF5CaqzrS
 K4wsEw3kWy7T/PeLURgN0FRvNqEuqA0Yn92ASwfmTihePGmrg9xoOfogEyN3gjK0/Hru5985TcX
 zQ0be6BurNQAKbmPYa3YrPEMGp5HnntpOVIY4+EnDqX1olAKd/mvzUbn8jnAzEY9Jg2FfPooRkL
 D9GXDOeMeZWaR6b0A2dhulISuFVFYYWvrfTuSZpZ+qSNeb3hWh10YSeEdkSGmOOzQZj7+SPczKn
 p03/vqiZDRbCBRySh3+Rzgq8m/4ibddOTJNW5vEeromXuoOdKnkukaUHUH+fNFXJ5MmJtTmcVBe
 j+6R64hHYqltBeCxQdGpPT1p+MPpZbBJvnMorIp4UWy6yIM9/QpbFtSrdBvAXYIhjsiZBXpfhRq
 tN5+IHI9
X-Proofpoint-ORIG-GUID: 8qQvCUoGWZnS-wVF9EvmLi6fkooCBbCD
X-Proofpoint-GUID: CeOIeZbqmrqbPTLPV-mPSJclwIJtgwLh
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b16520 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=TLp5pqcIyGJhsTrFHCwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 27 Aug 2025, at 10:57=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/08/2025 11:34, Athira Rajeev wrote:
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
>> auxtrace_type as PERF_AUXTRACE_VPA_PMU. Add header file to define vpa
>> dtl pmu specific details.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> tools/perf/arch/powerpc/util/Build      |   1 +
>> tools/perf/arch/powerpc/util/auxtrace.c | 122 =
++++++++++++++++++++++++
>> tools/perf/util/auxtrace.c              |   2 +
>> tools/perf/util/auxtrace.h              |   1 +
>> tools/perf/util/powerpc-vpadtl.h        |  26 +++++
>> 5 files changed, 152 insertions(+)
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
>> index 000000000000..ec8ec601fd08
>> --- /dev/null
>> +++ b/tools/perf/arch/powerpc/util/auxtrace.c
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VPA support
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/types.h>
>> +#include <linux/bitops.h>
>> +#include <linux/log2.h>
>> +#include <time.h>
>> +
>> +#include "../../util/cpumap.h"
>> +#include "../../util/evsel.h"
>> +#include "../../util/evlist.h"
>> +#include "../../util/session.h"
>> +#include "../../util/util.h"
>> +#include "../../util/pmu.h"
>> +#include "../../util/debug.h"
>> +#include "../../util/auxtrace.h"
>> +#include "../../util/powerpc-vpadtl.h"
>=20
> It would be better to only add #includes when they are needed
>=20
>> +#include "../../util/record.h"
>> +#include <internal/lib.h> // page_size
>> +
>> +#define KiB(x) ((x) * 1024)
>> +
>> +static int
>> +powerpc_vpadtl_parse_snapshot_options(struct auxtrace_record *itr =
__maybe_unused,
>> + struct record_opts *opts __maybe_unused,
>> + const char *str __maybe_unused)
>> +{
>> + return 0;
>> +}
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
>> + return 0;
>=20
> return VPADTL_AUXTRACE_PRIV_SIZE;
>> +}
>> +
>> +static int
>> +powerpc_vpadtl_info_fill(struct auxtrace_record *itr __maybe_unused,
>> + struct perf_session *session __maybe_unused,
>> + struct perf_record_auxtrace_info *auxtrace_info __maybe_unused,
>=20
> auxtrace_info is not __maybe_unused
>=20
>> + size_t priv_size __maybe_unused)
>> +{
>> + auxtrace_info->type =3D PERF_AUXTRACE_VPA_PMU;
>> +
>> + return 0;
>> +}
>> +
>> +static u64 powerpc_vpadtl_reference(struct auxtrace_record *itr =
__maybe_unused)
>> +{
>> + return 0;
>> +}
>> +
>> +static void powerpc_vpadtl_free(struct auxtrace_record *itr)
>> +{
>> + free(itr);
>> +}
>> +
>> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist =
__maybe_unused,
>=20
> evlist is not __maybe_unused
>=20
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
>> + if (!strcmp(pmu_name, "vpa_dtl")) {
>=20
> pmu_name is leaked but strstarts() could be used instead
> of above
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
>> + aux->parse_snapshot_options =3D =
powerpc_vpadtl_parse_snapshot_options;
>=20
> Doesn't look like snapshot mode is supported, so
> powerpc_vpadtl_parse_snapshot_options() is not needed
>=20
>> + aux->recording_options =3D powerpc_vpadtl_recording_options;
>> + aux->info_priv_size =3D powerpc_vpadtl_info_priv_size;
>> + aux->info_fill =3D powerpc_vpadtl_info_fill;
>> + aux->free =3D powerpc_vpadtl_free;
>> + aux->reference =3D powerpc_vpadtl_reference;
>=20
> reference is optional.  powerpc_vpadtl_reference() stub is not needed
>=20
>> + return aux;
>> +}
>> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
>> index ebd32f1b8f12..f587d386c5ef 100644
>> --- a/tools/perf/util/auxtrace.c
>> +++ b/tools/perf/util/auxtrace.c
>> @@ -55,6 +55,7 @@
>> #include "hisi-ptt.h"
>> #include "s390-cpumsf.h"
>> #include "util/mmap.h"
>> +#include "powerpc-vpadtl.h"
>=20
> Isn't needed yet
>=20
>>=20
>> #include <linux/ctype.h>
>> #include "symbol/kallsyms.h"
>> @@ -1393,6 +1394,7 @@ int perf_event__process_auxtrace_info(struct =
perf_session *session,
>> case PERF_AUXTRACE_HISI_PTT:
>> err =3D hisi_ptt_process_auxtrace_info(event, session);
>> break;
>> + case PERF_AUXTRACE_VPA_PMU:
>> case PERF_AUXTRACE_UNKNOWN:
>> default:
>> return -EINVAL;
>> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
>> index f001cbb68f8e..1f9ef473af77 100644
>> --- a/tools/perf/util/auxtrace.h
>> +++ b/tools/perf/util/auxtrace.h
>> @@ -50,6 +50,7 @@ enum auxtrace_type {
>> PERF_AUXTRACE_ARM_SPE,
>> PERF_AUXTRACE_S390_CPUMSF,
>> PERF_AUXTRACE_HISI_PTT,
>> + PERF_AUXTRACE_VPA_PMU,
>=20
> Everything else is called some variation of vpa dtl, so
> PERF_AUXTRACE_VPA_DTL would seem a more consistent name
>=20
>> };
>>=20
>> enum itrace_period_type {
>> diff --git a/tools/perf/util/powerpc-vpadtl.h =
b/tools/perf/util/powerpc-vpadtl.h
>> new file mode 100644
>> index 000000000000..625172adaba5
>> --- /dev/null
>> +++ b/tools/perf/util/powerpc-vpadtl.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * VPA DTL PMU Support
>> + */
>> +
>> +#ifndef INCLUDE__PERF_POWERPC_VPADTL_H__
>> +#define INCLUDE__PERF_POWERPC_VPADTL_H__
>> +
>> +#define POWERPC_VPADTL_NAME "powerpc_vpadtl_"
>> +
>> +enum {
>> + POWERPC_VPADTL_TYPE,
>> + VPADTL_PER_CPU_MMAPS,
>=20
> VPADTL_PER_CPU_MMAPS is never used
>=20
>> + VPADTL_AUXTRACE_PRIV_MAX,
>> +};
>> +
>> +#define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * =
sizeof(u64))
>> +
>> +union perf_event;
>> +struct perf_session;
>> +struct perf_pmu;
>> +
>> +int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
>> +   struct perf_session *session);
>=20
> None of these definitions are used in this patch, although probably
> VPADTL_AUXTRACE_PRIV_SIZE should be.
> It would be better to add definitions only when they are needed.

Hi Adrian

Thanks for taking time to review this patch set and sharing your =
comments. I will address the changes suggested on each patches in next =
version

Thanks
Athira
>=20
>> +
>> +#endif



