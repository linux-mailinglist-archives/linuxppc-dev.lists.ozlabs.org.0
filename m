Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D994F61F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:12:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHYx1w8fzDqlK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PdHvOl2h"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKp4nsgzDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:46 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id g4so4332844plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofIoTFcId4qfmMxew+F2dNna3EHcGfdPDyTFpWDJ9jQ=;
 b=PdHvOl2hgkmnGNmz7m42QTmknM7M94BNAGvIiujojFlHt7QouaqC1TA9bQhCiFL1sX
 nLjTr4m4c8DSaAuzMQsjzUrQakn3Noe9BT41+sN6SdyoDiNPqLVNVow85IQ+J/FUxGR/
 RO74yaXicrGp8izHWukM3lu4dbuvSOsEGgZllYgZn+/jARojMN+hxEuvTA+AdNlGkxmw
 fmACRv/7k95JuvcTBd3EExzm6c8w8VJ98O3mCGjEnpxv9Lx8yAXlhZM0Dc5NW/a1WXBt
 fJcoCeQcv94aGlHZeR7T/xS+QiXiD93+Yv8vPXMoZFkXpQwOMs0r7sD/GlGCxf43WmM6
 BevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofIoTFcId4qfmMxew+F2dNna3EHcGfdPDyTFpWDJ9jQ=;
 b=EdcApAgckqG+aPR50W46fr3t52dbZtnHGYqKxV4TBEhQLl7pN7TxnbicqyyqJnk40+
 9vUPGk/9mXx8eDx8MUTrzOLgGOLTeGCin33a32o0TYWE2gBHyzqY+9oJvacje3TQOjCo
 kqg8GId8KKQe92F5XMFXoyb7CeNBRnVFiG1B+cdwJXjs4mVx/vBiNenFewwnvXGwxavS
 5by9IAA/HVaSn3XYbiZkVX1jP2ljNeLeCAjFP8O68lG9mz6G3QjoqSmjYJXRotXFBBF4
 BX3027Am7Ta2pMTj52ajUt2TXsfIIc8jTo7PSwQU6pNgUVlcD6PARDwUEcNrKMZFY8cy
 voqQ==
X-Gm-Message-State: APjAAAW3AYqMtXzJ4OeA1gkNTQhnp6eIpm/WuRPLayVqKebLo7JUMr4K
 TaDa+1ofghF/TO/TxXZu36xhwhPucdw=
X-Google-Smtp-Source: APXvYqysAke1b5Vs7BU+5wAo+ZjQSLKncq7HzDO+okz1rg3/SmcOOAKRAzHQcpfnuVZf7GuzdJNkRQ==
X-Received: by 2002:a17:902:ab90:: with SMTP id
 f16mr134391726plr.262.1561209404701; 
 Sat, 22 Jun 2019 06:16:44 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 16/25] powerpc/64s/exception: move KVM related code together
Date: Sat, 22 Jun 2019 23:15:26 +1000
Message-Id: <20190622131535.20996-17-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 40 +++++++++++++-----------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 73705421f423..e996ffe68cf3 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -335,18 +335,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #endif
 .endm
 
-
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-/*
- * If hv is possible, interrupts come into to the hv version
- * of the kvmppc_interrupt code, which then jumps to the PR handler,
- * kvmppc_interrupt_pr, if the guest is a PR guest.
- */
-#define kvmppc_interrupt kvmppc_interrupt_hv
-#else
-#define kvmppc_interrupt kvmppc_interrupt_pr
-#endif
-
 /*
  * Branch to label using its 0xC000 address. This results in instruction
  * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
@@ -371,6 +359,17 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtctr	r12;							\
 	bctrl
 
+#else
+#define BRANCH_TO_COMMON(reg, label)					\
+	b	label
+
+#define BRANCH_LINK_TO_FAR(label)					\
+	bl	label
+#endif
+
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
+
+#ifdef CONFIG_RELOCATABLE
 /*
  * KVM requires __LOAD_FAR_HANDLER.
  *
@@ -387,19 +386,22 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	bctr
 
 #else
-#define BRANCH_TO_COMMON(reg, label)					\
-	b	label
-
-#define BRANCH_LINK_TO_FAR(label)					\
-	bl	label
-
 #define __BRANCH_TO_KVM_EXIT(area, label)				\
 	ld	r9,area+EX_R9(r13);					\
 	b	label
+#endif
 
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+/*
+ * If hv is possible, interrupts come into to the hv version
+ * of the kvmppc_interrupt code, which then jumps to the PR handler,
+ * kvmppc_interrupt_pr, if the guest is a PR guest.
+ */
+#define kvmppc_interrupt kvmppc_interrupt_hv
+#else
+#define kvmppc_interrupt kvmppc_interrupt_pr
 #endif
 
-#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 .macro KVMTEST hsrr, n
 	lbz	r10,HSTATE_IN_GUEST(r13)
 	cmpwi	r10,0
-- 
2.20.1

