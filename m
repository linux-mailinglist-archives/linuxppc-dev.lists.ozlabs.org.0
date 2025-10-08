Return-Path: <linuxppc-dev+bounces-12705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775FBC38DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 09:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chPbn50Bvz3057;
	Wed,  8 Oct 2025 18:22:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759908165;
	cv=none; b=M+T2z/mCIhmrH7EGJJiRKXGKJIpw+/kb/neKOQjWecmKHD6XXn0uHQu5pGw8JEWlV0CyrsRBICjRQyeYWNA6YgiPRV+ageTOsdcb0iuxsJX5e4jV9Vbe/QJpeedaD7whnTYp5pDg5DaT335TemjZdEjcCgSvntwapElP1HRlO/1lPuS6U/YRtFc1oTlQqJrAckU4mZu9u5NRCMpUb4iWtn0h9pSaWLJF/Jjfu9QmLfNdfkZFXyL9rEXzCrustY456S5DrADIuTyPP1358BZH+4cEcmz9uAol2JPyzkpe7NeDzz+GIKE4z311kOmcTMwksRsvMpL2ojWxkVgTGDjToA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759908165; c=relaxed/relaxed;
	bh=tM2etT2F6ZXFLrUHU0AJCQN+DsaXtQFqJKPjwYrNzOQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UorOZUb0MvwdjMnkMdlt6O5ZVQSbq7e+rY93pke8xm84Mpa2IyNWqTodjntH5lbL51MjddC+cjf02/+eHlmX8MoA53WQs9tF5/Z/Xp/JxWD5m7nrtj/rEINXTwFBNE0LPwIiNBcslJyyy9XDkpErfYUZhxmGMvxAJ/btxVOyz2At2XPMeIRrHYclk1k3u5sUwkpF6oAQuk+41mX3UeamncY/fnIkQpD+bqnWuLkKC984RD/Pu/gXjopPd9n4zCic7YitLNr8t6JBgHtPiF6QyoGD620VkYppZvDSl7jTFlFzY1DTiPnA2sNp5zhD+9Ifj/h7sa+ouLHPr+VtidHzog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lfxuc5Lc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lfxuc5Lc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chPbm3DnSz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 18:22:44 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59865E4m024854;
	Wed, 8 Oct 2025 07:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tM2etT
	2F6ZXFLrUHU0AJCQN+DsaXtQFqJKPjwYrNzOQ=; b=Lfxuc5LcDJO4BZ3wz8M1J0
	Qt17TGdxxcihsR7vRifZhNuIAnrzSXdl9Orfsw/GJsocplH0Plzfj7/+IGHGdZd6
	YmpVzrR30FwD1q0fXkzM7KwifQuOlQUQVd40bosl+sXMS2oEt/1PGC0PxuyP/BwY
	U1LOpkhuQEsxXQ6iyze9nXYrXoSiKgG81o2xKwjBvI5EBycvzHhOMt1SmVSWaVEo
	QUrhKhy4b2iRT5TKDd6U2BtzChAvGHkuIwpMeF8jOxKnafSA6zacape5BCmjOn6l
	Qw08NMRntFtP2rVkvAajtilRGoM7fwuGwZWxDZRRY+ZN4IhzePqbk3kCrDQIfNVw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49js0sk7wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 07:22:35 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5987MZC5029599;
	Wed, 8 Oct 2025 07:22:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49js0sk7wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 07:22:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59854cLl001863;
	Wed, 8 Oct 2025 07:22:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49ke9y7gfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 07:22:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5987MUke58458548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 07:22:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A36B42004B;
	Wed,  8 Oct 2025 07:22:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FC4A20043;
	Wed,  8 Oct 2025 07:22:23 +0000 (GMT)
Received: from aboo.ibm.com (unknown [9.150.20.104])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 07:22:22 +0000 (GMT)
Message-ID: <415cc107c91616f2b6eade74a34be2f00ef32415.camel@linux.ibm.com>
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>, acme@kernel.org, jolsa@kernel.org,
        adrian.hunter@intel.com, maddy@linux.ibm.com, irogers@google.com,
        namhyung@kernel.org, linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Date: Wed, 08 Oct 2025 12:52:20 +0530
In-Reply-To: <20250916052536.93911-1-atrajeev@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e6113c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=eW1OOCEM0B6DWjgjGe0A:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: uPZ0Ij6upJWDTxFOxiCd4C3gjD1dkFUq
X-Proofpoint-ORIG-GUID: UAv0hJkzWj-UkxWEHxnxWgsu8z3v6Rzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDIwMSBTYWx0ZWRfX9AKVXNfKJr7F
 ew0C45bjAifF3VmHkyTUcC2mDmBm8ysb+DgI0xeivkXfXugHpHBSjrG9Cj+wQ/4o4hTX9vFv5A0
 vMopmmPY7mvLjrQl/TD23a9rHkCDuZTWKwQjBgy8vdlok3taOPLpGfJx+PJFiW8u8F6yoeQE523
 3/ms2xv7zq9qrzog0CeV2EjttmFqJkbATFruImOzfT2+Q7qZN616PGXr2yl1gpdRCDzp4n2/cOP
 hlmNsUc4+AVxvnn6SYRtyuCfY541jJ7FeFBcfZraIC1nfBeoXpfgfnnRBfXPGnk6U4WhEo90+B+
 ZCsh0smmkwYKdV4ptxGNIsTUIJqUdGqxwyr61J/yzFfFNIY1TUcIJ463YuiaJsesRHaMMOQPpQa
 xbBEIhb2oMVWiQZija4Af5rMskHd9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030201
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-09-16 at 10:55 +0530, Athira Rajeev wrote:
> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
>=20
> - Patch 1 to 6 is perf tools side code changes to enable perf
> =C2=A0 report/script on perf.data file
>=20
> Kernel and tools patches is separated. Kernel patches are posted here :
> V2: https://lore.kernel.org/linux-perf-users/20250915072224.98958-1-atraj=
eev@linux.ibm.com/T/#t
> V3: https://lore.kernel.org/linux-perf-users/2D40E056-6194-40CD-BF72-B474=
A3ACDCAA@linux.ibm.com/T/#t
>=20
> Infrastructure used
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The time=
r
> interval can be provided by user via sample_period field in nano seconds.
> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL (Dispatch
> Trace Log) contains information about dispatch/preempt, enqueue time etc.
> We directly copy the DTL buffer data as part of auxiliary buffer and it
> will be processed later. This will avoid time taken to create samples
> in the kernel space. The PMU driver collecting Dispatch Trace Log (DTL)
> entries makes use of AUX support in perf infrastructure. On the tools sid=
e,
> this data is made available as PERF_RECORD_AUXTRACE records.
>=20
> To corelate each DTL entry with other events across CPU's, an auxtrace_qu=
eue
> is created for each CPU. Each auxtrace queue has a array/list of auxtrace=
 buffers.
> All auxtrace queues is maintained in auxtrace heap. The queues are sorted
> based on timestamp. When the different PERF_RECORD_XX records are process=
ed,
> compare the timestamp of perf record with timestamp of top element in the
> auxtrace heap so that DTL events can be co-related with other events
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record. Sometimes it could happen=
 that
> one buffer is only partially processed. if the timestamp of occurrence of
> another event is more than currently processed element in the queue, it w=
ill
> move on to next perf record. So keep track of position of buffer to conti=
nue
> processing next time. Update the timestamp of the auxtrace heap with the =
timestamp
> of last processed entry from the auxtrace buffer.
>=20
> This infrastructure ensures dispatch trace log entries can be corelated
> and presented along with other events like sched.
>=20
> vpa-dtl PMU example usage
>=20
> =C2=A0 # ls /sys/devices/vpa_dtl/
> =C2=A0 events=C2=A0 format=C2=A0 perf_event_mux_interval_ms=C2=A0 power=
=C2=A0 subsystem=C2=A0 type=C2=A0 uevent
>=20
>=20
> To capture the DTL data using perf record:
>=20
> =C2=A0 # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep=
 1
>=20
> The result can be interpreted using perf report. Snippet of perf report -=
D:
>=20
> =C2=A0 # ./perf report -D
>=20
> There are different PERF_RECORD_XX records. In that records corresponding=
 to
> auxtrace buffers includes:
>=20
> 1. PERF_RECORD_AUX
> =C2=A0=C2=A0 Conveys that new data is available in AUX area
>=20
> 2. PERF_RECORD_AUXTRACE_INFO
> =C2=A0=C2=A0 Describes offset and size of auxtrace data in the buffers
>=20
> 3. PERF_RECORD_AUXTRACE
> =C2=A0=C2=A0 This is the record that defines the auxtrace data which here=
 in case of
> =C2=A0=C2=A0 vpa-dtl pmu is dispatch trace log data.
>=20
> Snippet from perf report -D showing the PERF_RECORD_AUXTRACE dump
>=20
> 0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690=C2=A0 offset: 0=C2=
=A0 ref: 0=C2=A0 idx: 0=C2=A0 tid: -1=C2=A0 cpu: 0
> .
> . ... VPA DTL PMU data: size 1680 bytes, entries is 35
> .=C2=A0 00000000: boot_tb: 21349649546353231, tb_freq: 512000000
> .=C2=A0 00000030: dispatch_reason:decrementer interrupt, preempt_reason:H=
_CEDE, enqueue_to_dispatch_time:7064, ready_to_enqueue_time:187, waiting_to=
_ready_time:6611773
> .=C2=A0 00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, e=
nqueue_to_dispatch_time:146, ready_to_enqueue_time:0, waiting_to_ready_time=
:15359437
> .=C2=A0 00000090: dispatch_reason:decrementer interrupt, preempt_reason:H=
_CEDE, enqueue_to_dispatch_time:4868, ready_to_enqueue_time:232, waiting_to=
_ready_time:5100709
> .=C2=A0 000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, e=
nqueue_to_dispatch_time:179, ready_to_enqueue_time:0, waiting_to_ready_time=
:30714243
> .=C2=A0 000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, e=
nqueue_to_dispatch_time:197, ready_to_enqueue_time:0, waiting_to_ready_time=
:15350648
> .=C2=A0 00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, e=
nqueue_to_dispatch_time:213, ready_to_enqueue_time:0, waiting_to_ready_time=
:15353446
> .=C2=A0 00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, e=
nqueue_to_dispatch_time:212, ready_to_enqueue_time:0, waiting_to_ready_time=
:15355126
> .=C2=A0 00000180: dispatch_reason:decrementer interrupt, preempt_reason:H=
_CEDE, enqueue_to_dispatch_time:6368, ready_to_enqueue_time:164, waiting_to=
_ready_time:5104665
>=20
> Above is representation of dtl entry of below format:
>=20
> struct dtl_entry {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dispatch_reason;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 preempt_reason;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16=C2=A0=C2=A0=C2=A0=C2=A0 pr=
ocessor_id;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0 en=
queue_to_dispatch_time;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0 re=
ady_to_enqueue_time;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0 wa=
iting_to_ready_time;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0 ti=
mebase;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0 fa=
ult_addr;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0 sr=
r0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0 sr=
r1;
> =C2=A0};
>=20
> First two fields represent the dispatch reason and preempt reason. The po=
st
> procecssing of PERF_RECORD_AUXTRACE records will translate to meaninful d=
ata
> for user to consume.
>=20
> Visualize the dispatch trace log entries with perf report:
> =C2=A0# ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep =
1
> =C2=A0 [ perf record: Woken up 1 times to write data ]
> =C2=A0 [ perf record: Captured and wrote 0.300 MB perf.data ]
>=20
> =C2=A0 # ./perf report
> =C2=A0 # Samples: 321=C2=A0 of event 'vpa-dtl'
> =C2=A0 # Event count (approx.): 321
> =C2=A0 #
> =C2=A0 # Children=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self=C2=A0 Command=C2=A0 =
Shared Object=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Symbol
> =C2=A0 # ........=C2=A0 ........=C2=A0 .......=C2=A0 .................=C2=
=A0 ..............................
> =C2=A0 #
> =C2=A0=C2=A0=C2=A0=C2=A0 100.00%=C2=A0=C2=A0 100.00%=C2=A0 swapper=C2=A0 =
[kernel.kallsyms]=C2=A0 [k] plpar_hcall_norets_notrace
>=20
> Visualize the dispatch trace log entries with perf script:
>=20
> =C2=A0=C2=A0 # ./perf script
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
=C2=A0=C2=A0 13322 [002]=C2=A0=C2=A0 233.835807:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sched:sched_switch: perf:13322 [120] R =3D=3D> migration=
/2:27 [0]
> =C2=A0=C2=A0=C2=A0=C2=A0 migration/2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27 [00=
2]=C2=A0=C2=A0 233.835811:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched:sched_migrate_task: comm=3Dperf =
pid=3D13322 prio=3D120 orig_cpu=3D2 dest_cpu=3D3
> =C2=A0=C2=A0=C2=A0=C2=A0 migration/2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27 [00=
2]=C2=A0=C2=A0 233.835818:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched:sched_stat_runtime: comm=3Dmigra=
tion/2 pid=3D27 runtime=3D9214 [ns]
> =C2=A0=C2=A0=C2=A0=C2=A0 migration/2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27 [00=
2]=C2=A0=C2=A0 233.835819:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc=
hed:sched_switch: migration/2:27 [0] S =3D=3D> swapper/2:0 [120]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swapper=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 [002]=C2=A0=C2=A0 233.835822:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vpa-dtl: timebase: 338954486062657 dispatch_reason:decremen=
ter_interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:435,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ready_to_enqueue_time:0, wait=
ing_to_ready_time:34775058, processor_id: 202 c0000000000f8094 plpar_hcall_=
norets_notrace+0x18 ([kernel.kallsyms])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swapper=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 [001]=C2=A0=C2=A0 233.835886:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doo=
rbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ready_to_enqueue_time:0, waiting_to_re=
ady_time:1245360, processor_id: 201 c0000000000f8094 plpar_hcall_norets_not=
race+0x18 ([kernel.kallsyms])
>=20
> Changelog is added for V3 in each individual patch
>=20
> Thanks
> Athira
>=20
> Athira Rajeev (6):
> =C2=A0 tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on power=
pc
> =C2=A0 tools/perf: process auxtrace events and display in perf report -D
> =C2=A0 tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to
> =C2=A0=C2=A0=C2=A0 present DTL samples
> =C2=A0 tools/perf: Allocate and setup aux buffer queue to help co-relate =
with
> =C2=A0=C2=A0=C2=A0 other events across CPU's
> =C2=A0 tools/perf: Process the DTL entries in queue and deliver samples
> =C2=A0 tools/perf: Enable perf script to present the DTL entries
>=20
> =C2=A0tools/perf/arch/powerpc/util/Build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A0tools/perf/arch/powerpc/util/auxtrace.c | 103 ++++
> =C2=A0tools/perf/builtin-script.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 +
> =C2=A0tools/perf/util/Build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0tools/perf/util/auxtrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0tools/perf/util/auxtrace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0tools/perf/util/event.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 +
> =C2=A0tools/perf/util/powerpc-vpadtl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 734 ++++++++++++++++++++++++
> =C2=A0tools/perf/util/powerpc-vpadtl.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 23 +
> =C2=A09 files changed, 917 insertions(+)
> =C2=A0create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
> =C2=A0create mode 100644 tools/perf/util/powerpc-vpadtl.c
> =C2=A0create mode 100644 tools/perf/util/powerpc-vpadtl.h



I tested this on top of commit 0d97f2067c166eb4 (latest upstream master ker=
nel) where the kernel side patches are already merged.

I added custom tracepoints to monitor CEDE hypercall events and also captur=
ed DTL CEDE events to check for interleaving when CEDE is triggered at spec=
ific intervals.

The events do interleave as expected (on Shared Logical Partition), and bas=
ic sanity checks confirm that it=E2=80=99s working as expected.


# ./perf script -i perf.data.cede
         swapper       0 [010]    67.270684: power:cpu_idle_cede_enter: cpu=
_id=3D10
          :32767   32767 [010]    67.270687:                   vpa-dtl: tim=
ebase: 4276378971776601 dispatch_reason:external_interrupt, preempt_reason:=
H_CEDE,
enqueue_to_dispatch_time:217, ready_to_enqueue_time:0,waiting_to_ready_time=
:3474, processor_id: 82 c0000000000eae44 plpar_hcall_norets_notrace+0x18 ([=
kernel.kallsyms])
         swapper       0 [010]    67.270710: power:cpu_idle_cede_enter: cpu=
_id=3D10
          :32767   32767 [010]    67.270711:                   vpa-dtl: tim=
ebase: 4276378971788639 dispatch_reason:external_interrupt, preempt_reason:=
H_CEDE,
enqueue_to_dispatch_time:251, ready_to_enqueue_time:0,waiting_to_ready_time=
:43890, processor_id: 82 c0000000000eae44 plpar_hcall_norets_notrace+0x18 (=
[kernel.kallsyms])
         swapper       0 [010]    67.270809: power:cpu_idle_cede_enter: cpu=
_id=3D10
          :32767   32767 [010]    67.270809:                   vpa-dtl: tim=
ebase: 4276378971839227 dispatch_reason:external_interrupt, preempt_reason:=
H_CEDE,
enqueue_to_dispatch_time:373, ready_to_enqueue_time:0,waiting_to_ready_time=
:45734, processor_id: 82 c0000000000eae44 plpar_hcall_norets_notrace+0x18 (=
[kernel.kallsyms])
         swapper       0 [010]    67.271012: power:cpu_idle_cede_enter: cpu=
_id=3D10
          :32767   32767 [010]    67.271013:                   vpa-dtl: tim=
ebase: 4276378971943394 dispatch_reason:external_interrupt, preempt_reason:=
H_CEDE,
enqueue_to_dispatch_time:380, ready_to_enqueue_time:0,waiting_to_ready_time=
:46433, processor_id: 82 c0000000000eae44 plpar_hcall_norets_notrace+0x18 (=
[kernel.kallsyms])
...

So for the entire series:

Tested-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

Thanks,
Aboorva

