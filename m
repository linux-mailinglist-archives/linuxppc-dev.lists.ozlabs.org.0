Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33B5A000
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 17:53:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1X63sBlzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 01:53:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eLbff2yA"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1PV3rBMzDqtQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 01:47:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45b1PL2y79zB09ZQ;
 Fri, 28 Jun 2019 17:47:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eLbff2yA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iiL7FYjKr6zA; Fri, 28 Jun 2019 17:47:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45b1PL1qN4zB09ZN;
 Fri, 28 Jun 2019 17:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561736870; bh=WmP4bKhnfBYlSSGQ//frf/dAVmCAzNuL14conWVzh18=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=eLbff2yAwf4Sx2EDT4g7EvkoEDZQWJWVYdRgj+nDDJuZg0Zd8MCOiBSOuJjjo2GZG
 lrHs2lCejz93KhHbBg4OBzjrvL93ErU3tVimaMWEMZFpnREahoPvegUT/mBgphJfBB
 scdGGZMJpky1lJ75/DgcJrI8TZG1q2sShnz8LdS0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 715CE8B955;
 Fri, 28 Jun 2019 17:47:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HkwAnLYF9rVD; Fri, 28 Jun 2019 17:47:51 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3FE98B976;
 Fri, 28 Jun 2019 17:47:50 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id A6EE668DBC; Fri, 28 Jun 2019 15:47:50 +0000 (UTC)
Message-Id: <4b371c54e2c15cab57585ad538d9fcb33bcf2725.1561735587.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561735587.git.christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 01/12] powerpc: move ptrace into a subdirectory.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Fri, 28 Jun 2019 15:47:50 +0000 (UTC)
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

In order to allow splitting of ptrace depending on the
different CONFIG_ options, create a subdirectory dedicated to
ptrace and move ptrace.c and ptrace32.c into it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/Makefile                | 7 +++----
 arch/powerpc/kernel/ptrace/Makefile         | 9 +++++++++
 arch/powerpc/kernel/{ => ptrace}/ptrace.c   | 0
 arch/powerpc/kernel/{ => ptrace}/ptrace32.c | 0
 4 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/Makefile
 rename arch/powerpc/kernel/{ => ptrace}/ptrace.c (100%)
 rename arch/powerpc/kernel/{ => ptrace}/ptrace32.c (100%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0ea6c4aa3a20..c522464fa56a 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -3,8 +3,6 @@
 # Makefile for the linux kernel.
 #
 
-CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
-
 # Disable clang warning for using setjmp without setjmp.h header
 CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header)
 
@@ -43,15 +41,16 @@ CFLAGS_prom_init.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
 endif
 
-obj-y				:= cputable.o ptrace.o syscalls.o \
+obj-y				:= cputable.o syscalls.o \
 				   irq.o align.o signal_32.o pmc.o vdso.o \
 				   process.o systbl.o idle.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
 				   of_platform.o prom_parse.o
+obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
-				   signal_64.o ptrace32.o \
+				   signal_64.o \
 				   paca.o nvram_64.o firmware.o
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
new file mode 100644
index 000000000000..02fb28eb3b55
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the linux kernel.
+#
+
+CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
+
+obj-y				+= ptrace.o
+obj-$(CONFIG_PPC64)		+= ptrace32.o
diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
similarity index 100%
rename from arch/powerpc/kernel/ptrace.c
rename to arch/powerpc/kernel/ptrace/ptrace.c
diff --git a/arch/powerpc/kernel/ptrace32.c b/arch/powerpc/kernel/ptrace/ptrace32.c
similarity index 100%
rename from arch/powerpc/kernel/ptrace32.c
rename to arch/powerpc/kernel/ptrace/ptrace32.c
-- 
2.13.3

