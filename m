Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B72867C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 20:53:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63PP2qdnzDqJY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 05:52:57 +1100 (AEDT)
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
 header.s=pp1 header.b=DAj++2nf; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C635C02hZzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 05:38:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097IY3W1003173; Wed, 7 Oct 2020 14:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xQtWJPWfqC6T6qTymMjr51+uavOIW/PhuyLgjkSZqzc=;
 b=DAj++2nfDsJ5mlfRrKHerp+/XLsXgts0YFu6G+BI8dNvibpkK+0O0sGltLe4Z66EJjXo
 Pf0fKcUmcq3nhelIlZeGMyibRoTuseOETsiaBbiTurRdV995AFcBVXX9AxLM7vi9hmJG
 wjMQisVT04cgywfRCmJeS/jihkqpkFII2OX0ZRyF0+zGObc1aOcE5WV2CUxmY08n+/NF
 ViDIdV6kSP0dB+UVKT4xTyQHpDYnUmdx88Z4i4Uo6nbxV4hTNhR8VhOfxxq+gQix5n9+
 UBDUkbDXm6H+zoI4as2O4ydUmJZWK0i82iMv/LvqkeyA9OaThzZok0Gtra7i6WeNclCq ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341hb2udsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:40 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097IYZJ7005661;
 Wed, 7 Oct 2020 14:38:40 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341hb2udrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:39 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097IRWFY021756;
 Wed, 7 Oct 2020 18:38:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 33xgx84jft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 18:38:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097IcaJA31785466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 18:38:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7BECA4064;
 Wed,  7 Oct 2020 18:38:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F971A405C;
 Wed,  7 Oct 2020 18:38:32 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.90.101])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 18:38:32 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 07/11] powerpc/smp: Depend on cpu_l1_cache_map when adding
 CPUs
Date: Thu,  8 Oct 2020 00:07:56 +0530
Message-Id: <20201007183800.27415-8-srikar@linux.vnet.ibm.com>
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
 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently on hotplug/hotunplug, CPU iterates through all the CPUs in
its core to find threads in its thread group. However this info is
already captured in cpu_l1_cache_map. Hence reduce iterations and
cleanup add_cpu_to_smallcore_masks function.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
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
 arch/powerpc/kernel/smp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 441c9c64b1e3..aeb219a4bf7a 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1285,16 +1285,15 @@ static void remove_cpu_from_masks(int cpu)
 
 static inline void add_cpu_to_smallcore_masks(int cpu)
 {
-	struct cpumask *this_l1_cache_map = per_cpu(cpu_l1_cache_map, cpu);
-	int i, first_thread = cpu_first_thread_sibling(cpu);
+	int i;
 
 	if (!has_big_cores)
 		return;
 
 	cpumask_set_cpu(cpu, cpu_smallcore_mask(cpu));
 
-	for (i = first_thread; i < first_thread + threads_per_core; i++) {
-		if (cpu_online(i) && cpumask_test_cpu(i, this_l1_cache_map))
+	for_each_cpu(i, per_cpu(cpu_l1_cache_map, cpu)) {
+		if (cpu_online(i))
 			set_cpus_related(i, cpu, cpu_smallcore_mask);
 	}
 }
-- 
2.17.1

