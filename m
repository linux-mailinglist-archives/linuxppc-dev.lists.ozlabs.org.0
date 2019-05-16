Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F820D03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 18:30:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454cN13MH7zDqkb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 02:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=decadent.org.uk
 (client-ip=88.96.1.126; helo=shadbolt.e.decadent.org.uk;
 envelope-from=ben@decadent.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=decadent.org.uk
Received: from shadbolt.e.decadent.org.uk (shadbolt.e.decadent.org.uk
 [88.96.1.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454cGF5RgjzDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 02:25:09 +1000 (AEST)
Received: from [167.98.27.226] (helo=deadeye)
 by shadbolt.decadent.org.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1hRImD-0006yp-5s; Thu, 16 May 2019 16:58:37 +0100
Received: from ben by deadeye with local (Exim 4.92)
 (envelope-from <ben@decadent.org.uk>)
 id 1hRImC-0001N3-J7; Thu, 16 May 2019 16:58:36 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 16 May 2019 16:55:32 +0100
Message-ID: <lsq.1558022132.38146636@decadent.org.uk>
X-Mailer: LinuxStableQueue (scripts by bwh)
X-Patchwork-Hint: ignore
Subject: [PATCH 3.16 09/86] jump_label: Allow jump labels to be used in
 assembly
In-Reply-To: <lsq.1558022132.52852998@decadent.org.uk>
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk);
 SAEximRunCond expanded to false
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Denis Kirjanov <kda@linux-powerpc.org>, heiko.carstens@de.ibm.com,
 paulus@samba.org, Ingo Molnar <mingo@kernel.org>, linux@arm.linux.org.uk,
 mgorman@suse.de, catalin.marinas@arm.com,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, liuj97@gmail.com,
 will.deacon@arm.com, rostedt@goodmis.org, jbaron@akamai.com,
 Anton Blanchard <anton@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 mmarek@suse.cz, Linus Torvalds <torvalds@linux-foundation.org>,
 ralf@linux-mips.org, schwidefsky@de.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

3.16.68-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Anton Blanchard <anton@samba.org>

commit c0ccf6f99e3a43b87980c9df7da48427885206d0 upstream.

To use jump labels in assembly we need the HAVE_JUMP_LABEL
define, so we select a fallback version if the toolchain does
not support them.

Modify linux/jump_label.h so it can be included by assembly
files. We also need to add -DCC_HAVE_ASM_GOTO to KBUILD_AFLAGS.

Signed-off-by: Anton Blanchard <anton@samba.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: benh@kernel.crashing.org
Cc: catalin.marinas@arm.com
Cc: davem@davemloft.net
Cc: heiko.carstens@de.ibm.com
Cc: jbaron@akamai.com
Cc: linux@arm.linux.org.uk
Cc: linuxppc-dev@lists.ozlabs.org
Cc: liuj97@gmail.com
Cc: mgorman@suse.de
Cc: mmarek@suse.cz
Cc: mpe@ellerman.id.au
Cc: paulus@samba.org
Cc: ralf@linux-mips.org
Cc: rostedt@goodmis.org
Cc: schwidefsky@de.ibm.com
Cc: will.deacon@arm.com
Link: http://lkml.kernel.org/r/1428551492-21977-2-git-send-email-anton@samba.org
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 Makefile                   |  1 +
 include/linux/jump_label.h | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -761,6 +761,7 @@ KBUILD_ARFLAGS := $(call ar-option,D)
 # check for 'asm goto'
 ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
+	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
 
 include $(srctree)/scripts/Makefile.extrawarn
--- a/include/linux/jump_label.h
+++ b/include/linux/jump_label.h
@@ -45,6 +45,12 @@
  * same as using STATIC_KEY_INIT_FALSE.
  */
 
+#if defined(CC_HAVE_ASM_GOTO) && defined(CONFIG_JUMP_LABEL)
+# define HAVE_JUMP_LABEL
+#endif
+
+#ifndef __ASSEMBLY__
+
 #include <linux/types.h>
 #include <linux/compiler.h>
 #include <linux/bug.h>
@@ -55,7 +61,7 @@ extern bool static_key_initialized;
 				    "%s used before call to jump_label_init", \
 				    __func__)
 
-#if defined(CC_HAVE_ASM_GOTO) && defined(CONFIG_JUMP_LABEL)
+#ifdef HAVE_JUMP_LABEL
 
 struct static_key {
 	atomic_t enabled;
@@ -66,13 +72,18 @@ struct static_key {
 #endif
 };
 
-# include <asm/jump_label.h>
-# define HAVE_JUMP_LABEL
 #else
 struct static_key {
 	atomic_t enabled;
 };
-#endif	/* CC_HAVE_ASM_GOTO && CONFIG_JUMP_LABEL */
+#endif	/* HAVE_JUMP_LABEL */
+#endif /* __ASSEMBLY__ */
+
+#ifdef HAVE_JUMP_LABEL
+#include <asm/jump_label.h>
+#endif
+
+#ifndef __ASSEMBLY__
 
 enum jump_label_type {
 	JUMP_LABEL_DISABLE = 0,
@@ -223,3 +234,5 @@ static inline void static_key_disable(st
 }
 
 #endif	/* _LINUX_JUMP_LABEL_H */
+
+#endif /* __ASSEMBLY__ */

