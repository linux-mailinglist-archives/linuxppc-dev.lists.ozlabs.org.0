Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB71D5EE8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 07:27:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PDLC0H4qzDqXB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 15:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sDj/IEGS; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PDF552qHzDr5T
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 15:22:49 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id p12so3866146qtn.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 22:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4pZo3j1bhay29n6OFcWuLjhRCgSzwajlMBMjTCKDNGo=;
 b=sDj/IEGSSLvmv1wI10+xju/KDYTvQ9Ur9/Rw2JTyrvc1ZC6KyDTdANZDPdAfnvhkNH
 /1POVn6iNEi0k5S+OejA3SeL8TSDjI2a+ghVecjFJ6Sy78XEPiFNl2HgtzBDFayLFmIl
 WIpgb+KzDri12bXTXdA6e+rM6aTRZvOVKCOVjn3UM8o8nXurozIiTE3XRnbur5ID3qMP
 0izO8S3YP+MYsCE5iyFeHVfWSvUPbVFSv+JfLMqYeXYgISuUOxJ3fNOkBthWBrOwINeY
 tLKjifu4EKvn6GIOF88f2XsEUBNkmjH4a64X8SO3/WeCEdRRET5K5TMHIrRUWaXu0JFH
 GMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4pZo3j1bhay29n6OFcWuLjhRCgSzwajlMBMjTCKDNGo=;
 b=QbNbOiS5ErEdUMjQhiCX097Xb0M8IFwP2zKctCdfk7gYHCX6FzkRxJs/V34zcNbjmp
 ey6lZNEzywA3KWQn6OxfANvIOCGGQAAMXUZOwffCvmwn5FBfndMM2aYSgvnReC11b72X
 JRt7xbH2zM8XJQ80AC9EE6x/6T5LRaDD8RApCK23lq1iWweeqJVjfOSWYiyZrjBWYEp9
 J/ZsQKgnj0003HyFb0QykhywWZigktMHrtT3j/bM/UAzDE85SKsyIS8+o/Vvkl2geL0g
 z85DydnScdvvTkvCuoQy8vBYEMN/sHncqvp68z66jx8AdbF69GykYqqFapg68EHOqdGd
 dLzw==
X-Gm-Message-State: AOAM531e2yZ/DUsqo1awsjF6vVG/DMUGmC1VVacEYljMhqfcSnp1P9LD
 ib1wiFCQt/4khYjkOeb7iy4=
X-Google-Smtp-Source: ABdhPJyFOyz97VBe500VHKRSOKa6nApRTzGr7D5vnzuF2l8bJGbVklXJIu6CIKLzdTATabFU9y4YtA==
X-Received: by 2002:ac8:6055:: with SMTP id k21mr6806625qtm.294.1589606566028; 
 Fri, 15 May 2020 22:22:46 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (179-125-143-209.dynamic.desktop.com.br. [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id u20sm3866721qtj.97.2020.05.15.22.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 22:22:45 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Leonardo Bras <leobras.c@gmail.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Nadav Amit <namit@vmware.com>
Subject: [PATCH v5 2/2] powerpc/rtas: Implement reentrant rtas call
Date: Sat, 16 May 2020 02:21:37 -0300
Message-Id: <20200516052137.175881-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200516052137.175881-1-leobras.c@gmail.com>
References: <20200516052137.175881-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Implement rtas_call_reentrant() for reentrant rtas-calls:
"ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive".

On LoPAPR Version 1.1 (March 24, 2016), from 7.3.10.1 to 7.3.10.4,
items 2 and 3 say:

2 - For the PowerPC External Interrupt option: The * call must be
reentrant to the number of processors on the platform.
3 - For the PowerPC External Interrupt option: The * argument call
buffer for each simultaneous call must be physically unique.

So, these rtas-calls can be called in a lockless way, if using
a different buffer for each cpu doing such rtas call.

For this, it was suggested to add the buffer (struct rtas_args)
in the PACA struct, so each cpu can have it's own buffer.
The PACA struct received a pointer to rtas buffer, which is
allocated in the memory range available to rtas 32-bit.

Reentrant rtas calls are useful to avoid deadlocks in crashing,
where rtas-calls are needed, but some other thread crashed holding
the rtas.lock.

This is a backtrace of a deadlock from a kdump testing environment:

  #0 arch_spin_lock
  #1  lock_rtas ()
  #2  rtas_call (token=8204, nargs=1, nret=1, outputs=0x0)
  #3  ics_rtas_mask_real_irq (hw_irq=4100)
  #4  machine_kexec_mask_interrupts
  #5  default_machine_crash_shutdown
  #6  machine_crash_shutdown
  #7  __crash_kexec
  #8  crash_kexec
  #9  oops_end

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/paca.h     |  2 ++
 arch/powerpc/include/asm/rtas.h     |  1 +
 arch/powerpc/kernel/paca.c          | 20 +++++++++++
 arch/powerpc/kernel/rtas.c          | 52 +++++++++++++++++++++++++++++
 arch/powerpc/sysdev/xics/ics-rtas.c | 22 ++++++------
 5 files changed, 86 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index e3cc9eb9204d..87cd9c2220cc 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -29,6 +29,7 @@
 #include <asm/hmi.h>
 #include <asm/cpuidle.h>
 #include <asm/atomic.h>
+#include <asm/rtas-types.h>
 
 #include <asm-generic/mmiowb_types.h>
 
@@ -270,6 +271,7 @@ struct paca_struct {
 #ifdef CONFIG_MMIOWB
 	struct mmiowb_state mmiowb_state;
 #endif
+	struct rtas_args *reentrant_args;
 } ____cacheline_aligned;
 
 extern void copy_mm_to_paca(struct mm_struct *mm);
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index c35c5350b7e4..fa7509c85881 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -236,6 +236,7 @@ extern struct rtas_t rtas;
 extern int rtas_token(const char *service);
 extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
+int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...);
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
 			int nret, ...);
 extern void __noreturn rtas_restart(char *cmd);
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 3f91ccaa9c74..88c9b61489fc 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -16,6 +16,7 @@
 #include <asm/kexec.h>
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
+#include <asm/rtas.h>
 
 #include "setup.h"
 
@@ -164,6 +165,23 @@ static struct slb_shadow * __init new_slb_shadow(int cpu, unsigned long limit)
 
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
+/**
+ * new_rtas_args() - Allocates rtas args
+ * @cpu:	CPU number
+ * @limit:	Memory limit for this allocation
+ *
+ * Allocates a struct rtas_args and return it's pointer.
+ *
+ * Return:	Pointer to allocated rtas_args
+ */
+static struct rtas_args * __init new_rtas_args(int cpu, unsigned long limit)
+{
+	limit = min_t(unsigned long, limit, RTAS_INSTANTIATE_MAX);
+
+	return alloc_paca_data(sizeof(struct rtas_args), L1_CACHE_BYTES,
+			       limit, cpu);
+}
+
 /* The Paca is an array with one entry per processor.  Each contains an
  * lppaca, which contains the information shared between the
  * hypervisor and Linux.
@@ -202,6 +220,7 @@ void __init __nostackprotector initialise_paca(struct paca_struct *new_paca, int
 	/* For now -- if we have threads this will be adjusted later */
 	new_paca->tcd_ptr = &new_paca->tcd;
 #endif
+	new_paca->reentrant_args = NULL;
 }
 
 /* Put the paca pointer into r13 and SPRG_PACA */
@@ -274,6 +293,7 @@ void __init allocate_paca(int cpu)
 #ifdef CONFIG_PPC_BOOK3S_64
 	paca->slb_shadow_ptr = new_slb_shadow(cpu, limit);
 #endif
+	paca->reentrant_args = new_rtas_args(cpu, limit);
 	paca_struct_size += sizeof(struct paca_struct);
 }
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c5fa251b8950..6e22eb4fc0e7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -41,6 +41,7 @@
 #include <asm/time.h>
 #include <asm/mmu.h>
 #include <asm/topology.h>
+#include <asm/paca.h>
 
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
@@ -483,6 +484,57 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 }
 EXPORT_SYMBOL(rtas_call);
 
+/**
+ * rtas_call_reentrant() - Used for reentrant rtas calls
+ * @token:	Token for desired reentrant RTAS call
+ * @nargs:	Number of Input Parameters
+ * @nret:	Number of Output Parameters
+ * @outputs:	Array of outputs
+ * @...:	Inputs for desired RTAS call
+ *
+ * According to LoPAR documentation, only "ibm,int-on", "ibm,int-off",
+ * "ibm,get-xive" and "ibm,set-xive" are currently reentrant.
+ * Reentrant calls need their own rtas_args buffer, so not using rtas.args, but
+ * PACA one instead.
+ *
+ * Return:	-1 on error,
+ *		First output value of RTAS call if (nret > 0),
+ *		0 otherwise,
+ */
+
+int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
+{
+	va_list list;
+	struct rtas_args *args;
+	unsigned long flags;
+	int i, ret = 0;
+
+	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
+		return -1;
+
+	local_irq_save(flags);
+	preempt_disable();
+
+	/* We use the per-cpu (PACA) rtas args buffer */
+	args = local_paca->reentrant_args;
+
+	va_start(list, outputs);
+	va_rtas_call_unlocked(args, token, nargs, nret, list);
+	va_end(list);
+
+	if (nret > 1 && outputs)
+		for (i = 0; i < nret - 1; ++i)
+			outputs[i] = be32_to_cpu(args->rets[i + 1]);
+
+	if (nret > 0)
+		ret = be32_to_cpu(args->rets[0]);
+
+	local_irq_restore(flags);
+	preempt_enable();
+
+	return ret;
+}
+
 /* For RTAS_BUSY (-2), delay for 1 millisecond.  For an extended busy status
  * code of 990n, perform the hinted delay of 10^n (last digit) milliseconds.
  */
diff --git a/arch/powerpc/sysdev/xics/ics-rtas.c b/arch/powerpc/sysdev/xics/ics-rtas.c
index 6aabc74688a6..4cf18000f07c 100644
--- a/arch/powerpc/sysdev/xics/ics-rtas.c
+++ b/arch/powerpc/sysdev/xics/ics-rtas.c
@@ -50,8 +50,8 @@ static void ics_rtas_unmask_irq(struct irq_data *d)
 
 	server = xics_get_irq_server(d->irq, irq_data_get_affinity_mask(d), 0);
 
-	call_status = rtas_call(ibm_set_xive, 3, 1, NULL, hw_irq, server,
-				DEFAULT_PRIORITY);
+	call_status = rtas_call_reentrant(ibm_set_xive, 3, 1, NULL, hw_irq,
+					  server, DEFAULT_PRIORITY);
 	if (call_status != 0) {
 		printk(KERN_ERR
 			"%s: ibm_set_xive irq %u server %x returned %d\n",
@@ -60,7 +60,7 @@ static void ics_rtas_unmask_irq(struct irq_data *d)
 	}
 
 	/* Now unmask the interrupt (often a no-op) */
-	call_status = rtas_call(ibm_int_on, 1, 1, NULL, hw_irq);
+	call_status = rtas_call_reentrant(ibm_int_on, 1, 1, NULL, hw_irq);
 	if (call_status != 0) {
 		printk(KERN_ERR "%s: ibm_int_on irq=%u returned %d\n",
 			__func__, hw_irq, call_status);
@@ -91,7 +91,7 @@ static void ics_rtas_mask_real_irq(unsigned int hw_irq)
 	if (hw_irq == XICS_IPI)
 		return;
 
-	call_status = rtas_call(ibm_int_off, 1, 1, NULL, hw_irq);
+	call_status = rtas_call_reentrant(ibm_int_off, 1, 1, NULL, hw_irq);
 	if (call_status != 0) {
 		printk(KERN_ERR "%s: ibm_int_off irq=%u returned %d\n",
 			__func__, hw_irq, call_status);
@@ -99,8 +99,8 @@ static void ics_rtas_mask_real_irq(unsigned int hw_irq)
 	}
 
 	/* Have to set XIVE to 0xff to be able to remove a slot */
-	call_status = rtas_call(ibm_set_xive, 3, 1, NULL, hw_irq,
-				xics_default_server, 0xff);
+	call_status = rtas_call_reentrant(ibm_set_xive, 3, 1, NULL, hw_irq,
+					  xics_default_server, 0xff);
 	if (call_status != 0) {
 		printk(KERN_ERR "%s: ibm_set_xive(0xff) irq=%u returned %d\n",
 			__func__, hw_irq, call_status);
@@ -131,7 +131,7 @@ static int ics_rtas_set_affinity(struct irq_data *d,
 	if (hw_irq == XICS_IPI || hw_irq == XICS_IRQ_SPURIOUS)
 		return -1;
 
-	status = rtas_call(ibm_get_xive, 1, 3, xics_status, hw_irq);
+	status = rtas_call_reentrant(ibm_get_xive, 1, 3, xics_status, hw_irq);
 
 	if (status) {
 		printk(KERN_ERR "%s: ibm,get-xive irq=%u returns %d\n",
@@ -146,8 +146,8 @@ static int ics_rtas_set_affinity(struct irq_data *d,
 		return -1;
 	}
 
-	status = rtas_call(ibm_set_xive, 3, 1, NULL,
-			   hw_irq, irq_server, xics_status[1]);
+	status = rtas_call_reentrant(ibm_set_xive, 3, 1, NULL,
+				     hw_irq, irq_server, xics_status[1]);
 
 	if (status) {
 		printk(KERN_ERR "%s: ibm,set-xive irq=%u returns %d\n",
@@ -179,7 +179,7 @@ static int ics_rtas_map(struct ics *ics, unsigned int virq)
 		return -EINVAL;
 
 	/* Check if RTAS knows about this interrupt */
-	rc = rtas_call(ibm_get_xive, 1, 3, status, hw_irq);
+	rc = rtas_call_reentrant(ibm_get_xive, 1, 3, status, hw_irq);
 	if (rc)
 		return -ENXIO;
 
@@ -198,7 +198,7 @@ static long ics_rtas_get_server(struct ics *ics, unsigned long vec)
 {
 	int rc, status[2];
 
-	rc = rtas_call(ibm_get_xive, 1, 3, status, vec);
+	rc = rtas_call_reentrant(ibm_get_xive, 1, 3, status, vec);
 	if (rc)
 		return -1;
 	return status[0];
-- 
2.25.4

