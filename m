Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F651E4D1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ2S6kg0z3f3w
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwHzs4252z3cDM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:47:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzL0v0Rz9sVV;
 Sat,  7 May 2022 08:46:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bgk36uhs50r9; Sat,  7 May 2022 08:46:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzD5XtCz9sW1;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6A908B763;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oKzJqNiptHk8; Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 009618B794;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476keLe1320522
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:40 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476ke1S1320521;
 Sat, 7 May 2022 08:46:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 13/25] powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instead
 of CONFIG_DYNAMIC_FTRACE
Date: Sat,  7 May 2022 08:46:15 +0200
Message-Id: <628d357503eb90b4a034f99b7df516caaff4d279.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905981; l=2342; s=20211009;
 h=from:subject:message-id; bh=bji15qs2JPAG4suNrV+7J234iPVSFPzCbSxwzfrHc3k=;
 b=wwXFZK6JU/PU5HdoeS+/J0tlHxOnGflJSjYRwm5Xf9ftonfTUVpJjajiu8bIGigt4fk8DE76Hky2
 EyjLKbDGA90iTTh+t/GGhVWk+6mDVeJ4CkFUbmBmFRf0EhVpN06T
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 0c0c52306f47 ("powerpc: Only support DYNAMIC_FTRACE not
static"), CONFIG_DYNAMIC_FTRACE is always selected when
CONFIG_FUNCTION_TRACER is selected.

To avoid confusion and have the reader wonder what's happen when
CONFIG_FUNCTION_TRACER is selected and CONFIG_DYNAMIC_FTRACE is not,
use CONFIG_FUNCTION_TRACER in ifdefs instead of CONFIG_DYNAMIC_FTRACE.

As CONFIG_FUNCTION_GRAPH_TRACER depends on CONFIG_FUNCTION_TRACER,
ftrace.o doesn't need to appear for both symbols in Makefile.

Then as ftrace.o is built only when CONFIG_FUNCTION_TRACER is selected
ifdef CONFIG_FUNCTION_TRACER is not needed in ftrace.c, and since it
implies CONFIG_DYNAMIC_FTRACE, CONFIG_DYNAMIC_FTRACE is not needed
in ftrace.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Limit the change to the content of arch/powerpc/kernel/trace as suggested by Naveen.
---
 arch/powerpc/kernel/trace/Makefile | 4 +---
 arch/powerpc/kernel/trace/ftrace.c | 4 ----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace/Makefile
index fc32ec30b297..af8527538fe4 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -14,9 +14,7 @@ obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace_mprofile.o
 else
 obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace_64_pg.o
 endif
-obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace_low.o
-obj-$(CONFIG_DYNAMIC_FTRACE)		+= ftrace.o
-obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
+obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace_low.o ftrace.o
 obj-$(CONFIG_TRACING)			+= trace_clock.o
 
 obj-$(CONFIG_PPC64)			+= $(obj64-y)
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 531da4d93c58..f89bcaa5f0fc 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -28,9 +28,6 @@
 #include <asm/syscall.h>
 #include <asm/inst.h>
 
-
-#ifdef CONFIG_DYNAMIC_FTRACE
-
 /*
  * We generally only have a single long_branch tramp and at most 2 or 3 plt
  * tramps generated. But, we don't use the plt tramps currently. We also allot
@@ -783,7 +780,6 @@ int __init ftrace_dyn_arch_init(void)
 	return 0;
 }
 #endif
-#endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 
-- 
2.35.1

