Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 960EE248049
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:16:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW3db6YDvzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 18:16:03 +1000 (AEST)
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
 header.s=pp1 header.b=hotJtzwJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW3YQ5gf6zDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 18:12:26 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07I81seQ019531; Tue, 18 Aug 2020 04:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=G6FdMnRnBbJelDSmHpHS6pNSWA5jStVlCMtnhbO1yCU=;
 b=hotJtzwJUNdKJgUngmdNbYveuIgxvnGpvpPLyNyblJhXT8Mug9vvssT1MIsJAge81+9/
 Xdo7GkMrVfz78CQpbMrKF9A9zV61YcfYlcEoGtqHhAJAgNFyZEngr0NxlJxe1+vowYzI
 moeyFsIkE9f41TEm1//xGoysdijEcLcCY7oibhR6e47r5Nyp9WilbRZMyLSIgWZx08HU
 DHgS/zG2ydC87pac3x+BtAI79EluMXPJkCAFuj9aVgmcff6fGLMlKHo0qRh62EraRZXO
 nVtLECNgI8n7PcFWbHMwI+6x4lOO9GjHVhKXnlbK++A+wraXW9CA0VD5m7qSFjc5W6P3 dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304tds9p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:12:18 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I833EQ023892;
 Tue, 18 Aug 2020 04:12:17 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304tds9mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:12:17 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I8Bk2N010553;
 Tue, 18 Aug 2020 08:12:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3304tr87aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 08:12:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07I8CCaT25166112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 08:12:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5EB2A4053;
 Tue, 18 Aug 2020 08:12:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F32CBA4051;
 Tue, 18 Aug 2020 08:12:08 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.93.83])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Aug 2020 08:12:08 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 1/3] powerpc/numa: Set numa_node for all possible cpus
Date: Tue, 18 Aug 2020 13:41:02 +0530
Message-Id: <20200818081104.57888-2-srikar@linux.vnet.ibm.com>
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
 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180051
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
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v3:->v4:
- Resolved comments from Christopher.
Link v3: http://lore.kernel.org/lkml/20200501031128.19584-1-srikar@linux.vnet.ibm.com/t/#u

 arch/powerpc/mm/numa.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 1f61fa2148b5..72f6cca1332c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -507,6 +507,11 @@ static int numa_setup_cpu(unsigned long lcpu)
 	int fcpu = cpu_first_thread_sibling(lcpu);
 	int nid = NUMA_NO_NODE;
 
+	if (!cpu_present(lcpu)) {
+		set_cpu_numa_node(lcpu, first_online_node);
+		return first_online_node;
+	}
+
 	/*
 	 * If a valid cpu-to-node mapping is already available, use it
 	 * directly instead of querying the firmware, since it represents
@@ -935,8 +940,17 @@ void __init mem_topology_setup(void)
 
 	reset_numa_cpu_lookup_table();
 
-	for_each_present_cpu(cpu)
+	for_each_possible_cpu(cpu) {
+		/*
+		 * Powerpc with CONFIG_NUMA always used to have a node 0,
+		 * even if it was memoryless or cpuless. For all cpus that
+		 * are possible but not present, cpu_to_node() would point
+		 * to node 0. To remove a cpuless, memoryless dummy node,
+		 * powerpc need to make sure all possible but not present
+		 * cpu_to_node are set to a proper node.
+		 */
 		numa_setup_cpu(cpu);
+	}
 }
 
 void __init initmem_init(void)
-- 
2.18.1

