Return-Path: <linuxppc-dev+bounces-4963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49DA08937
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 08:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTttM3VnWz3cVS;
	Fri, 10 Jan 2025 18:43:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736494987;
	cv=none; b=d7jVI2MxjJjVuxdrivTEHPEqd7C5/MtoAdLQMWx5nqjqzC/ZyEYUAab8EgNsHAR2wX1pRWMLwuATWxt31C4TGrfP5x7r8ikfC3V+KKxTZmesWyDjhDYajGJS6BqfwaVey6yD1lG998i7pb5mrLqDhRqT9LAgKiTbUmpwrsh5j3ZusZCK2SyBU0EpaRhhSpRUysQtnCSGH/d+FwFL8C/sbuklPsjeVNzoiXhIuF53ec64C2yTPqa7cYmi+rurdO69XfIM3HntihZEwQl/qJirOAGRa/NmXb3wd2mkQyQB7dDuYSxYwtVZSReTdRorek6WpdeIrVN18XICL5ZCeyG2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736494987; c=relaxed/relaxed;
	bh=7Pg9Hf0VD6xs/EweUM7V5NCNy6H2ch3ICqCOENEVxWo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AZyIm6E54HvECpnH5HI80r+fNuzHEhLC1OclHBHENDM+ok2vT1jSQTI7NxMzxc6g02CugQRyLlVonTH7geDPVg6wcqR1aWP+qtbdQPoRnfAcZoG2cBfpv4hDg2SzzrNDJ4VK48R6xkWZlQPTl/RDSW6gUuOv1bXfypPon0pFtL9ZqyYB1bBAPNZqAqZJnBJnnlo2JuWxIleastl52Q7uPZUyyaZDnzcibJmodY0K6+zhhN3+hni+OBYXVzBk471Cbfwr5uulTibbr8z5egEUv4NHewuLHVKK8BvFAxuPu4U2s7Pmo3kAHsUnjCqRP/jmwl5saL3ot+qyGkwkYK7Rpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CJsgvR/+; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CJsgvR/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTttL27Ftz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 18:43:06 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A1xlhe009581;
	Fri, 10 Jan 2025 07:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7Pg9Hf
	0VD6xs/EweUM7V5NCNy6H2ch3ICqCOENEVxWo=; b=CJsgvR/+ywrBKwxSAH45qr
	4r/qKrI6mbUA4uTAiTTsBWmb2HkSXx9hQLAGV8I5zXJnz9DVKhFa/QbSsN3OuLmR
	Z5CrfjotiFbXKvDZR2Svw93k52FXVLf3sfvZpUF0U7KHgHvo31rnJoZDV1Pgaytk
	/0EY/5uLmil/oHtjLgSM4YJ9tyGs+uGRo8JdLbY3MOAFDfh6EZGnIpQyDPHLl5Sg
	3kHepFUonyu8miSePqQI/TMIDfoGaioH21gfriZzriXalzOTq++Pcc5dI0KlRmaf
	ayy0VbMfp/u9QPeWJIhe6TtoNiVQPmhIJ/mC2AF55u0aoswpqX8x3Sp8eQH+MayA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442fx5bp2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:42:59 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A7gw4Q007704;
	Fri, 10 Jan 2025 07:42:58 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442fx5bp2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:42:58 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A6WlY5027963;
	Fri, 10 Jan 2025 07:42:57 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhkgxck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:42:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A7gsJk17039636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 07:42:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3629A20040;
	Fri, 10 Jan 2025 07:42:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DB502004B;
	Fri, 10 Jan 2025 07:42:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jan 2025 07:42:48 +0000 (GMT)
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
In-Reply-To: <Z3xKTKkVSf7tWCtD@google.com>
Date: Fri, 10 Jan 2025 13:12:34 +0530
Cc: jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        hbathini@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2E04F8D-AC28-491A-ADC1-8C90DFC2CB9D@linux.vnet.ibm.com>
References: <20241223135813.8175-1-atrajeev@linux.vnet.ibm.com>
 <409D0233-93FF-40D6-BC2E-B7625E4E1B97@linux.vnet.ibm.com>
 <Z3xKTKkVSf7tWCtD@google.com>
To: Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i0emdf_TQ_gI4G83-7HuaLFU-RTj8OWB
X-Proofpoint-ORIG-GUID: IbIAa9nIwuFRptSY7kMa83NBU-4nUslp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 7 Jan 2025, at 2:55=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Fri, Dec 27, 2024 at 04:18:32PM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 23 Dec 2024, at 7:28=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> When kernel is built without debuginfo, running perf record with
>>> --off-cpu results in segfault as below:
>>>=20
>>>  ./perf record --off-cpu -e dummy sleep 1
>>>  libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>>>  libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>>>  libbpf: failed to find valid kernel BTF
>>>  Segmentation fault (core dumped)
>>>=20
>>> The backtrace pointed to:
>>>=20
>>>  #0  0x00000000100fb17c in btf.type_cnt ()
>>>  #1  0x00000000100fc1a8 in btf_find_by_name_kind ()
>>>  #2  0x00000000100fc38c in btf.find_by_name_kind ()
>>>  #3  0x00000000102ee3ac in off_cpu_prepare ()
>>>  #4  0x000000001002f78c in cmd_record ()
>>>  #5  0x00000000100aee78 in run_builtin ()
>>>  #6  0x00000000100af3e4 in handle_internal_command ()
>>>  #7  0x000000001001004c in main ()
>>>=20
>>> Code sequence is:
>>>  static void check_sched_switch_args(void)
>>>  {
>>>       struct btf *btf =3D btf__load_vmlinux_btf();
>>>       const struct btf_type *t1, *t2, *t3;
>>>       u32 type_id;
>>>=20
>>>       type_id =3D btf__find_by_name_kind(btf, =
"btf_trace_sched_switch",
>>>                                        BTF_KIND_TYPEDEF);
>>>=20
>>> btf__load_vmlinux_btf fails when CONFIG_DEBUG_INFO_BTF is not =
enabled.
>>> Here bpf__find_by_name_kind calls btf__type_cnt with NULL btf
>>> value and results in segfault. To fix this, add a check to see if
>>> btf is not NULL before invoking bpf__find_by_name_kind
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>=20
> Thanks,
> Namhyung
>=20

Thanks Namhyung for reviewing the patch

Athira
>>> ---
>>> tools/perf/util/bpf_off_cpu.c | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>=20
>>> diff --git a/tools/perf/util/bpf_off_cpu.c =
b/tools/perf/util/bpf_off_cpu.c
>>> index a590a8ac1f9d..4269b41d1771 100644
>>> --- a/tools/perf/util/bpf_off_cpu.c
>>> +++ b/tools/perf/util/bpf_off_cpu.c
>>> @@ -100,6 +100,11 @@ static void check_sched_switch_args(void)
>>> const struct btf_type *t1, *t2, *t3;
>>> u32 type_id;
>>>=20
>>> + if (!btf) {
>>> + pr_debug("Missing btf, check if CONFIG_DEBUG_INFO_BTF is =
enabled\n");
>>> + goto cleanup;
>>> + }
>>> +
>>=20
>> Hi,
>>=20
>> Looking for review comments on this
>>=20
>> Athira
>>> type_id =3D btf__find_by_name_kind(btf, "btf_trace_sched_switch",
>>> BTF_KIND_TYPEDEF);
>>> if ((s32)type_id < 0)
>>> --=20
>>> 2.43.5



