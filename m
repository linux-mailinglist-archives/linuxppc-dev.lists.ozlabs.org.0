Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856B57B756
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnxFN74pXz3dr2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DO2zyHVV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DO2zyHVV;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnxDn08DHz308B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:21:44 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id l14-20020a17090a72ce00b001f20ed3c55dso2162183pjk.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TEhkD+pFWNbAsQt6uA2wSoH3zPBoGc42YXi5AX8LhUo=;
        b=DO2zyHVVp07FzsEKV17aJmls59vwOXmFJq1XW/mlZZ5xAnrwr2p/qauZ8ti5Ns5jYx
         vwa0VnAHBGA36idPLOFQXGORO16D2CJ6EmQL6Cxd6y4ecFIHFd/EhkpNWFbWbZBuOAqj
         hKWinejdlyzHX6DKG44tycdLkDXkdYk0wVNNNL5aloK0l79+Cws4K+X8O03qhwTJ9nHZ
         wrup3nNrXgiu7apNtFZwS5lu8ZnHTSSMyrqIG2iIVFlR2U8qVGMbhaT1Ysz/iAP6mGP7
         6rV22l3ymbTjJscwgkVzS/O+KGc+E3RYPh3NDr7Q/Zw4NFSMSlrgZLLQb44mDBVMDA6k
         Mxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TEhkD+pFWNbAsQt6uA2wSoH3zPBoGc42YXi5AX8LhUo=;
        b=1MWdN+3QHYEGdHl13NDNR+ikgIdALwXsumBmahcqXcmu9tiGOQLWLCOsxGNgXd8TY1
         jblegI6VxEeyeT8cDnMmbU9FFKnLMhJnmMil5BDfXAJ7m19QZ5f3GfFQixbbLojhtgGU
         4yw3VJWZIOZjCXaB6e762p8R5b/MxjxuPXohGROQDw50IhTElEOs11JDBX1LCkGOEaKU
         EnEXxPEqXsQ5CUlFn+mdOLIhJVOEGsVUb6hzuOnw3E3nPCLzWNJjYMdsp6ZGoqGJIURK
         SYNGqS4ucDtqEX+zsApi6+/REYHo5xg86KWkSf0XxQyR4Eb4Lqy11KzIqBphtkY71DqG
         dncA==
X-Gm-Message-State: AJIora+U5qC182UYWXCghCsNFdSD5gFabUHwIkv+NsYUNsTxp/Zv2lBj
	FcagsWGEiqnIy2q+urjx8/8xxiizwSk=
X-Google-Smtp-Source: AGRyM1tZPmybfFbOBlT5QmMpjZ/3RJGg4LarjgZQmPx0CYcaH5kUgjMxRvq009hnhwYLnFG+vzwWIQ==
X-Received: by 2002:a17:90b:1c08:b0:1f2:19da:aa04 with SMTP id oc8-20020a17090b1c0800b001f219daaa04mr4726267pjb.90.1658323302635;
        Wed, 20 Jul 2022 06:21:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0016bf4428586sm13827504plb.208.2022.07.20.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:21:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] powerpc: add ISA v3.0 / v3.1 wait opcode macro
Date: Wed, 20 Jul 2022 23:21:31 +1000
Message-Id: <20220720132132.903462-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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

The wait instruction encoding changed between ISA v2.07 and ISA v3.0.
In v3.1 the instruction gained a new field.

Update the PPC_WAIT macro to the current encoding. Rename the older
incompatible one with a _v203 suffix as it was introduced in v2.03
(the WC field was introduced in v2.07 but the kernel only uses WC=0).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Update naming, patch changelog and title.
v3: v2 sent incorrect patches, sorry. 

 arch/powerpc/include/asm/ppc-opcode.h | 7 +++++--
 arch/powerpc/kernel/idle_book3e.S     | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 89beabf5325c..e6fc3b26c145 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -331,6 +331,7 @@
 #define __PPC_XSP(s)	((((s) & 0x1e) | (((s) >> 5) & 0x1)) << 21)
 #define __PPC_XTP(s)	__PPC_XSP(s)
 #define __PPC_T_TLB(t)	(((t) & 0x3) << 21)
+#define __PPC_PL(p)	(((p) & 0x3) << 16)
 #define __PPC_WC(w)	(((w) & 0x3) << 21)
 #define __PPC_WS(w)	(((w) & 0x1f) << 11)
 #define __PPC_SH(s)	__PPC_WS(s)
@@ -398,7 +399,8 @@
 #define PPC_RAW_RFDI			(0x4c00004e)
 #define PPC_RAW_RFMCI			(0x4c00004c)
 #define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_RAW_WAIT(w)			(0x7c00007c | __PPC_WC(w))
+#define PPC_RAW_WAIT_v203		(0x7c00007c)
+#define PPC_RAW_WAIT(w, p)		(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
 #define PPC_RAW_TLBIE(lp, a)		(0x7c000264 | ___PPC_RB(a) | ___PPC_RS(lp))
 #define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
 	(0x7c000264 | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
@@ -613,7 +615,8 @@
 #define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
-#define PPC_WAIT(w)		stringify_in_c(.long PPC_RAW_WAIT(w))
+#define PPC_WAIT_v203		stringify_in_c(.long PPC_RAW_WAIT_v203)
+#define PPC_WAIT(w, p)		stringify_in_c(.long PPC_RAW_WAIT(w, p))
 #define PPC_TLBIE(lp, a) 	stringify_in_c(.long PPC_RAW_TLBIE(lp, a))
 #define	PPC_TLBIE_5(rb, rs, ric, prs, r) \
 				stringify_in_c(.long PPC_RAW_TLBIE_5(rb, rs, ric, prs, r))
diff --git a/arch/powerpc/kernel/idle_book3e.S b/arch/powerpc/kernel/idle_book3e.S
index cc008de58b05..6447de51ea71 100644
--- a/arch/powerpc/kernel/idle_book3e.S
+++ b/arch/powerpc/kernel/idle_book3e.S
@@ -77,7 +77,7 @@ _GLOBAL(\name)
 
 .macro BOOK3E_IDLE_LOOP
 1:
-	PPC_WAIT(0)
+	PPC_WAIT_v203
 	b	1b
 .endm
 
-- 
2.35.1

