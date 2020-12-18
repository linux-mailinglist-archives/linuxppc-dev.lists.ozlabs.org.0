Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C362DE6D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:44:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCpj5JKnzDr9M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBx60xn3zDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:58 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkYLW-1kN2HB06hi-00m5Az; Fri, 18 Dec 2020 15:58:31 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/23] arch: arm: use generic irq error counter
Date: Fri, 18 Dec 2020 15:57:40 +0100
Message-Id: <20201218145746.24205-18-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:AjFm0NQX4XGWjyVKhyjtZ1ZxUGz/lh2upIhOiUCFgeJbZo7FO3J
 ApYOcFCC2Ri1tGjWSPZdSk7VNenlE4o9jfmJ+2RHlqSe/5C2HIoMcNR9GDGXy7Q9kQgvd4V
 4oRrXgZf6iKQdDk74H0e8/Q0nxn6RdGaEBxfhR8l2zFpuaK/QonjA3URoYKwB7zYaU5I01L
 7cTTnCiK6H87mMC4yXtfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uVWcVyq5qYY=:UP5+aqEIPGTarWR6GLJxWa
 YER39udKzjc+XwiqREKAzRUz4PfZJonGREGXqFoezLJHS9WE4SxlakRMtUGvi8j9HX6sQhrJ5
 dEXDkHanmHj5ADOH0CBrU0S5izAPFQs62NMKZ3FPSwmTl9bH09oKXIP+W/7bLU7h/+TKtrTDu
 jW/eHjXWEvDfFXLbqOI/hEVUVO+v4tXuNADnGmeTnMICUZJG/kZj6uT39GVXuLenxur8J/mkP
 xRdFph7OhbZOFLafDuWmdMZaH7jtDqxljkvV8l9f4w41BcoTZkcGGFixNoqLDnVTIl8Hr26uJ
 biBxxbLRjJ5f5FNxIX7n7RKJtwn2XwXG2/6ypE8ZwybNi7chl1KpFyvndc073eSBd7lBE4p7N
 UZKpzGZoJVmjWJhRME+yu3mN+7n6L11bG8iOdieZ3CSIJIMakcpolS/558K+x
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com,
 linus.walleij@linaro.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org,
 gerg@linux-m68k.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp, jolsa@redhat.com,
 deller@gmx.de, x86@kernel.org, bgolaszewski@baylibre.com, tony@atomide.com,
 geert@linux-m68k.org, catalin.marinas@arm.com, linux-alpha@vger.kernel.org,
 arnd@arndb.de, msalter@redhat.com, jacquiot.aurelien@gmail.com,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de,
 namhyung@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, maz@kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the newly introduced irq error counter, that's already maintained
by all callers of ack_bad_irq(), in order to remove duplicate code.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/arm/include/asm/hardirq.h  | 2 +-
 arch/arm/include/asm/hw_irq.h   | 6 ------
 arch/arm/kernel/irq.c           | 6 ++----
 drivers/irqchip/irq-omap-intc.c | 5 ++---
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/hardirq.h b/arch/arm/include/asm/hardirq.h
index 706efafbf972..d9ae8998240d 100644
--- a/arch/arm/include/asm/hardirq.h
+++ b/arch/arm/include/asm/hardirq.h
@@ -5,7 +5,7 @@
 #include <asm/irq.h>
 
 #define __ARCH_IRQ_EXIT_IRQS_DISABLED	1
-#define ack_bad_irq ack_bad_irq
+#define ack_bad_irq(irq)
 
 #include <asm-generic/hardirq.h>
 
diff --git a/arch/arm/include/asm/hw_irq.h b/arch/arm/include/asm/hw_irq.h
index 5305c7e33aee..adbbeb11b930 100644
--- a/arch/arm/include/asm/hw_irq.h
+++ b/arch/arm/include/asm/hw_irq.h
@@ -5,12 +5,6 @@
 #ifndef _ARCH_ARM_HW_IRQ_H
 #define _ARCH_ARM_HW_IRQ_H
 
-static inline void ack_bad_irq(int irq)
-{
-	extern unsigned long irq_err_count;
-	irq_err_count++;
-}
-
 #define ARCH_IRQ_INIT_FLAGS	(IRQ_NOREQUEST | IRQ_NOPROBE)
 
 #endif
diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index 698b6f636156..72c3b8ce74db 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -32,7 +32,7 @@
 #include <linux/kallsyms.h>
 #include <linux/proc_fs.h>
 #include <linux/export.h>
-
+#include <asm-generic/irq-err.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/hardware/cache-uniphier.h>
 #include <asm/outercache.h>
@@ -41,8 +41,6 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
-unsigned long irq_err_count;
-
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 #ifdef CONFIG_FIQ
@@ -51,7 +49,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 #ifdef CONFIG_SMP
 	show_ipi_list(p, prec);
 #endif
-	seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_count);
+	seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_get());
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-omap-intc.c b/drivers/irqchip/irq-omap-intc.c
index d360a6eddd6d..2682c6e814c2 100644
--- a/drivers/irqchip/irq-omap-intc.c
+++ b/drivers/irqchip/irq-omap-intc.c
@@ -15,7 +15,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-
+#include <asm-generic/irq-err.h>
 #include <asm/exception.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -328,7 +328,6 @@ static int __init omap_init_irq(u32 base, struct device_node *node)
 static asmlinkage void __exception_irq_entry
 omap_intc_handle_irq(struct pt_regs *regs)
 {
-	extern unsigned long irq_err_count;
 	u32 irqnr;
 
 	irqnr = intc_readl(INTC_SIR);
@@ -351,7 +350,7 @@ omap_intc_handle_irq(struct pt_regs *regs)
 	 */
 	if (unlikely((irqnr & SPURIOUSIRQ_MASK) == SPURIOUSIRQ_MASK)) {
 		pr_err_once("%s: spurious irq!\n", __func__);
-		irq_err_count++;
+		irq_err_inc();
 		omap_ack_irq(NULL);
 		return;
 	}
-- 
2.11.0

