Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E97847857FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:43:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sh+rHO5N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW5VB5g2mz3dDS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:43:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sh+rHO5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW0Db3JZyz2xq6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 18:46:07 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N8Vs64016410;
	Wed, 23 Aug 2023 08:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=MAaSfgTjXhUvX79XWj041ZdqWq3EdK5Zzc+ORBRYPpM=;
 b=Sh+rHO5NoJJqWXrMH1gB0rW5CBGD69gn2XT7Xx379OdfeIiURNK8+nfpagpem+bfeOUH
 /DRXNRR3pm1nnsTcENdgZbTu8Bepdpv/WqKXutf053vtZHtSllouSdw2xAQeyRqOAay/
 kKEG9U8r4qevndgXLhd48iFwbSp238zFDZCl9qUE49M5Rr2Czk20voxcutZEtIh2BmfD
 GpkvATkJiImo1q2yCKUnp6Ve21JoX9n2Z0Dy0dtKuQDOwuPIhj//ZdpxpnicnWXDnBMo
 cEqew9SNPJQUGexGMzeI/Lo2ovookJZJ4yOAwdAMKG+bJ2xLrhQKGaq/AL337jHq7swL aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3snepc0fm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 08:46:02 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37N8WFNL017877;
	Wed, 23 Aug 2023 08:46:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3snepc0fkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 08:46:01 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37N7Cqqi018270;
	Wed, 23 Aug 2023 08:46:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sn21scx79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 08:46:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37N8jvQe61866424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Aug 2023 08:45:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D94420049;
	Wed, 23 Aug 2023 08:45:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEB4C20040;
	Wed, 23 Aug 2023 08:45:55 +0000 (GMT)
Received: from [9.109.253.91] (unknown [9.109.253.91])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Aug 2023 08:45:55 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------Egt0c33eo1kZn6r0PaXYxROd"
Message-ID: <d39f82e2-9b51-4487-7d5c-dcd992eb56cb@linux.ibm.com>
Date: Wed, 23 Aug 2023 14:15:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] perf test: Skip perf bench breakpoint run if no
 breakpoints available
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org
References: <20230823075103.190565-1-kjain@linux.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230823075103.190565-1-kjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: guhLotAgJtn_0OVAxaP4NyCHjZVQcWpW
X-Proofpoint-GUID: s_HqnxDbmVOhhLlMtKrNGbt8mNVFYJet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230077
X-Mailman-Approved-At: Wed, 23 Aug 2023 22:42:31 +1000
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
Cc: irogers@google.com, atrajeev@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------Egt0c33eo1kZn6r0PaXYxROd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/23 1:21 pm, Kajol Jain wrote:

> Based on commit 7d54a4acd8c1 ("perf test: Skip watchpoint
> tests if no watchpoints available"), hardware breakpoints
> are not available for power9 platform and because of that
> perf bench breakpoint run fails on power9 platform.
> Add code to check for the return value of perf_event_open()
> in breakpoint run and skip the perf bench breakpoint run,
> if hardware breakpoints are not available.
>
> Result on power9 system before patch changes:
> [command]# perf bench breakpoint thread
> perf_event_open: No such device
>
> Result on power9 system after patch changes:
> [command]# ./perf bench breakpoint thread
> Skipping perf bench breakpoint thread: No hardware support
>
> Reported-by: Disha Goel<disgoel@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain<kjain@linux.ibm.com>

With this patch applied perf bench breakpoint test works correctly on Power9 and Power10.

Result on Power9 system with patch changes:
[root@]# ./perf bench breakpoint all
# Running breakpoint/thread benchmark...
Skipping perf bench breakpoint thread: No hardware support

# Running breakpoint/enable benchmark...
Skipping perf bench breakpoint enable: No hardware support

Result on Power10 system with patch changes:
[root@]# ./perf bench breakpoint all
# Running breakpoint/thread benchmark...
# Created/joined 10 threads with 1 breakpoints and 1 parallelism
      Total time: 0.001 [sec]

      115.100000 usecs/op
      115.100000 usecs/op/cpu

# Running breakpoint/enable benchmark...
# Enabled/disabled breakpoint 10 time with 0 passive and 0 active threads
      Total time: 0.000 [sec]

        2.800000 usecs/op

Tested-by: Disha Goel<disgoel@linux.ibm.com>

> ---
>   tools/perf/bench/breakpoint.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/bench/breakpoint.c b/tools/perf/bench/breakpoint.c
> index 41385f89ffc7..dfd18f5db97d 100644
> --- a/tools/perf/bench/breakpoint.c
> +++ b/tools/perf/bench/breakpoint.c
> @@ -47,6 +47,7 @@ struct breakpoint {
>   static int breakpoint_setup(void *addr)
>   {
>   	struct perf_event_attr attr = { .size = 0, };
> +	int fd;
>   
>   	attr.type = PERF_TYPE_BREAKPOINT;
>   	attr.size = sizeof(attr);
> @@ -56,7 +57,12 @@ static int breakpoint_setup(void *addr)
>   	attr.bp_addr = (unsigned long)addr;
>   	attr.bp_type = HW_BREAKPOINT_RW;
>   	attr.bp_len = HW_BREAKPOINT_LEN_1;
> -	return syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> +	fd = syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> +
> +	if (fd < 0)
> +		fd = -errno;
> +
> +	return fd;
>   }
>   
>   static void *passive_thread(void *arg)
> @@ -122,8 +128,14 @@ int bench_breakpoint_thread(int argc, const char **argv)
>   
>   	for (i = 0; i < thread_params.nbreakpoints; i++) {
>   		breakpoints[i].fd = breakpoint_setup(&breakpoints[i].watched);
> -		if (breakpoints[i].fd == -1)
> +
> +		if (breakpoints[i].fd < 0) {
> +			if (breakpoints[i].fd == -ENODEV) {
> +				printf("Skipping perf bench breakpoint thread: No hardware support\n");
> +				return 0;
> +			}
>   			exit((perror("perf_event_open"), EXIT_FAILURE));
> +		}
>   	}
>   	gettimeofday(&start, NULL);
>   	for (i = 0; i < thread_params.nparallel; i++) {
> @@ -196,8 +208,14 @@ int bench_breakpoint_enable(int argc, const char **argv)
>   		exit(EXIT_FAILURE);
>   	}
>   	fd = breakpoint_setup(&watched);
> -	if (fd == -1)
> +
> +	if (fd < 0) {
> +		if (fd == -ENODEV) {
> +			printf("Skipping perf bench breakpoint enable: No hardware support\n");
> +			return 0;
> +		}
>   		exit((perror("perf_event_open"), EXIT_FAILURE));
> +	}
>   	nthreads = enable_params.npassive + enable_params.nactive;
>   	threads = calloc(nthreads, sizeof(threads[0]));
>   	if (!threads)
--------------Egt0c33eo1kZn6r0PaXYxROd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 23/08/23 1:21 pm, Kajol Jain wrote:</pre>
    <blockquote type="cite"
      cite="mid:20230823075103.190565-1-kjain@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Based on commit 7d54a4acd8c1 ("perf test: Skip watchpoint
tests if no watchpoints available"), hardware breakpoints
are not available for power9 platform and because of that
perf bench breakpoint run fails on power9 platform.
Add code to check for the return value of perf_event_open()
in breakpoint run and skip the perf bench breakpoint run,
if hardware breakpoints are not available.

Result on power9 system before patch changes:
[command]# perf bench breakpoint thread
perf_event_open: No such device

Result on power9 system after patch changes:
[command]# ./perf bench breakpoint thread
Skipping perf bench breakpoint thread: No hardware support

Reported-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.vnet.ibm.com">&lt;disgoel@linux.vnet.ibm.com&gt;</a>
Signed-off-by: Kajol Jain <a class="moz-txt-link-rfc2396E" href="mailto:kjain@linux.ibm.com">&lt;kjain@linux.ibm.com&gt;</a></pre>
    </blockquote>
    <pre>With this patch applied perf bench breakpoint test works correctly on Power9 and Power10.

Result on Power9 system with patch changes:
[root@]# ./perf bench breakpoint all
# Running breakpoint/thread benchmark...
Skipping perf bench breakpoint thread: No hardware support

# Running breakpoint/enable benchmark...
Skipping perf bench breakpoint enable: No hardware support

Result on Power10 system with patch changes:
[root@]# ./perf bench breakpoint all
# Running breakpoint/thread benchmark...
# Created/joined 10 threads with 1 breakpoints and 1 parallelism
     Total time: 0.001 [sec]

     115.100000 usecs/op
     115.100000 usecs/op/cpu

# Running breakpoint/enable benchmark...
# Enabled/disabled breakpoint 10 time with 0 passive and 0 active threads
     Total time: 0.000 [sec]

       2.800000 usecs/op

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20230823075103.190565-1-kjain@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
---
 tools/perf/bench/breakpoint.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/perf/bench/breakpoint.c b/tools/perf/bench/breakpoint.c
index 41385f89ffc7..dfd18f5db97d 100644
--- a/tools/perf/bench/breakpoint.c
+++ b/tools/perf/bench/breakpoint.c
@@ -47,6 +47,7 @@ struct breakpoint {
 static int breakpoint_setup(void *addr)
 {
 	struct perf_event_attr attr = { .size = 0, };
+	int fd;
 
 	attr.type = PERF_TYPE_BREAKPOINT;
 	attr.size = sizeof(attr);
@@ -56,7 +57,12 @@ static int breakpoint_setup(void *addr)
 	attr.bp_addr = (unsigned long)addr;
 	attr.bp_type = HW_BREAKPOINT_RW;
 	attr.bp_len = HW_BREAKPOINT_LEN_1;
-	return syscall(SYS_perf_event_open, &amp;attr, 0, -1, -1, 0);
+	fd = syscall(SYS_perf_event_open, &amp;attr, 0, -1, -1, 0);
+
+	if (fd &lt; 0)
+		fd = -errno;
+
+	return fd;
 }
 
 static void *passive_thread(void *arg)
@@ -122,8 +128,14 @@ int bench_breakpoint_thread(int argc, const char **argv)
 
 	for (i = 0; i &lt; thread_params.nbreakpoints; i++) {
 		breakpoints[i].fd = breakpoint_setup(&amp;breakpoints[i].watched);
-		if (breakpoints[i].fd == -1)
+
+		if (breakpoints[i].fd &lt; 0) {
+			if (breakpoints[i].fd == -ENODEV) {
+				printf("Skipping perf bench breakpoint thread: No hardware support\n");
+				return 0;
+			}
 			exit((perror("perf_event_open"), EXIT_FAILURE));
+		}
 	}
 	gettimeofday(&amp;start, NULL);
 	for (i = 0; i &lt; thread_params.nparallel; i++) {
@@ -196,8 +208,14 @@ int bench_breakpoint_enable(int argc, const char **argv)
 		exit(EXIT_FAILURE);
 	}
 	fd = breakpoint_setup(&amp;watched);
-	if (fd == -1)
+
+	if (fd &lt; 0) {
+		if (fd == -ENODEV) {
+			printf("Skipping perf bench breakpoint enable: No hardware support\n");
+			return 0;
+		}
 		exit((perror("perf_event_open"), EXIT_FAILURE));
+	}
 	nthreads = enable_params.npassive + enable_params.nactive;
 	threads = calloc(nthreads, sizeof(threads[0]));
 	if (!threads)
</pre>
    </blockquote>
  </body>
</html>

--------------Egt0c33eo1kZn6r0PaXYxROd--

