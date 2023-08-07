Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDF77330C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 00:45:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9rZnvX0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKWcB50T2z2yq4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 08:45:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9rZnvX0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKJy20P8yz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 00:44:57 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 377EZjtb026606;
	Mon, 7 Aug 2023 14:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=Eb5kwFvNXU8HiGvCsL/s6MCAedP32iQREK//ArJgNQk=;
 b=U9rZnvX0FDhLgD0F+EE3Q10rMImGOdqy3dehsgjcXnVC1nPcifHqCo3KkMVuVFIXKrHR
 q9q3iB5txPzVsG0HPJW264gD7fBiuaTV4UXOZGYtLXn29C4SWUtHbEtZyv6d3WwmnW3Z
 F1GXOMn6zpwe/ZzqtMhAb/N2+I1sfkbuy078BD6p20e6A6JXnfabeveoLZexD+A0/S2t
 /qKlYIL/Vb0kZ/+SqzNq5yCiu379Djs+R9jNpkQ0X69QxedagfUPYhd6IV8RSjsmhuEZ
 xrrwRLyuzUl/Lo59HjtUXHeqIkrIiQwGqbHmUBDzvzE/9YgDy14J5yjOvpb90CpaIrfO 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sb2gy89qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 14:44:52 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 377EaZR0028387;
	Mon, 7 Aug 2023 14:44:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sb2gy89q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 14:44:51 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 377EP6DB007543;
	Mon, 7 Aug 2023 14:44:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa14xx6hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 14:44:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 377Eilxl23134768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 14:44:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5F3920043;
	Mon,  7 Aug 2023 14:44:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DF5920040;
	Mon,  7 Aug 2023 14:44:41 +0000 (GMT)
Received: from [9.43.126.71] (unknown [9.43.126.71])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Aug 2023 14:44:41 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------acASeTX2WxS07cjvVeicc047"
Message-ID: <3c0eb25b-a51b-edba-82ea-22e6d2b07978@linux.ibm.com>
Date: Mon, 7 Aug 2023 20:14:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH V2 2/2] tools/perf/tests: perf all metricgroups test fails
 when perf_event access is restricted
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230804050047.94240-1-atrajeev@linux.vnet.ibm.com>
 <20230804050047.94240-2-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230804050047.94240-2-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o6DtWHavgpd8aHQwSRdbyCxnauOKrNrL
X-Proofpoint-ORIG-GUID: SqLfUQguxzjOUIsYXiCNVMZTwpPU-zp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_14,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070135
X-Mailman-Approved-At: Tue, 08 Aug 2023 08:44:09 +1000
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
--------------acASeTX2WxS07cjvVeicc047
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/23 10:30 am, Athira Rajeev wrote:
> Perf all metricgroups test fails as below when perf_event access
> is restricted.
>
>      ./perf test -v "perf all metricgroups test"
>      Testing Memory_BW
>      Error:
>      Access to performance monitoring and observability operations is limited.
>      Enforced MAC policy settings (SELinux) can limit access to performance
>      access to performance monitoring and observability operations for processes
>      without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capability.
>
>      test child finished with -1
>      ---- end ----
>      perf all metricgroups test: FAILED!
>
> Fix the testcase to skip those metric events which needs perf_event access
> explicitly. The exit code of the testcase is based on return code of
> the perf stat command ( enabled by set -e option ). Hence save the
> exit status in a variable and use that to decide success or fail for the
> testcase.
>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

With this patch applied(on power) perf metricgroups test works correctly when perf_event access is restricted.

  # ./perf test "perf all metricgroups test"
  96: perf all metricgroups test                                      : Ok

Tested-by: Disha Goel<disgoel@linux.ibm.com>

> ---
> Changelog:
> v1 -> v2:
>   Changed the condition to use "echo" and "grep" so it works on
>   Posix shell as well.
>
>   tools/perf/tests/shell/stat_all_metricgroups.sh | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/tests/shell/stat_all_metricgroups.sh b/tools/perf/tests/shell/stat_all_metricgroups.sh
> index cb35e488809a..eaa5e1172294 100755
> --- a/tools/perf/tests/shell/stat_all_metricgroups.sh
> +++ b/tools/perf/tests/shell/stat_all_metricgroups.sh
> @@ -2,11 +2,19 @@
>   # perf all metricgroups test
>   # SPDX-License-Identifier: GPL-2.0
>
> -set -e
> -
>   for m in $(perf list --raw-dump metricgroups); do
>     echo "Testing $m"
> -  perf stat -M "$m" -a true
> +  result=$(perf stat -M "$m" -a true 2>&1)
> +  rc=$?
> +  # Skip if there is no access to perf_events monitoring
> +  # Otherwise exit based on the return code of perf comamnd.
> +  if echo "$result" | grep -q "Access to performance monitoring and observability operations is limited";
> +  then
> +      continue
> +  else
> +      [ $rc -ne 0 ] && exit $rc
> +  fi
> +
>   done
>
>   exit 0
--------------acASeTX2WxS07cjvVeicc047
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 04/08/23 10:30 am, Athira Rajeev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230804050047.94240-2-atrajeev@linux.vnet.ibm.com">
      <pre>Perf all metricgroups test fails as below when perf_event access
is restricted.

    ./perf test -v "perf all metricgroups test"
    Testing Memory_BW
    Error:
    Access to performance monitoring and observability operations is limited.
    Enforced MAC policy settings (SELinux) can limit access to performance
    access to performance monitoring and observability operations for processes
    without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capability.

    test child finished with -1
    ---- end ----
    perf all metricgroups test: FAILED!

Fix the testcase to skip those metric events which needs perf_event access
explicitly. The exit code of the testcase is based on return code of
the perf stat command ( enabled by set -e option ). Hence save the
exit status in a variable and use that to decide success or fail for the
testcase.

Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>
With this patch applied(on power) perf metricgroups test works correctly when perf_event access is restricted.

 # ./perf test "perf all metricgroups test"
 96: perf all metricgroups test                                      : Ok

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:sachinp@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20230804050047.94240-2-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
Changelog:
v1 -&gt; v2:
 Changed the condition to use "echo" and "grep" so it works on
 Posix shell as well.

 tools/perf/tests/shell/stat_all_metricgroups.sh | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/stat_all_metricgroups.sh b/tools/perf/tests/shell/stat_all_metricgroups.sh
index cb35e488809a..eaa5e1172294 100755
--- a/tools/perf/tests/shell/stat_all_metricgroups.sh
+++ b/tools/perf/tests/shell/stat_all_metricgroups.sh
@@ -2,11 +2,19 @@
 # perf all metricgroups test
 # SPDX-License-Identifier: GPL-2.0

-set -e
-
 for m in $(perf list --raw-dump metricgroups); do
   echo "Testing $m"
-  perf stat -M "$m" -a true
+  result=$(perf stat -M "$m" -a true 2&gt;&amp;1)
+  rc=$?
+  # Skip if there is no access to perf_events monitoring
+  # Otherwise exit based on the return code of perf comamnd.
+  if echo "$result" | grep -q "Access to performance monitoring and observability operations is limited";
+  then
+      continue
+  else
+      [ $rc -ne 0 ] &amp;&amp; exit $rc
+  fi
+
 done

 exit 0
</pre>
    </blockquote>
  </body>
</html>

--------------acASeTX2WxS07cjvVeicc047--

