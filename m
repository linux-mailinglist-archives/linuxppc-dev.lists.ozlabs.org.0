Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE37248041
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:14:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW3bT4p46zDqX6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 18:14:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DdgNPuOI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW3YQ3wZ8zDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 18:12:26 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07I81i9L002160; Tue, 18 Aug 2020 04:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xSmMT1OcT6UDLbLN/FbzEHtTk8hgrmSdb2ulSgSfwc8=;
 b=DdgNPuOI0Ee+ck8pnUJaMBzKyVsGYEORkN9MftkEPEIZMd7ASQwE9MEdjpyMB4Bxnc3C
 HgMGnreRS9rPCjub4djCv+rBxFoZOB1fFKaxcatKI1BLIq5SVPOkS4m3aUD9cKtS9OJU
 iUuvWLJs3F43uUkyWbBW7758QDoIs7NnUX4Me/ePoHwBGlSZuSH0Xwol2J6LrzsiP4MX
 9eBu8BMmWebqdGrfLSEvlnRRYsO2xvhkCWpPAQszYTt3a86GT8H5QUiGKa2LmHKJ8OgP
 RjVWYWy9IL0v+Pcip2jW1J69tFUozdKczt1o+2KhZ2FEhJAG1umIsvNuPeP7KaKTSyKq sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r71eww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:12:15 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I81qr9002913;
 Tue, 18 Aug 2020 04:12:13 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r71eux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:12:13 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I8BZUX010524;
 Tue, 18 Aug 2020 08:12:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3304tr87ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 08:12:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07I8C80t27001208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 08:12:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AE68A404D;
 Tue, 18 Aug 2020 08:12:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A02B4A405D;
 Tue, 18 Aug 2020 08:12:03 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.93.83])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Aug 2020 08:12:03 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 0/3] Offline memoryless cpuless node 0
Date: Tue, 18 Aug 2020 13:41:01 +0530
Message-Id: <20200818081104.57888-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-18_04:2020-08-18,
 2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180051
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 Christopher Lameter <cl@linux.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog v5:->v6:
- Now the fix is Powerpc specific.
	(David Hildenbrand, Michal Hocko, Christopher Lamater)
- rebased to v5.8
link v5: https://lore.kernel.org/linuxppc-dev/20200624092846.9194-1-srikar@linux.vnet.ibm.com/t/#u

Changelog v4:->v5:
- rebased to v5.8
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

v5.8
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

v5.8 + patches
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
numa_hit 3864714
numa_miss 0
numa_foreign 0
numa_interleave 2872
numa_local 3864714
numa_other 0
numa_pte_updates 13739278           <----------
numa_huge_pte_updates 0               <----------
numa_hint_faults 13717222         <----------
numa_hint_faults_local 13717222         <----------
numa_pages_migrated 0

With patch
$ grep numa /proc/vmstat
numa_hit 6633324
numa_miss 0
numa_foreign 0
numa_interleave 2864
numa_local 6633324
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

Without patch
-------------
Testcase         Time:  Min      Max      Avg      StdDev
./numa01.sh      Real:  164.67   164.89   164.76   0.07
./numa01.sh      Sys:   2.88     3.38     3.05     0.17
./numa01.sh      User:  1297.85  1301.82  1300.86  1.51
./numa02.sh      Real:  27.44    27.46    27.45    0.01
./numa02.sh      Sys:   0.15     0.25     0.21     0.03
./numa02.sh      User:  216.65   216.93   216.80   0.09

With patch
-----------
Testcase         Time:  Min      Max      Avg      StdDev  %Change
./numa01.sh      Real:  164.20   164.38   164.28   0.08    0.292184%
./numa01.sh      Sys:   0.72     0.90     0.82     0.06    271.951%
./numa01.sh      User:  1300.39  1301.97  1300.94  0.56    -0.0061494%
./numa02.sh      Real:  27.41    27.51    27.45    0.03    0%
./numa02.sh      Sys:   0.09     0.16     0.13     0.03    61.5385%
./numa02.sh      User:  216.38   216.91   216.64   0.21    0.0738552%

numa01.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        2946055     0           -100%
numa_hint_faults_local  2946055     0           -100%
numa_hit                700617      681234      -2.76656%
numa_local              700617      681234      -2.76656%
numa_pte_updates        2947175     0           -100%
pgfault                 4125926     1120053     -72.8533%
pgmajfault              269         181         -32.7138%

numa02.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        137623      0           -100%
numa_hint_faults_local  137623      0           -100%
numa_hit                51332       54645       6.45406%
numa_local              51332       54645       6.45406%
numa_pte_updates        138903      0           -100%
pgfault                 247058      116743      -52.7467%
pgmajfault              154         157         1.94805%

Observations:
The real time and user time actually doesn't change much. However the system
time changes to some extent. The reason being the number of numa hinting
faults. With the patch we are not seeing the numa hinting faults.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Christopher Lameter <cl@linux.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>

Srikar Dronamraju (3):
  powerpc/numa: Set numa_node for all possible cpus
  powerpc/numa: Prefer node id queried from vphn
  powerpc/numa: Offline memoryless cpuless node 0

 arch/powerpc/mm/numa.c | 45 ++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

-- 
2.18.1

