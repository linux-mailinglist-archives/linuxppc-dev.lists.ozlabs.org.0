Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9792DE647
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:13:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyC6z3XyCzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:13:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBHJ1xmhzDqZ1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:39 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MO9qz-1kSO7t2hRp-00OXUo; Fri, 18 Dec 2020 15:32:16 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 19/23] arch: c6x: use generic irq error counter
Date: Fri, 18 Dec 2020 15:31:18 +0100
Message-Id: <20201218143122.19459-20-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:bUKbPuD/IE863dGqQP/aUVD3gMjanOmJq5smfk4HYWrMLwZeTSB
 k45+tw0yA/1Jgzwos83k90orLCs83aroaMpeBB39uP1uMMStvQ9QhtXMH4BYz0IipHOkY0v
 kH2GQ3WJCiarTYQXG5Q2sadZG2E46xZvuqbjZ+YUOPphysIBTTbyIiz3i3rbydpQdeWrHaA
 LVhGNnbvccZshL+Bhd3sQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vf+aytBGJWs=:r2eZwHED7IQmg6gl03ucQ8
 l/17rxJDH3Q0EehshvVMk0IPYVvjvVR1C65/GN46yrjD3HCMOP/rrIcikwR5HIgVGjphssKtc
 o1lv+fPa0+Hc94H5Hrr/VIr7xmqV3jwm/vnqCzDlsUPvneuBzmfR3qpEB8UAYM1h9ScjXoC2l
 MKQTwfAiMlD7plZW+Ee/8vfC1criUczadakTuunPoNaWsDY1eyC+81GByepRkc1iQUKybJcMl
 ZfT5eVrVcfhx4kg56Z6SbUPfyHAapCnNNYUJo0WSq16JFSLA6qZunWCcuhqFj0NJmHWstMF+B
 1mDqxGu7XYmAbhrPklXsi0ZwpczbVtKfKbBJMPT4YOecjG+Y3G6ewvh1UD6PrIxn5E5d54uln
 v2eQWiQMuctBB13Iev8txxMZUc5iK4R0+3okQnQhFKSsiqpo7859MSe15Do6+
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

