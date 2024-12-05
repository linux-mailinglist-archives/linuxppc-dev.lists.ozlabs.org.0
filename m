Return-Path: <linuxppc-dev+bounces-3827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 729189E5C77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y410J0n37z2yft;
	Fri,  6 Dec 2024 04:02:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733418144;
	cv=none; b=Oq/RT2WxyQssCxTkfwR0D+GBldmMruhNHOkekfQlPzBW1BvZWE6u0bBbLQis2OcbG86TXj3ILZy7MAEi4xAznRBxYjd3U7NcFxopjA96zk4HwQ2TStDWshp5/s+XAReoR5GqTIfIcP8iHa0h6jC2AD+08ydYqnVGJceUa+2t7RiUjZjo91HkL//dnPP7A3cg7qpQyRZ3jcKqTuV8ZGcdkBEk/A7lboS6wxifxkg8pW7BQ5NQcbn06gz+RNtTi2pT9m6MBZ8kSRzI1imuf3HWvpkl9Qf18je/8dlUhhqGzc64W2te4o0z6EbMZF6BuNSrV++hMcC80OaHxTQrdxambw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733418144; c=relaxed/relaxed;
	bh=frwONDkJLaxJoiI+osa63+rM+Vm6eJIPVZMFYHSznsQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LvmMv3yJNtGhS1mIS5aBBzjXp8P7bsivvobImCDsMdS0HtPiWuVhfz2INVUG2w6Yq6WxsfD/BCxnGYu0u+4BDiBv6/XX367GdvXvIbPx1gP7Gih/W7nI0SQJHawjHvle4Ll6R17FH4RZ/3iQGD8phLeX6AxhZR7K79MEaPJgJhArr4OShGh9mL7ygd/LkC1Py6kfpPLeslLkC0gAgSeH+Ti4gI642qXd+qAyXsJTXPifsIa4/nT805QuC7mMBhdEz/hAoprRNb4zd6C2NwR/NJK6bWcV6D9vE9Y4qkr5qhCh9yx3CcMGJNVOLjYG6WynA0h+fH8ln01el1XD4+IRTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rcYpE6Nt; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rcYpE6Nt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y410G1dKXz2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:02:21 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5A0vwr028244;
	Thu, 5 Dec 2024 17:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=frwOND
	kJLaxJoiI+osa63+rM+Vm6eJIPVZMFYHSznsQ=; b=rcYpE6NtuYVqbRbg3BYLVN
	9GNCawW+KjSPKK98WXpn/HsH33zoc03NmpjFcHDv0L7EecyfiMMP7yz7jF7pGffn
	Xniw4abELS3pUJj5FCUlVNpQBCDoJ78/JnAI1+ya0mDeaq4JDv/jOdUYlW/d2bq+
	o4o8zMND+gOZHmccSnRFlegC/8nmmil7Ddk8gebldEaGygEUDDzjyZ5cE8f6raNI
	wLybcPtsF94vBguQaVwc7OZbQUbCrull2Z+Xbhvna1uMqoTu6U4pXeqzTMuifbkv
	2n8kFTn1MIMiRP2b0HIUY0uLdoSS+5MrNpnH+swQpc/ByVgeXNQl9VqMhLBSnZKQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ba1yj2e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:02:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5GqN07009734;
	Thu, 5 Dec 2024 17:02:12 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ba1yj2e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:02:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EiLad005580;
	Thu, 5 Dec 2024 17:02:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43a2kxsg9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:02:11 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5H27Dm50594132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 17:02:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 911B220043;
	Thu,  5 Dec 2024 17:02:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A63820040;
	Thu,  5 Dec 2024 17:02:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.236])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Dec 2024 17:02:01 +0000 (GMT)
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
In-Reply-To: <Z09K5orKhWbeOGLV@google.com>
Date: Thu, 5 Dec 2024 22:30:32 +0530
Cc: Leo Yan <leo.yan@arm.com>, Ian Rogers <irogers@google.com>,
        James Clark <james.clark@linaro.org>, tmricht@linux.ibm.com,
        acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6BF58F8-99C2-40A4-8500-AF2E3CEB7308@linux.vnet.ibm.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com>
 <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
 <CAP-5=fXCYURva6Q8ktRVmnf2QCcsr-E3fPn327k0JRCw_9fn3A@mail.gmail.com>
 <BBF1A4DC-3BD9-4377-BE2F-CBEFE55F0497@linux.vnet.ibm.com>
 <20241107135606.GA47850@e132581.arm.com>
 <0F805B2F-35CC-4E0C-BD2F-84552C4C528E@linux.vnet.ibm.com>
 <Z09K5orKhWbeOGLV@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: txM6-swvmW2dZw1Ge5xgj3n6iE9Yw4CM
X-Proofpoint-GUID: x75Afcoi4ov0SpggGGPeU_2wYBKCSNqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050124
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 3 Dec 2024, at 11:46=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> Hello,
>=20
> On Fri, Nov 08, 2024 at 10:50:10AM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 7 Nov 2024, at 7:26=E2=80=AFPM, Leo Yan <leo.yan@arm.com> wrote:
>>>=20
>>> Hi Athira,
>>>=20
>>> On Wed, Nov 06, 2024 at 03:04:57PM +0530, Athira Rajeev wrote:
>>>=20
>>> [...]
>>>=20
>>>>> Hi Athira,
>>>>>=20
>>>>> sorry for the breakage and thank you for the detailed explanation. =
As
>>>>> the code will run on AMD I think your change will break that - . =
It is
>>>>> probably safest to keep the ".. else { .." for this case but guard =
it
>>>>> in the ifdef.
>>>>>=20
>>>>=20
>>>> Hi Ian
>>>>=20
>>>> Thanks for your comments. Does the below change looks good ?
>>>>=20
>>>> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
>>>> index e3aa9d4fcf3a..f5b2d96bb59b 100644
>>>> --- a/tools/perf/tests/expr.c
>>>> +++ b/tools/perf/tests/expr.c
>>>> @@ -74,14 +74,12 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
>>>>   double val, num_cpus_online, num_cpus, num_cores, num_dies, =
num_packages;
>>>>   int ret;
>>>>   struct expr_parse_ctx *ctx;
>>>> -    bool is_intel =3D false;
>>>>   char strcmp_cpuid_buf[256];
>>>>   struct perf_pmu *pmu =3D perf_pmus__find_core_pmu();
>>>>   char *cpuid =3D perf_pmu__getcpuid(pmu);
>>>>   char *escaped_cpuid1, *escaped_cpuid2;
>>>>=20
>>>>   TEST_ASSERT_VAL("get_cpuid", cpuid);
>>>> -    is_intel =3D strstr(cpuid, "Intel") !=3D NULL;
>>>>=20
>>>>   TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
>>>>=20
>>>> @@ -244,11 +242,13 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
>>>>   if (num_dies) // Some platforms do not have CPU die support, for =
example s390
>>>>       TEST_ASSERT_VAL("#num_dies >=3D #num_packages", num_dies >=3D =
num_packages);
>>>>=20
>>>> +#if defined(__i386__) && defined(__x86_64__)
>>>>   TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, =
"#system_tsc_freq") =3D=3D 0);
>>>> -    if (is_intel)
>>>> +    if (strstr(cpuid, "Intel") !=3D NULL)
>>>>       TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>>>>   else
>>>>       TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(val) =
=3D=3D FP_ZERO);
>>>> +#endif
>>>>=20
>>>>   /*
>>>>    * Source count returns the number of events aggregating in a =
leader
>>>=20
>>> I confirmed the change above fixes the failure on Arm64.
>>>=20
>>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Thanks Leo Yan for testing.
>>=20
>> Hi Ian,
>>=20
>> If the change above looks good, I will post a V2 . Please share your =
review comments
>=20
> Sorry for the delay, it looks good to me.  Can you please send the v2?

Hi Namhyung

Thanks for checking on this.
I will test with the latest version sent by Ian and respond with the =
results soon

Thanks
Athira Rajeev
>=20
> Thanks,
> Namhyung



