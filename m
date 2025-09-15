Return-Path: <linuxppc-dev+bounces-12220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA7B57B45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 14:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQPhT3LJDz3dVZ;
	Mon, 15 Sep 2025 22:38:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757939897;
	cv=none; b=dDHiOWqkcNxps1tLA858Eep8QxR2+rvlBpytGXn2VPoi+QhqahfoVe959AYwJ7E2+5lALll/lP68UX93mkHRe09DE6FmJEBURsLrXZONweO9Xjev58hR01/oOB12b7s5s6bXCbcpzgBBKnP0Gl/7ZktBsO+226qUjn4ssOmCmwqxkY3V8skr+xXq7UfKK0QTDrX2W0I7YLRJDpmY53nk7/2wR51bzMteNUZ66D1v4k8kKD5upF/RraGxnKC8h0xnA0YEWmYVDfKJ7qPaowJUXAIuuf8lu1HV0tg8lWl1WrzjuxpZ1YPDnKHCigcqbmR03w7OEa3djv+rsRVhtebeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757939897; c=relaxed/relaxed;
	bh=K7dMnAH4x4Yhlo74YTmg5SL9Xd+kCNTuCCyRN7MR+0Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Cz2mE+SMuca+nPTxGTvl4l0g54zXVuTzkPL13J6SbFdMTFsm4nb0BdQaGKl+tmqGFd1dWKLQuei9fUYZMnnleh6rfJj/dy8nF5N0fEp49aJWumHuvgFlO4aSTCx47nPxHBHHwcqYX0JOH0iKDcrQnL72Nw1s/HRGbKq+M8T515WN0DGfkIbPcECzsZWxT8fd1LhA6NH4vFuaFD/AH9vSvaFMTXaywgMQ/jgHZ46YoguoVNWeySO3G+5YCv7hyDCi1Pr2TfndmxFN+5NTnowAf9A6cne2UrmmWegrYBIq8KCjAQQz4nZFJ9GT4KIX+rZwdQqrE3yOh6sWKOAhn4OY1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWoDC8Yx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWoDC8Yx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQPhS1mSCz3dS6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 22:38:15 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3PFLD023043;
	Mon, 15 Sep 2025 12:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K7dMnA
	H4x4Yhlo74YTmg5SL9Xd+kCNTuCCyRN7MR+0Q=; b=GWoDC8YxdBT3tJu6iz5kuC
	OUPWfKjJp0lI76X+HkKd/NVO70U7R6liuX/pOeeofoRYwzdL+kQ90RwjInv+PKoQ
	0cHuevFCsEvSHPnQDy31zpLKsiCdDjqkrcGYYKVE/N3HKv/cxjjJs5eazc8s46qd
	0ZFwWpHpPky8d7TOOnVHzcLLdmlQXs0hzSR9ODHV3eIzFl3dCs9e0d2hckcLL5bP
	szGBE904MGz9EpoKo98r70Ba4IsY9pMbzAh+L0wioaCfZEETQBwJFXNy0I6Xcd+c
	2mJGxbSQYeCKF42amgLKqu1MDJAK0kFmeGTjlFWuPkKV7OVHpf/2N3h2A0Sp2daQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnjhh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 12:38:09 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FCc8CL010593;
	Mon, 15 Sep 2025 12:38:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnjhh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 12:38:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FAkJgl029514;
	Mon, 15 Sep 2025 12:38:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0pkpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 12:38:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FCc3ZJ48824716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 12:38:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 536F62004D;
	Mon, 15 Sep 2025 12:38:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5587C20043;
	Mon, 15 Sep 2025 12:37:57 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Sep 2025 12:37:56 +0000 (GMT)
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
In-Reply-To: <bc6c17d2-298b-4629-9de1-dcecc3aac58f@csgroup.eu>
Date: Mon, 15 Sep 2025 18:07:43 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <828878DA-D6F8-407F-9386-91A097E29364@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
 <bc6c17d2-298b-4629-9de1-dcecc3aac58f@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vp_wXhLiJM-r90d7yGRHn8yrRtMJ46Oc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX9w40CkoSd/Ry
 jqR2mhc9XUhmWnRQmBU/UnkcgCXhS94QoPVhcIaxAVX6/NZdcoeMNqZYyU7DZrkSbjKcUX4aNWR
 i6HtSdau0aZF8YEr3ZckaX2p0sqKIRpgWa0iG5ObtAOq6DRtuoNgj8gcbeGOIfW4jKbLOCJtLnc
 HWJHr6UX9IRaOlwfAAHoY5A/aB/AtpKbadfZEiaOWa5g6/+nQD6lf2NO3V7SGRG+Cysl3KRqiKS
 3L997fiJ4WFRiroctrh9aYDQrMw91q/mFX/YsKvj7SrDWYWrhm2/bmIVYOZpR0/UHbKZ6ZcQZbz
 6urnTZ344d5oY/XClL8bCEJFhdPibb9FlxeIYQDvgEUElJcqgij7f/t1902kPKwIlTGncm7Zt2n
 bM4HdpCN
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c808b1 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=1UX6Do5GAAAA:8
 a=B8brMVGyltVLplSz2e4A:9 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-GUID: hsxIIBvPwZBcF-bzUf4CSBfov4mnB3qF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 Sep 2025, at 4:08=E2=80=AFPM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 15/09/2025 =C3=A0 12:29, Athira Rajeev a =C3=A9crit :
>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>> retrieve a log of dispatch and preempt events from the hypervisor
>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>> user can retrieve when and why each dispatch & preempt has occurred.
>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>> via perf.
>> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>>   trace in perf.data. And patch 7 has documentation update.
>> Infrastructure used
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
>> This infrastructure ensures dispatch trace log entries can be =
corelated
>> and presented along with other events like sched.
>> With the kernel changes;
>>   # ls /sys/devices/vpa_dtl/
>>   events  format  perf_event_mux_interval_ms  power  subsystem  type  =
uevent
>> Thanks
>> Athira
>=20
> What is the difference between this version of the series and the V2 =
sent 3 hours ago ?
Hi Christophe,

Change is in Patch 7 for Documentation, where build warning for =E2=80=9Cm=
ake htmldocs=E2=80=9D is handled.

I added in changelog here as part of patch 7:
=
https://lore.kernel.org/linux-perf-users/bc6c17d2-298b-4629-9de1-dcecc3aac=
58f@csgroup.eu/T/#m7fb311c8b56c71e7077f3f7e790805dab11b548a

There is no changes in other patches.
Sorry, I should have added that here in cover letter too along with =
having in patch 7.

Thanks
Athira

>=20
> Christophe



