Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E689248054
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW3gn4xkQzDq9j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 18:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sBg1Zh8V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW3YT6nJLzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 18:12:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07I81JY9114794; Tue, 18 Aug 2020 04:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=n/JmR5KruIHZvbLzMxijcT999B5k7s3kVo6okQwOPlU=;
 b=sBg1Zh8V6RkmXAj4cHsxY+htM73BXoRP9g9eKan1dFICG1gI4J2la8t/7Vu4ox1junsb
 DbrBxD3NLfJgtomOrsisgxX9y9SH9+Mb82jmX9+MrXFy5u13neAiWKLjm6DTZl/QeoXf
 YYPkyEoFkXJ8ETE/P647C8dZODHQvG3XTF1rzMWeZK+YwYCiOSl2W79esg9I0jkqdwwA
 Q27KNl8G5A2WTSMjXK12l5UipLBNsA82flQ7ALbPR5L54nDF4OK9d/FlCK/9Z8dtVHfl
 tSBkaJo56ddPjgqa6WMdNLKC631wloQ4LqoHwdu7vKp9FY4vzRrYFIDWJcPda8owQb58 ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3304qusd7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:12:26 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I81NEN115225;
 Tue, 18 Aug 2020 04:12:26 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3304qusd6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:12:26 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I89qSU004244;
 Tue, 18 Aug 2020 08:12:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3304bbr7sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 08:12:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07I8CMob29753690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 08:12:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD10CA4057;
 Tue, 18 Aug 2020 08:12:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5369DA4040;
 Tue, 18 Aug 2020 08:12:18 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.93.83])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Aug 2020 08:12:17 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 3/3] powerpc/numa: Offline memoryless cpuless node 0
Date: Tue, 18 Aug 2020 13:41:04 +0530
Message-Id: <20200818081104.57888-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818081104.57888-1-srikar@linux.vnet.ibm.com>
References: <20200818081104.57888-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-18_04:2020-08-18,
 2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 suspectscore=2
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
 Mel Gorman <mgorman@suse.de>, Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 Christopher Lameter <cl@linux.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently Linux kernel with CONFIG_NUMA on a system with multiple
possible nodes, marks node 0 as online at boot.  However in practice,
there are systems which have node 0 as memoryless and cpuless.

This can cause numa_balancing to be enabled on systems with only one node
with memory and CPUs. The existence of this dummy node which is cpuless and
memoryless node can confuse users/scripts looking at output of lscpu /
numactl.

By marking, node 0 as offline, lets stop assuming that node 0 is
always online. If node 0 has CPU or memory that are online, node 0 will
again be set as online.

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

v5.8 + patch
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

Example of a node with online CPUs/memory on node 0.
(Same o/p with and without patch)
numactl -H
available: 4 nodes (0-3)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
node 0 size: 32482 MB
node 0 free: 22994 MB
node 1 cpus: 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95
node 1 size: 0 MB
node 1 free: 0 MB
node 2 cpus: 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
node 2 size: 0 MB
node 2 free: 0 MB
node 3 cpus: 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 node 3 size: 0 MB
node 3 free: 0 MB
node distances:
node   0   1   2   3
  0:  10  20  40  40
  1:  20  10  40  40
  2:  40  40  10  20
  3:  40  40  20  10

Note: On Powerpc, cpu_to_node of possible but not present cpus would
previously return 0. Hence this commit depends on commit ("powerpc/numa: Set
numa_node for all possible cpus") and commit ("powerpc/numa: Prefer node id
queried from vphn"). Without the 2 commits, Powerpc system might crash.

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
Cc: David Hildenbrand <david@redhat.com>
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v5->v6:
	Moved fix from arch independent code to powerpc specific
				(Michal Hocko, Christopher Lamater)
 arch/powerpc/mm/numa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 10c5064eeb88..0d72a7d4360e 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -924,6 +924,16 @@ void __init mem_topology_setup(void)
 {
 	int cpu;
 
+	/*
+	 * Linux/mm assumes node 0 to be online at boot. However this is not
+	 * true on PowerPC, where node 0 is similar to any other node, it
+	 * could be cpuless, memoryless node. So force node 0 to be offline
+	 * for now. This will prevent cpuless, memoryless node 0 showing up
+	 * unnecessarily as online. If a node has cpus or memory that need
+	 * to be online, then node will anyway be marked online.
+	 */
+	node_set_offline(0);
+
 	if (parse_numa_properties())
 		setup_nonnuma();
 
-- 
2.18.1

