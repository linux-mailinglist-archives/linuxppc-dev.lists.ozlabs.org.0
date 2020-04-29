Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC41BD4B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:34:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpdH308mzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Jocgn2bz; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpSM3zq3zDr0L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:26:27 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id 7so2000365pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nBmROihxwq9K3BOUEKQJH6AKI2NS8OsZFShco4n68K4=;
 b=Jocgn2bzDF+8e7IRuJ6TlApFamhjsCM1DTGVgzwOvdk3X80ZmThsVXF2qscPDUaf1y
 m0Fc52U7hq0fBn8aFT9YGFCtNsqo17NCDXQkpOaJ4uG6aw8cIaisRM7dPxADFmdzt/Pd
 MWmRmR76CaRjgzFEF4cPTZsfVb3qm3b381FmvdFNuv1BGuyxMscbm39Y82Dq98YFdVZ6
 AYDOY93EOiHKUuL+iKfiLYrqLmAR2CZYwXOVRm71h+Z0FcSOnuLs28GIBNx9LlXqYUH+
 QxPmJGlvD9b/wmF/Ju0lXiuqm2m3eHdCALRolryJCBjd1Jm3IfsVf+Tg9iPpxDWU4zu6
 7GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nBmROihxwq9K3BOUEKQJH6AKI2NS8OsZFShco4n68K4=;
 b=D0MmUohAzTI/U5FqoOXp14grP5NhoCeLPJ+vLxPN2/Uzmv6CPxFlDanOwYbBsmoCVS
 xyKtwKZxVx7oRNzNWLxUDlnOfirDXotn6ynZXLVHhhskSq0KA+1RsBQNBGXmAUDazH5r
 ckHzFFgv10qgLjX0e/Nek1bOdb3zn8qMSJ8UsUBBjXrR2NkaFhawYHE5S/X0cb3cB+do
 omXsbZHzBolLc1rqxFw1iFznZBHipkgaMeZx5ggKjWDIuTGc+RCdlpGH3OAu/frgQuZQ
 p5f/dg9efqUPGqK7AJEuW8l9Mn5gFNhdBjfRe01KQDo7Ui8CCr/W9NLMespUgwYCOdUo
 ekPQ==
X-Gm-Message-State: AGi0PuYa8kONXV6d8KVgNbk5VFtXtjjYY+TT8p+vz/C6bgodd25h2RBP
 upDz4YbP6a0LAJHSt6D84BTAofWS
X-Google-Smtp-Source: APiQypKIgE5IN/i140OGZtybHT1RMwDcJvdkjEfARtqXLBXhjgdVjQftyacamG5c99T2VGVJW2DKRg==
X-Received: by 2002:a17:90a:558a:: with SMTP id
 c10mr1307525pji.53.1588141582500; 
 Tue, 28 Apr 2020 23:26:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s76sm164373pgc.85.2020.04.28.23.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:26:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/64/kuap: interrupt exit kuap restore add missing
 isync, conditionally restore AMR
Date: Wed, 29 Apr 2020 16:26:03 +1000
Message-Id: <20200429062607.1675792-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a missing isync before the mtspr(AMR), which ensures previous
memory accesses execute before the mtspr, so they can't slip past the
AMR check and access user memory if we are returning to a context where
kuap is allowed.

The AMR is made conditional, and only done if the AMR must change, which
should be the less common case on most workloads (though kernel page
faults on uaccess could be frequent, this doesn't significantly slow
down that case).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../powerpc/include/asm/book3s/64/kup-radix.h | 36 ++++++++++++++-----
 arch/powerpc/kernel/syscall_64.c              | 14 +++++---
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 8dc5f292b806..ec8970958a26 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -62,19 +62,32 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-static inline void kuap_restore_amr(struct pt_regs *regs)
+static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 {
 	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
-		isync();
-		mtspr(SPRN_AMR, regs->kuap);
-		/*
-		 * No isync required here because we are about to rfi
-		 * back to previous context before any user accesses
-		 * would be made, which is a CSI.
-		 */
+		if (unlikely(regs->kuap != amr)) {
+			isync();
+			mtspr(SPRN_AMR, regs->kuap);
+			/*
+			 * No isync required here because we are about to rfi
+			 * back to previous context before any user accesses
+			 * would be made, which is a CSI.
+			 */
+		}
 	}
 }
 
+static inline unsigned long kuap_get_and_check_amr(void)
+{
+	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
+		unsigned long amr = mfspr(SPRN_AMR);
+		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
+			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
+		return amr;
+	}
+	return 0;
+}
+
 static inline void kuap_check_amr(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
@@ -151,13 +164,18 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
 #else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs)
+static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 {
 }
 
 static inline void kuap_check_amr(void)
 {
 }
+
+static inline unsigned long kuap_get_and_check_amr(void)
+{
+	return 0;
+}
 #endif /* CONFIG_PPC_KUAP */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index a37c7717424f..edeab10c6888 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -242,6 +242,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
+	/*
+	 * We don't need to restore AMR on the way back to userspace for KUAP.
+	 * AMR can only have been unlocked if we interrupted the kernel.
+	 */
 	kuap_check_amr();
 
 	local_irq_save(flags);
@@ -313,13 +317,14 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long flags;
 	unsigned long ret = 0;
+	unsigned long amr;
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
 	BUG_ON(!FULL_REGS(regs));
 
-	kuap_check_amr();
+	amr = kuap_get_and_check_amr();
 
 	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
 		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
@@ -367,10 +372,11 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 #endif
 
 	/*
-	 * We don't need to restore AMR on the way back to userspace for KUAP.
-	 * The value of AMR only matters while we're in the kernel.
+	 * Don't want to mfspr(SPRN_AMR) here, because this comes after
+	 * mtmsr, which would cause RAW stalls. Hence, we take the AMR value
+	 * from the check above.
 	 */
-	kuap_restore_amr(regs);
+	kuap_restore_amr(regs, amr);
 
 	return ret;
 }
-- 
2.23.0

