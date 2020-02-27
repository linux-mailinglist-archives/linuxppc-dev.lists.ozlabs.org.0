Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7201171683
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 12:58:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Srm06xJNzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 22:58:24 +1100 (AEDT)
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
 header.s=mail header.b=DGrLpEbL; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrYB0zQ2zDqgw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:49:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SrY554bSz9tyj2;
 Thu, 27 Feb 2020 12:48:57 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DGrLpEbL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jDr5m7gCjeiu; Thu, 27 Feb 2020 12:48:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SrY53zZdz9tyhM;
 Thu, 27 Feb 2020 12:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582804137; bh=ZoTxt/rU2ic1yhcjEwy71g5KNmfHylnPrX34Fztg4go=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=DGrLpEbLahVUNc4L5dWsfHWrTDsHmnARf+Xrg7yplqE5jOwDdaqJJXWxUT4SInX2o
 C01O0DAhVH3gpd0n501Uc9rNd0NK90x+/JYhd1uIUGsJgEhWjAYGCtZwmVKXj5IRoj
 eTnk9m5ja8nwp1u0rX88kc0AxOp2584JkuOyRyOg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFDFF8B872;
 Thu, 27 Feb 2020 12:48:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id M-sairtOsKgw; Thu, 27 Feb 2020 12:48:58 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CEE38B799;
 Thu, 27 Feb 2020 12:48:58 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 50DFD65402; Thu, 27 Feb 2020 11:48:58 +0000 (UTC)
Message-Id: <6276df0be87a4329c2bb46b3b0f02059ae9e70e6.1582803998.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582803998.git.christophe.leroy@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 02/13] powerpc/ptrace: remove unused header includes
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Thu, 27 Feb 2020 11:48:58 +0000 (UTC)
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

Remove unused header includes in ptrace.c and ptrace32.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/ptrace.c   | 19 ++-----------------
 arch/powerpc/kernel/ptrace/ptrace32.c | 11 -----------
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 25c0424e8868..7ed54dbb2d7e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -15,35 +15,20 @@
  * this archive for more details.
  */
 
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/smp.h>
-#include <linux/errno.h>
-#include <linux/ptrace.h>
 #include <linux/regset.h>
 #include <linux/tracehook.h>
 #include <linux/elf.h>
-#include <linux/user.h>
-#include <linux/security.h>
-#include <linux/signal.h>
-#include <linux/seccomp.h>
 #include <linux/audit.h>
-#include <trace/syscall.h>
 #include <linux/hw_breakpoint.h>
-#include <linux/perf_event.h>
 #include <linux/context_tracking.h>
 #include <linux/nospec.h>
-
-#include <linux/uaccess.h>
+#include <linux/syscalls.h>
 #include <linux/pkeys.h>
-#include <asm/page.h>
-#include <asm/pgtable.h>
+
 #include <asm/switch_to.h>
 #include <asm/tm.h>
 #include <asm/asm-prototypes.h>
 #include <asm/debug.h>
-#include <asm/hw_breakpoint.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
diff --git a/arch/powerpc/kernel/ptrace/ptrace32.c b/arch/powerpc/kernel/ptrace/ptrace32.c
index f37eb53de1a1..7976ddf29c0e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace32.c
+++ b/arch/powerpc/kernel/ptrace/ptrace32.c
@@ -17,21 +17,10 @@
  * this archive for more details.
  */
 
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/smp.h>
-#include <linux/errno.h>
 #include <linux/ptrace.h>
 #include <linux/regset.h>
-#include <linux/user.h>
-#include <linux/security.h>
-#include <linux/signal.h>
 #include <linux/compat.h>
 
-#include <linux/uaccess.h>
-#include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/switch_to.h>
 
 /*
-- 
2.25.0

