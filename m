Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 029421925F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:41:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPmr0lJvzDqC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:41:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ue8rbu8u; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdF2JgDzDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:34:57 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id j10so831194pfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=euFpGlX5gFGkw6yKcM2wMWrMIRK+j8lxN5xc0WNJUQU=;
 b=Ue8rbu8uWlTyDsS+FS6TQxYSUKvS2ZAl/RUhNw6ykwcwA76NIbcohoQtJfE+MobYYy
 PFOTbUMphb//xiFDv90NNeZCqHVhTezRv1FM9xoayiMV4OU82JWqXhIhA0xWsMO3oXoL
 PVkr6aVbGfW8kG+03GtLbESWtputM5XGuNhtLxmg+Z1tUhqa4gKrv08zAAwxTnxgG+/K
 jo2/YZAeRDzL5AykqREkT0cbHrI8S/mVKK9n9WxgD2mDLra70RUNo4uHq+K2EmOZQCMT
 kS/Uqb+nOSfWH5BCThZCGKMWBeRgIn+GB0E+IOYvthbwlTEssUBOVpfV52y3y0h3IsH1
 GFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=euFpGlX5gFGkw6yKcM2wMWrMIRK+j8lxN5xc0WNJUQU=;
 b=sTRRowIV/LPLsjUCiocnRTbsN1fppsMdSFhm81N0hnI5YUCdL0enedqE/AxjVgyYfw
 5fhGOdmwwC2WSXFhFFsn+cJLX+bQm1MxPgSdxXgOTs01+9GC/UuJyiT+ulqW7xgclX83
 00F8YjgwojsFuWXr4DFc+pw//UgVxV895bRDX0XRSxyXYEK2QZPezF0dzsbOmrFJUbbi
 Vx46sOnxi4ykC7ZRFum3/q4H7UsbVZ21EcJIcQGLSFg8Qqg1EILdXZMayCOcjLeWVWRl
 yVIphRe2Fw3yNE70RqrrX67Cr5V3KdEGlEkBcoDmsdDr9IdQz7jv3gz7+LK4ExNeBZEC
 FMOQ==
X-Gm-Message-State: ANhLgQ0V7NSWcUCcDGQz+gDJEAlok/NcptgSPFYBWScgJ6hFU0n2VH5Y
 nVXq2wJWIAcR/kTrecqxJ3MMvIar
X-Google-Smtp-Source: ADFU+vvXySdArquQ2GUsd7CiXrcWcyXdUdC9aYRPv67+EOYWBeRh0ahS9B5C6u9dZGf2dWBeHxSrBA==
X-Received: by 2002:a63:f40d:: with SMTP id g13mr2591406pgi.374.1585132494054; 
 Wed, 25 Mar 2020 03:34:54 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:34:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/12] powerpc/64s/exceptions: Change irq reconcile for
 NMIs from reusing _DAR to RESULT
Date: Wed, 25 Mar 2020 20:34:00 +1000
Message-Id: <20200325103410.157573-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A spare interrupt stack slot is needed to save irq state when
reconciling NMIs (sreset and decrementer soft-nmi). _DAR is used
for this, but we want to reconcile machine checks as well, which
do use _DAR. Switch to using RESULT instead, as it's used by
system calls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 67cbcb2d0c7f..257d24437130 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1011,13 +1011,13 @@ EXC_COMMON_BEGIN(system_reset_common)
 	 * the right thing. We do not want to reconcile because that goes
 	 * through irq tracing which we don't want in NMI.
 	 *
-	 * Save PACAIRQHAPPENED to _DAR (otherwise unused), and set HARD_DIS
+	 * Save PACAIRQHAPPENED to RESULT (otherwise unused), and set HARD_DIS
 	 * as we are running with MSR[EE]=0.
 	 */
 	li	r10,IRQS_ALL_DISABLED
 	stb	r10,PACAIRQSOFTMASK(r13)
 	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,_DAR(r1)
+	std	r10,RESULT(r1)
 	ori	r10,r10,PACA_IRQ_HARD_DIS
 	stb	r10,PACAIRQHAPPENED(r13)
 
@@ -1038,7 +1038,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	/*
 	 * Restore soft mask settings.
 	 */
-	ld	r10,_DAR(r1)
+	ld	r10,RESULT(r1)
 	stb	r10,PACAIRQHAPPENED(r13)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
@@ -2809,7 +2809,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	li	r10,IRQS_ALL_DISABLED
 	stb	r10,PACAIRQSOFTMASK(r13)
 	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,_DAR(r1)
+	std	r10,RESULT(r1)
 	ori	r10,r10,PACA_IRQ_HARD_DIS
 	stb	r10,PACAIRQHAPPENED(r13)
 
@@ -2823,7 +2823,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	/*
 	 * Restore soft mask settings.
 	 */
-	ld	r10,_DAR(r1)
+	ld	r10,RESULT(r1)
 	stb	r10,PACAIRQHAPPENED(r13)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
-- 
2.23.0

