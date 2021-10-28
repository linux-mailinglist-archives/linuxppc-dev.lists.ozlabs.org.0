Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2005A43E243
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 15:31:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg60P6qJyz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 00:31:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b5II9gDc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b5II9gDc; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg5zm21K6z2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 00:30:58 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id g184so6371724pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7l8ux23ubt5mhUS6nx5tXMgLuxvkB3AFZilkTPSPOzo=;
 b=b5II9gDcyVch4MIURba1gkmSnbImUQP/qF6LdaEOwEHvhtHjJs3cKhR0r7VifFgPaa
 OIGYDMp+/gw7dD4/PoA6SwaJmGdcqidewbC0LsLT5dsnGJA9GauTuwxJmdvhr8ARQoT+
 3MZv7CFFlUUDkJea3vzH+VZz+bzxVEtP1wqyLGDeyHLU2Lp28la0cLLkC3mEZw/yqERH
 3niXlHGT29pmXX0G42MjjRqtzCLCq5QTz8mhU6I1uxdnYjuBQ8blRGSSHHkZ08mFvsig
 WeRGA4XrYHkuIMdirAzWv3m2IC7qexYmrdIF5Exdtln25WKk1YFPZqwE45oaObleoJuw
 zjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7l8ux23ubt5mhUS6nx5tXMgLuxvkB3AFZilkTPSPOzo=;
 b=w/PGw75L8UWZsk1kOad3R1FzrnLLsssnhIE1RVkwc2EUFu0LLsfBuJ9Av+LVaCO0dm
 NUs5aKlMev6Y01oMvp++FUbzyTpUwkj0tSo263UyxUA8L9FQebsUeZ9tOV4+QiOc5To0
 FeHPHqVeT9UjxWlpSCQDx3FQYF00WAqlfCSjo0GrjZe5Cxgjk/N3/wdW46uCm/IuXa+/
 Gtga2YxM2Q828vmVZANxwvrAh/GXQ1DyaDY58UoCkdCMXQvqk7AvwW5x6hZ2rMZq8AUT
 rHyy+l8Pt7NsWtb/AE6rZBKC3WxjeesXxbZ+x0PqByf/vi5SyrGPlnOm1EkVaAR/oLp3
 HlVA==
X-Gm-Message-State: AOAM533B+iaujWGMgPQT8/0SHWH6EOJNWH+Txf0K/xIe4+Ni++v7MDeI
 vTfMkA7MPsPMwWKZAxF29/5FUwFwsHY=
X-Google-Smtp-Source: ABdhPJxWBylLhdBbNnNiaVO6qoYUpohZPPpjFNCTv8ft1M1g8PYT2c2eHXYLdxpaDCfAQ88rFkgxIA==
X-Received: by 2002:a63:7a4e:: with SMTP id j14mr3235387pgn.135.1635427854618; 
 Thu, 28 Oct 2021 06:30:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id e14sm3717347pfv.192.2021.10.28.06.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:30:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32e: Ignore ESR in instruction storage interrupt
 handler
Date: Thu, 28 Oct 2021 23:30:43 +1000
Message-Id: <20211028133043.4159501-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Jacques de Laval <jacques.delaval@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A e5500 machine running a 32-bit kernel sometimes hangs at boot,
seemingly going into an infinite loop of instruction storage interrupts.
The ESR SPR has a value of 0x800000 (store) when this happens, which is
likely set by a previous store. An instruction TLB miss interrupt would
then leave ESR unchanged, and if no PTE exists it calls directly to the
instruction storage interrupt handler without changing ESR.

access_error() does not cause a segfault due to a store to a read-only
vma because is_exec is true. Most subsequent fault handling does not
check for a write fault on a read-only vma, and might do strange things
like create a writeable PTE or call page_mkwrite on a read only vma or
file. It's not clear what happens here to cause the infinite faulting in
this case, a fault handler failure or low level PTE or TLB handling.

In any case this can be fixed by having the instruction storage
interrupt zero regs->dsisr rather than storing the ESR value to it.

Link: https://lore.kernel.org/linuxppc-dev/1635306738.0z8wt7619v.astroid@bobo.none/
Fixes: a01a3f2ddbcd ("powerpc: remove arguments from fault handler functions")
Reported-by: Jacques de Laval <jacques.delaval@protonmail.com>
Tested-by: Jacques de Laval <jacques.delaval@protonmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_booke.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index e5503420b6c6..ef8d1b1c234e 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -465,12 +465,21 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	bl	do_page_fault;						      \
 	b	interrupt_return
 
+/*
+ * Instruction TLB Error interrupt handlers may call InstructionStorage
+ * directly without clearing ESR, so the ESR at this point may be left over
+ * from a prior interrupt.
+ *
+ * In any case, do_page_fault for BOOK3E does not use ESR and always expects
+ * dsisr to be 0. ESR_DST from a prior store in particular would confuse fault
+ * handling.
+ */
 #define INSTRUCTION_STORAGE_EXCEPTION					      \
 	START_EXCEPTION(InstructionStorage)				      \
-	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);		      \
-	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
+	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);			      \
+	li	r5,0;			/* Store 0 in regs->esr (dsisr) */    \
 	stw	r5,_ESR(r11);						      \
-	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
+	stw	r12, _DEAR(r11);	/* Set regs->dear (dar) to SRR0 */    \
 	prepare_transfer_to_handler;					      \
 	bl	do_page_fault;						      \
 	b	interrupt_return
-- 
2.23.0

