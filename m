Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934C4F67D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYXCR30kzz3bgS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 03:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TR8FU7ao;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TR8FU7ao; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYXBk0Nl7z2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 03:51:41 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236G7JVc002986; 
 Wed, 6 Apr 2022 17:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3qnoL3A32ViFstgzgjBXHDaitO7b7rpSfdz143vPKGk=;
 b=TR8FU7aonqtxG8ouGzmoHP3dQUxqjUVdnYma1hjHXH/4/N80pNW6NSnTohIo8j9YJ/bw
 q3omH4X6JNAjTIcbOI1R7LZFVMOCddMPkBTxNH92dpyxA/lGR3IROMIgf5NVnFh0WsfE
 qe+tErwLLdf1HvOp75+xLKcmcvIBnt052pVcSXk2fP/yq9Q4FqxbQNhzjWb+xir2Ql2H
 QLIbEZBpqDUa5f0V1MW2TsuMH43gbgOvrLJGtDGdN9nZh5fjgvjMV7fyyk9LB3RGoECa
 5giq59aatNv64mZimb/vcDUEFUYk0dG5y4KQ1J40E6clJ4OpHFeuBwKxB29pMemEEoGF vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f977buna9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:51:27 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 236HiFZe032736;
 Wed, 6 Apr 2022 17:51:27 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f977bun9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:51:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 236Hh9TN018159;
 Wed, 6 Apr 2022 17:51:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3f6e4908m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:51:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 236HpMAW32899450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 17:51:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 005A74C046;
 Wed,  6 Apr 2022 17:51:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD8684C044;
 Wed,  6 Apr 2022 17:51:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.90.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 17:51:16 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH v2 0/4] Fix perf bench numa,
 futex and epoll to work with machines having #CPUs > 1K
Date: Wed,  6 Apr 2022 23:21:09 +0530
Message-Id: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3dg8eNuLQnFlErqcy5KMkXzXKig2d57D
X-Proofpoint-ORIG-GUID: ijgm-SApZVM232V8XJqSlbh0zK3Xg7-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_09,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060087
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
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

Changelog:
From v1 -> v2:
 Addressed review comment from Ian Rogers to do
 CPU_FREE in a cleaner way.
 Added Tested-by from Disha Goel

 tools/perf/bench/epoll-ctl.c           |  25 ++++--
 tools/perf/bench/epoll-wait.c          |  25 ++++--
 tools/perf/bench/futex-hash.c          |  26 ++++--
 tools/perf/bench/futex-lock-pi.c       |  21 +++--
 tools/perf/bench/futex-requeue.c       |  21 +++--
 tools/perf/bench/futex-wake-parallel.c |  21 +++--
 tools/perf/bench/futex-wake.c          |  22 ++++--
 tools/perf/bench/numa.c                | 105 ++++++++++++++++++-------
 tools/perf/util/header.c               |  43 ++++++++++
 tools/perf/util/header.h               |   1 +
 10 files changed, 242 insertions(+), 68 deletions(-)

-- 
2.35.1

