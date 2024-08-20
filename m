Return-Path: <linuxppc-dev+bounces-225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACE9586DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 14:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp7xx0rF9z2y8h;
	Tue, 20 Aug 2024 22:27:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp7xw5jJqz2xXL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 22:27:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wp7xr4pfXz9sSK;
	Tue, 20 Aug 2024 14:26:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQek20mursXK; Tue, 20 Aug 2024 14:26:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wp7xr46dnz9sSH;
	Tue, 20 Aug 2024 14:26:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CD268B778;
	Tue, 20 Aug 2024 14:26:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QOfkP72dwvAA; Tue, 20 Aug 2024 14:26:56 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 27C318B763;
	Tue, 20 Aug 2024 14:26:56 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/32: Implement validation of emergency stack
Date: Tue, 20 Aug 2024 14:26:54 +0200
Message-ID: <2439d50b019f758db4a6d7b238b06441ab109799.1724156805.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724156815; l=2297; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=BWZw2MPfPwSDfcLX6WTR02N0kEVf4r9w0eZ+/NHSGxM=; b=FZyqSmh/WhnVZ0QjtIFt+cwme4B+jNwJ0m6bFWOOphpagOF9t+7ai27sjaM1J2H6YMnxp8M7B 9ifMAdk8MY+AD4zPZueXpjMbMX5GDbWuswA79/foODBEzvRBTAEEE+W
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

VMAP stack added an emergency stack on powerpc/32 for when there is
a stack overflow, but failed to add stack validation for that
emergency stack. That validation is required for show stack.

Implement it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Declare emergency_ctx[] at all time, not only when CONFIG_VMAP_STACK is set
---
 arch/powerpc/include/asm/thread_info.h |  4 ++++
 arch/powerpc/kernel/process.c          | 20 ++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 15c5691dd218..6ebca2996f18 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -226,6 +226,10 @@ static inline int arch_within_stack_frames(const void * const stack,
 	return BAD_STACK;
 }
 
+#ifdef CONFIG_PPC32
+extern void *emergency_ctx[];
+#endif
+
 #endif	/* !__ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 3b506d4c55f3..b27e2f69930c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2177,10 +2177,10 @@ static inline int valid_irq_stack(unsigned long sp, struct task_struct *p,
 	return 0;
 }
 
+#ifdef CONFIG_PPC64
 static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
 					unsigned long nbytes)
 {
-#ifdef CONFIG_PPC64
 	unsigned long stack_page;
 	unsigned long cpu = task_cpu(p);
 
@@ -2208,10 +2208,26 @@ static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
 # endif
-#endif
 
 	return 0;
 }
+#else
+static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
+					unsigned long nbytes)
+{
+	unsigned long stack_page;
+	unsigned long cpu = task_cpu(p);
+
+	if (!IS_ENABLED(CONFIG_VMAP_STACK))
+		return 0;
+
+	stack_page = (unsigned long)emergency_ctx[cpu] - THREAD_SIZE;
+	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
+		return 1;
+
+	return 0;
+}
+#endif
 
 /*
  * validate the stack frame of a particular minimum size, used for when we are
-- 
2.44.0


