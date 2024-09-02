Return-Path: <linuxppc-dev+bounces-868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C381C9686FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 14:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy6rV2Q2Mz2y8R;
	Mon,  2 Sep 2024 22:04:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725278698;
	cv=none; b=H4Oamc5ECAn4O+04VrVsQE8M9LheQoUDQKbWzmn4G7M3yQVuBxtK1Nn7VD4Ve0mscy+84WJQ9cc9SfGvawWhQ+if/TnpHNWq5h4KH4688Zye0pBms99SryPWfoZKFRayu2W6J8lyZGZ9E3W1zLXkRpZV2GVEkb1zSEX2cWE8B6RRfWDnP8zhTpr794qZA+jPchb64jd/NGLPk7zmL8lSf8Tu/1L2wdEjMcEwJVlb4c1JVSRatdUZcw6KAHA9hBiYIMDk0QA8FNtywzjWOnFi5QEcDucvji9QcuOWAX334i+SOSWsxoocUizuAfIFc1Ve6ar8xu+jaYJPEsYFR0x0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725278698; c=relaxed/relaxed;
	bh=MwCQPr+DkzFiDHzjMK222UDVKoya0EMyZrgWc4ytvxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpFhm6iB/qJ0mIEW/hvzpCCLbtNbvlihJkYY1EfcU96G0z9W6p7RXn/YDfdEZ16BJmc6HDMpVzBiQ2s5zbyiVQmjuOdk3ReWY7XGv49g6VSo1TwPeLqhR0izHPMsgrGKKUXunzZEbi7pXxlPViu+z7htkZpNAnNG2ySp/3ZCpbd5bRYtT5kJu8cD8qKgNUBd6zziTOJkufxHKBO6hpvPDu80NspupsbJpBFj2oeH3tdwFzkcRTjZn8u3u+ioIUOch4hdkkaCNwp3zTjcTFkLCG5qnwyxhUsRYimf2nMmAoL5qvKnACTVEYbAMTe8z2jpjn0stKFqMLk6ycco6hKvEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy6rV05ytz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 22:04:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wy6rH5V0Vz9sSV;
	Mon,  2 Sep 2024 14:04:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJhtm8-Ff2cI; Mon,  2 Sep 2024 14:04:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wy6rH4B4sz9sS7;
	Mon,  2 Sep 2024 14:04:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7580B8B76D;
	Mon,  2 Sep 2024 14:04:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qez3Etxhe6dG; Mon,  2 Sep 2024 14:04:47 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D5DC8B763;
	Mon,  2 Sep 2024 14:04:46 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v4 2/5] powerpc/vdso32: Add crtsavres
Date: Mon,  2 Sep 2024 14:04:39 +0200
Message-ID: <68f022cd01d7fd215009256aed3d5f27ee925981.1725278148.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1725278148.git.christophe.leroy@csgroup.eu>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725278679; l=2796; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=utdv6V/SvZxVA50hOk7t/lkGWDvSE1q/kJYchx6i5SU=; b=s67OYlL5X7V2d40xn8vuyrgdm7ubwX4XDr1KdDfBPv85sGKEFLXISvI/Je/87m7MiEhlKbAnt u43Je4blYzoC6I3MfEBGUWZSCOQQ7mPA/fN0sx5faPAMgGQy9Vvob9k
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Commit 08c18b63d965 ("powerpc/vdso32: Add missing _restgpr_31_x to fix
build failure") added _restgpr_31_x to the vdso for gettimeofday, but
the work on getrandom shows that we will need more of those functions.

Remove _restgpr_31_x and link in crtsavres.o so that we get all
save/restore functions when optimising the kernel for size.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso/Makefile       |  5 ++++-
 arch/powerpc/kernel/vdso/gettimeofday.S | 13 -------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 1425b6edc66b..c07a425b8f78 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -43,6 +43,7 @@ else
 endif
 
 targets := $(obj-vdso32) vdso32.so.dbg vgettimeofday-32.o
+targets += crtsavres-32.o
 obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
 targets += $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
@@ -68,7 +69,7 @@ targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o FORCE
+$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/crtsavres-32.o FORCE
 	$(call if_changed,vdso32ld_and_check)
 $(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o FORCE
 	$(call if_changed,vdso64ld_and_check)
@@ -76,6 +77,8 @@ $(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o
 # assembly rules for the .S files
 $(obj-vdso32): %-32.o: %.S FORCE
 	$(call if_changed_dep,vdso32as)
+$(obj)/crtsavres-32.o: %-32.o: $(srctree)/arch/powerpc/lib/crtsavres.S FORCE
+	$(call if_changed_dep,vdso32as)
 $(obj)/vgettimeofday-32.o: %-32.o: %.c FORCE
 	$(call if_changed_dep,vdso32cc)
 $(obj-vdso64): %-64.o: %.S FORCE
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 48fc6658053a..67254ac9c8bb 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -118,16 +118,3 @@ V_FUNCTION_END(__kernel_clock_getres)
 V_FUNCTION_BEGIN(__kernel_time)
 	cvdso_call __c_kernel_time call_time=1
 V_FUNCTION_END(__kernel_time)
-
-/* Routines for restoring integer registers, called by the compiler.  */
-/* Called with r11 pointing to the stack header word of the caller of the */
-/* function, just beyond the end of the integer restore area.  */
-#ifndef __powerpc64__
-_GLOBAL(_restgpr_31_x)
-_GLOBAL(_rest32gpr_31_x)
-	lwz	r0,4(r11)
-	lwz	r31,-4(r11)
-	mtlr	r0
-	mr	r1,r11
-	blr
-#endif
-- 
2.44.0


