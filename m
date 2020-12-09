Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2B2D4795
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 18:13:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrkC469V0zDqcY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 04:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DRZRSP4n; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crk6707TKzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 04:08:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H2jvh064768; Wed, 9 Dec 2020 12:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=HGxCZ4JNYCq3gVpScan/Ogqigeh6hIBTvZskcKvfeBU=;
 b=DRZRSP4nDWzlPeLni/WMS+orvFC9XZJDd8yPIldr2bsR4+S3ek+Q2X2Gz9KreRcEalEj
 gKfH8z0e2zRJqLcKUYfAfz7Q3ZbWd38jRjoW37PtcpSUzBUOCeYXQbFdPo1reVxn7ssO
 8rCZ55aeykPd4oxQPzq0oxjau1aX7rQcnEJkSrzVlga+wmHXEW7G8UTpXjJ0Rr2eHE1F
 gIaKkvaKeRh03tcMp1xx+IOdvEsqkHcjBAObbcqDYIhmLMGsgi6j2eLfVnycPNy6WxFm
 eTXa2dDZr53SOAEPqdRHQSUIXBzEIWTkZ56TfuU85iJsjuwI3OQcKsSS3DfXWGRJbINV SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b20tsbxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:08:35 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H2qBN065423;
 Wed, 9 Dec 2020 12:08:34 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b20tsbxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:08:34 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9H225l004510;
 Wed, 9 Dec 2020 17:08:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3581u9hb3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:08:33 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9H8WII27132238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:08:32 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DE6D7805E;
 Wed,  9 Dec 2020 17:08:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B33EB7805F;
 Wed,  9 Dec 2020 17:08:31 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.58.223])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:08:31 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 548652E35A0; Wed,  9 Dec 2020 22:38:28 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH v2 0/5] Extend Parsing "ibm,
 thread-groups" for Shared-L2 information
Date: Wed,  9 Dec 2020 22:38:15 +0530
Message-Id: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090116
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Hi,

This is the v2 of the patchset to extend parsing of "ibm,thread-groups" property
to discover the Shared-L2 cache information.

The v1 can be found here :
https://lore.kernel.org/linuxppc-dev/1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com/T/#m0fabffa1ea1a2807b362f25c849bb19415216520

The key changes from v1 are as follows to incorporate the review
comments from Srikar and fix a build error on !PPC64 configs reported
by the kernel bot.

 * Split Patch 1 into three patches
   * First patch ensure that parse_thread_groups() is made generic to
     support more than one property.
   * Second patch renames cpu_l1_cache_map as
     thread_group_l1_cache_map for consistency. No functional impact.
   * The third patch makes init_thread_group_l1_cache_map()
     generic. No functional impact.

* Patch 2 (Now patch 4): Incorporates the review comments from Srikar simplifying
   the changes to update_mask_by_l2()

* Patch 3 (Now patch 5): Fix a build errors for 32-bit configs
   reported by the kernel build bot.
 
Description of the Patchset
===========================
The "ibm,thread-groups" device-tree property is an array that is used
to indicate if groups of threads within a core share certain
properties. It provides details of which property is being shared by
which groups of threads. This array can encode information about
multiple properties being shared by different thread-groups within the
core.

Example: Suppose,
"ibm,thread-groups" = [1,2,4,8,10,12,14,9,11,13,15,2,2,4,8,10,12,14,9,11,13,15]

This can be decomposed up into two consecutive arrays:

a) [1,2,4,8,10,12,14,9,11,13,15]
b) [2,2,4,8,10,12,14,9,11,13,15]

where in,

a) provides information of Property "1" being shared by "2" groups,
   each with "4" threads each. The "ibm,ppc-interrupt-server#s" of the
   first group is {8,10,12,14} and the "ibm,ppc-interrupt-server#s" of
   the second group is {9,11,13,15}. Property "1" is indicative of
   the thread in the group sharing L1 cache, translation cache and
   Instruction Data flow.

b) provides information of Property "2" being shared by "2" groups,
   each group with "4" threads. The "ibm,ppc-interrupt-server#s" of
   the first group is {8,10,12,14} and the
   "ibm,ppc-interrupt-server#s" of the second group is
   {9,11,13,15}. Property "2" indicates that the threads in each group
   share the L2-cache.
   
The existing code assumes that the "ibm,thread-groups" encodes
information about only one property. Hence even on platforms which
encode information about multiple properties being shared by the
corresponding groups of threads, the current code will only pick the
first one. (In the above example, it will only consider
[1,2,4,8,10,12,14,9,11,13,15] but not [2,2,4,8,10,12,14,9,11,13,15]).

Furthermore, currently on platforms where groups of threads share L2
cache, we incorrectly create an extra CACHE level sched-domain that
maps to all the threads of the core.

For example, if "ibm,thread-groups" is 
		 00000001 00000002 00000004 00000000
		 00000002 00000004 00000006 00000001
		 00000003 00000005 00000007 00000002
		 00000002 00000004 00000000 00000002
		 00000004 00000006 00000001 00000003
		 00000005 00000007

then, the sub-array
[00000002 00000002 00000004
 00000000 00000002 00000004 00000006
 00000001 00000003 00000005 00000007]
indicates that L2 (Property "2") is shared only between the threads of a single
group. There are "2" groups of threads where each group contains "4"
threads each. The groups being {0,2,4,6} and {1,3,5,7}.

However, the sched-domain hierarchy for CPUs 0,1 is
	CPU0 attaching sched-domain(s):
	domain-0: span=0,2,4,6 level=SMT
	domain-1: span=0-7 level=CACHE
	domain-2: span=0-15,24-39,48-55 level=MC
	domain-3: span=0-55 level=DIE

	CPU1 attaching sched-domain(s):
	domain-0: span=1,3,5,7 level=SMT
	domain-1: span=0-7 level=CACHE
	domain-2: span=0-15,24-39,48-55 level=MC
	domain-3: span=0-55 level=DIE

where the CACHE domain reports that L2 is shared across the entire
core which is incorrect on such platforms.

This patchset remedies these issues by extending the parsing support
for "ibm,thread-groups" to discover information about multiple
properties being shared by the corresponding groups of threads. In
particular we cano now detect if the groups of threads within a core
share the L2-cache. On such platforms, we populate the populating the
cpu_l2_cache_mask of every CPU to the core-siblings which share L2
with the CPU as specified in the by the "ibm,thread-groups" property
array.

With the patchset, the sched-domain hierarchy is correctly
reported. For eg for CPUs 0,1, with the patchset

     	CPU0 attaching sched-domain(s):
	domain-0: span=0,2,4,6 level=SMT
	domain-1: span=0-15,24-39,48-55 level=MC
	domain-2: span=0-55 level=DIE

	CPU1 attaching sched-domain(s):
	domain-0: span=1,3,5,7 level=SMT
	domain-1: span=0-15,24-39,48-55 level=MC
	domain-2: span=0-55 level=DIE

The CACHE domain with span=0,2,4,6 for CPU 0 (span=1,3,5,7 for CPU 1
resp.) gets degenerated into the SMT domain. Furthermore, the
last-level-cache domain gets correctly set to the SMT sched-domain.

Testing
==========

With the producer-consumer
testcase(https://github.com/gautshen/misc/tree/master/producer_consumer)
where in the producer thread performs writes to 4096 random locations,
and the consumer thread subsequently reads from those 4096 random
location. We measure the time taken by the consumer to finish the 4096
reads (called an iteration of the consumer). Thus lower the value,
better is the result.

The best case occurs when the producer and consumer are affined to the
same L2 cache domain (Eg: CPU0, CPU2). On the platform with the
thread-groups sharing L2,
|-----------------------------------------------|
| Without Patch                                 |
|-----------|-----------|-----------------------|
| Producer  | Consumer  | Avg time per Consumer |
| Affinity  | Affinity  | Iteration             |
|-----------|-----------|-----------------------|
|  CPU0     |  CPU2     |   235us               |
|-----------|-----------|-----------------------|
|Not affined|Not affined|   347us               |
|-----------------------------------------------|

We see that out-of-box, the average time per consumer iteration is
higher since the tasks can be placed anywhere within the core without
them being in the L2 domain.

|-----------------------------------------------|
| With Patch                                    |
|-----------|-----------|-----------------------|
| Producer  | Consumer  | Avg time per Consumer |
| Affinity  | Affinity  | Iteration             |
|-----------|-----------|-----------------------|
|  CPU0     |  CPU2     |   235us               |
|-----------|-----------|-----------------------|
|Not affined|Not affined|   236us               |
|-----------------------------------------------|

With the patch, since the L2 domain is correctly identified, the
scheduler does the right thing by co-locating the producer and
consumer on the same L2 domain, thereby yielding the out-of-box
performance matching the best case.

Finally, this patchset reports the correct shared_cpu_map/list in the
sysfs for L2 cache on such platforms. With the patchset for CPUs0, 1,
for L2 cache we see the correct shared_cpu_map/list

/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list:0,2,4,6
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_map:000000,00000055

/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_list:1,3,5,7
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map:000000,000000aa

The patchset has been tested on older platforms which encode only the
L1 sharing information via "ibm,thread-groups" and there is no
regression found.

Gautham R. Shenoy (5):
  powerpc/smp: Parse ibm,thread-groups with multiple properties
  powerpc/smp: Rename cpu_l1_cache_map as thread_group_l1_cache_map
  powerpc/smp: Rename init_thread_group_l1_cache_map() to make it
    generic
  powerpc/smp: Add support detecting thread-groups sharing L2 cache
  powerpc/cacheinfo: Print correct cache-sibling map/list for L2 cache

 arch/powerpc/include/asm/smp.h  |   1 +
 arch/powerpc/kernel/cacheinfo.c |  34 ++++--
 arch/powerpc/kernel/smp.c       | 241 ++++++++++++++++++++++++++++------------
 3 files changed, 197 insertions(+), 79 deletions(-)

-- 
1.9.4

