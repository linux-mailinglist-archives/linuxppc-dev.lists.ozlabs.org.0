Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC332B9E08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:21:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbJr6hsDzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:21:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=IMq2NJmb; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8f1zP4zDqtG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:13:54 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id t37so5550163pga.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSDH85sBvesd+3qFu6Nb9Lcl1KLpduyCfiJkv9h5nd0=;
 b=IMq2NJmbK5GXT8k03jxYMipOlYYOH8eNu2StnW5jSef5LdPAwRL9n2S5JxyOo2Mb3s
 xKHIRK4IK2ICljFEaEFeU8Ht6OjnpPGCdSqQkGNjueXMso/lGlXb8b6h91tc1/L+p6Px
 CwKZ4y1Ln2/53/r2sNEU8xzYYu95vm4hqhXtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSDH85sBvesd+3qFu6Nb9Lcl1KLpduyCfiJkv9h5nd0=;
 b=idswcrKpZdPw0h3LpjrqXDjAjH9H+TgoaA2zv4sFLNSaLPNNPKxYXYl0j275Z/WtG3
 Mgq8lMhU2mP9TQ1sxFVI6qGYXzbGspz5MVUEtdtSOBZlgxrzapEPtGLiWF7GKtvHb4YE
 KJ7WDZfffxUWqb+wgAcMC9xVww7RAb05ilnzmgcFwCnOeRONwcazjgzo/b09fy8PaC0+
 g6ltzBUpTnJpPM83fPUzS3Hw9RinTCgHLacnO9X1dI8oceA/ezDsBiwOF4YVjCjbJcnW
 7+3E72ig3eqV3FuZGMG/H6zEKdKxuo3MUz+puJhJpuv37nj9KJmrQZRGQugIFl9IMZaJ
 e+Lw==
X-Gm-Message-State: AOAM531mQcFQ+yrSrmB+MYMInY6W/ig2NuzqBsG+8zeE4uuZx/boMVRz
 mis7zgpC8bPy/EY4H5kJZB9FNDTvV7cD5A==
X-Google-Smtp-Source: ABdhPJxCCCQLHw//sHTbSo0ZTy0DNfypLeTq4rNfxwj6ADQz362iLgl/CaCR+0E47N9T2kB5QZnENw==
X-Received: by 2002:aa7:9601:0:b029:18a:e777:dac1 with SMTP id
 q1-20020aa796010000b029018ae777dac1mr10892579pfg.4.1605827630131; 
 Thu, 19 Nov 2020 15:13:50 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id e8sm923059pfn.175.2020.11.19.15.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:13:49 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/64s: flush L1D after user accesses
Date: Fri, 20 Nov 2020 10:13:29 +1100
Message-Id: <20201119231333.361771-4-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119231333.361771-1-dja@axtens.net>
References: <20201119231333.361771-1-dja@axtens.net>
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
Cc: dja@axtens.net, cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

IBM Power9 processors can speculatively operate on data in the L1 cache
before it has been completely validated, via a way-prediction mechanism. It
is not possible for an attacker to determine the contents of impermissible
memory using this method, since these systems implement a combination of
hardware and software security measures to prevent scenarios where
protected data could be leaked.

However these measures don't address the scenario where an attacker induces
the operating system to speculatively execute instructions using data that
the attacker controls. This can be used for example to speculatively bypass
"kernel user access prevention" techniques, as discovered by Anthony
Steinhauser of Google's Safeside Project. This is not an attack by itself,
but there is a possibility it could be used in conjunction with
side-channels or other weaknesses in the privileged code to construct an
attack.

This issue can be mitigated by flushing the L1 cache between privilege
boundaries of concern. This patch flushes the L1 cache after user accesses.

This is part of the fix for CVE-2020-4788.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 .../admin-guide/kernel-parameters.txt         |  4 +
 .../powerpc/include/asm/book3s/64/kup-radix.h | 66 ++++++++------
 arch/powerpc/include/asm/exception-64s.h      |  3 +
 arch/powerpc/include/asm/feature-fixups.h     |  9 ++
 arch/powerpc/include/asm/kup.h                | 19 +++--
 arch/powerpc/include/asm/security_features.h  |  3 +
 arch/powerpc/include/asm/setup.h              |  1 +
 arch/powerpc/kernel/exceptions-64s.S          | 85 ++++++-------------
 arch/powerpc/kernel/setup_64.c                | 62 ++++++++++++++
 arch/powerpc/kernel/vmlinux.lds.S             |  7 ++
 arch/powerpc/lib/feature-fixups.c             | 50 +++++++++++
 arch/powerpc/platforms/powernv/setup.c        | 10 ++-
 arch/powerpc/platforms/pseries/setup.c        |  4 +
 13 files changed, 233 insertions(+), 90 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 282789cfa1dc..d1b417dd1266 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2876,6 +2876,7 @@
 					       tsx_async_abort=off [X86]
 					       kvm.nx_huge_pages=off [X86]
 					       no_entry_flush [PPC]
+					       no_uaccess_flush [PPC]
 
 				Exceptions:
 					       This does not have any effect on
@@ -3255,6 +3256,9 @@
 	nospec_store_bypass_disable
 			[HW] Disable all mitigations for the Speculative Store Bypass vulnerability
 
+	no_uaccess_flush
+	                [PPC] Don't flush the L1-D cache after accessing user data.
+
 	noxsave		[BUGS=X86] Disables x86 extended register state save
 			and restore using xsave. The kernel will fallback to
 			enabling legacy floating-point and sse state.
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3ee1ec60be84..97c2394e7dea 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -61,6 +61,8 @@
 
 #else /* !__ASSEMBLY__ */
 
+DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
+
 #ifdef CONFIG_PPC_KUAP
 
 #include <asm/mmu.h>
@@ -103,8 +105,16 @@ static inline void kuap_check_amr(void)
 
 static inline unsigned long get_kuap(void)
 {
+	/*
+	 * We return AMR_KUAP_BLOCKED when we don't support KUAP because
+	 * prevent_user_access_return needs to return AMR_KUAP_BLOCKED to
+	 * cause restore_user_access to do a flush.
+	 *
+	 * This has no effect in terms of actually blocking things on hash,
+	 * so it doesn't break anything.
+	 */
 	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
-		return 0;
+		return AMR_KUAP_BLOCKED;
 
 	return mfspr(SPRN_AMR);
 }
@@ -123,6 +133,31 @@ static inline void set_kuap(unsigned long value)
 	isync();
 }
 
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+{
+	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
+		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
+		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
+}
+#else /* CONFIG_PPC_KUAP */
+static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr) { }
+
+static inline unsigned long kuap_get_and_check_amr(void)
+{
+	return 0UL;
+}
+
+static inline void kuap_check_amr(void) { }
+
+static inline unsigned long get_kuap(void)
+{
+	return AMR_KUAP_BLOCKED;
+}
+
+static inline void set_kuap(unsigned long value) { }
+#endif /* !CONFIG_PPC_KUAP */
+
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      unsigned long size, unsigned long dir)
 {
@@ -142,6 +177,8 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir)
 {
 	set_kuap(AMR_KUAP_BLOCKED);
+	if (static_branch_unlikely(&uaccess_flush_key))
+		do_uaccess_flush();
 }
 
 static inline unsigned long prevent_user_access_return(void)
@@ -149,6 +186,8 @@ static inline unsigned long prevent_user_access_return(void)
 	unsigned long flags = get_kuap();
 
 	set_kuap(AMR_KUAP_BLOCKED);
+	if (static_branch_unlikely(&uaccess_flush_key))
+		do_uaccess_flush();
 
 	return flags;
 }
@@ -156,30 +195,9 @@ static inline unsigned long prevent_user_access_return(void)
 static inline void restore_user_access(unsigned long flags)
 {
 	set_kuap(flags);
+	if (static_branch_unlikely(&uaccess_flush_key) && flags == AMR_KUAP_BLOCKED)
+		do_uaccess_flush();
 }
-
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
-{
-	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
-		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
-		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
-}
-#else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
-{
-}
-
-static inline void kuap_check_amr(void)
-{
-}
-
-static inline unsigned long kuap_get_and_check_amr(void)
-{
-	return 0;
-}
-#endif /* CONFIG_PPC_KUAP */
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H */
diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 83fa88bc9935..1d32b174ab6a 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -144,6 +144,9 @@
 	RFSCV;								\
 	b	rfscv_flush_fallback
 
+#else /* __ASSEMBLY__ */
+/* Prototype for function defined in exceptions-64s.S */
+void do_uaccess_flush(void);
 #endif /* __ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_EXCEPTION_H */
diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
index 06a48219bbf2..fbd406cd6916 100644
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -205,6 +205,14 @@ label##3:					       	\
 	FTR_ENTRY_OFFSET 955b-956b;			\
 	.popsection;
 
+#define UACCESS_FLUSH_FIXUP_SECTION			\
+959:							\
+	.pushsection __uaccess_flush_fixup,"a";		\
+	.align 2;					\
+960:							\
+	FTR_ENTRY_OFFSET 959b-960b;			\
+	.popsection;
+
 #define ENTRY_FLUSH_FIXUP_SECTION			\
 957:							\
 	.pushsection __entry_flush_fixup,"a";		\
@@ -248,6 +256,7 @@ extern long stf_barrier_fallback;
 extern long entry_flush_fallback;
 extern long __start___stf_entry_barrier_fixup, __stop___stf_entry_barrier_fixup;
 extern long __start___stf_exit_barrier_fixup, __stop___stf_exit_barrier_fixup;
+extern long __start___uaccess_flush_fixup, __stop___uaccess_flush_fixup;
 extern long __start___entry_flush_fixup, __stop___entry_flush_fixup;
 extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
 extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 1d0f7d838b2e..0f5c606ae057 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -53,17 +53,26 @@ static inline void setup_kuep(bool disabled) { }
 void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
+
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+{
+	return false;
+}
+
+/*
+ * book3s/64/kup-radix.h defines these functions for the !KUAP case to flush
+ * the L1D cache after user accesses. Only include the empty stubs for other
+ * platforms.
+ */
+#ifndef CONFIG_PPC64
 static inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size, unsigned long dir) { }
 static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir) { }
 static inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static inline void restore_user_access(unsigned long flags) { }
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
-{
-	return false;
-}
+#endif /* CONFIG_PPC64 */
 #endif /* CONFIG_PPC_KUAP */
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
index 9e7459d2edca..b774a4477d5f 100644
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -89,6 +89,8 @@ static inline bool security_ftr_enabled(u64 feature)
 // The L1-D cache should be flushed when entering the kernel
 #define SEC_FTR_L1D_FLUSH_ENTRY		0x0000000000004000ull
 
+// The L1-D cache should be flushed after user accesses from the kernel
+#define SEC_FTR_L1D_FLUSH_UACCESS	0x0000000000008000ull
 
 // Features enabled by default
 #define SEC_FTR_DEFAULT \
@@ -96,6 +98,7 @@ static inline bool security_ftr_enabled(u64 feature)
 	 SEC_FTR_L1D_FLUSH_PR | \
 	 SEC_FTR_BNDS_CHK_SPEC_BAR | \
 	 SEC_FTR_L1D_FLUSH_ENTRY | \
+	 SEC_FTR_L1D_FLUSH_UACCESS | \
 	 SEC_FTR_FAVOUR_SECURITY)
 
 #endif /* _ASM_POWERPC_SECURITY_FEATURES_H */
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index e2fcd3e874f8..a466749703f1 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -60,6 +60,7 @@ void setup_barrier_nospec(void);
 #else
 static inline void setup_barrier_nospec(void) { };
 #endif
+void do_uaccess_flush_fixups(enum l1d_flush_type types);
 void do_entry_flush_fixups(enum l1d_flush_type types);
 void do_barrier_nospec_fixups(bool enable);
 extern bool barrier_nospec_enabled;
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5577dd887d37..f63a3d3bca3d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2951,11 +2951,8 @@ TRAMP_REAL_BEGIN(stf_barrier_fallback)
 	.endr
 	blr
 
-TRAMP_REAL_BEGIN(entry_flush_fallback)
-	std	r9,PACA_EXRFI+EX_R9(r13)
-	std	r10,PACA_EXRFI+EX_R10(r13)
-	std	r11,PACA_EXRFI+EX_R11(r13)
-	mfctr	r9
+/* Clobbers r10, r11, ctr */
+.macro L1D_DISPLACEMENT_FLUSH
 	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
 	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
 	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
@@ -2981,7 +2978,14 @@ TRAMP_REAL_BEGIN(entry_flush_fallback)
 	ld	r11,(0x80 + 8)*7(r10)
 	addi	r10,r10,0x80*8
 	bdnz	1b
+.endm
 
+TRAMP_REAL_BEGIN(entry_flush_fallback)
+	std	r9,PACA_EXRFI+EX_R9(r13)
+	std	r10,PACA_EXRFI+EX_R10(r13)
+	std	r11,PACA_EXRFI+EX_R11(r13)
+	mfctr	r9
+	L1D_DISPLACEMENT_FLUSH
 	mtctr	r9
 	ld	r9,PACA_EXRFI+EX_R9(r13)
 	ld	r10,PACA_EXRFI+EX_R10(r13)
@@ -2997,32 +3001,7 @@ TRAMP_REAL_BEGIN(rfi_flush_fallback)
 	std	r10,PACA_EXRFI+EX_R10(r13)
 	std	r11,PACA_EXRFI+EX_R11(r13)
 	mfctr	r9
-	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
-	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
-	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
-	mtctr	r11
-	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
-
-	/* order ld/st prior to dcbt stop all streams with flushing */
-	sync
-
-	/*
-	 * The load adresses are at staggered offsets within cachelines,
-	 * which suits some pipelines better (on others it should not
-	 * hurt).
-	 */
-1:
-	ld	r11,(0x80 + 8)*0(r10)
-	ld	r11,(0x80 + 8)*1(r10)
-	ld	r11,(0x80 + 8)*2(r10)
-	ld	r11,(0x80 + 8)*3(r10)
-	ld	r11,(0x80 + 8)*4(r10)
-	ld	r11,(0x80 + 8)*5(r10)
-	ld	r11,(0x80 + 8)*6(r10)
-	ld	r11,(0x80 + 8)*7(r10)
-	addi	r10,r10,0x80*8
-	bdnz	1b
-
+	L1D_DISPLACEMENT_FLUSH
 	mtctr	r9
 	ld	r9,PACA_EXRFI+EX_R9(r13)
 	ld	r10,PACA_EXRFI+EX_R10(r13)
@@ -3040,32 +3019,7 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
 	std	r10,PACA_EXRFI+EX_R10(r13)
 	std	r11,PACA_EXRFI+EX_R11(r13)
 	mfctr	r9
-	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
-	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
-	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
-	mtctr	r11
-	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
-
-	/* order ld/st prior to dcbt stop all streams with flushing */
-	sync
-
-	/*
-	 * The load adresses are at staggered offsets within cachelines,
-	 * which suits some pipelines better (on others it should not
-	 * hurt).
-	 */
-1:
-	ld	r11,(0x80 + 8)*0(r10)
-	ld	r11,(0x80 + 8)*1(r10)
-	ld	r11,(0x80 + 8)*2(r10)
-	ld	r11,(0x80 + 8)*3(r10)
-	ld	r11,(0x80 + 8)*4(r10)
-	ld	r11,(0x80 + 8)*5(r10)
-	ld	r11,(0x80 + 8)*6(r10)
-	ld	r11,(0x80 + 8)*7(r10)
-	addi	r10,r10,0x80*8
-	bdnz	1b
-
+	L1D_DISPLACEMENT_FLUSH
 	mtctr	r9
 	ld	r9,PACA_EXRFI+EX_R9(r13)
 	ld	r10,PACA_EXRFI+EX_R10(r13)
@@ -3116,8 +3070,21 @@ TRAMP_REAL_BEGIN(rfscv_flush_fallback)
 	RFSCV
 
 USE_TEXT_SECTION()
-	MASKED_INTERRUPT
-	MASKED_INTERRUPT hsrr=1
+
+_GLOBAL(do_uaccess_flush)
+	UACCESS_FLUSH_FIXUP_SECTION
+	nop
+	nop
+	nop
+	blr
+	L1D_DISPLACEMENT_FLUSH
+	blr
+_ASM_NOKPROBE_SYMBOL(do_uaccess_flush)
+EXPORT_SYMBOL(do_uaccess_flush)
+
+
+MASKED_INTERRUPT
+MASKED_INTERRUPT hsrr=1
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 kvmppc_skip_interrupt:
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 7d447b43ad13..74fd47f46fa5 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -946,8 +946,12 @@ static enum l1d_flush_type enabled_flush_types;
 static void *l1d_flush_fallback_area;
 static bool no_rfi_flush;
 static bool no_entry_flush;
+static bool no_uaccess_flush;
 bool rfi_flush;
 bool entry_flush;
+bool uaccess_flush;
+DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
+EXPORT_SYMBOL(uaccess_flush_key);
 
 static int __init handle_no_rfi_flush(char *p)
 {
@@ -965,6 +969,14 @@ static int __init handle_no_entry_flush(char *p)
 }
 early_param("no_entry_flush", handle_no_entry_flush);
 
+static int __init handle_no_uaccess_flush(char *p)
+{
+	pr_info("uaccess-flush: disabled on command line.");
+	no_uaccess_flush = true;
+	return 0;
+}
+early_param("no_uaccess_flush", handle_no_uaccess_flush);
+
 /*
  * The RFI flush is not KPTI, but because users will see doco that says to use
  * nopti we hijack that option here to also disable the RFI flush.
@@ -1008,6 +1020,20 @@ void entry_flush_enable(bool enable)
 	entry_flush = enable;
 }
 
+void uaccess_flush_enable(bool enable)
+{
+	if (enable) {
+		do_uaccess_flush_fixups(enabled_flush_types);
+		static_branch_enable(&uaccess_flush_key);
+		on_each_cpu(do_nothing, NULL, 1);
+	} else {
+		static_branch_disable(&uaccess_flush_key);
+		do_uaccess_flush_fixups(L1D_FLUSH_NONE);
+	}
+
+	uaccess_flush = enable;
+}
+
 static void __ref init_fallback_flush(void)
 {
 	u64 l1d_size, limit;
@@ -1079,6 +1105,15 @@ void setup_entry_flush(bool enable)
 		entry_flush_enable(enable);
 }
 
+void setup_uaccess_flush(bool enable)
+{
+	if (cpu_mitigations_off())
+		return;
+
+	if (!no_uaccess_flush)
+		uaccess_flush_enable(enable);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int rfi_flush_set(void *data, u64 val)
 {
@@ -1132,10 +1167,37 @@ static int entry_flush_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
 
+static int uaccess_flush_set(void *data, u64 val)
+{
+	bool enable;
+
+	if (val == 1)
+		enable = true;
+	else if (val == 0)
+		enable = false;
+	else
+		return -EINVAL;
+
+	/* Only do anything if we're changing state */
+	if (enable != uaccess_flush)
+		uaccess_flush_enable(enable);
+
+	return 0;
+}
+
+static int uaccess_flush_get(void *data, u64 *val)
+{
+	*val = uaccess_flush ? 1 : 0;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
+
 static __init int rfi_flush_debugfs_init(void)
 {
 	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
 	debugfs_create_file("entry_flush", 0600, powerpc_debugfs_root, NULL, &fops_entry_flush);
+	debugfs_create_file("uaccess_flush", 0600, powerpc_debugfs_root, NULL, &fops_uaccess_flush);
 	return 0;
 }
 device_initcall(rfi_flush_debugfs_init);
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 715ec4d4614a..6db90cdf11da 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -131,6 +131,13 @@ SECTIONS
 		__stop___stf_entry_barrier_fixup = .;
 	}
 
+	. = ALIGN(8);
+	__uaccess_flush_fixup : AT(ADDR(__uaccess_flush_fixup) - LOAD_OFFSET) {
+		__start___uaccess_flush_fixup = .;
+		*(__uaccess_flush_fixup)
+		__stop___uaccess_flush_fixup = .;
+	}
+
 	. = ALIGN(8);
 	__entry_flush_fixup : AT(ADDR(__entry_flush_fixup) - LOAD_OFFSET) {
 		__start___entry_flush_fixup = .;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 70e83cfd74aa..321c12a9ef6b 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -234,6 +234,56 @@ void do_stf_barrier_fixups(enum stf_barrier_type types)
 	do_stf_exit_barrier_fixups(types);
 }
 
+void do_uaccess_flush_fixups(enum l1d_flush_type types)
+{
+	unsigned int instrs[4], *dest;
+	long *start, *end;
+	int i;
+
+	start = PTRRELOC(&__start___uaccess_flush_fixup);
+	end = PTRRELOC(&__stop___uaccess_flush_fixup);
+
+	instrs[0] = 0x60000000; /* nop */
+	instrs[1] = 0x60000000; /* nop */
+	instrs[2] = 0x60000000; /* nop */
+	instrs[3] = 0x4e800020; /* blr */
+
+	i = 0;
+	if (types == L1D_FLUSH_FALLBACK) {
+		instrs[3] = 0x60000000; /* nop */
+		/* fallthrough to fallback flush */
+	}
+
+	if (types & L1D_FLUSH_ORI) {
+		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
+		instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
+	}
+
+	if (types & L1D_FLUSH_MTTRIG)
+		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
+
+	for (i = 0; start < end; start++, i++) {
+		dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+
+		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
+	}
+
+	printk(KERN_DEBUG "uaccess-flush: patched %d locations (%s flush)\n", i,
+		(types == L1D_FLUSH_NONE)       ? "no" :
+		(types == L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
+		(types &  L1D_FLUSH_ORI)        ? (types & L1D_FLUSH_MTTRIG)
+							? "ori+mttrig type"
+							: "ori type" :
+		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
+						: "unknown");
+}
+
 void do_entry_flush_fixups(enum l1d_flush_type types)
 {
 	unsigned int instrs[3], *dest;
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index d04a085c423d..087ec92acfc4 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -124,10 +124,12 @@ static void pnv_setup_rfi_flush(void)
 
 	/*
 	 * If we are non-Power9 bare metal, we don't need to flush on kernel
-	 * entry: it fixes a P9 specific vulnerability.
+	 * entry or after user access: they fix a P9 specific vulnerability.
 	 */
-	if (!pvr_version_is(PVR_POWER9))
+	if (!pvr_version_is(PVR_POWER9)) {
 		security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
+		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
+	}
 
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
 		 (security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR)   || \
@@ -139,6 +141,10 @@ static void pnv_setup_rfi_flush(void)
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
 		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_ENTRY);
 	setup_entry_flush(enable);
+
+	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
+		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_UACCESS);
+	setup_uaccess_flush(enable);
 }
 
 static void __init pnv_check_guarded_cores(void)
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 8136c5368ee4..3617cdb079f6 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -583,6 +583,10 @@ void pseries_setup_rfi_flush(void)
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
 		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_ENTRY);
 	setup_entry_flush(enable);
+
+	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
+		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_UACCESS);
+	setup_uaccess_flush(enable);
 }
 
 #ifdef CONFIG_PCI_IOV
-- 
2.25.1

