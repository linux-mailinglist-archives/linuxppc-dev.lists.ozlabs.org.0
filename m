Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1252867D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 20:56:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63Tf6XLgzDqD9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 05:56:38 +1100 (AEDT)
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
 header.s=pp1 header.b=bruOniTt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C635M2xMKzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 05:39:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097IaMNN127765; Wed, 7 Oct 2020 14:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YhTr57ybxkDYrEZhQrF86XWHP9TAEuy26lA34g/lbtY=;
 b=bruOniTtYlohBhFWelPacxV2VvZCCoK8m2nlNw58u3ieNNhnKQspTASLuPmmnQycSBFL
 TGUC8mCEHMb4T/Dt+uZipuTW44ENyvzQp/fshE3act6h73nplT9GPbqakBO7KJYW+V3s
 Hgx5DbX/rNeAmhfU0b9LKd7IeWg6MCUhnRw9ZfBbOdV6Ym3DTtB0FbWhRvpz9Dok8E2g
 p8y06iW4sR1faWyeWoBtkRYgXE+lm8+lMpMWhBqa3tAZe1Sj8K4nmWL0RUQfsb0IudgA
 S2JFAdk8O93cRX22qwosaymrfj+b22A9+2WgTjlkNruOaKXtz1CCp3lL82NIiw5HmxVj 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 341jak1exh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:52 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097IcpeA141119;
 Wed, 7 Oct 2020 14:38:51 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 341jak1ewn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:51 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097IROEP021725;
 Wed, 7 Oct 2020 18:38:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 33xgx84jfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 18:38:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 097IclgD28115216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 18:38:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C155A4060;
 Wed,  7 Oct 2020 18:38:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3C83A4054;
 Wed,  7 Oct 2020 18:38:43 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.90.101])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 18:38:43 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 10/11] powerpc/smp: Move coregroup mask updation to a new
 function
Date: Thu,  8 Oct 2020 00:07:59 +0530
Message-Id: <20201007183800.27415-11-srikar@linux.vnet.ibm.com>
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
 adultscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070116
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

Move the logic for updating the coregroup mask of a CPU to its own
function. This will help in reworking the updation of coregroup mask in
subsequent patch.

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
 arch/powerpc/kernel/smp.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 17e90c2414af..b48ae4e306d3 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1338,6 +1338,23 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 	}
 }
 
+static void update_coregroup_mask(int cpu)
+{
+	int first_thread = cpu_first_thread_sibling(cpu);
+	int coregroup_id = cpu_to_coregroup_id(cpu);
+	int i;
+
+	cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
+	for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
+		int fcpu = cpu_first_thread_sibling(i);
+
+		if (fcpu == first_thread)
+			set_cpus_related(cpu, i, cpu_coregroup_mask);
+		else if (coregroup_id == cpu_to_coregroup_id(i))
+			set_cpus_related(cpu, i, cpu_coregroup_mask);
+	}
+}
+
 static void add_cpu_to_masks(int cpu)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
@@ -1356,19 +1373,8 @@ static void add_cpu_to_masks(int cpu)
 	add_cpu_to_smallcore_masks(cpu);
 	update_mask_by_l2(cpu);
 
-	if (has_coregroup_support()) {
-		int coregroup_id = cpu_to_coregroup_id(cpu);
-
-		cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
-		for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
-			int fcpu = cpu_first_thread_sibling(i);
-
-			if (fcpu == first_thread)
-				set_cpus_related(cpu, i, cpu_coregroup_mask);
-			else if (coregroup_id == cpu_to_coregroup_id(i))
-				set_cpus_related(cpu, i, cpu_coregroup_mask);
-		}
-	}
+	if (has_coregroup_support())
+		update_coregroup_mask(cpu);
 }
 
 /* Activate a secondary processor. */
-- 
2.17.1

