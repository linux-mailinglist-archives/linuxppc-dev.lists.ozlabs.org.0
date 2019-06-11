Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231D3D090
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:17:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYXL593GzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:17:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WR9uitR1"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZR3DqKzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:22 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g21so5229831plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HnyQLyQJWF52L9q1/Tv9uIZGI0sjVmfMaFZ6h1TzAQw=;
 b=WR9uitR1OPdN93XxVI/RUMslTSdyiuNCEtxfXPYT00Fp4H/yTADlNBBc+PiY6gJrZz
 z4x2K6iyfJDgiaRMO9nFL5xSDFIhds/sK4dC0UWUxKbCLgI55peEZIR+TCZbYJUgPnbf
 CTfYfF3AXdiLP7yTICA3yE8jzt/DZXvWwFg4bSqjKexU+yPN3l7BoPkjjlPdqCbJcQVm
 FoqlfFFCM16t+Y3NLXl8U9UuAI+REOvaMpuUw2jTPsVVI4syOm8zeb1i6V3CUaSkERkM
 on4KJphL+DYYv4Xby+RyV6P5vy7qA9AVhTjB560whin8kATaUEDwUVaEnp4XbH1CIKC8
 huXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HnyQLyQJWF52L9q1/Tv9uIZGI0sjVmfMaFZ6h1TzAQw=;
 b=d/5r2XDJuK5Oa/vXx39gNImt2VKmSrh1t7T9Bv3HgNYyY4ECBwdbf7H9LwRaD5bHX2
 iwsvfTN6QFIcl46fKFsSaNxICZ6RLq40ZZjBqv0MsfIawfz3sQlc/IICylosugwadc1t
 ktGgR56pCqSoLroXHkkEJfOtH0RA1aFCRrqQwUAIlQTOip8xlLaxdsMbtmGXG7OYE08i
 2GsFRFYTMm0PxjfGjjLwslxRW1aO9tv5x+dIAG938egJPFqVzRcH2WHT7yJl2Rhof+i7
 iD5qxXFyqLJsNgQsh7WgbYTeXegj0DYV3iQK9Q6gF43AYu322y+ICD0GcpptJ1oWZcc5
 EnkA==
X-Gm-Message-State: APjAAAVyLi2kpRW+32z1u3TaaWrsTVfziftpabfZhqD1rKYvUNH3DJjG
 J0zMZJCt/9D9u9vf1BmJxz3KGy+Z
X-Google-Smtp-Source: APXvYqybW4j8w0AtmTJX3e5eRAyF+oB4fZUKJmLIJJgDcKIDFJBFyLH/8fLK/hjxcdpqU/yUEDeNCA==
X-Received: by 2002:a17:902:903:: with SMTP id
 3mr50913497plm.281.1560263659088; 
 Tue, 11 Jun 2019 07:34:19 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/28] powerpc/64s/exception: remove STD_EXCEPTION_COMMON
 variants
Date: Wed, 12 Jun 2019 00:30:28 +1000
Message-Id: <20190611143040.7834-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

These are only called in one place each.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 22 ----------------------
 arch/powerpc/include/asm/head-64.h       | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 6de3c393ddf7..73705421f423 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -555,28 +555,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
 	EXCEPTION_PROLOG_COMMON_2(area);			\
 	EXCEPTION_PROLOG_COMMON_3(trap)
 
-#define STD_EXCEPTION_COMMON(trap, hdlr)			\
-	EXCEPTION_COMMON(PACA_EXGEN, trap);			\
-	bl	save_nvgprs;					\
-	RECONCILE_IRQ_STATE(r10, r11);				\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
-	bl	hdlr;						\
-	b	ret_from_except
-
-/*
- * Like STD_EXCEPTION_COMMON, but for exceptions that can occur
- * in the idle task and therefore need the special idle handling
- * (finish nap and runlatch)
- */
-#define STD_EXCEPTION_COMMON_ASYNC(trap, hdlr)			\
-	EXCEPTION_COMMON(PACA_EXGEN, trap);			\
-	FINISH_NAP;						\
-	RECONCILE_IRQ_STATE(r10, r11);				\
-	RUNLATCH_ON;						\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
-	bl	hdlr;						\
-	b	ret_from_except_lite
-
 /*
  * When the idle code in power4_idle puts the CPU into NAP mode,
  * it has to do so in a loop, and relies on the external interrupt
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 54db05afb80f..dc1940c94a86 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -441,11 +441,26 @@ end_##sname:
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-	STD_EXCEPTION_COMMON(realvec, hdlr)
+	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
+	bl	save_nvgprs;						\
+	RECONCILE_IRQ_STATE(r10, r11);					\
+	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
+	bl	hdlr;							\
+	b	ret_from_except
 
+/*
+ * Like EXC_COMMON, but for exceptions that can occur in the idle task and
+ * therefore need the special idle handling (finish nap and runlatch)
+ */
 #define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
 	EXC_COMMON_BEGIN(name);						\
-	STD_EXCEPTION_COMMON_ASYNC(realvec, hdlr)
+	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
+	FINISH_NAP;							\
+	RECONCILE_IRQ_STATE(r10, r11);					\
+	RUNLATCH_ON;							\
+	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
+	bl	hdlr;							\
+	b	ret_from_except_lite
 
 #endif /* __ASSEMBLY__ */
 
-- 
2.20.1

