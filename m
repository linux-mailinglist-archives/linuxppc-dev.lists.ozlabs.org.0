Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 903134F629
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:20:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHlC6nknzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:20:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVdVt89D"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKy6HmfzDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:54 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r1so4966319pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p11NtgEQU7Hf33GvU3r59Pdf3Jwv3xLY+Gf/4pl6utk=;
 b=XVdVt89DvDQM80UGMZ9+8yX0/TBn1y7JwgBVf6+mhF/ZviYtHqsVnuqcgQj9alNDIl
 5aU2O0Vri+1EO2NbrZAr/T0KtjVl8JHFPvtT1ankfaiLBqCXtEYw1/Yy0a28Nbqpr0HR
 k35W0I40PSDneAtajwwICcsIpL4vWa56jGki7dusAOEo3U1rD7E70ErPtGHF00oHDR9M
 iAEM38PW2MbOOWXGlTJeFDA8ZLZ6MO0WCnMv7Yl3XlU48RT/Ng1eUu9FCxw2A3Cv/Fl+
 l71T20UeyiryVJqtG5c7QeOQzyUIBhEj29hmKhTtkgNTe5FnemYFZYFopWMYjYtRvR0J
 ijpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p11NtgEQU7Hf33GvU3r59Pdf3Jwv3xLY+Gf/4pl6utk=;
 b=uRD//bkS4SC6sctCb5EBtR+eoQEdg5ehPqp269EAFUe6Ek4bzfC/MSDxsnm+fwpbWB
 YBx1y0vnnGfL8tMktuwl6C+ugULpXTV/QOkq8B/aLLXyTZKMJpEkjqy4H8CGKhmpQZSW
 g91UNzor0M+HBMTx+LkdeY4jt/bBdovL4mWjQCCwlM2VvD3zP/C2kYuYLzBDGd3o/d6r
 sVCIj8uiwUfdxAR4ZkKgxzPz0wD9a3AFcAgt59/gkAhexcatiSFSDV7Q2VvANoY9WF/x
 U6Q4C3e67lO3RITdoIbFAlaCpxm3l6min8nsKB9j+wNdTPPiEknvBsTIXSMaO/zTGVQP
 5zQA==
X-Gm-Message-State: APjAAAUqS2DSiiMzZ3dxAxBrsPWI/ODXXXwCTXCCZQ3M1HZ86vWkGBbc
 zWBcLSly2L2/irXVLbGlcuUZQ8DqM3c=
X-Google-Smtp-Source: APXvYqwx2uIa/69eACCT4BmlGcTt4j9LqEJQWBAtfG0UL8pupE4JaoIV3SVtXYNs1Induz2r8zlpvg==
X-Received: by 2002:a63:e950:: with SMTP id q16mr23214763pgj.270.1561209412886; 
 Sat, 22 Jun 2019 06:16:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 19/25] powerpc/64s/exception: remove __BRANCH_TO_KVM
Date: Sat, 22 Jun 2019 23:15:29 +1000
Message-Id: <20190622131535.20996-20-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 43 ++++++++++++----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4a45f4a89daa..87be2c650bab 100644
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

