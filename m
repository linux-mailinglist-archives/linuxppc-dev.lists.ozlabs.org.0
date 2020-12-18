Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6742DE6C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:41:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCl50sChzDqfV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:41:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBx53NXRzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:57 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MXGes-1kaJzo1mqk-00Yf1R; Fri, 18 Dec 2020 15:58:34 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 19/23] arch: c6x: use generic irq error counter
Date: Fri, 18 Dec 2020 15:57:42 +0100
Message-Id: <20201218145746.24205-20-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:vGxAbbeZY4OEgvOO7MYiKmDZBDY60quvsSjppUQCMRjagdSkOZ8
 ydkb3jUw1Lyn17JCeP/6k4+TqopM4qU1u6GcFgQQxcfzxRZ1My3C4c9VypwnijkEKg6TS0H
 yVy/RbRMfZmz8LOVqZxbqkRmrY5j854jH7TOuqcn0rLrYfZ+sOLf82j2aqwcE+ql1Y6Xrt3
 vpKfIhWW4REXCGcZ2VJOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XqgpVchyEE4=:YfHTOR4ZwcuZgE0r+kH/gB
 MnZZDfS38xi8T78o6xqRorG2Of+3B0SvDxkxuJcbYF67XLmsfJKSEK9lSLOQExXUbNkEpbG3C
 q4qDZMR6BK4N0DXeY1JhMC+eWYf3ibfDVP8o1Gvnp0So19Mw+VmVSsjOLVI5Wz0rHHmsTst9j
 upnd5iT4m0hQ6az76D6IgKZ4c2KHI96HleQ64QpYAzwRwwUjCOM4lN0fPEu3/9ZDZ6IDsJZNb
 g+VGcOpfKZvyhZmOV3cyTWhwbUfo3JkSAvuc+zGrJeSvkHJAJA5SP5B3aCPuVqpPf3c4+A1qU
 yrFYlt2jq6KpPhqajAE5BRMMUv1B69rIdivA9h57YuvnTCl2byNNRDKwKYiTKIgf7ODPhTwnF
 A7vwknLG88D7u32kCc94EGty/dOHzCb1QwLlb10XCLOmbAEsmiOdjcj9bjqR6
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
 arch/c6x/include/asm/hardirq.h |  3 ---
 arch/c6x/include/asm/irq.h     |  2 --
 arch/c6x/kernel/irq.c          | 11 ++---------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/c6x/include/asm/hardirq.h b/arch/c6x/include/asm/hardirq.h
index f37d07d31040..f70f6113e53a 100644
--- a/arch/c6x/include/asm/hardirq.h
+++ b/arch/c6x/include/asm/hardirq.h
@@ -9,9 +9,6 @@
 #ifndef _ASM_C6X_HARDIRQ_H
 #define _ASM_C6X_HARDIRQ_H
 
-extern void ack_bad_irq(int irq);
-#define ack_bad_irq ack_bad_irq
-
 #include <asm-generic/hardirq.h>
 
 #endif /* _ASM_C6X_HARDIRQ_H */
diff --git a/arch/c6x/include/asm/irq.h b/arch/c6x/include/asm/irq.h
index 9da4d1afd0d7..f42c5747c3ee 100644
--- a/arch/c6x/include/asm/irq.h
+++ b/arch/c6x/include/asm/irq.h
@@ -45,6 +45,4 @@ struct pt_regs;
 
 extern asmlinkage void c6x_do_IRQ(unsigned int prio, struct pt_regs *regs);
 
-extern unsigned long irq_err_count;
-
 #endif /* _ASM_C6X_IRQ_H */
diff --git a/arch/c6x/kernel/irq.c b/arch/c6x/kernel/irq.c
index b9f7cfa2ed21..9f9d798925de 100644
--- a/arch/c6x/kernel/irq.c
+++ b/arch/c6x/kernel/irq.c
@@ -21,12 +21,10 @@
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
-
+#include <asm-generic/irq-err.h>
 #include <asm/megamod-pic.h>
 #include <asm/special_insns.h>
 
-unsigned long irq_err_count;
-
 static DEFINE_RAW_SPINLOCK(core_irq_lock);
 
 static void mask_core_irq(struct irq_data *data)
@@ -114,13 +112,8 @@ void __init init_IRQ(void)
 	set_creg(ICR, 0xfff0);
 }
 
-void ack_bad_irq(int irq)
-{
-	irq_err_count++;
-}
-
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
-	seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_count);
+	seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_get());
 	return 0;
 }
-- 
2.11.0

