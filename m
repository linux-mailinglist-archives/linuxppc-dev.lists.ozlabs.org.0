Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC184C6F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:56:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Trfc1m3DzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:56:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iy1DNCxU"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlj6gZPzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:45 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q10so956988pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qN9ea9qxOQAFsfChjpNGHN1fNl5N2FGQcI0CFjKry54=;
 b=Iy1DNCxUHCk3B7iXcUx3uEgul2FccF27+j5GYlJj2h3lKNbgP8o0AgxH767ODFu5wW
 bxBQJYkTPkHrzzXS5xMy9h/suNERTpVk2xcrFtQ9PPh4/EbXIGVsrG41d/4VMcpBUHML
 nqXeKXjTQljIXoj+xBcDzXBtUhZk3ajMipSbjhU5GIlIX/cVTX3/Ztq17YdEps3oM/Yv
 jAWwwezJYpw52ZJHidMd8ueV3hPknGKkK9EV3T+BMdFZdHbbPbFWiwZ1g8BVP9jgbq5F
 C2Qqne+0w9SmWH/28Q7MFpd/J3y3BMbK+1CBOZ23VRmMim08AlE5040voiJC0UdzkH3E
 kwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qN9ea9qxOQAFsfChjpNGHN1fNl5N2FGQcI0CFjKry54=;
 b=Bij2rhzoDpi+8j+TTAwJuMzZYK4ri9c/XxlLRrL+vazMwpTZYJdAd+EWoarD8AbfFp
 nhStgU6IZx/8pwEk7awFfsKPMAUKpz6Gn9D+d8R0YkU3VjD1R2mKP+/5nD1FXP3L6h6x
 Yvow0o5OXucvwfe1hDMeb+bh21JfdARfKVCZ4bMsym3IQzIJSNumpEcDFplilG3TqVUc
 TqX91tpXYhBj4SsSDs5hAozWkIZvL65tQMpH4ZoZgSyx7JSBLjliqhHy4YaM7gWgD2Fr
 w7ZICDhY7VZrHLnFXP5PTPTZF5oWTi+IytbyuYOvDhvnw7LoieSaM7JCpA+d2UP6IQVI
 vHmg==
X-Gm-Message-State: APjAAAXzBC2pyTeztgsvBGQib494nrOqFg+MIh5gC0OXZki1XdcrC2pF
 dn2V/dKx4vhmiMYQOKFoxipALBYK
X-Google-Smtp-Source: APXvYqypMILgFpoaeiLxaGUwYnukl2c/0bS6XCZZ/zEtwNk99BY2SkGi7RG2yJNaO4/HBf2dqIhWfQ==
X-Received: by 2002:a17:90a:9289:: with SMTP id
 n9mr1112533pjo.35.1561007742457; 
 Wed, 19 Jun 2019 22:15:42 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/52] powerpc/64s/exception: remove __BRANCH_TO_KVM
Date: Thu, 20 Jun 2019 15:14:27 +1000
Message-Id: <20190620051459.29573-21-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 43 ++++++++++++----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0a5a2d9dde90..87db0f5a67c4 100644
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

