Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36568C9C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9hKw2dhsz3f5v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 09:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gEpbTfBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gEpbTfBo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Jlg0c1Fz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 19:07:42 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3167g5Wo020292;
	Mon, 6 Feb 2023 08:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=GfbWXRddK/dA/8X0v5Mm0otbMwRwl3SN1QSYuNkBpro=;
 b=gEpbTfBoZU4TZG9kTtuf+SszbzNOYNVTH4dRAT1tsXJaIUhpWe4dTdR1yuLN8NL2+E7u
 6LeYBOPtLS8UMtunhxjt0SEjm48Ib7lRbfv2oQxpDMaXO7tDeShxI37+S6CyuRiQY/tS
 SxOvdABvKAOLgw2AfsWBoZcFcV3wSM9q9EjPfqEcnRuzMATvuNBwztwY87PkuYfIfGTt
 ruiCBegMDZkH8KK3cpx5yzOxULtyvetMBjKn7/OhalcunknjUDvfwcNcOIVEMjWvFg2i
 /3X/vIw4yjab4k6ocmP5wHw1CKe3Gp7LIVEF6wdAzpzM7KMv0BUxbwZRZtZblZMVMKqZ Ug== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njwcu0jvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 08:07:37 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 315IPRdD003647;
	Mon, 6 Feb 2023 08:07:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nhf06sgt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 08:07:34 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31687UVB47513930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 08:07:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52D602004D;
	Mon,  6 Feb 2023 08:07:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2D3C2004B;
	Mon,  6 Feb 2023 08:07:28 +0000 (GMT)
Received: from [9.199.154.114] (unknown [9.199.154.114])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 08:07:28 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------px1YW5158wekMbG3gynQ3g0D"
Message-ID: <341ba49e-6589-ff47-d54b-dfb4fd301ba0@linux.ibm.com>
Date: Mon, 6 Feb 2023 13:37:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/perf/tests: Add system wide check for perf bench
 workload in all metric test
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org
References: <20230202164413.56743-1-kjain@linux.ibm.com>
Content-Language: en-US
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230202164413.56743-1-kjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -WYZ61sbXrbSSci8Xj2Ti5wTxc27Fx7q
X-Proofpoint-GUID: -WYZ61sbXrbSSci8Xj2Ti5wTxc27Fx7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_03,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060069
X-Mailman-Approved-At: Tue, 07 Feb 2023 09:48:37 +1100
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
Cc: linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------px1YW5158wekMbG3gynQ3g0D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/2/23 10:14 PM, Kajol Jain wrote:
> Testcase stat_all_metrics.sh fails in powerpc:
>      
> 92: perf all metrics test : FAILED!
>
> Logs with verbose:
>
> [command]# ./perf test 92 -vv
>   92: perf all metrics test                                           :
> --- start ---
> test child forked, pid 13262
> Testing BRU_STALL_CPI
> Testing COMPLETION_STALL_CPI
> ----
> Testing TOTAL_LOCAL_NODE_PUMPS_P23
> Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
> Error:
> Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
> Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
> Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
> Error:
> Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
> ----
>
> Based on above logs, we could see some of the hv-24x7 metric events fails,
> and logs suggest to run the metric event with -a option.
> This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
> parsing"), which delayed the metric parsing phase and now before metric parsing
> phase perf tool identifies, whether target is system-wide or not. With this
> change, perf_event_open will fails with workload monitoring for uncore events
> as expected.
>
> The perf all metric test case fails as some of the hv-24x7 metric events
> may need bigger workload to get the data. And the added perf bench
> workload in 'perf all metric test case' will not run for hv-24x7 without
> -a option.
>
> Fix this issue by adding system wide check for perf bench workload.
>
> Result with the patch changes in powerpc:
>
> 92: perf all metrics test : Ok
>
> Signed-off-by: Kajol Jain<kjain@linux.ibm.com>

Tested the patch on powerpc machine, perf metrics test works fine.

  91: perf all metrics test                                           : Ok

Tested-by: Disha Goel<disgoel@linux.ibm.com>

> ---
>   tools/perf/tests/shell/stat_all_metrics.sh | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
> index 6e79349e42be..d49832a316d9 100755
> --- a/tools/perf/tests/shell/stat_all_metrics.sh
> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
> @@ -23,6 +23,13 @@ for m in $(perf list --raw-dump metrics); do
>     then
>       continue
>     fi
> +  # Failed again, possibly the event is uncore pmu event which will need
> +  # system wide monitoring with workload, so retry with -a option
> +  result=$(perf stat -M "$m" -a perf bench internals synthesize 2>&1)
> +  if [[ "$result" =~ "${m:0:50}" ]]
> +  then
> +    continue
> +  fi
>     echo "Metric '$m' not printed in:"
>     echo "$result"
>     if [[ "$err" != "1" ]]
--------------px1YW5158wekMbG3gynQ3g0D
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/2/23 10:14 PM, Kajol Jain wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230202164413.56743-1-kjain@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Testcase stat_all_metrics.sh fails in powerpc:
    
92: perf all metrics test : FAILED!

Logs with verbose:

[command]# ./perf test 92 -vv
 92: perf all metrics test                                           :
--- start ---
test child forked, pid 13262
Testing BRU_STALL_CPI
Testing COMPLETION_STALL_CPI
----
Testing TOTAL_LOCAL_NODE_PUMPS_P23
Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
Error:
Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
Error:
Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
----

Based on above logs, we could see some of the hv-24x7 metric events fails,
and logs suggest to run the metric event with -a option.
This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
parsing"), which delayed the metric parsing phase and now before metric parsing
phase perf tool identifies, whether target is system-wide or not. With this
change, perf_event_open will fails with workload monitoring for uncore events
as expected.

The perf all metric test case fails as some of the hv-24x7 metric events
may need bigger workload to get the data. And the added perf bench
workload in 'perf all metric test case' will not run for hv-24x7 without 
-a option.

Fix this issue by adding system wide check for perf bench workload.

Result with the patch changes in powerpc:

92: perf all metrics test : Ok

Signed-off-by: Kajol Jain <a class="moz-txt-link-rfc2396E" href="mailto:kjain@linux.ibm.com">&lt;kjain@linux.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested the patch on powerpc machine, perf metrics test works fine.</pre>
    <pre> 91: perf all metrics test                                           : Ok</pre>
    <pre>Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20230202164413.56743-1-kjain@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 tools/perf/tests/shell/stat_all_metrics.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 6e79349e42be..d49832a316d9 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -23,6 +23,13 @@ for m in $(perf list --raw-dump metrics); do
   then
     continue
   fi
+  # Failed again, possibly the event is uncore pmu event which will need
+  # system wide monitoring with workload, so retry with -a option
+  result=$(perf stat -M "$m" -a perf bench internals synthesize 2&gt;&amp;1)
+  if [[ "$result" =~ "${m:0:50}" ]]
+  then
+    continue
+  fi
   echo "Metric '$m' not printed in:"
   echo "$result"
   if [[ "$err" != "1" ]]
</pre>
    </blockquote>
  </body>
</html>

--------------px1YW5158wekMbG3gynQ3g0D--

