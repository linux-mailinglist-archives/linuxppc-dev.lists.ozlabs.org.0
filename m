Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911B78E95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:01:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2vl6cpdzDqHj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iiP0AKzC"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rk0HGKzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:57 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id b7so27618714pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYpN04y5pxaKeHTX52Vo9G+ss/k/dRt6m/n+jddUlYU=;
 b=iiP0AKzCvHg6gmDY9WEB89pCnIScFXLEg/DKC27LLnP3TMC2W7iA8wdswqkh07pg+Z
 SJuTB6gsQuowg/gYS80+680eMaWCqaDe2tobOxOWYFdQT+3Bz+ZZNJaN6iqC65RIbcPV
 c4e4l8LCSbd9CuIXm2V2iYqp0Rs516d6v+NIg6aRpGCijKbEF+e4nBpUzmoG1I+z5nBO
 4ENu3FM3+BZlzRLW7i2VkmCmLqh5wgJwJDMs/KnFwQ+ZavS9yXhrhVz9vQETQlFxa0WO
 BkYuQ0EonBbsNqtzL3JIOswx0HNyLQyQ2xmF9c7qQkBxdrtdIgY7KCX6ESRRAH10RRkt
 cLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYpN04y5pxaKeHTX52Vo9G+ss/k/dRt6m/n+jddUlYU=;
 b=m5T90fvry4uFNvi/gbegQUhc0FfJpVlcozC33DgzSHQ4W48nA4K2mzyQgsBsXa1ied
 KLsIJ+yIHZ0oKWq8ZjLCFN6dOLZau5xh1VR/Os64m6qv+3sKtHQ9EH0eeUHUduCD+DT8
 0pIj1st8/iNaL5WuiHd74qm5HECTzw9pbcTTaPUsMJN0JlRfkMPyCJqrCQDs54wdc32p
 mEcojEUyUAyoF/lbA+RVUGkIqM2LoqvpJaiJI5c808BmpfTxQS1650E2qoGWI4nL6MaQ
 DrixmG3dlWVFOa3zwX9PbxVpjzI6Hwg+cMmZ/To5Qmn5eM4xMn+dgOdn0ytVn5nhp6eS
 1qJA==
X-Gm-Message-State: APjAAAW4gSia4/il/lypm3i7s0cuCHOffhDfwtqIN0kcAKKMYDHQnQEJ
 UNjTXUBli2X2uDvOBB+HD3ypEkFustU=
X-Google-Smtp-Source: APXvYqxKi+byKfxNqt1BIrBJqWYWdAkIErqXC5tJHQowynkWN7q+sPcQsZlO0AgRzbrpVC1/8M7rkw==
X-Received: by 2002:a17:902:2a6b:: with SMTP id
 i98mr104347092plb.75.1564409635412; 
 Mon, 29 Jul 2019 07:13:55 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/18] powerpc/64s/exception: Merge EXCEPTION_PROLOG_COMMON_2/3
Date: Tue, 30 Jul 2019 00:12:41 +1000
Message-Id: <20190729141247.26762-13-npiggin@gmail.com>
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

Merge EXCEPTION_PROLOG_COMMON_3 into EXCEPTION_PROLOG_COMMON_2.

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e46d27be06fe..565b9c18aa0c 100644
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

