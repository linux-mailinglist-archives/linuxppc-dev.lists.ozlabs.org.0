Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227226DB81A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 04:18:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptf701TGZz3fZf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 12:18:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MKy47Eau;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MKy47Eau;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptf672gQJz3f4n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 12:18:07 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id ke16so280923plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 19:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680920284; x=1683512284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZe2nbGJOI28vfjum9rWlwMPlOLWV73edr0aQhbjJQs=;
        b=MKy47EauwKtdGsoGTPUclS81miWhit8Gjarm2jRBl2oiUJ3QAt6gWxO3FRfULSJFcx
         2F0JouVjz5KE3KMDXHCiQu6J8ETmCWeoUx8xYxJguu4d1tNVDG+XNDktXHvWhUkgBPbP
         rA5CnLbG7OoSzuJZF3UmTa/vx9tkUKqk2vC1d/jEHZem6dPI0y0g4huffttbSVaTcmro
         x103iJTyMm8+rkvVRm0nHG1xFlgUNffoVwwYYmduOv9CdPRqHd1fGCK3xAcyBmG2PYsU
         2dYM3RFxRKyG+O/ojSIrD/Uh+TX64pbw7myOQtbeLwIvxAE0nktag3ElncoXr4v9wyot
         pe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680920284; x=1683512284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZe2nbGJOI28vfjum9rWlwMPlOLWV73edr0aQhbjJQs=;
        b=Ik07vjyKR4NvO9iWcOh3jH7t9QgvsB5SeToMZ2+Xsmc4GEDmMBAAqWuLztWC/ls+7v
         lQypLzEND/HF8vFNIdI+qb0XH+SihRNABDlYb7SM7Y+bw53nRrElXPflGJz7mryh9zHx
         9ad8Y7LMeS9zBos1LW9Oi2ke+wPu9ikJFHKLlxGjcMrJwfN80Uz/2H3N3/yZSvyTrijh
         TWVLkVQVw1dId7LBO/l3OKHcrjupi8LYd0jMWggeIqXBoodQHoEkl1uBLGwaM3ssDcrS
         nd+IogKDPYSYDYe/clUN8GMPilxgm2kODUzWfl0c4fhpAR5Mj1D3YR8x0p4V94/h3GI5
         hnDA==
X-Gm-Message-State: AAQBX9eDj5An7xlDktmBK3lGM2iLP6ZC3kKBCkR75pUBOqlMS4GW01Yx
	09gugVRC4qUb28F5R3sLNNCEjMcf/5lmOg==
X-Google-Smtp-Source: AKy350YH8J3xshCznNosNzZWcNItH4HKYHcTzJk1h+ZpR2zMVgOmk5GbIg9rkwQQWlZ5Zyv+Y7fnpw==
X-Received: by 2002:a17:903:32cb:b0:1a2:98b1:1ee2 with SMTP id i11-20020a17090332cb00b001a298b11ee2mr6102014plr.15.1680920284545;
        Fri, 07 Apr 2023 19:18:04 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001a19f3a661esm3498577pln.138.2023.04.07.19.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 19:18:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/64: Move initial base and TOC pointer calculation
Date: Sat,  8 Apr 2023 12:17:47 +1000
Message-Id: <20230408021752.862660-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408021752.862660-1-npiggin@gmail.com>
References: <20230408021752.862660-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A later change moves the non-prom case to run at the virtual address
earlier, which calls for virtual TOC and kernel base. Split these two
calculations for prom and non-prom to make that change simpler.

Signed: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 1febb56ebaeb..5b2d607cd1e8 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -515,15 +515,6 @@ __start_initialization_multiplatform:
 	/* Zero r13 (paca) so early program check / mce don't use it */
 	li	r13,0
 
-	/* Get TOC pointer (current runtime address) */
-	bl	relative_toc
-
-	/* find out where we are now */
-	bcl	20,31,$+4
-0:	mflr	r26			/* r26 = runtime addr here */
-	addis	r26,r26,(_stext - 0b)@ha
-	addi	r26,r26,(_stext - 0b)@l	/* current runtime base addr */
-
 	/*
 	 * Are we booted from a PROM Of-type client-interface ?
 	 */
@@ -545,11 +536,30 @@ __start_initialization_multiplatform:
 #else
 	bl	start_initialization_book3s
 #endif /* CONFIG_PPC_BOOK3E_64 */
+
+	/* Get TOC pointer */
+	bl	relative_toc
+
+	/* find out where we are now */
+	bcl	20,31,$+4
+0:	mflr	r26			/* r26 = runtime addr here */
+	addis	r26,r26,(_stext - 0b)@ha
+	addi	r26,r26,(_stext - 0b)@l	/* current runtime base addr */
+
 	b	__after_prom_start
 
 __REF
 __boot_from_prom:
 #ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
+	/* Get TOC pointer */
+	bl	relative_toc
+
+	/* find out where we are now */
+	bcl	20,31,$+4
+0:	mflr	r26			/* r26 = runtime addr here */
+	addis	r26,r26,(_stext - 0b)@ha
+	addi	r26,r26,(_stext - 0b)@l	/* current runtime base addr */
+
 	/* Save parameters */
 	mr	r31,r3
 	mr	r30,r4
-- 
2.40.0

