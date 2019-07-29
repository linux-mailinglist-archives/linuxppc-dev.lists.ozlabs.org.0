Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19078EBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:09:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y34S1TqCzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pbaiq4A6"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rp03vMzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:14:02 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y15so28116957pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9hNDVkmKFrBlQO1kQFukm+Mqv1IusKvnlpxpnblhr4=;
 b=Pbaiq4A683THZ0bZVqB3eCvdgBS7cDYHp0jMujwwUgRHTnB2y0WuzJg+xXMxvRtZIK
 AKWuk4RoSvsQHdn1B1RyWAxVrBtXLCnz7kBiBwZtAtBajlxH6kEtZFgcN2gKsw48STQK
 MZ9QIEsTZ3Kn5aVWx87kS7btLIXJSTT4H36h/hVPoes0ps/tdjVi5cGXWooe7pCp0YNw
 1jrylGLyXmG0ziSnp/Um7pCz+hk4V02tDQ/K7sPld9Jpa+elXTs+ZrSnqgWhn4pHfp+U
 OuLKZojkMvHTQiGXNA7TPkaKssydv2WTjzXkb07NqkkZzppmYOaAnbNKP1EqJEMeXGlb
 20VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9hNDVkmKFrBlQO1kQFukm+Mqv1IusKvnlpxpnblhr4=;
 b=ISSmpOARpEezdz0ZEwl7rKNn1wK3TySdSK2jEvSQEzLsqt/bvQO6lML0aSx/WQkdMP
 Jy5YqWqpPqXQqvSzh7pKNhecJP0l03/5IbA8LZp0Pbd+selpFkb9bwAtCGU/a2fkZpsW
 9LiHpN2Tk+fHMrgFadhQI97Na6jgEY3C70p9Bhd77g+C3mLc5yo5XVWH0hgYvz0fwEvq
 OLhCHWNMgO666DxDYCMsrw/IPuTKRhSKKg+UifjIMkmz7NMPRexsG62tyEr385s2fLd8
 WDv83/K0ghtsDL3HXMhUcUB83YAQWjkR4J2ax6pa66El9W2/Pw11E7ceMtIjgnS9J2YO
 snTg==
X-Gm-Message-State: APjAAAVl/mBGcGnB2h6yPLFCOqHHXK+PVjKyNVS8dgcvPrYtQgLci7BA
 1TqkxPFPi1CEOkWQAVHI8uEGSOCZyiw=
X-Google-Smtp-Source: APXvYqzdg9i+pIttghoPWQz09dLk1I7kZ9mt2VASuUUBXt6Vmr+/T8v8jBq/v6T39CoY/nd9SHvCRQ==
X-Received: by 2002:aa7:8641:: with SMTP id a1mr37061669pfo.177.1564409639908; 
 Mon, 29 Jul 2019 07:13:59 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/18] powerpc/64s/exception: Expand EXCEPTION_COMMON macro
 into caller
Date: Tue, 30 Jul 2019 00:12:43 +1000
Message-Id: <20190729141247.26762-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 54 ++++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d5ded748de6..ff949d6139d3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -437,41 +437,41 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
  * SRR1, and relocation is on.
+ *
+ * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
+ * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
  */
-#define EXCEPTION_COMMON(area, trap)					   \
-	andi.	r10,r12,MSR_PR;		/* See if coming from user	*/ \
-	mr	r10,r1;			/* Save r1			*/ \
-	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
-	beq-	1f;							   \
-	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
-1:	tdgei	r1,-INT_FRAME_SIZE;	/* trap if r1 is in userspace	*/ \
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;				   \
-3:	EXCEPTION_PROLOG_COMMON_1();					   \
-	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
-	beq	4f;			/* if from kernel mode		*/ \
-	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
-	SAVE_PPR(area, r9);						   \
-4:	EXCEPTION_PROLOG_COMMON_2(area, trap);				   \
-	ACCOUNT_STOLEN_TIME
-
-/*
- * Exception where stack is already set in r1, r1 is saved in r10.
- * PPR save and CPU accounting is not done (for some reason).
- */
-#define EXCEPTION_COMMON_STACK(area, trap)			\
-	EXCEPTION_PROLOG_COMMON_1();				\
-	kuap_save_amr_and_lock r9, r10, cr1;			\
-	EXCEPTION_PROLOG_COMMON_2(area, trap)
-
 .macro INT_COMMON vec, area, stack, kaup
 	.if \stack
-	EXCEPTION_COMMON(\area, \vec)
-	.else
+	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
+	mr	r10,r1			/* Save r1			*/
+	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
+	beq-	1f
+	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
+1:	tdgei	r1,-INT_FRAME_SIZE	/* trap if r1 is in userspace	*/
+	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0
+3:
+	.endif
 	EXCEPTION_PROLOG_COMMON_1()
+
+	.if \stack
+	.if \kaup
+	kuap_save_amr_and_lock r9, r10, cr1, cr0
+	.endif
+	beq	4f			/* if from kernel mode		*/
+	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
+	SAVE_PPR(\area, r9)
+4:
+	.else
 	.if \kaup
 	kuap_save_amr_and_lock r9, r10, cr1
 	.endif
+	.endif
+
 	EXCEPTION_PROLOG_COMMON_2(\area, \vec)
+
+	.if \stack
+	ACCOUNT_STOLEN_TIME
 	.endif
 .endm
 
-- 
2.22.0

