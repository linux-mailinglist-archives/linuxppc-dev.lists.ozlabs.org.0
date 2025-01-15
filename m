Return-Path: <linuxppc-dev+bounces-5291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B7A1245C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 14:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY5mw4Knsz307K;
	Thu, 16 Jan 2025 00:04:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736946272;
	cv=none; b=JmJM5K8HKanIZPD+Cy4mSwB/7RhyQ+OZHoUjpplzVSwbh3GcTg5C7bup0/jfhNfj2HXSDAEs64ESqxPM57yGyOcqFW+yyCDrZYzz37wtU6nrzgPLA4Jorqe/rEycBiHl/Kxv7tC8lH/Gc/L7n6ifBTU3w8yfy3gNALf4uG4GuNO+7c7PBO8+2QE0xaBJIjuNQ3Qo2CuJa5TW5USYvk+NLdS4rxfxoBWl6LwlNfwb2Y0k68hxTojJuBAbrsS6ofsclKwS136JdzT7vpy/CxoQY4VMhH3LrjZdj36sBIMurrmLNPxIIZY8icobZDgW0E7vPOnRvzFd7gBj2bk8mvUmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736946272; c=relaxed/relaxed;
	bh=cTO+4bO2FTgoqSx5b20mgeevsh2AE9q9eFw6Yvn5Yrc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LnszC/ARvVULJAD2aEpt0xbSAmSR6qFRhlbciclb94dB51f03RGhqyAAIc5HbgdbhGAOaROUC7Jyn3YK3Le92HEBw4d5p9b8rrugu7aYw2czIxVV7PbBOPz/Gg0Y7wDfBws0LJ/Yiaww59pRCKKGnIAfBBYJ3vS6YF7KxAGFymLlgbDzTW/sKwCs/Glssg+HieYM0l+67Pwz1OTTWjR7sx2rPYhbHW4Lk1Xu3hNF5ScYtIUh9C530EvaXveQCPFAF0JLGC8OZqT4HmLYbLBcu8NOzeKCxP4SMVZFZVVkb4Jsu+jBe2p2JbSs+m/6FEi+RZJFGrKdpCzIDB3oYDEYPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJxyt5/3; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJxyt5/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY5mv4xJ7z305n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 00:04:31 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F3rJNN019928;
	Wed, 15 Jan 2025 13:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cTO+4b
	O2FTgoqSx5b20mgeevsh2AE9q9eFw6Yvn5Yrc=; b=kJxyt5/3nc+JPDXx6MG8/A
	uGLg6N1z3BkkcZkra9HWThp0OzXXqFQJos8ta7M4IjpONMwSHVnYNOmyUBpdcXuC
	lQlYf7wvSRRCqOwDOnNgHM+eKgvPSa0DOBWXosZPF/SBFicrDti8kj4sWz1E4wAi
	B4D+x3qawiM6WnBb54LvEmEEM2fttNdwb/c1pWI6YT71LkcOiHxIPCd7wR2aVa6U
	4Pukaf8OmgRRIYF7ZE2uiYQ9GDeoXBHtYgsAny2jW8v0w66Q5GFIl+19bW+RXgXk
	00uuU738124k/XqrYPa7rGsOThSovDPffi4BNSKh6ezNKzuwfIggVlLK7Lnd3QFg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjt60p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 13:04:24 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50FCqr0L019490;
	Wed, 15 Jan 2025 13:04:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjt60j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 13:04:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50F9mvC4002738;
	Wed, 15 Jan 2025 13:04:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443by8ff4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 13:04:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FD4IgX49349052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 13:04:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E84320040;
	Wed, 15 Jan 2025 13:04:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3275520049;
	Wed, 15 Jan 2025 13:04:13 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.232])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 15 Jan 2025 13:04:12 +0000 (GMT)
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
Subject: Re: [PATCH V2] tools/perf/builtin-lock: Fix return code for functions
 in __cmd_contention
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z4WQ6IO1euKOMIHN@google.com>
Date: Wed, 15 Jan 2025 18:33:58 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B7C2224-EB83-427E-987F-58997BA03CD2@linux.vnet.ibm.com>
References: <20250110093730.93610-1-atrajeev@linux.vnet.ibm.com>
 <Z4WQ6IO1euKOMIHN@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SFsGXvn1re3ijClSK7-xgGe1mYWmsiIR
X-Proofpoint-GUID: Kq0FW7B2nVKZxA2I88He8sDoQVxX7_mA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150099
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 14 Jan 2025, at 3:47=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Fri, Jan 10, 2025 at 03:07:30PM +0530, Athira Rajeev wrote:
>> perf lock contention returns zero exit value even if the lock =
contention
>> BPF setup failed.
>>=20
>>  # ./perf lock con -b true
>>  libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>>  libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>>  libbpf: failed to find valid kernel BTF
>>  libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>>  libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>>  libbpf: failed to find valid kernel BTF
>>  libbpf: Error loading vmlinux BTF: -ESRCH
>>  libbpf: failed to load object 'lock_contention_bpf'
>>  libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
>>  Failed to load lock-contention BPF skeleton
>>  lock contention BPF setup failed
>>  # echo $?
>>   0
>>=20
>> Fix this by saving the return code for lock_contention_prepare
>> so that command exits with proper return code. Similarly set the
>> return code properly for two other functions in builtin-lock, namely
>> setup_output_field() and select_key().
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>=20
> Thanks,
> Namhyung
Hi Namhyung,

Thanks for the reviewed-by=20

Athira

>=20
>> ---
>> Changelog:
>> v1 -> v2
>> Fixed return code in functions: setup_output_field()
>> and select_key() as pointed out by Namhyung.
>>=20
>> tools/perf/builtin-lock.c | 11 ++++++++---
>> 1 file changed, 8 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
>> index 208c482daa56..94a2bc15a2fa 100644
>> --- a/tools/perf/builtin-lock.c
>> +++ b/tools/perf/builtin-lock.c
>> @@ -2049,7 +2049,8 @@ static int __cmd_contention(int argc, const =
char **argv)
>> goto out_delete;
>> }
>>=20
>> - if (lock_contention_prepare(&con) < 0) {
>> + err =3D lock_contention_prepare(&con);
>> + if (err < 0) {
>> pr_err("lock contention BPF setup failed\n");
>> goto out_delete;
>> }
>> @@ -2070,10 +2071,14 @@ static int __cmd_contention(int argc, const =
char **argv)
>> }
>> }
>>=20
>> - if (setup_output_field(true, output_fields))
>> + err =3D setup_output_field(true, output_fields);
>> + if (err) {
>> + pr_err("Failed to setup output field\n");
>> goto out_delete;
>> + }
>>=20
>> - if (select_key(true))
>> + err =3D select_key(true);
>> + if (err)
>> goto out_delete;
>>=20
>> if (symbol_conf.field_sep) {
>> --=20
>> 2.43.5



