Return-Path: <linuxppc-dev+bounces-12362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE50B83250
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 08:30:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS5Nm4nrhz30Qk;
	Thu, 18 Sep 2025 16:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758177032;
	cv=none; b=fkQ7up6UfeRsrl2TOt4VvUeO5+PknNphhjdz3OvhLnY+xka3MjCMc9bERaz9T27iYkXfGdr28YGgrVyNOXWwCOeM9I7q431FOkoo452NIgDtAIP1XnCnPb7vH98JTEod99lg8KSxfQwuEQm98DJlejcT7Dp0z3Fejyop6IFDlfPPIokh7G12s7ek1ujKcU6ImiZH7VAQ4A1TA14fXi4Sb6v9lMlugajmZn8ld9YG6DXu+lMhZMCnnnYOZjKJUQBr34tQJUujOQazlnTja2A8FHUN12sft+ZWsPqsYNLBH6jrODru3bEC0vZbKMta78x2F2BVDKOTYDZA771qTJPe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758177032; c=relaxed/relaxed;
	bh=/GDH0dFuF+Rh5xuJqqRpr3KyBqkO9mmWWjRgh4Gyzrg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dY3EGqpzPujQynF4gyRhv1m2ksKxpxDkEpBRexN9ye9SQqIu/AEMF2r32BTZAn10pXT7lfRzuGmOaJD8Ste5kT8m2Bz/ZbZBQlD34IN8T5lAkemfc1azKFjxOJkYiYQubyutyilWR1U4UwDF4mej7Y8+f/TovAo43E5fNAPdQcioKST8X0hsjEeFr14um0JiDgpEPybVB5TvZYFlZ7rSkQFBNwea6SN5rFjZzZVsma7ZXGckN2uvq+vhfn89UXn1i7XP9JaeUvbVRRnNgitDORkgqsfmbAUttOIQp82KOvfyJlnyPBKx6b0yoAOydNR7cXiyKZF/4MH5wNPmOx1eyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X5S8l5QE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X5S8l5QE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS5Nl6j8rz3000
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 16:30:31 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HIdQjh027388;
	Thu, 18 Sep 2025 06:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/GDH0d
	FuF+Rh5xuJqqRpr3KyBqkO9mmWWjRgh4Gyzrg=; b=X5S8l5QEPBjLOQ5eCcBeXU
	56XxGlO7cAsI6RoTK1evVV5oSHIh3tlYcmAFK1KLUi9W3q59g3X9qMOVMxyQ9juO
	Lc/LX3ysIXypyxnSVji8fTtXH67JUwXZz+LcmGYvHiJK7p4a4ERlRSsAzrfjKOcj
	VRI/O9huX87zcNEKuzXaVwoR1i4oIxceXrwKERS3Qgd6HNjvbRVtxMK/EopiLkKd
	l+/CP4N7I1ptLFf1mnSm+uyezGpSzIGuhxtA0MRInziX8zysfgeD+rn5w/W7lsA6
	68Ep97VcUdbPHvZqmc9q5NK9kAVJtRgafNSg6V/3mPZE5SnEGX2Ih8XA5O9hlaEA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4p8dy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:30:25 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58I6Qc9Y008123;
	Thu, 18 Sep 2025 06:30:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4p8dy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:30:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2Fdaq018637;
	Thu, 18 Sep 2025 06:30:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 495n5mn2dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:30:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58I6UKwj42270976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 06:30:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F8B82004B;
	Thu, 18 Sep 2025 06:30:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB04620040;
	Thu, 18 Sep 2025 06:30:13 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.196])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 18 Sep 2025 06:30:13 +0000 (GMT)
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
Subject: Re: [PATCH V3 0/7] Add interface to expose vpa dtl counters via
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <320a93c0-befb-49df-98b4-b10906c3148d@linux.ibm.com>
Date: Thu, 18 Sep 2025 12:00:02 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <892B7EAF-88C0-490F-A7C8-55F58B637BC0@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
 <320a93c0-befb-49df-98b4-b10906c3148d@linux.ibm.com>
To: tejas05 <tejas05@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfXwA0DarYQ9kk0
 O8ARy4nVccUa95gR8JZNWT4fZYhEBZG+wsXNiSR11/KuJIPWpbfWAMqAjsF14pInSPvMxMXucrz
 tko9tNL4CT24W2+kbyC7LxIB/g2IuqoRoBrDYtKLKjpDTlptPZ4my8InBwqVU3vQ7x0sQckEoPe
 svanzW+8oHkEhXgkteAu5U/b4SHS2SaBQSzlq/xZjEGWDap28pgHiqsYGkTt1hNJ48Zanfr/jbf
 0BYkJsUz6/dCspmjQ4NVYvDY7OP7IEi0WFLPpnbArSsStoJcRh6pj1weJKBofgjt5Ch9/6y6Hyt
 prxaHWcN2ujmt/FHYD+m2hREt8NNAAbq89LBzYrCIHWBSGLOmOfLTlFRb2MWXTFHKZ80SfPET6b
 b4Xe3H4J
X-Proofpoint-ORIG-GUID: FRadiWHeuei82X5xzindgNS3D4hux8nu
X-Proofpoint-GUID: _C0_o6vyvMkYH8NqB9nIrZxfrCE_Rptu
X-Authority-Analysis: v=2.4 cv=cNzgskeN c=1 sm=1 tr=0 ts=68cba701 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=zFa0JVAUQ_1k7wuH2rUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160204
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 17 Sep 2025, at 2:29=E2=80=AFPM, tejas05 <tejas05@linux.ibm.com> =
wrote:
>=20
>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>> retrieve a log of dispatch and preempt events from the hypervisor
>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>> user can retrieve when and why each dispatch & preempt has occurred.
>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>> via perf.
>>=20
>> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>>   trace in perf.data. And patch 7 has documentation update.
>>=20
>> Infrastructure used
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> The VPA DTL PMU counters do not interrupt on overflow or generate any
>> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The =
timer
>> nterval can be provided by user via sample_period field in nano =
seconds.
>> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL =
(Dispatch
>> Trace Log) contains information about dispatch/preempt, enqueue time =
etc.
>> We directly copy the DTL buffer data as part of auxiliary buffer and =
it
>> will be processed later. This will avoid time taken to create samples
>> in the kernel space. The PMU driver collecting Dispatch Trace Log =
(DTL)
>> entries makes use of AUX support in perf infrastructure. On the tools =
side,
>> this data is made available as PERF_RECORD_AUXTRACE records.
>>=20
>> To corelate each DTL entry with other events across CPU's, an =
auxtrace_queue
>> is created for each CPU. Each auxtrace queue has a array/list of =
auxtrace buffers.
>> All auxtrace queues is maintained in auxtrace heap. The queues are =
sorted
>> based on timestamp. When the different PERF_RECORD_XX records are =
processed,
>> compare the timestamp of perf record with timestamp of top element in =
the
>> auxtrace heap so that DTL events can be co-related with other events
>> Process the auxtrace queue if the timestamp of element from heap is
>> lower than timestamp from entry in perf record. Sometimes it could =
happen that
>> one buffer is only partially processed. if the timestamp of =
occurrence of
>> another event is more than currently processed element in the queue, =
it will
>> move on to next perf record. So keep track of position of buffer to =
continue
>> processing next time. Update the timestamp of the auxtrace heap with =
the timestamp
>> of last processed entry from the auxtrace buffer.
>>=20
>> This infrastructure ensures dispatch trace log entries can be =
corelated
>> and presented along with other events like sched.
>>=20
>> With the kernel changes;
>>=20
>>   # ls /sys/devices/vpa_dtl/
>>   events  format  perf_event_mux_interval_ms  power  subsystem  type  =
uevent
>>=20
>> Thanks
>> Athira
>>=20
>> Aboorva Devarajan (1):
>>   powerpc/time: Expose boot_tb via accessor
>>=20
>> Athira Rajeev (4):
>>   powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for
>>     capturing DTL data
>>   powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
>>   powerpc/perf/vpa-dtl: Handle the writing of perf record when aux =
wake
>>     up is needed
>>   powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log =
PMU
>>=20
>> Kajol Jain (2):
>>   powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
>>   docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs
>>     event format entries for vpa_dtl pmu
>>=20
>>  .../sysfs-bus-event_source-devices-vpa-dtl    |  25 +
>>  Documentation/arch/powerpc/index.rst          |   1 +
>>  Documentation/arch/powerpc/vpa-dtl.rst        | 156 +++++
>>  arch/powerpc/include/asm/time.h               |   4 +
>>  arch/powerpc/kernel/time.c                    |   8 +-
>>  arch/powerpc/perf/Makefile                    |   2 +-
>>  arch/powerpc/perf/vpa-dtl.c                   | 596 =
++++++++++++++++++
>>  7 files changed, 790 insertions(+), 2 deletions(-)
>>  create mode 100644 =
Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
>>  create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
>>  create mode 100644 arch/powerpc/perf/vpa-dtl.c
>>=20
> Hi Athira,
>=20
> I have tested the above patchset on the mainline kernel [ 6.17.0-rc6], =
it is working fine. The vpa-dtl pmu is recognizable and the perf record =
report works as expected. Please add the tag below, for the entire =
series.
>=20
> Tested-by: Tejas Manhas <tejas05@linux.ibm.com>
>=20
> Thanks & Regards,
>=20
> Tejas
Thanks Tejas and Venkat for testing the patch series

Athira



