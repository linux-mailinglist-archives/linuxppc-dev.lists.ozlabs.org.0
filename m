Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66578F11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:22:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y3My2yQPzDqDy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NB/ouqXU"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1ry5vC7zDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:14:10 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id f17so24119243pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vj26kmMb0OHym4ecWxBShXJPwtsGHDBme/NdioODVlU=;
 b=NB/ouqXUSD1MyFdXUVhsM18bd/fh6Y4e0LDInMz1tccHuC9MA0/MxOVOijQErc42u2
 QTqAmPnoiXOivAqWtdP9wN8pdaS49EytheOmpb9cvA8gUilyZFHlD16elj4d4y5th5NV
 x2FUU6dnvlGnLQ3TJ+Rf1jALqiqxIEPIsaRo2wK7ZKvjUIwjIkaAv+jK6Rrf4ouaL/Tg
 oUKfhrNswFVwECwRDHXTlqIrVYcED1Gp4fPlFrNLL9ke0yKRKvbd7hTQM6PsFLmf0AQS
 VfQ8BKQ+32CBu8LmWpqC7fqfjIFbtr8lkqE4gLQkoCnLIHN1Kxk67+bYvmIUFZ3Ufw4V
 u4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vj26kmMb0OHym4ecWxBShXJPwtsGHDBme/NdioODVlU=;
 b=liCTn91ofVsf8VyTyOqO+z1jzfVfPl297kMEqCSXjfHfPPz235f2groD/uvk7E+wSl
 0C8r06k5FGZbeBwu45dNlI1sp+yyBp2+WlK7YNg9rXyS8J36SGptDnPmcEAQxp/deTRG
 L4ffSg5NShR+EUzv2jpMT9e+j+OGTTx7wlfdADlkD3hBGtuQHJNibgkwM99CNdKPT//W
 Ss1tEo9k+LgscTiZd8ccdUeXBiINqaFaYlZJVUOpSoBmYlgAU6ENdaylsqtEYpeDUict
 iH35nuNhsVBnUNxnXYdilrTwXcUU+S1T+Zi9PlBrkfZNAJk3kZb8WlaiVEb3P+u5IKp3
 XEQQ==
X-Gm-Message-State: APjAAAVujLHgnq633LKY8X6QhaNB4tQC33akckvTDhj44YvOSVnYQmuh
 Y6PfnS/pvTrgMC27wZ1m0z4UzjRlz7Q=
X-Google-Smtp-Source: APXvYqyAN/lyilTuSNYme0wuxk/SGvgiH/sjGLdQw5Mn4YoFhUCktTXsyQ5SanxAyw/UjSNF7bZ7IA==
X-Received: by 2002:a62:6044:: with SMTP id u65mr36155888pfb.15.1564409648841; 
 Mon, 29 Jul 2019 07:14:08 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.14.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:14:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/18] powerpc/64s/exception: program check handler do not
 branch into a macro
Date: Tue, 30 Jul 2019 00:12:47 +1000
Message-Id: <20190729141247.26762-19-npiggin@gmail.com>
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

It's a bit too clever to jump to a label inside an expanded macro,
particularly when the label is just a number rather than a descriptive
name.

So expand interrupt handler code twice, for the stack and no stack
cases, and branch to those. The slight code size increase is worth
the improved clarity of branches for this non-performance critical
code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0ee8c4a744c9..69f71c8759c5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -533,11 +533,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
-	beq-	1f
+	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
-1:	tdgei	r1,-INT_FRAME_SIZE	/* trap if r1 is in userspace	*/
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0
-3:
+100:	tdgei	r1,-INT_FRAME_SIZE	/* trap if r1 is in userspace	*/
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,0
 	.endif
 
 	std	r9,_CCR(r1)		/* save CR in stackframe	*/
@@ -551,10 +550,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.if \kaup
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
 	.endif
-	beq	4f			/* if from kernel mode		*/
+	beq	101f			/* if from kernel mode		*/
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
 	SAVE_PPR(\area, r9)
-4:
+101:
 	.else
 	.if \kaup
 	kuap_save_amr_and_lock r9, r10, cr1
@@ -1325,9 +1324,11 @@ EXC_COMMON_BEGIN(program_check_common)
 	mr	r10,r1			/* Save r1			*/
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
-	b 3f				/* Jump into the macro !!	*/
+	INT_COMMON 0x700, PACA_EXGEN, 0, 1, 1, 0, 0
+	b 3f
 2:
 	INT_COMMON 0x700, PACA_EXGEN, 1, 1, 1, 0, 0
+3:
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-- 
2.22.0

