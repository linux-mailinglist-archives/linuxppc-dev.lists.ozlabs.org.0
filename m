Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41859395
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:44:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zm0Y5n9mzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:43:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K4RrpQSr"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmg0hZWzDqn2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:38 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d126so2381397pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqlUyFcw+JOl/KKWGZq5OYd8Kcp9RD2eBB+OpUgpjtc=;
 b=K4RrpQSrd5xDPiMgvIAK0ePJTrp/7ncNDhUWTPz7kt+Oxm4xJb8gAydgS0JbCb+ruJ
 7qmbuoNjrZmPNRygWXCyw+dEKW405Zf9+qSMBIM74wwU5bYRPLiy5UqoyKl6ETw0oGvX
 bxSoO0DTwZSEUDXGky2VXIWtUWk6304m9+CMZWKG4U5Lq1Bq7qDe4XL9UNZjh+d1yLHl
 Pa7+Wcli5fwRQPqyWIUWD2wxJkJ9DfVti2VIkDBAXC/IP+WxS2st1ijaBdna50hw7gJr
 XNIOKxEnnIVblNbPSE5c6wniBj2v+NhpZadjPmoQZkikKzzhguzJC7DuPV2xYx+EsMi2
 40WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqlUyFcw+JOl/KKWGZq5OYd8Kcp9RD2eBB+OpUgpjtc=;
 b=k6fi3VkqsjCNUdrtYw4Gd74gwVKtMnu/0VvJcgs3dHqY616IXc+JrZn/wm0Dhd3Akj
 GwxlVGwupWuncmnEh7M9+agTeQKWDqcDJFSLHhcDCKpTeo1kEThTBNTXDKdKZG97/ICt
 8Bk6z+ogUxsrPO29oXRBbB1TSpfLT7LyFw96durGFJQpy89EIj2pLTHWSpEirXi5Mklx
 3OEoq3YWe3psf7FP2F+IfcueFOo5FekLcOy77PSGsFgjclitgCChIeMRVxECfg8shjAw
 jNImCVdlsh8xIWZxqPzraG+5NI9CvkPaRvwKRdosJZ9wKRiThbzemyMyyhqpIDggDsE3
 ip9A==
X-Gm-Message-State: APjAAAXPE5HeFUS4nbAITRagBV44IvB9Fseq4BsxhgcGS0Fc8HUtnGp8
 RAqS38CnOKTUAInVAYy8ardkvKLX
X-Google-Smtp-Source: APXvYqz9u+sGv9+T/u4qkI1eSI0/hBP0EgzDYqTUJlg4kyQ6vKrOVh2Fd0KC1RCL4hvJhkzIwWhx5w==
X-Received: by 2002:a17:90a:5288:: with SMTP id
 w8mr10838149pjh.61.1561700016563; 
 Thu, 27 Jun 2019 22:33:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/13] powerpc/64s/exception: simplify hmi windup code
Date: Fri, 28 Jun 2019 15:33:25 +1000
Message-Id: <20190628053332.22366-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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
index c1d9ec5fe849..17bc0166e0e6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1781,6 +1781,7 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	BRANCH_LINK_TO_FAR(DOTSYM(hmi_exception_realmode)) /* Function call ABI */
 	cmpdi	cr0,r3,0
+	bne	1f
 
 	/* Windup the stack. */
 	/* Move original HSRR0 and HSRR1 into the respective regs */
@@ -1799,13 +1800,28 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
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
 
@@ -1813,8 +1829,6 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
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

