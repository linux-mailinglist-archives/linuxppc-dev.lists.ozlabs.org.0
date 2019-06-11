Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D83D0AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:23:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYfx4xJczDqfD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:23:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sH/IdYG7"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZT4CS2zDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:25 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 20so7093711pgr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofIoTFcId4qfmMxew+F2dNna3EHcGfdPDyTFpWDJ9jQ=;
 b=sH/IdYG7yqL4Zf6S+jSYWD7GA7xoZ1Pedgu4KMKaMMPh8biubtnctaRZ//j74SdNOc
 HSDvRjdtX9T7Do5FBKzfhRbP/2hpiNiWDcHTG9z2UgWiDV72M1d+IXfouA4MQbLxVd2u
 JnwVA7lFCLGqKnaRJkmlEa2CWpBNHmwcmkls3jAlI4DINv8M7Y9ZBndS4lHEkGsmlrOb
 5D82N/BSv/5zKZIL8UVvjZ3w3Q8nn/BtulO0hVDMAKD7/Mx1YvNzacm7XwKe9gF73DPc
 OmFJlsk09JMJKBDizVYPC/+7eOkx+GYUo4AkTpnDZD3jxZPbLxp3NskPZH6E8i5EdRhQ
 eD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofIoTFcId4qfmMxew+F2dNna3EHcGfdPDyTFpWDJ9jQ=;
 b=Yqc/wXxpBPTwuhk2yFbIc424qlf6sZoAQCJJjqG+nzQiJwgNa7LST2PpdYwB9OTwSS
 F/ZKVjKtrbybkMwy0YIsiLZQtu5rpZxYoelBfr0IKLh+2IAwI3Nl1morIV6uBvb7JaDG
 cKJzvAB0jiANq80NEatQm/dDxNJZNLSkzJpIc6KZWKOVJ5F1DOJ+R531fJDKMXM3vj5p
 dl5QqD5e1qb2HOLmiw6Rr0oE81qQGEZXcRMu+3gQwu2RmrH+UhnauEFMLeE6pT4NurJZ
 6FISStVZSBR5h66AMVYkp0YoU7OqzGPMAWsx460vNuY4ybTl+/mPeW+rF5yhp5ZzMEC4
 VoGQ==
X-Gm-Message-State: APjAAAWvqFQPT/V8o3m0KBXnnU1ldJAO1xZgwUTp2fc5ODuXXOLn46BV
 zoP8mJwfHqwUvbpdX6O3F3IBwias
X-Google-Smtp-Source: APXvYqy6yDP08x3xNvb93YRUtdVusHVgAo3Au5twG0Zs1+WU3TvFSrnMO1phs98ggvUKEnQiDINn7Q==
X-Received: by 2002:a63:dc11:: with SMTP id s17mr21048408pgg.47.1560263661464; 
 Tue, 11 Jun 2019 07:34:21 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/28] powerpc/64s/exception: move KVM related code together
Date: Wed, 12 Jun 2019 00:30:29 +1000
Message-Id: <20190611143040.7834-18-npiggin@gmail.com>
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

