Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136F459FBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz08n63LYz3fKL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n0gtBFzZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n0gtBFzZ; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzwf5NbZz3blF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:22 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso2426401pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C0Vx5QDEi//yb5cKe0FcdYzP1UisnVWRJf8gq50iD80=;
 b=n0gtBFzZQqaMneQm09S0zuGnVEG3LR0/+6an6MM72jKK01r/dshFoV9iwQEzqkqHaD
 33Nirtnkk3y84V+plKAO7s1epYLLTXkgSd7LTYW559DV9cqTljo4c5IIP2QY5EjY7PE3
 yCDKC3q4ADzmhiFGWDB26a+gB/+6X8a3sgv6yAxBa3uZt4IeNwhlVYxaHSxGzEdBoT8A
 b6PaNaBrHn6tTdOhR1hFCOe2x2Rf/zdPP3am1I7kFmz/w2Ru/Fx/HBUloNbAvVenKBoU
 fuirwXRAOFcFYJPzFdVy47lLexp2bA5TU8/ob7B+PJybCLm2nw/thWiy89+TY54KZd1A
 hkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C0Vx5QDEi//yb5cKe0FcdYzP1UisnVWRJf8gq50iD80=;
 b=76cR8y633f2j78sqVJDlMVrAJ+AJv/j9RLFSD68hpd5OtJX9R4talKWdvwN59WGig/
 +a1vAzyncMsfZQ3Lg7KM87u3lFM+628rZJRWFM0jRMSs34jNhQnTv/cdjknTo3+MTNn0
 d4N2hzWFXNakQyCbX0FxkbKF0YG7aKaMd9/GAlk9+dIU4qjMkcT66gcoN/9/tGTNdRxv
 c5VSfkycE0Zp5P54S5t+/DAJl/NIi/9Wl6m8G/l0ZpKDn1kx/kuu/H2AOl/p/irNtlg4
 caDWYbFYxSWYNfv4VKTAjuPJvbJTNAImOJUf5cOpK/xap8+Gu2aeQu6duG8B6DKjwsG8
 W29w==
X-Gm-Message-State: AOAM531ZWIIBpoWJsn5RGfuaS3lzf73k9X7wuE15vQLBhUU9h768AJCb
 xSQin0xrdGty5rLcivslUxTJy3TNgJBOEQ==
X-Google-Smtp-Source: ABdhPJxVARfOkTw3ypa59nQQyhQse8Z9PPJ60EeVczjeG39kZM9kaDssKNCa75Ka1NhhVo0S7h2RwA==
X-Received: by 2002:a17:903:408d:b0:142:22f1:5886 with SMTP id
 z13-20020a170903408d00b0014222f15886mr4879840plc.34.1637661200900; 
 Tue, 23 Nov 2021 01:53:20 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 17/53] KVM: PPC: Book3S HV: CTRL SPR does not require
 read-modify-write
Date: Tue, 23 Nov 2021 19:51:55 +1000
Message-Id: <20211123095231.1036501-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Processors that support KVM HV do not require read-modify-write of
the CTRL SPR to set/clear their thread's runlatch. Just write 1 or 0
to it.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c            |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bbaf018dcb67..e4fb36871ce4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4071,7 +4071,7 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	 */
 
 	if (!(vcpu->arch.ctrl & 1))
-		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
+		mtspr(SPRN_CTRLT, 0);
 }
 
 static void store_spr_state(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index a454d65e6353..be79ae7afdf5 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -781,12 +781,11 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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
@@ -2184,8 +2183,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
 	 * Also clear the runlatch bit before napping.
 	 */
 kvm_do_nap:
-	mfspr	r0, SPRN_CTRLF
-	clrrdi	r0, r0, 1
+	li	r0,0
 	mtspr	SPRN_CTRLT, r0
 
 	li	r0,1
@@ -2204,8 +2202,7 @@ kvm_nap_sequence:		/* desired LPCR value in r5 */
 
 	bl	isa206_idle_insn_mayloss
 
-	mfspr	r0, SPRN_CTRLF
-	ori	r0, r0, 1
+	li	r0,1
 	mtspr	SPRN_CTRLT, r0
 
 	mtspr	SPRN_SRR1, r3
-- 
2.23.0

