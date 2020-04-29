Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E791BD561
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:05:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqKG5VSCzDr6L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Enz1wZuz; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bq7x48GZzDr5l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:57:17 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id x2so649007pfx.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+cxMIgNTTorSICTEdGHeu0AzoEwbW1rZkQFx37dE+0=;
 b=Enz1wZuzZzA+/AGiQrNqYCd0+JN9a8Gh9TfN8X16GuciP6exdqwcZAXfQ8GHUVngCA
 9Wb3QI4W0SCF6SN+CFuPfr7JsQaRGPQB3yMjU22AndMXOZgjIEPNda4sgUgWHWi4m7tl
 OeFAe8EhkqtJ5N0VJ+m0zLGDitDsl4l5NOqSWfbt5QdsCTmVv/2Nal3VUHSDxId2ONyO
 MbOURstnncnRBp/f9gvl25CFoKGK2byEgHPzbsBqDR8XC9r4LeqNotvvc8nuy/RuamdF
 RV+VNdvdQUOGBkkeIJDK2PL2C/pGgNDwLmhrDlkfB5330NTyRp6U+Ig9kGRagk4sMXWs
 XZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+cxMIgNTTorSICTEdGHeu0AzoEwbW1rZkQFx37dE+0=;
 b=gVCkMtbi0GJ5nJrf2Nt/FWyVzz87gGHyuS1SwKw9cwUKJTJxRfEVFVgfciBtr5YKlp
 1YvUvGDP51CDBOLvc6gl3SHFTLRdW7UkYRWDVqWsETrCutlQ1Dw0TyhBtXunmFW11IKM
 BPnkcb0lc/ajoxwBOLWavggwSf6yfN8Tzx6/hyhEXE0L0hNX/0R6MFxBN2HAYFOaFybc
 CImmnzHJUmNDugSRk5KCIe9hSaBe/Zl0I9uZmAt4la61b0UKm77X5Xdsq1Asr0LYyIV3
 r2ugMB6s6s7LxpxhISVWjVRNQtb5kNNaiQMaFhtl14zKRBW9Xz+sLrswBNBuw0ZuVeNg
 DMiA==
X-Gm-Message-State: AGi0PuYpcXgGvbThMKrya++DdX2+iCfDVgeE5V2GIFck+EkWwupXSWP6
 BPYBY4AOAYxwabN7Zh0mt4KZDC2w
X-Google-Smtp-Source: APiQypIYw/zDRLp0kW/bHJngKjHcmNrrb5Nulo4qUEaiSPxtKNKbhSDaBEJcZASNRSGI7SgsQZ/thA==
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr34458729pfr.36.1588143435068; 
 Tue, 28 Apr 2020 23:57:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id a26sm254660pgd.68.2020.04.28.23.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:57:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/64/kuap: interrupt exit conditionally restore AMR
Date: Wed, 29 Apr 2020 16:56:51 +1000
Message-Id: <20200429065654.1677541-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429065654.1677541-1-npiggin@gmail.com>
References: <20200429065654.1677541-1-npiggin@gmail.com>
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

The AMR update is made conditional on AMR actually changing, which
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

