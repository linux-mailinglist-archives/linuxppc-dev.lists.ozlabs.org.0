Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34A3CCDFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 08:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSsWV1fY5z30Mp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 16:34:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hE5qpfPd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hE5qpfPd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSsVv1Dj9z2yN5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 16:33:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J648Rk153167; Mon, 19 Jul 2021 02:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version; s=pp1;
 bh=kdmreP7YA3UrwzCFhRCMpIKoAo7N/ldyvK2ItSEadg0=;
 b=hE5qpfPdunsXm2ezTOeBCxiWeG9nWF0K0r6f8mkT9AmskD75j2IfBcWihxA4fHrm4Ewb
 ol1kAOS7kDvrLnZicjG3BSKVg2l9Y9mBVq+dT7BAA17i61FX2lBy0PwbxbCCBhqIyoHu
 UgkLkph7ddtJ88uoYR1Jr2CvbhyR5ZgHrMzo6oDJneIT43eM3chbu7nJBlPEbINv4RUj
 4JCtZhRIjuxINcoYp7wu6eoTeOrby+CM300Mz8Lshlz0kD5a8vC4OhtjxlfGeb6DyFsS
 LMJCiICCEBjR1ILH7gUcKrbsrQSxh+j1Je7nhfe0AinK3oOOpUvbqi1ZiAImXobzjOQY VA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39vxwpf429-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 02:33:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16J6Wvnl009185;
 Mon, 19 Jul 2021 06:33:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 39upuaddns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 06:33:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16J6XX2215139344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:33:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A42BC6E056;
 Mon, 19 Jul 2021 06:33:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E18E16E04E;
 Mon, 19 Jul 2021 06:33:32 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.122.97])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 06:33:32 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id CCB162E301D; Mon, 19 Jul 2021 12:03:30 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [PATCH v5 0/2] cpuidle/pseries: cleanup of the CEDE0 latency fixup
 code
Date: Mon, 19 Jul 2021 12:03:17 +0530
Message-Id: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G0IAr-gj6S3yQx0WTGp4LQ24E1rWrc-z
X-Proofpoint-GUID: G0IAr-gj6S3yQx0WTGp4LQ24E1rWrc-z
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190033
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 joedecke@de.ibm.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>


Hi,

This is the v5 of the patchset to fixup CEDE0 latency only from
POWER10 onwards.


The previous versions of the patches are
v4 : https://lore.kernel.org/linux-pm/1623048014-16451-1-git-send-email-ego@linux.vnet.ibm.com/
v3 : https://lore.kernel.org/linuxppc-dev/1619697982-28461-1-git-send-email-ego@linux.vnet.ibm.com/
v2 : https://lore.kernel.org/linuxppc-dev/1619673517-10853-1-git-send-email-ego@linux.vnet.ibm.com/
v1 : https://lore.kernel.org/linuxppc-dev/1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com/

v4 --> v5 changes
 * Patch 1 : Unchanged. Rebased it against the latest powerpc/merge
  tree. With this patch, on processors older than POWER10, the CEDE
  latency is set to the hardcoded value of 10us which is closer to the
  measured value (details of the measurement in Patch 1).

 * Added a Patch 2/2 titled "cpuidle/pseries: Do not cap the CEDE0
   latency in fixup_cede0_latency()" which will ensure that on POWER10
   onwards we simply take the latency value exposed by the firmware
   without keeping an upper cap of 10us. This upper cap was previously
   required to prevent regression on POWER8 which had advertized
   latency values higher than 10us while the measured values were
   lesser. With Patch 1, we don't need the upper cap any longer.


Tested the series on POWER8, POWER9 and POWER10 with the
cpuidle-smt-performance test case
(https://github.com/gautshen/misc/tree/master/cpuidle-smt-performance) .
  
This test has three classes of threads
1. Workload thread which computes fibonacci numbers (Pinned to the
   primary thread CPU 8). We are interested in the throughput of this
   workload thread.

2. Three irritator threads which are pinned to the secondary CPUs of
   the core on which the workload thread is running (CPUs 10, 12,
   14). These irritators block on a pipe until woken up by a
   waker. After being woken up, they again go back to sleep by
   blocking on a pipe read. We are interested in the wakeup latency of
   the irritator threads.

3. A waker thread which, pinned to a different core (CPU 16) from
   where the workload and the irritators are running, periodically
   wakes up the three irritator threads by writing to their respective
   pipes. The purpose of these periodic wakeups is to prime the
   cpuidle governor on the irritator CPUs to pick the idle state the
   wakeup period.

We measure the wakeup latency of the irritator threads, which tells us
the impact of entering a particular combinations of idle states. Thus
shallower the state, lower should be the wakeup latency.

We also measure the throughput of the fibonacci workload to measure
the single-thread performance in the presence of the waking irritators
on the sibling threads. Entering an idle state which performs SMT
folding should show greater throughput.

There is no observable difference in the behaviour on POWER8 and
POWER10 with and without the patch series, since the CEDE latencies on
both of them with and without the patch are 10us.

However, on POWER9, without the patch, the CEDE latency is 1us based
on the value returned by the firmware (which is not accurate), while
with the patch it is set to the default value of 10us which is closer
to the accurate measure.

The throughput, wakeup latency, throughput and the snooze, CEDE idle
percentage residency results on POWER9 with and without patch are as
follows.

We observe that for a wakeup period between 20us - 100us, the wakeup
latency of the irritator threads with the patch improves by 40-45%.

Though note that with the patch, the throughput of the fibbonacci
workload drops by 5-10% when the wakeup period of the irritator
threads is between 20us-100us. This is an acceptable tradeoff since
there are certain benchmarks on POWER9 which are very sensitive to the
wakeup latency and have a sleeping duration of less than 100us.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Avg Wakeup Latency of the irritator threads
(lower the better)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Irritator  |                   |
wakeup     |   Without         |   With
period     |   Patch           |   Patch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1 us   |   3.703 us        |   3.632 us ( -1.91%)
    2 us   |   3.843 us        |   3.925 us ( +2.13%)
    5 us   |   8.575 us        |   8.656 us ( +0.94%)
   10 us   |   8.264 us        |   8.242 us ( -0.27%)
   20 us   |   8.672 us        |   8.256 us ( -4.80%)
   50 us   |  15.552 us        |   8.257 us (-46.90%)
   80 us   |  15.603 us        |   8.803 us (-43.58%)
  100 us   |  15.617 us        |   8.328 us (-46.67%)
  120 us   |  15.612 us        |  14.505 us ( -7.09%)
  500 us   |  15.957 us        |  15.723 us ( -1.47%)
 1000 us   |  16.526 us        |  16.502 us ( -0.14%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Fibonacci workload throughput in Million Operations
per second (higher the better)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Irritator  |                   |
wakeup     |   Without         |   With
period     |   Patch           |   Patch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1 us   |  44.234 Mops/s    |   44.305 Mops/s ( +0.16%)
    2 us   |  44.290 Mops/s    |   44.233 Mops/s ( -0.13%)
    5 us   |  44.757 Mops/s    |   44.759 Mops/s ( -0.01%)
   10 us   |  46.169 Mops/s    |   46.049 Mops/s ( -0.25%)
   20 us   |  48.263 Mops/s    |   49.647 Mops/s ( +2.87%)
   50 us   |  52.817 Mops/s    |   52.310 Mops/s ( -0.96%)
   80 us   |  57.338 Mops/s    |   53.216 Mops/s ( -7.19%)
  100 us   |  58.958 Mops/s    |   53.497 Mops/s ( -9.26%)
  120 us   |  60.060 Mops/s    |   58.980 Mops/s ( -1.80%)
  500 us   |  64.484 Mops/s    |   64.460 Mops/s ( -0.04%)
 1000 us   |  65.200 Mops/s    |   65.188 Mops/s ( -0.02%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(snooze, CEDE Residency Percentage)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Irritator  |                   |
wakeup     |   Without         |   With
period     |   Patch           |   Patch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1 us   |  ( 0.40%,  0.00%) |  (0.28%,   0.00%)
    2 us   |  ( 0.42%,  0.00%) |  (0.33%,   0.00%)
    5 us   |  ( 3.94%,  0.00%) |  (3.89%,   0.00%)
   10 us   |  (21.85%,  0.00%) |  (21.62%,  0.00%)
   20 us   |  (43.44%,  0.00%) |  (50.90%,  0.00%)
   50 us   |  ( 0.03%, 76.07%) |  (76.85%,  0.00%)
   80 us   |  ( 0.07%, 84.14%) |  (84.85%,  0.00%)
  100 us   |  ( 0.03%, 87.18%) |  (87.61%,  0.02%)
  120 us   |  ( 0.02%, 89.21%) |  (14.71%, 74.40%)
  500 us   |  ( 0.00%, 97.27%) |  ( 3.70%, 93.53%
 1000 us   |  ( 0.00%, 98.57%) |  ( 0.17%, 98.40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 



Gautham R. Shenoy (2):
  cpuidle/pseries: Fixup CEDE0 latency only for POWER10 onwards
  cpuidle/pseries: Do not cap the CEDE0 latency in fixup_cede0_latency()

 drivers/cpuidle/cpuidle-pseries.c | 75 +++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 30 deletions(-)

-- 
1.9.4

