Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8DB4C748
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:12:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ts0l5N4szDr32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z7wLOtuR"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqm02p4jzDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:59 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a186so968495pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXH0kmtiTjZ+kmjvmuUwv50bgCHSBis+xWMXsqjlw1s=;
 b=Z7wLOtuRKOqaHlJtzJRSNfyeRcSbfH5ltLoue6aZKRmiE2Q5byu4niUH/8oHlRRWEJ
 ayIPVdrq5L3aRlTvojSNVO41tiQGD2aPunHszUxsgFBIObQaCumqC4cMsrrMGp1GoOpd
 qP8vaaYS/7+JeAxDqtJyobf61vEeZVi2PwEwXmiPKC8ymuYqa0IcIjxv50QvXUqCbPNu
 42bFg3Do+jo0JS+jAhpFVGXBm8WsTcKd2ya31iEooXF4Q4UcOZMrAFdt6YoEQDVXMcT/
 sN+foKPi4rlBmsR+Obh7Y4mf5U/hx07SrT1rx4Y4rVCIcV0H8NC6FRFraebgJBt3nNfx
 VzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXH0kmtiTjZ+kmjvmuUwv50bgCHSBis+xWMXsqjlw1s=;
 b=mXV+70yeQrJdLpx/QKT/g8wntlHqMoHIOV21OOtJmIRNxTetFWJ5XLDWytvpstAZ4y
 UV0lC3zgp/+DXB0gi0gy6Qea8pfQo5iN2TZEZExWeTsy2sj2eQp5++gjOIgvxnKxrxXH
 wTfzdpMtMHX8cG9uHTvEqIPSQFA3TtInTiNS01Lfwu9nXSmrEBjotj8GzKjLiDpUiEp+
 r2ijOyfzgvk7Le+4Ox3a4Y+Skno+5b1tivaVclobnYoE7gKKRxSRDXAptRlPVN1FxKJq
 1+Tt37N+SYstcEd0cfIolqTOJrdWzpjWvku5DUtEy11e/pLwYRvTSOvJY8Mg3NxEa4mR
 6TdQ==
X-Gm-Message-State: APjAAAWcFkX/XQsuOPZn0YTuh/NbfK4aoz60gNGYB2vCBZJm5hwpR3ny
 KOxf6sPuy6FTy9wW419vPghAThG7
X-Google-Smtp-Source: APXvYqzUKPVQrWnW5BNEZl/8h95gmIL47Rbn84pI6WTLtrtTAPc3ffSsegZGvhYhkLsPgdkkjmHeKw==
X-Received: by 2002:a62:f202:: with SMTP id m2mr17042411pfh.6.1561007757576;
 Wed, 19 Jun 2019 22:15:57 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 27/52] powerpc/64s/exception: move paca save area offsets
 into exception-64s.S
Date: Thu, 20 Jun 2019 15:14:34 +1000
Message-Id: <20190620051459.29573-28-npiggin@gmail.com>
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

No generated code change. File is change is in bug table line numbers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 17 +++--------------
 arch/powerpc/kernel/exceptions-64s.S     | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 79e5ac87c029..33f4f72eb035 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -32,22 +32,11 @@
  */
 #include <asm/feature-fixups.h>
 
-/* PACA save area offsets (exgen, exmc, etc) */
-#define EX_R9		0
-#define EX_R10		8
-#define EX_R11		16
-#define EX_R12		24
-#define EX_R13		32
-#define EX_DAR		40
-#define EX_DSISR	48
-#define EX_CCR		52
-#define EX_CFAR		56
-#define EX_PPR		64
+/* PACA save area size in u64 units (exgen, exmc, etc) */
 #if defined(CONFIG_RELOCATABLE)
-#define EX_CTR		72
-#define EX_SIZE		10	/* size in u64 units */
+#define EX_SIZE		10
 #else
-#define EX_SIZE		9	/* size in u64 units */
+#define EX_SIZE		9
 #endif
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4b4bb8f43f55..d6de0ce1f0f2 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -21,6 +21,28 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
+/* PACA save area offsets (exgen, exmc, etc) */
+#define EX_R9		0
+#define EX_R10		8
+#define EX_R11		16
+#define EX_R12		24
+#define EX_R13		32
+#define EX_DAR		40
+#define EX_DSISR	48
+#define EX_CCR		52
+#define EX_CFAR		56
+#define EX_PPR		64
+#if defined(CONFIG_RELOCATABLE)
+#define EX_CTR		72
+.if EX_SIZE != 10
+	.error "EX_SIZE is wrong"
+.endif
+#else
+.if EX_SIZE != 9
+	.error "EX_SIZE is wrong"
+.endif
+#endif
+
 /*
  * We're short on space and time in the exception prolog, so we can't
  * use the normal LOAD_REG_IMMEDIATE macro to load the address of label.
-- 
2.20.1

