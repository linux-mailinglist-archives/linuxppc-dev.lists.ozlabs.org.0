Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99B4C77A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:27:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsLy57TTzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:27:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VwWE6BLm"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmH35rvzDqvg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:15 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id l19so915287pgh.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/8SeENql3Tp5GuaC3FVPfl0no1Zcv/u5EAttXo961A=;
 b=VwWE6BLm7Vi1INGPBmf+1Yr4nFP1qgBPaR7sQSB10vSY5miGvEKWde/1B7SB9n76iy
 Hhaj3GlKn3MC2iXQJRzPz3Yp7FWvuHQtaZks4k+k7LfE5UxCol/szdUPrO482cC5mDrg
 6iMiBSHGc1DA1ayiKzKlEpIpdjdubUlcubbQ+wo4XhaESeRe9hm4hQ5IwmIrUxxFxSgY
 DddMtt77yfLXFNJ/lahBWjSpL8+sXkmqEXC8QzcvWpTXvVs9k7QpHhaJ5GLqFLzII/bR
 9/Bhnjfu+Zg/zAEtd2MxYedWKc+5n7SWXDMedSoU3ClmT5wIxJSyttx958+TcGK75vWg
 22Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/8SeENql3Tp5GuaC3FVPfl0no1Zcv/u5EAttXo961A=;
 b=G6212CNtyP4tHSJu5mI5s/hxHH6VaiTKuu2D0twmeZraSupHKnFThqqgsmSgA9Ljoa
 VbVajJuKXGdwuin9OmhBe0G4KrAscb0YUxMrAjgb1YDkUgA4/dAeNw8OFQfUBHZggHB9
 jWn34IchlmEbcE0a4x6yP7c5yu2EszCyQkTLgK/LDZWyoOObvHiygAp9JsUdWfzMRXnq
 qoxeh5e4tSKxXFdlUz/yUxW6l9MEqZRcPdAlBVUB+HQJipZ8tfFi5zOy3ERAg66g7V3k
 +Yxs8rxCzLCMz5uivYmCwx8trzLJYhEU+CXw5vWc/jHBmPmXJt2cYha6KOwgkCj3bZ7F
 l+Ww==
X-Gm-Message-State: APjAAAXs3JpN4VKLbTNN5Oe8TA4/IAT85Oq4gU295VN3gm81IS1UQUgc
 nz838VDxCmE/DcyQVszgs9E8EBnQ
X-Google-Smtp-Source: APXvYqyXUT79kQ/piPbaofTii+zMmNUR/s8hD6ZcG98fHw+nMWZ4ch/aAbfrZtdejbAzz8kGKmHE3w==
X-Received: by 2002:a62:5214:: with SMTP id g20mr74651710pfb.187.1561007772614; 
 Wed, 19 Jun 2019 22:16:12 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 34/52] powerpc/64s/exception: simplify hmi windup code
Date: Thu, 20 Jun 2019 15:14:41 +1000
Message-Id: <20190620051459.29573-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

Duplicate the hmi windup code for both cases, rather than to put a
special case branch in the middle of it. Remove unused label. This
helps with later code consolidation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index cf89d728720a..3476cffa21b8 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1776,6 +1776,7 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	BRANCH_LINK_TO_FAR(DOTSYM(hmi_exception_realmode)) /* Function call ABI */
 	cmpdi	cr0,r3,0
+	bne	1f
 
 	/* Windup the stack. */
 	/* Move original HSRR0 and HSRR1 into the respective regs */
@@ -1794,13 +1795,28 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	REST_GPR(10, r1)
 	ld	r11,_CCR(r1)
 	REST_2GPRS(12, r1)
-	bne	1f
 	mtcr	r11
 	REST_GPR(11, r1)
 	ld	r1,GPR1(r1)
 	HRFI_TO_USER_OR_KERNEL
 
-1:	mtcr	r11
+1:
+	ld	r9,_MSR(r1)
+	mtspr	SPRN_HSRR1,r9
+	ld	r9,_NIP(r1)
+	mtspr	SPRN_HSRR0,r9
+	ld	r9,_CTR(r1)
+	mtctr	r9
+	ld	r9,_XER(r1)
+	mtxer	r9
+	ld	r9,_LINK(r1)
+	mtlr	r9
+	REST_GPR(0, r1)
+	REST_8GPRS(2, r1)
+	REST_GPR(10, r1)
+	ld	r11,_CCR(r1)
+	REST_2GPRS(12, r1)
+	mtcr	r11
 	REST_GPR(11, r1)
 	ld	r1,GPR1(r1)
 
@@ -1808,8 +1824,6 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	 * Go to virtual mode and pull the HMI event information from
 	 * firmware.
 	 */
-	.globl hmi_exception_after_realmode
-hmi_exception_after_realmode:
 	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_hmi_exception
-- 
2.20.1

