Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DEF7457A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 10:49:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvfkR4My7z3cN9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 18:49:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvfj25Z45z3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 18:48:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qvfhv6l9zz9sFp;
	Mon,  3 Jul 2023 10:48:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ku61sk--KPpX; Mon,  3 Jul 2023 10:48:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qvfhs4hj6z9sFh;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 990158B81D;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9jRdTa_7vH9p; Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A8E28B768;
	Mon,  3 Jul 2023 10:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 3638mPcP1103938
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 3 Jul 2023 10:48:25 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 3638mOLm1103936;
	Mon, 3 Jul 2023 10:48:24 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 1/9] powerpc/kuap: Avoid unnecessary reads of MD_AP
Date: Mon,  3 Jul 2023 10:48:05 +0200
Message-ID: <7f42c926855e0fe54265d5002d082b66faeb5061.1688373335.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1688373335.git.christophe.leroy@csgroup.eu>
References: <cover.1688373335.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688374084; l=2619; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=mZCR5C01Pd3BlOL1lPvQiAD1tIC5U5fSSpbLhzl8Nq4=; b=JOh2ecMEjCZF/MEXQkz3YoOhHTHLweut9WrMRJWYKz9BmsJI1Yei8GndNZFCc8o/iMR6tiMKZ HYt3wztsmrUDsodHaI7XaTAl9KoNCc7JsSoTtONQd0oEGBPfSmGT23k
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A disassembly of interrupt_exit_kernel_prepare() shows a useless read
of MD_AP register. This is shown by r9 being re-used immediately without
doing anything with the value read.

  c000e0e0:       60 00 00 00     nop
  c000e0e4: ===>  7d 3a c2 a6     mfmd_ap r9	<====
  c000e0e8:       7d 20 00 a6     mfmsr   r9
  c000e0ec:       7c 51 13 a6     mtspr   81,r2
  c000e0f0:       81 3f 00 84     lwz     r9,132(r31)
  c000e0f4:       71 29 80 00     andi.   r9,r9,32768

kuap_get_and_assert_locked() is paired with kuap_kernel_restore()
and are only used in interrupt_exit_kernel_prepare(). The value
returned by kuap_get_and_assert_locked() is only used by
kuap_kernel_restore().

On 8xx, kuap_kernel_restore() doesn't use the value read by
kuap_get_and_assert_locked() so modify kuap_get_and_assert_locked()
to not perform the read of MD_AP and return 0 instead.

The same applies on BOOKE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 8 ++------
 arch/powerpc/include/asm/nohash/kup-booke.h  | 6 ++----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index c44d97751723..8579210f2a6a 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -41,14 +41,10 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 
 static inline unsigned long __kuap_get_and_assert_locked(void)
 {
-	unsigned long kuap;
-
-	kuap = mfspr(SPRN_MD_AP);
-
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		WARN_ON_ONCE(kuap >> 16 != MD_APG_KUAP >> 16);
+		WARN_ON_ONCE(mfspr(SPRN_MD_AP) >> 16 != MD_APG_KUAP >> 16);
 
-	return kuap;
+	return 0;
 }
 
 static inline void __allow_user_access(void __user *to, const void __user *from,
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 49bb41ed0816..823c5a3a96d8 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -58,12 +58,10 @@ static inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned long kua
 
 static inline unsigned long __kuap_get_and_assert_locked(void)
 {
-	unsigned long kuap = mfspr(SPRN_PID);
-
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
-		WARN_ON_ONCE(kuap);
+		WARN_ON_ONCE(mfspr(SPRN_PID));
 
-	return kuap;
+	return 0;
 }
 
 static inline void __allow_user_access(void __user *to, const void __user *from,
-- 
2.41.0

