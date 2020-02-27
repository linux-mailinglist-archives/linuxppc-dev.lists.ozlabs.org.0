Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 494AF171745
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:34:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SsY33Sr5zDr2w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:33:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=F+89lzO2; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrYQ3Mx3zDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:49:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SrYK59z8z9tyj6;
 Thu, 27 Feb 2020 12:49:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=F+89lzO2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uBLJNqdVR22r; Thu, 27 Feb 2020 12:49:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SrYK44ryz9tyhM;
 Thu, 27 Feb 2020 12:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582804149; bh=VgMuq2wX8mbn+y/Awc3vwO6firKTtF6E52gAdT5jeTc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=F+89lzO24xUsyILNd7yDpwEkvmm4pOa/Jz47Ilpgb0lU7l1NnTxDkzao/+kVMG+d4
 gjoocxGwmB7rUKK+B4i7MA8vh9uogA7ui4v25RH5tFzb4dw7KsFhtH3lZPh1UuRPOk
 MiTqzXp+hsekYmC3S9URxycReias/mt8+GH9APJs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBF928B872;
 Thu, 27 Feb 2020 12:49:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZYPtMti6oLRY; Thu, 27 Feb 2020 12:49:10 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FE6F8B799;
 Thu, 27 Feb 2020 12:49:10 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 57DCC65402; Thu, 27 Feb 2020 11:49:10 +0000 (UTC)
Message-Id: <d45c91cf5f83424b8f3989b7ead28c50d8d765a9.1582803998.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582803998.git.christophe.leroy@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 13/13] powerpc/ptrace: move ptrace_triggered() into
 hw_breakpoint.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Thu, 27 Feb 2020 11:49:10 +0000 (UTC)
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

ptrace_triggered() is declared in asm/hw_breakpoint.h and
only needed when CONFIG_HW_BREAKPOINT is set, so move it
into hw_breakpoint.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v4: removing inclusing of hw_breakpoint.h now. Previously it was done too early.
---
 arch/powerpc/kernel/hw_breakpoint.c | 16 ++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c | 19 -------------------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 2462cd7c565c..2c0be9d941cf 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -427,3 +427,19 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
 {
 	/* TODO */
 }
+
+void ptrace_triggered(struct perf_event *bp,
+		      struct perf_sample_data *data, struct pt_regs *regs)
+{
+	struct perf_event_attr attr;
+
+	/*
+	 * Disable the breakpoint request here since ptrace has defined a
+	 * one-shot behaviour for breakpoint exceptions in PPC64.
+	 * The SIGTRAP signal is generated automatically for us in do_dabr().
+	 * We don't have to do anything about that here
+	 */
+	attr = bp->attr;
+	attr.disabled = true;
+	modify_user_hw_breakpoint(bp, &attr);
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index a44f6e5e05ff..f6e51be47c6e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -18,7 +18,6 @@
 #include <linux/regset.h>
 #include <linux/tracehook.h>
 #include <linux/audit.h>
-#include <linux/hw_breakpoint.h>
 #include <linux/context_tracking.h>
 #include <linux/syscalls.h>
 
@@ -31,24 +30,6 @@
 
 #include "ptrace-decl.h"
 
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-void ptrace_triggered(struct perf_event *bp,
-		      struct perf_sample_data *data, struct pt_regs *regs)
-{
-	struct perf_event_attr attr;
-
-	/*
-	 * Disable the breakpoint request here since ptrace has defined a
-	 * one-shot behaviour for breakpoint exceptions in PPC64.
-	 * The SIGTRAP signal is generated automatically for us in do_dabr().
-	 * We don't have to do anything about that here
-	 */
-	attr = bp->attr;
-	attr.disabled = true;
-	modify_user_hw_breakpoint(bp, &attr);
-}
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-
 /*
  * Called by kernel/ptrace.c when detaching..
  *
-- 
2.25.0

