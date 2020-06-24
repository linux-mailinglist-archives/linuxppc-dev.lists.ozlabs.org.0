Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD137207011
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 11:31:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sHvt6rp5zDqg5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 19:31:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sHsZ5BwhzDqc2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 19:29:22 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O934mM190109; Wed, 24 Jun 2020 05:29:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwysj68t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 05:29:13 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05O94VCs195280;
 Wed, 24 Jun 2020 05:29:13 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwysj668-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 05:29:12 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05O9Q0lP028374;
 Wed, 24 Jun 2020 09:29:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 31uuspr742-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 09:29:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05O9T6Xj57933914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 09:29:06 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62F6652059;
 Wed, 24 Jun 2020 09:29:06 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.29.235])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A66C852057;
 Wed, 24 Jun 2020 09:29:01 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 0/3] Offline memoryless cpuless node 0
Date: Wed, 24 Jun 2020 14:58:43 +0530
Message-Id: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_04:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 cotscore=-2147483648 mlxlogscore=999 spamscore=0 adultscore=0
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240067
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog v4:->v5:
- rebased to v5.8-rc2
link v4: http://lore.kernel.org/lkml/20200512132937.19295-1-srikar@linux.vnet.ibm.com/t/#u

Changelog v3:->v4:
- Resolved comments from Christopher.
Link v3: http://lore.kernel.org/lkml/20200501031128.19584-1-srikar@linux.vnet.ibm.com/t/#u

Changelog v2:->v3:
- Resolved comments from Gautham.
Link v2: https://lore.kernel.org/linuxppc-dev/20200428093836.27190-1-srikar@linux.vnet.ibm.com/t/#u

Changelog v1:->v2:
- Rebased to v5.7-rc3
- Updated the changelog.
Link v1: https://lore.kernel.org/linuxppc-dev/20200311110237.5731-1-srikar@linux.vnet.ibm.com/t/#u

Linux kernel configured with CONFIG_NUMA on a system with multiple
possible nodes, marks node 0 as online at boot. However in practice,
there are systems which have node 0 as memoryless and cpuless.

This can cause
1. numa_balancing to be enabled on systems with only one online node.
2. Existence of dummy (cpuless and memoryless) node which can confuse
users/scripts looking at output of lscpu / numactl.

This patchset wants to correct this anomaly.

This should only affect systems that have CONFIG_MEMORYLESS_NODES.
Currently there are only 2 architectures ia64 and powerpc that have this
config.

Note: Patch 3 in this patch series depends on patches 1 and 2.
Without patches 1 and 2, patch 3 might crash powerpc.

v5.8-rc2
 available: 2 nodes (0,2)
 node 0 cpus:
 node 0 size: 0 MB
 node 0 free: 0 MB
 node 2 cpus: 0 1 2 3 4 5 6 7
 node 2 size: 32625 MB
 node 2 free: 31490 MB
 node distances:
 node   0   2
   0:  10  20
   2:  20  10

proc and sys files
------------------
 /sys/devices/system/node/online:            0,2
 /proc/sys/kernel/numa_balancing:            1
 /sys/devices/system/node/has_cpu:           2
 /sys/devices/system/node/has_memory:        2
 /sys/devices/system/node/has_normal_memory: 2
 /sys/devices/system/node/possible:          0-31

v5.8-rc2 + patches
------------------
 available: 1 nodes (2)
 node 2 cpus: 0 1 2 3 4 5 6 7
 node 2 size: 32625 MB
 node 2 free: 31487 MB
 node distances:
 node   2
   2:  10

proc and sys files
------------------
/sys/devices/system/node/online:            2
/proc/sys/kernel/numa_balancing:            0
/sys/devices/system/node/has_cpu:           2
/sys/devices/system/node/has_memory:        2
/sys/devices/system/node/has_normal_memory: 2
/sys/devices/system/node/possible:          0-31

1. User space applications like Numactl, lscpu, that parse the sysfs tend to
believe there is an extra online node. This tends to confuse users and
applications. Other user space applications start believing that system was
not able to use all the resources (i.e missing resources) or the system was
not setup correctly.

2. Also existence of dummy node also leads to inconsistent information. The
number of online nodes is inconsistent with the information in the
device-tree and resource-dump

3. When the dummy node is present, single node non-Numa systems end up showing
up as NUMA systems and numa_balancing gets enabled. This will mean we take
the hit from the unnecessary numa hinting faults.

On a machine with just one node with node number not being 0,
the current setup will end up showing 2 online nodes. And when there are
more than one online nodes, numa_balancing gets enabled.

Without patch
$ grep numa /proc/vmstat
numa_hit 95179
numa_miss 0
numa_foreign 0
numa_interleave 3764
numa_local 95179
numa_other 0
numa_pte_updates 1206973                 <----------
numa_huge_pte_updates 4654                 <----------
numa_hint_faults 19560                 <----------
numa_hint_faults_local 19560                 <----------
numa_pages_migrated 0

With patch
$ grep numa /proc/vmstat
numa_hit 322338756
numa_miss 0
numa_foreign 0
numa_interleave 3790
numa_local 322338756
numa_other 0
numa_pte_updates 0                 <----------
numa_huge_pte_updates 0                 <----------
numa_hint_faults 0                 <----------
numa_hint_faults_local 0                 <----------
numa_pages_migrated 0

Here are 2 sample numa programs.

numa01.sh is a set of 2 process each running threads as many as number of
cpus;
each thread doing 50 loops on 3GB process shared memory operations.

numa02.sh is a single process with threads as many as number of cpus;
each thread doing 800 loops on 32MB thread local memory operations.

Testcase         Time:  Min      Max      Avg      StdDev
./numa01.sh      Real:  149.62   149.66   149.64   0.02
./numa01.sh      Sys:   3.21     3.71     3.46     0.25
./numa01.sh      User:  4755.13  4758.15  4756.64  1.51
./numa02.sh      Real:  24.98    25.02    25.00    0.02
./numa02.sh      Sys:   0.51     0.59     0.55     0.04
./numa02.sh      User:  790.28   790.88   790.58   0.30

Testcase         Time:  Min      Max      Avg      StdDev  %Change
./numa01.sh      Real:  149.44   149.46   149.45   0.01    0.127133%
./numa01.sh      Sys:   0.71     0.89     0.80     0.09    332.5%
./numa01.sh      User:  4754.19  4754.48  4754.33  0.15    0.0485873%
./numa02.sh      Real:  24.97    24.98    24.98    0.00    0.0800641%
./numa02.sh      Sys:   0.26     0.41     0.33     0.08    66.6667%
./numa02.sh      User:  789.75   790.28   790.01   0.27    0.072151%

numa01.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        1131164     0           -100%
numa_hint_faults_local  1131164     0           -100%
numa_hit                213696      214244      0.256439%
numa_local              213696      214244      0.256439%
numa_pte_updates        1131294     0           -100%
pgfault                 1380845     241424      -82.5162%
pgmajfault              75          60          -20%

Here are 2 sample numa programs.

numa01.sh is a set of 2 process each running threads as many as number of
cpus;
each thread doing 50 loops on 3GB process shared memory operations.

numa02.sh is a single process with threads as many as number of cpus;
each thread doing 800 loops on 32MB thread local memory operations.

Without patch
-------------
Testcase         Time:  Min      Max      Avg      StdDev
./numa01.sh      Real:  149.62   149.66   149.64   0.02
./numa01.sh      Sys:   3.21     3.71     3.46     0.25
./numa01.sh      User:  4755.13  4758.15  4756.64  1.51
./numa02.sh      Real:  24.98    25.02    25.00    0.02
./numa02.sh      Sys:   0.51     0.59     0.55     0.04
./numa02.sh      User:  790.28   790.88   790.58   0.30

With patch
-----------
Testcase         Time:  Min      Max      Avg      StdDev  %Change
./numa01.sh      Real:  149.44   149.46   149.45   0.01    0.127133%
./numa01.sh      Sys:   0.71     0.89     0.80     0.09    332.5%
./numa01.sh      User:  4754.19  4754.48  4754.33  0.15    0.0485873%
./numa02.sh      Real:  24.97    24.98    24.98    0.00    0.0800641%
./numa02.sh      Sys:   0.26     0.41     0.33     0.08    66.6667%
./numa02.sh      User:  789.75   790.28   790.01   0.27    0.072151%

numa01.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        1131164     0           -100%
numa_hint_faults_local  1131164     0           -100%
numa_hit                213696      214244      0.256439%
numa_local              213696      214244      0.256439%
numa_pte_updates        1131294     0           -100%
pgfault                 1380845     241424      -82.5162%
pgmajfault              75          60          -20%

numa02.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        111878      0           -100%
numa_hint_faults_local  111878      0           -100%
numa_hit                41854       43220       3.26373%
numa_local              41854       43220       3.26373%
numa_pte_updates        113926      0           -100%
pgfault                 163662      51210       -68.7099%
pgmajfault              56          52          -7.14286%

Observations:
The real time and user time actually doesn't change much. However the system
time changes to some extent. The reason being the number of numa hinting
faults. With the patch we are not seeing the numa hinting faults.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Christopher Lameter <cl@linux.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: David Hildenbrand <david@redhat.com>

Srikar Dronamraju (3):
  powerpc/numa: Set numa_node for all possible cpus
  powerpc/numa: Prefer node id queried from vphn
  mm/page_alloc: Keep memoryless cpuless node 0 offline

 arch/powerpc/mm/numa.c | 35 +++++++++++++++++++++++++----------
 mm/page_alloc.c        |  4 +++-
 2 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.18.1

