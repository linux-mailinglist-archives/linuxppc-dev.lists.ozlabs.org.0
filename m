Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A94C6E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:50:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TrWg69pjzDr0m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:50:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pKkT8Ui1"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqlY3YNhzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:37 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id i189so955003pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofIoTFcId4qfmMxew+F2dNna3EHcGfdPDyTFpWDJ9jQ=;
 b=pKkT8Ui19a1fLKipi/jQtGVGQcZQQBYBDqsos7Rqu8GHRvh7rragI6X8TewufM5O5g
 c0Pwoy/ZIluCh6NqFGC0McWA1ahdpL8fDesNOylFwNZBpOYyv3ldc8GNIuwL1gfj4NGE
 bT9udDnDc5jJTaKwtOOtYZpfhf/J2qAB1CByRlyEv6rVwVHzuu8l1BMpJJ/Ly0WMAQ1Q
 mqojIg61KbFAFdcyta4yBNqXcE67pn+FcOuyC/YsYtgpegMa4x+ECbCekVoaGm2XbuPa
 o1fYaGPUujLYL2UmU1KYrZaaYqK05yIINWx8qkSBJ71CUz360HZLelQcGo4V+Q7MCNW1
 IfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofIoTFcId4qfmMxew+F2dNna3EHcGfdPDyTFpWDJ9jQ=;
 b=XPkEDb4Z3PIxCmzx7hYlIt3Eff8gmqilxqBZQsYURdYbpdV9ddiyyLF7FAzjiWWG2O
 FHiV3mrsXLvj6VTuIhQ8tk1EH00T73gM9kh4LyKRJJR1TPeuCIejGrwGUjVT0z4yqv/1
 ibwNBaJZ5Mj1goRT4d+NuQTt/LKNyztKTlgaV3JYVA8jt+u+B9xdEI0UmYcT9H0kBiki
 i4nZjdH5ItnwPbKKh0xoedm6rjuaOZDz3L0Vl4oZ1pWv10HaIWzg2CaZw/g3hW/NTSC1
 KOxKUKeQ3JpL3lcmrmTX6ba864OCb/HC0pnGcTG5aGaxp2ic6mNu9sXeHn9VI8TNU/vj
 cP8g==
X-Gm-Message-State: APjAAAVSsOZwyEG+8arjBsuNuYAzoUnlmF88f5uub6IPgrMZSigCBmaF
 WVeROzfanJVAT6DGI5SM36dgTy3b
X-Google-Smtp-Source: APXvYqyF3sM+le+xv5bdXj8JcBWQ02mm272gMfWVKdU6WvDULEdnOsFKogUyQv0oBgy3jcNtYAWf1w==
X-Received: by 2002:a17:90a:376f:: with SMTP id
 u102mr1120791pjb.5.1561007735193; 
 Wed, 19 Jun 2019 22:15:35 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 17/52] powerpc/64s/exception: move KVM related code together
Date: Thu, 20 Jun 2019 15:14:24 +1000
Message-Id: <20190620051459.29573-18-npiggin@gmail.com>
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

