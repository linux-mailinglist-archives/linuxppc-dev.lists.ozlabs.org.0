Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE927BD84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 09:01:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0r020ZpyzDqDK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 17:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0qjR2vdvzDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 16:48:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C0qjL6l32z9v2cQ;
 Tue, 29 Sep 2020 08:48:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id F3MwH_Ln5k8e; Tue, 29 Sep 2020 08:48:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C0qjL4G8Kz9v2c7;
 Tue, 29 Sep 2020 08:48:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BD358B79F;
 Tue, 29 Sep 2020 08:48:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kz0F3K92a1fH; Tue, 29 Sep 2020 08:48:39 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 541EA8B76C;
 Tue, 29 Sep 2020 08:48:39 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3540465E8A; Tue, 29 Sep 2020 06:48:39 +0000 (UTC)
Message-Id: <3e8a13ee83418630c753c30cb722ae682d5b2d39.1601362098.git.christophe.leroy@csgroup.eu>
In-Reply-To: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601362098.git.christophe.leroy@csgroup.eu>
References: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601362098.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 8/8] powerpc: Remove get_tb_or_rtc()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Sep 2020 06:48:39 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

601 is gone, get_tb_or_rtc() is equivalent to get_tb().

Replace the former by the later.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/time.h | 5 -----
 arch/powerpc/kernel/irq.c       | 2 +-
 arch/powerpc/kernel/time.c      | 6 +++---
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index caf68a4bc19e..410ed72eef1c 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -85,11 +85,6 @@ static inline u64 get_tb(void)
 }
 #endif /* !CONFIG_PPC64 */
 
-static inline u64 get_tb_or_rtc(void)
-{
-	return get_tb();
-}
-
 static inline void set_tb(unsigned int upper, unsigned int lower)
 {
 	mtspr(SPRN_TBWL, 0);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bf21ebd36190..2d188f81ebdb 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -104,7 +104,7 @@ static inline notrace unsigned long get_irq_happened(void)
 
 static inline notrace int decrementer_check_overflow(void)
 {
- 	u64 now = get_tb_or_rtc();
+	u64 now = get_tb();
 	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
  
 	return now >= *next_tb;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 13c820c15d37..760ea359a7f7 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -595,7 +595,7 @@ void timer_interrupt(struct pt_regs *regs)
 		irq_work_run();
 	}
 
-	now = get_tb_or_rtc();
+	now = get_tb();
 	if (now >= *next_tb) {
 		*next_tb = ~(u64)0;
 		if (evt->event_handler)
@@ -937,7 +937,7 @@ static void __init clocksource_init(void)
 static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev)
 {
-	__this_cpu_write(decrementers_next_tb, get_tb_or_rtc() + evt);
+	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
 	set_dec(evt);
 
 	/* We may have raced with new irq work */
@@ -1071,7 +1071,7 @@ void __init time_init(void)
 	tb_to_ns_scale = scale;
 	tb_to_ns_shift = shift;
 	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
-	boot_tb = get_tb_or_rtc();
+	boot_tb = get_tb();
 
 	/* If platform provided a timezone (pmac), we correct the time */
 	if (timezone_offset) {
-- 
2.25.0

