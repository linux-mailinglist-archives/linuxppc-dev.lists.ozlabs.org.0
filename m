Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3B2F99F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 07:35:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK2930tplzDrBr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 17:35:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IRKw4e4t; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK20m68KZzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 17:28:24 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id f63so1795873pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 22:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXaTZ2SGwG1cE+iI7Sy2bmCo1yKmf961EI27ucblZh4=;
 b=IRKw4e4tDWXh4pqfVmo2G+R5JjX3xazmyrDoBVbDdHEbGeldFpI2xg2YNmNqwUyYom
 NqETqxRjqnwAWsuigKOtbe8tSI0xcf5UqWYQ9/qhppex3FZqU7WoYCjDxMJnBvQBZRF8
 N9eW8gcIvcJoltTkfxxCHN7P6FOVihuE422dzhyrbnyqwpUB9CTB0T1UZCRWMZhqerkd
 24xSeT1evxNOhhvtlXPil17n11Qtj9b3NPSMYVXF4MYkWkoUSw9/dCJOZ/IlPWdqFMFD
 Lr4HTI1hExSlwZTxJw+qbfMk5R6IFu9AVOQgsuhSjCvyvDYfDTO68QIZzv0IbpmaaWLs
 qi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXaTZ2SGwG1cE+iI7Sy2bmCo1yKmf961EI27ucblZh4=;
 b=ZtU91AG8ajxS/W/OgneiKRk01ItLLWCzNrMr7Em/9mjV5RRolar6Ld+i5+56FfkF43
 Kf/nlVcwMH6rwwqDMgRnLaheSZsWGkB1+7HpDmP2Xvp7gZdkFnPlVpPBLm7uJ7c1jk/A
 J3P2rZghm+Wm7pAh8lxJE/TAc5mhsv0XXN6afbIweewKF+Ok5fvex2wA+nVfhuekV2T+
 +r8uXaGbhwqgHFSNDiLdXMLUc68eq5IpVoz1fFrvNvCyvSJgkYhAejdBEUXySwls9JXq
 7yRdkFRaMG1YeheWpNltCZ/QKSuztHW6qA3DwfkYv8ht+I4yB6vGoQX1/m3u7aXd5XPt
 enNg==
X-Gm-Message-State: AOAM533Q9WxOY7zxlCDflXdF6Ms+7uSvQGQbVS4SPO5Z6bb21Bl91GTj
 6eJRqd6gmE8lx916Qr5vBFk=
X-Google-Smtp-Source: ABdhPJxGh8qEA/O08tQng/lZyfyoQ2G9xC5NxXCawABM83Yk/uUVzwuGbsUqRmfVExHJdCxnAG803w==
X-Received: by 2002:a63:e24a:: with SMTP id y10mr9851779pgj.413.1610951301726; 
 Sun, 17 Jan 2021 22:28:21 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id w25sm8502318pfg.103.2021.01.17.22.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 22:28:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 2/4] KVM: PPC: Book3S HV: Fix radix guest SLB side channel
Date: Mon, 18 Jan 2021 16:28:07 +1000
Message-Id: <20210118062809.1430920-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210118062809.1430920-1-npiggin@gmail.com>
References: <20210118062809.1430920-1-npiggin@gmail.com>
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

The slbmte instruction is legal in radix mode, including radix guest
mode. This means radix guests can load the SLB with arbitrary data.

KVM host does not clear the SLB when exiting a guest if it was a
radix guest, which would allow a rogue radix guest to use the SLB as
a side channel to communicate with other guests.

Fix this by ensuring the SLB is cleared when coming out of a radix
guest. Only the first 4 entries are a concern, because radix guests
always run with LPCR[UPRT]=1, which limits the reach of slbmte. slbia
is not used (except in a non-performance-critical path) because it
can clear cached translations.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 39 ++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d5a9b57ec129..0e1f5bf168a1 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1157,6 +1157,20 @@ EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9)
 	mr	r4, r3
 	b	fast_guest_entry_c
 guest_exit_short_path:
+	/*
+	 * Malicious or buggy radix guests may have inserted SLB entries
+	 * (only 0..3 because radix always runs with UPRT=1), so these must
+	 * be cleared here to avoid side-channels. slbmte is used rather
+	 * than slbia, as it won't clear cached translations.
+	 */
+	li	r0,0
+	slbmte	r0,r0
+	li	r4,1
+	slbmte	r0,r4
+	li	r4,2
+	slbmte	r0,r4
+	li	r4,3
+	slbmte	r0,r4
 
 	li	r0, KVM_GUEST_MODE_NONE
 	stb	r0, HSTATE_IN_GUEST(r13)
@@ -1469,7 +1483,7 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	lbz	r0, KVM_RADIX(r5)
 	li	r5, 0
 	cmpwi	r0, 0
-	bne	3f			/* for radix, save 0 entries */
+	bne	0f			/* for radix, save 0 entries */
 	lwz	r0,VCPU_SLB_NR(r9)	/* number of entries in SLB */
 	mtctr	r0
 	li	r6,0
@@ -1490,12 +1504,9 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	slbmte	r0,r0
 	slbia
 	ptesync
-3:	stw	r5,VCPU_SLB_MAX(r9)
+	stw	r5,VCPU_SLB_MAX(r9)
 
 	/* load host SLB entries */
-BEGIN_MMU_FTR_SECTION
-	b	0f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	ld	r8,PACA_SLBSHADOWPTR(r13)
 
 	.rept	SLB_NUM_BOLTED
@@ -1508,7 +1519,17 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	slbmte	r6,r5
 1:	addi	r8,r8,16
 	.endr
-0:
+	b	guest_bypass
+
+0:	/* Sanitise radix guest SLB, see guest_exit_short_path comment. */
+	li	r0,0
+	slbmte	r0,r0
+	li	r4,1
+	slbmte	r0,r4
+	li	r4,2
+	slbmte	r0,r4
+	li	r4,3
+	slbmte	r0,r4
 
 guest_bypass:
 	stw	r12, STACK_SLOT_TRAP(r1)
@@ -3302,12 +3323,14 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 	mtspr	SPRN_CIABR, r0
 	mtspr	SPRN_DAWRX0, r0
 
+	/* Clear hash and radix guest SLB, see guest_exit_short_path comment. */
+	slbmte	r0, r0
+	slbia
+
 BEGIN_MMU_FTR_SECTION
 	b	4f
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 
-	slbmte	r0, r0
-	slbia
 	ptesync
 	ld	r8, PACA_SLBSHADOWPTR(r13)
 	.rept	SLB_NUM_BOLTED
-- 
2.23.0

