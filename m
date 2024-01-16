Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC94082E61A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 02:05:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aD+cWlto;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDW5Z51XMz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 12:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aD+cWlto;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDW4m3tBSz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 12:04:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F02D4B80D0C;
	Tue, 16 Jan 2024 01:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AEAC433F1;
	Tue, 16 Jan 2024 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705367076;
	bh=4Rgd6pj6ZzHj+h/R371GlQqWUydY+bynAeaxfKNSS8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aD+cWltoW9RendeciKgnR7IKr3X3L02qsi6pyVVQuxoQzFV4ZmZ+bqN+BnMAkqSBA
	 UailrtA6ofEYPXJHJwY88tdnSkp5ju5H0bFbOJN69wg18WzuaKs2qq0eF/gupdm6pf
	 GsKvu2fj6eXTHAV4PzqWK8dAWMXq0YGOaz78JJFg6vex9jQVBozBSY2qd/pw//M+Mi
	 X1QJouIAvzyxqhXcpuowRU6WRN3VXAeUQVtXCOa1Q+jO0V6SD/e2rWaiyeMIaj7JwC
	 pPRHnQdJOmQecFodCvj/aMqCKps+YRkVnPWRi0UiDFuMTMmhCOIh+zqVz+SArjBwEM
	 nH1eA9r+soSIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 02/21] arch: consolidate arch_irq_work_raise prototypes
Date: Mon, 15 Jan 2024 20:03:39 -0500
Message-ID: <20240116010422.217925-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116010422.217925-1-sashal@kernel.org>
References: <20240116010422.217925-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, will@kernel.org, linux-riscv@lists.infradead.org, Sasha Levin <sashal@kernel.org>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, bp@alien8.de, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, palmer@dabbelt.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 64bac5ea17d527872121adddfee869c7a0618f8f ]

The prototype was hidden in an #ifdef on x86, which causes a warning:

kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_raise' [-Werror=missing-prototypes]

Some architectures have a working prototype, while others don't.
Fix this by providing it in only one place that is always visible.

Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/include/asm/irq_work.h     | 2 --
 arch/arm64/include/asm/irq_work.h   | 2 --
 arch/csky/include/asm/irq_work.h    | 2 +-
 arch/powerpc/include/asm/irq_work.h | 1 -
 arch/riscv/include/asm/irq_work.h   | 2 +-
 arch/s390/include/asm/irq_work.h    | 2 --
 arch/x86/include/asm/irq_work.h     | 1 -
 include/linux/irq_work.h            | 3 +++
 8 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/irq_work.h b/arch/arm/include/asm/irq_work.h
index 3149e4dc1b54..8895999834cc 100644
--- a/arch/arm/include/asm/irq_work.h
+++ b/arch/arm/include/asm/irq_work.h
@@ -9,6 +9,4 @@ static inline bool arch_irq_work_has_interrupt(void)
 	return is_smp();
 }
 
-extern void arch_irq_work_raise(void);
-
 #endif /* _ASM_ARM_IRQ_WORK_H */
diff --git a/arch/arm64/include/asm/irq_work.h b/arch/arm64/include/asm/irq_work.h
index 81bbfa3a035b..a1020285ea75 100644
--- a/arch/arm64/include/asm/irq_work.h
+++ b/arch/arm64/include/asm/irq_work.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_IRQ_WORK_H
 #define __ASM_IRQ_WORK_H
 
-extern void arch_irq_work_raise(void);
-
 static inline bool arch_irq_work_has_interrupt(void)
 {
 	return true;
diff --git a/arch/csky/include/asm/irq_work.h b/arch/csky/include/asm/irq_work.h
index 33aaf39d6f94..d39fcc1f5395 100644
--- a/arch/csky/include/asm/irq_work.h
+++ b/arch/csky/include/asm/irq_work.h
@@ -7,5 +7,5 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return true;
 }
-extern void arch_irq_work_raise(void);
+
 #endif /* __ASM_CSKY_IRQ_WORK_H */
diff --git a/arch/powerpc/include/asm/irq_work.h b/arch/powerpc/include/asm/irq_work.h
index b8b0be8f1a07..c6d3078bd8c3 100644
--- a/arch/powerpc/include/asm/irq_work.h
+++ b/arch/powerpc/include/asm/irq_work.h
@@ -6,6 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return true;
 }
-extern void arch_irq_work_raise(void);
 
 #endif /* _ASM_POWERPC_IRQ_WORK_H */
diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
index b53891964ae0..b27a4d64fc6a 100644
--- a/arch/riscv/include/asm/irq_work.h
+++ b/arch/riscv/include/asm/irq_work.h
@@ -6,5 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return IS_ENABLED(CONFIG_SMP);
 }
-extern void arch_irq_work_raise(void);
+
 #endif /* _ASM_RISCV_IRQ_WORK_H */
diff --git a/arch/s390/include/asm/irq_work.h b/arch/s390/include/asm/irq_work.h
index 603783766d0a..f00c9f610d5a 100644
--- a/arch/s390/include/asm/irq_work.h
+++ b/arch/s390/include/asm/irq_work.h
@@ -7,6 +7,4 @@ static inline bool arch_irq_work_has_interrupt(void)
 	return true;
 }
 
-void arch_irq_work_raise(void);
-
 #endif /* _ASM_S390_IRQ_WORK_H */
diff --git a/arch/x86/include/asm/irq_work.h b/arch/x86/include/asm/irq_work.h
index 800ffce0db29..6b4d36c95165 100644
--- a/arch/x86/include/asm/irq_work.h
+++ b/arch/x86/include/asm/irq_work.h
@@ -9,7 +9,6 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return boot_cpu_has(X86_FEATURE_APIC);
 }
-extern void arch_irq_work_raise(void);
 #else
 static inline bool arch_irq_work_has_interrupt(void)
 {
diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
index 8cd11a223260..136f2980cba3 100644
--- a/include/linux/irq_work.h
+++ b/include/linux/irq_work.h
@@ -66,6 +66,9 @@ void irq_work_sync(struct irq_work *work);
 void irq_work_run(void);
 bool irq_work_needs_cpu(void);
 void irq_work_single(void *arg);
+
+void arch_irq_work_raise(void);
+
 #else
 static inline bool irq_work_needs_cpu(void) { return false; }
 static inline void irq_work_run(void) { }
-- 
2.43.0

