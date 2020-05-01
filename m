Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 135C91C0C7A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:15:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cy6z0ntSzDr5V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:15:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cy2z2wf0zDr5V
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:11:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04131Qxa067787; Thu, 30 Apr 2020 23:11:44 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30r81gd49j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 23:11:44 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0412tELv019276;
 Fri, 1 May 2020 03:11:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 30mcu5b6nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 03:11:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0413Besu59441300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 May 2020 03:11:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B14411C058;
 Fri,  1 May 2020 03:11:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7457911C052;
 Fri,  1 May 2020 03:11:37 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.43.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 May 2020 03:11:37 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 1/3] powerpc/numa: Set numa_node for all possible cpus
Date: Fri,  1 May 2020 08:41:26 +0530
Message-Id: <20200501031128.19584-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501031128.19584-1-srikar@linux.vnet.ibm.com>
References: <20200501031128.19584-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_13:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005010017
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A Powerpc system with multiple possible nodes and with CONFIG_NUMA
enabled always used to have a node 0, even if node 0 does not any cpus
or memory attached to it. As per PAPR, node affinity of a cpu is only
available once its present / online. For all cpus that are possible but
not present, cpu_to_node() would point to node 0.

To ensure a cpuless, memoryless dummy node is not online, powerpc need
to make sure all possible but not present cpu_to_node are set to a
proper node.

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
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1:->v2:
- Rebased to v5.7-rc3

 arch/powerpc/mm/numa.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9fcf2d195830..b3615b7fdbdf 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -931,8 +931,20 @@ void __init mem_topology_setup(void)
 
 	reset_numa_cpu_lookup_table();
 
-	for_each_present_cpu(cpu)
-		numa_setup_cpu(cpu);
+	for_each_possible_cpu(cpu) {
+		/*
+		 * Powerpc with CONFIG_NUMA always used to have a node 0,
+		 * even if it was memoryless or cpuless. For all cpus that
+		 * are possible but not present, cpu_to_node() would point
+		 * to node 0. To remove a cpuless, memoryless dummy node,
+		 * powerpc need to make sure all possible but not present
+		 * cpu_to_node are set to a proper node.
+		 */
+		if (cpu_present(cpu))
+			numa_setup_cpu(cpu);
+		else
+			set_cpu_numa_node(cpu, first_online_node);
+	}
 }
 
 void __init initmem_init(void)
-- 
2.20.1

