Return-Path: <linuxppc-dev+bounces-11477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D8B3B60F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCs4v4Bjsz2yrX;
	Fri, 29 Aug 2025 18:34:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756456463;
	cv=none; b=kwppPNV1wn0T5hBs2QVIhtcloTLOhWSj/jztihzmS6TS9lEg30ITbomK+u7oawCYDIGD6seGEGp+sewXNs7Auy42yZpb6tmWJMuvo8jHX3YhRAUcg7JGNl4Wxly5XfixbpG0hO9XuCbsPKs5exgjFta4IFP21IhIoFamMH3kryXd0c9CO6bID9m1HA0pDJifdTp8tcg0t5I6hVtOF5nL5CeX8YqF3GaGyrrc5Cqn+4Po394won8klX6c9TvF9oJ/IhhwSObgj4yyjPtGHvdKet9Wmvcjrcaa5EjiiSH++lDkx8o8usnALe3hdATH5fv3DPyaBm/C16htWFFX1FPldg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756456463; c=relaxed/relaxed;
	bh=E6imMMdfx24g+VbZ8kZ/uUr8m9yRkwVUhKIUfh2sF2M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Hy9wPJrYdrwqP6dmr+NNezMUqBPitma49Aaqnons1LwQ4a/SJit85dq+nJgcOOUnw3M9yTztKY3GdVCbjLgwKrSqQREYb0yIec/kA66583R5giNIHiYGSBwsnTFpERvyK9LindFAge/R0ffrKfJ8kNPNuXBKyxRoF+Usqdr9KU0xoaBqvVHSuYk66xz3REp+Vjq2DnBUVbbFxBuLt5zyVQZ3nJjFroK1EDNMrieR8iyU6gf4dqwRxcL4ihW0naJHhzZqYdK3tHl3dOAswBeaOTpRzyGXOi67Rc/1E9+FWYItUJkU7m8manKIgS/DEbOAQuGw+ryGKKoEayIBB9XLaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oAWyHJeJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oAWyHJeJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCs4t2PLTz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:34:22 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8HTbC021073;
	Fri, 29 Aug 2025 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=E6imMM
	dfx24g+VbZ8kZ/uUr8m9yRkwVUhKIUfh2sF2M=; b=oAWyHJeJocutVmO5VNPgbu
	JtwMBbIF74rNtZF54flkKfxfITyJ6FXPsALpuW86mnRJkURixEzun7lFGZzY+RB1
	Kc/EilWgrhlwAi/5jwSveG36FmseWMhXAVrremI7LTcG4WgTNWsBnCLHtA2FFlEa
	4PK7AuJmmjZyd//p+7WLor41MEtlAm/xrT504DlZlHtvaITsnFGz/foMezmvQz3E
	XjyzPuSROqAzHqhYFmdJ1a37Gpz84ilk86CZqkd0br12DjRSDtNL3BShmbMEnmKs
	yQt+CsMxbkeqZLKrHEI851ApPj1BhxYvgpWC+EwAF/wYJkx8GEbBwDQboZtpvVhQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rw9j7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:34:16 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57T8KKwc025931;
	Fri, 29 Aug 2025 08:34:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rw9j7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:34:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57T5ikPY007514;
	Fri, 29 Aug 2025 08:34:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyus60e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:34:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57T8YAES39453110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:34:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5B6C20040;
	Fri, 29 Aug 2025 08:34:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B94D20043;
	Fri, 29 Aug 2025 08:34:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 Aug 2025 08:34:03 +0000 (GMT)
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
Subject: Re: [PATCH 11/14] tools/perf: Process the DTL entries in queue and
 deliver samples
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <d47939a7-2db6-40ac-97da-95b8c37bb0af@intel.com>
Date: Fri, 29 Aug 2025 14:03:49 +0530
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
Message-Id: <1AC0DDB0-0671-4736-9A0D-C7B5DC48A5A6@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-12-atrajeev@linux.ibm.com>
 <d47939a7-2db6-40ac-97da-95b8c37bb0af@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Iuk7Fvhq7VlitYgz7NtDykUmU8Mfm7p4
X-Authority-Analysis: v=2.4 cv=fbCty1QF c=1 sm=1 tr=0 ts=68b16608 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=l6QfPf4-XW_ldrAnRqQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mzgu0TSeodHeZjozwMZsJvhrEnfKKe9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA1NSBTYWx0ZWRfX9KgEvLSER5qH
 rfWKz28gbv7fY8/zRXLpix8015mulmnn0p8lCaAJ5BB/z2rouXFSVy/+eJ0vY0b0aOMl0Iszt5a
 +JRgN1Ejk5dGoPU+iURtpcksNmK0H8aUTraSp7Ma63oQpp2C55s/13volTUILJm3SXyHcH3ItNc
 ItT0hASw7kcaqKhhlDDlvLRIqGwjhzOyDux8r3b4ecHFuPC176Dj3i7lwJk0GTcvmq9xI2AauqO
 4TwvzDov3WeG7qhTfoAJ8nm2VgrAsOD+6XFUCwnBaVeUpAN/pvgtgLu2p4m3jzBU/sH1Jr4hgbq
 UeO71abs0TlwvMhwtKWniU9Ef29PolDWIBOd1+4hbeUkJeWqaXvp3ThvHPngjVA8m7AYCql6DKE
 tl0hWhxx
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



> On 27 Aug 2025, at 10:59=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/08/2025 11:34, Athira Rajeev wrote:
>> Create samples from DTL entries for displaying in perf report
>> and perf script. When the different PERF_RECORD_XX records are
>> processed from perf session, powerpc_vpadtl_process_event() will
>> be invoked. For each of the PERF_RECORD_XX record, compare the =
timestamp
>> of perf record with timestamp of top element in the auxtrace heap.
>> Process the auxtrace queue if the timestamp of element from heap is
>> lower than timestamp from entry in perf record.
>>=20
>> Sometimes it could happen that one buffer is only partially
>> processed. if the timestamp of occurrence of another event is more
>> than currently processed element in the queue, it will move on
>> to next perf record. So keep track of position of buffer to
>> continue processing next time. Update the timestamp of the
>> auxtrace heap with the timestamp of last processed entry from
>> the auxtrace buffer.
>>=20
>> Generate perf sample for each entry in the dispatch trace log.
>> Fill in the sample details:
>> - sample ip is picked from srr0 field of dtl_entry
>> - sample cpu is picked from processor_id of dtl_entry
>> - sample id is from sample_id of powerpc_vpadtl
>> - cpumode is set to PERF_RECORD_MISC_KERNEL
>> - Additionally save the details in raw_data of sample. This
>> is to print the relevant fields in perf_sample__fprintf_synth()
>> when called from builtin-script
>>=20
>> The sample is processed by calling =
perf_session__deliver_synth_event()
>> so that it gets included in perf report.
>>=20
>> Sample Output:
>>=20
>>  ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>>  [ perf record: Woken up 1 times to write data ]
>>  [ perf record: Captured and wrote 0.300 MB perf.data ]
>>=20
>>  ./perf report
>>=20
>>  # Samples: 321  of event 'vpa-dtl'
>>  # Event count (approx.): 321
>>  #
>>  # Children      Self  Command  Shared Object      Symbol
>>  # ........  ........  .......  .................  =
..............................
>>  #
>>     100.00%   100.00%  swapper  [kernel.kallsyms]  [k] =
plpar_hcall_norets_notrace
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> tools/perf/util/powerpc-vpadtl.c | 181 =
+++++++++++++++++++++++++++++++
>> 1 file changed, 181 insertions(+)
>>=20
>> diff --git a/tools/perf/util/powerpc-vpadtl.c =
b/tools/perf/util/powerpc-vpadtl.c
>> index 299927901c9d..370c566f9ac2 100644
>> --- a/tools/perf/util/powerpc-vpadtl.c
>> +++ b/tools/perf/util/powerpc-vpadtl.c
>> @@ -160,6 +160,43 @@ static void powerpc_vpadtl_dump_event(struct =
powerpc_vpadtl *vpa, unsigned char
>> powerpc_vpadtl_dump(vpa, buf, len);
>> }
>>=20
>> +/*
>> + * Generate perf sample for each entry in the dispatch trace log.
>> + *   - sample ip is picked from srr0 field of dtl_entry
>> + *   - sample cpu is picked from logical cpu.
>> + *   - sample id is from sample_id of powerpc_vpadtl
>> + *   - cpumode is set to PERF_RECORD_MISC_KERNEL
>=20
> Above 4 lines of comments are a bit redundant.
>=20
>> + *   - Additionally save the details in raw_data of sample. This
>> + *   is to print the relevant fields in perf_sample__fprintf_synth()
>> + *   when called from builtin-script
>> + */
>> +static int powerpc_vpadtl_sample(struct dtl_entry *record, struct =
powerpc_vpadtl *vpa, u64 save, int cpu)
>> +{
>> + struct perf_sample sample;
>> + union perf_event event;
>> +
>> + sample.ip =3D be64_to_cpu(record->srr0);
>> + sample.period =3D 1;
>> + sample.cpu =3D cpu;
>> + sample.id =3D vpa->sample_id;
>> + sample.callchain =3D NULL;
>> + sample.branch_stack =3D NULL;
>> + memset(&event, 0, sizeof(event));
>> + sample.cpumode =3D PERF_RECORD_MISC_KERNEL;
>> + sample.time =3D save;
>> + sample.raw_data =3D record;
>> + sample.raw_size =3D sizeof(record);
>> + event.sample.header.type =3D PERF_RECORD_SAMPLE;
>> + event.sample.header.misc =3D sample.cpumode;
>> + event.sample.header.size =3D sizeof(struct perf_event_header);
>> + if (perf_session__deliver_synth_event(vpa->session, &event,
>> + &sample)) {
>=20
> There is some inconsistency with line wrapping
I will handle this properly in V2
>=20
>> + pr_debug("Failed to create sample for dtl entry\n");
>> + return -1;
>> + }
>> + return 0;
>> +}
>> +
>> static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue =
*vpaq)
>> {
>> struct auxtrace_buffer *buffer =3D vpaq->buffer;
>> @@ -233,6 +270,148 @@ static int powerpc_vpadtl_decode(struct =
powerpc_vpadtl_queue *vpaq)
>> return 1;
>> }
>>=20
>> +static int powerpc_vpadtl_decode_all(struct powerpc_vpadtl_queue =
*vpaq)
>> +{
>> + int ret;
>> + unsigned char *buf;
>> +
>> + if (!vpaq->buf_len || (vpaq->pkt_len =3D=3D vpaq->size)) {
>=20
> Unnecessary parentheses around 'vpaq->pkt_len =3D=3D vpaq->size=E2=80=99=

Ok,=20
>=20
>> + ret =3D powerpc_vpadtl_get_buffer(vpaq);
>> + if (ret <=3D 0)
>> + return ret;
>> + }
>> +
>> + if (vpaq->buffer) {
>> + buf =3D vpaq->buffer->data;
>> + buf +=3D vpaq->pkt_len;
>> + vpaq->dtl =3D (struct dtl_entry *)buf;
>> + if ((long long)be64_to_cpu(vpaq->dtl->timebase) <=3D 0) {
>> + if (vpaq->pkt_len !=3D dtl_entry_size && vpaq->buf_len) {
>> + vpaq->pkt_len +=3D dtl_entry_size;
>> + vpaq->buf_len -=3D dtl_entry_size;
>> + }
>> + return -1;
>> + }
>> + vpaq->pkt_len +=3D dtl_entry_size;
>> + vpaq->buf_len -=3D dtl_entry_size;
>> + } else
>> + return 0;
>=20
> braces {} should be used on all arms of this statement
Sure,=20
>=20
>> +
>> +
>> + return 1;
>> +}
>> +
>> +static int powerpc_vpadtl_run_decoder(struct powerpc_vpadtl_queue =
*vpaq, u64 *timestamp)
>> +{
>> + struct powerpc_vpadtl *vpa =3D vpaq->vpa;
>> + struct dtl_entry *record;
>> + int ret;
>> + double result, div;
>> + double boot_freq =3D vpaq->tb_freq;
>> + unsigned long long boot_tb =3D vpaq->boot_tb;
>> + unsigned long long diff;
>> + unsigned long long save;
>> +
>> + while (1) {
>> + ret =3D powerpc_vpadtl_decode_all(vpaq);
>> + if (!ret) {
>> + pr_debug("All data in the queue has been processed.\n");
>> + return 1;
>> + }
>> +
>> + /*
>> +  * Error is detected when decoding VPA PMU trace. Continue to
>> +  * the next trace data and find out more dtl entries.
>> +  */
>> + if (ret < 0)
>> + continue;
>> +
>> + record =3D vpaq->dtl;
>> +
>> + diff =3D be64_to_cpu(record->timebase) - boot_tb;
>> + div =3D diff / boot_freq;
>> + result =3D div;
>> + result =3D result * 1000000000;
>> + save =3D result;
>=20
> It would be nicer for the time calculation to be in a separate =
function.
> Also 'save' is an odd choice of variable name for a timestamp.

Will have a separate function for time calculation
And will make meaningful name for saving it in V2

Thanks
Athira
>=20
>> +
>> + /* Update timestamp for the last record */
>> + if (save > vpaq->timestamp)
>> + vpaq->timestamp =3D save;
>> +
>> + /*
>> +  * If the timestamp of the queue is later than timestamp of the
>> +  * coming perf event, bail out so can allow the perf event to
>> +  * be processed ahead.
>> +  */
>> + if (vpaq->timestamp >=3D *timestamp) {
>> + *timestamp =3D vpaq->timestamp;
>> + vpaq->pkt_len -=3D dtl_entry_size;
>> + vpaq->buf_len +=3D dtl_entry_size;
>> + return 0;
>> + }
>> +
>> + ret =3D powerpc_vpadtl_sample(record, vpa, save, vpaq->cpu);
>> + if (ret)
>> + continue;
>> + }
>> + return 0;
>> +}
>> +
>> +/*
>> + * For each of the PERF_RECORD_XX record, compare the timestamp
>> + * of perf record with timestamp of top element in the auxtrace =
heap.
>> + * Process the auxtrace queue if the timestamp of element from heap =
is
>> + * lower than timestamp from entry in perf record.
>> + *
>> + * Update the timestamp of the auxtrace heap with the timestamp
>> + * of last processed entry from the auxtrace buffer.
>> + */
>> +static int powerpc_vpadtl_process_queues(struct powerpc_vpadtl *vpa, =
u64 timestamp)
>> +{
>> + unsigned int queue_nr;
>> + u64 ts;
>> + int ret;
>> +
>> + while (1) {
>> + struct auxtrace_queue *queue;
>> + struct powerpc_vpadtl_queue *vpaq;
>> +
>> + if (!vpa->heap.heap_cnt)
>> + return 0;
>> +
>> + if (vpa->heap.heap_array[0].ordinal >=3D timestamp)
>> + return 0;
>> +
>> + queue_nr =3D vpa->heap.heap_array[0].queue_nr;
>> + queue =3D &vpa->queues.queue_array[queue_nr];
>> + vpaq =3D queue->priv;
>> +
>> + auxtrace_heap__pop(&vpa->heap);
>> +
>> + if (vpa->heap.heap_cnt) {
>> + ts =3D vpa->heap.heap_array[0].ordinal + 1;
>> + if (ts > timestamp)
>> + ts =3D timestamp;
>> + } else
>> + ts =3D timestamp;
>=20
> braces {} should be used on all arms of this statement
>=20
>> +
>> + ret =3D powerpc_vpadtl_run_decoder(vpaq, &ts);
>> + if (ret < 0) {
>> + auxtrace_heap__add(&vpa->heap, queue_nr, ts);
>> + return ret;
>> + }
>> +
>> + if (!ret) {
>> + ret =3D auxtrace_heap__add(&vpa->heap, queue_nr, ts);
>> + if (ret < 0)
>> + return ret;
>> + } else {
>> + vpaq->on_heap =3D false;
>> + }
>> + }
>> + return 0;
>> +}
>> +
>> static struct powerpc_vpadtl_queue =
*powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
>> unsigned int queue_nr)
>> {
>> @@ -368,6 +547,8 @@ static int powerpc_vpadtl_process_event(struct =
perf_session *session __maybe_unu
>> err =3D powerpc_vpadtl__update_queues(vpa);
>> if (err)
>> return err;
>> +
>> + err =3D powerpc_vpadtl_process_queues(vpa, sample->time);
>> }
>>=20
>> return err;



