Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D09F47F660
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:03:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Qmn2jqdzDr68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:03:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o527z/wM"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PN13P6WzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:49 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c3so12725477pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9cVs3vrYiV1ttZGTPtn9kTYPYdXFehQY0y7nbVy7MPQ=;
 b=o527z/wMYjeVH2T67wsjYA2p0tHfEWGiJu5dClCBYcETNy1dri1btBn3XqGofj+eT4
 oSqEKk2M2SN8fscold0ur08D9HfnPvbc5IAKlSzjhysIZydRTEVOv2fin1bJfrNv0KAv
 z+/OKnc0bZKAd1JAkgaUkxqszdecz3qSKccdbrJOSXhP4bwMLQC7/4LD/Y3MkT9DEmru
 VP9LCR4RLx9jyacw3+Z9y5M7d7el2WaFK89uwpYkON1ChUcTd43gYBCZAvP/SlyesccP
 vm3Aexf4KQ14fEzBtJWjJNH+VeQQV8lx05TIGuDGTPLFJlfRTWFh1mSJ8AuO7iNqm2Ze
 OAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9cVs3vrYiV1ttZGTPtn9kTYPYdXFehQY0y7nbVy7MPQ=;
 b=nQIMUmPj4SM0CobKOhsViwUmTWh5XFnyBEjSbWEEK/OTvW1hpZ20weKalxZ6dzCHkW
 yszE62jxbxsCTBNNE+mlUzhg5EOYpAK2kCXX5fVWp0pZB6W6sG1jOsEBRR33Pg7yTpsC
 ZiCKtc/D22mtTwpX5ZFXMhirju1iZ3Zr31d2iDiLXh6N67+U2Nic5fBZm6q/PjsAbDLI
 wY4e+kj4LpfN9Amtaa2skCJorH4vL8jyhK6asvR9aVO8fuVE5Ll2LfKlo21ghjq59BGS
 dd3GFSmdulcsBLWKrYEWAZNbxmgqHkZhmzv9AqnwI6XdgAGwvE+TWi9o7DUPAb9CVBwA
 Rm6g==
X-Gm-Message-State: APjAAAV/xi5lH0me+g5PBQFQVeSB3C+kDyPAXwEReeLGuUkBMlcjrp0w
 b46j2PfTZAZ8tjpmGREBiDOqxT6J9x8=
X-Google-Smtp-Source: APXvYqx5glyKZ8EF9SEn1IYgCN/FjrehW/aBbUUHx5sDayJzy5IjyOeDWuciDbZjRLi8axUike6EuA==
X-Received: by 2002:a65:4304:: with SMTP id j4mr126737001pgq.419.1564743646803; 
 Fri, 02 Aug 2019 04:00:46 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 28/44] powerpc/64s/exception: Merge
 EXCEPTION_PROLOG_COMMON_2/3
Date: Fri,  2 Aug 2019 20:56:53 +1000
Message-Id: <20190802105709.27696-29-npiggin@gmail.com>
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

Merge EXCEPTION_PROLOG_COMMON_3 into EXCEPTION_PROLOG_COMMON_2.

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c36c6a029ee9..2b07dc49d14d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -399,7 +399,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r10,GPR1(r1);		/* save r1 in stackframe	*/ \
 
 /* Save original regs values from save area to stack frame. */
-#define EXCEPTION_PROLOG_COMMON_2(area)					   \
+#define EXCEPTION_PROLOG_COMMON_2(area, trap)				   \
 	ld	r9,area+EX_R9(r13);	/* move r9, r10 to stackframe	*/ \
 	ld	r10,area+EX_R10(r13);					   \
 	std	r9,GPR9(r1);						   \
@@ -415,9 +415,7 @@ BEGIN_FTR_SECTION_NESTED(66);						   \
 	std	r10,ORIG_GPR3(r1);					   \
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	GET_CTR(r10, area);						   \
-	std	r10,_CTR(r1);
-
-#define EXCEPTION_PROLOG_COMMON_3(trap)					   \
+	std	r10,_CTR(r1);						   \
 	std	r2,GPR2(r1);		/* save r2 in stackframe	*/ \
 	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe   */ \
 	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe	*/ \
@@ -453,8 +451,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	beq	4f;			/* if from kernel mode		*/ \
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
 	SAVE_PPR(area, r9);						   \
-4:	EXCEPTION_PROLOG_COMMON_2(area);				   \
-	EXCEPTION_PROLOG_COMMON_3(trap);				   \
+4:	EXCEPTION_PROLOG_COMMON_2(area, trap);				   \
 	ACCOUNT_STOLEN_TIME
 
 /*
@@ -464,8 +461,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 #define EXCEPTION_COMMON_STACK(area, trap)			\
 	EXCEPTION_PROLOG_COMMON_1();				\
 	kuap_save_amr_and_lock r9, r10, cr1;			\
-	EXCEPTION_PROLOG_COMMON_2(area);			\
-	EXCEPTION_PROLOG_COMMON_3(trap)
+	EXCEPTION_PROLOG_COMMON_2(area, trap)
 
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
@@ -968,8 +964,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 
 	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
-	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC)
-	EXCEPTION_PROLOG_COMMON_3(0x200)
+	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC, 0x200)
 
 	ld	r3,PACA_EXMC+EX_DAR(r13)
 	lwz	r4,PACA_EXMC+EX_DSISR(r13)
@@ -1617,8 +1612,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
-	EXCEPTION_PROLOG_COMMON_2(PACA_EXGEN)
-	EXCEPTION_PROLOG_COMMON_3(0xe60)
+	EXCEPTION_PROLOG_COMMON_2(PACA_EXGEN, 0xe60)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	hmi_exception_realmode
 	cmpdi	cr0,r3,0
-- 
2.22.0

