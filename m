Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C303D51B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5Zh5YR7z3bmh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gZHMKKZ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gZHMKKZ8; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Yj38lKz2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:50:49 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id mt6so11145907pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBUS86yzW++npW3fONJoOYSWPBRI54iAbyTNCBlq0wE=;
 b=gZHMKKZ8Bwij9kIOUgjyL2u2T9r766e2UvTf+se7ksIInEfRWZIvTBfMb5f9Ro7nCL
 39LTzq781qnnwdcpe3uSm9B61p86wAxvCfuFtXutFNs5ftedtFl5UCJTNwSKFZl1VLi1
 EB8YfhZU7Nkormc75q3pjUcW+J+sbAr5/a754rLtR6Z5W/FMhIcMN2j9kIRpcZd2s1MN
 Xx/3Qo6Iu5LGXoTPSEd++CUl21G7JAmEGkUaw0trW+IxDwWYwT0w28R5TuTXEv/+24GR
 M3xNyjdTcrCvnI2Mk2VmoB0f/L0BhTIEP7BZoexp9Y/eWAneVEPljKBGKJDIG9P2wZX3
 tRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBUS86yzW++npW3fONJoOYSWPBRI54iAbyTNCBlq0wE=;
 b=rpA9JBrhIeJbmf63pHPq3djJ9xcHgIlaG+EWmTM6xlNfCpeQ/YkyjIhmtjnmzE2k7c
 gP3uMYe62t7FF746t1AtTAYM6JM2kA4H8Kuo7ytlEtsoTbkSFSG7+aQplZ34hxdxWVdh
 OZhgDoUANfB1AzFzD5eYziL2mr2e3BySKUi/gX1A2tdc63ydAjwLbgJBnYvds9Jr1Ndd
 3f540s+boDy2NTT3i+YmNe3ekmSphpwYcWZt7q+nY2IFgsr3oY3P2cpm2yLjWCfctAVd
 12K7I/7POoCPdFP60Yh3+pSu5n/PeKIREqkXj++8GzdWabFI8UdHLoI77IJszRezjqub
 whVw==
X-Gm-Message-State: AOAM532K929RftJZpQ5WqkCQRF2S5wiPibJIMoE2qPsrUmdIr9j1szVk
 udWtQ+MiARetyHwbt3YVazI=
X-Google-Smtp-Source: ABdhPJz3trP7pDym2e415b3RsbmZOL9WcoANJnLcFx883v2fnv5zGIksLxn8S+G332jFZlwJE1wybQ==
X-Received: by 2002:a05:6a00:1582:b029:332:67bf:c196 with SMTP id
 u2-20020a056a001582b029033267bfc196mr16147180pfk.52.1627271446786; 
 Sun, 25 Jul 2021 20:50:46 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:50:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 01/55] KVM: PPC: Book3S HV: Remove TM emulation from
 POWER7/8 path
Date: Mon, 26 Jul 2021 13:49:42 +1000
Message-Id: <20210726035036.739609-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

