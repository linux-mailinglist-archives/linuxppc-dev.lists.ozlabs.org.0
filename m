Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D75944B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:39:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnDW5r19zDqtd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MmiWrvi7"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zn5b2QnFzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:33:23 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id m30so2445491pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNsEmLEDi+BGKto2pOsSX7KyZxAMBcbKI0AUmIOi5o0=;
 b=MmiWrvi7nOlXQKQxMTTskYwR8/r/AYbF8Nw0YVrFy284dz2bD9dFzEF82OyAVV8FFJ
 AK84kgGntAzqtMT4cxsr36pgecGn9IDxEfwAqNsEnZD0f7Ya2mirIScAlvXWBZ+5rm+t
 E64ESktylxZcRmpWZMud+GqL9l5gXhB6OK62WiFfL6/ajh9Xl8HLkBNCALjY4EV8Rbbd
 EEYl71Ld3eGSnAybFXY7I+aTmyKIIgpFHqqIDymn7khViufKm9lVP5HWAbUQrX8X+KFb
 sOHDbs2ez23Nqx35ieuAXsN1Xde2QDLMgwC4uCWLSfR5vuYdMcKVRejxICl9+e2bMqyl
 YvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNsEmLEDi+BGKto2pOsSX7KyZxAMBcbKI0AUmIOi5o0=;
 b=MZdY8BCj+JMEvoBFDgeOm3aUVUUYUQldV9vLOYTDnaUjgaJPEi/66ZwUyd+zJ+Fe9r
 hNGAUVHt7iPGDfcWNufase9VaTWTf6T354X8i0uTttbAXYiK++MYmitFdk4iTDqQKdUT
 MLzBl3KZWJ/rR2puu+Ghd2UnVI75x2NCsxjblLXUPNtgSggEbbOdwGO2Muf4PI0/BYXD
 gn24z+GDXElMkf5A1Qz7X5pdvck8iWIkAZz4P7Di1NR+r6gGmjGKVe//pXb2guW3uXuq
 uZFBDvYZTxSpf5LpLdOF+JF0UKU79Ja8aYNWaQhnDorsAMPahEC6O+eXYr18rOgdlJeN
 id4Q==
X-Gm-Message-State: APjAAAXK4jeZ2w8lWhGiVrDLSdRnJHmmiO6bsQh5lCDQ5JSyaucekv8u
 2JTkS2Ip+EPxdvYOJCcSJ/bJLPhY
X-Google-Smtp-Source: APXvYqx8j5PYy5njnKFPjV4zfSgS73zWg1Rmue52qNGgGeTsv9+BUukC2t1PoqhDDQn17qJDKNfjwQ==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr11184944pjq.114.1561703601538; 
 Thu, 27 Jun 2019 23:33:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h14sm1071500pfq.22.2019.06.27.23.33.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 23:33:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/64s/exception: sreset move trampoline ahead of
 common code
Date: Fri, 28 Jun 2019 16:33:20 +1000
Message-Id: <20190628063322.11628-4-npiggin@gmail.com>
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

Follow convention and move tramp ahead of common.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4b33aadd142c..89ea4f3b07cb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -884,6 +884,18 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
 	BRANCH_TO_C000(r12, idle_return_gpr_loss)
 #endif
 
+#ifdef CONFIG_PPC_PSERIES
+/*
+ * Vectors for the FWNMI option.  Share common code.
+ */
+TRAMP_REAL_BEGIN(system_reset_fwnmi)
+	/* See comment at system_reset exception, don't turn on RI */
+	EXCEPTION_PROLOG_0 PACA_EXNMI
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
+	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
+
+#endif /* CONFIG_PPC_PSERIES */
+
 EXC_COMMON_BEGIN(system_reset_common)
 	/*
 	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
@@ -941,18 +953,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	EXCEPTION_RESTORE_REGS EXC_STD
 	RFI_TO_USER_OR_KERNEL
 
-#ifdef CONFIG_PPC_PSERIES
-/*
- * Vectors for the FWNMI option.  Share common code.
- */
-TRAMP_REAL_BEGIN(system_reset_fwnmi)
-	/* See comment at system_reset exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
-	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
-
-#endif /* CONFIG_PPC_PSERIES */
-
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	/* This is moved out of line as it can be patched by FW, but
-- 
2.20.1

