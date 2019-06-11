Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0A3D0E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:34:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYvW0GGFzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDl7Nhob"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZc3LPfzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:32 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id e5so5200232pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GhRzKdMWKftX+Ys5y+N7FKjsVvKZhk37TKAHdkO9qI=;
 b=gDl7NhobTFlE9ju60KhYpgtlYj4CgZV+M6tySttR9i1tO7uS6mlYtWkKb+1pMR0FtZ
 hXoXzhiKfnyIA9aT+iylzcDtCZXMF6siUBYxx4yFg2pI3ZdNi28DaX9AMRQEMgtK3E8H
 fkoPzkvgVt5XWUxIBvNYd56BCb7Y/9X1XTXXvWGJ4pcbP2wHNMjHfTkTTloourIGUjPW
 rOdW98lG7JKp9FHYnh2+lrhpaeyhlZbspMdVWcNuwPvvW3eVswo9lYAX3pTPtbhghmZo
 pK0+4cGDS0L2RGd++gvMf6ikPM0o7ijmKFfUeKGN3w8l4eqC6JzzCNGpAchmggkFdcIm
 SzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GhRzKdMWKftX+Ys5y+N7FKjsVvKZhk37TKAHdkO9qI=;
 b=CDsTazpoXvJmvb8quStpgXodtVOh/VrZjT/gO1FVObhoptlpar2IqkLHVvwHdJowYn
 8eLess4l4x9evGu21evX+4vP4WrWcfpSf4OjbHJ8CFDcUWwOn6FZDoGjGOzLk5JwrpEE
 XanmzUwezHrGvYb613UtO/YLP+5zNQafjN4VzSogPQb7IV+ver74L2gDPtAQ+++q6rBZ
 CzA2W4ywPEpSa3IBcT8nyfblXtA+z3K+iFDWSWsM4PM8Dj7Kina33e0h+J3Qz0VA2g3G
 t+RJqa/dissv3h5e2AruK3jRIh0N1Qk6BOsiTRZ4zmanK1F4mGOyiAERU0ICsbOxKMt2
 Z9Hw==
X-Gm-Message-State: APjAAAWwW6KxJX3dQkEDQAJ1ugzn5LQMyAoe0YS2J4xp84UhnC7VRO7n
 TEDSXC7jmQvgBhja6EuOL1n8wXIW
X-Google-Smtp-Source: APXvYqwqLc56VoHridyBr1aoAiLD9hyDGRomKwpf5uCNLnt64iA4xtX8Hqi/9ucV5A6Nnn51LTXFYw==
X-Received: by 2002:a17:902:9f93:: with SMTP id
 g19mr60849097plq.223.1560263669109; 
 Tue, 11 Jun 2019 07:34:29 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 20/28] powerpc/64s/exception: remove __BRANCH_TO_KVM
Date: Wed, 12 Jun 2019 00:30:32 +1000
Message-Id: <20190611143040.7834-21-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 43 ++++++++++++----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 013abf3ea6f6..8a65ae64ed54 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -243,29 +243,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #endif
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-
-#ifdef CONFIG_RELOCATABLE
-/*
- * KVM requires __LOAD_FAR_HANDLER.
- *
- * __BRANCH_TO_KVM_EXIT branches are also a special case because they
- * explicitly use r9 then reload it from PACA before branching. Hence
- * the double-underscore.
- */
-#define __BRANCH_TO_KVM_EXIT(area, label)				\
-	mfctr	r9;							\
-	std	r9,HSTATE_SCRATCH1(r13);				\
-	__LOAD_FAR_HANDLER(r9, label);					\
-	mtctr	r9;							\
-	ld	r9,area+EX_R9(r13);					\
-	bctr
-
-#else
-#define __BRANCH_TO_KVM_EXIT(area, label)				\
-	ld	r9,area+EX_R9(r13);					\
-	b	label
-#endif
-
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
  * If hv is possible, interrupts come into to the hv version
@@ -311,8 +288,24 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.else
 	ori	r12,r12,(\n)
 	.endif
-	/* This reloads r9 before branching to kvmppc_interrupt */
-	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
+
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * KVM requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
+	 * outside the head section. CONFIG_RELOCATABLE KVM expects CTR
+	 * to be saved in HSTATE_SCRATCH1.
+	 */
+	mfctr	r9
+	std	r9,HSTATE_SCRATCH1(r13)
+	__LOAD_FAR_HANDLER(r9, kvmppc_interrupt)
+	mtctr	r9
+	ld	r9,\area+EX_R9(r13)
+	bctr
+#else
+	ld	r9,\area+EX_R9(r13)
+	b	kvmppc_interrupt
+#endif
+
 
 	.if \skip
 89:	mtocrf	0x80,r9
-- 
2.20.1

