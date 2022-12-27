Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494AC6568DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8VP0mrkz3cFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:29:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PNHqDZDN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PNHqDZDN;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8RQ5vYYz2xdx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:26 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d3so12715632plr.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF8rQF5x5iL8Nz/hflDvxt+4w8zOZbVoF0ANzAFoMt8=;
        b=PNHqDZDN3tJZ2Et7ouXOPEhrnmNQX8prr9X6JrPoOYVg+MlWuCBDRGzBULWyd162Cf
         PjFBd+exxoDZTGHugrHA4pyFozr5m/nlow+1kv8cPoB4mm+zWx4Vk52YZBNIYnqfOre9
         KfEsX0kDFI2855hbHPXW7grJZ72MB7uDKnOIRP/zw5cl1Z8eaOlKzZE5S3jqZHrp++Nq
         QJHq5ZdAVbNyL2MjiDoMYFVf/xAF6cmqgGBUwgMsew/ukSkd2De9SszgbL/E2XOAqeCk
         ZxHRtqWpclyImx6FgEBQe8GX7m9Udxnfel1xjU2xgq+ylWuQN0bOkz+t/hR2rGrwJx4G
         8Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF8rQF5x5iL8Nz/hflDvxt+4w8zOZbVoF0ANzAFoMt8=;
        b=ruUVrYqJwdxm3NT3dS1Xt4GSFaJ+3/hJorNJ5kUIIwetgHWDuJ2OntOA+4EFQggpJJ
         Sw1NWIbVzrpHuZEbS7cY0WPurnBt2qf/Rxvv6R5zRIKVnn8ALw/NPDwGzClFe+JFHgJG
         raGfxRytHqc9amUv8bV5nhsX0CBUPDq2SJOUYnuQ6Up/ocCEgTMC+GV7M28IoXhcJYZ+
         1Vyrvjqa74JlvuK7HKWt/prnxIQhvUKGAwk6NHZsBsULF9PsUXast9Bi80zsrRxFRCG5
         Dk88awa9DcWMvRyM+zXisO0q4LAzaGM2fdLNkZGhVoHU9HlGLLSnwkk4Ix+9WaKvNP1C
         uPtQ==
X-Gm-Message-State: AFqh2koe0gGGk67Ehs9Addcd3jIIFpOEdKRPOHUpWuH4qrmgDn2R9+h8
	8XRJcaSbKSosEufqULJt1NeELtMtji4=
X-Google-Smtp-Source: AMrXdXswYsij1JjtTqxw7Et4Fu5lkhmF61EMf76EB+e2/W6iUFK6EWPHsX0xINuCIJSddz0xjRVziA==
X-Received: by 2002:a17:902:d905:b0:18d:6244:4676 with SMTP id c5-20020a170902d90500b0018d62444676mr23628699plz.18.1672133184294;
        Tue, 27 Dec 2022 01:26:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/9] powerpc/64s: Refactor initialisation after prom
Date: Tue, 27 Dec 2022 19:26:02 +1000
Message-Id: <20221227092609.2078908-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221227092609.2078908-1-npiggin@gmail.com>
References: <20221227092609.2078908-1-npiggin@gmail.com>
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

Move some basic Book3S initialisation after prom to a function similar
to what Book3E looks like. Book3E returns from this function at the
virtual address mapping, and Book3S will do the same in a later change,
so making them look similar helps with that.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 44 ++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 7558ba4eb864..5af2e473b195 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -475,8 +475,30 @@ SYM_FUNC_START_LOCAL(__mmu_off)
 	rfid
 	b	.	/* prevent speculative execution */
 SYM_FUNC_END(__mmu_off)
-#endif
 
+start_initialization_book3s:
+	mflr	r25
+
+	/* Setup some critical 970 SPRs before switching MMU off */
+	mfspr	r0,SPRN_PVR
+	srwi	r0,r0,16
+	cmpwi	r0,0x39		/* 970 */
+	beq	1f
+	cmpwi	r0,0x3c		/* 970FX */
+	beq	1f
+	cmpwi	r0,0x44		/* 970MP */
+	beq	1f
+	cmpwi	r0,0x45		/* 970GX */
+	bne	2f
+1:	bl	__cpu_preinit_ppc970
+2:
+
+	/* Switch off MMU if not already off */
+	bl	__mmu_off
+
+	mtlr	r25
+	blr
+#endif
 
 /*
  * Here is our main kernel entry point. We support currently 2 kind of entries
@@ -523,26 +545,10 @@ __start_initialization_multiplatform:
 
 #ifdef CONFIG_PPC_BOOK3E_64
 	bl	start_initialization_book3e
-	b	__after_prom_start
 #else
-	/* Setup some critical 970 SPRs before switching MMU off */
-	mfspr	r0,SPRN_PVR
-	srwi	r0,r0,16
-	cmpwi	r0,0x39		/* 970 */
-	beq	1f
-	cmpwi	r0,0x3c		/* 970FX */
-	beq	1f
-	cmpwi	r0,0x44		/* 970MP */
-	beq	1f
-	cmpwi	r0,0x45		/* 970GX */
-	bne	2f
-1:	bl	__cpu_preinit_ppc970
-2:
-
-	/* Switch off MMU if not already off */
-	bl	__mmu_off
-	b	__after_prom_start
+	bl	start_initialization_book3s
 #endif /* CONFIG_PPC_BOOK3E_64 */
+	b	__after_prom_start
 
 __REF
 __boot_from_prom:
-- 
2.37.2

