Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8219A2BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:04:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sRJD2S5gzDqc7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:04:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sRG13GR4zDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 11:02:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VNWqkJ007299; Tue, 31 Mar 2020 20:01:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022qypncq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 20:01:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03101IsE026674;
 Wed, 1 Apr 2020 00:01:55 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 301x7740x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 00:01:55 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03101se159572518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 00:01:54 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA5A8C605D;
 Wed,  1 Apr 2020 00:01:53 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00FDEC605A;
 Wed,  1 Apr 2020 00:01:44 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.85.169.195])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 00:01:44 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Enrico Weigelt <info@metux.net>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, peterz@infradead.org
Subject: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
Date: Tue, 31 Mar 2020 21:00:21 -0300
Message-Id: <20200401000020.590447-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=2 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310192
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
will cause a deadlock. (rtas.lock and printk logbuf_lock as of today)

This is a problem if the system has kdump set up, given if it crashes
for any reason kdump may not be saved for crash analysis.

After NMI IPI is sent to all other cpus, force unlock all spinlocks
needed for finishing crash routine.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>

---
Changes from v2:
- Instead of skipping spinlocks, unlock the needed ones.

Changes from v1:
- Exported variable
---
 arch/powerpc/kexec/crash.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index d488311efab1..8d63fca3242c 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -24,6 +24,7 @@
 #include <asm/smp.h>
 #include <asm/setjmp.h>
 #include <asm/debug.h>
+#include <asm/rtas.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -49,6 +50,8 @@ static int time_to_dump;
  */
 int crash_wake_offline;
 
+extern raw_spinlock_t logbuf_lock;
+
 #define CRASH_HANDLER_MAX 3
 /* List of shutdown handles */
 static crash_shutdown_t crash_shutdown_handles[CRASH_HANDLER_MAX];
@@ -129,6 +132,13 @@ static void crash_kexec_prepare_cpus(int cpu)
 	/* Would it be better to replace the trap vector here? */
 
 	if (atomic_read(&cpus_in_crash) >= ncpus) {
+		/*
+		 * At this point no other CPU is running, and some of them may
+		 * have been interrupted while holding one of the locks needed
+		 * to complete crashing. Free them so there is no deadlock.
+		 */
+		arch_spin_unlock(&logbuf_lock.raw_lock);
+		arch_spin_unlock(&rtas.lock);
 		printk(KERN_EMERG "IPI complete\n");
 		return;
 	}
-- 
2.25.1

