Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D0194D39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 00:29:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pLmj263gzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 10:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pLjJ5zTbzDr1q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 10:26:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QN4Fog114235; Thu, 26 Mar 2020 19:26:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf3j7n28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 19:26:22 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02QN5VvJ144345;
 Thu, 26 Mar 2020 19:26:22 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf3j7n1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 19:26:21 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02QNOhOu007631;
 Thu, 26 Mar 2020 23:26:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw2rv3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 23:26:20 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02QNQKC351315188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 23:26:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36780AE062;
 Thu, 26 Mar 2020 23:26:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49007AE063;
 Thu, 26 Mar 2020 23:26:06 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.85.162.45])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 23:26:05 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leonardo@linux.ibm.com>
Subject: [PATCH v2 1/1] ppc/crash: Skip spinlocks during crash
Date: Thu, 26 Mar 2020 20:25:43 -0300
Message-Id: <20200326232542.503157-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_13:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260164
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During a crash, there is chance that the cpus that handle the NMI IPI
are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
will cause a deadlock. (rtas_lock and printk logbuf_log as of today)

This is a problem if the system has kdump set up, given if it crashes
for any reason kdump may not be saved for crash analysis.

Skip spinlocks after NMI IPI is sent to all other cpus.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/include/asm/spinlock.h | 6 ++++++
 arch/powerpc/kexec/crash.c          | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 860228e917dc..a6381d110795 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -111,6 +111,8 @@ static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
 static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
 #endif
 
+extern bool crash_skip_spinlock __read_mostly;
+
 static inline bool is_shared_processor(void)
 {
 #ifdef CONFIG_PPC_SPLPAR
@@ -142,6 +144,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 		if (likely(__arch_spin_trylock(lock) == 0))
 			break;
 		do {
+			if (unlikely(crash_skip_spinlock))
+				return;
 			HMT_low();
 			if (is_shared_processor())
 				splpar_spin_yield(lock);
@@ -161,6 +165,8 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
 		local_save_flags(flags_dis);
 		local_irq_restore(flags);
 		do {
+			if (unlikely(crash_skip_spinlock))
+				return;
 			HMT_low();
 			if (is_shared_processor())
 				splpar_spin_yield(lock);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index d488311efab1..ae081f0f2472 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -66,6 +66,9 @@ static int handle_fault(struct pt_regs *regs)
 
 #ifdef CONFIG_SMP
 
+bool crash_skip_spinlock;
+EXPORT_SYMBOL(crash_skip_spinlock);
+
 static atomic_t cpus_in_crash;
 void crash_ipi_callback(struct pt_regs *regs)
 {
@@ -129,6 +132,7 @@ static void crash_kexec_prepare_cpus(int cpu)
 	/* Would it be better to replace the trap vector here? */
 
 	if (atomic_read(&cpus_in_crash) >= ncpus) {
+		crash_skip_spinlock = true;
 		printk(KERN_EMERG "IPI complete\n");
 		return;
 	}
-- 
2.24.1

