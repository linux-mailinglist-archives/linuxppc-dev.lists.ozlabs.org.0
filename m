Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AE19BCE9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:42:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFR40BK3zDrBn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:42:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tDxd2MSRzDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:20:53 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03273S6C074188; Thu, 2 Apr 2020 03:20:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wry4xf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 03:20:29 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03273s9g076210;
 Thu, 2 Apr 2020 03:20:28 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wry4xey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 03:20:28 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0327HYkO030992;
 Thu, 2 Apr 2020 07:20:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 301x7772kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 07:20:27 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0327KR3l53346634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 07:20:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A313AC05B;
 Thu,  2 Apr 2020 07:20:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD95AAC05E;
 Thu,  2 Apr 2020 07:20:25 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 07:20:25 +0000 (GMT)
Subject: [PATCH v10 14/14] powerpc: Use mm_context vas_windows counter to
 issue CP_ABORT
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585810846.2275.23.camel@hbabu-laptop>
References: <1585810846.2275.23.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Apr 2020 00:20:24 -0700
Message-ID: <1585812024.2275.68.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=1
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020063
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, frederic.barrat@fr.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, clg@kaod.org, herbert@gondor.apana.org.au,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


set_thread_uses_vas() sets used_vas flag for a process that opened VAS
window and issue CP_ABORT during context switch for only that process.
In multi-thread application, windows can be shared. For example Thread A
can open a window and Thread B can run COPY/PASTE instructions to send
NX request which may cause corruption or snooping or a covert channel.
Also once this flag is set, continue to run CP_ABORT even the VAS window
is closed.

So define vas-windows counter in process mm_context, increment this
counter for each window open and decrement it for window close. If
vas-windows is set, issue CP_ABORT during context switch. It means
clear the foreign real address mapping only if the process / thread uses
COPY/PASTE. Then disable it for that process if windows are not open.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Suggested-by: Milton Miller <miltonm@us.ibm.com>
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h    |  3 +++
 arch/powerpc/include/asm/mmu_context.h      | 22 ++++++++++++++++++++++
 arch/powerpc/include/asm/processor.h        |  1 -
 arch/powerpc/kernel/process.c               |  8 ++++++--
 arch/powerpc/platforms/powernv/vas-window.c |  1 +
 5 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index bb3deb7..f0a9ff6 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -116,6 +116,9 @@ struct patb_entry {
 	/* Number of users of the external (Nest) MMU */
 	atomic_t copros;
 
+	/* Number of user space windows opened in process mm_context */
+	atomic_t vas_windows;
+
 	struct hash_mm_context *hash_context;
 
 	unsigned long vdso_base;
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 360367c..7fd249498 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -185,11 +185,33 @@ static inline void mm_context_remove_copro(struct mm_struct *mm)
 			dec_mm_active_cpus(mm);
 	}
 }
+
+/*
+ * vas_windows counter shows number of open windows in the mm
+ * context. During context switch, use this counter to clear the
+ * foreign real address mapping (CP_ABORT) for the thread / process
+ * that intend to use COPY/PASTE. When a process closes all windows,
+ * disable CP_ABORT which is expensive to run.
+ */
+static inline void mm_context_add_vas_windows(struct mm_struct *mm)
+{
+	atomic_inc(&mm->context.vas_windows);
+}
+
+static inline void mm_context_remove_vas_windows(struct mm_struct *mm)
+{
+	int c = atomic_dec_if_positive(&mm->context.vas_windows);
+
+	/* Detect imbalance between add and remove */
+	WARN_ON(c < 0);
+}
 #else
 static inline void inc_mm_active_cpus(struct mm_struct *mm) { }
 static inline void dec_mm_active_cpus(struct mm_struct *mm) { }
 static inline void mm_context_add_copro(struct mm_struct *mm) { }
 static inline void mm_context_remove_copro(struct mm_struct *mm) { }
+static inline void mm_context_add_vas_windows(struct mm_struct *mm) { }
+static inline void mm_context_remove_vas_windows(struct mm_struct *mm) { }
 #endif
 
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index eedcbfb..bfa336f 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -272,7 +272,6 @@ struct thread_struct {
 	unsigned 	mmcr0;
 
 	unsigned 	used_ebb;
-	unsigned int	used_vas;
 #endif
 };
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index fad50db..a3ecaf9 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1221,7 +1221,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
 		 * mappings, we must issue a cp_abort to clear any state and
 		 * prevent snooping, corruption or a covert channel.
 		 */
-		if (current->thread.used_vas)
+		if (current->mm &&
+			atomic_read(&current->mm->context.vas_windows))
 			asm volatile(PPC_CP_ABORT);
 	}
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -1466,7 +1467,10 @@ int set_thread_uses_vas(void)
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -EINVAL;
 
-	current->thread.used_vas = 1;
+	if (!current->mm)
+		return -EINVAL;
+
+	mm_context_add_vas_windows(current->mm);
 
 	/*
 	 * Even a process that has no foreign real address mapping can use
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 3ffad5a..33dfbbf 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1333,6 +1333,7 @@ int vas_win_close(struct vas_window *window)
 			put_pid(window->pid);
 			if (window->mm) {
 				mm_context_remove_copro(window->mm);
+				mm_context_remove_vas_windows(window->mm);
 				mmdrop(window->mm);
 			}
 		}
-- 
1.8.3.1



