Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E94C2D5883
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 11:48:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs9ck48RYzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 21:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=B6YPq7WF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs9QT5dXXzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 21:39:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAAVYCB107737; Thu, 10 Dec 2020 05:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=ZLlPvSxtGuA5l8o79JDmDy4sIpOj53za4k6QjZgLrLw=;
 b=B6YPq7WFBv+arnnAtRGJBenIYl1A49aV9QUudoMBJnVCC8FjC9pfJfd8wfJ6o+0moDNq
 DellbO6QIErCBWyGTPhBjtIjb/ZeKC2iQaWIP6kCTAq7qQv8QRoLQzZuOOTFh0eOLWFf
 QBgwlz1oM/i4TFse99SaJKJTMl0d+CiQsXe5akws9sspa0X1lVM5FZzXt7FDPSFam5Vl
 PIZl+bXKNuZOtye0RrcinJQ11ceuC9hkoPEbzwyQQ2HSbSoVabrqRg0XWT8pd9Hu8u/h
 zKdL855Ob48RXTEvMij1snZpmcfi4nUnrSX+CbKY6ynODWbBlCkFeRIcq53LNEv749WD dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bhc0set6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 05:39:12 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BAAXl6n118686;
 Thu, 10 Dec 2020 05:39:12 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bhc0sess-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 05:39:12 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAAW1L2025518;
 Thu, 10 Dec 2020 10:39:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3581u9rebh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 10:39:11 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAAdAsg33096168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 10:39:10 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F133928058;
 Thu, 10 Dec 2020 10:39:09 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C93028059;
 Thu, 10 Dec 2020 10:39:09 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.53.52])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 10 Dec 2020 10:39:09 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 177A32E35B8; Thu, 10 Dec 2020 16:09:06 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH v3 3/5] powerpc/smp: Rename init_thread_group_l1_cache_map()
 to make it generic
Date: Thu, 10 Dec 2020 16:08:57 +0530
Message-Id: <1607596739-32439-4-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607596739-32439-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607596739-32439-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_03:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100067
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

init_thread_group_l1_cache_map() initializes the per-cpu cpumask
thread_group_l1_cache_map with the core-siblings which share L1 cache
with the CPU. Make this function generic to the cache-property (L1 or
L2) and update a suitable mask. This is a preparatory patch for the
next patch where we will introduce discovery of thread-groups that
share L2-cache.

No functional change.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index f3290d5..9078b5b5 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -866,15 +866,18 @@ static struct thread_groups *__init get_thread_groups(int cpu,
 	return tg;
 }
 
-static int init_thread_group_l1_cache_map(int cpu)
+static int __init init_thread_group_cache_map(int cpu, int cache_property)
 
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
 	int i, cpu_group_start = -1, err = 0;
 	struct thread_groups *tg = NULL;
+	cpumask_var_t *mask;
 
-	tg = get_thread_groups(cpu, THREAD_GROUP_SHARE_L1,
-			       &err);
+	if (cache_property != THREAD_GROUP_SHARE_L1)
+		return -EINVAL;
+
+	tg = get_thread_groups(cpu, cache_property, &err);
 	if (!tg)
 		return err;
 
@@ -885,8 +888,8 @@ static int init_thread_group_l1_cache_map(int cpu)
 		return -ENODATA;
 	}
 
-	zalloc_cpumask_var_node(&per_cpu(thread_group_l1_cache_map, cpu),
-				GFP_KERNEL, cpu_to_node(cpu));
+	mask = &per_cpu(thread_group_l1_cache_map, cpu);
+	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++) {
 		int i_group_start = get_cpu_thread_group_start(i, tg);
@@ -897,7 +900,7 @@ static int init_thread_group_l1_cache_map(int cpu)
 		}
 
 		if (i_group_start == cpu_group_start)
-			cpumask_set_cpu(i, per_cpu(thread_group_l1_cache_map, cpu));
+			cpumask_set_cpu(i, *mask);
 	}
 
 	return 0;
@@ -976,7 +979,7 @@ static int init_big_cores(void)
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		int err = init_thread_group_l1_cache_map(cpu);
+		int err = init_thread_group_cache_map(cpu, THREAD_GROUP_SHARE_L1);
 
 		if (err)
 			return err;
-- 
1.9.4

