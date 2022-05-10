Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED8521915
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 15:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyK1F4W3Nz3cMf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 23:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SMvyKeOw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SMvyKeOw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyK0B3QL2z3cMq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 23:39:38 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24ACni1N031860;
 Tue, 10 May 2022 13:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=vjM5vUNAryTqGshjkx1YRDr6wE7AraEWWDWKOk+1A2c=;
 b=SMvyKeOwaiLflyt0hgWCDDtS6jmsh5jP+YlTS0EAv3bsH0D+Irs4Sg1+tQGvWrdKQ0RF
 CAdXaIuRw1FATJ5ChuY3aKuLB9tpJ7R4gVy/z0ntesFP8xXeIY2LJo3EAR0bMv5AhmGW
 oISYGlPltzjW7ETIw0tG7eTcZVWOFZDx3jYl8QYOBwAOYeY3vcQLizsmhGLP9H5kc2ml
 LZaf6TDGdSAg93YdsUVSwLnHmmIT9u/u28k7Ed6ff1Z34BZueKpL8qO+FZ+kvfi5Dyln
 CaamMHzRfUClLByRfKFEDp0bs4gQSxUchjXHPSLoFeaQWBboVGgTOvVJl8POOnVkXQwb 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyrd8s5vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:39:33 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24ADLYnP009741;
 Tue, 10 May 2022 13:39:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyrd8s5ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:39:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24ADd9Qf006869;
 Tue, 10 May 2022 13:39:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3fyrkk01g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:39:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24ADPsZv50201064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 13:25:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9FDFAE045;
 Tue, 10 May 2022 13:39:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE4DAE04D;
 Tue, 10 May 2022 13:39:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.24.192])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 10 May 2022 13:39:18 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] tools/perf/tests: Skip perf BPF test if clang is not
 present
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <A0479956-31B6-41F1-9940-9ED95CC59E08@linux.vnet.ibm.com>
Date: Tue, 10 May 2022 19:09:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <8664EED0-0442-4F64-8A28-5042E0DBC026@linux.vnet.ibm.com>
References: <20220505100039.58287-1-atrajeev@linux.vnet.ibm.com>
 <YnQHi5Mhvs2p7BG8@kernel.org>
 <A0479956-31B6-41F1-9940-9ED95CC59E08@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8vPUBojDOEW8-TbWzuGTue_81hD3uMpL
X-Proofpoint-ORIG-GUID: -bX8stcnMVI4mX2HpJwtpHpUZloowvFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_03,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100060
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-May-2022, at 3:07 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
>> On 05-May-2022, at 10:51 PM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>>=20
>> Em Thu, May 05, 2022 at 03:30:39PM +0530, Athira Rajeev escreveu:
>>> Perf BPF filter test fails in environment where "clang"
>>> is not installed.
>>>=20
>>> Test failure logs:
>>>=20
>>> <<>>
>>> 42: BPF filter                    :
>>> 42.1: Basic BPF filtering         : Skip
>>> 42.2: BPF pinning                 : FAILED!
>>> 42.3: BPF prologue generation     : FAILED!
>>> <<>>
>>>=20
>>> Enabling verbose option provided debug logs which says
>>> clang/llvm needs to be installed. Snippet of verbose logs:
>>>=20
>>> <<>>
>>> 42.2: BPF pinning                  :
>>> --- start ---
>>> test child forked, pid 61423
>>> ERROR:	unable to find clang.
>>> Hint:	Try to install latest clang/llvm to support BPF.
>>>       Check your $PATH
>>>=20
>>> <<logs_here>>
>>>=20
>>> Failed to compile test case: 'Basic BPF llvm compile'
>>> Unable to get BPF object, fix kbuild first
>>> test child finished with -1
>>> ---- end ----
>>> BPF filter subtest 2: FAILED!
>>> <<>>
>>>=20
>>> Here subtests, "BPF pinning" and "BPF prologue generation"
>>> failed and logs shows clang/llvm is needed. After installing
>>> clang, testcase passes.
>>>=20
>>> Reason on why subtest failure happens though logs has proper
>>> debug information:
>>> Main function __test__bpf calls test_llvm__fetch_bpf_obj by
>>> passing 4th argument as true ( 4th arguments maps to parameter
>>> "force" in test_llvm__fetch_bpf_obj ). But this will cause
>>> test_llvm__fetch_bpf_obj to skip the check for clang/llvm.
>>>=20
>>> Snippet of code part which checks for clang based on
>>> parameter "force" in test_llvm__fetch_bpf_obj:
>>>=20
>>> <<>>
>>> if (!force && (!llvm_param.user_set_param &&
>>> <<>>
>>>=20
>>> Since force is set to "false", test won't get skipped and
>>> fails to compile test case. The BPF code compilation needs
>>> clang, So pass the fourth argument as "false" and also skip
>>> the test if reason for return is "TEST_SKIP"
>>>=20
>>> After the patch:
>>>=20
>>> <<>>
>>> 42: BPF filter                    :
>>> 42.1: Basic BPF filtering         : Skip
>>> 42.2: BPF pinning                 : Skip
>>> 42.3: BPF prologue generation     : Skip
>>> <<>>
>>=20
>> Wouldn't it be better to add the reason for the skip, like other =
tests
>> do?
>>=20
>> E.g.:
>>=20
>> 23: Watchpoint                                                      :
>> 23.1: Read Only Watchpoint                                          : =
Skip (missing hardware support)
>> 23.2: Write Only Watchpoint                                         : =
Ok
>> 23.3: Read / Write Watchpoint                                       : =
Ok
>> 23.4: Modify Watchpoint
>>=20
>> Something like:
>>=20
>> After the patch:
>>=20
>> <<>>
>> 42: BPF filter                    :
>> 42.1: Basic BPF filtering         : Skip (clang not installed)
>> 42.2: BPF pinning                 : Skip (clang not installed)
>> 42.3: BPF prologue generation     : Skip (clang not installed)
>=20
>=20
> Hi Arnaldo,
>=20
> I tried to use TEST_CASE_REASON("BPF pinning", bpf_pinning, "clang not =
installed")
>=20
> The clang check is done in test_llvm__fetch_bpf_obj under some =
condition checks:
>=20
> <<>>
>         /*
>         * Skip this test if user's .perfconfig doesn't set [llvm] =
section
>         * and clang is not found in $PATH
>         */
>        if (!force && (!llvm_param.user_set_param &&
>                       llvm__search_clang())) {
>                pr_debug("No clang, skip this test\n");
>                return TEST_SKIP;
>        }
> <<>>
>=20
> But the reason for BPF skip could happen at other places also ie =
non-root user, bpf support checks from check_env.
> So can't exactly print the skip reason to be clang since It could get =
skipped from other environment checks too. Any suggestions Arnaldo ?
>=20
> Thanks
> Athira

Hi Arnaldo,

Looking for suggestions on this change.

Thanks
Athira
>=20
>> <<>>
>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> tools/perf/tests/bpf.c | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>>> index 57b9591f7cbb..ae62f01239e3 100644
>>> --- a/tools/perf/tests/bpf.c
>>> +++ b/tools/perf/tests/bpf.c
>>> @@ -222,11 +222,11 @@ static int __test__bpf(int idx)
>>>=20
>>> 	ret =3D test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz,
>>> 				       bpf_testcase_table[idx].prog_id,
>>> -				       true, NULL);
>>> +				       false, NULL);
>>> 	if (ret !=3D TEST_OK || !obj_buf || !obj_buf_sz) {
>>> 		pr_debug("Unable to get BPF object, %s\n",
>>> 			 bpf_testcase_table[idx].msg_compile_fail);
>>> -		if (idx =3D=3D 0)
>>> +		if ((idx =3D=3D 0) || (ret =3D=3D TEST_SKIP))
>>> 			return TEST_SKIP;
>>> 		else
>>> 			return TEST_FAIL;
>>> --=20
>>> 2.35.1
>>=20
>> --=20
>>=20
>> - Arnaldo

