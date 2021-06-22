Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483943B024D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:05:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NpL72BQz3f7f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:04:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VndSM+cm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VndSM+cm; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ng006Gcz3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:35 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id l11so7527781pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fKhypOmGQSqqKdatKoUBvryDJM47nxmnuUJKIWQRE4=;
 b=VndSM+cmxnJz9l7hkNaPXyL3YPIHAGHioB8JP+iTxViqsgfcV/aNXftzeoSWUEwdsQ
 vxRpJQYRGqKdW2UXu0IVimKsITvOY3y5oh/WrakwnjQ/dw50nugQRwQAYk3l59RVxbY/
 a6Oq7uBkHWINhWJzZri722LBd35SBwCGaHIrlZFselAe2MRVBGSTjdIvuxBCdBY4QcOI
 zSQsHcFpaZmGRKGyGKnKVLrApEwEmvd7fxX9WVqoBYMCoTmIl6FKvwuPcmZm4IPm2PcU
 grIfKwALAIUkmy1FWxtqomnWAcjFaVNMMcbPiGVwTuX1uFBhzWxHOM/G+f5Ey5B4jFmE
 Rk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1fKhypOmGQSqqKdatKoUBvryDJM47nxmnuUJKIWQRE4=;
 b=ihl8yX3T7b2Fk1If4jvRhEbPTgLAgHcm8RnBFqZFFKwUj9aKqZ4HjcxKmqaSDOJfPk
 1XUHNtfWucmITJuwytXn/yn6i+mGADkDmnTdTYfy+xdu+bMPrmAewU6yHPIS+rmrKG3K
 hn+lRCUtNP+5aEj37NR3uO5NyzSaHG+H91LwGZqaTFFLVGtz80XX4M6ZmubQhxKdxqDa
 ifjUmDi4BgRZLJjCHTV54R0Rjfnml9QA9wn0UBLkK/PCOww0qr4kxIpfaWwPAMxedcJ/
 xJWOrc0oKlaiYxSLcc4Iz7pDVjEFLdPLmKrNOXpFus5IbQU2ebtkg/HysPziFKThHcvQ
 SJlQ==
X-Gm-Message-State: AOAM532QbW5HEVDOUcLnyXeFnkUwahkH3h19ABYr7+gGvdR+0M4jGzIJ
 jZSghpwuQamXmOg3WlVQbfdALtTpHkA=
X-Google-Smtp-Source: ABdhPJzXQr4ULKKE4zJWGEQsRXHbOUH10ZnEyW8QwWcydJZDc5tLxPmzsIMYrrBCRC1eKbRFRWI+RQ==
X-Received: by 2002:a17:90b:1188:: with SMTP id
 gk8mr3196788pjb.138.1624359513032; 
 Tue, 22 Jun 2021 03:58:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 15/43] KVM: PPC: Book3S HV: CTRL SPR does not require
 read-modify-write
Date: Tue, 22 Jun 2021 20:57:08 +1000
Message-Id: <20210622105736.633352-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

Processors that support KVM HV do not require read-modify-write of
the CTRL SPR to set/clear their thread's runlatch. Just write 1 or 0
to it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c            |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0733bb95f439..f0298b286c42 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3920,7 +3920,7 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	 */
 
 	if (!(vcpu->arch.ctrl & 1))
-		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
+		mtspr(SPRN_CTRLT, 0);
 }
 
 static void store_spr_state(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 0eb06734bc26..488a1e07958c 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -775,12 +775,11 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_AMR,r5
 	mtspr	SPRN_UAMOR,r6
 
-	/* Restore state of CTRL run bit; assume 1 on entry */
+	/* Restore state of CTRL run bit; the host currently has it set to 1 */
 	lwz	r5,VCPU_CTRL(r4)
 	andi.	r5,r5,1
 	bne	4f
-	mfspr	r6,SPRN_CTRLF
-	clrrdi	r6,r6,1
+	li	r6,0
 	mtspr	SPRN_CTRLT,r6
 4:
 	/* Secondary threads wait for primary to have done partition switch */
@@ -1209,12 +1208,12 @@ guest_bypass:
 	stw	r0, VCPU_CPU(r9)
 	stw	r0, VCPU_THREAD_CPU(r9)
 
-	/* Save guest CTRL register, set runlatch to 1 */
+	/* Save guest CTRL register, set runlatch to 1 if it was clear */
 	mfspr	r6,SPRN_CTRLF
 	stw	r6,VCPU_CTRL(r9)
 	andi.	r0,r6,1
 	bne	4f
-	ori	r6,r6,1
+	li	r6,1
 	mtspr	SPRN_CTRLT,r6
 4:
 	/*
@@ -2220,8 +2219,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
 	 * Also clear the runlatch bit before napping.
 	 */
 kvm_do_nap:
-	mfspr	r0, SPRN_CTRLF
-	clrrdi	r0, r0, 1
+	li	r0,0
 	mtspr	SPRN_CTRLT, r0
 
 	li	r0,1
@@ -2240,8 +2238,7 @@ kvm_nap_sequence:		/* desired LPCR value in r5 */
 
 	bl	isa206_idle_insn_mayloss
 
-	mfspr	r0, SPRN_CTRLF
-	ori	r0, r0, 1
+	li	r0,1
 	mtspr	SPRN_CTRLT, r0
 
 	mtspr	SPRN_SRR1, r3
-- 
2.23.0

