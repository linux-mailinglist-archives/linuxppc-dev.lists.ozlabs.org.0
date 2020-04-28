Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86A1BBA24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 11:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BGvK4wy2zDqGl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 19:44:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BGn52sR8zDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 19:38:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03S9X6uF145751; Tue, 28 Apr 2020 05:38:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mguvtb5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 05:38:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03S9TtSc031783;
 Tue, 28 Apr 2020 09:38:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5nt1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 09:38:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03S9cjfu46727204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 09:38:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62D9342042;
 Tue, 28 Apr 2020 09:38:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8DB54203F;
 Tue, 28 Apr 2020 09:38:42 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.87.72])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 09:38:42 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] Offline memoryless cpuless node 0
Date: Tue, 28 Apr 2020 15:08:33 +0530
Message-Id: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_05:2020-04-27,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=898 mlxscore=0 suspectscore=2
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280082
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
Cc: Michal Hocko <mhocko@suse.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog v1:->v2:
- Rebased to v5.7-rc3
- Updated the changelog.

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

v5.7-rc3
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

v5.7-rc3 + patches
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

Srikar Dronamraju (3):
  powerpc/numa: Set numa_node for all possible cpus
  powerpc/numa: Prefer node id queried from vphn
  mm/page_alloc: Keep memoryless cpuless node 0 offline

 arch/powerpc/mm/numa.c | 32 ++++++++++++++++++++++----------
 mm/page_alloc.c        |  4 +++-
 2 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.20.1

