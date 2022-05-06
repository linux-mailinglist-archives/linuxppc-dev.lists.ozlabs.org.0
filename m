Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF551D4C2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvlr9088Hz3cBv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:38:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NDZinXc2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NDZinXc2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvlqS14zyz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 19:38:11 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468lHEv003940;
 Fri, 6 May 2022 09:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=LWgBO7yJaS0z8Gd/WSnEZ1KfUGlpGPg1Lr57MuahqEM=;
 b=NDZinXc2VUvFTiFO8kzypZEqF2dVFa/FbmaZw+OLCnmycxV9zFTfGdreiFgTxD95z504
 wVsA3PibLK/xFPVZab0YS5XZrOcuTFDHaEJIo/BjrPLZiMXVcgm49hZy8pIXNLybUH2H
 AOFe6plykla/AxGSH7TjwqLomSZSu/JZnCzLA371ILubNaQUz1r5gwZ9QR2eVi+geKtc
 wWD1K9wqtW6LW8ibGWEVBxaLzhvGm/l1kFP6103JJv/dA70uctNQotcRNsuXeclMOs9C
 rOzYnVrrgWriNLw85HDkCFx9FUQ0gDvz4wa4H5+X0t/ZW41t3SbxFDE+XZPD7SDohm1p nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw0fk123e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 09:38:06 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2468u6nN004981;
 Fri, 6 May 2022 09:38:05 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw0fk122d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 09:38:05 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2469WZPn018727;
 Fri, 6 May 2022 09:38:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk64t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 09:38:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2469bx7f27001168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 09:37:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC2A5205A;
 Fri,  6 May 2022 09:37:59 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.85.201])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 6AE6B52067;
 Fri,  6 May 2022 09:37:55 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] tools/perf/tests: Skip perf BPF test if clang is not
 present
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YnQHi5Mhvs2p7BG8@kernel.org>
Date: Fri, 6 May 2022 15:07:51 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0479956-31B6-41F1-9940-9ED95CC59E08@linux.vnet.ibm.com>
References: <20220505100039.58287-1-atrajeev@linux.vnet.ibm.com>
 <YnQHi5Mhvs2p7BG8@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TvZ7XpMCkZHHl46xXx55ZGt709TSnFza
X-Proofpoint-ORIG-GUID: b0B8A5v8q_e3Z1K2SUf12mX7TrtfpN3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060052
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-May-2022, at 10:51 PM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> Em Thu, May 05, 2022 at 03:30:39PM +0530, Athira Rajeev escreveu:
>> Perf BPF filter test fails in environment where "clang"
>> is not installed.
>>=20
>> Test failure logs:
>>=20
>> <<>>
>> 42: BPF filter                    :
>> 42.1: Basic BPF filtering         : Skip
>> 42.2: BPF pinning                 : FAILED!
>> 42.3: BPF prologue generation     : FAILED!
>> <<>>
>>=20
>> Enabling verbose option provided debug logs which says
>> clang/llvm needs to be installed. Snippet of verbose logs:
>>=20
>> <<>>
>> 42.2: BPF pinning                  :
>> --- start ---
>> test child forked, pid 61423
>> ERROR:	unable to find clang.
>> Hint:	Try to install latest clang/llvm to support BPF.
>>        Check your $PATH
>>=20
>> <<logs_here>>
>>=20
>> Failed to compile test case: 'Basic BPF llvm compile'
>> Unable to get BPF object, fix kbuild first
>> test child finished with -1
>> ---- end ----
>> BPF filter subtest 2: FAILED!
>> <<>>
>>=20
>> Here subtests, "BPF pinning" and "BPF prologue generation"
>> failed and logs shows clang/llvm is needed. After installing
>> clang, testcase passes.
>>=20
>> Reason on why subtest failure happens though logs has proper
>> debug information:
>> Main function __test__bpf calls test_llvm__fetch_bpf_obj by
>> passing 4th argument as true ( 4th arguments maps to parameter
>> "force" in test_llvm__fetch_bpf_obj ). But this will cause
>> test_llvm__fetch_bpf_obj to skip the check for clang/llvm.
>>=20
>> Snippet of code part which checks for clang based on
>> parameter "force" in test_llvm__fetch_bpf_obj:
>>=20
>> <<>>
>> if (!force && (!llvm_param.user_set_param &&
>> <<>>
>>=20
>> Since force is set to "false", test won't get skipped and
>> fails to compile test case. The BPF code compilation needs
>> clang, So pass the fourth argument as "false" and also skip
>> the test if reason for return is "TEST_SKIP"
>>=20
>> After the patch:
>>=20
>> <<>>
>> 42: BPF filter                    :
>> 42.1: Basic BPF filtering         : Skip
>> 42.2: BPF pinning                 : Skip
>> 42.3: BPF prologue generation     : Skip
>> <<>>
>=20
> Wouldn't it be better to add the reason for the skip, like other tests
> do?
>=20
> E.g.:
>=20
> 23: Watchpoint                                                      :
> 23.1: Read Only Watchpoint                                          : =
Skip (missing hardware support)
> 23.2: Write Only Watchpoint                                         : =
Ok
> 23.3: Read / Write Watchpoint                                       : =
Ok
> 23.4: Modify Watchpoint
>=20
> Something like:
>=20
> After the patch:
>=20
> <<>>
> 42: BPF filter                    :
> 42.1: Basic BPF filtering         : Skip (clang not installed)
> 42.2: BPF pinning                 : Skip (clang not installed)
> 42.3: BPF prologue generation     : Skip (clang not installed)


Hi Arnaldo,

I tried to use TEST_CASE_REASON("BPF pinning", bpf_pinning, "clang not =
installed")

The clang check is done in test_llvm__fetch_bpf_obj under some condition =
checks:

<<>>
         /*
         * Skip this test if user's .perfconfig doesn't set [llvm] =
section
         * and clang is not found in $PATH
         */
        if (!force && (!llvm_param.user_set_param &&
                       llvm__search_clang())) {
                pr_debug("No clang, skip this test\n");
                return TEST_SKIP;
        }
<<>>

But the reason for BPF skip could happen at other places also ie =
non-root user, bpf support checks from check_env.
So can't exactly print the skip reason to be clang since It could get =
skipped from other environment checks too. Any suggestions Arnaldo ?

Thanks
Athira

> <<>>
>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/bpf.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
>> index 57b9591f7cbb..ae62f01239e3 100644
>> --- a/tools/perf/tests/bpf.c
>> +++ b/tools/perf/tests/bpf.c
>> @@ -222,11 +222,11 @@ static int __test__bpf(int idx)
>>=20
>> 	ret =3D test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz,
>> 				       bpf_testcase_table[idx].prog_id,
>> -				       true, NULL);
>> +				       false, NULL);
>> 	if (ret !=3D TEST_OK || !obj_buf || !obj_buf_sz) {
>> 		pr_debug("Unable to get BPF object, %s\n",
>> 			 bpf_testcase_table[idx].msg_compile_fail);
>> -		if (idx =3D=3D 0)
>> +		if ((idx =3D=3D 0) || (ret =3D=3D TEST_SKIP))
>> 			return TEST_SKIP;
>> 		else
>> 			return TEST_FAIL;
>> --=20
>> 2.35.1
>=20
> --=20
>=20
> - Arnaldo

