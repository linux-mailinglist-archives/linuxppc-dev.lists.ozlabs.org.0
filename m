Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D15458A0A4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:43:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Dr/I0tWU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWsc4NWvz3vbC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 17:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Dr/I0tWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWqL203tz3dh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 17:41:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712821306; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=gF7qIKS2+QnTwBDX4CgdxCnFsGoEC/Sga8w5/JAmLtI=;
	b=Dr/I0tWU+XAeSdKP9g2oT/P1UU0nCOamOaYg2E8XkfVOmf59fGZztWBi/16aSkWZW0y5/2t4DcvOfo3NNCajIhO3+tWDuN97jp9VbWD7FpPZZK70Wk80XklrpO/qp5YZ5SaEMViqVECyZ6Tta8S8Gbm9+WLHu4C1YYkPdunng34=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W4KbQ9Q_1712821302;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W4KbQ9Q_1712821302)
          by smtp.aliyun-inc.com;
          Thu, 11 Apr 2024 15:41:44 +0800
From: Bitao Hu <yaoma@linux.alibaba.com>
To: dianders@chromium.org,
	tglx@linutronix.de,
	liusong@linux.alibaba.com,
	akpm@linux-foundation.org,
	pmladek@suse.com,
	kernelfans@gmail.com,
	deller@gmx.de,
	npiggin@gmail.com,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	jan.kiszka@siemens.com
Subject: [PATCHv13 2/5] genirq: Provide a snapshot mechanism for interrupt statistics
Date: Thu, 11 Apr 2024 15:41:31 +0800
Message-Id: <20240411074134.30922-3-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20240411074134.30922-1-yaoma@linux.alibaba.com>
References: <20240411074134.30922-1-yaoma@linux.alibaba.com>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The soft lockup detector lacks a mechanism to identify interrupt storms
as root cause of a lockup. To enable this the detector needs a
mechanism to snapshot the interrupt count statistics on a CPU when the
detector observes a potential lockup scenario and compare that against
the interrupt count when it warns about the lockup later on. The number
of interrupts in that period give a hint whether the lockup might be
caused by an interrupt storm.

Instead of having extra storage in the lockup detector and accessing
the internals of the interrupt descriptor directly, add a snapshot
member to the per CPU irq_desc::kstat_irq structure and provide
interfaces to take a snapshot of all interrupts on the current CPU
and to retrieve the delta of a specific interrupt later on.

Originally-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
---
 include/linux/irqdesc.h     |  4 ++++
 include/linux/kernel_stat.h |  8 ++++++++
 kernel/irq/Kconfig          |  4 ++++
 kernel/irq/irqdesc.c        | 25 +++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index c28612674acb..fd091c35d572 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -20,9 +20,13 @@ struct pt_regs;
 /**
  * struct irqstat - interrupt statistics
  * @cnt:	real-time interrupt count
+ * @ref:	snapshot of interrupt count
  */
 struct irqstat {
 	unsigned int	cnt;
+#ifdef CONFIG_GENERIC_IRQ_STAT_SNAPSHOT
+	unsigned int	ref;
+#endif
 };
 
 /**
diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index 9935f7ecbfb9..9c042c6384bb 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -79,6 +79,14 @@ static inline unsigned int kstat_cpu_softirqs_sum(int cpu)
 	return sum;
 }
 
+#ifdef CONFIG_GENERIC_IRQ_STAT_SNAPSHOT
+extern void kstat_snapshot_irqs(void);
+extern unsigned int kstat_get_irq_since_snapshot(unsigned int irq);
+#else
+static inline void kstat_snapshot_irqs(void) { }
+static inline unsigned int kstat_get_irq_since_snapshot(unsigned int irq) { return 0; }
+#endif
+
 /*
  * Number of interrupts per specific IRQ source, since bootup
  */
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 2531f3496ab6..529adb1f5859 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -108,6 +108,10 @@ config GENERIC_IRQ_MATRIX_ALLOCATOR
 config GENERIC_IRQ_RESERVATION_MODE
 	bool
 
+# Snapshot for interrupt statistics
+config GENERIC_IRQ_STAT_SNAPSHOT
+	bool
+
 # Support forced irq threading
 config IRQ_FORCED_THREADING
        bool
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index b59b79200ad7..f348faffa7b4 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -994,6 +994,31 @@ static unsigned int kstat_irqs(unsigned int irq)
 	return sum;
 }
 
+#ifdef CONFIG_GENERIC_IRQ_STAT_SNAPSHOT
+
+void kstat_snapshot_irqs(void)
+{
+	struct irq_desc *desc;
+	unsigned int irq;
+
+	for_each_irq_desc(irq, desc) {
+		if (!desc->kstat_irqs)
+			continue;
+		this_cpu_write(desc->kstat_irqs->ref, this_cpu_read(desc->kstat_irqs->cnt));
+	}
+}
+
+unsigned int kstat_get_irq_since_snapshot(unsigned int irq)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+
+	if (!desc || !desc->kstat_irqs)
+		return 0;
+	return this_cpu_read(desc->kstat_irqs->cnt) - this_cpu_read(desc->kstat_irqs->ref);
+}
+
+#endif
+
 /**
  * kstat_irqs_usr - Get the statistics for an interrupt from thread context
  * @irq:	The interrupt number
-- 
2.37.1 (Apple Git-137.1)

