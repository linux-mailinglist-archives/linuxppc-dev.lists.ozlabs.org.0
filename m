Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E54D7FD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 11:28:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHCSL30vRz3bhH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 21:28:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHCRV5Mjcz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 21:28:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHCRK61gZz9sRn;
 Mon, 14 Mar 2022 11:27:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoXnbGICbYvd; Mon, 14 Mar 2022 11:27:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHCRJ4w30z9sRv;
 Mon, 14 Mar 2022 11:27:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92E918B76E;
 Mon, 14 Mar 2022 11:27:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 08cDasFjybrG; Mon, 14 Mar 2022 11:27:56 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F17C8B76C;
 Mon, 14 Mar 2022 11:27:56 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22EARlau4139729
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 11:27:47 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22EARkGF4139723;
 Mon, 14 Mar 2022 11:27:46 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v1 2/2] static_call: Remove __DEFINE_STATIC_CALL macro
Date: Mon, 14 Mar 2022 11:27:36 +0100
Message-Id: <329074f92d96e3220ebe15da7bbe2779beee31eb.1647253456.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <1e0a61a88f52a460f62a58ffc2a5f847d1f7d9d8.1647253456.git.christophe.leroy@csgroup.eu>
References: <1e0a61a88f52a460f62a58ffc2a5f847d1f7d9d8.1647253456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647253655; l=2642; s=20211009;
 h=from:subject:message-id; bh=54TTsQ4t1JOmGYJlgGxKSjtdyf3fR5FYcb6fhFV8Vwk=;
 b=b3TZEaNwVxdPSvoAngCH+wbAAfSlwKl0Fu4CX9Mq5jNSznvYeHtWb3Kq9TL7K87DOkk/v55AQoYc
 lDZuL07CCmYBdMpTjJrxO5IoCFlZYUKFeOVT8Ale/l5ZrNnZTFrI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Only DEFINE_STATIC_CALL use __DEFINE_STATIC_CALL macro now when
CONFIG_HAVE_STATIC_CALL is selected.

Only keep __DEFINE_STATIC_CALL() for the generic fallback, and
also use it to implement DEFINE_STATIC_CALL_NULL() in that case.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/static_call.h | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 3c50b0fdda16..df53bed9d71f 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -180,13 +180,13 @@ extern int static_call_text_reserved(void *start, void *end);
 
 extern long __static_call_return0(void);
 
-#define __DEFINE_STATIC_CALL(name, _func, _func_init)			\
+#define DEFINE_STATIC_CALL(name, _func)					\
 	DECLARE_STATIC_CALL(name, _func);				\
 	struct static_call_key STATIC_CALL_KEY(name) = {		\
-		.func = _func_init,					\
+		.func = _func,						\
 		.type = 1,						\
 	};								\
-	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func_init)
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
 
 #define DEFINE_STATIC_CALL_NULL(name, _func)				\
 	DECLARE_STATIC_CALL(name, _func);				\
@@ -225,12 +225,12 @@ extern long __static_call_return0(void);
 
 static inline int static_call_init(void) { return 0; }
 
-#define __DEFINE_STATIC_CALL(name, _func, _func_init)			\
+#define DEFINE_STATIC_CALL(name, _func)					\
 	DECLARE_STATIC_CALL(name, _func);				\
 	struct static_call_key STATIC_CALL_KEY(name) = {		\
-		.func = _func_init,					\
+		.func = _func,						\
 	};								\
-	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func_init)
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
 
 #define DEFINE_STATIC_CALL_NULL(name, _func)				\
 	DECLARE_STATIC_CALL(name, _func);				\
@@ -292,11 +292,11 @@ static inline long __static_call_return0(void)
 		.func = _func_init,					\
 	}
 
+#define DEFINE_STATIC_CALL(name, _func)					\
+	__DEFINE_STATIC_CALL(name, _func, _func)
+
 #define DEFINE_STATIC_CALL_NULL(name, _func)				\
-	DECLARE_STATIC_CALL(name, _func);				\
-	struct static_call_key STATIC_CALL_KEY(name) = {		\
-		.func = NULL,						\
-	}
+	__DEFINE_STATIC_CALL(name, _func, NULL)
 
 #define DEFINE_STATIC_CALL_RET0(name, _func)				\
 	__DEFINE_STATIC_CALL(name, _func, __static_call_return0)
@@ -341,7 +341,4 @@ static inline int static_call_text_reserved(void *start, void *end)
 
 #endif /* CONFIG_HAVE_STATIC_CALL */
 
-#define DEFINE_STATIC_CALL(name, _func)					\
-	__DEFINE_STATIC_CALL(name, _func, _func)
-
 #endif /* _LINUX_STATIC_CALL_H */
-- 
2.35.1

