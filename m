Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90025204F0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 12:29:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rjFd66KmzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:29:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rjCj3HzFzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 20:28:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49rjCj2wWFz8tW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 20:28:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49rjCj2YVxz9sRh; Tue, 23 Jun 2020 20:28:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49rjCh5WHNz9sRf
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Jun 2020 20:28:00 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NA2T26152064
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Jun 2020 06:27:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ud985mew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Jun 2020 06:27:57 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05NA2db3153183
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Jun 2020 06:27:57 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ud985me9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 06:27:56 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NAQYon003491;
 Tue, 23 Jun 2020 10:27:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 31sa381ya4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 10:27:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05NARqsF4522308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 10:27:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4468B4C04A;
 Tue, 23 Jun 2020 10:27:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A4F64C046;
 Tue, 23 Jun 2020 10:27:51 +0000 (GMT)
Received: from [192.168.122.1] (unknown [9.199.32.33])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 10:27:51 +0000 (GMT)
Subject: [PATCH v2] hmi: Move hmi irq stat from percpu variable to paca.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 23 Jun 2020 15:57:50 +0530
Message-ID: <159290806973.3642154.5244613424529764050.stgit@jupiter>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_05:2020-06-22,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 cotscore=-2147483648 mlxlogscore=865
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230075
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the proposed change in percpu bootmem allocator to use page mapping
[1], the percpu first chunk memory area can come from vmalloc ranges. This
makes hmi handler to crash the kernel whenever percpu variable is accessed
in real mode.  This patch fixes this issue by moving the hmi irq stat
inside paca for safe access in realmode.

[1] https://lore.kernel.org/linuxppc-dev/20200608070904.387440-1-aneesh.kumar@linux.ibm.com/

Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Machine check handling as well touches percpu variables in realmode. Will
address that in separate patchset.

Change in v2:
- Fix the build failures for pmac32 and ppc64e configs.
---
 arch/powerpc/include/asm/hardirq.h |    1 -
 arch/powerpc/include/asm/paca.h    |    1 +
 arch/powerpc/kernel/irq.c          |    8 ++++++--
 arch/powerpc/kernel/mce.c          |    2 +-
 arch/powerpc/kvm/book3s_hv_ras.c   |    2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hardirq.h b/arch/powerpc/include/asm/hardirq.h
index f1e9067bd5ac..f133b5930ae1 100644
--- a/arch/powerpc/include/asm/hardirq.h
+++ b/arch/powerpc/include/asm/hardirq.h
@@ -13,7 +13,6 @@ typedef struct {
 	unsigned int pmu_irqs;
 	unsigned int mce_exceptions;
 	unsigned int spurious_irqs;
-	unsigned int hmi_exceptions;
 	unsigned int sreset_irqs;
 #ifdef CONFIG_PPC_WATCHDOG
 	unsigned int soft_nmi_irqs;
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 45a839a7c6cf..cc07c399306e 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -225,6 +225,7 @@ struct paca_struct {
 	u16 in_mce;
 	u8 hmi_event_available;		/* HMI event is available */
 	u8 hmi_p9_special_emu;		/* HMI P9 special emulation */
+	u32 hmi_irqs;			/* HMI irq stat */
 #endif
 	u8 ftrace_enabled;		/* Hard disable ftrace */
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 112d150354b2..a05f9ce05459 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -621,13 +621,15 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 		seq_printf(p, "%10u ", per_cpu(irq_stat, j).mce_exceptions);
 	seq_printf(p, "  Machine check exceptions\n");
 
+#ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		seq_printf(p, "%*s: ", prec, "HMI");
 		for_each_online_cpu(j)
 			seq_printf(p, "%10u ",
-					per_cpu(irq_stat, j).hmi_exceptions);
+					paca_ptrs[j]->hmi_irqs);
 		seq_printf(p, "  Hypervisor Maintenance Interrupts\n");
 	}
+#endif
 
 	seq_printf(p, "%*s: ", prec, "NMI");
 	for_each_online_cpu(j)
@@ -665,7 +667,9 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
 	sum += per_cpu(irq_stat, cpu).mce_exceptions;
 	sum += per_cpu(irq_stat, cpu).spurious_irqs;
 	sum += per_cpu(irq_stat, cpu).timer_irqs_others;
-	sum += per_cpu(irq_stat, cpu).hmi_exceptions;
+#ifdef CONFIG_PPC_BOOK3S_64
+	sum += paca_ptrs[cpu]->hmi_irqs;
+#endif
 	sum += per_cpu(irq_stat, cpu).sreset_irqs;
 #ifdef CONFIG_PPC_WATCHDOG
 	sum += per_cpu(irq_stat, cpu).soft_nmi_irqs;
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd90c0eda229..dc11fc16750f 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -711,7 +711,7 @@ long hmi_exception_realmode(struct pt_regs *regs)
 {	
 	int ret;
 
-	__this_cpu_inc(irq_stat.hmi_exceptions);
+	local_paca->hmi_irqs++;
 
 	ret = hmi_handle_debugtrig(regs);
 	if (ret >= 0)
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index 79f7d07ef674..6028628ea3ac 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -244,7 +244,7 @@ long kvmppc_realmode_hmi_handler(void)
 {
 	bool resync_req;
 
-	__this_cpu_inc(irq_stat.hmi_exceptions);
+	local_paca->hmi_irqs++;
 
 	if (hmi_handle_debugtrig(NULL) >= 0)
 		return 1;


