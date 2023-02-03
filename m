Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D656897ED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Ydz0DH1z3f7q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:41:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AkTin+jU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AkTin+jU;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Yb43BV2z3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:39:12 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id g13so135594ple.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF8rQF5x5iL8Nz/hflDvxt+4w8zOZbVoF0ANzAFoMt8=;
        b=AkTin+jU4KvSGGJFIwffEcfIgGw8V+mmBb8bbo9b/0zL5oXnPBIEcF1TTx7n5unmwp
         Q6wx3hGdfW5WayFCor8bgmXB0OrcNv3wNNorGSEU7A4Lnm+c3ePS7up6TXcT+xPn3t12
         jhMS7w6hlY9R/zb+D1W2p3i+nzYIMqsq2OVzdDYzJKPA+ed78zAabKqVB+2EU9W2xkor
         DJv8PpIxeoGYCJ1rtPmx3mk0YuAciY1QZJuI2EShoQBxWOy6e1qu8gTZO1CR0hWqbPRB
         xLFY5EEVvE0UpEAjqtVsrTRD8kxAqXmtmXOgYQp71pJWNRZukJparZiiVWD6H0RwHuVx
         NTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF8rQF5x5iL8Nz/hflDvxt+4w8zOZbVoF0ANzAFoMt8=;
        b=6VoUpQp6dGShRbK123lVPvrdeGdnyRiO3WMly/jtC75E9tZjh8XuINb5DduYz+LLHR
         Ul6vvDvtzdWJRxnYKFeNfabXAgfmajj1zOYJZIlvCD4TCnu+6hd1GaYXjvQf11yvLreW
         bFQcwmZjv6u8h4XRekZNfLZi9Sh5wI8+MwQ7IqFCIEh+DapfCGQ4nZBRuax7ksMzCkkn
         g1oNXkJbCDJQEStZ2CSxxika1uDlX/PmPrMweIIPska0/prg2beOqgIbfl7EwlhivEXL
         QyyP2S/zQ/CpwghBqvPwPAzCN56pG94fRgYVUHlDikwF1U3pyvFf0SgxVUyUVKbxJFm5
         yHSA==
X-Gm-Message-State: AO0yUKVNv3VH04t89E9/rssjFXeYxRvy+L555IBAtj9sgG4XnJcEW4NY
	HElYVPfCtpkGkibeJQRP5XmIBmBOP2s=
X-Google-Smtp-Source: AK7set/EHzzMGYg9JnivQAhMCS2soDbBrphBWnub3mbAjpls9YHSQ8scbCPo4AG1M5X+uB6MUOYukQ==
X-Received: by 2002:a17:90a:19:b0:230:2226:d10 with SMTP id 25-20020a17090a001900b0023022260d10mr10085822pja.45.1675424350231;
        Fri, 03 Feb 2023 03:39:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b0022bf4d0f912sm4792964pjh.22.2023.02.03.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:39:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s: Refactor initialisation after prom
Date: Fri,  3 Feb 2023 21:38:57 +1000
Message-Id: <20230203113858.1152093-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203113858.1152093-1-npiggin@gmail.com>
References: <20230203113858.1152093-1-npiggin@gmail.com>
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

