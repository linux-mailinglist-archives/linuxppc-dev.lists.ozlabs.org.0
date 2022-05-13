Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B93525C62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 09:35:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L00mf0mnwz3cB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 17:35:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FIP9JuP8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FIP9JuP8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kzz2547f3z3bcl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 16:17:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D5sx32015574;
 Fri, 13 May 2022 06:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version; s=pp1; bh=6+yXdS6eVcyJGbCiP5+kjgbSd9XRmFUTLOwTAtemUz0=;
 b=FIP9JuP8wR3gHr6ggNfeD3lMAnJqbh80iFfLOoHaC9czVYPNFtdJuf9JWkLyx2JApvdc
 y6oflayP88NG7yecHAstGh4AnWdev0ltx72kEyXr8e4+fxDMUyHkbjJ1XJDhMNeYdDIN
 2rccWPSMPgsOfmhD5XxZwUXmJyWMlMPYwWrJmz/eFN5gaSuScTQlmOT5bQ+hJxPVUiQ1
 0z5+/5TDZNveBkGUXyf0SQvm2qRUVL6ANJ6+RaB4Q3OtnGUPUeAcNB4kLYOxg9dXAKu5
 D7Je3x1r9FDEyPWQu+dA7C0jh/dwM+OA8MV28tB4msdKvfFowIL8esvJvnySyM/WJSIP IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1hkkga66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 06:16:49 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24D6Gm0j030358;
 Fri, 13 May 2022 06:16:49 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1hkkga5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 06:16:48 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24D6Cnx0029418;
 Fri, 13 May 2022 06:16:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3fwgd8xaf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 06:16:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24D6GhhV46858554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 06:16:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D52A5204F;
 Fri, 13 May 2022 06:16:43 +0000 (GMT)
Received: from disgoel-ibm-com (unknown [9.43.101.217])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7AE7852052;
 Fri, 13 May 2022 06:16:38 +0000 (GMT)
Message-ID: <be9726bc462d3b00243bd2161fb8e153b919db1e.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is not
 present
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Date: Fri, 13 May 2022 11:46:35 +0530
In-Reply-To: <20220511115438.84032-1-atrajeev@linux.vnet.ibm.com>
References: <20220511115438.84032-1-atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="=-3ZFZPBxqyflu7pwIdHPI"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eup-Zb6diYrZY1AROC0CUjUlzl9qyKar
X-Proofpoint-GUID: wejpQphAMq20DqqwPXmZ4hvyuqkg3HEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_02,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 mlxscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205130026
X-Mailman-Approved-At: Fri, 13 May 2022 17:34:55 +1000
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
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-3ZFZPBxqyflu7pwIdHPI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, 
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, 
rnsastry@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
, irogers@google.com
Subject: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is
not present
Date: Wed, 11 May 2022 17:24:38 +0530

Perf BPF filter test fails in environment where "clang"is not
installed.
Test failure logs:
<<>> 42: BPF filter                    : 42.1: Basic BPF
filtering         : Skip 42.2: BPF pinning                 : FAILED!
42.3: BPF prologue generation     : FAILED!<<>>
Enabling verbose option provided debug logs which saysclang/llvm needs
to be installed. Snippet of verbose logs:
<<>> 42.2: BPF pinning                  : --- start ---test child
forked, pid 61423ERROR:	unable to find clang.Hint:	Try to install
latest clang/llvm to support BPF.        Check your $PATH
<<logs_here>>
Failed to compile test case: 'Basic BPF llvm compile'Unable to get BPF
object, fix kbuild firsttest child finished with -1 ---- end ----BPF
filter subtest 2: FAILED!<<>>
Here subtests, "BPF pinning" and "BPF prologue generation"failed and
logs shows clang/llvm is needed. After installingclang, testcase
passes.
Reason on why subtest failure happens though logs has properdebug
information:Main function __test__bpf calls test_llvm__fetch_bpf_obj
bypassing 4th argument as true ( 4th arguments maps to parameter"force"
in test_llvm__fetch_bpf_obj ). But this will
causetest_llvm__fetch_bpf_obj to skip the check for clang/llvm.
Snippet of code part which checks for clang based onparameter "force"
in test_llvm__fetch_bpf_obj:
<<>>if (!force && (!llvm_param.user_set_param &&<<>>
Since force is set to "false", test won't get skipped andfails to
compile test case. The BPF code compilation needsclang, So pass the
fourth argument as "false" and also skipthe test if reason for return
is "TEST_SKIP"
After the patch:
<<>> 42: BPF filter                    : 42.1: Basic BPF
filtering         : Skip 42.2: BPF pinning                 : Skip 42.3:
BPF prologue generation     : Skip<<>>
Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")Signed-off-by:
Athira Rajeev <atrajeev@linux.vnet.ibm.com>---Changelog: Addressed
review comments from Arnaldo by adding reason for skipping of testcase.
 tools/perf/tests/bpf.c | 10 ++++++---- 1 file changed, 6
insertions(+), 4 deletions(-)
Tested the patch on powerpc and powernv, perf BPF test works fine with
the patch.Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.cindex
57b9591f7cbb..17c023823713 100644--- a/tools/perf/tests/bpf.c+++
b/tools/perf/tests/bpf.c@@ -222,11 +222,11 @@ static int
__test__bpf(int idx)
 	ret = test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz, 		
		       bpf_testcase_table[idx].prog_id,-		
		       true, NULL);+				       
false, NULL); 	if (ret != TEST_OK || !obj_buf || !obj_buf_sz) { 	
	pr_debug("Unable to get BPF object, %s\n", 			
 bpf_testcase_table[idx].msg_compile_fail);-		if (idx == 0)+	
	if ((idx == 0) || (ret == TEST_SKIP)) 			return
TEST_SKIP; 		else 			return TEST_FAIL;@@
-364,9 +364,11 @@ static int test__bpf_prologue_test(struct test_suite
*test __maybe_unused, static struct test_case bpf_tests[] = { #ifdef
HAVE_LIBBPF_SUPPORT 	TEST_CASE("Basic BPF filtering",
basic_bpf_test),-	TEST_CASE("BPF pinning", bpf_pinning),+	TEST_CA
SE_REASON("BPF pinning", bpf_pinning,+			"clang isn't
installed or environment missing BPF support"), #ifdef
HAVE_BPF_PROLOGUE-	TEST_CASE("BPF prologue generation",
bpf_prologue_test),+	TEST_CASE_REASON("BPF prologue generation",
bpf_prologue_test,+			"clang isn't installed or
environment missing BPF support"), #else 	TEST_CASE_REASON("BPF
prologue generation", bpf_prologue_test, "not compiled in"), #endif

--=-3ZFZPBxqyflu7pwIdHPI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div><br></div><div><br></div><div>-----Original Message-----</div><div=
><b>From</b>: Athira Rajeev &lt;<a href=3D"mailto:Athira%20Rajeev%20%3catra=
jeev@linux.vnet.ibm.com%3e">atrajeev@linux.vnet.ibm.com</a>&gt;</div><div><=
b>To</b>: <a href=3D"mailto:acme@kernel.org">acme@kernel.org</a>, <a href=
=3D"mailto:jolsa@kernel.org">jolsa@kernel.org</a></div><div><b>Cc</b>: <a h=
ref=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>, <a href=3D"mailto=
:linux-perf-users@vger.kernel.org">linux-perf-users@vger.kernel.org</a>, <a=
 href=3D"mailto:linuxppc-dev@lists.ozlabs.org">linuxppc-dev@lists.ozlabs.or=
g</a>, <a href=3D"mailto:maddy@linux.vnet.ibm.com">maddy@linux.vnet.ibm.com=
</a>, <a href=3D"mailto:rnsastry@linux.ibm.com">rnsastry@linux.ibm.com</a>,=
 <a href=3D"mailto:kjain@linux.ibm.com">kjain@linux.ibm.com</a>, <a href=3D=
"mailto:disgoel@linux.vnet.ibm.com">disgoel@linux.vnet.ibm.com</a>, <a href=
=3D"mailto:irogers@google.com">irogers@google.com</a></div><div><b>Subject<=
/b>: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is not presen=
t</div><div><b>Date</b>: Wed, 11 May 2022 17:24:38 +0530</div><div><br></di=
v><pre>Perf BPF filter test fails in environment where "clang"</pre><pre>is=
 not installed.</pre><pre><br></pre><pre>Test failure logs:</pre><pre><br><=
/pre><pre>&lt;&lt;&gt;&gt;</pre><pre> 42: BPF filter                    :</=
pre><pre> 42.1: Basic BPF filtering         : Skip</pre><pre> 42.2: BPF pin=
ning                 : FAILED!</pre><pre> 42.3: BPF prologue generation    =
 : FAILED!</pre><pre>&lt;&lt;&gt;&gt;</pre><pre><br></pre><pre>Enabling ver=
bose option provided debug logs which says</pre><pre>clang/llvm needs to be=
 installed. Snippet of verbose logs:</pre><pre><br></pre><pre>&lt;&lt;&gt;&=
gt;</pre><pre> 42.2: BPF pinning                  :</pre><pre> --- start --=
-</pre><pre>test child forked, pid 61423</pre><pre>ERROR:	unable to find cl=
ang.</pre><pre>Hint:	Try to install latest clang/llvm to support BPF.</pre>=
<pre>        Check your $PATH</pre><pre><br></pre><pre>&lt;&lt;logs_here&gt=
;&gt;</pre><pre><br></pre><pre>Failed to compile test case: 'Basic BPF llvm=
 compile'</pre><pre>Unable to get BPF object, fix kbuild first</pre><pre>te=
st child finished with -1</pre><pre> ---- end ----</pre><pre>BPF filter sub=
test 2: FAILED!</pre><pre>&lt;&lt;&gt;&gt;</pre><pre><br></pre><pre>Here su=
btests, "BPF pinning" and "BPF prologue generation"</pre><pre>failed and lo=
gs shows clang/llvm is needed. After installing</pre><pre>clang, testcase p=
asses.</pre><pre><br></pre><pre>Reason on why subtest failure happens thoug=
h logs has proper</pre><pre>debug information:</pre><pre>Main function __te=
st__bpf calls test_llvm__fetch_bpf_obj by</pre><pre>passing 4th argument as=
 true ( 4th arguments maps to parameter</pre><pre>"force" in test_llvm__fet=
ch_bpf_obj ). But this will cause</pre><pre>test_llvm__fetch_bpf_obj to ski=
p the check for clang/llvm.</pre><pre><br></pre><pre>Snippet of code part w=
hich checks for clang based on</pre><pre>parameter "force" in test_llvm__fe=
tch_bpf_obj:</pre><pre><br></pre><pre>&lt;&lt;&gt;&gt;</pre><pre>if (!force=
 &amp;&amp; (!llvm_param.user_set_param &amp;&amp;</pre><pre>&lt;&lt;&gt;&g=
t;</pre><pre><br></pre><pre>Since force is set to "false", test won't get s=
kipped and</pre><pre>fails to compile test case. The BPF code compilation n=
eeds</pre><pre>clang, So pass the fourth argument as "false" and also skip<=
/pre><pre>the test if reason for return is "TEST_SKIP"</pre><pre><br></pre>=
<pre>After the patch:</pre><pre><br></pre><pre>&lt;&lt;&gt;&gt;</pre><pre> =
42: BPF filter                    :</pre><pre> 42.1: Basic BPF filtering   =
      : Skip</pre><pre> 42.2: BPF pinning                 : Skip</pre><pre>=
 42.3: BPF prologue generation     : Skip</pre><pre>&lt;&lt;&gt;&gt;</pre><=
pre><br></pre><pre>Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")</=
pre><pre>Signed-off-by: Athira Rajeev &lt;</pre><a href=3D"mailto:atrajeev@=
linux.vnet.ibm.com"><pre>atrajeev@linux.vnet.ibm.com</pre></a><pre>&gt;</pr=
e><pre>---</pre><pre>Changelog:</pre><pre> Addressed review comments from A=
rnaldo by adding</pre><pre> reason for skipping of testcase.</pre><pre><br>=
</pre><pre> tools/perf/tests/bpf.c | 10 ++++++----</pre><pre> 1 file change=
d, 6 insertions(+), 4 deletions(-)</pre><pre><br></pre><pre style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Tested the patch on powerpc and =
powernv, perf BPF test works fine with the patch.</pre><pre style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Tested-by: Disha Goel &lt;<a hre=
f=3D"mailto:disgoel@linux.vnet.ibm.com"></a><a href=3D"mailto:disgoel@linux=
.vnet.ibm.com">disgoel@linux.vnet.ibm.com</a>&gt;</pre><pre><br></pre><pre>=
diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c</pre><pre>inde=
x 57b9591f7cbb..17c023823713 100644</pre><pre>--- a/tools/perf/tests/bpf.c<=
/pre><pre>+++ b/tools/perf/tests/bpf.c</pre><pre>@@ -222,11 +222,11 @@ stat=
ic int __test__bpf(int idx)</pre><pre><br></pre><pre> 	ret =3D test_llvm__f=
etch_bpf_obj(&amp;obj_buf, &amp;obj_buf_sz,</pre><pre> 				       bpf_testc=
ase_table[idx].prog_id,</pre><pre>-				       true, NULL);</pre><pre>+				 =
      false, NULL);</pre><pre> 	if (ret !=3D TEST_OK || !obj_buf || !obj_bu=
f_sz) {</pre><pre> 		pr_debug("Unable to get BPF object, %s\n",</pre><pre> =
			 bpf_testcase_table[idx].msg_compile_fail);</pre><pre>-		if (idx =3D=3D =
0)</pre><pre>+		if ((idx =3D=3D 0) || (ret =3D=3D TEST_SKIP))</pre><pre> 		=
	return TEST_SKIP;</pre><pre> 		else</pre><pre> 			return TEST_FAIL;</pre><=
pre>@@ -364,9 +364,11 @@ static int test__bpf_prologue_test(struct test_sui=
te *test __maybe_unused,</pre><pre> static struct test_case bpf_tests[] =3D=
 {</pre><pre> #ifdef HAVE_LIBBPF_SUPPORT</pre><pre> 	TEST_CASE("Basic BPF f=
iltering", basic_bpf_test),</pre><pre>-	TEST_CASE("BPF pinning", bpf_pinnin=
g),</pre><pre>+	TEST_CASE_REASON("BPF pinning", bpf_pinning,</pre><pre>+			=
"clang isn't installed or environment missing BPF support"),</pre><pre> #if=
def HAVE_BPF_PROLOGUE</pre><pre>-	TEST_CASE("BPF prologue generation", bpf_=
prologue_test),</pre><pre>+	TEST_CASE_REASON("BPF prologue generation", bpf=
_prologue_test,</pre><pre>+			"clang isn't installed or environment missing=
 BPF support"),</pre><pre> #else</pre><pre> 	TEST_CASE_REASON("BPF prologue=
 generation", bpf_prologue_test, "not compiled in"),</pre><pre> #endif</pre=
></body></html>

--=-3ZFZPBxqyflu7pwIdHPI--

