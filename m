Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 438922921F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 06:31:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF3jq5M97zDqYq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 15:31:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ctCe2hEP; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF3dd17JTzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 15:27:48 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09J41RER076227; Mon, 19 Oct 2020 00:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MI7zyXewknhAYJHymZpcCXGuyFhihkn50b+tTV3CY7U=;
 b=ctCe2hEP8yWMdamgXBIjBcryUR9Bs22iMMNYzgaOMEcEcAEizQe1bKTPjEP6xhYlTd8v
 /jzuOScgnnEOIxEGqP25JWsn56det8Ok9R7ORh+WBtq2l7462cPNU/YjUOl1DrIy1UmQ
 qqEoxY7j7W29YHJ+mTrKKeAQw3VHYk1MXo3f6VyLwn6UpYkb2VLkcamQAqGTt0eyrXEV
 PsC6DQd6CD7+ylKdCWIZEuKWGV54yaw41VJ4gznm0zR4gOYacCPNa/yYGgUJrbUR4Osk
 HVb+17d8HBXBaUrDCpvzU/sFEwdQ9ZOoct9MvHP0TkRE0mAT7xmILu+ZIU6CNTloHgVL xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349232sxc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 00:27:32 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09J4KEXo120325;
 Mon, 19 Oct 2020 00:27:32 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349232sxbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 00:27:32 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09J4IpMh024453;
 Mon, 19 Oct 2020 04:27:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 347r889pbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 04:27:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09J4RS2825952754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 04:27:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D273A4055;
 Mon, 19 Oct 2020 04:27:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92B4DA4053;
 Mon, 19 Oct 2020 04:27:25 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.221.103])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 04:27:25 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/smp: Remove unnecessary variable
Date: Mon, 19 Oct 2020 09:57:15 +0530
Message-Id: <20201019042716.106234-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019042716.106234-1-srikar@linux.vnet.ibm.com>
References: <20201019042716.106234-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-18_13:2020-10-16,
 2020-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190028
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>, Qian Cai <cai@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 3ab33d6dc3e9 ("powerpc/smp: Optimize update_mask_by_l2")
introduced submask_fn in update_mask_by_l2 to track the right submask.
However commit f6606cfdfbcd ("powerpc/smp: Dont assume l2-cache to be
superset of sibling") introduced sibling_mask in update_mask_by_l2 to
track the same submask. Remove sibling_mask in favour of submask_fn.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Qian Cai <cai@redhat.com>
---
 arch/powerpc/kernel/smp.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 8d1c401f4617..a864b9b3228c 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1264,18 +1264,16 @@ static bool update_mask_by_l2(int cpu)
 	cpumask_var_t mask;
 	int i;
 
+	if (has_big_cores)
+		submask_fn = cpu_smallcore_mask;
+
 	l2_cache = cpu_to_l2cache(cpu);
 	if (!l2_cache) {
-		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
-
 		/*
 		 * If no l2cache for this CPU, assume all siblings to share
 		 * cache with this CPU.
 		 */
-		if (has_big_cores)
-			sibling_mask = cpu_smallcore_mask;
-
-		for_each_cpu(i, sibling_mask(cpu))
+		for_each_cpu(i, submask_fn(cpu))
 			set_cpus_related(cpu, i, cpu_l2_cache_mask);
 
 		return false;
@@ -1284,9 +1282,6 @@ static bool update_mask_by_l2(int cpu)
 	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
 	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
 
-	if (has_big_cores)
-		submask_fn = cpu_smallcore_mask;
-
 	/* Update l2-cache mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
 
-- 
2.18.2

