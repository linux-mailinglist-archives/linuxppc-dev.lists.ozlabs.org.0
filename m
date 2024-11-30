Return-Path: <linuxppc-dev+bounces-3623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 034669DF2E7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2024 21:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y11RC6XfSz2xwc;
	Sun,  1 Dec 2024 07:11:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=99.78.197.220
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732997511;
	cv=none; b=nDOd5iEvL2ZTcp9EmNct8s+xAHfOXq3hGkxyemLcILXpjdEmi1+czvNobGqP+wNnGemzy/EfVuZ5CGaFlKFIBBIeNYxfgOc/lwCWDjAj93PvEi2+/7VAXzKF3W14SOmSBrNeZvtpAwJvVOFQQslzDTwigEEh82ZeKmAiNXaPrEY+Mb9S3x9+o1kqBLCSf1U5xxJxVH9KPyqnVHacCEj4FOZ+t4dLkj2g6Jru/KHWn27J9u+y5pb4oltkUGVyMVF0UK0GbEmB3bhkiJmorrCwTXbAiFd6SvNtlb1pH+9gbkTRBqoafGdfk0FOuUP8BTXxxgNidrJY/06hLzyumU2dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732997511; c=relaxed/relaxed;
	bh=Z1q0O9SSc3WE7X9Ea2bgfI7o8XhiztyuqmdWRMZ6pzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sj88q02GqL1k3yU/XILYa+aaiIFle3f0X0lYs4f5gUUwK35zaE5YLOgs+rOY0aNzIh5PMUteBJXZZPoFMLfMspLmjJee+ougLCR7jmHYKlIx1rF3q2RNHfV9fLIdJxqWGGZc4tUdhsQPnJDRsJtmLjTnFDMIffWtnmXjx2NCJX0Wq15Wmvpn2c3Df1chO1G7YCz6/F/JRKMsTWtlyapxIqBPQjrjn/TCbPEhNHpSiwEsZ74tUbeNbWvPLkiSnTZDs55lFj4+M1gxjZPKw7Iodg4nK0bEGJ3UYHukULdPHQzWGiieybqhzy28Fm7WRLDjJYQQ/PNW2zNYOWLKXGX6Sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=auPO68q7; dkim-atps=neutral; spf=pass (client-ip=99.78.197.220; helo=smtp-fw-80009.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=auPO68q7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=99.78.197.220; helo=smtp-fw-80009.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y11RB5b81z2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2024 07:11:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732997511; x=1764533511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z1q0O9SSc3WE7X9Ea2bgfI7o8XhiztyuqmdWRMZ6pzk=;
  b=auPO68q73UiRsNvcQqOYpU0DmnhjTxg6UloU90LyCIeBj09koAUw0+uu
   danhLvyhyFVEx+VUFXDf8JfnYBZx7rxrmFa1XwtFjA7KW/qkcxpx0rOTT
   ZGzz4ehWpMNSqWRKMq544dslnAT4sa11+4Ua0u78Q0bmn//Wiet9FIjd4
   U=;
X-IronPort-AV: E=Sophos;i="6.12,199,1728950400"; 
   d="scan'208";a="152030536"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 20:11:45 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:55483]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.38.94:2525] with esmtp (Farcaster)
 id 301daaf0-25e9-43d5-85f9-905c59d2ccf4; Sat, 30 Nov 2024 20:11:45 +0000 (UTC)
X-Farcaster-Flow-ID: 301daaf0-25e9-43d5-85f9-905c59d2ccf4
Received: from EX19D013UWA004.ant.amazon.com (10.13.138.207) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:11:45 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D013UWA004.ant.amazon.com (10.13.138.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:11:44 +0000
Received: from email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Sat, 30 Nov 2024 20:11:44 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com (Postfix) with ESMTP id 0642CA0544;
	Sat, 30 Nov 2024 20:11:44 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 924766F9F; Sat, 30 Nov 2024 20:11:43 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <farbere@amazon.com>,
	<hbathini@linux.ibm.com>, <sourabhjain@linux.ibm.com>,
	<adityag@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<takakura@valinux.co.jp>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH v5 1/2] kexec: Consolidate machine_kexec_mask_interrupts() implementation
Date: Sat, 30 Nov 2024 20:11:42 +0000
Message-ID: <20241130201143.48808-2-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241130201143.48808-1-farbere@amazon.com>
References: <20241130201143.48808-1-farbere@amazon.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-10.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Consolidate the machine_kexec_mask_interrupts implementation into a common
function located in a new file: kernel/irq/kexec.c. This removes duplicate
implementations from architecture-specific files in arch/arm, arch/arm64,
arch/powerpc, and arch/riscv, reducing code duplication and improving
maintainability.

The new implementation retains architecture-specific behavior for
CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD, which was previously implemented
for ARM64. When enabled (currently for ARM64), it clears the active state
of interrupts forwarded to virtual machines (VMs) before handling other
interrupt masking operations.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V4 -> V5:
 - The function machine_kexec_mask_interrupts() has been moved
   from kernel/kexec_core.c to a new file kernel/irq/kexec.c.
 - A new configuration option, GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD, has been
   added.
 - The parameters for the machine_kexec_mask_interrupts() function have
   been defined in reverse Christmas Tree style.
 - The comment explaining the call to irq_set_irqchip_state() has been
   improved for clarity.

 arch/arm/kernel/machine_kexec.c   | 23 ------------------
 arch/arm64/Kconfig                |  1 +
 arch/arm64/kernel/machine_kexec.c | 31 ------------------------
 arch/powerpc/include/asm/kexec.h  |  1 -
 arch/powerpc/kexec/core.c         | 22 -----------------
 arch/powerpc/kexec/core_32.c      |  1 +
 arch/riscv/kernel/machine_kexec.c | 23 ------------------
 include/linux/irq.h               |  3 +++
 kernel/irq/Kconfig                |  9 +++++++
 kernel/irq/Makefile               |  2 +-
 kernel/irq/kexec.c                | 40 +++++++++++++++++++++++++++++++
 11 files changed, 55 insertions(+), 101 deletions(-)
 create mode 100644 kernel/irq/kexec.c

diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index 80ceb5bd2680..dd430477e7c1 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -127,29 +127,6 @@ void crash_smp_send_stop(void)
 	cpus_stopped = 1;
 }
 
-static void machine_kexec_mask_interrupts(void)
-{
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
-
-		chip = irq_desc_get_chip(desc);
-		if (!chip)
-			continue;
-
-		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
-			chip->irq_eoi(&desc->irq_data);
-
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
-	}
-}
-
 void machine_crash_shutdown(struct pt_regs *regs)
 {
 	local_irq_disable();
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index d743737bf9ce..359b9dcb35b9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -150,6 +150,7 @@ config ARM64
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
 	select GENERIC_IRQ_IPI
+	select GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 82e2203d86a3..6f121a0164a4 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -207,37 +207,6 @@ void machine_kexec(struct kimage *kimage)
 	BUG(); /* Should never get here. */
 }
 
-static void machine_kexec_mask_interrupts(void)
-{
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
-		int ret;
-
-		chip = irq_desc_get_chip(desc);
-		if (!chip)
-			continue;
-
-		/*
-		 * First try to remove the active state. If this
-		 * fails, try to EOI the interrupt.
-		 */
-		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
-
-		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
-		    chip->irq_eoi)
-			chip->irq_eoi(&desc->irq_data);
-
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
-	}
-}
-
 /**
  * machine_crash_shutdown - shutdown non-crashing cpus and save registers
  */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 270ee93a0f7d..601e569303e1 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -61,7 +61,6 @@ struct pt_regs;
 extern void kexec_smp_wait(void);	/* get and clear naca physid, wait for
 					  master to copy new code to 0 */
 extern void default_machine_kexec(struct kimage *image);
-extern void machine_kexec_mask_interrupts(void);
 
 void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_code_buffer,
 			 unsigned long start_address) __noreturn;
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index b8333a49ea5d..58a930a47422 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -22,28 +22,6 @@
 #include <asm/setup.h>
 #include <asm/firmware.h>
 
-void machine_kexec_mask_interrupts(void) {
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
-
-		chip = irq_desc_get_chip(desc);
-		if (!chip)
-			continue;
-
-		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
-			chip->irq_eoi(&desc->irq_data);
-
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
-	}
-}
-
 #ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/kexec/core_32.c b/arch/powerpc/kexec/core_32.c
index c95f96850c9e..deb28eb44f30 100644
--- a/arch/powerpc/kexec/core_32.c
+++ b/arch/powerpc/kexec/core_32.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2005 IBM Corporation.
  */
 
+#include <linux/irq.h>
 #include <linux/kexec.h>
 #include <linux/mm.h>
 #include <linux/string.h>
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 3c830a6f7ef4..2306ce3e5f22 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -114,29 +114,6 @@ void machine_shutdown(void)
 #endif
 }
 
-static void machine_kexec_mask_interrupts(void)
-{
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
-
-		chip = irq_desc_get_chip(desc);
-		if (!chip)
-			continue;
-
-		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
-			chip->irq_eoi(&desc->irq_data);
-
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
-	}
-}
-
 /*
  * machine_crash_shutdown - Prepare to kexec after a kernel crash
  *
diff --git a/include/linux/irq.h b/include/linux/irq.h
index fa711f80957b..25f51bf3c351 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -694,6 +694,9 @@ extern int irq_chip_request_resources_parent(struct irq_data *data);
 extern void irq_chip_release_resources_parent(struct irq_data *data);
 #endif
 
+/* Disable or mask interrupts during a kernel kexec */
+extern void machine_kexec_mask_interrupts(void);
+
 /* Handling of unhandled and spurious interrupts: */
 extern void note_interrupt(struct irq_desc *desc, irqreturn_t action_ret);
 
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 529adb1f5859..5967accb8e87 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -154,3 +154,12 @@ config DEPRECATED_IRQ_CPU_ONOFFLINE
 	bool
 	depends on CAVIUM_OCTEON_SOC
 	default CAVIUM_OCTEON_SOC
+
+config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
+	bool "Clear forwarded VM interrupts during kexec"
+	default n
+	help
+	  When enabled, this option allows the kernel to clear the active state
+	  of interrupts that are forwarded to virtual machines (VMs) during a
+	  machine kexec. For interrupts that are not forwarded, if supported,
+	  the kernel will attempt to trigger an End of Interrupt (EOI).
diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index f19d3080bf11..c0f44c06d69d 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y := irqdesc.o handle.o manage.o spurious.o resend.o chip.o dummychip.o devres.o
+obj-y := irqdesc.o handle.o manage.o spurious.o resend.o chip.o dummychip.o devres.o kexec.o
 obj-$(CONFIG_IRQ_TIMINGS) += timings.o
 ifeq ($(CONFIG_TEST_IRQ_TIMINGS),y)
 	CFLAGS_timings.o += -DDEBUG
diff --git a/kernel/irq/kexec.c b/kernel/irq/kexec.c
new file mode 100644
index 000000000000..0f9548c1708d
--- /dev/null
+++ b/kernel/irq/kexec.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqnr.h>
+
+#include "internals.h"
+
+void machine_kexec_mask_interrupts(void)
+{
+	struct irq_desc *desc;
+	unsigned int i;
+
+	for_each_irq_desc(i, desc) {
+		struct irq_chip *chip;
+		int check_eoi = 1;
+
+		chip = irq_desc_get_chip(desc);
+		if (!chip)
+			continue;
+
+		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD)) {
+			/*
+			 * First try to remove the active state from an interrupt which is forwarded
+			 * to a VM. If the interrupt is not forwarded, try to EOI the interrupt.
+			 */
+			check_eoi = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
+		}
+
+		if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
+			chip->irq_eoi(&desc->irq_data);
+
+		if (chip->irq_mask)
+			chip->irq_mask(&desc->irq_data);
+
+		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
+			chip->irq_disable(&desc->irq_data);
+	}
+}
-- 
2.40.1


