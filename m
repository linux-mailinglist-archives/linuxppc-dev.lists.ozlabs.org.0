Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBFC7F684
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:09:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QvV5kkQzDr6L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="thXPe8qK"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PN64VttzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:54 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id t14so33492189plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZPncGKyUuv+Fz129Vq/YEs/fZua0dAtgi1QHISX2HE=;
 b=thXPe8qKz3hqL1dYtO2L1pmzaSdJbe5s3ZFYHGQrhAXuKaWP1GG57WqlttbrkRopa9
 hF1XDiLhw9+9gGdb4UmbqqC5H6SYT04QOJV3QF/Yp7qhqKGHKVZOn7xMQ4phZQyS5p6S
 OVsFEJESOhOyJroPVwjc3OzqsLuB9jhtrd43p0d+FZnCe2Sl1ZSwHd/HyYd28uErlb4h
 evHqV+yYVP06KJER/ut9HJgNi012chOYUVbMRSSlEpYA9Qvyo81E+nzcMMrK/Nba2fbF
 bb4LWpDHGkdH/rk4n1yScBtPAuDA/sLk7V3Rk4D1MGPMtyEaUXPew0/uLwEFrbq5128J
 curA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZPncGKyUuv+Fz129Vq/YEs/fZua0dAtgi1QHISX2HE=;
 b=W5+NbuukXd4D9Fl7Znoh+Ekwl1Au4G8Li9fY630bcfBbufuP9cs16K7R5ItRPAMw/G
 H4g9ecahD7YGvAK4wO4PPyiY6EWw0qDArr/ULaaN5bvTm0+sa2d6q1rCNVKI4gxXW/Xy
 mljpy+/5ZCBidQLi1BpVTamx6ezIuM2dLHuOG4CNloyTgvk1g63Ujj3kDFqvKrzj+xiT
 +3YpwlctIh0B3e2+Cr5Rdsx40JN7zDlbOo6SjHMqPIEV1PP8syI4yZdUb2Qs5D/RuCgS
 F5fcg6BRrjEtn4/n8MOMmnOajUSaa1zijVWHgazczgfOmMtMeZt7O74pTesZMY0daKtO
 wh2g==
X-Gm-Message-State: APjAAAXFY0RgFTPiRCH8Rw5cI5PD0IvAhXW+KmN965lusf7khYLvkoEl
 KvRiUTf9KiT+ZcD76HfjnHZloi4y+pM=
X-Google-Smtp-Source: APXvYqwS1AUb1l0xUJ/KrVlQRERAOInAKtUftllVygM7U0xck5z1DBn/FTAcvdAMoM8nI2s51gP1ow==
X-Received: by 2002:a17:902:145:: with SMTP id
 63mr134636072plb.55.1564743651260; 
 Fri, 02 Aug 2019 04:00:51 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 30/44] powerpc/64s/exception: Expand EXCEPTION_COMMON macro
 into caller
Date: Fri,  2 Aug 2019 20:56:55 +1000
Message-Id: <20190802105709.27696-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
index 0781e3573a0e..6ea9a7694bb2 100644
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

