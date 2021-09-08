Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D597A4037B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 12:18:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4J4L4xVFz2yS9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 20:18:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d1FDrK4D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d1FDrK4D; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4J3g38Tbz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 20:17:33 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id q22so1669901pfu.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Sep 2021 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZpvq7x2lHuZWsil0sfaEPemJ8g24kmEc0HiGKQSHYo=;
 b=d1FDrK4DwZVEKSJ+CCu2erJOj3mUVKWHDH4jl0iZnD/kwWvbrAenl2iXvHL4U795hF
 STP8lnfwJzuw2GSezB2N6ayq8FbHEQnacWEOA4mkLCyAzGflTBviGZ1dYKxihLUHRdBT
 VYjzuVytNWpwMIx64AOihV2JCvvadFbvO0OtSi5uwGfePngQZfQdcFyBKTtypZV46qNM
 fDXYfbyt7ATTqwIkBZUfAypXbw6nfr4o4YwgMVHEc6e1tPW4cOimTHvx88goHbV23EVU
 EoIElQcP4Vsv7dPsb2x+aogFTWVO4i33C0eIUIiBxQYcXlqf//baRBqY0uAIq+A3Z1ej
 4bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZpvq7x2lHuZWsil0sfaEPemJ8g24kmEc0HiGKQSHYo=;
 b=yuLH8GrqagvxK8N5gHTS8ZQ1MRwOZ1jlDPTJrNO9uxx+4VXSv34A2G6GIA18URqc0m
 Ghg7EPKvywDgfz5zQdFGsYS67z+3T97dxqwBZ2li+UcFu+U8Mhn1S+A9lrZr9ByQMx+I
 ygrU5bFAV3Vk0465bPqG8N76CtgKtdkhoDdUcN/IOHpUm2mkWQP0//kZg7ApL4IFnV/B
 OmoOP/X9o0udIG4P3icdNe7Kf9HMYKStdIVW1RSiMwpxJPkSdpvwFyXk7ic3OpDddbIE
 U7nxvTot9hnuBKjhuWd8Ml4SVDEA7e+TDUOVo2zLheVDK8osyip7sF4N/cP93/9wctrM
 oL/A==
X-Gm-Message-State: AOAM533XWHHHuVZOjhyQn+jYytzdnND1uOM8mMMteja22yit5aO0GSmW
 I3v6OsdO2Oxv9VAU0P0DMHovNemKvO0=
X-Google-Smtp-Source: ABdhPJyiU+4j19v7oPN6Tl7GXyP+OVn/YtiRXqPOSVzWdoiB0Z3l1smI2rJU0h0lE/IZQupm+24FrQ==
X-Received: by 2002:a63:1358:: with SMTP id 24mr2913654pgt.327.1631096251508; 
 Wed, 08 Sep 2021 03:17:31 -0700 (PDT)
Received: from bobo.ibm.com (115-64-207-17.tpgi.com.au. [115.64.207.17])
 by smtp.gmail.com with ESMTPSA id bj13sm1722019pjb.28.2021.09.08.03.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:17:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/2] KVM: PPC: Book3S HV: Tolerate treclaim. in
 fake-suspend mode changing registers
Date: Wed,  8 Sep 2021 20:17:18 +1000
Message-Id: <20210908101718.118522-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210908101718.118522-1-npiggin@gmail.com>
References: <20210908101718.118522-1-npiggin@gmail.com>
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
Cc: Eirik Fuller <efuller@redhat.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER9 DD2.2 and 2.3 hardware implements a "fake-suspend" mode where
certain TM instructions executed in HV=0 mode cause softpatch interrupts
so the hypervisor can emulate them and prevent problematic processor
conditions. In this fake-suspend mode, the treclaim. instruction does
not modify registers.

Unfortunately the rfscv instruction executed by the guest do not
generate softpatch interrupts, which can cause the hypervisor to lose
track of the fake-suspend mode, and it can execute this treclaim. while
not in fake-suspend mode. This modifies GPRs and crashes the hypervisor.

It's not trivial to disable scv in the guest with HFSCR now, because
they assume a POWER9 has scv available. So this fix saves and restores
checkpointed registers across the treclaim.

Fixes: 7854f7545bff ("KVM: PPC: Book3S: Rework TM save/restore code and make it C-callable")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 36 +++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 8dd437d7a2c6..dd18e1c44751 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2578,7 +2578,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
 	/* The following code handles the fake_suspend = 1 case */
 	mflr	r0
 	std	r0, PPC_LR_STKOFF(r1)
-	stdu	r1, -PPC_MIN_STKFRM(r1)
+	stdu	r1, -TM_FRAME_SIZE(r1)
 
 	/* Turn on TM. */
 	mfmsr	r8
@@ -2593,10 +2593,42 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_P9_TM_XER_SO_BUG)
 	nop
 
+	/*
+	 * It's possible that treclaim. may modify registers, if we have lost
+	 * track of fake-suspend state in the guest due to it using rfscv.
+	 * Save and restore registers in case this occurs.
+	 */
+	mfspr	r3, SPRN_DSCR
+	mfspr	r4, SPRN_XER
+	mfspr	r5, SPRN_AMR
+	/* SPRN_TAR would need to be saved here if the kernel ever used it */
+	mfcr	r12
+	SAVE_NVGPRS(r1)
+	SAVE_GPR(2, r1)
+	SAVE_GPR(3, r1)
+	SAVE_GPR(4, r1)
+	SAVE_GPR(5, r1)
+	stw	r12, 8(r1)
+	std	r1, HSTATE_HOST_R1(r13)
+
 	/* We have to treclaim here because that's the only way to do S->N */
 	li	r3, TM_CAUSE_KVM_RESCHED
 	TRECLAIM(R3)
 
+	GET_PACA(r13)
+	ld	r1, HSTATE_HOST_R1(r13)
+	REST_GPR(2, r1)
+	REST_GPR(3, r1)
+	REST_GPR(4, r1)
+	REST_GPR(5, r1)
+	lwz	r12, 8(r1)
+	REST_NVGPRS(r1)
+	mtspr	SPRN_DSCR, r3
+	mtspr	SPRN_XER, r4
+	mtspr	SPRN_AMR, r5
+	mtcr	r12
+	HMT_MEDIUM
+
 	/*
 	 * We were in fake suspend, so we are not going to save the
 	 * register state as the guest checkpointed state (since
@@ -2624,7 +2656,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_P9_TM_XER_SO_BUG)
 	std	r5, VCPU_TFHAR(r9)
 	std	r6, VCPU_TFIAR(r9)
 
-	addi	r1, r1, PPC_MIN_STKFRM
+	addi	r1, r1, TM_FRAME_SIZE
 	ld	r0, PPC_LR_STKOFF(r1)
 	mtlr	r0
 	blr
-- 
2.23.0

