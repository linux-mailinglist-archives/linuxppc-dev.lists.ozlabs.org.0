Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DF7F6A1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:13:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QzR4rx5zDr6T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:13:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0HF45zU"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PN80ZLXzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:55 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d1so3080184pgp.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5dqkohZ6XM9pd36/BcjDUAGyQuD6sOXWfdbEkHnC4c=;
 b=T0HF45zUHjbeveDufmMgp/focRfkAxk6AJRinnpRhAVpCIZUMe+STppJuNYYH7mn7k
 5NLmcwD7tLeJvnoYHO9q+I0EoDOM/WmXS6/scyZVE2unGCNigwr5jhbntYIuf2fhgtr/
 MAcyUDebM0Q3ZBqWZpCZ9BHooIhAghwXyUfL+v/PGtx1GVa2+xJrgGtRvWCUDyFY/tH3
 A9vkFMWOvs9McmqOOzoEegAiCYe/T18UBkjWmmqykxsgy8oyZkgpuHNFbyiHmEPQGHzG
 Gg5z5X0Jwd15lLKBraZMBXPHYvtsQ0nggrqjH5Gc2VcLNErQ4Yq7SCUwWKj+YS2NpEUH
 YMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x5dqkohZ6XM9pd36/BcjDUAGyQuD6sOXWfdbEkHnC4c=;
 b=b2y07kT8awgT1kEuRQDvbhDuGF22hHWSQ3dSOUZzKYqGa4s4ETX4SGXsw08Gx+15D3
 ODDtBzGHU1ajuuSu/5kbz54IL9npHW62qU6F5pLkeFNPaxF+TjYZKhehcRCJfLwGqXQr
 N02xPTbPMxhWlE9kfplUClEVMYX842hI8yXfbBFfCgbPbnPbEx3bH+FXWrD/OYrw5boX
 BU0NaBV5MgdjJjeEjwu8BMmM1fnmTCwNGzGLpSuqQ1+NdhHDmEs+pCgxzqGIYE9QPbKO
 tz2r7ptAh4iZOVIPGb4ygmWdhgGiiaAxm5DbNZn6u6UkLNqzaufj0HZtfXjFBZ3cZ2qG
 hCHg==
X-Gm-Message-State: APjAAAWafRH4CdtIReWY9UP+JGw+I0gc59nVm/8xRjH9h/XaGUHamIEs
 nlV9rDEIAaVC7ALnguR/q0o/FMIjLG4=
X-Google-Smtp-Source: APXvYqwugm2UlQngJSBiPpa85Yfm195QBfnpHurc3KxesCaGGJOd+RhsFw65wF6JpYg7PpaoyWSgbQ==
X-Received: by 2002:a17:90a:4806:: with SMTP id
 a6mr3830200pjh.38.1564743653384; 
 Fri, 02 Aug 2019 04:00:53 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 31/44] powerpc/64s/exception: Expand
 EXCEPTION_PROLOG_COMMON_1 and 2 into caller
Date: Fri,  2 Aug 2019 20:56:56 +1000
Message-Id: <20190802105709.27696-32-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 85 +++++++++++++---------------
 1 file changed, 40 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ea9a7694bb2..e1a5a5e8d4f7 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -390,49 +390,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 .endm
 #endif
 
-#define EXCEPTION_PROLOG_COMMON_1()					   \
-	std	r9,_CCR(r1);		/* save CR in stackframe	*/ \
-	std	r11,_NIP(r1);		/* save SRR0 in stackframe	*/ \
-	std	r12,_MSR(r1);		/* save SRR1 in stackframe	*/ \
-	std	r10,0(r1);		/* make stack chain pointer	*/ \
-	std	r0,GPR0(r1);		/* save r0 in stackframe	*/ \
-	std	r10,GPR1(r1);		/* save r1 in stackframe	*/ \
-
-/* Save original regs values from save area to stack frame. */
-#define EXCEPTION_PROLOG_COMMON_2(area, trap)				   \
-	ld	r9,area+EX_R9(r13);	/* move r9, r10 to stackframe	*/ \
-	ld	r10,area+EX_R10(r13);					   \
-	std	r9,GPR9(r1);						   \
-	std	r10,GPR10(r1);						   \
-	ld	r9,area+EX_R11(r13);	/* move r11 - r13 to stackframe	*/ \
-	ld	r10,area+EX_R12(r13);					   \
-	ld	r11,area+EX_R13(r13);					   \
-	std	r9,GPR11(r1);						   \
-	std	r10,GPR12(r1);						   \
-	std	r11,GPR13(r1);						   \
-BEGIN_FTR_SECTION_NESTED(66);						   \
-	ld	r10,area+EX_CFAR(r13);					   \
-	std	r10,ORIG_GPR3(r1);					   \
-END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
-	GET_CTR(r10, area);						   \
-	std	r10,_CTR(r1);						   \
-	std	r2,GPR2(r1);		/* save r2 in stackframe	*/ \
-	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe   */ \
-	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe	*/ \
-	mflr	r9;			/* Get LR, later save to stack	*/ \
-	ld	r2,PACATOC(r13);	/* get kernel TOC into r2	*/ \
-	std	r9,_LINK(r1);						   \
-	lbz	r10,PACAIRQSOFTMASK(r13);				   \
-	mfspr	r11,SPRN_XER;		/* save XER in stackframe	*/ \
-	std	r10,SOFTE(r1);						   \
-	std	r11,_XER(r1);						   \
-	li	r9,(trap)+1;						   \
-	std	r9,_TRAP(r1);		/* set trap number		*/ \
-	li	r10,0;							   \
-	ld	r11,exception_marker@toc(r2);				   \
-	std	r10,RESULT(r1);		/* clear regs->result		*/ \
-	std	r11,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame	*/
-
 /*
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
@@ -452,7 +409,13 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0
 3:
 	.endif
-	EXCEPTION_PROLOG_COMMON_1()
+
+	std	r9,_CCR(r1)		/* save CR in stackframe	*/
+	std	r11,_NIP(r1)		/* save SRR0 in stackframe	*/
+	std	r12,_MSR(r1)		/* save SRR1 in stackframe	*/
+	std	r10,0(r1)		/* make stack chain pointer	*/
+	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
+	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
 
 	.if \stack
 	.if \kaup
@@ -468,7 +431,39 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	.endif
 	.endif
 
-	EXCEPTION_PROLOG_COMMON_2(\area, \vec)
+	/* Save original regs values from save area to stack frame. */
+	ld	r9,\area+EX_R9(r13)	/* move r9, r10 to stackframe	*/
+	ld	r10,\area+EX_R10(r13)
+	std	r9,GPR9(r1)
+	std	r10,GPR10(r1)
+	ld	r9,\area+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
+	ld	r10,\area+EX_R12(r13)
+	ld	r11,\area+EX_R13(r13)
+	std	r9,GPR11(r1)
+	std	r10,GPR12(r1)
+	std	r11,GPR13(r1)
+BEGIN_FTR_SECTION_NESTED(66)
+	ld	r10,\area+EX_CFAR(r13)
+	std	r10,ORIG_GPR3(r1)
+END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
+	GET_CTR(r10, \area)
+	std	r10,_CTR(r1)
+	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
+	SAVE_4GPRS(3, r1)		/* save r3 - r6 in stackframe   */
+	SAVE_2GPRS(7, r1)		/* save r7, r8 in stackframe	*/
+	mflr	r9			/* Get LR, later save to stack	*/
+	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
+	std	r9,_LINK(r1)
+	lbz	r10,PACAIRQSOFTMASK(r13)
+	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
+	std	r10,SOFTE(r1)
+	std	r11,_XER(r1)
+	li	r9,(\vec)+1
+	std	r9,_TRAP(r1)		/* set trap number		*/
+	li	r10,0
+	ld	r11,exception_marker@toc(r2)
+	std	r10,RESULT(r1)		/* clear regs->result		*/
+	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 
 	.if \stack
 	ACCOUNT_STOLEN_TIME
-- 
2.22.0

