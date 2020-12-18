Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6D2DE640
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:12:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyC5G14LHzDr55
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:12:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBHH5TCQzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:39 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MpUQm-1kHyFH35FU-00pvpv; Fri, 18 Dec 2020 15:32:07 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 14/23] kernel: generic counter for interrupt errors
Date: Fri, 18 Dec 2020 15:31:13 +0100
Message-Id: <20201218143122.19459-15-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:Gw/bTtXok8p4vHk5nFrQVdFJ5MnOqVYTkF8qTqw26vjFIHJCyDK
 gWsI7rxnKihIOBi2JvYSwf+jSyWv5F+CX1+be0BzmKQrBr3azK9kodLyNb33JKW/mMhCjsj
 CRdMozs58Ybrwu5DzpMGw+pON0xSJpSE4ZeNixUusENMyncAeVENXSEGQGxvzLQqD8SXw6H
 2brEnhBShdNjRMc3ZWXiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IvDb0vCjKHw=:+26MMkVB/QLEF9LqzmJqJq
 gOmWB/hkRyWf9K9+YpOnE6/IsiVzUe3h8hVdk37yTgE1wrWp1dM9IMvWFDjirSORFXg2zRoqb
 onrR+fOHpR/aoO060PlrUsvxz8SxmywyHG/fJk6Bw9F58Mw+Iu2RztYyO2iDoobQezyCvU8nu
 Bt80Oxqb8xfFoxGrcn6js/zYH24qrp5tSbs/XbF8iPT8L3QH+miIBh2sCsG1Nm5BKvKWS7Hrq
 dIoTgaqijW5BGaacT01S37khgMPnvZobjkv1Uk9xSgxgSakDg56BY3JjpyAtSFGTDjxtbXrqG
 mqWEPJWclB5j0pKsqmKU23r2gb7/KurkTNxRc8+ufvsvpW4W5kdtOM2iNSNiurTOPDZxqddXj
 64Qz4Yigw3ixveE26VUWTA9PfQIeXMBGObhUKlN3zt/eaSNDA2vk46WEnBhsb
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

We currently have counters for spurious interrupt spread over all the
individual architectures. Mostly done in the arch's ack_bad_irq(),
sometimes also in arch specific drivers.

It's time to consolidate this code duplication:

  * introduce a global counter and inlined accessors
  * increase the counter in all call sites of ack_bad_irq()
  * subsequent patches will transform the individual archs one by one

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 include/asm-generic/irq-err.h | 17 +++++++++++++++++
 kernel/irq/dummychip.c        |  2 ++
 kernel/irq/handle.c           |  4 ++++
 kernel/irq/irqdesc.c          |  2 ++
 4 files changed, 25 insertions(+)
 create mode 100644 include/asm-generic/irq-err.h

diff --git a/include/asm-generic/irq-err.h b/include/asm-generic/irq-err.h
new file mode 100644
index 000000000000..33c75eb50c10
--- /dev/null
+++ b/include/asm-generic/irq-err.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_IRQ_ERR_H
+#define __ASM_GENERIC_IRQ_ERR_H
+
+extern atomic_t irq_err_counter;
+
+static inline void irq_err_inc(void)
+{
+	atomic_inc(&irq_err_counter);
+}
+
+static inline int irq_err_get(void)
+{
+	return atomic_read(&irq_err_counter);
+}
+
+#endif /* __ASM_GENERIC_IRQ_ERR_H */
diff --git a/kernel/irq/dummychip.c b/kernel/irq/dummychip.c
index 0b0cdf206dc4..93585dab9bd0 100644
--- a/kernel/irq/dummychip.c
+++ b/kernel/irq/dummychip.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/export.h>
+#include <asm-generic/irq-err.h>
 
 #include "internals.h"
 
@@ -20,6 +21,7 @@ static void ack_bad(struct irq_data *data)
 	struct irq_desc *desc = irq_data_to_desc(data);
 
 	print_irq_desc(data->irq, desc);
+	irq_err_inc();
 	ack_bad_irq(data->irq);
 }
 
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index 762a928e18f9..ad90f5a56c3a 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -13,11 +13,14 @@
 #include <linux/sched.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <asm-generic/irq-err.h>
 
 #include <trace/events/irq.h>
 
 #include "internals.h"
 
+atomic_t irq_err_counter;
+
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
 void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
 #endif
@@ -34,6 +37,7 @@ void handle_bad_irq(struct irq_desc *desc)
 
 	print_irq_desc(irq, desc);
 	kstat_incr_irqs_this_cpu(desc);
+	irq_err_inc();
 	ack_bad_irq(irq);
 }
 EXPORT_SYMBOL_GPL(handle_bad_irq);
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 62a381351775..6192672be4d2 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/bitmap.h>
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
+#include <asm-generic/irq-err.h>
 
 #include "internals.h"
 
@@ -684,6 +685,7 @@ int __handle_domain_irq(struct irq_domain *domain, unsigned int hwirq,
 		if (printk_ratelimit())
 			pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
 				irq, hwirq, nr_irqs);
+		irq_err_inc();
 		ack_bad_irq(irq);
 		ret = -EINVAL;
 	} else {
-- 
2.11.0

