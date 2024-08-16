Return-Path: <linuxppc-dev+bounces-133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E0954C85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 16:38:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wll2x5HtDz2ymc;
	Sat, 17 Aug 2024 00:38:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wll2x1bYVz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 00:38:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wll1p2rL0z9sSZ;
	Fri, 16 Aug 2024 16:37:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FGio_3SM76h; Fri, 16 Aug 2024 16:37:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wll1m655vz9rvV;
	Fri, 16 Aug 2024 16:37:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD9988B764;
	Fri, 16 Aug 2024 16:37:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aeg8OhdT1BTv; Fri, 16 Aug 2024 16:37:00 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.147])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 080968B776;
	Fri, 16 Aug 2024 16:36:59 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 7/9] powerpc: Add little endian variants of LHZX_BE and friends
Date: Fri, 16 Aug 2024 16:36:54 +0200
Message-ID: <a3d5db51c2e0f115e271b507c89e5af96bfeb015.1723817900.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1723817900.git.christophe.leroy@csgroup.eu>
References: <cover.1723817900.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723819011; l=2150; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ZRZ74nUfhlj//3k0SFeHq4s60ExiEQUmJYVI6+7VWwQ=; b=kOKzSdAaDCocEGjcwOOPnE+zyg2ugOITM5x4/kDd+DSi3Cnis0XztcJ0bnyXg3azflp+Ah2lp f1aaVakKCwqCagp9h8RMNaoyAhus0oxNEiHBcWf0t94NrqIHTc9X41i
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

To support getrandom in VDSO which is based on little endian storage,
add macros equivalent to LHZX_BE for little endian accesses.

And move it outside of __powerpc64__ #ifdef so that it can also be
used for PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-compat.h | 40 +++++++++++++++++----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
index 2bc53c646ccd..ef8e79ae669a 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -25,20 +25,6 @@
 #define PPC_LR_STKOFF	16
 #define PPC_MIN_STKFRM	112
 
-#ifdef __BIG_ENDIAN__
-#define LHZX_BE	stringify_in_c(lhzx)
-#define LWZX_BE	stringify_in_c(lwzx)
-#define LDX_BE	stringify_in_c(ldx)
-#define STWX_BE	stringify_in_c(stwx)
-#define STDX_BE	stringify_in_c(stdx)
-#else
-#define LHZX_BE	stringify_in_c(lhbrx)
-#define LWZX_BE	stringify_in_c(lwbrx)
-#define LDX_BE	stringify_in_c(ldbrx)
-#define STWX_BE	stringify_in_c(stwbrx)
-#define STDX_BE	stringify_in_c(stdbrx)
-#endif
-
 #else /* 32-bit */
 
 /* operations for longs and pointers */
@@ -61,4 +47,30 @@
 
 #endif
 
+#ifdef __BIG_ENDIAN__
+#define LHZX_BE	stringify_in_c(lhzx)
+#define LWZX_BE	stringify_in_c(lwzx)
+#define LDX_BE	stringify_in_c(ldx)
+#define STWX_BE	stringify_in_c(stwx)
+#define STDX_BE	stringify_in_c(stdx)
+
+#define LHZX_LE	stringify_in_c(lhbrx)
+#define LWZX_LE	stringify_in_c(lwbrx)
+#define LDX_LE	stringify_in_c(ldbrx)
+#define STWX_LE	stringify_in_c(stwbrx)
+#define STDX_LE	stringify_in_c(stdbrx)
+#else
+#define LHZX_BE	stringify_in_c(lhbrx)
+#define LWZX_BE	stringify_in_c(lwbrx)
+#define LDX_BE	stringify_in_c(ldbrx)
+#define STWX_BE	stringify_in_c(stwbrx)
+#define STDX_BE	stringify_in_c(stdbrx)
+
+#define LHZX_LE	stringify_in_c(lhzx)
+#define LWZX_LE	stringify_in_c(lwzx)
+#define LDX_LE	stringify_in_c(ldx)
+#define STWX_LE	stringify_in_c(stwx)
+#define STDX_LE	stringify_in_c(stdx)
+#endif
+
 #endif /* _ASM_POWERPC_ASM_COMPAT_H */
-- 
2.44.0


