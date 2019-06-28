Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B92859454
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:42:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnJF4FDLzDql5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="if6Sop4w"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zn5h2bxwzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:33:28 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i189so2439298pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKQ28PsOrExIMvOIkgL8UCit8oSc6cjfhEUjb6eXWI0=;
 b=if6Sop4wPrm5bxneGPAj4vz2EVaOBPBzs2hM2kf0Dct+1yDyb/wDZOf639EaSV/Lr8
 aRYmrUkH2rpuLbMNc7xDXHxrScyL8+lXEc8syxOsbXJGqS02p9uuEk/5USC2R+6pn9WZ
 V1KOoFGbnDDISvXlLfXMfjtV/Q2+Gv6OxcvUoO49GB6oZ8hW8r6Frgidh1o9GYdEKA0c
 FIGhukgZ22YptqTmaemTjCPvvV9irwm7e3dU57xUB7dlf/XOMEL0bZjuuAXZeqQqwebi
 ImY+V2adDNcIh7jKakKD0dWKvpdVdOAUdPHtjUS4HjFbDqm2UL8LVgeeYwfpaP2YG6HP
 VhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DKQ28PsOrExIMvOIkgL8UCit8oSc6cjfhEUjb6eXWI0=;
 b=Q1HhwMwhiwB/U9U4CZXWv7MHIDC23p/k4rndNdO+lOdyxOxL5o8jiTew6lVCt80aRr
 0aShevO5FWmy9cWCT/rCpZx/N0XQ1+Unio6L4wNBOkyjWQ9DqKuc8DaAUPSWj98hcgGR
 k79Zz3zx+8UZ5SEGwNnB3t5jp3IymY/tP7KLEkau+nqh3tckmzScEJY+yINwLmiklF2x
 01gSf8Tu4Von9tlFPkpqHuLBKCuhi6pr5J2FQ0BDzJijuuUKLt5m+2D4YUl5nW4lwbP3
 PmQc5+azL+KlwE3FYjtxlk91zdlhbOMSpLPdSFIGzpukRsb0EbknE7Iz/G87k1i4grZ9
 qxsw==
X-Gm-Message-State: APjAAAXt0TqcMQR4YDGAoaRQjn0JVUkB0KloPIA8iwE2POoEIYtHeUO+
 ECs1BjHrHY90hHyw16GUaGjWFFbU
X-Google-Smtp-Source: APXvYqwbjKrCJCQ898mmOPiqcu6/kHn/J9NA0rfMdxI/+VASxS/GycYK52FRoPyBw1+xiAIVTgguVQ==
X-Received: by 2002:a65:5304:: with SMTP id m4mr7636095pgq.126.1561703605670; 
 Thu, 27 Jun 2019 23:33:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h14sm1071500pfq.22.2019.06.27.23.33.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 23:33:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/64s/exception: simplify hmi control flow
Date: Fri, 28 Jun 2019 16:33:22 +1000
Message-Id: <20190628063322.11628-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628063322.11628-1-npiggin@gmail.com>
References: <20190628063322.11628-1-npiggin@gmail.com>
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

Branch to the relocated 0xc000 address early (still in real mode), to
simplify subsequent branches. Have the virt mode handler avoid just
'windup' and redo the exception from scratch, rather than branching
back to the trampoline.

Rearrange the stack setup instruction location to match the system
reset handler (e.g., right before EXCEPTION_PROLOG_COMMON).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 23aba27b2f59..a91541956aa0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -260,17 +260,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtctr	reg;							\
 	bctr
 
-#ifdef CONFIG_RELOCATABLE
-#define BRANCH_LINK_TO_FAR(label)					\
-	__LOAD_FAR_HANDLER(r12, label);					\
-	mtctr	r12;							\
-	bctrl
-
-#else
-#define BRANCH_LINK_TO_FAR(label)					\
-	bl	label
-#endif
-
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -1713,22 +1702,26 @@ EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	hmi_exception_early
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
-__TRAMP_REAL_OOL_MASKABLE_HV(hmi_exception, 0xe60, IRQS_DISABLED)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
 TRAMP_REAL_BEGIN(hmi_exception_early)
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0, 0, 0
+	mfctr	r10			/* save ctr, even for !RELOCATABLE */
+	BRANCH_TO_C000(r11, hmi_exception_early_common)
+
+EXC_COMMON_BEGIN(hmi_exception_early_common)
+	mtctr	r10			/* Restore ctr */
+	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
-	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
 	EXCEPTION_PROLOG_COMMON_2(PACA_EXGEN)
 	EXCEPTION_PROLOG_COMMON_3(0xe60)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	BRANCH_LINK_TO_FAR(DOTSYM(hmi_exception_realmode)) /* Function call ABI */
+	bl	hmi_exception_realmode
 	cmpdi	cr0,r3,0
 	bne	1f
 
@@ -1742,7 +1735,8 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	 */
 	EXCEPTION_RESTORE_REGS EXC_HV
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	b	tramp_real_hmi_exception
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0, 0, IRQS_DISABLED
+	EXCEPTION_PROLOG_2_REAL hmi_exception_common, EXC_HV, 1
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xe60)
-- 
2.20.1

