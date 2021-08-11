Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF23E95C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:18:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFNr6VTKz3cXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:18:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tEdIQaqs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tEdIQaqs; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF310FGLz3cn7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:52 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id t3so3268431plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0d0iaopUkL57P/YF2EiZzRzVhFFGYIegIp/ZQI3dO8=;
 b=tEdIQaqs2HRZCjge8fh1ibXHwlZC+5KChx8ndqotUyE69jWlERwDq7ecjhtfEBxaBq
 K9O8G/N6GpS9Yc6P16JFFjYuO0HTfWNOe1PWBe3+7Wt1nfPFR+K5M80NCIAqLtz979kP
 /i2b+qbrFPNc0NgluKbYwJG5PHIAVKQxwOMgPepDqWo/STuhyDM0vLLizY6OeqTClPMU
 ugyDxaqDn6bYXm6dmnwEeGyNRKePgbpwtSSQ0Tyb07jyo0k7OWn/BDhKBjSks58uB/8n
 G6ToDuGVYYcnT2gswCIC9QbM/wYQYvg6b3ReZxeJ2xkpjY4E3zLaoqH8tt5iAdXL4liF
 GlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0d0iaopUkL57P/YF2EiZzRzVhFFGYIegIp/ZQI3dO8=;
 b=Enm1UZUKZL0pCfhB9ZoBuUxjF5HUrpP+i5CswE3z3r8V7QvP8TQllxtGaloSg5iGHH
 wRSGGoZ82k+aFSroONe+En9wbsdIqP21m8yeLo1FAwJcmxZTGtjbFQHbXiFkNpzepezk
 UFQ2AF/TDR/DVhxKkS+pyK4opbIch6Rnw4XOhZTIefa6Gn/xNXtRQSmuuZuoznA07Eii
 lw39CbbJVSrluro2b0PIB7tWW+mGWXajpkkOpPFNmn2x4zsP/r/Q1yxmHPAhccgaaYS6
 WUXijT1RuZGyfLxjbo2pqG7ftWkUF+lFiHKMUsJMyn86ND8lOLFymKJ06J2iNTyu229E
 JraA==
X-Gm-Message-State: AOAM532y2lEl1Z/mg5BnUacTmk5s1WKVakuNGqCD895spGnidTXxcOe7
 +sgCSNH8Dl9yDV3ncg+KLt8=
X-Google-Smtp-Source: ABdhPJzd+cZm7lc8lSMZdvmG9Mg0irEwwXBZrOzKs7aJnrs7cThmGx00AGnzug/cEOiJRet08RQRpQ==
X-Received: by 2002:a17:90a:a091:: with SMTP id
 r17mr4239723pjp.56.1628697770805; 
 Wed, 11 Aug 2021 09:02:50 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 25/60] KVM: PPC: Book3S HV: CTRL SPR does not require
 read-modify-write
Date: Thu, 12 Aug 2021 02:00:59 +1000
Message-Id: <20210811160134.904987-26-npiggin@gmail.com>
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

Processors that support KVM HV do not require read-modify-write of
the CTRL SPR to set/clear their thread's runlatch. Just write 1 or 0
to it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c            |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index fa12a3efeeb2..f9942eeaefd3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4060,7 +4060,7 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	 */
 
 	if (!(vcpu->arch.ctrl & 1))
-		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
+		mtspr(SPRN_CTRLT, 0);
 }
 
 static void store_spr_state(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 551ce223b40c..05be8648937d 100644
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
@@ -1203,12 +1202,12 @@ guest_bypass:
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
@@ -2178,8 +2177,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
 	 * Also clear the runlatch bit before napping.
 	 */
 kvm_do_nap:
-	mfspr	r0, SPRN_CTRLF
-	clrrdi	r0, r0, 1
+	li	r0,0
 	mtspr	SPRN_CTRLT, r0
 
 	li	r0,1
@@ -2198,8 +2196,7 @@ kvm_nap_sequence:		/* desired LPCR value in r5 */
 
 	bl	isa206_idle_insn_mayloss
 
-	mfspr	r0, SPRN_CTRLF
-	ori	r0, r0, 1
+	li	r0,1
 	mtspr	SPRN_CTRLT, r0
 
 	mtspr	SPRN_SRR1, r3
-- 
2.23.0

