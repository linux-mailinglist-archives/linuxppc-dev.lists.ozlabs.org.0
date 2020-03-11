Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B21816C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 12:24:51 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cqPD1llWzDqGl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 22:24:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cqJb4kyfzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 22:20:42 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BB2Mcp138219
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:03:26 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ypt3d5jh0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:03:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 11 Mar 2020 11:02:59 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 11:02:55 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02BB2sEI41680930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 11:02:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57FD95204E;
 Wed, 11 Mar 2020 11:02:54 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.25.51])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6031352050;
 Wed, 11 Mar 2020 11:02:51 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] Offline memoryless cpuless node 0
Date: Wed, 11 Mar 2020 16:32:34 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20031111-0028-0000-0000-000003E31105
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031111-0029-0000-0000-000024A85500
Message-Id: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_04:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=2
 lowpriorityscore=0 mlxlogscore=966 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110071
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

v5.6-rc4
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

v5.6-rc4 + patches
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
1.8.3.1

