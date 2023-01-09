Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61226626B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 14:18:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrDzC5RBgz3cFl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 00:18:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=duEZJVq5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=duEZJVq5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrDxb5Qknz3cFH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 00:17:07 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309CLPpx016700;
	Mon, 9 Jan 2023 13:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=oSa+UgGc1KQSMwPpS7EqWPgmIC25JQUHhMfRTmQ76ro=;
 b=duEZJVq5VdwkUhsUJTf/xDnNUT07oj9uSr1FTEg96VpGZGAGQmbJJR67PpZLTbPbrkQm
 oCXwtTpWi/0fX+t7CH4BQ0uNnuQgNeARcDvOwWGlkECjfK3vqbz6q+Wiqa1b7WeTjm+B
 Hhi45sRqwmrAoBdtoH7qcWhkXCeDcRCk/Ie+ZC7OYwCyPc++IBIK4C+j1EkcLchivi54
 IKTa02zI5bEV3y1oY2Wz9gEzUMuEHIh5RWYmO5UhZsMF0Ikmp88GamzwJxrsbL/xtoBI
 Elvwc6uZfJJt5J/TUjybx/MCBNUcMMiEnkumCSzjAucuHSKSVUxGkMKgMBktspo9DZEN 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6je3u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 13:16:59 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309CC6tq004630;
	Mon, 9 Jan 2023 13:16:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6je3su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 13:16:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3098Hcdx013339;
	Mon, 9 Jan 2023 13:16:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3my00fk0dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 13:16:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 309DGq4D22282886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Jan 2023 13:16:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAF6620040;
	Mon,  9 Jan 2023 13:16:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 491CD2004D;
	Mon,  9 Jan 2023 13:16:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.36.39])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Jan 2023 13:16:50 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] perf test bpf: Skip test if kernel-debuginfo is not
 present
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y7bIk77mdE4j8Jyi@kernel.org>
Date: Mon, 9 Jan 2023 18:46:49 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1FC1E7D-8E6C-42E6-9293-E7E69D0DF542@linux.vnet.ibm.com>
References: <20230105121742.92249-1-atrajeev@linux.vnet.ibm.com>
 <20230105121742.92249-2-atrajeev@linux.vnet.ibm.com>
 <Y7bIk77mdE4j8Jyi@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IeRmQUM0bYtezXT9kVa7RFgG5q0jXE8o
X-Proofpoint-GUID: xYSSXg8LLAo7HEie9VcZ_V1yjn4b1r_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_06,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090094
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Jan-2023, at 6:24 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Thu, Jan 05, 2023 at 05:47:42PM +0530, Athira Rajeev escreveu:
>> Perf BPF filter test fails in environment where "kernel-debuginfo"
>> is not installed.
>=20
> I'll apply this to perf/core, for the next merge window, as its more =
an
> improvement than a fix, i.e. we know why it fails, we're just =
improving
> the user reporting to make that clear at first sight.
>=20
> - Arnaldo

Hi Arnaldo,

Sure, Thanks for checking

Athira
>=20
>> Test failure logs:
>> <<>>
>> 42: BPF filter                            :
>> 42.1: Basic BPF filtering                 : Ok
>> 42.2: BPF pinning                         : Ok
>> 42.3: BPF prologue generation             : FAILED!
>> <<>>
>>=20
>> Enabling verbose option provided debug logs, which says debuginfo
>> needs to be installed. Snippet of verbose logs:
>>=20
>> <<>>
>> 42.3: BPF prologue generation                                       :
>> --- start ---
>> test child forked, pid 28218
>> <<>>
>> Rebuild with CONFIG_DEBUG_INFO=3Dy, or install an appropriate =
debuginfo
>> package.
>> bpf_probe: failed to convert perf probe events
>> Failed to add events selected by BPF
>> test child finished with -1
>> ---- end ----
>> BPF filter subtest 3: FAILED!
>> <<>>
>>=20
>> Here subtest, "BPF prologue generation" failed and
>> logs shows debuginfo is needed. After installing
>> kernel-debuginfo package, testcase passes.
>>=20
>> Subtest "BPF prologue generation" failed because, the "do_test"
>> function returns "TEST_FAIL" without checking the error type
>> returned by "parse_events_load_bpf_obj" function.
>> Function parse_events_load_bpf_obj can also return error of type
>> "-ENODATA" incase kernel-debuginfo package is not installed. Fix this
>> by adding check for -ENODATA error.
>>=20
>> Test result after the patch changes:
>>=20
>> Test failure logs:
>> <<>>
>> 42: BPF filter                 :
>> 42.1: Basic BPF filtering      : Ok
>> 42.2: BPF pinning              : Ok
>> 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
>> installed or environment missing BPF support)
>>=20
>> Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> Note: This is dependent on patch 1:
>> tools/perf: Update the exit error codes in function
>> try_to_find_probe_trace_event
>>=20
>> tools/perf/tests/bpf.c | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>> index 17c023823713..6a4235a9cf57 100644
>> --- a/tools/perf/tests/bpf.c
>> +++ b/tools/perf/tests/bpf.c
>> @@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int =
(*func)(void),
>>=20
>> 	err =3D parse_events_load_bpf_obj(&parse_state, =
&parse_state.list, obj, NULL);
>> 	parse_events_error__exit(&parse_error);
>> +	if (err =3D=3D -ENODATA) {
>> +		pr_debug("Failed to add events selected by BPF, =
debuginfo package not installed\n");
>> +		return TEST_SKIP;
>> +	}
>> 	if (err || list_empty(&parse_state.list)) {
>> 		pr_debug("Failed to add events selected by BPF\n");
>> 		return TEST_FAIL;
>> @@ -368,7 +372,7 @@ static struct test_case bpf_tests[] =3D {
>> 			"clang isn't installed or environment missing =
BPF support"),
>> #ifdef HAVE_BPF_PROLOGUE
>> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
>> -			"clang isn't installed or environment missing =
BPF support"),
>> +			"clang/debuginfo isn't installed or environment =
missing BPF support"),
>> #else
>> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in"),
>> #endif
>> --=20
>> 2.31.1
>=20
> --=20
>=20
> - Arnaldo

