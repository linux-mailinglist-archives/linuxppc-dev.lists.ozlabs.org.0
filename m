Return-Path: <linuxppc-dev+bounces-12244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D60B581A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 18:09:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQVN46jGkz3f5q;
	Tue, 16 Sep 2025 02:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757952564;
	cv=none; b=V+KPuZbL0nvct/v3LME6gvmUlwqopaiWwo8ThL5ag8RaIRTZwaaF2+vwcz/r5us/XjcumEzLwfHlkuj1zMkWr64yvTJ+ZFpvv9o5K283NKL8w+V1MZ6A9U8fsGOzAvtzO3348VE8n+yyze1Yna/1vOOUekOkc7nY9Pm3nOTHmyHDygbOKLpHetoYTqlYWJnFxQl13DDwd7GCgD9NNQIZPxqBI3goKhtykY0tSdwY421HfxiLX6m8EEiW6QB4AVzW226cnO/OhKryoxmBLfEYl3P0JnTbeczJv0i0cf4Y1BgocIZPnSKC3tt2P2DLhjiZWFufD5hsP2JzrD5DeGb4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757952564; c=relaxed/relaxed;
	bh=7q/379l/XFqj7JrScjojX3o0l7vXy2VkyyKNtyMOR2w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=akM8FD4qw7oeb1Hv0ciUbJF/Wg/NGcFsKQPy7zZpqGbrKCEZ8NU48UNOi7WXRe0YTU9b2+kW+Q6NK+o90pHzAcVuDOXIGaE3H89nLusJ7o6Le3uPLCkP49NhbsPTN9QCdINFtITVTJMuYgcY2C7Q9v2LH9f6SJdCpwzLJ4CIRyTN2zb48vKuIPrJXt74hUoTHNBWhQ0f7gX5topJj7B1CQiPr86TzysMbSqgtkiA8YZuyEwiwUmByS5LgRRuUwCU/iZrGcKiHmy+YKWt7ssPw9yEvz/eR/MrO01+Hpk5PBMLq4HdaT6WFWvdlJ+MfNpdax4FNRv0qgwM/1ZAy4Qzmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AMRm6BSY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AMRm6BSY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQVN33fdxz3dTM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 02:09:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9bAjh018958;
	Mon, 15 Sep 2025 16:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7q/379
	l/XFqj7JrScjojX3o0l7vXy2VkyyKNtyMOR2w=; b=AMRm6BSYpv//ToIPwIQ2Xa
	Q7e8iLvZSoijOlKMpIvoG2xIohLKudNZbNT9nOpAtU4mIvC83JgsceFO/W3OEOd/
	kQyefSHJXEAigxg6kRO+B+O5QCMVr5NP7Eq9z6XJqworGYX5wCQevnpIa6PLFMOc
	v92PqCCaNdbnYID7lQ2cX/JOhGGOqKRQa+Z6GsiGLZCmH4oZW1GsRnFeJvQ/Z0Wr
	JlFJ+SKGGECxh67v5l1T/KSjr1m7Zbq+rdvIUkZo7QqV2LyTIJf1itJyOZsZHsmt
	F4vBCyIw+XK72Nolut9zg9JtEzQ0SjZCjVTJA76Fu2WuX7QN8NN1vWIBoV9TeLkw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat2383-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 16:09:12 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FFxOYM000563;
	Mon, 15 Sep 2025 16:09:12 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat2380-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 16:09:12 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFZJga022290;
	Mon, 15 Sep 2025 16:09:10 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kxpf9x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 16:09:10 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FG98QH7668426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 16:09:09 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAAAA5805D;
	Mon, 15 Sep 2025 16:09:08 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38A775805B;
	Mon, 15 Sep 2025 16:09:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.248.92])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Sep 2025 16:09:03 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V3 0/7] Add interface to expose vpa dtl counters via
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
Date: Mon, 15 Sep 2025 21:38:51 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D40E056-6194-40CD-BF72-B474A3ACDCAA@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c83a29 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=KOgC1EyPhNRFhsr3tjMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: REjqSJLVLzcTZw1hw55lgj6sqvlATeAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX6Wf9mlB5b2Ib
 7nwDTTrJmhFsn+2D7P2FfhLNdti+7VOBTdGeNoVzN34xtqNRBh91nXh/2jWX/y5dNlPcHBWqtMY
 IwJ0itWYsXSnZf1wRcsI9W/VW0HNsTcMDcqG+pUuG757WTJD7qTBh/q+b00cyYAjdS6ftor3PGi
 7VlQeTpYD6DlKQ3F8OulAHXmYouE9tusW0DO9YP5IEGL3dN43f1SO0E6C83RGTUs1ojFh8bmqNg
 YKOqjDDtSxvXITFQdoAAAKhiqV7cPtmMFQuiun0qjVRJAjvlM6EFMvuIlskJ3iy0lRLDuPuEhtV
 pPGjW9UXJgzipUjO2x3MwLdZtZ/UEcZKf4SM3mwSOstI4ezmfWXK9twefm75HsSX0ON1iE4Z3vT
 DqjTCltk
X-Proofpoint-ORIG-GUID: RWNxhKj6AUdhzKwk-R--aO4bdr-HL16r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 3:59=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>=20
> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
>=20
> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>  trace in perf.data. And patch 7 has documentation update.
>=20
> Infrastructure used
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The =
timer
> nterval can be provided by user via sample_period field in nano =
seconds.
> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL =
(Dispatch
> Trace Log) contains information about dispatch/preempt, enqueue time =
etc.
> We directly copy the DTL buffer data as part of auxiliary buffer and =
it
> will be processed later. This will avoid time taken to create samples
> in the kernel space. The PMU driver collecting Dispatch Trace Log =
(DTL)
> entries makes use of AUX support in perf infrastructure. On the tools =
side,
> this data is made available as PERF_RECORD_AUXTRACE records.
>=20
> To corelate each DTL entry with other events across CPU's, an =
auxtrace_queue
> is created for each CPU. Each auxtrace queue has a array/list of =
auxtrace buffers.
> All auxtrace queues is maintained in auxtrace heap. The queues are =
sorted
> based on timestamp. When the different PERF_RECORD_XX records are =
processed,
> compare the timestamp of perf record with timestamp of top element in =
the
> auxtrace heap so that DTL events can be co-related with other events
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record. Sometimes it could =
happen that
> one buffer is only partially processed. if the timestamp of occurrence =
of
> another event is more than currently processed element in the queue, =
it will
> move on to next perf record. So keep track of position of buffer to =
continue
> processing next time. Update the timestamp of the auxtrace heap with =
the timestamp
> of last processed entry from the auxtrace buffer.
>=20
> This infrastructure ensures dispatch trace log entries can be =
corelated
> and presented along with other events like sched.
>=20
> With the kernel changes;
>=20
>  # ls /sys/devices/vpa_dtl/
>  events  format  perf_event_mux_interval_ms  power  subsystem  type  =
uevent
>=20
> Thanks
> Athira
>=20
> Aboorva Devarajan (1):
>  powerpc/time: Expose boot_tb via accessor
>=20
> Athira Rajeev (4):
>  powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for
>    capturing DTL data
>  powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
>  powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake
>    up is needed
>  powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log =
PMU
>=20
> Kajol Jain (2):
>  powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
>  docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs
>    event format entries for vpa_dtl pmu
>=20
> .../sysfs-bus-event_source-devices-vpa-dtl    |  25 +
> Documentation/arch/powerpc/index.rst          |   1 +
> Documentation/arch/powerpc/vpa-dtl.rst        | 156 +++++
> arch/powerpc/include/asm/time.h               |   4 +
> arch/powerpc/kernel/time.c                    |   8 +-
> arch/powerpc/perf/Makefile                    |   2 +-
> arch/powerpc/perf/vpa-dtl.c                   | 596 ++++++++++++++++++
> 7 files changed, 790 insertions(+), 2 deletions(-)
> create mode 100644 =
Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
> create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
> create mode 100644 arch/powerpc/perf/vpa-dtl.c
>=20
> --=20
> 2.47.1
>=20


Tested this patch set by applying on top of today=E2=80=99s mainline =
kernel and its working as expected.

Please add below tag for the patch set.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

