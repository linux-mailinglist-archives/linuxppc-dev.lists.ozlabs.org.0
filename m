Return-Path: <linuxppc-dev+bounces-12203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB44FB57187
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGtn3mSBz3dD1;
	Mon, 15 Sep 2025 17:31:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921505;
	cv=none; b=frRCZlfpCkOFJ2IMFms+M6lGApQOH2dZqwChFLIKf/ASJs49DurywlMCDiLoWD3pDSEcl4B2XwdoLSDgtou+b/XDRQGi1xHnlUGhJ5favdjc0l4MwmN+vngheywD9uV3qG3Eg2qWUFT07f9b8iyZJZCyZdlqYerjGFtAd9siBD88bFBdQP1Z727nLMQILK/1ns67VQKf2ciUzB0goS8RqdxZ+Pbu9RXZGnK+bwd1sN6gy5AcLg+H2au9mufnAimJT7uR1cSz1Rz/qI5z74fBcZDZm7vZ6MTdGUEVmkcdf9Q+lqRl7MXHj70IIR9vhhSBXEOm2AsQvekINwbIyrPhww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921505; c=relaxed/relaxed;
	bh=L/VcmLQdqtTLiQ+mrBNkBFzDcnrzskSVgIo26Nm+gJM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MXU3aXR6Re1VA5jSK41DA7SSsz45fISRoQVGRAofIHr5xbHosy5zr9f+XrSNV7HtF8J09Qo/Oy5peE1bw1/hjjDNNYsfgE53WjVq8A78ZqJeO/EqC7RTxWq0A1fsKA/cgDNZceCF/kRfLYLZEObm8xQazsWW7hNFc2ZD6ZeEm2cmWrd/B7/odna+IfiknLBEYQurGA+zoalo+Iq0vkDn1ihqYX4l0SSKntc93AH1x7YeX55dMNaDKZpuHFWX81Ue2hpdRbC5VqduBRqTYCLBhyMAu/IR8IP+BASQWos0TtdCsru7o9AeuCmImC1V8WOGoNhB93AJQYtLDQLiPYjh0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdLtu0sg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdLtu0sg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGtm42hVz3dC0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:31:44 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F0e5mF022546;
	Mon, 15 Sep 2025 07:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=L/VcmL
	QdqtTLiQ+mrBNkBFzDcnrzskSVgIo26Nm+gJM=; b=YdLtu0sgqFjGIZJzaQLUyD
	hx4gmbjSMeotyUJvbHFBzC+nS3iwBOeMuZfUEQeWECTvmuWgrFMtNmBD2P3JnPjN
	JEEiHjmP7AecT1MhZBnHwoT3LDKaynrE4tTWSxe/LsBNrhey9kBU4sPP96uCckv7
	5Y0hB/A9AL1YTpoq2Op7zbaMGmva5Tl2aRTXN0urgZC/qg/F5T6F45iyTINP5J9t
	apRQ+wzZ//2wZOWi2k4i3HxWPyOzYOf26WsS2Z35FuJODhpxbbCKzyPC5ufJbVU9
	dlCUyjX5WKkKlTpc0Dmc1K+vutZkiolFrjZfg3naOvy7//UQTpv2z+1J0qVE+NDw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x0m3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:31:38 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7ULd5013229;
	Mon, 15 Sep 2025 07:31:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x0m35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:31:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3xo0B027393;
	Mon, 15 Sep 2025 07:31:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495memw67p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:31:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7VWSN15860000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:31:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CEC820049;
	Mon, 15 Sep 2025 07:31:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEECE2004F;
	Mon, 15 Sep 2025 07:31:26 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Sep 2025 07:31:26 +0000 (GMT)
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
Date: Mon, 15 Sep 2025 13:01:13 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C7841C0-2CCA-478E-AB1F-94F3FC651237@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-8-atrajeev@linux.ibm.com>
 <fae72739-8df2-463d-8d1f-e3ae1e36f781@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfXw8AjBP4m/JCb
 LwiF9XYePrZJAFRoEOOuo1tjXddL0EZMtKWnvXZ4xn4e+HnmI++x1qjIlvcZ6126jbwccOSPIN8
 PVa9RVg9NC7bP4onPxsOy4wI3Ux2fbQEqlswYs8vMG+HDQoJzt4xvB9EKOjYwqXtsOr0+qiBkzD
 dTwPyBPPbgTSPpabXWmc9qiA+QcMaLugAcdjDpwwn9eqo88S1o75JcrU2G+le8cjp+H3m+3eC8x
 O5JvsXAy1bTdPkSwgIdleHmGgGVTPN/1i6sJLS7qoeLSI3fL+oRiFyBFWDVUP6gn2Pi1Docqg1V
 iPiDGrW40+sVgdl7f1oIiwqO5hnDO2tJZqUq3qaBCKCpSkFnZHF02YMACIKvMIJkG0CgC2we9LQ
 w3jPzHzM
X-Proofpoint-ORIG-GUID: El5_OhzJTOWIp-CQydookI3J5WzfzhaF
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c7c0da cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=QyXUC8HyAAAA:8 a=QHbY-6ZkpMZ9EXw5BrQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: E_sdolR02-gcmIDHDLNNrXUacX48Pqkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
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

Hi Adrian

I have posted a V2 for perf tools side patches here: =
https://lore.kernel.org/linux-perf-users/20250915072754.99850-1-atrajeev@l=
inux.ibm.com/T/#t

I have incorporated changes based on your comments except these two:

1) For aux->reference
auxtrace_record__reference is called by __auxtrace_mmap__read:

__auxtrace_mmap__read -> auxtrace_record__reference =20
This access reference callback as below:

u64 auxtrace_record__reference(struct auxtrace_record *itr)
{                if (itr)
                return itr->reference(itr);
        return 0;
}       =20

For this patch series, I have added reference stub for vpa dtl, =
otherwise the record will segfault :

#0  0x0000000000000000 in ?? ()
#1  0x00000000102c5134 in auxtrace_record.reference ()
#2  0x00000000102c52c4 in __auxtrace_mmap__read ()
#3  0x000000001002ae68 in record.mmap_read_evlist ()
#4  0x000000001002fc7c in cmd_record ()
#5  0x00000000100b1dc0 in run_builtin ()
#6  0x00000000100b2310 in handle_internal_command ()
#7  0x000000001000f2f8 in main ()
(gdb) q


2) Change for auxtrace_queues__add_event

auxtrace_queues__process_index is not called for dump_trace. It is =
called for (!dump_trace)  to add entries to auxtrace queue to process =
later for perf report/script without -D
When -D is used ( dump_trace is set ) , to dump the auxtrace buffer =
content , auxtrace_queues__add_event is used to print the buffer content =
at time of processing PERF_RECORD_AUXTRACE records.
So I have kept that change as part of the patch. Because I want to dump =
the buffer content at time of processing the AUXTRACE record.

If any comments/suggestions please provide your valuable review comments =
on V2.=20

Thanks
Athira

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
>=20
>> +
>> +#endif



