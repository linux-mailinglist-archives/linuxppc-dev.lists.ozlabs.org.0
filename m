Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094855BAD41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTY6W2C3Dz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 22:19:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FrjtRE3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FrjtRE3i;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTX2z36Xhz3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:31:39 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GAfiCK024135;
	Fri, 16 Sep 2022 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=e/gdOg4z40APinz3MoY4JN9vaIPY/Kh1GNXGH9xgQRc=;
 b=FrjtRE3i4fWXEANn5dLE8eqCKVKBCMG4U1kAdDvyU7KAve4dO8POnuBewGsz1rnEfIt0
 ngWAONAG/i9Qvh/Ks/189ZaY4O5Oz5aOKC7QUpTxeX7ixDALfg//hZ4SUg2pSWZ439W0
 lqiNbwIRc/gmcdTq5maUms8bHGqXeicgi/u1qL3IdMEj4MlI34KKDiIYefRcylnmoD5F
 QSF2lUW2uOXufTRjQ/HaKuY87Bs2xJmamBQA3rOKHJivlKnXHuVqj8bf/uFBu+PVZNzF
 8BH0YPgyG3hjZgEk+oP//PfKMg7bB+l/6cPCUR3r3eKd32XWaeIz9frmbqqBSu5RcSZ1 cA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqm9hg3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 11:31:32 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GBLXnv002844;
	Fri, 16 Sep 2022 11:31:29 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crp5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 11:31:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GBVQFB41222640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 11:31:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 882ECA4060;
	Fri, 16 Sep 2022 11:31:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABC4BA4054;
	Fri, 16 Sep 2022 11:31:21 +0000 (GMT)
Received: from [9.43.57.26] (unknown [9.43.57.26])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 11:31:21 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------4eYVuchGzpy3Xlt9Eq69bwOJ"
Message-ID: <2353467d-c83d-f6ee-0972-1e94bc9f4f5d@linux.ibm.com>
Date: Fri, 16 Sep 2022 17:01:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, mpe@ellerman.id.au
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lr3jYzxj_17rqplusCQcoYyJM5vA3-eR
X-Proofpoint-ORIG-GUID: Lr3jYzxj_17rqplusCQcoYyJM5vA3-eR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_06,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160085
X-Mailman-Approved-At: Fri, 16 Sep 2022 22:18:31 +1000
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------4eYVuchGzpy3Xlt9Eq69bwOJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/13/22 5:27 PM, Athira Rajeev wrote:
> perf stat includes option to specify aggr_mode to display
> per-socket, per-core, per-die, per-node counter details.
> Also there is option -A ( AGGR_NONE, -no-aggr ), where the
> counter values are displayed for each cpu along with "CPU"
> value in one field of the output.
>
> Each of the aggregate mode uses the information fetched
> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
> physical_package_id. Utility functions in "cpumap.c" fetches
> this information and populates the socket id, core id, cpu etc.
> If the platform does not expose the topology information,
> these values will be set to -1. Example, in case of powerpc,
> details like physical_package_id is restricted to be exposed
> in pSeries platform. So id.socket, id.core, id.cpu all will
> be set as -1.
>
> In case of displaying socket or die value, there is no check
> done in the "aggr_printout" function to see if it points to
> valid socket id or die. But for displaying "cpu" value, there
> is a check for "if (id.core > -1)". In case of powerpc pSeries
> where detail like physical_package_id is restricted to be
> exposed, id.core will be set to -1. Hence the column or field
> itself for CPU won't be displayed in the output.
>
> Result for per-socket:
>
> <<>>
> perf stat -e branches --per-socket -a true
>
>   Performance counter stats for 'system wide':
>
> S-1      32            416,851      branches
> <<>>
>
> Here S has -1 in above result. But with -A option which also
> expects CPU in one column in the result, below is observed.
>
> <<>>
>   /bin/perf stat -e instructions -A -a true
>
>   Performance counter stats for 'system wide':
>
>              47,146      instructions
>              45,226      instructions
>              43,354      instructions
>              45,184      instructions
> <<>>
>
> If the cpu id value is pointing to -1 also, it makes sense
> to display the column in the output to replicate the behaviour
> or to be in precedence with other aggr options(like per-socket,
> per-core). Remove the check "id.core" so that CPU field gets
> displayed in the output.
>
> After the fix:
>
> <<>>
> perf stat -e instructions -A -a true
>
>   Performance counter stats for 'system wide':
>
> CPU-1                  64,034      instructions
> CPU-1                  68,941      instructions
> CPU-1                  59,418      instructions
> CPU-1                  70,478      instructions
> CPU-1                  65,201      instructions
> CPU-1                  63,704      instructions
> <<>>
>
> This is caught while running "perf test" for
> "stat+json_output.sh" and "stat+csv_output.sh".
>
> Reported-by: Disha Goel<disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>

Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>

> ---
>   tools/perf/util/stat-display.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index b82844cb0ce7..1b751a730271 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -168,10 +168,9 @@ static void aggr_printout(struct perf_stat_config *config,
>   					id.socket,
>   					id.die,
>   					id.core);
> -			} else if (id.core > -1) {
> +			} else
>   				fprintf(config->output, "\"cpu\" : \"%d\", ",
>   					id.cpu.cpu);
> -			}
>   		} else {
>   			if (evsel->percore && !config->percore_show_thread) {
>   				fprintf(config->output, "S%d-D%d-C%*d%s",
> @@ -179,11 +178,10 @@ static void aggr_printout(struct perf_stat_config *config,
>   					id.die,
>   					config->csv_output ? 0 : -3,
>   					id.core, config->csv_sep);
> -			} else if (id.core > -1) {
> +			} else
>   				fprintf(config->output, "CPU%*d%s",
>   					config->csv_output ? 0 : -7,
>   					id.cpu.cpu, config->csv_sep);
> -			}
>   		}
>   		break;
>   	case AGGR_THREAD:
--------------4eYVuchGzpy3Xlt9Eq69bwOJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/13/22 5:27 PM, Athira Rajeev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220913115717.36191-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">perf stat includes option to specify aggr_mode to display
per-socket, per-core, per-die, per-node counter details.
Also there is option -A ( AGGR_NONE, -no-aggr ), where the
counter values are displayed for each cpu along with "CPU"
value in one field of the output.

Each of the aggregate mode uses the information fetched
from "/sys/devices/system/cpu/cpuX/topology" like core_id,
physical_package_id. Utility functions in "cpumap.c" fetches
this information and populates the socket id, core id, cpu etc.
If the platform does not expose the topology information,
these values will be set to -1. Example, in case of powerpc,
details like physical_package_id is restricted to be exposed
in pSeries platform. So id.socket, id.core, id.cpu all will
be set as -1.

In case of displaying socket or die value, there is no check
done in the "aggr_printout" function to see if it points to
valid socket id or die. But for displaying "cpu" value, there
is a check for "if (id.core &gt; -1)". In case of powerpc pSeries
where detail like physical_package_id is restricted to be
exposed, id.core will be set to -1. Hence the column or field
itself for CPU won't be displayed in the output.

Result for per-socket:

&lt;&lt;&gt;&gt;
perf stat -e branches --per-socket -a true

 Performance counter stats for 'system wide':

S-1      32            416,851      branches
&lt;&lt;&gt;&gt;

Here S has -1 in above result. But with -A option which also
expects CPU in one column in the result, below is observed.

&lt;&lt;&gt;&gt;
 /bin/perf stat -e instructions -A -a true

 Performance counter stats for 'system wide':

            47,146      instructions
            45,226      instructions
            43,354      instructions
            45,184      instructions
&lt;&lt;&gt;&gt;

If the cpu id value is pointing to -1 also, it makes sense
to display the column in the output to replicate the behaviour
or to be in precedence with other aggr options(like per-socket,
per-core). Remove the check "id.core" so that CPU field gets
displayed in the output.

After the fix:

&lt;&lt;&gt;&gt;
perf stat -e instructions -A -a true

 Performance counter stats for 'system wide':

CPU-1                  64,034      instructions
CPU-1                  68,941      instructions
CPU-1                  59,418      instructions
CPU-1                  70,478      instructions
CPU-1                  65,201      instructions
CPU-1                  63,704      instructions
&lt;&lt;&gt;&gt;

This is caught while running "perf test" for
"stat+json_output.sh" and "stat+csv_output.sh".

Reported-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20220913115717.36191-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 tools/perf/util/stat-display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index b82844cb0ce7..1b751a730271 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -168,10 +168,9 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.socket,
 					id.die,
 					id.core);
-			} else if (id.core &gt; -1) {
+			} else
 				fprintf(config-&gt;output, "\"cpu\" : \"%d\", ",
 					id.cpu.cpu);
-			}
 		} else {
 			if (evsel-&gt;percore &amp;&amp; !config-&gt;percore_show_thread) {
 				fprintf(config-&gt;output, "S%d-D%d-C%*d%s",
@@ -179,11 +178,10 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.die,
 					config-&gt;csv_output ? 0 : -3,
 					id.core, config-&gt;csv_sep);
-			} else if (id.core &gt; -1) {
+			} else
 				fprintf(config-&gt;output, "CPU%*d%s",
 					config-&gt;csv_output ? 0 : -7,
 					id.cpu.cpu, config-&gt;csv_sep);
-			}
 		}
 		break;
 	case AGGR_THREAD:
</pre>
    </blockquote>
  </body>
</html>

--------------4eYVuchGzpy3Xlt9Eq69bwOJ--

