Return-Path: <linuxppc-dev+bounces-5215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FAA10191
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 08:57:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXM0h29BZz301B;
	Tue, 14 Jan 2025 18:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736841428;
	cv=none; b=TgHe9D1+TgTBT1aWA2CUZRbRdySP4b7iBLz1KXWVxlRYUGNboBaptz8xY9M1OSzI/Gq2FmUCuzyNl8Q4Rbk2WOnzktLIm2Y1Vyn4F7ryvpTz0gksQNGa6kaVWiiGdHStSXkh0uKyEfXcg2mvDBIo7alTI+vvwXBQBJvlL9TWtFtz85uQBHCBmUDc0xgQZzaGtpfop+L298+Xs2w20fz60OTlzzREIOOtg8Nk63WEMVFmx/rdcXytpeKFD2+e2vslJvYJCaJTwBee+U5f0R22RLg6acM76BQ2jbe0gRCrrpEQ+pexbDgkGmwNaP0URL2ZJllVtMnZvZoVoGfAr+kuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736841428; c=relaxed/relaxed;
	bh=IdZZfV+w80aRSeDXrWFGAZdtyXJTjObyzk/Ryg7JS64=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CfhhemhvRyKwB8Aa6ihWBtyq+0sIlbSJv2K8vH2S+MbbTdethzS3LGob7FoFA/rBLtnvf+T5G8C5ZT0VpIdVslTgTnpxhVYNF4fI23NffXTMByPg2U271aGatqLxyKmXysjRXMsmYVYlawAq8qocfBeYv5b7OtmmLQ7Cu3NdEEB/zM8s6ml5oDwGmIEHTZovmJZV2xDoNQ8J5bxd8JoLxNtirSzM5H2yOl3ZnruXw8dbxrVPiDhdi0fyWLcBhh+KD74E2OrBVBA10srGZoSLsYhrofywZejrsNgJcpJBcZypljuse2MxFYc/0xt3nRGfZqzRctneby41wGCARBCZAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dwu96IDG; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dwu96IDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXM0f6PY6z2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 18:57:06 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHWENE000480;
	Tue, 14 Jan 2025 07:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IdZZfV
	+w80aRSeDXrWFGAZdtyXJTjObyzk/Ryg7JS64=; b=dwu96IDGUpvRmR/NxpAkaU
	T2OVXv26iXpQKFIOs+TaTZjGN8TLXqEytPGdBVDSxFGCYZEpTgAMavxmLvFAfsYY
	rSm/lFlUImiZjzCPRhxDhXvS8LK0MASkEuKstrF80OLITCelIFC4XSgaoHZrkJPf
	4BPEXboYPFzUcSwuVYiHfcgYgbcO+CefSj8TzBvomMZYhS3bEDyJzTRDXooQTU5v
	mptn+oeZhfLL+lb5872bB/Tj+9FXILyz9JGJpewMnc+Oq6x20ro5yRj9ZsQjep6y
	dSJUPaM1gxHvKlrjq4VhCW4xXcTf2egIIje7tdfG9RwxPVkb/76NO5ucahRmrNxw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444y12nak6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:56:53 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50E7sSZ0028908;
	Tue, 14 Jan 2025 07:56:52 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444y12nak5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:56:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50E3ZjJb004526;
	Tue, 14 Jan 2025 07:56:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442ysje1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:56:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50E7umvi32899710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 07:56:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F17220043;
	Tue, 14 Jan 2025 07:56:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6802620040;
	Tue, 14 Jan 2025 07:56:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.251.19])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 14 Jan 2025 07:56:42 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf: Fix segfault during perf record --off-cpu
 when debuginfo is not enabled
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z4UxQSAKoLskEILD@x1>
Date: Tue, 14 Jan 2025 13:26:29 +0530
Cc: Namhyung Kim <namhyung@kernel.org>, jolsa@kernel.org,
        adrian.hunter@intel.com, irogers@google.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <EECE94D2-B654-4F92-A558-22174F84D780@linux.vnet.ibm.com>
References: <20241223135813.8175-1-atrajeev@linux.vnet.ibm.com>
 <409D0233-93FF-40D6-BC2E-B7625E4E1B97@linux.vnet.ibm.com>
 <Z3xKTKkVSf7tWCtD@google.com> <Z4UxQSAKoLskEILD@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: seKjSW0JUsw_Upqsyf51QaQ1EIhOT9PS
X-Proofpoint-GUID: Gq0byDLv0pXDBQaSUz0S2WliTHuq-5LI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 13 Jan 2025, at 8:59=E2=80=AFPM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Mon, Jan 06, 2025 at 01:25:32PM -0800, Namhyung Kim wrote:
>> On Fri, Dec 27, 2024 at 04:18:32PM +0530, Athira Rajeev wrote:
>>>=20
>>>=20
>>>> On 23 Dec 2024, at 7:28=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>>=20
>>>> When kernel is built without debuginfo, running perf record with
>>>> --off-cpu results in segfault as below:
>>>>=20
>>>>  ./perf record --off-cpu -e dummy sleep 1
>>>>  libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>>>>  libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>>>>  libbpf: failed to find valid kernel BTF
>>>>  Segmentation fault (core dumped)
>>>>=20
>>>> The backtrace pointed to:
>>>>=20
>>>>  #0  0x00000000100fb17c in btf.type_cnt ()
>>>>  #1  0x00000000100fc1a8 in btf_find_by_name_kind ()
>>>>  #2  0x00000000100fc38c in btf.find_by_name_kind ()
>>>>  #3  0x00000000102ee3ac in off_cpu_prepare ()
>>>>  #4  0x000000001002f78c in cmd_record ()
>>>>  #5  0x00000000100aee78 in run_builtin ()
>>>>  #6  0x00000000100af3e4 in handle_internal_command ()
>>>>  #7  0x000000001001004c in main ()
>>>>=20
>>>> Code sequence is:
>>>>  static void check_sched_switch_args(void)
>>>>  {
>>>>       struct btf *btf =3D btf__load_vmlinux_btf();
>>>>       const struct btf_type *t1, *t2, *t3;
>>>>       u32 type_id;
>>>>=20
>>>>       type_id =3D btf__find_by_name_kind(btf, =
"btf_trace_sched_switch",
>>>>                                        BTF_KIND_TYPEDEF);
>>>>=20
>>>> btf__load_vmlinux_btf fails when CONFIG_DEBUG_INFO_BTF is not =
enabled.
>>>> Here bpf__find_by_name_kind calls btf__type_cnt with NULL btf
>>>> value and results in segfault. To fix this, add a check to see if
>>>> btf is not NULL before invoking bpf__find_by_name_kind
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>=20
>> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>=20
> Thanks, applied to perf-tools-next,
>=20
> - Arnaldo

Thanks Namhyung and Arnaldo=20

Athira.



