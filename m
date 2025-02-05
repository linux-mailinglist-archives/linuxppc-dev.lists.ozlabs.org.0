Return-Path: <linuxppc-dev+bounces-5861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2EA287CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 11:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynx7X4wBMz2yvv;
	Wed,  5 Feb 2025 21:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738750808;
	cv=none; b=OueNCQLE55ddLJ1rhiZSBNU5RyhrwaKE2xOmfJGWjQEx7PsrKEfRBN9CLRgK/eO6Yo6ES8hiYMiW0pO3atsf+pIV3hT3ZyKVnmZRSoWP3d8LSyabR3BwIK1q7++kZr7SnClDx66xNhdGjMuEYrAQjNGgJwbOwYp0C/O22LiWuqLPUOgqU1lyCUjinqd7Qo8xF5NdC0LJMEIk1EdrtK6QQ7dGoVE6Pyxx04D3OIkakKlTOtxc7QDWv8Vef2upfNW0FJ5J4VOkpe77ODqLmFIDTtEkR+/1gasrtkcpyh5Zuv7xM6sWi0qNYrL7SoUDCd0/ZHGjjTDdmdKly/vTfiJDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738750808; c=relaxed/relaxed;
	bh=UmRS0TQ9cmsMW3/S89e4rLuoWMYkTd9SH2ZKjN67w7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aW6irvKIGpc4v0E94xCVDxO0kHbBJa6SqGBhu8l64xStVCZglke/JJSEnK7cGbZxdYk3D5BMKa+vSp3aEwsUTg8pWKVR4qIsZxjk0crfix66gvK6mApUjLUkzOi0h0Rd5m9Vt/+hLcHbIZNlaMeqz2Ri4Z9jaGoNNek5LpveZsqXSL/9nHaHbdd1/hmW6Pswf3peZTyOk6bg9oJUGxHiQQyoQ1rashpK42CfgIAKYrwxsU3GRuT/7sQbjKXNHDxZggxe7dFnggxidEM65LetFQKJzoFBp6oZKGCpnAc3hZK1gL4PPqYL42mSwU4ptT08a2ZMS8d6QBT9NCpgEPFZDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynx7V5fr3z2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 21:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YnwZ26rWfz9sRy;
	Wed,  5 Feb 2025 10:54:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-KKv11BQlIr; Wed,  5 Feb 2025 10:54:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YnwZ25znhz9sRs;
	Wed,  5 Feb 2025 10:54:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BE9F78B765;
	Wed,  5 Feb 2025 10:54:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wXrCb1ZKHXqu; Wed,  5 Feb 2025 10:54:34 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F3188B763;
	Wed,  5 Feb 2025 10:54:34 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/time: Define div128_by_32() static and __init
Date: Wed,  5 Feb 2025 10:54:26 +0100
Message-ID: <50810349bf1eee378fbeab72a36e4b6553a60c3d.1738749246.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738749266; l=4498; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=f/KudvDb/LpLUE7WgOFEb5XQshqKSdc0rKHj8lp4Q8E=; b=cdqu6OPzHtRCATddCKCHRp6u+8nN0lIO6F+X99psIAbZ/S3lfy5pCsRzy+0ofVOA68tymV2yF aZjsgJYAF58CWUpPiuDyr1MtZMZwQXNGPHao31ikXSlkOeuWK+kUjP8
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

div128_by_32() used to be called from outside time.c in the old days
but since v2.6.15 it hasn't been used outside time.c

$ git grep div128_by_32 v2.6.14
v2.6.14:arch/ppc64/kernel/iSeries_setup.c:	div128_by_32(1024 * 1024, 0, tb_ticks_per_sec, &divres);
v2.6.14:arch/ppc64/kernel/pmac_time.c:	div128_by_32( 1024*1024, 0, tb_ticks_per_sec, &divres );
v2.6.14:arch/ppc64/kernel/time.c:				div128_by_32( XSEC_PER_SEC, 0, tb_ticks_per_sec, &divres );
v2.6.14:arch/ppc64/kernel/time.c:	div128_by_32(1024*1024, 0, tb_ticks_per_sec, &divres);
v2.6.14:arch/ppc64/kernel/time.c:	div128_by_32(1000000000, 0, tb_ticks_per_sec, &res);
v2.6.14:arch/ppc64/kernel/time.c:	div128_by_32( 1024*1024, 0, new_tb_ticks_per_sec, &divres );
v2.6.14:arch/ppc64/kernel/time.c:void div128_by_32( unsigned long dividend_high, unsigned long dividend_low,
v2.6.14:include/asm-ppc64/time.h:void div128_by_32( unsigned long dividend_high, unsigned long dividend_low,

$ git grep div128_by_32 v2.6.15
v2.6.15:arch/powerpc/kernel/time.c:				div128_by_32( XSEC_PER_SEC, 0, tb_ticks_per_sec, &divres );
v2.6.15:arch/powerpc/kernel/time.c:	div128_by_32(1024*1024, 0, tb_ticks_per_sec, &res);
v2.6.15:arch/powerpc/kernel/time.c:	div128_by_32(1000000000, 0, tb_ticks_per_sec, &res);
v2.6.15:arch/powerpc/kernel/time.c:	div128_by_32(1024*1024, 0, new_tb_ticks_per_sec, &divres);
v2.6.15:arch/powerpc/kernel/time.c:void div128_by_32(u64 dividend_high, u64 dividend_low,
v2.6.15:include/asm-powerpc/time.h:extern void div128_by_32(u64 dividend_high, u64 dividend_low,

Move it above its only caller which is time_init() and define it
static and __init.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/time.h |  3 --
 arch/powerpc/kernel/time.c      | 65 ++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 9bdd8080299b..f8885586efaf 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -89,9 +89,6 @@ static inline unsigned long tb_ticks_since(unsigned long tstamp)
 #define mulhdu(x, y)	mul_u64_u64_shr(x, y, 64)
 #endif
 
-extern void div128_by_32(u64 dividend_high, u64 dividend_low,
-			 unsigned divisor, struct div_result *dr);
-
 extern void secondary_cpu_time_init(void);
 extern void __init time_init(void);
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 0727332ad86f..0be53642501b 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -901,6 +901,38 @@ void secondary_cpu_time_init(void)
 	register_decrementer_clockevent(smp_processor_id());
 }
 
+/*
+ * Divide a 128-bit dividend by a 32-bit divisor, leaving a 128 bit
+ * result.
+ */
+static __init void div128_by_32(u64 dividend_high, u64 dividend_low,
+				unsigned int divisor, struct div_result *dr)
+{
+	unsigned long a, b, c, d;
+	unsigned long w, x, y, z;
+	u64 ra, rb, rc;
+
+	a = dividend_high >> 32;
+	b = dividend_high & 0xffffffff;
+	c = dividend_low >> 32;
+	d = dividend_low & 0xffffffff;
+
+	w = a / divisor;
+	ra = ((u64)(a - (w * divisor)) << 32) + b;
+
+	rb = ((u64)do_div(ra, divisor) << 32) + c;
+	x = ra;
+
+	rc = ((u64)do_div(rb, divisor) << 32) + d;
+	y = rb;
+
+	do_div(rc, divisor);
+	z = rc;
+
+	dr->result_high = ((u64)w << 32) + x;
+	dr->result_low  = ((u64)y << 32) + z;
+}
+
 /* This function is only called on the boot processor */
 void __init time_init(void)
 {
@@ -974,39 +1006,6 @@ void __init time_init(void)
 	enable_sched_clock_irqtime();
 }
 
-/*
- * Divide a 128-bit dividend by a 32-bit divisor, leaving a 128 bit
- * result.
- */
-void div128_by_32(u64 dividend_high, u64 dividend_low,
-		  unsigned divisor, struct div_result *dr)
-{
-	unsigned long a, b, c, d;
-	unsigned long w, x, y, z;
-	u64 ra, rb, rc;
-
-	a = dividend_high >> 32;
-	b = dividend_high & 0xffffffff;
-	c = dividend_low >> 32;
-	d = dividend_low & 0xffffffff;
-
-	w = a / divisor;
-	ra = ((u64)(a - (w * divisor)) << 32) + b;
-
-	rb = ((u64) do_div(ra, divisor) << 32) + c;
-	x = ra;
-
-	rc = ((u64) do_div(rb, divisor) << 32) + d;
-	y = rb;
-
-	do_div(rc, divisor);
-	z = rc;
-
-	dr->result_high = ((u64)w << 32) + x;
-	dr->result_low  = ((u64)y << 32) + z;
-
-}
-
 /* We don't need to calibrate delay, we use the CPU timebase for that */
 void calibrate_delay(void)
 {
-- 
2.47.0


