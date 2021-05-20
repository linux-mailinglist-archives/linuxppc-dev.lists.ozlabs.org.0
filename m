Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04C738B37B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmDcr6Qpcz3cBn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 01:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZfM3R+Jr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZfM3R+Jr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmDZx5gP1z301p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 01:45:13 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KFY5hV043013; Thu, 20 May 2021 11:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pQGY4jNTts+73SN3k2bYuXF2IcfoCawtUPZI0Dx9pCg=;
 b=ZfM3R+JrFcJOdpl3oP3lZEIlvRXy+BCdemIWLZWvRFT6ZWefZuDHga1VlOC2xaKhH6eL
 YbxlPC4RppKP4JsBPiOARHQGzPapVaqgSXolzF1sIwQPyRPYMvRVFpPW6GTMI5t5Teg5
 TkNXQDDr4yfSgknbBzLVqVI2fo2WLKLIfKIIjbyYhIgEa5wuG00TcLsoxyzJ8Go+An3O
 fdbXQfqoMYYfLTQuk01bSBpWMuDwW+znl9PSf2/b/o0X/RQYtbb//VJrN+hDWiYxPwGw
 5amcAv+lrogxm2YmAG0l2IRzMec11eru0lba3GJ+yyXfxcL5lq9qzg1efg+vi4rUb/fW xg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38nsh32ppn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 11:44:53 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KFa9b6030159;
 Thu, 20 May 2021 15:44:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh1gvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 15:44:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KFimVt29098334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 15:44:48 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E2ADA4040;
 Thu, 20 May 2021 15:44:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72D18A4053;
 Thu, 20 May 2021 15:44:45 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.77.198.25])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 15:44:45 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 3/3] sched/topology: Skip updating masks for non-online nodes
Date: Thu, 20 May 2021 21:14:27 +0530
Message-Id: <20210520154427.1041031-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: beR8I2y4bAIXHz4b5IfZsaQD4o1I6Gff
X-Proofpoint-ORIG-GUID: beR8I2y4bAIXHz4b5IfZsaQD4o1I6Gff
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_04:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200104
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently scheduler doesn't check if node is online before adding CPUs
to the node mask. However on some architectures, node distance is only
available for nodes that are online. Its not sure how much to rely on
the node distance, when one of the nodes is offline.

If said node distance is fake (since one of the nodes is offline) and
the actual node distance is different, then the cpumask of such nodes
when the nodes become becomes online will be wrong.

This can cause topology_span_sane to throw up a warning message and the
rest of the topology being not updated properly.

Resolve this by skipping update of cpumask for nodes that are not
online.

Cc: LKML <linux-kernel@vger.kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 kernel/sched/topology.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index ccb9aff59add..ba0555e83548 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1731,6 +1731,9 @@ void sched_init_numa(void)
 			sched_domains_numa_masks[i][j] = mask;
 
 			for_each_node(k) {
+				if (!node_online(j))
+					continue;
+
 				if (sched_debug() && (node_distance(j, k) != node_distance(k, j)))
 					sched_numa_warn("Node-distance not symmetric");
 
@@ -1793,6 +1796,9 @@ void sched_domains_numa_masks_set(unsigned int cpu)
 
 	for (i = 0; i < sched_domains_numa_levels; i++) {
 		for (j = 0; j < nr_node_ids; j++) {
+			if (!node_online(j))
+				continue;
+
 			if (node_distance(j, node) <= sched_domains_numa_distance[i])
 				cpumask_set_cpu(cpu, sched_domains_numa_masks[i][j]);
 		}
-- 
2.27.0

