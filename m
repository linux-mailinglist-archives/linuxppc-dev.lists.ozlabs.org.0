Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 046482867EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 21:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63Yb2zRFzDqVW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 06:00:03 +1100 (AEDT)
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
 header.s=pp1 header.b=DA/TlB+Z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C63Jf5g5HzDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 05:48:50 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097IXxl8154201; Wed, 7 Oct 2020 14:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3l7EmI1rLmUxp/ulwT0rD8TTtWYOCKblDswff8SjiME=;
 b=DA/TlB+Zmil9jPgrkt1Q5eTzV5cCpIkfCPkHmzwfT4kPKvyMSeymjw/tS7kRMGQx5ZcF
 K9p1XOCtkV86jjgFjgikY2Lfcs3sa1HviuGtrWtTyAGb7Fslm36oX5/YdYK1h/bJkbBJ
 GzmqK9LwWGAgZgmuRcblIVyAhf6n0CaR86O/5DWn6uqPPyOaDxeB1XCR0Ro9VvbCnnkm
 bvyyBi+NF+P3lJxciBUmq4VljO4TG2nHvQEA6IpkU1JinSJynEWAE8R7oZC6Xv0HtcVY
 cnoO9Xh7mi4p2ybGDjYBPTh5EAP42FdMhhpxg8zsVR8gYGCa1XXDbpzhLh1Upf2ng9hg IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341jgys91n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:48:39 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097IY2TY154418;
 Wed, 7 Oct 2020 14:48:38 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341jgys8yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:48:38 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097ISjXR014251;
 Wed, 7 Oct 2020 18:38:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 33xgjhac76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 18:38:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097IcpxJ27656648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 18:38:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3601FA405F;
 Wed,  7 Oct 2020 18:38:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB39A4054;
 Wed,  7 Oct 2020 18:38:47 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.90.101])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 18:38:47 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 11/11] powerpc/smp: Optimize update_coregroup_mask
Date: Thu,  8 Oct 2020 00:08:00 +0530
Message-Id: <20201007183800.27415-12-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007183800.27415-1-srikar@linux.vnet.ibm.com>
References: <20201007183800.27415-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_10:2020-10-07,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=2 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070116
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All threads of a SMT4/SMT8 core can either be part of CPU's coregroup
mask or outside the coregroup. Use this relation to reduce the
number of iterations needed to find all the CPUs that share the same
coregroup

Use a temporary mask to iterate through the CPUs that may share
coregroup mask. Also instead of setting one CPU at a time into
cpu_coregroup_mask, copy the SMT4/SMT8/submask at one shot.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v2->v3:
	Use GFP_ATOMIC instead of GFP_KERNEL since allocations need to
	atomic at the time of CPU HotPlug
	Reported by Qian Cai <cai@redhat.com>

 arch/powerpc/kernel/smp.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b48ae4e306d3..bbaea93dc558 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1340,19 +1340,34 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 
 static void update_coregroup_mask(int cpu)
 {
-	int first_thread = cpu_first_thread_sibling(cpu);
+	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
+	cpumask_var_t mask;
 	int coregroup_id = cpu_to_coregroup_id(cpu);
 	int i;
 
-	cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
-	for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
-		int fcpu = cpu_first_thread_sibling(i);
+	/* In CPU-hotplug path, hence use GFP_ATOMIC */
+	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
+	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
+
+	if (shared_caches)
+		submask_fn = cpu_l2_cache_mask;
 
-		if (fcpu == first_thread)
-			set_cpus_related(cpu, i, cpu_coregroup_mask);
-		else if (coregroup_id == cpu_to_coregroup_id(i))
-			set_cpus_related(cpu, i, cpu_coregroup_mask);
+	/* Update coregroup mask with all the CPUs that are part of submask */
+	or_cpumasks_related(cpu, cpu, submask_fn, cpu_coregroup_mask);
+
+	/* Skip all CPUs already part of coregroup mask */
+	cpumask_andnot(mask, mask, cpu_coregroup_mask(cpu));
+
+	for_each_cpu(i, mask) {
+		/* Skip all CPUs not part of this coregroup */
+		if (coregroup_id == cpu_to_coregroup_id(i)) {
+			or_cpumasks_related(cpu, i, submask_fn, cpu_coregroup_mask);
+			cpumask_andnot(mask, mask, submask_fn(i));
+		} else {
+			cpumask_andnot(mask, mask, cpu_coregroup_mask(i));
+		}
 	}
+	free_cpumask_var(mask);
 }
 
 static void add_cpu_to_masks(int cpu)
-- 
2.17.1

