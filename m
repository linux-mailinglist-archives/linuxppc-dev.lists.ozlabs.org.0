Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AEA4EFA3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 21:00:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVTxv4PCyz307g
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 06:00:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N52UL0RP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N52UL0RP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVTxD1CW7z2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 05:59:27 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231Hfb2A026467; 
 Fri, 1 Apr 2022 18:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xrA+hupSd2CUpk1rmUcrk24nGnHh1F1sZEl/RFt9Lqo=;
 b=N52UL0RPgWDM8AdwWwSLJ7rml04grV9cXJz88AZPVdfknS/Lpuv4jxbEyhp176SdTb7d
 fmHbzD9JOG4A5fd4o/IxWSz8AVMgKS318gqZVniJ9aja3TJKDMh0PI5Ud7YzqfHn+xu6
 txk6hLIgdBlLunIKhZG1MUt94wYDD6EG2RRpZyj339IRibI5jZLZIiJHO8g8qdICW5fj
 hu+t2JYxhjRA1Ws6P8O3xgV8xhcGPHrBUb+HXLeTuwja3cJnWpQqa9A61KDpB6Tl0HvW
 xC3npSDt4+P7ny/woh/WwwCNr68sMEUFOfmKhejbaho+0PTwTuH2wyZj6kNItGfe3r2l 2g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f660yh9tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:13 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 231Iw0Bi016981;
 Fri, 1 Apr 2022 18:59:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3f1tf93h4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 231Ix6aS41353708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 18:59:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E458A405F;
 Fri,  1 Apr 2022 18:59:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D488EA4054;
 Fri,  1 Apr 2022 18:58:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.128.246])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 18:58:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 0/4] tools/perf: Fix perf bench numa,
 futex and epoll to work with machines having #CPUs > 1K
Date: Sat,  2 Apr 2022 00:28:49 +0530
Message-Id: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: elTZmJ0zlnknSiFXam8KioaXDUrJ_StF
X-Proofpoint-ORIG-GUID: elTZmJ0zlnknSiFXam8KioaXDUrJ_StF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010088
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The perf benchmark for collections: numa, futex and epoll
hits failure in system configuration with CPU's more than 1024.
These benchmarks uses "sched_getaffinity" and "sched_setaffinity"
in the code to work with affinity.

Example snippet from numa benchmark:
<<>>
perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
Aborted (core dumped)
<<>>

bind_to_node function uses "sched_getaffinity" to save the cpumask.
This fails with EINVAL because the default mask size in glibc is 1024.

Similarly in futex and epoll benchmark, uses sched_setaffinity during
pthread_create with affinity. And since it returns EINVAL in such system
configuration, benchmark doesn't run.

To overcome this 1024 CPUs mask size limitation of cpu_set_t,
change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
allocate cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.

Fix all the relevant places in the code to use mask size which is large
enough to represent number of possible CPU's in the system.

Fix parse_setup_cpu_list function in numa bench to check if input CPU
is online before binding task to that CPU. This is to fix failures where,
though CPU number is within max CPU, it could happen that CPU is offline.
Here, sched_setaffinity will result in failure when using cpumask having
that cpu bit set in the mask.

Patch 1 and Patch 2 address fix for perf bench futex and perf bench
epoll benchmark. Patch 3 and Patch 4 address fix in perf bench numa
benchmark

Athira Rajeev (4):
  tools/perf: Fix perf bench futex to correct usage of affinity for
    machines with #CPUs > 1K
  tools/perf: Fix perf bench epoll to correct usage of affinity for
    machines with #CPUs > 1K
  tools/perf: Fix perf numa bench to fix usage of affinity for machines
    with #CPUs > 1K
  tools/perf: Fix perf bench numa testcase to check if CPU used to bind
    task is online

 tools/perf/bench/epoll-ctl.c           |  25 ++++--
 tools/perf/bench/epoll-wait.c          |  25 ++++--
 tools/perf/bench/futex-hash.c          |  26 ++++--
 tools/perf/bench/futex-lock-pi.c       |  21 +++--
 tools/perf/bench/futex-requeue.c       |  21 +++--
 tools/perf/bench/futex-wake-parallel.c |  21 +++--
 tools/perf/bench/futex-wake.c          |  22 +++--
 tools/perf/bench/numa.c                | 117 ++++++++++++++++++-------
 tools/perf/util/header.c               |  43 +++++++++
 tools/perf/util/header.h               |   1 +
 10 files changed, 252 insertions(+), 70 deletions(-)

-- 
2.35.1

