Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3095A639AA0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:51:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpPy0X53z3cGV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:51:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E0nyRvWR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E0nyRvWR;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpN26PB4z2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:49:54 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso4480884pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I039xe31Ak5/E+235zwUTSDTerSrz6o+caYlOZbPo68=;
        b=E0nyRvWRepVwbx3YjlXYQxfvHaWGmicXAemkmQ2KiCEDI0PF6u10RPz5i06rNocdLP
         3ac/YfsatNM/hBvo2OGKEI7Yazzto9pDtBheQIikARxZRs44D0o6PgwesRBhrBiDKWkd
         Lj9cCkak5U6QCAigbqQdc3q+TmbNy/iGcCx2C2WgxCGrzotIDhvaP7qZK1ghI7uP4tL9
         wUPUb6S15p+DNk5cyuVOIuZu2zFXfvYo0x1edZiRTBVjQ/p76h1uqH3DEIYZft0Q2lrg
         //0F9R+fDrdbwJhQBZyxLg3ft9ycyvvWELpM5Loy/d7O16bMlrx793JNybo3nkPuJUYt
         rY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I039xe31Ak5/E+235zwUTSDTerSrz6o+caYlOZbPo68=;
        b=wS02/ooq4tJ6vXSoTUOJjVjUPT2JALhHNNzRHIo7WmoGQFp+SxMGCAcCoXebo3zndC
         +SA74pbsGbQz+Y6BXUOe+L8tpl5Yt9PN5Kal37OZcwHFMwrYcaiBdgV3ofCaQWCx8tns
         O3/01uBzYGaNrgDJ9O70PkB9eLB0wZccZOIpcmCN+kKZ50HLK9qcDdedEWBE/eGB7WmA
         +mA2OAMip4DxQPYghPXrLp2WBbH77phInikJ6uPXTWE2RsdOMcXK+iPXoM+Tz9yaYKFD
         FGSKN4rpSvLGsE8+yO0DiyKjX4PBa0k7eKenljqCFxg+6xcOtEZ18cyTEbeswyBPMLuz
         r+Pg==
X-Gm-Message-State: ANoB5pk6YQ6QkC+vUkQhLfpCrilo0PFpvdOXJTkI8UT5/Y2j6n7UyB4t
	Fhr7+LYdgxAh4QgtaVTccL2fUM0u1Yl55g==
X-Google-Smtp-Source: AA0mqf58/6hG/bb7/D4FoGgI5Ocsukk4S3Ul31b6FQx1jyHmTvq8N4ofTRF/pTwwbPTam93I30RL5Q==
X-Received: by 2002:a17:90b:3d8a:b0:20c:4f5b:f6cb with SMTP id pq10-20020a17090b3d8a00b0020c4f5bf6cbmr55727365pjb.153.1669553391869;
        Sun, 27 Nov 2022 04:49:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:49:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/17] KVM: PPC: Book3E: Fix CONFIG_TRACE_IRQFLAGS support
Date: Sun, 27 Nov 2022 22:49:26 +1000
Message-Id: <20221127124942.1665522-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

32-bit does not trace_irqs_off() to match the trace_irqs_on() call in
kvmppc_fix_ee_before_entry(). This can lead to irqs being enabled twice
in the trace, and the irqs-off region between guest exit and the host
enabling local irqs again is not properly traced.

64-bit code does call this, but from asm code where volatiles are live
and so incorrectly get clobbered.

Move the irq reconcile into C to fix both problems.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h    | 12 ++++++++++++
 arch/powerpc/kvm/booke.c              |  3 +++
 arch/powerpc/kvm/bookehv_interrupts.S |  9 ---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bfacf12784dd..eae9619b6190 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -1014,6 +1014,18 @@ static inline void kvmppc_fix_ee_before_entry(void)
 #endif
 }
 
+static inline void kvmppc_fix_ee_after_exit(void)
+{
+#ifdef CONFIG_PPC64
+	/* Only need to enable IRQs by hard enabling them after this */
+	local_paca->irq_happened = PACA_IRQ_HARD_DIS;
+	irq_soft_mask_set(IRQS_ALL_DISABLED);
+#endif
+
+	trace_hardirqs_off();
+}
+
+
 static inline ulong kvmppc_get_ea_indexed(struct kvm_vcpu *vcpu, int ra, int rb)
 {
 	ulong ea;
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 7b4920e9fd26..0dce93ccaadf 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1015,6 +1015,9 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	u32 last_inst = KVM_INST_FETCH_FAILED;
 	enum emulation_result emulated = EMULATE_DONE;
 
+	/* Fix irq state (pairs with kvmppc_fix_ee_before_entry()) */
+	kvmppc_fix_ee_after_exit();
+
 	/* update before a new last_exit_type is rewritten */
 	kvmppc_update_timing_stats(vcpu);
 
diff --git a/arch/powerpc/kvm/bookehv_interrupts.S b/arch/powerpc/kvm/bookehv_interrupts.S
index 8262c14fc9e6..b5fe6fb53c66 100644
--- a/arch/powerpc/kvm/bookehv_interrupts.S
+++ b/arch/powerpc/kvm/bookehv_interrupts.S
@@ -424,15 +424,6 @@ _GLOBAL(kvmppc_resume_host)
 	mtspr	SPRN_EPCR, r3
 	isync
 
-#ifdef CONFIG_64BIT
-	/*
-	 * We enter with interrupts disabled in hardware, but
-	 * we need to call RECONCILE_IRQ_STATE to ensure
-	 * that the software state is kept in sync.
-	 */
-	RECONCILE_IRQ_STATE(r3,r5)
-#endif
-
 	/* Switch to kernel stack and jump to handler. */
 	mr	r3, r4
 	mr	r5, r14 /* intno */
-- 
2.37.2

