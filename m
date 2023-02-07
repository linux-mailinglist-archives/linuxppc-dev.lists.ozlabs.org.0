Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401868CEC2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9rw666bxz3c95
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 16:16:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9qKSPuy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9qKSPuy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9rv53J9Pz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 16:16:00 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3175EEPp012079;
	Tue, 7 Feb 2023 05:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=kLAHXoROcthUw+s0d/BLz09IJXX+QYDtx8qTUnd0TG8=;
 b=L9qKSPuyajrh/3qCgjqQHboIiSF53fFVePoHY8gkjbsCozwQ1CSDWQkFyDPjp9HnUbTw
 m9O1gph4987hhuz2ypJ84TOVqWRCImL03f4ffDlz0GIChAIBxH5ESxNdVTwAlRBuIPy2
 LmB10rHxf83QBUmaTzzpmEv94PGB7C35xUHFDSfdtTp6Sv12S8sUcw4qKYMb/HkCLAO1
 fS2dK+snpXJni3Bgpim6rrrtS6VvLG50BlHmhJInqhntReeXs7Li9YcGQyNyvAUtZgH9
 dE7QR6fpkqe90r4hXuCJBA+lFCEFuj7Q+ThI5UuvXe4iF6XPELg/wISNWqPV8VaQ8jxa SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkgahg0sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 05:15:45 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3175Finm016594;
	Tue, 7 Feb 2023 05:15:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkgahg0rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 05:15:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 316EUuCi017531;
	Tue, 7 Feb 2023 05:15:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nhemfj8bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 05:15:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3175FcKv24576334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Feb 2023 05:15:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C9A020040;
	Tue,  7 Feb 2023 05:15:38 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB94220043;
	Tue,  7 Feb 2023 05:15:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.62.201])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  7 Feb 2023 05:15:35 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tests/bpf: Fix the bpf test to check for libtraceevent
 support
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y+ERXfJpXXv7xRxx@kernel.org>
Date: Tue, 7 Feb 2023 10:45:33 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <82A58226-5598-4CD9-ADD1-4B8B3E80289A@linux.vnet.ibm.com>
References: <20230131135001.54578-1-atrajeev@linux.vnet.ibm.com>
 <Y9sKjYV8b37vstQ0@kernel.org>
 <628A923D-A993-4A35-A90E-8F6798549FD0@linux.vnet.ibm.com>
 <Y+ERXfJpXXv7xRxx@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UI4RfovFzUk-EL5KVXGSNn3Zu9oOsEoz
X-Proofpoint-GUID: nET1bBW6jTfpoHjI1tJv8-09-tXOG51N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070044
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Feb-2023, at 8:10 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Mon, Feb 06, 2023 at 09:27:13AM +0530, Athira Rajeev escreveu:
>>> On 02-Feb-2023, at 6:27 AM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>>>=20
>>> Em Tue, Jan 31, 2023 at 07:20:01PM +0530, Athira Rajeev escreveu:
>>>> "bpf" tests fails in environment with missing libtraceevent
>>>> support as below:
>>>>=20
>>>> # ./perf test 36
>>>> 36: BPF filter                                                      =
:
>>>> 36.1: Basic BPF filtering                                           =
: FAILED!
>>>> 36.2: BPF pinning                                                   =
: FAILED!
>>>> 36.3: BPF prologue generation                                       =
: FAILED!
>>>>=20
>>>> The environment has clang but missing the libtraceevent
>>>> devel. Hence perf is compiled without libtraceevent support.
>>>=20
>>> Thanks, applied.
>>=20
>> Hi,
>>=20
>> Thanks for checking
>>=20
>> Arnaldo, this is applied to tmp.perf/core branch ?
>=20
> I thought I had this in :-\ Now its in tmp.perf/core.
>=20
> - Arnaldo

Hi Arnaldo,=20

Thanks for picking it.

Athira
>=20
>> Athira=20
>>>=20
>>> - Arnaldo
>>>=20
>>>=20
>>>> Detailed logs:
>>>> 	./perf test -v "Basic BPF filtering"
>>>>=20
>>>> 	Failed to add BPF event syscalls:sys_enter_epoll_pwait
>>>> 	bpf: tracepoint call back failed, stop iterate
>>>> 	Failed to add events selected by BPF
>>>>=20
>>>> The bpf tests tris to add probe event which fails
>>>> at "parse_events_add_tracepoint" function due to missing
>>>> libtraceevent. Add check for "HAVE_LIBTRACEEVENT" in the
>>>> "tests/bpf.c" before proceeding with the test.
>>>>=20
>>>> With the change,
>>>>=20
>>>> 	# ./perf test 36
>>>> 	36: BPF filter                                                   =
   :
>>>> 	36.1: Basic BPF filtering                                        =
   : Skip (not compiled in or missing libtraceevent support)
>>>> 	36.2: BPF pinning                                                =
   : Skip (not compiled in or missing libtraceevent support)
>>>> 	36.3: BPF prologue generation                                    =
   : Skip (not compiled in or missing libtraceevent support)
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> tools/perf/tests/bpf.c | 22 +++++++++++-----------
>>>> 1 file changed, 11 insertions(+), 11 deletions(-)
>>>>=20
>>>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>>>> index 17c023823713..4af39528f611 100644
>>>> --- a/tools/perf/tests/bpf.c
>>>> +++ b/tools/perf/tests/bpf.c
>>>> @@ -23,7 +23,7 @@
>>>> #define NR_ITERS       111
>>>> #define PERF_TEST_BPF_PATH "/sys/fs/bpf/perf_test"
>>>>=20
>>>> -#ifdef HAVE_LIBBPF_SUPPORT
>>>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>>>> #include <linux/bpf.h>
>>>> #include <bpf/bpf.h>
>>>>=20
>>>> @@ -330,10 +330,10 @@ static int test__bpf(int i)
>>>> static int test__basic_bpf_test(struct test_suite *test =
__maybe_unused,
>>>> 				int subtest __maybe_unused)
>>>> {
>>>> -#ifdef HAVE_LIBBPF_SUPPORT
>>>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>>>> 	return test__bpf(0);
>>>> #else
>>>> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
>>>> +	pr_debug("Skip BPF test because BPF or libtraceevent support is =
not compiled\n");
>>>> 	return TEST_SKIP;
>>>> #endif
>>>> }
>>>> @@ -341,10 +341,10 @@ static int test__basic_bpf_test(struct =
test_suite *test __maybe_unused,
>>>> static int test__bpf_pinning(struct test_suite *test =
__maybe_unused,
>>>> 			     int subtest __maybe_unused)
>>>> {
>>>> -#ifdef HAVE_LIBBPF_SUPPORT
>>>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>>>> 	return test__bpf(1);
>>>> #else
>>>> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
>>>> +	pr_debug("Skip BPF test because BPF or libtraceevent support is =
not compiled\n");
>>>> 	return TEST_SKIP;
>>>> #endif
>>>> }
>>>> @@ -352,17 +352,17 @@ static int test__bpf_pinning(struct =
test_suite *test __maybe_unused,
>>>> static int test__bpf_prologue_test(struct test_suite *test =
__maybe_unused,
>>>> 				   int subtest __maybe_unused)
>>>> {
>>>> -#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE)
>>>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE) && =
defined(HAVE_LIBTRACEEVENT)
>>>> 	return test__bpf(2);
>>>> #else
>>>> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
>>>> +	pr_debug("Skip BPF test because BPF or libtraceevent support is =
not compiled\n");
>>>> 	return TEST_SKIP;
>>>> #endif
>>>> }
>>>>=20
>>>>=20
>>>> static struct test_case bpf_tests[] =3D {
>>>> -#ifdef HAVE_LIBBPF_SUPPORT
>>>> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>>>> 	TEST_CASE("Basic BPF filtering", basic_bpf_test),
>>>> 	TEST_CASE_REASON("BPF pinning", bpf_pinning,
>>>> 			"clang isn't installed or environment missing =
BPF support"),
>>>> @@ -373,9 +373,9 @@ static struct test_case bpf_tests[] =3D {
>>>> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in"),
>>>> #endif
>>>> #else
>>>> -	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not =
compiled in"),
>>>> -	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in"),
>>>> -	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in"),
>>>> +	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not =
compiled in or missing libtraceevent support"),
>>>> +	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in or =
missing libtraceevent support"),
>>>> +	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in or missing libtraceevent support"),
>>>> #endif
>>>> 	{ .name =3D NULL, }
>>>> };
>>>> --=20
>>>> 2.39.0
>>>>=20
>>>=20
>>> --=20
>>>=20
>>> - Arnaldo
>>=20
>=20
> --=20
>=20
> - Arnaldo

