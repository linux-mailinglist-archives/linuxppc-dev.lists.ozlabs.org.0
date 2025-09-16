Return-Path: <linuxppc-dev+bounces-12271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABAB58CE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpzp5W1nz30T9;
	Tue, 16 Sep 2025 14:37:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757997478;
	cv=none; b=FgYXQFH/dvNrfs9Ko3Yl1fQnor0nFscSrKgYrUUQMpq1d323UL4/UM8lbksD74yHE54G3KXo4W+uwbmx0o1ag2fyXSX0znZVdCfR3RJN6Jc7lqIoapiKu7NygdmfMTwVkruHgaRh72Do7ON9t0Xk9De36CBv2q2Y1uiYpFAH9e5w1dA6iZX0Ncq4Kg91RQvZ4sps10Svs+fElDkWML7qutuAPMbSSD9sYUPc0D0ePV/DOqasftTpKkrOZazB1TOs+lO7b/XtPUfgdReQz1O1yPvB2kDjrSOwPPfloS2LJ5PrAPQZ1kxugKrTEiXaz+ffOL44YU3/IfpkXl4H5t+TvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757997478; c=relaxed/relaxed;
	bh=zmJueBrpRbCXX+wFW6hteXr1OcbuOf5AfyS9SsBwHKg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=B/LlRABf2MSeJThGo4+5ilx8nCl3bf4JCOnrFMR6RXt8KytO7t2bDxLFS05YIPcJoAvVVOkdgDyUIMrUjrgm+dblHOmaUT5fXPKKfR0H4kXLn0R99+ENAyrXGL4m1klr6hiCG0fu9nWFA8e9SW/AyqGbsQAfbEKR2rkJbumKvioKVGieiqtpScLM7/bLvTpuALxqhfQf65NaTy/rtP81FRhq81mJVKuCcHLHj7bDJkFM+LOM7ZxkMZtWAXJF89MAj1wQh0+Bu8g852qgSsryqmwhWtkAOBe5o5lNEGHuuZMp1Db+6aOHmYFCDS8NU8gcUsADzF2j1nRphvX7iRrCPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dkfN/x8f; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dkfN/x8f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQpzp0Nkpz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:37:57 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G1BUgW023433;
	Tue, 16 Sep 2025 04:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zmJueB
	rpRbCXX+wFW6hteXr1OcbuOf5AfyS9SsBwHKg=; b=dkfN/x8flKozVwXu4rIGgQ
	j3qLgC+DWqxAxQcG8Oq4fpFgiZHpZsiK1yrXX1idnmzZDNFLjpp+AAKwAV1n8sh0
	Yzf96Nu2Hv/xJJgetRCELEPlNaHnEFEPYBkOp6A9OU/F0HP0yAkLAxzkA9vxUFYH
	mtDAnYgzBt3EazKznoHb+tmRhJ/TAnqkKTUEt/YZ0zWJhhC/fP1ZBWJSNeAx04gw
	YTIIiJIi5KoViPRuxS7R2DTdZohGT7cRJHUNZxZm+qrT5tRFJmlf5HUCubRdSqDh
	39swOR5zTbJwSQC5wVSq162/yZLywG1oQ9v8HETNBg+PJ4T+5zZj+nfkGH7OEA4w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnpu07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:37:53 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4bqnZ028149;
	Tue, 16 Sep 2025 04:37:52 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnpu04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:37:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G1kM1f005963;
	Tue, 16 Sep 2025 04:37:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 495jxu28cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:37:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4bmAf24052004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:37:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EEEB20040;
	Tue, 16 Sep 2025 04:37:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37B0620043;
	Tue, 16 Sep 2025 04:37:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.152])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Sep 2025 04:37:42 +0000 (GMT)
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
Subject: Re: [PATCH V2 4/6] tools/perf: Allocate and setup aux buffer queue to
 help co-relate with other events across CPU's
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <3a294b79-165e-4922-b4fc-8d85d65c8004@intel.com>
Date: Tue, 16 Sep 2025 10:07:32 +0530
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
Message-Id: <0E7C5B9B-7B8A-43C6-8176-93E91B40F97C@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-5-atrajeev@linux.ibm.com>
 <3a294b79-165e-4922-b4fc-8d85d65c8004@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f5NqLbB5aFZxT8OnTQ9g9TLFcDrimhrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX5vI8MkC0ChMS
 z1qhvk1ftUEQjFi6jTI5rzV3cJBfrmHan/qzy22nNC/camwmbGMyb2WnGsL5LTLx5VD0/WbXw50
 bY0AxdGCcSWnqwThZL8uROR3irJMq2zB0oO84Z4Le99gLp4jvEMTzhasa3GjxOi/xPGlaQY6iSQ
 2hxDOAAjrB8vO65h2weDHXc8zx5vFmPcf0TtgahUJ76RJqNL/ucnn12lxBKBcgYmmvKjKx53tol
 Oa9h/7hGRbmiwSmT9SpZZAEuANbjqUUJWUcnR/XZxW43cbYNZOZ6uzJoPYH69H82lcjN52V4X8I
 Dr7Zf2E5uLoRdy7L4LE+BdvL2lNRU8oGJgfD747u6HmgFPjHhxzXM6Q+R9IZ/y6elCLZIrKG0Y5
 y6p015Ht
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c8e9a1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=mNv1kSGN4zei_JH_2vsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: d8vwKPiM6U-9PjtBZsK_baT--1HolP3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 8:38=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/09/2025 10:27, Athira Rajeev wrote:
>> When the Dispatch Trace Log data is collected along with other events
>> like sched tracepoint events, it needs to be correlated and present
>> interleaved along with these events. Perf events can be collected
>> parallely across the CPUs. Hence it needs to be ensured events/dtl
>> entries are processed in timestamp order.
>>=20
>> An auxtrace_queue is created for each CPU. Data within each queue is =
in
>> increasing order of timestamp. Each auxtrace queue has a array/list =
of
>> auxtrace buffers. When processing the auxtrace buffer, the data is
>> mmapp'ed. All auxtrace queues is maintained in auxtrace heap. Each =
queue
>> has a queue number and a timestamp. The queues are sorted/added to =
head
>> based on the time stamp. So always the lowest timestamp (entries to =
be
>> processed first) is on top of the heap.
>>=20
>> The auxtrace queue needs to be allocated and heap needs to be =
populated
>> in the sorted order of timestamp. The queue needs to be filled with =
data
>> only once via powerpc_vpadtl__update_queues() function.
>> powerpc_vpadtl__setup_queues() iterates through all the entries to
>> allocate and setup the auxtrace queue. To add to auxtrace heap, it is
>> required to fetch the timebase of first entry for each of the queue.
>>=20
>> The first entry in the queue for VPA DTL PMU has the boot timebase,
>> frequency details which are needed to get timestamp which is required =
to
>> correlate with other events. The very next entry is the actual trace =
data
>> that provides timestamp for occurrence of DTL event. Formula used to =
get
>> the timestamp from dtl entry is:
>>=20
>> ((timbase from DTL entry - boot time) / frequency) * 1000000000
>>=20
>> powerpc_vpadtl_decode() adds the boot time and frequency as part of
>> powerpc_vpadtl_queue structure so that it can be reused. Each of the
>> dtl_entry is of 48 bytes size. Sometimes it could happen that one =
buffer
>> is only partially processed (if the timestamp of occurrence of =
another
>> event is more than currently processed element in queue, it will move =
on
>> to next event). In order to keep track of position of buffer, =
additional
>> fields is added to powerpc_vpadtl_queue structure.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> Changelog:
>> Addressed review comments from Adrian
>> - Moved time calculation to separate function
>>=20
>> tools/perf/util/powerpc-vpadtl.c | 226 =
++++++++++++++++++++++++++++++-
>> 1 file changed, 223 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/tools/perf/util/powerpc-vpadtl.c =
b/tools/perf/util/powerpc-vpadtl.c
>> index 9098cbe00bfd..637abde60f44 100644
>> --- a/tools/perf/util/powerpc-vpadtl.c
>> +++ b/tools/perf/util/powerpc-vpadtl.c
>> @@ -10,6 +10,8 @@
>> #include "session.h"
>> #include "debug.h"
>> #include "powerpc-vpadtl.h"
>> +#include "sample.h"
>> +#include "tool.h"
>>=20
>> /*
>>  * Structure to save the auxtrace queue
>> @@ -38,6 +40,14 @@ struct powerpc_vpadtl_queue {
>> struct auxtrace_buffer *buffer;
>> struct thread *thread;
>> bool on_heap;
>> + struct powerpc_vpadtl_entry *dtl;
>> + u64 timestamp;
>> + unsigned long pkt_len;
>> + unsigned long buf_len;
>> + u64 boot_tb;
>> + u64 tb_freq;
>> + unsigned int tb_buffer;
>> + unsigned int size;
>> bool done;
>> pid_t pid;
>> pid_t tid;
>> @@ -112,6 +122,33 @@ static void powerpc_vpadtl_dump(struct =
powerpc_vpadtl *vpa __maybe_unused,
>> }
>> }
>>=20
>> +static unsigned long long powerpc_vpadtl_timestamp(struct =
powerpc_vpadtl_queue *vpaq)
>> +{
>> + struct powerpc_vpadtl_entry *record =3D vpaq->dtl;
>> + double result, div;
>> + double boot_freq;
>> + unsigned long long boot_tb;
>> + unsigned long long diff;
>> + unsigned long long timestamp =3D 0;
>=20
> Prettier in descending line length e.g.
>=20
> struct powerpc_vpadtl_entry *record =3D vpaq->dtl;
> unsigned long long timestamp =3D 0;
> unsigned long long boot_tb;
> unsigned long long diff;
> double result, div;
> double boot_freq;
>=20
>> +
>> + /*
>> +  * Formula used to get timestamp that can be co-related with
>> +  * other perf events:
>> +  * ((timbase from DTL entry - boot time) / frequency) * 1000000000
>> +  */
>> + if (record->timebase) {
>> + boot_tb =3D vpaq->boot_tb;
>> + boot_freq =3D vpaq->tb_freq;
>> + diff =3D be64_to_cpu(record->timebase) - boot_tb;
>> + div =3D diff / boot_freq;
>> + result =3D div;
>> + result =3D result * 1000000000;
>> + timestamp =3D result;
>> + }
>> +
>> + return timestamp;
>> +}
>> +
>> static struct powerpc_vpadtl *session_to_vpa(struct perf_session =
*session)
>> {
>> return container_of(session->auxtrace, struct powerpc_vpadtl, =
auxtrace);
>> @@ -124,12 +161,195 @@ static void powerpc_vpadtl_dump_event(struct =
powerpc_vpadtl *vpa, unsigned char
>> powerpc_vpadtl_dump(vpa, buf, len);
>> }
>>=20
>> +static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue =
*vpaq)
>> +{
>> + struct auxtrace_buffer *buffer =3D vpaq->buffer;
>> + struct auxtrace_queues *queues =3D &vpaq->vpa->queues;
>> + struct auxtrace_queue *queue;
>> +
>> + queue =3D &queues->queue_array[vpaq->queue_nr];
>> + buffer =3D auxtrace_buffer__next(queue, buffer);
>> +
>> + if (!buffer)
>> + return 0;
>> +
>> + vpaq->buffer =3D buffer;
>> + vpaq->size =3D buffer->size;
>> +
>> + /* If the aux_buffer doesn't have data associated, try to load it =
*/
>> + if (!buffer->data) {
>> + /* get the file desc associated with the perf data file */
>> + int fd =3D perf_data__fd(vpaq->vpa->session->data);
>> +
>> + buffer->data =3D auxtrace_buffer__get_data(buffer, fd);
>> + if (!buffer->data)
>> + return -ENOMEM;
>> + }
>> +
>> + vpaq->buf_len =3D buffer->size;
>> +
>> + if (buffer->size % dtl_entry_size)
>> + vpaq->buf_len =3D buffer->size - (buffer->size % dtl_entry_size);
>> +
>> + if (vpaq->tb_buffer !=3D buffer->buffer_nr) {
>> + vpaq->pkt_len =3D 0;
>> + vpaq->tb_buffer =3D 0;
>> + }
>> +
>> + return 1;
>> +}
>> +
>> +/*
>> + * The first entry in the queue for VPA DTL PMU has the boot =
timebase,
>> + * frequency details which are needed to get timestamp which is =
required to
>> + * correlate with other events. Save the boot_tb and tb_freq as part =
of
>> + * powerpc_vpadtl_queue. The very next entry is the actual trace =
data to
>> + * be returned.
>> + */
>> +static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
>> +{
>> + int ret;
>> + char *buf;
>> + struct boottb_freq *boottb;
>> +
>> + ret =3D powerpc_vpadtl_get_buffer(vpaq);
>> + if (ret <=3D 0)
>> + return ret;
>> +
>> + boottb =3D (struct boottb_freq *)vpaq->buffer->data;
>> + if (boottb->timebase =3D=3D 0) {
>> + vpaq->boot_tb =3D boottb->boot_tb;
>> + vpaq->tb_freq =3D boottb->tb_freq;
>> + vpaq->pkt_len +=3D dtl_entry_size;
>> + }
>> +
>> + buf =3D vpaq->buffer->data;
>> + buf +=3D vpaq->pkt_len;
>> + vpaq->dtl =3D (struct powerpc_vpadtl_entry *)buf;
>> +
>> + vpaq->tb_buffer =3D vpaq->buffer->buffer_nr;
>> + vpaq->buffer =3D NULL;
>> + vpaq->buf_len =3D 0;
>> +
>> + return 1;
>> +}
>> +
>> +static struct powerpc_vpadtl_queue =
*powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
>> + unsigned int queue_nr)
>> +{
>> + struct powerpc_vpadtl_queue *vpaq;
>> +
>> + vpaq =3D zalloc(sizeof(*vpaq));
>> + if (!vpaq)
>> + return NULL;
>> +
>> + vpaq->vpa =3D vpa;
>> + vpaq->queue_nr =3D queue_nr;
>> +
>> + return vpaq;
>> +}
>> +
>> +/*
>> + * When the Dispatch Trace Log data is collected along with other =
events
>> + * like sched tracepoint events, it needs to be correlated and =
present
>> + * interleaved along with these events. Perf events can be collected
>> + * parallely across the CPUs.
>> + *
>> + * An auxtrace_queue is created for each CPU. Data within each queue =
is in
>> + * increasing order of timestamp. Allocate and setup auxtrace queues =
here.
>> + * All auxtrace queues is maintained in auxtrace heap in the =
increasing order
>> + * of timestamp. So always the lowest timestamp (entries to be =
processed first)
>> + * is on top of the heap.
>> + *
>> + * To add to auxtrace heap, fetch the timestamp from first DTL entry
>> + * for each of the queue.
>> + */
>> +static int powerpc_vpadtl__setup_queue(struct powerpc_vpadtl *vpa,
>> + struct auxtrace_queue *queue,
>> + unsigned int queue_nr)
>> +{
>> + struct powerpc_vpadtl_queue *vpaq =3D queue->priv;
>> +
>> + if (list_empty(&queue->head) || vpaq)
>> + return 0;
>> +
>> + vpaq =3D powerpc_vpadtl__alloc_queue(vpa, queue_nr);
>> + if (!vpaq)
>> + return -ENOMEM;
>> +
>> + queue->priv =3D vpaq;
>> +
>> + if (queue->cpu !=3D -1)
>> + vpaq->cpu =3D queue->cpu;
>> +
>> + if (!vpaq->on_heap) {
>> + int ret;
>> +retry:
>> + ret =3D powerpc_vpadtl_decode(vpaq);
>> + if (!ret)
>> + return 0;
>> +
>> + if (ret < 0)
>> + goto retry;
>> +
>> + vpaq->timestamp =3D powerpc_vpadtl_timestamp(vpaq);
>> +
>> + ret =3D auxtrace_heap__add(&vpa->heap, queue_nr, vpaq->timestamp);
>> + if (ret)
>> + return ret;
>> + vpaq->on_heap =3D true;
>> + }
>> +
>> + return 0;
>> +}
>> +
>> +static int powerpc_vpadtl__setup_queues(struct powerpc_vpadtl *vpa)
>> +{
>> + unsigned int i;
>> + int ret;
>> +
>> + for (i =3D 0; i < vpa->queues.nr_queues; i++) {
>> + ret =3D powerpc_vpadtl__setup_queue(vpa, =
&vpa->queues.queue_array[i], i);
>> + if (ret)
>> + return ret;
>> + }
>> +
>> + return 0;
>> +}
>> +
>> +static int powerpc_vpadtl__update_queues(struct powerpc_vpadtl *vpa)
>> +{
>> + if (vpa->queues.new_data) {
>> + vpa->queues.new_data =3D false;
>> + return powerpc_vpadtl__setup_queues(vpa);
>> + }
>> +
>> + return 0;
>> +}
>> +
>> static int powerpc_vpadtl_process_event(struct perf_session *session =
__maybe_unused,
>=20
> session is not __maybe_unused
>=20
Sure

I will address these changes in V3

Thanks
Athira
>>  union perf_event *event __maybe_unused,
>> -  struct perf_sample *sample __maybe_unused,
>> -  const struct perf_tool *tool __maybe_unused)
>> +  struct perf_sample *sample,
>> +  const struct perf_tool *tool)
>> {
>> - return 0;
>> + struct powerpc_vpadtl *vpa =3D session_to_vpa(session);
>> + int err =3D 0;
>> +
>> + if (dump_trace)
>> + return 0;
>> +
>> + if (!tool->ordered_events) {
>> + pr_err("VPA requires ordered events\n");
>> + return -EINVAL;
>> + }
>> +
>> + if (sample->time) {
>> + err =3D powerpc_vpadtl__update_queues(vpa);
>> + if (err)
>> + return err;
>> + }
>> +
>> + return err;
>> }
>>=20
>> /*



