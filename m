Return-Path: <linuxppc-dev+bounces-3065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC19C27BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 23:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlYx82ygNz2yN1;
	Sat,  9 Nov 2024 09:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731083058;
	cv=none; b=lEWvIqEavJstmwFzEFcTj26wk1rzfLzL5Q2RwtVzGw7n25bzTkp06MZVyeF+ZkdxMVAF8+Ta6/zTdv6tIfXbys6X5ovri56vYGI0G2CQLO7aczaFFfmavB+F2Bu90wbTKBukDG6Zl/oVCaiJ2s/ww/2/iF46hkK4hYcn0WNhlpIVFOTE2pscj/LQLtvBr8u3YsULYP9mrWzzrhgb4NNfaWnPq0szFW0tEi+G1RAL8ZboAMpUH9dhz5mgxFcOsFoIlk3/ZLmIbZzn79/2S1pI8CymAoV3Rxei8hyFqEi6N4rQUfkzoSA4iwKeemHhLc3n/zXG/8qu0uzsvQDrSlZrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731083058; c=relaxed/relaxed;
	bh=zMKR9m10pMGgPA2owiS0OIe8hUhnak/8WG7bNyYEFK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ANjgt97w8BXF8rj6HJqP1ytDVFHcs/aijl8RacSiERAgXLX4oRvDH3qC3gPhwNKmh/1hhr3jaW6OVlV+i7oUB+CsCTC5uo+KJPRnl2NdsOjiucQ9S+jWzsU+pKIoUStdmcBrCF3gxA17koHZNXKVf+mQehd34uzO/aYj6qGiyL5a+77fLTu56D6cTOONXaxhBrECH2YD0+jhSZAucl+hPh9V0PPSFDKplRbig8xO6LX/yMBJcVgCerPLCQ643oOKStLvuY84GyiKOjcDChc/qA8NKmBW/aJPdHLt3/+q0uuW9u/AOILeViUDVS8NpXRVChLVXN863gvr8Se8X/L34g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oJd+CIvE; dkim-atps=neutral; spf=pass (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=00107082@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oJd+CIvE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=00107082@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlPQl1FN3z3bxR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 03:24:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zMKR9
	m10pMGgPA2owiS0OIe8hUhnak/8WG7bNyYEFK4=; b=oJd+CIvEa/55hazHPJ3DY
	bcNQIR+/A1KqOjtfxtKFv0tLatgzA7+qNCVH/4TIsNGuyYZIBp4rZufhzmBJjETc
	Nq7S/ItEWl0KXjpwO8WwalkGKo5JIAJ/UGsjkKp63P6MfsmDxbbjRz6asRvxq0l1
	xrq+KSjV+RyPCOk42rzaH8=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHpzEAOy5nKkoCBg--.1049S4;
	Sat, 09 Nov 2024 00:23:34 +0800 (CST)
From: David Wang <00107082@163.com>
To: mpe@ellerman.id.au
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	David Wang <00107082@163.com>
Subject: [PATCH 11/13] powerpc/irq: use seq_put_decimal_ull_width() for decimal values
Date: Sat,  9 Nov 2024 00:23:27 +0800
Message-Id: <20241108162327.9887-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
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
X-CM-TRANSID:PigvCgCHpzEAOy5nKkoCBg--.1049S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxur47Xw18WFykAF1ktFWrKrg_yoWrCF4rp3
	ySkF17Xw4fZr1Yq3W3AanFvwn8KFn0ya4Ygwn3Gr4rAa1DurWkWFnIvF47XFW7Gry2qrsa
	9r9agr18Kr98Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjD7cUUUUU=
X-Originating-IP: [111.35.191.191]
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hmRqmcuN-cU9QAGse
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Performance improvement for reading /proc/interrupts on arch powerpc

Signed-off-by: David Wang <00107082@163.com>
---
 arch/powerpc/kernel/irq.c | 44 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 2e1600a8bbbb..a0e8b998c9b5 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -89,69 +89,69 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 #if defined(CONFIG_PPC32) && defined(CONFIG_TAU_INT)
 	if (tau_initialized) {
-		seq_printf(p, "%*s: ", prec, "TAU");
+		seq_printf(p, "%*s:", prec, "TAU");
 		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", tau_interrupts(j));
+			seq_put_decimal_ull_width(p, " ", tau_interrupts(j), 10);
 		seq_puts(p, "  PowerPC             Thermal Assist (cpu temp)\n");
 	}
 #endif /* CONFIG_PPC32 && CONFIG_TAU_INT */
 
-	seq_printf(p, "%*s: ", prec, "LOC");
+	seq_printf(p, "%*s:", prec, "LOC");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).timer_irqs_event);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).timer_irqs_event, 10);
         seq_printf(p, "  Local timer interrupts for timer event device\n");
 
-	seq_printf(p, "%*s: ", prec, "BCT");
+	seq_printf(p, "%*s:", prec, "BCT");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).broadcast_irqs_event);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).broadcast_irqs_event, 10);
 	seq_printf(p, "  Broadcast timer interrupts for timer event device\n");
 
-	seq_printf(p, "%*s: ", prec, "LOC");
+	seq_printf(p, "%*s:", prec, "LOC");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).timer_irqs_others);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).timer_irqs_others, 10);
         seq_printf(p, "  Local timer interrupts for others\n");
 
-	seq_printf(p, "%*s: ", prec, "SPU");
+	seq_printf(p, "%*s:", prec, "SPU");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).spurious_irqs);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).spurious_irqs, 10);
 	seq_printf(p, "  Spurious interrupts\n");
 
-	seq_printf(p, "%*s: ", prec, "PMI");
+	seq_printf(p, "%*s:", prec, "PMI");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).pmu_irqs);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).pmu_irqs, 10);
 	seq_printf(p, "  Performance monitoring interrupts\n");
 
-	seq_printf(p, "%*s: ", prec, "MCE");
+	seq_printf(p, "%*s:", prec, "MCE");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).mce_exceptions);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).mce_exceptions, 10);
 	seq_printf(p, "  Machine check exceptions\n");
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		seq_printf(p, "%*s: ", prec, "HMI");
+		seq_printf(p, "%*s:", prec, "HMI");
 		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", paca_ptrs[j]->hmi_irqs);
+			seq_put_decimal_ull_width(p, " ", paca_ptrs[j]->hmi_irqs, 10);
 		seq_printf(p, "  Hypervisor Maintenance Interrupts\n");
 	}
 #endif
 
-	seq_printf(p, "%*s: ", prec, "NMI");
+	seq_printf(p, "%*s:", prec, "NMI");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).sreset_irqs);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).sreset_irqs, 10);
 	seq_printf(p, "  System Reset interrupts\n");
 
 #ifdef CONFIG_PPC_WATCHDOG
-	seq_printf(p, "%*s: ", prec, "WDG");
+	seq_printf(p, "%*s:", prec, "WDG");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).soft_nmi_irqs);
+		seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).soft_nmi_irqs, 10);
 	seq_printf(p, "  Watchdog soft-NMI interrupts\n");
 #endif
 
 #ifdef CONFIG_PPC_DOORBELL
 	if (cpu_has_feature(CPU_FTR_DBELL)) {
-		seq_printf(p, "%*s: ", prec, "DBL");
+		seq_printf(p, "%*s:", prec, "DBL");
 		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", per_cpu(irq_stat, j).doorbell_irqs);
+			seq_put_decimal_ull_width(p, " ", per_cpu(irq_stat, j).doorbell_irqs, 10);
 		seq_printf(p, "  Doorbell interrupts\n");
 	}
 #endif
-- 
2.39.2


