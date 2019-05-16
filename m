Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2220CEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 18:27:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454cJw6SK7zDqhl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 02:27:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 454cG12qKyzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 02:24:57 +1000 (AEST)
Received: from [167.98.27.226] (helo=deadeye)
 by shadbolt.decadent.org.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1hRImD-0006yn-6T; Thu, 16 May 2019 16:58:37 +0100
Received: from ben by deadeye with local (Exim 4.92)
 (envelope-from <ben@decadent.org.uk>)
 id 1hRImC-0001My-Ht; Thu, 16 May 2019 16:58:36 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 16 May 2019 16:55:32 +0100
Message-ID: <lsq.1558022132.722723753@decadent.org.uk>
X-Mailer: LinuxStableQueue (scripts by bwh)
X-Patchwork-Hint: ignore
Subject: [PATCH 3.16 08/86] jump_label: Allow asm/jump_label.h to be
 included in assembly
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
 Denis Kirjanov <kda@linux-powerpc.org>, will.deacon@arm.com, paulus@samba.org,
 Ingo Molnar <mingo@kernel.org>, linux@arm.linux.org.uk, mgorman@suse.de,
 catalin.marinas@arm.com, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 liuj97@gmail.com, heiko.carstens@de.ibm.com, rostedt@goodmis.org,
 jbaron@akamai.com, Anton Blanchard <anton@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, mmarek@suse.cz,
 Linus Torvalds <torvalds@linux-foundation.org>, ralf@linux-mips.org,
 schwidefsky@de.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

3.16.68-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Anton Blanchard <anton@samba.org>

commit 55dd0df781e58ec23d218376ea4a676e7362a98c upstream.

Wrap asm/jump_label.h for all archs with #ifndef __ASSEMBLY__.
Since these are kernel only headers, we don't need #ifdef
__KERNEL__ so can simplify things a bit.

If an architecture wants to use jump labels in assembly, it
will still need to define a macro to create the __jump_table
entries (see ARCH_STATIC_BRANCH in the powerpc asm/jump_label.h
for an example).

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
Link: http://lkml.kernel.org/r/1428551492-21977-1-git-send-email-anton@samba.org
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/arm/include/asm/jump_label.h   | 5 ++---
 arch/arm64/include/asm/jump_label.h | 8 ++++----
 arch/mips/include/asm/jump_label.h  | 7 +++----
 arch/s390/include/asm/jump_label.h  | 3 +++
 arch/sparc/include/asm/jump_label.h | 5 ++---
 arch/x86/include/asm/jump_label.h   | 5 ++---
 6 files changed, 16 insertions(+), 17 deletions(-)

--- a/arch/arm/include/asm/jump_label.h
+++ b/arch/arm/include/asm/jump_label.h
@@ -1,7 +1,7 @@
 #ifndef _ASM_ARM_JUMP_LABEL_H
 #define _ASM_ARM_JUMP_LABEL_H
 
-#ifdef __KERNEL__
+#ifndef __ASSEMBLY__
 
 #include <linux/types.h>
 
@@ -27,8 +27,6 @@ l_yes:
 	return true;
 }
 
-#endif /* __KERNEL__ */
-
 typedef u32 jump_label_t;
 
 struct jump_entry {
@@ -37,4 +35,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
+#endif  /* __ASSEMBLY__ */
 #endif
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -18,11 +18,12 @@
  */
 #ifndef __ASM_JUMP_LABEL_H
 #define __ASM_JUMP_LABEL_H
+
+#ifndef __ASSEMBLY__
+
 #include <linux/types.h>
 #include <asm/insn.h>
 
-#ifdef __KERNEL__
-
 #define JUMP_LABEL_NOP_SIZE		AARCH64_INSN_SIZE
 
 static __always_inline bool arch_static_branch(struct static_key *key)
@@ -39,8 +40,6 @@ l_yes:
 	return true;
 }
 
-#endif /* __KERNEL__ */
-
 typedef u64 jump_label_t;
 
 struct jump_entry {
@@ -49,4 +48,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
+#endif  /* __ASSEMBLY__ */
 #endif	/* __ASM_JUMP_LABEL_H */
--- a/arch/mips/include/asm/jump_label.h
+++ b/arch/mips/include/asm/jump_label.h
@@ -8,9 +8,9 @@
 #ifndef _ASM_MIPS_JUMP_LABEL_H
 #define _ASM_MIPS_JUMP_LABEL_H
 
-#include <linux/types.h>
+#ifndef __ASSEMBLY__
 
-#ifdef __KERNEL__
+#include <linux/types.h>
 
 #define JUMP_LABEL_NOP_SIZE 4
 
@@ -39,8 +39,6 @@ l_yes:
 	return true;
 }
 
-#endif /* __KERNEL__ */
-
 #ifdef CONFIG_64BIT
 typedef u64 jump_label_t;
 #else
@@ -53,4 +51,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
+#endif  /* __ASSEMBLY__ */
 #endif /* _ASM_MIPS_JUMP_LABEL_H */
--- a/arch/s390/include/asm/jump_label.h
+++ b/arch/s390/include/asm/jump_label.h
@@ -1,6 +1,8 @@
 #ifndef _ASM_S390_JUMP_LABEL_H
 #define _ASM_S390_JUMP_LABEL_H
 
+#ifndef __ASSEMBLY__
+
 #include <linux/types.h>
 
 #define JUMP_LABEL_NOP_SIZE 6
@@ -39,4 +41,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
+#endif  /* __ASSEMBLY__ */
 #endif
--- a/arch/sparc/include/asm/jump_label.h
+++ b/arch/sparc/include/asm/jump_label.h
@@ -1,7 +1,7 @@
 #ifndef _ASM_SPARC_JUMP_LABEL_H
 #define _ASM_SPARC_JUMP_LABEL_H
 
-#ifdef __KERNEL__
+#ifndef __ASSEMBLY__
 
 #include <linux/types.h>
 
@@ -22,8 +22,6 @@ l_yes:
 	return true;
 }
 
-#endif /* __KERNEL__ */
-
 typedef u32 jump_label_t;
 
 struct jump_entry {
@@ -32,4 +30,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
+#endif  /* __ASSEMBLY__ */
 #endif
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -1,7 +1,7 @@
 #ifndef _ASM_X86_JUMP_LABEL_H
 #define _ASM_X86_JUMP_LABEL_H
 
-#ifdef __KERNEL__
+#ifndef __ASSEMBLY__
 
 #include <linux/stringify.h>
 #include <linux/types.h>
@@ -30,8 +30,6 @@ l_yes:
 	return true;
 }
 
-#endif /* __KERNEL__ */
-
 #ifdef CONFIG_X86_64
 typedef u64 jump_label_t;
 #else
@@ -44,4 +42,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
+#endif  /* __ASSEMBLY__ */
 #endif

