Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CD64B2C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWYgt425yz3bhN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 20:52:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TDONaVlq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TDONaVlq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWYft17PSz3bgB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 20:51:33 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BD87rYQ026391;
	Tue, 13 Dec 2022 09:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=g1DIiudS6KmmoV92NpIyvnlPPcukeX7bE3zlj3YZONE=;
 b=TDONaVlq8kFbOvAoD8C5L/WuwT13D4eLg3+VjwqEvnc7EArdceyyyWlpwqX4gG+NRUJp
 L1go++qtOO9qobsJDBxERZkToZO3754Wmuw073BbNk5chPfOCNGRozP9I5xIl0raAdFV
 5hU/olFKBuB5ZscOEn2XoEDqxbSox8c4ZOa9uPK7LN26KxSSEskHNHP9VZY1rvrJC7Vm
 8y0hjtxlIboitrmqJjbYHKrLcKNVSps8AYUnrWCOqLO5BExShaMLhqhtdNvmK0yDTbWy
 b+pqHtB5LHICnjU6blgDgozXteRDHLDl20u2ShacpT9p+K8s6Ham0RfE29F9Z0HvBqas ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3memtdbdw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 09:51:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BD8sTWi017297;
	Tue, 13 Dec 2022 09:51:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3memtdbdv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 09:51:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BD1gK00027785;
	Tue, 13 Dec 2022 09:51:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3mchr62uay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 09:51:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BD9pJQW49217834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Dec 2022 09:51:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D456920049;
	Tue, 13 Dec 2022 09:51:19 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D768A20043;
	Tue, 13 Dec 2022 09:51:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.34.192])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 13 Dec 2022 09:51:17 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] perf test bpf: Skip test if kernel-debuginfo is not
 present
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y5d5mfyCEcUqI61Y@kernel.org>
Date: Tue, 13 Dec 2022 15:21:03 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6D5F1D8A-47FF-46CF-8251-20BABDF283F6@linux.vnet.ibm.com>
References: <20221028154230.140709-1-kjain@linux.ibm.com>
 <A7B7E3F1-161D-4B1A-A4FE-E4A77EE06F1A@linux.vnet.ibm.com>
 <Y5d5mfyCEcUqI61Y@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 50EP_d0Y1GLnQ11MAJW8FTr3d2GrqLMk
X-Proofpoint-ORIG-GUID: VEvvFuwRWDInWpa7NyFFweizM18Eui3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130084
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13-Dec-2022, at 12:27 AM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> Em Thu, Nov 03, 2022 at 12:27:01PM +0530, Athira Rajeev escreveu:
>>> On 28-Oct-2022, at 9:12 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
>>>=20
>>> Perf BPF filter test fails in environment where "kernel-debuginfo"
>>> is not installed.
>>>=20
>>> Test failure logs:
>>> <<>>
>>> 42: BPF filter                            :
>>> 42.1: Basic BPF filtering                 : Ok
>>> 42.2: BPF pinning                         : Ok
>>> 42.3: BPF prologue generation             : FAILED!
>>> <<>>
>>>=20
>>> Enabling verbose option provided debug logs, which says debuginfo
>>> needs to be installed. Snippet of verbose logs:
>>>=20
>>> <<>>
>>> 42.3: BPF prologue generation                                       =
:
>>> --- start ---
>>> test child forked, pid 28218
>>> <<>>
>>> Rebuild with CONFIG_DEBUG_INFO=3Dy, or install an appropriate =
debuginfo
>>> package.
>>> bpf_probe: failed to convert perf probe events
>>> Failed to add events selected by BPF
>>> test child finished with -1
>>> ---- end ----
>>> BPF filter subtest 3: FAILED!
>>> <<>>
>>>=20
>>> Here subtest, "BPF prologue generation" failed and
>>> logs shows debuginfo is needed. After installing
>>> kernel-debuginfo package, testcase passes.
>>>=20
>>> Subtest "BPF prologue generation" failed because, the "do_test"
>>> function returns "TEST_FAIL" without checking the error type
>>> returned by "parse_events_load_bpf_obj" function.
>>> Function parse_events_load_bpf_obj can also return error of type
>>> "-ENOENT" incase kernel-debuginfo package is not installed. Fix this
>>> by adding check for -ENOENT error.
>>>=20
>>> Test result after the patch changes:
>>>=20
>>> Test failure logs:
>>> <<>>
>>> 42: BPF filter                 :
>>> 42.1: Basic BPF filtering      : Ok
>>> 42.2: BPF pinning              : Ok
>>> 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
>>> installed or environment missing BPF support)
>>>=20
>>> Fixes: ba1fae431e74bb42 ("perf test: Add 'perf test BPF'")
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> ---
>>> tools/perf/tests/bpf.c | 6 +++++-
>>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>>> index 17c023823713..57cecadc1da2 100644
>>> --- a/tools/perf/tests/bpf.c
>>> +++ b/tools/perf/tests/bpf.c
>>> @@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int =
(*func)(void),
>>>=20
>>> 	err =3D parse_events_load_bpf_obj(&parse_state, =
&parse_state.list, obj, NULL);
>>> 	parse_events_error__exit(&parse_error);
>>> +	if (err =3D=3D -ENOENT) {
>>> +		pr_debug("Failed to add events selected by BPF, =
debuginfo package not installed\n");
>>> +		return TEST_SKIP;
>>> +	}
>>=20
>> Hi Kajol,
>>=20
>> Here, you have used ENOENT to skip the test. But there could be other =
places in the code path for =E2=80=9Cparse_events_load_bpf_obj=E2=80=9D
>> which also returns ENOENT. In that case, for any exit that returns =
ENOENT, test will get skipped.
>>=20
>> Can we look at the logs, example we have this in commit logs:
>>=20
>> 	Rebuild with CONFIG_DEBUG_INFO=3Dy, or install an appropriate =
debuginfo
>> 	package.
>>=20
>> so as to decide whether to skip for debug info ?
>=20
> Kajol?
>=20
> - Arnaldo

Hi Arnaldo, looking for your suggestion on how to handle the case where =
debuginfo is missing.

Here the bpf test fails because of missing debuginfo. The function which =
goes through the debuginfo check is "parse_events_load_bpf_obj" . =
parse_events_load_bpf_obj internally calls "open_debuginfo" which =
returns ENOENT when debuginfo is missing. The patch fix from Kajol is to =
skip the test using error code ENOENT for debuginfo.

But issue with using this return code is that, there are other places in =
the code path for "parse_events_load_bpf_obj"
which also returns ENOENT. In that case, for any exit path that returns =
ENOENT, test will get skipped.
Hence looking for an alternative way to identify missing debuginfo to =
skip the test. Please share your thoughts on this.

Thanks
Athira


>=20
>> Thanks
>> Athira
>>=20
>>> 	if (err || list_empty(&parse_state.list)) {
>>> 		pr_debug("Failed to add events selected by BPF\n");
>>> 		return TEST_FAIL;
>>> @@ -368,7 +372,7 @@ static struct test_case bpf_tests[] =3D {
>>> 			"clang isn't installed or environment missing =
BPF support"),
>>> #ifdef HAVE_BPF_PROLOGUE
>>> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
>>> -			"clang isn't installed or environment missing =
BPF support"),
>>> +			"clang/debuginfo isn't installed or environment =
missing BPF support"),
>>> #else
>>> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, =
"not compiled in"),
>>> #endif
>>> --=20
>>> 2.31.1

