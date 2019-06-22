Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF44F61E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:09:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHVs0Ql6zDql2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:09:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S/u0O4Hp"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKm73YjzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:44 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i189so4968983pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HnyQLyQJWF52L9q1/Tv9uIZGI0sjVmfMaFZ6h1TzAQw=;
 b=S/u0O4HpHKU4Rr1u5EjVOHor821dnzrEGwFUajVTMr9DV5m4qS2VbwZLv8TCw2heEO
 jQ8hnSeW+XL+ba4diOMczAfjBCzQRLjL8JvFeP+IoHooLYIxl/nnP1CPKdAu56UNrNZE
 e9PnLOiyt6ZfzDotPeCERblKjaE6PTatszSbSfnBO4ER4mpdfR4WtOUOOraM+hqh/s4t
 iXU8cKSoE3enO+mYINLH+YIKX5N1ij7NtwzOOyfDXfEOk8dVDbsFX8az1WW0qOo/pdo6
 5+ee9Y3M0WW1G+uHwxLrNfWyJFmOMUMN48uSqS6/b2qf8C7V2WPfDXU/56qOhucPDCkK
 90NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HnyQLyQJWF52L9q1/Tv9uIZGI0sjVmfMaFZ6h1TzAQw=;
 b=D6Qc1Se1oqDTHqb+LzV+EGVejszTyOjKjUpXroUtGoNEDiG9KchFoTCK/aK0mA9VgT
 xqtV/3nZFGu5qOgNiEBWkmkigcGP0GJcizY1I0kVeVsFNXYgW9l1HjWiyTcqYZpttDAy
 Jawf6eY8hx1mjiN5plgSfEMnU8o6QzjH8I/zeuI88F/cch5pKXmdWqg2LlFFf8ZrLYf3
 MVmoJ1b0qp/HBG1qMHGFF6zDwPYuUeF52REXW88Mfcc3Ko4mYlshth/edfw5ynofqp8b
 poZyA5I+/qjtN5hGlSo2AF/y8WytEJWmo8lolMfAPWKFjHhJEPy1hC9RSeO2+9GF6Kw8
 DdcQ==
X-Gm-Message-State: APjAAAULUwjdPxQqrtpv938HWdZA5QYSvUH60x4N3e18SMLtn6a4KBrj
 fFGpIzn79pOIAXfMRslsGEm1Drj9lRc=
X-Google-Smtp-Source: APXvYqzujNE6ZShHK+WeUqRijdifxvoMB2/cxF9cb1IQAlI/6p7lWl+oBwpJxwTAcFGlYH6HjCUZTA==
X-Received: by 2002:a63:5656:: with SMTP id g22mr24101842pgm.280.1561209402284; 
 Sat, 22 Jun 2019 06:16:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/25] powerpc/64s/exception: remove STD_EXCEPTION_COMMON
 variants
Date: Sat, 22 Jun 2019 23:15:25 +1000
Message-Id: <20190622131535.20996-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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

