Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A17BB7BF966
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 13:12:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=obMYYZIj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4YCr3xLcz3vbN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:12:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=obMYYZIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4W6z0r6Dz2xLN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 20:38:34 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39A9MUHx018159;
	Tue, 10 Oct 2023 09:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=acADwH9A7GarsaoP7iPa74Ss1CTM+rEwAywYefiGO8Q=;
 b=obMYYZIjSmtXa3Z5O6PU3ppmLE2bd0V6qDNuaCK+WKYOYJWkTXYX5+HuLhtdgjv5MbRB
 Ivt5HXj54oJ7rLtig83/wq3Mdc13E8qLVkYyKYBzPf5RttLp4Y0zqAS7DRUrmi6w4w6D
 4MaiL8ATkEvjYCxUE0xzbQnV1kcNSe6K0miamVwPAm/hceQ96nkw2nK10uuvHKEwR+2E
 WZwS/VrKovY3cRaWGAD2AnZ73hMBWyeGQBzCLXPBatE8WCvkdhxqc9i1LnIwKFGd1szF
 jycIL42Va9fRLbIyaPFxGCUFkFeM3VlmWX1FK4izrHhGrmIlnlLS5MgwdwkYWEqQyu9s XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn3ta8gs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 09:38:27 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39A9cBiS009187;
	Tue, 10 Oct 2023 09:38:26 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn3ta8gpv-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 09:38:26 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39A8U5eu000643;
	Tue, 10 Oct 2023 09:13:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5kf3r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 09:13:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39A9DBWl15532776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Oct 2023 09:13:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A128020043;
	Tue, 10 Oct 2023 09:13:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B67AA20040;
	Tue, 10 Oct 2023 09:13:09 +0000 (GMT)
Received: from [9.109.252.67] (unknown [9.109.252.67])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Oct 2023 09:13:09 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------xuGAkCJgd4qHhE7vX0DJgOuW"
Message-ID: <a5465409-fcd4-3400-c0a6-ae52fed86143@linux.ibm.com>
Date: Tue, 10 Oct 2023 14:43:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] tools/perf/arch/powerpc: Fix the CPU ID const char* value
 by adding 0x prefix
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
References: <20231009050052.64935-1-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20231009050052.64935-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W6pA2NaZNXF_iTMPNF9HnPzH-0OHmnnE
X-Proofpoint-GUID: rqWE5jwD7_fYvqq2nNi_SybqTZKunEjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100072
X-Mailman-Approved-At: Tue, 10 Oct 2023 22:11:22 +1100
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
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------xuGAkCJgd4qHhE7vX0DJgOuW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/23 10:30 am, Athira Rajeev wrote:

> Simple expression parser test fails in powerpc as below:
>
>      4: Simple expression parser
>      test child forked, pid 170385
>      Using CPUID 004e2102
>      division by zero
>      syntax error
>      syntax error
>      FAILED tests/expr.c:65 parse test failed
>      test child finished with -1
>      Simple expression parser: FAILED!
>
> This is observed after commit:
> 'commit 9d5da30e4ae9 ("perf jevents: Add a new expression builtin strcmp_cpuid_str()")'
>
> With this commit, a new expression builtin strcmp_cpuid_str
> got added. This function takes an 'ID' type value, which is
> a string. So expression parse for strcmp_cpuid_str expects
> const char * as cpuid value type. In case of powerpc, CPU IDs
> are numbers. Hence it doesn't get interpreted correctly by
> bison parser. Example in case of power9, cpuid string returns
> as: 004e2102
>
> cpuid of string type is expected in two cases:
> 1. char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
>
>     Testcase "tests/expr.c" uses "perf_pmu__getcpuid" which calls
>     get_cpuid_str to get the cpuid string.
>
> 2. cpuid field in  :struct pmu_events_map
>
>     struct pmu_events_map {
>             const char *arch;
> 	   const char *cpuid;
>
>     Here cpuid field is used in "perf_pmu__find_events_table"
>     function as "strcmp_cpuid_str(map->cpuid, cpuid)". The
>     value for cpuid field is picked from mapfile.csv.
>
> Fix the mapfile.csv and get_cpuid_str function to prefix
> cpuid with 0x so that it gets correctly interpreted by
> the bison parser
>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

Tested the patch on Power10 machine, now its correctly able to interpret cpuid
value and perf Simple expression parser test passed.

# ./perf test -v 7
   7: Simple expression parser                                        :
--- start ---
test child forked, pid 87922
Using CPUID 0x00800200
division by zero
syntax error
test child finished with 0
---- end ----
Simple expression parser: Ok

Tested-by: Disha Goel<disgoel@linux.ibm.com>

> ---
>   tools/perf/arch/powerpc/util/header.c          | 2 +-
>   tools/perf/pmu-events/arch/powerpc/mapfile.csv | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
> index c8d0dc775e5d..6b00efd53638 100644
> --- a/tools/perf/arch/powerpc/util/header.c
> +++ b/tools/perf/arch/powerpc/util/header.c
> @@ -34,7 +34,7 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
>   {
>   	char *bufp;
>
> -	if (asprintf(&bufp, "%.8lx", mfspr(SPRN_PVR)) < 0)
> +	if (asprintf(&bufp, "0x%.8lx", mfspr(SPRN_PVR)) < 0)
>   		bufp = NULL;
>
>   	return bufp;
> diff --git a/tools/perf/pmu-events/arch/powerpc/mapfile.csv b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> index a534ff6db14b..f4908af7ad66 100644
> --- a/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> @@ -13,6 +13,6 @@
>   #
>
>   # Power8 entries
> -004[bcd][[:xdigit:]]{4},1,power8,core
> -004e[[:xdigit:]]{4},1,power9,core
> -0080[[:xdigit:]]{4},1,power10,core
> +0x004[bcd][[:xdigit:]]{4},1,power8,core
> +0x004e[[:xdigit:]]{4},1,power9,core
> +0x0080[[:xdigit:]]{4},1,power10,core
--------------xuGAkCJgd4qHhE7vX0DJgOuW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 09/10/23 10:30 am, Athira Rajeev wrote:</pre>
    <blockquote type="cite"
      cite="mid:20231009050052.64935-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">Simple expression parser test fails in powerpc as below:

    4: Simple expression parser
    test child forked, pid 170385
    Using CPUID 004e2102
    division by zero
    syntax error
    syntax error
    FAILED tests/expr.c:65 parse test failed
    test child finished with -1
    Simple expression parser: FAILED!

This is observed after commit:
'commit 9d5da30e4ae9 ("perf jevents: Add a new expression builtin strcmp_cpuid_str()")'

With this commit, a new expression builtin strcmp_cpuid_str
got added. This function takes an 'ID' type value, which is
a string. So expression parse for strcmp_cpuid_str expects
const char * as cpuid value type. In case of powerpc, CPU IDs
are numbers. Hence it doesn't get interpreted correctly by
bison parser. Example in case of power9, cpuid string returns
as: 004e2102

cpuid of string type is expected in two cases:
1. char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);

   Testcase "tests/expr.c" uses "perf_pmu__getcpuid" which calls
   get_cpuid_str to get the cpuid string.

2. cpuid field in  :struct pmu_events_map

   struct pmu_events_map {
           const char *arch;
	   const char *cpuid;

   Here cpuid field is used in "perf_pmu__find_events_table"
   function as "strcmp_cpuid_str(map-&gt;cpuid, cpuid)". The
   value for cpuid field is picked from mapfile.csv.

Fix the mapfile.csv and get_cpuid_str function to prefix
cpuid with 0x so that it gets correctly interpreted by
the bison parser

Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested the patch on Power10 machine, now its correctly able to interpret cpuid
value and perf Simple expression parser test passed.

# ./perf test -v 7
  7: Simple expression parser                                        :
--- start ---
test child forked, pid 87922
Using CPUID 0x00800200
division by zero
syntax error
test child finished with 0
---- end ----
Simple expression parser: Ok

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20231009050052.64935-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 tools/perf/arch/powerpc/util/header.c          | 2 +-
 tools/perf/pmu-events/arch/powerpc/mapfile.csv | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index c8d0dc775e5d..6b00efd53638 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -34,7 +34,7 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
 {
 	char *bufp;

-	if (asprintf(&amp;bufp, "%.8lx", mfspr(SPRN_PVR)) &lt; 0)
+	if (asprintf(&amp;bufp, "0x%.8lx", mfspr(SPRN_PVR)) &lt; 0)
 		bufp = NULL;

 	return bufp;
diff --git a/tools/perf/pmu-events/arch/powerpc/mapfile.csv b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
index a534ff6db14b..f4908af7ad66 100644
--- a/tools/perf/pmu-events/arch/powerpc/mapfile.csv
+++ b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
@@ -13,6 +13,6 @@
 #

 # Power8 entries
-004[bcd][[:xdigit:]]{4},1,power8,core
-004e[[:xdigit:]]{4},1,power9,core
-0080[[:xdigit:]]{4},1,power10,core
+0x004[bcd][[:xdigit:]]{4},1,power8,core
+0x004e[[:xdigit:]]{4},1,power9,core
+0x0080[[:xdigit:]]{4},1,power10,core
</pre>
    </blockquote>
  </body>
</html>

--------------xuGAkCJgd4qHhE7vX0DJgOuW--

