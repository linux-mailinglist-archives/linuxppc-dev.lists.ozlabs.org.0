Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D151E8A0A53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:44:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yPRmDSBb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWtP4XpJz3vbS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 17:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yPRmDSBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWqN4rdJz3dXM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 17:41:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712821308; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=tUtCoF0eyO9gScpPeW9H9/9ARpqG/SH0m0PV7EcoO1o=;
	b=yPRmDSBbMDW3TXfUMg9JEAVEQZcBHEGgtAJKuNEJSSJfUpHOZS60BomS8aYac7Xxwzr2PNc5zVVQrI4zan9InHWMu4wKoBuOK1it+jxz4OTOUF4QsEA748yI1ScZT2JpotNepLHB92mHJHkmXWh60CcqbQ7Cpsa76MBm9TVRGVk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W4KbQAN_1712821305;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W4KbQAN_1712821305)
          by smtp.aliyun-inc.com;
          Thu, 11 Apr 2024 15:41:47 +0800
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
Subject: [PATCHv13 3/5] genirq: Avoid summation loops for /proc/interrupts
Date: Thu, 11 Apr 2024 15:41:32 +0800
Message-Id: <20240411074134.30922-4-yaoma@linux.alibaba.com>
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

show_interrupts() unconditionally accumulates the per CPU interrupt
statistics to determine whether an interrupt was ever raised.

This can be avoided for all interrupts which are not strictly per CPU
and not of type NMI because those interrupts provide already an
accumulated counter. The required logic is already implemented in
kstat_irqs().

Split the inner access logic out of kstat_irqs() and use it for
kstat_irqs() and show_interrupts() to avoid the accumulation loop
when possible.

Originally-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
Reviewed-by: Liu Song <liusong@linux.alibaba.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/irq/internals.h |  2 ++
 kernel/irq/irqdesc.c   | 16 +++++++++++-----
 kernel/irq/proc.c      |  6 ++----
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 1d92532c2aae..6c43ef3e7308 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -98,6 +98,8 @@ extern void mask_irq(struct irq_desc *desc);
 extern void unmask_irq(struct irq_desc *desc);
 extern void unmask_threaded_irq(struct irq_desc *desc);
 
+extern unsigned int kstat_irqs_desc(struct irq_desc *desc, const struct cpumask *cpumask);
+
 #ifdef CONFIG_SPARSE_IRQ
 static inline void irq_mark_irq(unsigned int irq) { }
 #else
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index f348faffa7b4..382093196210 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -976,24 +976,30 @@ static bool irq_is_nmi(struct irq_desc *desc)
 	return desc->istate & IRQS_NMI;
 }
 
-static unsigned int kstat_irqs(unsigned int irq)
+unsigned int kstat_irqs_desc(struct irq_desc *desc, const struct cpumask *cpumask)
 {
-	struct irq_desc *desc = irq_to_desc(irq);
 	unsigned int sum = 0;
 	int cpu;
 
-	if (!desc || !desc->kstat_irqs)
-		return 0;
 	if (!irq_settings_is_per_cpu_devid(desc) &&
 	    !irq_settings_is_per_cpu(desc) &&
 	    !irq_is_nmi(desc))
 		return data_race(desc->tot_count);
 
-	for_each_possible_cpu(cpu)
+	for_each_cpu(cpu, cpumask)
 		sum += data_race(per_cpu(desc->kstat_irqs->cnt, cpu));
 	return sum;
 }
 
+static unsigned int kstat_irqs(unsigned int irq)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+
+	if (!desc || !desc->kstat_irqs)
+		return 0;
+	return kstat_irqs_desc(desc, cpu_possible_mask);
+}
+
 #ifdef CONFIG_GENERIC_IRQ_STAT_SNAPSHOT
 
 void kstat_snapshot_irqs(void)
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 6954e0a02047..5c320c3f10a7 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -488,10 +488,8 @@ int show_interrupts(struct seq_file *p, void *v)
 	if (!desc || irq_settings_is_hidden(desc))
 		goto outsparse;
 
-	if (desc->kstat_irqs) {
-		for_each_online_cpu(j)
-			any_count |= data_race(per_cpu(desc->kstat_irqs->cnt, j));
-	}
+	if (desc->kstat_irqs)
+		any_count = kstat_irqs_desc(desc, cpu_online_mask);
 
 	if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)
 		goto outsparse;
-- 
2.37.1 (Apple Git-137.1)

