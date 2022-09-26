Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809925E990D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXBx1tksz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:59:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KDIu2lUH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KDIu2lUH;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7m3KWqz3blt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:35 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d11so5254574pll.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Bn0T7dQKNFXGgG78X/o6CPzfYUz1SqFWsqHr1/u9ZNw=;
        b=KDIu2lUHfRd1+x4jnljUQsyAJjuUuS5+K1DP9uyAMbsJ0w2zgcO3EGnIxoRK9GKKbh
         5j6C0f7mWLr6KnA73+EenEkNqMpq3tiXXupHnS6+2nPC+tf4DLj3s5dvsllllepGJR7z
         HDRJxRuYmrY2g8F8rl0Lv9M7eTMyJFpKrfNU2+daqlhdTVtk1j5Obfjo2al/aNRD2ZNL
         5+YwzwXcNihKxbscQWgrC0dUprZIEZYwV+tx4ufhHT+DR1H5+ojLKwrruM+LyLNOnv9n
         j3UzZICS5+5MFbOqEQ6mDJS9H6nPk8s3wo210q3M4x2Ywt5+diwMx7ZHlUPJNEChLKW/
         YKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Bn0T7dQKNFXGgG78X/o6CPzfYUz1SqFWsqHr1/u9ZNw=;
        b=G4qgcIynEAqPxb+osno3XP4I0YX56a0SrtbNYEG8/LiauWClXJFiaA+0XGbfU+If++
         p3N0i9AAixbYjzJJ3EI4fTP6oSnv1NIqW9EOOE6+PC1VruBeT2vFOA+d8rhDEWor7hCZ
         4HIAzCafDxmTy1wI5ydQTUAIn/KD8pN5987dYExIs9vRmjLNZgpQ34hvSY+0EyGN9F1s
         cENEkmPw01N9xoyy3kD999/EmD2LOnFgw0HEADwu38ysci8VrKoK2z5LuIckrsUQvkJn
         nezl+CIB/3FsQ85HRU3GaY3Btm8VHIdELSXdMlm4TkSGyKn/TA9A9bxLW7tVuJQT+xh9
         f3kw==
X-Gm-Message-State: ACrzQf1oxkmvZ9jZ5Vvtu1Pqa/3XWf/+CPRIedoD3NtFUV5q9yb8dtKo
	ugayM6q789zZomhsQEz4q/bdU3TtLF8aag==
X-Google-Smtp-Source: AMsMyM4jpfia3kASU1RAU4wO3Zglbzg8Y/cZw3PlTzHqsvHfFyVz/WXw41hy3qqqsVhtUoPd91OBRg==
X-Received: by 2002:a17:903:494:b0:178:9ee5:c7f3 with SMTP id jj20-20020a170903049400b001789ee5c7f3mr20419831plb.23.1664171793750;
        Sun, 25 Sep 2022 22:56:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id pv7-20020a17090b3c8700b00203a4f70b90sm5628075pjb.45.2022.09.25.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:56:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/5] powerpc/64: avoid using r13 in relocate
Date: Mon, 26 Sep 2022 15:56:18 +1000
Message-Id: <20220926055620.2676869-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926055620.2676869-1-npiggin@gmail.com>
References: <20220926055620.2676869-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

relocate() uses r13 in early boot before it is used for the paca. Use
a different register for this so r13 is kept unchanged until it is
set to the paca pointer.

Avoid r14 as well while we're here, there's no reason not to use the
volatile registers which is a bit less surprising, and r14 could be used
as another fixed reg one day.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/reloc_64.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/reloc_64.S b/arch/powerpc/kernel/reloc_64.S
index 232e4549defe..efd52f2e7033 100644
--- a/arch/powerpc/kernel/reloc_64.S
+++ b/arch/powerpc/kernel/reloc_64.S
@@ -27,8 +27,8 @@ _GLOBAL(relocate)
 	add	r9,r9,r12	/* r9 has runtime addr of .rela.dyn section */
 	ld	r10,(p_st - 0b)(r12)
 	add	r10,r10,r12	/* r10 has runtime addr of _stext */
-	ld	r13,(p_sym - 0b)(r12)
-	add	r13,r13,r12	/* r13 has runtime addr of .dynsym */
+	ld	r4,(p_sym - 0b)(r12)
+	add	r4,r4,r12	/* r4 has runtime addr of .dynsym */
 
 	/*
 	 * Scan the dynamic section for the RELA, RELASZ and RELAENT entries.
@@ -84,16 +84,16 @@ _GLOBAL(relocate)
 	ld	r0,16(r9)	/* reloc->r_addend */
 	b	.Lstore
 .Luaddr64:
-	srdi	r14,r0,32	/* ELF64_R_SYM(reloc->r_info) */
+	srdi	r5,r0,32	/* ELF64_R_SYM(reloc->r_info) */
 	clrldi	r0,r0,32
 	cmpdi	r0,R_PPC64_UADDR64
 	bne	.Lnext
 	ld	r6,0(r9)
 	ld	r0,16(r9)
-	mulli	r14,r14,24	/* 24 == sizeof(elf64_sym) */
-	add	r14,r14,r13	/* elf64_sym[ELF64_R_SYM] */
-	ld	r14,8(r14)
-	add	r0,r0,r14
+	mulli	r5,r5,24	/* 24 == sizeof(elf64_sym) */
+	add	r5,r5,r4	/* elf64_sym[ELF64_R_SYM] */
+	ld	r5,8(r5)
+	add	r0,r0,r5
 .Lstore:
 	add	r0,r0,r3
 	stdx	r0,r7,r6
-- 
2.37.2

