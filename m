Return-Path: <linuxppc-dev+bounces-1146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ADD97021B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 14:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1BZW3B0lz2yGh;
	Sat,  7 Sep 2024 22:03:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725697650;
	cv=none; b=EjgPWUPWFxPNbw49smsAaeZoDrqC0pH7SRzQSYDS3xp+R+nIlrBW77mlXP5Bc+NbZueFjeRbVcMkEcqSii/vOyjpYrYVlmrl5nqBFXtae/Dg0qdmpXMcmTN06iJGXzvvVIe60XhibDBlwYBG/+e5StgA/ixjOUiMUtlmiUsMGd7r5kpD7qnS1h21Q/B8gcZT5P4nCkMCAV9sBNpNpmN0jdne5WpsDepX03HfAv9rhW4bNVpP4Cx/Zv+JEAr27lL9eitHbEX8uo7/PXY90WH9wzcaGTVD5j8qdUK/iHLtB+/lqPZEPSRCd81NUEeS/wlyWZ8gGvytux63IA+qLFkuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725697650; c=relaxed/relaxed;
	bh=n0V2CVYvjQo2hxKK/X5uurr9LHjPXieQlSn+vNAwmxM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZxG1ezvPkglGuE52ziJ27twHmE1E74cafpGD6fe7qtRO0CC1LAg+ONv2cIaNfCfqCkpx1EchBVRK9iptG1hjiC2hy5dCU1zrBNI0nRRpDmMlhTNL9GPl3KtFQLYGFGAXDP2ypJ22HmxyDitOyuAD7w2p7MRrJg65wnQxfu+6LPs1lLP8vkCu0gTpqYs2pm7NQMVUk89rQE5BCYuf4yvtPnd+6RJg3O2DsagnmJs+gTDpgwtsGtoEOOZqvj9TBDB+lQSoNf5lJgYDqezB9RIIknREGihpK7nHgaYgonhUy9tTvkDtWcvZbpYKt0osB4gBwNWrwhJ2iWzwRsNV4s3R9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X15nF2McLz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 18:27:27 +1000 (AEST)
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxlehpDtxmxhMBAA--.1755S3;
	Sat, 07 Sep 2024 16:27:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxcNZoDtxmd+0AAA--.5018S2;
	Sat, 07 Sep 2024 16:27:21 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Naveen N Rao <naveen@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] smp: Mark smp_prepare_boot_cpu() __init
Date: Sat,  7 Sep 2024 16:27:20 +0800
Message-Id: <20240907082720.452148-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxcNZoDtxmd+0AAA--.5018S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function smp_prepare_boot_cpu() is only called at boot stage, here
mark it as __init.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kernel/smp.c | 2 +-
 arch/mips/kernel/smp.c      | 2 +-
 arch/powerpc/kernel/smp.c   | 2 +-
 include/linux/smp.h         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index ca405ab86aae..be2655c4c414 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -476,7 +476,7 @@ core_initcall(ipi_pm_init);
 #endif
 
 /* Preload SMP state for boot cpu */
-void smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
 	unsigned int cpu, node, rr_node;
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0362fc5df7b0..39e193cad2b9 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -439,7 +439,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 }
 
 /* preload SMP state for boot cpu */
-void smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
 	if (mp_ops->prepare_boot_cpu)
 		mp_ops->prepare_boot_cpu();
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 46e6d2cd7a2d..4ab9b8cee77a 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1166,7 +1166,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	cpu_smt_set_num_threads(num_threads, threads_per_core);
 }
 
-void smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
 	BUG_ON(smp_processor_id() != boot_cpuid);
 #ifdef CONFIG_PPC64
diff --git a/include/linux/smp.h b/include/linux/smp.h
index fcd61dfe2af3..6a0813c905d0 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -109,7 +109,7 @@ static inline void on_each_cpu_cond(smp_cond_func_t cond_func,
  * Architecture specific boot CPU setup.  Defined as empty weak function in
  * init/main.c. Architectures can override it.
  */
-void smp_prepare_boot_cpu(void);
+void __init smp_prepare_boot_cpu(void);
 
 #ifdef CONFIG_SMP
 

base-commit: b31c4492884252a8360f312a0ac2049349ddf603
-- 
2.39.3


