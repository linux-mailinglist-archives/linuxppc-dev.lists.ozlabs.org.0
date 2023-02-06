Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB77F68C9C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9hLy4Ynlz3f24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 09:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c8liVFyS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c8liVFyS;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9LMh6pwYz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 20:20:32 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3168DI8C024505;
	Mon, 6 Feb 2023 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=o8Tv2+xvhzCcBR/7nYannhWnk/qke74s7gB0sDYwmWk=;
 b=c8liVFyS8Jd/Rkpie3ZoVyGYB6XeP7cp5vh3qF4XjhxQTKkAC7MYgQRSj/PnPAhvz2r9
 eWL/XIWTpwFbIPPPA0jK40LgivjekITUJrnt/D306sZZGPQdaMwsWSAT2OmtJh3Hk5xr
 Ia/zxEO8nqNyrTwCIVFjHKRgazZmgfSI4RenrP2ctZ7Ph/z2+tGT3NlEDIiDz1OYsOiD
 aAY2u6QIGy/sJcPA0vRBuyReDFASrfx9dBWRhZqke/GoJUd3cGP0mTHJK0tvVO1Nv75H
 vH14rvAEGXjLYBWsto+jchoiaguEsUo5Fopi/xX7+Kp6Jt6ViExQ9pq69fKvWogzzZ2N hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njwuf9m8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 09:20:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3168qOqI015748;
	Mon, 6 Feb 2023 09:20:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njwuf9m8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 09:20:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 315Nwwvu021077;
	Mon, 6 Feb 2023 09:20:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfj75m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 09:20:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3169KCbp44106206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 09:20:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B075A20043;
	Mon,  6 Feb 2023 09:20:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3567620040;
	Mon,  6 Feb 2023 09:20:10 +0000 (GMT)
Received: from [9.199.154.114] (unknown [9.199.154.114])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 09:20:10 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------1zIy9KG0T1F7VQTQPVedMU0P"
Message-ID: <8c53cd45-a8a8-c338-f9b0-3171ff55fff1@linux.ibm.com>
Date: Mon, 6 Feb 2023 14:50:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/bpf: Fix the bpf test to check for libtraceevent
 support
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org
References: <20230131135001.54578-1-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230131135001.54578-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wxEVIGbwr_F-poLozVxDbxT6CFbp0puF
X-Proofpoint-GUID: KK85Q76pldQRQ6kKgtsJ1CcteJ4Mx2kO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_04,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060079
X-Mailman-Approved-At: Tue, 07 Feb 2023 09:48:38 +1100
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------1zIy9KG0T1F7VQTQPVedMU0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/23 7:20 PM, Athira Rajeev wrote:

> "bpf" tests fails in environment with missing libtraceevent
> support as below:
>
>   # ./perf test 36
>   36: BPF filter                                                      :
>   36.1: Basic BPF filtering                                           : FAILED!
>   36.2: BPF pinning                                                   : FAILED!
>   36.3: BPF prologue generation                                       : FAILED!
>
> The environment has clang but missing the libtraceevent
> devel. Hence perf is compiled without libtraceevent support.
>
> Detailed logs:
> 	./perf test -v "Basic BPF filtering"
>
> 	Failed to add BPF event syscalls:sys_enter_epoll_pwait
> 	bpf: tracepoint call back failed, stop iterate
> 	Failed to add events selected by BPF
>
> The bpf tests tris to add probe event which fails
> at "parse_events_add_tracepoint" function due to missing
> libtraceevent. Add check for "HAVE_LIBTRACEEVENT" in the
> "tests/bpf.c" before proceeding with the test.
>
> With the change,
>
> 	# ./perf test 36
>   	36: BPF filter                                                      :
>   	36.1: Basic BPF filtering                                           : Skip (not compiled in or missing libtraceevent support)
>   	36.2: BPF pinning                                                   : Skip (not compiled in or missing libtraceevent support)
>   	36.3: BPF prologue generation                                       : Skip (not compiled in or missing libtraceevent support)
>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

Tested the patch on powerpc, perf bpf test skips when libtraceevent-devel package is not installed.

  36: BPF filter                                                      :
  36.1: Basic BPF filtering                                           : Skip (not compiled in or missing libtraceevent support)
  36.2: BPF pinning                                                   : Skip (not compiled in or missing libtraceevent support)
  36.3: BPF prologue generation                                       : Skip (not compiled in or missing libtraceevent support)

Tested-by: Disha Goel<disgoel@linux.ibm.com>

> ---
>   tools/perf/tests/bpf.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> index 17c023823713..4af39528f611 100644
> --- a/tools/perf/tests/bpf.c
> +++ b/tools/perf/tests/bpf.c
> @@ -23,7 +23,7 @@
>   #define NR_ITERS       111
>   #define PERF_TEST_BPF_PATH "/sys/fs/bpf/perf_test"
>   
> -#ifdef HAVE_LIBBPF_SUPPORT
> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>   #include <linux/bpf.h>
>   #include <bpf/bpf.h>
>   
> @@ -330,10 +330,10 @@ static int test__bpf(int i)
>   static int test__basic_bpf_test(struct test_suite *test __maybe_unused,
>   				int subtest __maybe_unused)
>   {
> -#ifdef HAVE_LIBBPF_SUPPORT
> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>   	return test__bpf(0);
>   #else
> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
> +	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
>   	return TEST_SKIP;
>   #endif
>   }
> @@ -341,10 +341,10 @@ static int test__basic_bpf_test(struct test_suite *test __maybe_unused,
>   static int test__bpf_pinning(struct test_suite *test __maybe_unused,
>   			     int subtest __maybe_unused)
>   {
> -#ifdef HAVE_LIBBPF_SUPPORT
> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>   	return test__bpf(1);
>   #else
> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
> +	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
>   	return TEST_SKIP;
>   #endif
>   }
> @@ -352,17 +352,17 @@ static int test__bpf_pinning(struct test_suite *test __maybe_unused,
>   static int test__bpf_prologue_test(struct test_suite *test __maybe_unused,
>   				   int subtest __maybe_unused)
>   {
> -#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE)
> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE) && defined(HAVE_LIBTRACEEVENT)
>   	return test__bpf(2);
>   #else
> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
> +	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
>   	return TEST_SKIP;
>   #endif
>   }
>   
>   
>   static struct test_case bpf_tests[] = {
> -#ifdef HAVE_LIBBPF_SUPPORT
> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
>   	TEST_CASE("Basic BPF filtering", basic_bpf_test),
>   	TEST_CASE_REASON("BPF pinning", bpf_pinning,
>   			"clang isn't installed or environment missing BPF support"),
> @@ -373,9 +373,9 @@ static struct test_case bpf_tests[] = {
>   	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
>   #endif
>   #else
> -	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not compiled in"),
> -	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in"),
> -	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
> +	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not compiled in or missing libtraceevent support"),
> +	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in or missing libtraceevent support"),
> +	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in or missing libtraceevent support"),
>   #endif
>   	{ .name = NULL, }
>   };
--------------1zIy9KG0T1F7VQTQPVedMU0P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 1/31/23 7:20 PM, Athira Rajeev wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20230131135001.54578-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">"bpf" tests fails in environment with missing libtraceevent
support as below:

 # ./perf test 36
 36: BPF filter                                                      :
 36.1: Basic BPF filtering                                           : FAILED!
 36.2: BPF pinning                                                   : FAILED!
 36.3: BPF prologue generation                                       : FAILED!

The environment has clang but missing the libtraceevent
devel. Hence perf is compiled without libtraceevent support.

Detailed logs:
	./perf test -v "Basic BPF filtering"

	Failed to add BPF event syscalls:sys_enter_epoll_pwait
	bpf: tracepoint call back failed, stop iterate
	Failed to add events selected by BPF

The bpf tests tris to add probe event which fails
at "parse_events_add_tracepoint" function due to missing
libtraceevent. Add check for "HAVE_LIBTRACEEVENT" in the
"tests/bpf.c" before proceeding with the test.

With the change,

	# ./perf test 36
 	36: BPF filter                                                      :
 	36.1: Basic BPF filtering                                           : Skip (not compiled in or missing libtraceevent support)
 	36.2: BPF pinning                                                   : Skip (not compiled in or missing libtraceevent support)
 	36.3: BPF prologue generation                                       : Skip (not compiled in or missing libtraceevent support)

Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested the patch on powerpc, perf bpf test skips when libtraceevent-devel package is not installed.

 36: BPF filter                                                      :
 36.1: Basic BPF filtering                                           : Skip (not compiled in or missing libtraceevent support)
 36.2: BPF pinning                                                   : Skip (not compiled in or missing libtraceevent support)
 36.3: BPF prologue generation                                       : Skip (not compiled in or missing libtraceevent support)

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20230131135001.54578-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 tools/perf/tests/bpf.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
index 17c023823713..4af39528f611 100644
--- a/tools/perf/tests/bpf.c
+++ b/tools/perf/tests/bpf.c
@@ -23,7 +23,7 @@
 #define NR_ITERS       111
 #define PERF_TEST_BPF_PATH "/sys/fs/bpf/perf_test"
 
-#ifdef HAVE_LIBBPF_SUPPORT
+#if defined(HAVE_LIBBPF_SUPPORT) &amp;&amp; defined(HAVE_LIBTRACEEVENT)
 #include &lt;linux/bpf.h&gt;
 #include &lt;bpf/bpf.h&gt;
 
@@ -330,10 +330,10 @@ static int test__bpf(int i)
 static int test__basic_bpf_test(struct test_suite *test __maybe_unused,
 				int subtest __maybe_unused)
 {
-#ifdef HAVE_LIBBPF_SUPPORT
+#if defined(HAVE_LIBBPF_SUPPORT) &amp;&amp; defined(HAVE_LIBTRACEEVENT)
 	return test__bpf(0);
 #else
-	pr_debug("Skip BPF test because BPF support is not compiled\n");
+	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
 	return TEST_SKIP;
 #endif
 }
@@ -341,10 +341,10 @@ static int test__basic_bpf_test(struct test_suite *test __maybe_unused,
 static int test__bpf_pinning(struct test_suite *test __maybe_unused,
 			     int subtest __maybe_unused)
 {
-#ifdef HAVE_LIBBPF_SUPPORT
+#if defined(HAVE_LIBBPF_SUPPORT) &amp;&amp; defined(HAVE_LIBTRACEEVENT)
 	return test__bpf(1);
 #else
-	pr_debug("Skip BPF test because BPF support is not compiled\n");
+	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
 	return TEST_SKIP;
 #endif
 }
@@ -352,17 +352,17 @@ static int test__bpf_pinning(struct test_suite *test __maybe_unused,
 static int test__bpf_prologue_test(struct test_suite *test __maybe_unused,
 				   int subtest __maybe_unused)
 {
-#if defined(HAVE_LIBBPF_SUPPORT) &amp;&amp; defined(HAVE_BPF_PROLOGUE)
+#if defined(HAVE_LIBBPF_SUPPORT) &amp;&amp; defined(HAVE_BPF_PROLOGUE) &amp;&amp; defined(HAVE_LIBTRACEEVENT)
 	return test__bpf(2);
 #else
-	pr_debug("Skip BPF test because BPF support is not compiled\n");
+	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
 	return TEST_SKIP;
 #endif
 }
 
 
 static struct test_case bpf_tests[] = {
-#ifdef HAVE_LIBBPF_SUPPORT
+#if defined(HAVE_LIBBPF_SUPPORT) &amp;&amp; defined(HAVE_LIBTRACEEVENT)
 	TEST_CASE("Basic BPF filtering", basic_bpf_test),
 	TEST_CASE_REASON("BPF pinning", bpf_pinning,
 			"clang isn't installed or environment missing BPF support"),
@@ -373,9 +373,9 @@ static struct test_case bpf_tests[] = {
 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
 #endif
 #else
-	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not compiled in"),
-	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in"),
-	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
+	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not compiled in or missing libtraceevent support"),
+	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in or missing libtraceevent support"),
+	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in or missing libtraceevent support"),
 #endif
 	{ .name = NULL, }
 };
</pre>
    </blockquote>
  </body>
</html>

--------------1zIy9KG0T1F7VQTQPVedMU0P--

