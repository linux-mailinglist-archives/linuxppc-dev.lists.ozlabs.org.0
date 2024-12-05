Return-Path: <linuxppc-dev+bounces-3833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D49E5D6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41pK0Cm1z30DL;
	Fri,  6 Dec 2024 04:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420328;
	cv=none; b=XO4yZt9SQY8MFkguQAlzM6Wri31eWyetoNd5RkqnirC3ZjkQJxmhV3BVHKpZa8iGjGBKqqXX/gEd+JqPiLSUDaNRBAiBSOVxZI48NZDH6N6/5PS8KnO4JzLQnBKE9D5Ogt9bpA5Ksg9TprH79n0BvW3AFNpv/bDK9XDRJ1J4BSwurWAEzYyUyqZvPs8tR1FtTHLaHUgT8+ALxEc6Ap8qnrYiUmaXupTwAP4JhZAUSZTxogxOe0bjDYsm91ExIcQ7SZ2nKOcASaxHsIH7OIHvs1NH31NOQkJXquk7DoeAhiO8mVRlaEIutF3uNzTEe1v056bllYiNSpF4dvsbrVAWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420328; c=relaxed/relaxed;
	bh=q5EY3kX7KhFC/FTPkny53AIy+BAB1uApixoqmRUVNuo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ICPzFLSKsdIgELVJdFt1OsnlHbo8LAYeQgKz7X1a50SB+/ebS6DFR3aofrH7GJNQiqZv6h9yILn4jj4TzMZ3TJWfKYXz7YyT8mZq917qxtzLD3axEUrbZBj5Q7xF6jT3AhuQO01piJfgrodTWhq9dmfIFk7M8iSR+lZoUr7t15XMtwcr+6YaXPA6x/qmKVAs1LGBjUZeCVsw82xTMUPefl/y/y0n66PQaEbF53fj96dQDZ6du9ZGjSgnDjlYIev9Xw/UCu568vkqNS6Ys19iFD/FxQDEI67foRU9wfIlAwvsYvq3ubssCtgi0zQFcdtCtDA/Z3Yrj2p66FbeIDRNMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R54SyZfb; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R54SyZfb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41pH4g1fz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:38:47 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5A0ht5027895;
	Thu, 5 Dec 2024 17:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q5EY3k
	X7KhFC/FTPkny53AIy+BAB1uApixoqmRUVNuo=; b=R54SyZfbOdTBVwIlCdGVHw
	tsdess/Dkj5iW9ArmEiLG2HgGDQiMWiCy9YompcsTLrp4w/+sAhznxWfvI+P+VZh
	HlWC0UvtLyHi6VPjOMLtRg/buAPti2MmmZNFsx34G9/yh6nMQAIIuIMikOUKBn5M
	1iFdA6HAGIXcoJoCpHxUk09/44dqGfUO0pXckcyr05rzOEkIeM71lFlUOfFhLsA9
	s/Bx8Gp5M7b3Hwn1qqdg7ONOClFQUfBt+vIz5AKN2Y9xTFiwhNauGaeMf8Mq+Utx
	J550N92GUVPDeFa7PhUtXE4C8e71CiESRDldie+uusgG8/AvW6TsniP6g50C7PVA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ba1yj95m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:38:31 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5HO8ZW026779;
	Thu, 5 Dec 2024 17:38:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ba1yj95e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:38:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5H9Kwp031726;
	Thu, 5 Dec 2024 17:38:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438ehm6xt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:38:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5HcPoP34669230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 17:38:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B50952004B;
	Thu,  5 Dec 2024 17:38:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E853020040;
	Thu,  5 Dec 2024 17:38:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.236])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Dec 2024 17:38:17 +0000 (GMT)
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
Subject: Re: [PATCH v1] perf test expr: Fix system_tsc_freq for only x86
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20241205022305.158202-1-irogers@google.com>
Date: Thu, 5 Dec 2024 23:08:03 +0530
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <311D6694-4BB0-4961-B240-A9ACB9B67AEC@linux.vnet.ibm.com>
References: <20241205022305.158202-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cJxkMxJXYzwfOWusoHeslW-C1Qv_nSO3
X-Proofpoint-GUID: mbS_HROLxajSXWWR5QTFQulaZ48XSr7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 5 Dec 2024, at 7:53=E2=80=AFAM, Ian Rogers <irogers@google.com> =
wrote:
>=20
> The refactoring of tool PMU events to have a PMU then adding the expr
> literals to the tool PMU made it so that the literal system_tsc_freq
> was only supported on x86. Update the test expectations to match -
> namely the parsing is x86 specific and only yields a non-zero value on
> Intel.
>=20
> Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions =
and json descriptions")
> Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Closes: =
https://lore.kernel.org/linux-perf-users/20241022140156.98854-1-atrajeev@l=
inux.vnet.ibm.com/
> Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
Hi Ian, Namhyung

Tested with the changes on powerpc and good with the changes

# ./perf test "Simple expression parser"
  7: Simple expression parser                                        : =
Ok

Thanks
Athira

> ---
> tools/perf/tests/expr.c | 19 ++++++++++++-------
> 1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> index 41ff1affdfcd..726cf8d4da28 100644
> --- a/tools/perf/tests/expr.c
> +++ b/tools/perf/tests/expr.c
> @@ -75,14 +75,12 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
> double val, num_cpus_online, num_cpus, num_cores, num_dies, =
num_packages;
> int ret;
> struct expr_parse_ctx *ctx;
> - bool is_intel =3D false;
> char strcmp_cpuid_buf[256];
> struct perf_cpu cpu =3D {-1};
> char *cpuid =3D get_cpuid_allow_env_override(cpu);
> char *escaped_cpuid1, *escaped_cpuid2;
>=20
> TEST_ASSERT_VAL("get_cpuid", cpuid);
> - is_intel =3D strstr(cpuid, "Intel") !=3D NULL;
>=20
> TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
>=20
> @@ -245,12 +243,19 @@ static int test__expr(struct test_suite *t =
__maybe_unused, int subtest __maybe_u
> if (num_dies) // Some platforms do not have CPU die support, for =
example s390
> TEST_ASSERT_VAL("#num_dies >=3D #num_packages", num_dies >=3D =
num_packages);
>=20
> - TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, =
"#system_tsc_freq") =3D=3D 0);
> - if (is_intel)
> - TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> - else
> - TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(val) =3D=3D =
FP_ZERO);
>=20
> + if (expr__parse(&val, ctx, "#system_tsc_freq") =3D=3D 0) {
> + bool is_intel =3D strstr(cpuid, "Intel") !=3D NULL;
> +
> + if (is_intel)
> + TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> + else
> + TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(val) =3D=3D =
FP_ZERO);
> + } else {
> +#if defined(__i386__) || defined(__x86_64__)
> + TEST_ASSERT_VAL("#system_tsc_freq unsupported", 0);
> +#endif
> + }
> /*
> * Source count returns the number of events aggregating in a leader
> * event including the leader. Check parsing yields an id.
> --=20
> 2.47.0.338.g60cca15819-goog
>=20


