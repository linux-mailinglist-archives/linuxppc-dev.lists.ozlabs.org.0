Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D584526807B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 19:13:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqGKg6cQszDqZS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 03:13:27 +1000 (AEST)
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
 header.s=pp1 header.b=eto8ugTb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqGGq6jVbzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 03:10:59 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08DH270b152170; Sun, 13 Sep 2020 13:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Dgsia/5LQ2jqVmTvmLFqD/K6oGAUxu6vI0wlZRbayO8=;
 b=eto8ugTbpHD26yviTfv910Px5hCBItA9vPgU+9IUdyVtkTMcuQi4kDDJ5b9KtqOVa+se
 xw5g8ZmcZcEoYrKZ/ergTn87YtZ1H+932Oo/jHj7MaGXTBzc58qbMqa53QQqmel5JuL+
 A0df9/6+Hthcl6Iei8EqEpDM5s5PowjHP1YoPLE1dYeF13zbwS/oPuKiBiELGjLby70c
 kpAZ32uMoJSJV7bEmdfxetwerOrP1MVNoxFJHRo9RDzp2+CIEguks2SYm1Gxkf9ScC1i
 iuGiVPSqoGznLMnNhghIVIn8nyY2nRBxq9o872SyexDvI15nybTcYNGYImVf1wcyyufI /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hqbjg8f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 13:10:47 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08DH2qt2153689;
 Sun, 13 Sep 2020 13:10:46 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hqbjg8es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 13:10:46 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08DH7odG004965;
 Sun, 13 Sep 2020 17:10:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 33hb1j0gmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 17:10:44 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08DHAfuN18612542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Sep 2020 17:10:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 426885204E;
 Sun, 13 Sep 2020 17:10:41 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id D3FBD5204F;
 Sun, 13 Sep 2020 17:10:38 +0000 (GMT)
Date: Sun, 13 Sep 2020 22:40:38 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200913171038.GB11808@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
 <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
 <87y2lgr0ic.fsf@mpe.ellerman.id.au>
 <20200912044603.GA11808@linux.vnet.ibm.com>
 <87imciqwhq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87imciqwhq.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-13_05:2020-09-10,
 2020-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009130149
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix to make it work where CPUs dont have a l2-cache element.

------------>8-----------------------------------------8<---------------------

From b25d47b01b7195b1df19083a4043fa6a87a901a3 Mon Sep 17 00:00:00 2001
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Date: Thu, 9 Jul 2020 13:33:38 +0530
Subject: [PATCH v5.2 05/10] powerpc/smp: Dont assume l2-cache to be superset of
 sibling

Current code assumes that cpumask of cpus sharing a l2-cache mask will
always be a superset of cpu_sibling_mask.

Lets stop that assumption. cpu_l2_cache_mask is a superset of
cpu_sibling_mask if and only if shared_caches is set.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1 -> v2:
	Set cpumask after verifying l2-cache. (Gautham)

Changelog v5 -> v5.2:
	If cpu has no l2-cache set cpumask as per its
                 sibling mask. (Michael Ellerman)

 arch/powerpc/kernel/smp.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9f4333d..168532e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1186,9 +1186,23 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
 	int i;
 
 	l2_cache = cpu_to_l2cache(cpu);
-	if (!l2_cache)
+	if (!l2_cache) {
+		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
+
+		/*
+		 * If no l2cache for this CPU, assume all siblings to share
+		 * cache with this CPU.
+		 */
+		if (has_big_cores)
+			sibling_mask = cpu_smallcore_mask;
+
+		for_each_cpu(i, sibling_mask(cpu))
+			set_cpus_related(cpu, i, cpu_l2_cache_mask);
+
 		return false;
+	}
 
+	cpumask_set_cpu(cpu, mask_fn(cpu));
 	for_each_cpu(i, cpu_online_mask) {
 		/*
 		 * when updating the marks the current CPU has not been marked
@@ -1271,29 +1285,30 @@ static void add_cpu_to_masks(int cpu)
 	 * add it to it's own thread sibling mask.
 	 */
 	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
+	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++)
 		if (cpu_online(i))
 			set_cpus_related(i, cpu, cpu_sibling_mask);
 
 	add_cpu_to_smallcore_masks(cpu);
-	/*
-	 * Copy the thread sibling mask into the cache sibling mask
-	 * and mark any CPUs that share an L2 with this CPU.
-	 */
-	for_each_cpu(i, cpu_sibling_mask(cpu))
-		set_cpus_related(cpu, i, cpu_l2_cache_mask);
 	update_mask_by_l2(cpu, cpu_l2_cache_mask);
 
-	/*
-	 * Copy the cache sibling mask into core sibling mask and mark
-	 * any CPUs on the same chip as this CPU.
-	 */
-	for_each_cpu(i, cpu_l2_cache_mask(cpu))
-		set_cpus_related(cpu, i, cpu_core_mask);
+	if (pkg_id == -1) {
+		struct cpumask *(*mask)(int) = cpu_sibling_mask;
+
+		/*
+		 * Copy the sibling mask into core sibling mask and
+		 * mark any CPUs on the same chip as this CPU.
+		 */
+		if (shared_caches)
+			mask = cpu_l2_cache_mask;
+
+		for_each_cpu(i, mask(cpu))
+			set_cpus_related(cpu, i, cpu_core_mask);
 
-	if (pkg_id == -1)
 		return;
+	}
 
 	for_each_cpu(i, cpu_online_mask)
 		if (get_physical_package_id(i) == pkg_id)
-- 
2.17.1

