Return-Path: <linuxppc-dev+bounces-2817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E9B9BABCE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 05:18:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhdVX0C5Lz2yGs;
	Mon,  4 Nov 2024 15:17:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730693875;
	cv=none; b=N7XYqnon2ds82RsogB++ic9pW9vHPgzv0D6BtlmGmUlKPMKN/PUSPUFcqHb2VO2vtvOUeoqNLH2VnDFLoOa2LWtyaft0/66iwWhLiETEW7VLd3+pvSIJg4QXKwxT0e3TDh9ekVALDUFmXN/1d+zjZ3RhFAlCfxni0TKe8cnTghCmMEOenQrbKTkABnkqE7gWFLQmtZtZMSdw+n0EPYMfW6Hr0pzMjQH103DjaGSoc+lzeQx5Lz4Oks1LZWskl+ohnyIu8ITX+OSzTWNEQzvrSufOIMZNN5Qxc2UpMkMDuRHQKCKy9OAyaTYyznZquhTQSR4GeCeQbdLYjAQjIfrEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730693875; c=relaxed/relaxed;
	bh=p0n8bncX8QjVKzC1C67rzfzC2d7vddEvGtx6OqnXO9M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IB2QIRT1y0FgO+Q4EiIzmUl2lqCHiXHbDNOITCxQ7VIkTzJcRJC7b1zLLwl+fWO233jA/Pwsg8NGg/sv0pvafRTnVRp311DlEgq41m/LqSEizQA8dAxgKHVwVewG8/Yl0rdo/sg48zx0ejQUYe8RVLWr5D1ikVrF4oH4PnIbWrwNqRXUndg5/sfhrW7C6nd4XySa0CAX0USn4u/GwqB7wrsKTYUCHe5FnNUvXiADoTQGwJCHvGAYCa0W5GKvXaJ/dbmXbVakRdkw3MeqHWvasquO31LmyYrWObXHVsbyxtIzFXNNiGFqjuY9LEpy9hjz9+NEgIVBoJ+yCBoM4Tz8rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HEJrNcHs; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HEJrNcHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhdVW0CHXz2y3Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 15:17:54 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A436k8G030694;
	Mon, 4 Nov 2024 04:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=p0n8bn
	cX8QjVKzC1C67rzfzC2d7vddEvGtx6OqnXO9M=; b=HEJrNcHs4gIsRRei6jp5NR
	4id7xyVL/VejgeVW45GFnLbEo9Hnze5zIFlJA22S2gRWmC8x+DjoZhc7S4n3awtt
	XPdJla7l41H/QTLet7aEbXJ741JztaQI1xDUcXoBNGLBtsNHl1DSlPaeGfitFVFs
	Xt6XbIfACiOEcH+Btw3I15RLw+7iWnpVl2z83VpxQZ2lr4S1BqYy9lQyTncsiS0o
	3qGgCPHbNy9FB8jelM5/udACGdOXLfA/ZrTZWcagT90K6p/iGbDeqhHYdrmyVKlW
	r9FE+Z6GQuKM1mow7TX6iHWBsc9RyLmLQEmV4pm4nJ71MCM0oEzf7fzCVzHoYChQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pjku8jcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 04:17:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A44HmCr026975;
	Mon, 4 Nov 2024 04:17:48 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pjku8jck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 04:17:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3GsIbu024200;
	Mon, 4 Nov 2024 04:17:47 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42nxds1h7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 04:17:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A44HhYL57016712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 04:17:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75DA420043;
	Mon,  4 Nov 2024 04:17:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DDD220040;
	Mon,  4 Nov 2024 04:17:37 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.251.57])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  4 Nov 2024 04:17:37 +0000 (GMT)
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
In-Reply-To: <ZyF2-XNUh38p_5Gg@google.com>
Date: Mon, 4 Nov 2024 09:47:23 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com>
To: Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>,
        tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YbCAwbGDlmK4g8GeLpvleU4OkshRM1HF
X-Proofpoint-ORIG-GUID: 2QnViu_OFeVxv6AmYMCZR_uzxm4-a-fC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 30 Oct 2024, at 5:29=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> Hello,
>=20
> On Tue, Oct 22, 2024 at 07:31:56PM +0530, Athira Rajeev wrote:
>> The "Simple expression parser" test fails on powerpc
>> as below:
>>=20
>> parsing metric: #system_tsc_freq
>> Unrecognized literal '#system_tsc_freq'literal: #system_tsc_freq =3D =
nan
>> syntax error
>> FAILED tests/expr.c:247 #system_tsc_freq
>> ---- end(-1) ----
>> 7: Simple expression parser  : FAILED!
>>=20
>> In the test, system_tsc_freq is checked as below:
>>=20
>> if (is_intel)
>>    TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>> else
>>=20
>> But commit 609aa2667f67 ("perf tool_pmu: Switch to standard
>> pmu functions and json descriptions")' changed condition in
>=20
> Probably need to put it as Fixes: tag.
>=20
>=20
>> tool_pmu__skip_event so that system_tsc_freq event should
>> only appear on x86
>>=20
>> +#if !defined(__i386__) && !defined(__x86_64__)
>> +       /* The system_tsc_freq event should only appear on x86. */
>> +       if (strcasecmp(name, "system_tsc_freq") =3D=3D 0)
>> +               return true;
>> +#endif
>>=20
>> After this commit, the testcase breaks for expr__parse of
>> system_tsc_freq in powerpc case. Fix the testcase to have
>> complete system_tsc_freq test within "is_intel" check.
>=20
> Ian, are you ok with this?
>=20
> Thanks,
> Namhyung
>=20

Hi Ian

If the change looks good to you, I will send a V2 with Fixes tag added. =
Please share your review comments

Hi James, Thomas

Looking for help to test since in non-intel platform, this test will =
fail without the patch

Thanks
Athira

>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/expr.c | 7 +++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
>> index e3aa9d4fcf3a..eb3bd68fc4ce 100644
>> --- a/tools/perf/tests/expr.c
>> +++ b/tools/perf/tests/expr.c
>> @@ -244,11 +244,10 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
>> if (num_dies) // Some platforms do not have CPU die support, for =
example s390
>> TEST_ASSERT_VAL("#num_dies >=3D #num_packages", num_dies >=3D =
num_packages);
>>=20
>> - TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, =
"#system_tsc_freq") =3D=3D 0);
>> - if (is_intel)
>> + if (is_intel) {
>> + TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, =
"#system_tsc_freq") =3D=3D 0);
>> TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>> - else
>> - TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(val) =3D=3D =
FP_ZERO);
>> + }
>>=20
>> /*
>>  * Source count returns the number of events aggregating in a leader
>> --=20
>> 2.43.5



