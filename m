Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7882867C9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 20:54:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63RZ4NpczDqT1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 05:54:50 +1100 (AEDT)
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
 header.s=pp1 header.b=LM/PQklO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C635F3Lm0zDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 05:38:57 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097IXxHA154234; Wed, 7 Oct 2020 14:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0mzFPsUPzPpMGLgzb1J/X0dlrC4hyptDZFlZynf5UEU=;
 b=LM/PQklO2gStEW0mxZfoi5fhSKtrZxtiKAy+nZicMxgGgSHGa5wt4iasabC4+yM1kn9H
 X+zfgP2FUGp7lPf3k1+iZFQqUbpa49kuQ2ITEGA06+rAiLSuUNgESz8e4Udzv6Koh4DQ
 2XTQ3lO6YFiTEeu2YGbCaq1yOJMeVWfq8LClyIh5dvn27NvcoDqW5gQ04uoXonWZ8gdz
 S70+Jz3Vxcd+H0YSJCdj89nAEt5SIEVeSBRn0As2yalNICaFDvJic+vyn4Glr6GYK/8M
 mdXS0VRJI2pgNqJ8ien8qgsZxJl0J9gQu/HjMZO8ppsEeVAZ8b/muAr0DFlFG4zU9ZRZ vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341jgyryma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:45 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097IYAcB155222;
 Wed, 7 Oct 2020 14:38:45 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341jgyryjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:44 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097IRTk5016759;
 Wed, 7 Oct 2020 18:38:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 33xgx82ctq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 18:38:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097IcdfV31523232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 18:38:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA306A405F;
 Wed,  7 Oct 2020 18:38:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A9BFA405C;
 Wed,  7 Oct 2020 18:38:36 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.90.101])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 18:38:36 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 08/11] powerpc/smp: Check for duplicate topologies and
 consolidate
Date: Thu,  8 Oct 2020 00:07:57 +0530
Message-Id: <20201007183800.27415-9-srikar@linux.vnet.ibm.com>
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
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
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
 Valentin Schneider <valentin.schneider@arm.com>, Qian Cai <cai@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CACHE and COREGROUP domains are now part of default topology. However on
systems that don't support CACHE or COREGROUP, these domains will
eventually be degenerated. The degeneration happens per CPU. Do note the
current fixup_topology() logic ensures that mask of a domain that is not
supported on the current platform is set to the previous domain.

Instead of waiting for the scheduler to degenerated try to consolidate
based on their masks and sd_flags. This is done just before setting
the scheduler topology.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
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
Cc: Qian Cai <cai@redhat.com>
---
 arch/powerpc/kernel/smp.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index aeb219a4bf7a..6f866e6b12f8 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1401,6 +1401,8 @@ int setup_profiling_timer(unsigned int multiplier)
 
 static void fixup_topology(void)
 {
+	int i;
+
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
@@ -1410,6 +1412,30 @@ static void fixup_topology(void)
 
 	if (!has_coregroup_support())
 		powerpc_topology[mc_idx].mask = powerpc_topology[cache_idx].mask;
+
+	/*
+	 * Try to consolidate topology levels here instead of
+	 * allowing scheduler to degenerate.
+	 * - Dont consolidate if masks are different.
+	 * - Dont consolidate if sd_flags exists and are different.
+	 */
+	for (i = 1; i <= die_idx; i++) {
+		if (powerpc_topology[i].mask != powerpc_topology[i - 1].mask)
+			continue;
+
+		if (powerpc_topology[i].sd_flags && powerpc_topology[i - 1].sd_flags &&
+				powerpc_topology[i].sd_flags != powerpc_topology[i - 1].sd_flags)
+			continue;
+
+		if (!powerpc_topology[i - 1].sd_flags)
+			powerpc_topology[i - 1].sd_flags = powerpc_topology[i].sd_flags;
+
+		powerpc_topology[i].mask = powerpc_topology[i + 1].mask;
+		powerpc_topology[i].sd_flags = powerpc_topology[i + 1].sd_flags;
+#ifdef CONFIG_SCHED_DEBUG
+		powerpc_topology[i].name = powerpc_topology[i + 1].name;
+#endif
+	}
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
-- 
2.17.1

