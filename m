Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF86568DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:30:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8XP6h8rz3c8P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:30:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lFtkw8UX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lFtkw8UX;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8RX2V7Qz2yJv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:32 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id b2so12727538pld.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dm4+sF4p4UPoGMfgYXFtw9Mbo1fZ4BmJa1G8wludqEo=;
        b=lFtkw8UXf8uKisLGmy+JeIjOU/sdbtPmQwhdvwSIc6YUXLGTGnUi9jWgpLT9HNbYpc
         JDY931fol6BlzmJSji1kh87TtQBNQN7JIoSE9ckbsm8tN+nZkI6A6qNk8RshqsqDfVnF
         cTRGgznoc6A6YTYJ6lECFv+pJVG3X+IlBJ34WtTI6Cdi9dsuvUX4gMW0n7eiksGVcWjW
         r3yF/5HR0/bTSGFJaPO6HUtmqAuQhWu+2Af81LOBiZIKNbEj6KqbUPTELCcC8d/7tieR
         6p5PxCwtlsHz3lDECPHk/j7RGODIkUS4mfijyc3suRKOZuIA6iqORbI0fVdWNhxs6gJd
         JrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dm4+sF4p4UPoGMfgYXFtw9Mbo1fZ4BmJa1G8wludqEo=;
        b=ZCRaScb4faAnTJh3BXZ9SE4ljyQQms7qaZa2TUWablfsb1xdsVygvVrTUAaHqeclil
         hsTzDlGXP1x2i7io1GBoFohSQPHYWqHZY9D4g7pgkRopLwa+vbTuSdNVm3s/X0K8HmMU
         anJVtKl4fU5/mIPAOkyAAuafr17YXe//7n3Y4pTPI4UMlMbCzelaue/54EFDPOxrVTX/
         L3qfgse/twOo3aBDMTO3/rwv5Hxxp7J1SRppLUntOixkauvCKHfRlBo9/gM/tp0tsTRA
         3141QZVJ01St615GTXylAXCn2qf3JZw3NPTDeCnmLkgaznFNNjIvUY+gbP8aLGBwHnv/
         KDKg==
X-Gm-Message-State: AFqh2kpF6jxqT/S9wRBcYEGxo/pembLOXXDazgPuJD8RPNCL9jPgPs9K
	ztSHUdTx5eEJhMFtffi3B5PIgHm/rPs=
X-Google-Smtp-Source: AMrXdXsZPWCmy2IDPBgANN7Iya3Nb0cdT6V1LJsrRUPX7PVH+U+XpFntxwlkrOoZLNGLCdLsLjf6ug==
X-Received: by 2002:a17:902:d212:b0:192:516c:33f6 with SMTP id t18-20020a170902d21200b00192516c33f6mr22406689ply.69.1672133190187;
        Tue, 27 Dec 2022 01:26:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/9] powerpc/64: Move initial base and TOC pointer calculation
Date: Tue, 27 Dec 2022 19:26:04 +1000
Message-Id: <20221227092609.2078908-5-npiggin@gmail.com>
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

A later change moves the non-prom case to run at the virtual address
earlier, which calls for virtual TOC and kernel base. Split these two
calculations for prom and non-prom to make that change simpler.

Signed: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 3a7266fa8a18..63f3b9b3cf7e 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -514,15 +514,6 @@ __start_initialization_multiplatform:
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
@@ -544,11 +535,30 @@ __start_initialization_multiplatform:
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
2.37.2

