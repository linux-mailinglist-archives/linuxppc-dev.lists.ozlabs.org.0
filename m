Return-Path: <linuxppc-dev+bounces-3028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E29C15F1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 06:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xl6jb14fPz2yY9;
	Fri,  8 Nov 2024 16:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731043267;
	cv=none; b=oZzpRweVIg0d5hdfZtaNrMoFVq0a0pDAT8iE7IizAtXUaZtGjtHvisfz52f/qsC3GPVnqHelEKt7hVAJvU8Hq1oeSJTezF9+Ae+884uLLfqJC5Z4ALfbJK8H81FW69QJOsj7HhxYl5YUnWbEMumXqWsBg8zm7+RyfB5od/+4jQD8MjC5l/Cd4Ml65RW1NAyGLZFZjxP0wwa1kouGMKiRhxFUFlgf7IRmmmrfjyHw8hRS8dnpVKrExTciTpyt36DSU1roZhJh6fMr1bnp56LciboVYApXoIynOXplzSWR62gcX+JVdBXYhWRsQbIQpGkxQetFqQFjyZXX+L6iLaHvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731043267; c=relaxed/relaxed;
	bh=26QWjgfJ4XOL74bqWE5qMUmsqsrVeED4dSu0V97QfMk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hzjsJeSIpvKzHj8Nd7L0UfC/Bw4IZeG1/8sQk8PHe6kyzVawR8T5LM3+4qiKn/VxGH5efcDdsTg4RN4JtgVJE5DMcY1OH54IyHrFTXbt3vBDI2af+B8iC6gWoRznjh3vp383MaLIY+sOt1G9DJ2L1XSCQHzy/jidMD8iijqaAfiCJscA6WDFMdykdWYs8RqOqo7DG4kilkMXeKsO4wqFw7GvNQNfC1Jrlkp1KT/RID/sSWqJ9K24bChZ+IQjBszgyqVWs4/5PoaKAOBRGlyRS53C/IXOb4mGCZZRtDAEP6YKt15R+I1BRdH6WCJcDEaGv2PeWzn3EIe2vgxlJV12Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IXbHob/D; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IXbHob/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xl6jT38yNz2xWS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 16:21:00 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A85AH7U027994;
	Fri, 8 Nov 2024 05:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=26QWjg
	fJ4XOL74bqWE5qMUmsqsrVeED4dSu0V97QfMk=; b=IXbHob/DUf9rDWMxPc+v16
	jIpO9AHMgX9qLCdzRfOVZKH6iGfq6VdnMTb/iGliW1IuR9wngax32b5n+xRBBJYA
	wBjOEmNCd4tGr4EdSo0DSDXHzn1Kt6FQemSieTLqhs2xHtTYxAYZL+pg+v4Vdf+3
	s5fgcJElHZ/GsTL0szlx8whtkqH+2zmM/CU+DS2wQpn6Op9cg9Nn9TQHz+vjh6lU
	LpaZF3Xu1wyg1VANZifOGZACw4SwlrkfP3IBvidiW1T0Vjpl0Apz005Xs4rT0OFm
	Xyl3IxVmvtfsoSiYDtJ8xXC96GmmQvZGZ9IzXKeKjbGHP3G9zk0qor/IvKsNpYmw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sc8q0103-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:20:50 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A85KojG017473;
	Fri, 8 Nov 2024 05:20:50 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sc8q0100-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:20:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mk4ML019414;
	Fri, 8 Nov 2024 05:20:49 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj9fr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:20:49 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A85Kjal34800264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 05:20:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D4AE20043;
	Fri,  8 Nov 2024 05:20:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46B8220040;
	Fri,  8 Nov 2024 05:20:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.248.137])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  8 Nov 2024 05:20:38 +0000 (GMT)
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
Subject: Re: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test only
 for intel
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20241107135606.GA47850@e132581.arm.com>
Date: Fri, 8 Nov 2024 10:50:10 +0530
Cc: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        James Clark <james.clark@linaro.org>, tmricht@linux.ibm.com,
        acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F805B2F-35CC-4E0C-BD2F-84552C4C528E@linux.vnet.ibm.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com>
 <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
 <CAP-5=fXCYURva6Q8ktRVmnf2QCcsr-E3fPn327k0JRCw_9fn3A@mail.gmail.com>
 <BBF1A4DC-3BD9-4377-BE2F-CBEFE55F0497@linux.vnet.ibm.com>
 <20241107135606.GA47850@e132581.arm.com>
To: Leo Yan <leo.yan@arm.com>, Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QDYrddTO2FPcgt2vMam0pLapzNz5sSMQ
X-Proofpoint-GUID: cCNDyp1ll9m6XRiKDnQ44nedagpfl9Q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080043
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 7 Nov 2024, at 7:26=E2=80=AFPM, Leo Yan <leo.yan@arm.com> wrote:
>=20
> Hi Athira,
>=20
> On Wed, Nov 06, 2024 at 03:04:57PM +0530, Athira Rajeev wrote:
>=20
> [...]
>=20
>>> Hi Athira,
>>>=20
>>> sorry for the breakage and thank you for the detailed explanation. =
As
>>> the code will run on AMD I think your change will break that - . It =
is
>>> probably safest to keep the ".. else { .." for this case but guard =
it
>>> in the ifdef.
>>>=20
>>=20
>> Hi Ian
>>=20
>> Thanks for your comments. Does the below change looks good ?
>>=20
>> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
>> index e3aa9d4fcf3a..f5b2d96bb59b 100644
>> --- a/tools/perf/tests/expr.c
>> +++ b/tools/perf/tests/expr.c
>> @@ -74,14 +74,12 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
>>    double val, num_cpus_online, num_cpus, num_cores, num_dies, =
num_packages;
>>    int ret;
>>    struct expr_parse_ctx *ctx;
>> -    bool is_intel =3D false;
>>    char strcmp_cpuid_buf[256];
>>    struct perf_pmu *pmu =3D perf_pmus__find_core_pmu();
>>    char *cpuid =3D perf_pmu__getcpuid(pmu);
>>    char *escaped_cpuid1, *escaped_cpuid2;
>>=20
>>    TEST_ASSERT_VAL("get_cpuid", cpuid);
>> -    is_intel =3D strstr(cpuid, "Intel") !=3D NULL;
>>=20
>>    TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
>>=20
>> @@ -244,11 +242,13 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
>>    if (num_dies) // Some platforms do not have CPU die support, for =
example s390
>>        TEST_ASSERT_VAL("#num_dies >=3D #num_packages", num_dies >=3D =
num_packages);
>>=20
>> +#if defined(__i386__) && defined(__x86_64__)
>>    TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, =
"#system_tsc_freq") =3D=3D 0);
>> -    if (is_intel)
>> +    if (strstr(cpuid, "Intel") !=3D NULL)
>>        TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>>    else
>>        TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(val) =
=3D=3D FP_ZERO);
>> +#endif
>>=20
>>    /*
>>     * Source count returns the number of events aggregating in a =
leader
>=20
> I confirmed the change above fixes the failure on Arm64.
>=20
> Tested-by: Leo Yan <leo.yan@arm.com>
Thanks Leo Yan for testing.

Hi Ian,

If the change above looks good, I will post a V2 . Please share your =
review comments

Thanks
Athira


