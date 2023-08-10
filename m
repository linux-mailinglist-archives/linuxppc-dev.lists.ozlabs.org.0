Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22A777A93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 16:24:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MhFCHi3J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM8Lh38gXz3cNT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 00:24:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MhFCHi3J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM8Kr2fhSz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 00:23:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9286565DB4;
	Thu, 10 Aug 2023 14:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87822C433C7;
	Thu, 10 Aug 2023 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691677406;
	bh=cs9hAoMZsISt2PoCjIqaqsE5Y0qpeoj7NexdJjqc7FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MhFCHi3JfnnOM/wH/IUOXANZeACqMVIJZ1ytPw9oqirmgzUbc4ifzc3UZCYagrzFa
	 ab1BvcU8okF47/4vwMqvZE5SZcJsgFQR1j3MeDVm2xwJkG9X3SnjwhfSt3QZ8F5Tmz
	 WbTe91EB1rcFkUsKbPcVuSqsvK1JV67KuASRjv0aOxBQc/TX+0g5x8CYtAo/w9ZN0T
	 xAA6+TqvJPn7tmPP1BasNe0rDYp2JDl17cAbUzvfKuyAk7KJBvEI1h9mu8/Kr1hehw
	 4aa2owUC1brNn4/3U/VkfmM8Bkm2fdDLdQUnKxG3D1cch/NrLlHAsCUdn7G2Ox4pZ6
	 z8Zf/Z+WsCXJA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 14/17] kprobes: unify kprobes_exceptions_nofify() prototypes
Date: Thu, 10 Aug 2023 16:19:32 +0200
Message-Id: <20230810141947.1236730-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810141947.1236730-1-arnd@kernel.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Yang Jihong <yangjihong1@huawei.com>, Borislav Petkov <bp@alien8.de>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubi
 tz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Most architectures that support kprobes declare this function in their
own asm/kprobes.h header and provide an override, but some are missing
the prototype, which causes a warning for the __weak stub implementation:

kernel/kprobes.c:1865:12: error: no previous prototype for 'kprobe_exceptions_notify' [-Werror=missing-prototypes]
 1865 | int __weak kprobe_exceptions_notify(struct notifier_block *self,

Move the prototype into linux/kprobes.h so it is visible to all
the definitions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/include/asm/kprobes.h     | 3 ---
 arch/arm/include/asm/kprobes.h     | 2 --
 arch/arm64/include/asm/kprobes.h   | 2 --
 arch/ia64/include/asm/kprobes.h    | 2 --
 arch/mips/include/asm/kprobes.h    | 2 --
 arch/powerpc/include/asm/kprobes.h | 2 --
 arch/s390/include/asm/kprobes.h    | 2 --
 arch/sh/include/asm/kprobes.h      | 2 --
 arch/sparc/include/asm/kprobes.h   | 2 --
 arch/x86/include/asm/kprobes.h     | 2 --
 include/linux/kprobes.h            | 4 ++++
 11 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arc/include/asm/kprobes.h b/arch/arc/include/asm/kprobes.h
index de1566e32cb89..68e8301c0df2c 100644
--- a/arch/arc/include/asm/kprobes.h
+++ b/arch/arc/include/asm/kprobes.h
@@ -32,9 +32,6 @@ struct kprobe;
 
 void arch_remove_kprobe(struct kprobe *p);
 
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
-
 struct prev_kprobe {
 	struct kprobe *kp;
 	unsigned long status;
diff --git a/arch/arm/include/asm/kprobes.h b/arch/arm/include/asm/kprobes.h
index e26a278d301ab..5b8dbf1b0be49 100644
--- a/arch/arm/include/asm/kprobes.h
+++ b/arch/arm/include/asm/kprobes.h
@@ -40,8 +40,6 @@ struct kprobe_ctlblk {
 
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
 
 /* optinsn template addresses */
 extern __visible kprobe_opcode_t optprobe_template_entry[];
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
index 05cd82eeca136..be7a3680dadff 100644
--- a/arch/arm64/include/asm/kprobes.h
+++ b/arch/arm64/include/asm/kprobes.h
@@ -37,8 +37,6 @@ struct kprobe_ctlblk {
 
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
 void __kretprobe_trampoline(void);
 void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
diff --git a/arch/ia64/include/asm/kprobes.h b/arch/ia64/include/asm/kprobes.h
index 9e956768946cc..56004f97df6d2 100644
--- a/arch/ia64/include/asm/kprobes.h
+++ b/arch/ia64/include/asm/kprobes.h
@@ -107,8 +107,6 @@ struct arch_specific_insn {
 };
 
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 
 extern void arch_remove_kprobe(struct kprobe *p);
 
diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
index 68b1e5d458cfb..bc27d99c94363 100644
--- a/arch/mips/include/asm/kprobes.h
+++ b/arch/mips/include/asm/kprobes.h
@@ -71,8 +71,6 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 
 #endif /* CONFIG_KPROBES */
 #endif /* _ASM_KPROBES_H */
diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
index c8e4b4fd4e330..4525a9c68260d 100644
--- a/arch/powerpc/include/asm/kprobes.h
+++ b/arch/powerpc/include/asm/kprobes.h
@@ -84,8 +84,6 @@ struct arch_optimized_insn {
 	kprobe_opcode_t *insn;
 };
 
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-					unsigned long val, void *data);
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 extern int kprobe_handler(struct pt_regs *regs);
 extern int kprobe_post_handler(struct pt_regs *regs);
diff --git a/arch/s390/include/asm/kprobes.h b/arch/s390/include/asm/kprobes.h
index 83f732ca3af4d..3f87125dd9b0d 100644
--- a/arch/s390/include/asm/kprobes.h
+++ b/arch/s390/include/asm/kprobes.h
@@ -72,8 +72,6 @@ struct kprobe_ctlblk {
 void arch_remove_kprobe(struct kprobe *p);
 
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-int kprobe_exceptions_notify(struct notifier_block *self,
-	unsigned long val, void *data);
 
 #define flush_insn_slot(p)	do { } while (0)
 
diff --git a/arch/sh/include/asm/kprobes.h b/arch/sh/include/asm/kprobes.h
index eeba83e0a7d29..65d4c3316a5bd 100644
--- a/arch/sh/include/asm/kprobes.h
+++ b/arch/sh/include/asm/kprobes.h
@@ -46,8 +46,6 @@ struct kprobe_ctlblk {
 };
 
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 extern int kprobe_handle_illslot(unsigned long pc);
 #else
 
diff --git a/arch/sparc/include/asm/kprobes.h b/arch/sparc/include/asm/kprobes.h
index 06c2bc767ef75..aec742cd898f2 100644
--- a/arch/sparc/include/asm/kprobes.h
+++ b/arch/sparc/include/asm/kprobes.h
@@ -47,8 +47,6 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 asmlinkage void __kprobes kprobe_trap(unsigned long trap_level,
 				      struct pt_regs *regs);
diff --git a/arch/x86/include/asm/kprobes.h b/arch/x86/include/asm/kprobes.h
index a2e9317aad495..5939694dfb28d 100644
--- a/arch/x86/include/asm/kprobes.h
+++ b/arch/x86/include/asm/kprobes.h
@@ -113,8 +113,6 @@ struct kprobe_ctlblk {
 };
 
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 extern int kprobe_int3_handler(struct pt_regs *regs);
 
 #else
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 85a64cb95d755..987911cdc90a2 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -450,6 +450,10 @@ int kprobe_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 
 int arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
 			    char *type, char *sym);
+
+int kprobe_exceptions_notify(struct notifier_block *self,
+			     unsigned long val, void *data);
+
 #else /* !CONFIG_KPROBES: */
 
 static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
-- 
2.39.2

