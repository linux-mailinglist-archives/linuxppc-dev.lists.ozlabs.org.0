Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDD52F8BD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 06:48:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4rhR5wsmz3chM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 14:48:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qikZ0NXe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qikZ0NXe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4rgf0WDYz3blL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 14:47:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24L42x59025530;
 Sat, 21 May 2022 04:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=lyocsUF+CR7ygjplRlFFbVrm/hMQJtZZcf62+8CnFtc=;
 b=qikZ0NXeKgakThhH5BQqUsNqpPpDGo856vrXBsN8GBZAA11oQXzfVjjXnoF2SiAzFhZE
 qtiYVarWtVvzeAF512NkbhJ9a15EKjsGYcwRj7dPOnSiiiH6UyK3hvIWEHODHzZIsyMZ
 wXrjTrrPOStO6+WVbubYRB758aBeApjYSfit8mOqFWx9RiygM8G7RXJ5tYEbbMoHjizc
 ID3crZ2Bl0NiJICasaRjHkd8UAoetAqOi5PHWG9ustcNTqbwNfHZQHl9HoSFUgp4rgYd
 n5lQanHO1/1oZmmP7aOzOztQLhP+ttPRrpKqlNaCZuLKUvEnOfQhYfbnL7FcXCGafEE4 pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6rqarey5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 May 2022 04:47:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24L4lm1N032739;
 Sat, 21 May 2022 04:47:48 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6rqarey0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 May 2022 04:47:48 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24L4878n004651;
 Sat, 21 May 2022 04:47:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3g6qq982ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 May 2022 04:47:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24L4lh4Q31457786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 May 2022 04:47:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF66D4C04A;
 Sat, 21 May 2022 04:47:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4236B4C040;
 Sat, 21 May 2022 04:47:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.18.237])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 21 May 2022 04:47:38 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is not
 present
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fX7XXHUzQvKQf-bmWxkJpMUTaRSca8oOo4w-3TgF_mHYQ@mail.gmail.com>
Date: Sat, 21 May 2022 10:17:38 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE464D1F-C157-4313-A086-8A46B7A409DC@linux.vnet.ibm.com>
References: <20220511115438.84032-1-atrajeev@linux.vnet.ibm.com>
 <be9726bc462d3b00243bd2161fb8e153b919db1e.camel@linux.vnet.ibm.com>
 <CAP-5=fX7XXHUzQvKQf-bmWxkJpMUTaRSca8oOo4w-3TgF_mHYQ@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: casvgLV6OOllIGX9CEZ_U4ZpbtqUsRYs
X-Proofpoint-ORIG-GUID: PRRRk0PqMgzwbHW2c0dBtjPW0AE4hngD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_08,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205210023
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>,
 kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-May-2022, at 12:02 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Thu, May 12, 2022 at 11:16 PM Disha Goel =
<disgoel@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>> -----Original Message-----
>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> To: acme@kernel.org, jolsa@kernel.org
>> Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, =
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, =
rnsastry@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, =
irogers@google.com
>> Subject: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is =
not present
>> Date: Wed, 11 May 2022 17:24:38 +0530
>>=20
>> Perf BPF filter test fails in environment where "clang"
>>=20
>> is not installed.
>>=20
>>=20
>> Test failure logs:
>>=20
>>=20
>> <<>>
>>=20
>> 42: BPF filter                    :
>>=20
>> 42.1: Basic BPF filtering         : Skip
>>=20
>> 42.2: BPF pinning                 : FAILED!
>>=20
>> 42.3: BPF prologue generation     : FAILED!
>>=20
>> <<>>
>>=20
>>=20
>> Enabling verbose option provided debug logs which says
>>=20
>> clang/llvm needs to be installed. Snippet of verbose logs:
>>=20
>>=20
>> <<>>
>>=20
>> 42.2: BPF pinning                  :
>>=20
>> --- start ---
>>=20
>> test child forked, pid 61423
>>=20
>> ERROR: unable to find clang.
>>=20
>> Hint: Try to install latest clang/llvm to support BPF.
>>=20
>>        Check your $PATH
>>=20
>>=20
>> <<logs_here>>
>>=20
>>=20
>> Failed to compile test case: 'Basic BPF llvm compile'
>>=20
>> Unable to get BPF object, fix kbuild first
>>=20
>> test child finished with -1
>>=20
>> ---- end ----
>>=20
>> BPF filter subtest 2: FAILED!
>>=20
>> <<>>
>>=20
>>=20
>> Here subtests, "BPF pinning" and "BPF prologue generation"
>>=20
>> failed and logs shows clang/llvm is needed. After installing
>>=20
>> clang, testcase passes.
>>=20
>>=20
>> Reason on why subtest failure happens though logs has proper
>>=20
>> debug information:
>>=20
>> Main function __test__bpf calls test_llvm__fetch_bpf_obj by
>>=20
>> passing 4th argument as true ( 4th arguments maps to parameter
>>=20
>> "force" in test_llvm__fetch_bpf_obj ). But this will cause
>>=20
>> test_llvm__fetch_bpf_obj to skip the check for clang/llvm.
>>=20
>>=20
>> Snippet of code part which checks for clang based on
>>=20
>> parameter "force" in test_llvm__fetch_bpf_obj:
>>=20
>>=20
>> <<>>
>>=20
>> if (!force && (!llvm_param.user_set_param &&
>>=20
>> <<>>
>>=20
>>=20
>> Since force is set to "false", test won't get skipped and
>>=20
>> fails to compile test case. The BPF code compilation needs
>>=20
>> clang, So pass the fourth argument as "false" and also skip
>>=20
>> the test if reason for return is "TEST_SKIP"
>>=20
>>=20
>> After the patch:
>>=20
>>=20
>> <<>>
>>=20
>> 42: BPF filter                    :
>>=20
>> 42.1: Basic BPF filtering         : Skip
>>=20
>> 42.2: BPF pinning                 : Skip
>>=20
>> 42.3: BPF prologue generation     : Skip
>>=20
>> <<>>
>>=20
>>=20
>> Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")
>>=20
>> Signed-off-by: Athira Rajeev <
>>=20
>> atrajeev@linux.vnet.ibm.com
>>=20
>>>=20
>>=20
>> ---
>>=20
>> Changelog:
>>=20
>> Addressed review comments from Arnaldo by adding
>>=20
>> reason for skipping of testcase.
>>=20
>>=20
>> tools/perf/tests/bpf.c | 10 ++++++----
>>=20
>> 1 file changed, 6 insertions(+), 4 deletions(-)
>>=20
>>=20
>> Tested the patch on powerpc and powernv, perf BPF test works fine =
with the patch.
>>=20
>> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>=20
> Acked-by: Ian Rogers <irogers@google.com>
>=20
> Thanks!
> Ian
>=20

Hi,

Thanks all for the review.

Athira

>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>>=20
>> index 57b9591f7cbb..17c023823713 100644
>>=20
>> --- a/tools/perf/tests/bpf.c
>>=20
>> +++ b/tools/perf/tests/bpf.c
>>=20
>> @@ -222,11 +222,11 @@ static int __test__bpf(int idx)
>>=20
>>=20
>>  ret =3D test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz,
>>=20
>>        bpf_testcase_table[idx].prog_id,
>>=20
>> -       true, NULL);
>>=20
>> +       false, NULL);
>>=20
>>  if (ret !=3D TEST_OK || !obj_buf || !obj_buf_sz) {
>>=20
>>  pr_debug("Unable to get BPF object, %s\n",
>>=20
>>  bpf_testcase_table[idx].msg_compile_fail);
>>=20
>> - if (idx =3D=3D 0)
>>=20
>> + if ((idx =3D=3D 0) || (ret =3D=3D TEST_SKIP))
>>=20
>>  return TEST_SKIP;
>>=20
>>  else
>>=20
>>  return TEST_FAIL;
>>=20
>> @@ -364,9 +364,11 @@ static int test__bpf_prologue_test(struct =
test_suite *test __maybe_unused,
>>=20
>> static struct test_case bpf_tests[] =3D {
>>=20
>> #ifdef HAVE_LIBBPF_SUPPORT
>>=20
>>  TEST_CASE("Basic BPF filtering", basic_bpf_test),
>>=20
>> - TEST_CASE("BPF pinning", bpf_pinning),
>>=20
>> + TEST_CASE_REASON("BPF pinning", bpf_pinning,
>>=20
>> + "clang isn't installed or environment missing BPF support"),
>>=20
>> #ifdef HAVE_BPF_PROLOGUE
>>=20
>> - TEST_CASE("BPF prologue generation", bpf_prologue_test),
>>=20
>> + TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
>>=20
>> + "clang isn't installed or environment missing BPF support"),
>>=20
>> #else
>>=20
>>  TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not =
compiled in"),
>>=20
>> #endif

