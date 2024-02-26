Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E4866811
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 03:12:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XIvyROOh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjkfH3pMPz3vdy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 13:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XIvyROOh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjkb93mssz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 13:09:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1708913393; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uN6ubd7T7BDgKGYOOcoXXMe2toDXWaMbHm9pDjI4o+Y=;
	b=XIvyROOhSxK91wwUVMK+jpvHP1KDOSyC4gzrMSzUSJaH/hWd7ljCbUlZWGYFCopMWLHT40brMp8zNEkLDIljRz7PUiaRJ2LLHvpgOfotccsduQsc9aEbkWGuaYqHiAno3K4CknCjWsn4G4sk4E6jfi/JZCh5HIcakBIGpvCcD/U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W1A1HdQ_1708913390;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1A1HdQ_1708913390)
          by smtp.aliyun-inc.com;
          Mon, 26 Feb 2024 10:09:52 +0800
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
Subject: [PATCHv10 3/4] genirq: Avoid summation loops for /proc/interrupts
Date: Mon, 26 Feb 2024 10:09:38 +0800
Message-Id: <20240226020939.45264-4-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20240226020939.45264-1-yaoma@linux.alibaba.com>
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
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

We could use the irq_desc::tot_count member to avoid the summation
loop for interrupts which are not marked as 'PER_CPU' interrupts in
'show_interrupts'. This could reduce the time overhead of reading
/proc/interrupts.

Originally-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
---
 include/linux/irqdesc.h | 2 ++
 kernel/irq/irqdesc.c    | 2 +-
 kernel/irq/proc.c       | 9 +++++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 2912b1998670..1ee96d7232b4 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -121,6 +121,8 @@ static inline void irq_unlock_sparse(void) { }
 extern struct irq_desc irq_desc[NR_IRQS];
 #endif
 
+extern bool irq_is_nmi(struct irq_desc *desc);
+
 static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
 					      unsigned int cpu)
 {
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 9cd17080b2d8..56a767957a9d 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -955,7 +955,7 @@ unsigned int kstat_irqs_cpu(unsigned int irq, int cpu)
 	return desc && desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
 }
 
-static bool irq_is_nmi(struct irq_desc *desc)
+bool irq_is_nmi(struct irq_desc *desc)
 {
 	return desc->istate & IRQS_NMI;
 }
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 6954e0a02047..b3b1b93f0410 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -489,8 +489,13 @@ int show_interrupts(struct seq_file *p, void *v)
 		goto outsparse;
 
 	if (desc->kstat_irqs) {
-		for_each_online_cpu(j)
-			any_count |= data_race(per_cpu(desc->kstat_irqs->cnt, j));
+		if (!irq_settings_is_per_cpu_devid(desc) &&
+		    !irq_settings_is_per_cpu(desc) &&
+		    !irq_is_nmi(desc))
+			any_count = data_race(desc->tot_count);
+		else
+			for_each_online_cpu(j)
+				any_count |= data_race(per_cpu(desc->kstat_irqs->cnt, j));
 	}
 
 	if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)
-- 
2.37.1 (Apple Git-137.1)

