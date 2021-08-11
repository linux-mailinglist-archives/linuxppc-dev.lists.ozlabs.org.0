Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419653E955D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:03:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF3K0KLRz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:03:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OhMFl8HR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OhMFl8HR; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF1r0VQ5z30G2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:01:51 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id f3so3294484plg.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBUS86yzW++npW3fONJoOYSWPBRI54iAbyTNCBlq0wE=;
 b=OhMFl8HRirrAAMVDyybTuV0EAGt4CgiYNACAlQUI284h4CxKkX2rgbnqjB2AE2yH2a
 RQ7pExWFwFJtK9ol2SixJpujUvcJp76LSbXWZKFhq36PnmDcBbxddt0C45nz/2IF12FF
 rCHfQMaYRUoYpovYL9S41dTR5SA68KZHDcQnq7cG+zA9Z/h5I61AK8kcdOHQ4Q+YkPrn
 mOeTNWtMI3QrpuvYt9YaZxvDn83kamGK0RoAVNXs1WAYDXf0kZM1B62hicW1cfD6ty4m
 MvehYfrq6EpVaSH5+WH1UTFA8BaHa9C+9yv6iG/C+bXRzP2lWDrlusbZxC/9GhN7HA1m
 PpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBUS86yzW++npW3fONJoOYSWPBRI54iAbyTNCBlq0wE=;
 b=HivsDbvR1P3dusChhNvTlMAd2wM9WICRdCrx1sPGhQ3IEDVKEZWRUpXDmyB5t1kxp4
 qB4jWDzGTzQDEIjMPLB7WbUEX24yZnOGEdr30TzulJfJvbLxj4+nRWFxm6DLOjnz7fH1
 Q6eCnofYI06VXJBRdm/UA81D/djRVS0EvN0SIizC/HV6yvAOwDu4yQhLrEA80FQ/NXYM
 dadikBX9YEO0afcuxKIVu9MwcM4nMrZ5tOWl1WshRUOhHZxExWjmd3BJr4xg+vbIwW/h
 dH3Os4jKSUhWB7bN2KxdPxswrTkR+FxbbenDE0a0CpQuUHFJDkcOcaelAIxScLCRXVk1
 RrUg==
X-Gm-Message-State: AOAM5318k0jJVQayfhqfQhYBlhhCOsKhlJtFbfFLCPX7/yllwITThCqA
 9MADMwPRHnJl3H3IcrNq7xg=
X-Google-Smtp-Source: ABdhPJyGesYYVuFvADexHokYQDJijjGlMpUAGoYMGGFnjf/wHnSaka9QLjpwaUNrFGsegQX5b2QRVA==
X-Received: by 2002:a17:902:b947:b029:12c:b414:a018 with SMTP id
 h7-20020a170902b947b029012cb414a018mr15908883pls.30.1628697709608; 
 Wed, 11 Aug 2021 09:01:49 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:01:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 02/60] KVM: PPC: Book3S HV: Remove TM emulation from
 POWER7/8 path
Date: Thu, 12 Aug 2021 02:00:36 +1000
Message-Id: <20210811160134.904987-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TM fake-suspend emulation is only used by POWER9. Remove it from the old
code path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 42 -------------------------
 1 file changed, 42 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 8dd437d7a2c6..75079397c2a5 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1088,12 +1088,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	cmpwi	r12, BOOK3S_INTERRUPT_H_INST_STORAGE
 	beq	kvmppc_hisi
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	/* For softpatch interrupt, go off and do TM instruction emulation */
-	cmpwi	r12, BOOK3S_INTERRUPT_HV_SOFTPATCH
-	beq	kvmppc_tm_emul
-#endif
-
 	/* See if this is a leftover HDEC interrupt */
 	cmpwi	r12,BOOK3S_INTERRUPT_HV_DECREMENTER
 	bne	2f
@@ -1599,42 +1593,6 @@ maybe_reenter_guest:
 	blt	deliver_guest_interrupt
 	b	guest_exit_cont
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-/*
- * Softpatch interrupt for transactional memory emulation cases
- * on POWER9 DD2.2.  This is early in the guest exit path - we
- * haven't saved registers or done a treclaim yet.
- */
-kvmppc_tm_emul:
-	/* Save instruction image in HEIR */
-	mfspr	r3, SPRN_HEIR
-	stw	r3, VCPU_HEIR(r9)
-
-	/*
-	 * The cases we want to handle here are those where the guest
-	 * is in real suspend mode and is trying to transition to
-	 * transactional mode.
-	 */
-	lbz	r0, HSTATE_FAKE_SUSPEND(r13)
-	cmpwi	r0, 0		/* keep exiting guest if in fake suspend */
-	bne	guest_exit_cont
-	rldicl	r3, r11, 64 - MSR_TS_S_LG, 62
-	cmpwi	r3, 1		/* or if not in suspend state */
-	bne	guest_exit_cont
-
-	/* Call C code to do the emulation */
-	mr	r3, r9
-	bl	kvmhv_p9_tm_emulation_early
-	nop
-	ld	r9, HSTATE_KVM_VCPU(r13)
-	li	r12, BOOK3S_INTERRUPT_HV_SOFTPATCH
-	cmpwi	r3, 0
-	beq	guest_exit_cont		/* continue exiting if not handled */
-	ld	r10, VCPU_PC(r9)
-	ld	r11, VCPU_MSR(r9)
-	b	fast_interrupt_c_return	/* go back to guest if handled */
-#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-
 /*
  * Check whether an HDSI is an HPTE not found fault or something else.
  * If it is an HPTE not found fault that is due to the guest accessing
-- 
2.23.0

