Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AF68B4B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 04:58:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9CDD4V51z3cMH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 14:58:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i1y96Scv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i1y96Scv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9CCD17jRz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 14:57:43 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3161Ajdq012608;
	Mon, 6 Feb 2023 03:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=vjtRInHXVDB03tKrSCHvhhkkcNWvvJsK5v55rAshvQ4=;
 b=i1y96ScvpL2CjlbFxVS6cOpjYsMn4aKB8r/am8XWCKF1aEE2fU9J4dvQDKhs1C7emrzn
 blUmDC4HsRLBLYjl/LbPIaMbod+eFwXU5OwE1tNcSll+Iv4BqqXp0TO6Tuz40Ottc2oF
 Mbc5I0UfAf+rOZ71DsVHBdYayZaoUoEZO/swT1l+6VYJAPYT8LTxom70jtC2kAOeklMj
 9x+qsaE7u1e5NkmvwBRaRKmVoQm4FXwuiKCQ5ua2ZORqjD/D6MTG9fzxXJP4tYpZDhJL
 iDF3syIULvhC+l9bI4eEv0THmI0IVOcv5Du3kpZKRAUteiMSwfouYlcgttNVfLzElXvE Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj1h1v8u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 03:57:24 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3163tgAK013681;
	Mon, 6 Feb 2023 03:57:24 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj1h1v8tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 03:57:23 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3158T8Fw017531;
	Mon, 6 Feb 2023 03:57:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nhemfhck3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 03:57:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3163vHlC26149590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 03:57:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C73CC20043;
	Mon,  6 Feb 2023 03:57:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49DAA20040;
	Mon,  6 Feb 2023 03:57:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.64.42])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Feb 2023 03:57:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tests/bpf: Fix the bpf test to check for libtraceevent
 support
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y9sKjYV8b37vstQ0@kernel.org>
Date: Mon, 6 Feb 2023 09:27:13 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <628A923D-A993-4A35-A90E-8F6798549FD0@linux.vnet.ibm.com>
References: <20230131135001.54578-1-atrajeev@linux.vnet.ibm.com>
 <Y9sKjYV8b37vstQ0@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6iK2RjkfbkvGBXbDjbX7EF51HXPDJXh2
X-Proofpoint-ORIG-GUID: DB9w8iX3AFRqthha26pYMCjwSxawRckX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_02,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060030
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 02-Feb-2023, at 6:27 AM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Tue, Jan 31, 2023 at 07:20:01PM +0530, Athira Rajeev escreveu:
>> "bpf" tests fails in environment with missing libtraceevent
>> support as below:
>>=20
>> # ./perf test 36
>> 36: BPF filter                                                      :
>> 36.1: Basic BPF filtering                                           : =
FAILED!
>> 36.2: BPF pinning                                                   : =
FAILED!
>> 36.3: BPF prologue generation                                       : =
FAILED!
>>=20
>> The environment has clang but missing the libtraceevent
>> devel. Hence perf is compiled without libtraceevent support.
>=20
> Thanks, applied.

Hi,

Thanks for checking

Arnaldo, this is applied to tmp.perf/core branch ?

Athira=20
>=20
> - Arnaldo
>=20
>=20
>> Detailed logs:
>> 	./perf test -v "Basic BPF filtering"
>>=20
>> 	Failed to add BPF event syscalls:sys_enter_epoll_pwait
>> 	bpf: tracepoint call back failed, stop iterate
>> 	Failed to add events selected by BPF
>>=20
>> The bpf tests tris to add probe event which fails
>> at "parse_events_add_tracepoint" function due to missing
>> libtraceevent. Add check for "HAVE_LIBTRACEEVENT" in the
>> "tests/bpf.c" before proceeding with the test.
>>=20
>> With the change,
>>=20
>> 	# ./perf test 36
>> 	36: BPF filter                                                   =
   :
>> 	36.1: Basic BPF filtering                                        =
   : Skip (not compiled in or missing libtraceevent support)
>> 	36.2: BPF pinning                                                =
   : Skip (not compiled in or missing libtraceevent support)
>> 	36.3: BPF prologue generation                                    =
   : Skip (not compiled in or missing libtraceevent support)
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/bpf.c | 22 +++++++++++-----------
>> 1 file changed, 11 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>> index 17c023823713..4af39528f611 100644
>> --- a/tools/perf/tests/bpf.c
>> +++ b/tools/perf/tests/bpf.c
>> @@ -23,7 +23,7 @@
>> #define NR_ITERS       111
>> #define PERF_TEST_BPF_PATH "/sys/fs/bpf/perf_test"
>>=20
>> -#ifdef HAVE_LIBBPF_SUPPORT
>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>> #include <linux/bpf.h>
>> #include <bpf/bpf.h>
>>=20
>> @@ -330,10 +330,10 @@ static int test__bpf(int i)
>> static int test__basic_bpf_test(struct test_suite *test =
__maybe_unused,
>> 				int subtest __maybe_unused)
>> {
>> -#ifdef HAVE_LIBBPF_SUPPORT
>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>> 	return test__bpf(0);
>> #else
>> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
>> +	pr_debug("Skip BPF test because BPF or libtraceevent support is =
not compiled\n");
>> 	return TEST_SKIP;
>> #endif
>> }
>> @@ -341,10 +341,10 @@ static int test__basic_bpf_test(struct =
test_suite *test __maybe_unused,
>> static int test__bpf_pinning(struct test_suite *test __maybe_unused,
>> 			     int subtest __maybe_unused)
>> {
>> -#ifdef HAVE_LIBBPF_SUPPORT
>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>> 	return test__bpf(1);
>> #else
>> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
>> +	pr_debug("Skip BPF test because BPF or libtraceevent support is =
not compiled\n");
>> 	return TEST_SKIP;
>> #endif
>> }
>> @@ -352,17 +352,17 @@ static int test__bpf_pinning(struct test_suite =
*test __maybe_unused,
>> static int test__bpf_prologue_test(struct test_suite *test =
__maybe_unused,
>> 				   int subtest __maybe_unused)
>> {
>> -#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE)
>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE) && =
defined(HAVE_LIBTRACEEVENT)
>> 	return test__bpf(2);
>> #else
>> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
>> +	pr_debug("Skip BPF test because BPF or libtraceevent support is =
not compiled\n");
>> 	return TEST_SKIP;
>> #endif
>> }
>>=20
>>=20
>> static struct test_case bpf_tests[] =3D {
>> -#ifdef HAVE_LIBBPF_SUPPORT
>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>> 	TEST_CASE("Basic BPF filtering", basic_bpf_test),
>> 	TEST_CASE_REASON("BPF pinning", bpf_pinning,
>> 			"clang isn't installed or environment missing =
BPF support"),
>> @@ -373,9 +373,9 @@ static struct test_case bpf_tests[] =3D {
>> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in"),
>> #endif
>> #else
>> -	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not =
compiled in"),
>> -	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in"),
>> -	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in"),
>> +	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not =
compiled in or missing libtraceevent support"),
>> +	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in or =
missing libtraceevent support"),
>> +	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in or missing libtraceevent support"),
>> #endif
>> 	{ .name =3D NULL, }
>> };
>> --=20
>> 2.39.0
>>=20
>=20
> --=20
>=20
> - Arnaldo

