Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06161098DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:36:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXhK0z0GzDqDl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:36:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XTzqwMQg"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNL2hCTzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:42 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id k1so8345040pgg.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FLB0Ev0PKm9f6RzlrGPoCMUC62f8kvrt+zWMSDOW4k=;
 b=XTzqwMQgyubwAbtR2Zf6gkjv2yAqZ3gH0aMiZxpr97/AUgpKne3D5bHORnRqKROI9q
 WXw40aAP/utVLyPWA5WygNILhJr1J0PcuGh/moLupC+XFmWkK6FwpggvZCOWP4wj3Oqp
 2YJCi45TSu5PhwhSpMLoMlooycg2UZG+ZtgH4VnB0Q84fnKRa/bfsrj92RbYHq9PBEtG
 q69lx2L4CLiLHD+PJ78PNYFlIOoYrFvZAadOGnw9vzTo6sV/rqCSl2ynzJ7sU3nyswFY
 LxrgfpREurfMJmdUgGBVvE8ReEzOXn+Q3nv7J4Y2j+zHCgXQUtqzuCpUW/yX71p0qCMK
 0LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FLB0Ev0PKm9f6RzlrGPoCMUC62f8kvrt+zWMSDOW4k=;
 b=GvNNSRM9NWYw//FnjVAB+PfvO7VIquch8Ltb4Y86e3H0M6TQkY8a/jLyDq/mdXAgZn
 zcHV1q9iC4zFCtPgg0YJdg2b3bDFcaoDCY2NJ6vQpW/bDUykVe2E802K6TDhLn9D32so
 /4Wj7FYMBrSDUqOq4FmnTUQkwekEuZCWZ2b4vrx9e3Y9F0sYAC9arLX/W8ugL87I3LZb
 3qtlr+Ew3PNgVL3tuZQbOHebEj0YlFn87aWnCS8ID3OPK6e8Zsqzs9wa725X2dtzj3lG
 OYqvAMksjdQPDB4QFtMlHWy0hyJbbs2KPVdOOQtSCOvBaLtc7I9GlXEXU/ER8q0pegmp
 Vo0Q==
X-Gm-Message-State: APjAAAVrnWiGVol+oWF/EDcTy0gxJ4D8jWG4dBOYSx/nlljWqOgGJQCr
 xuhq+3d3Y2jDkXnUa8zH0Y+GScLQ
X-Google-Smtp-Source: APXvYqwAsA2IPJE/lqabWInNpskP7gP997V2XdxhP/MQwnrWPWStFHilg5z1QBYy9iNTjgBV3/pXoQ==
X-Received: by 2002:a62:e10c:: with SMTP id q12mr711935pfh.212.1574745759653; 
 Mon, 25 Nov 2019 21:22:39 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:39 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/18] powerpc sstep: Add support for prefixed integer
 load/stores
Date: Tue, 26 Nov 2019 16:21:29 +1100
Message-Id: <20191126052141.28009-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following prefixed integer
load/stores:
  * Prefixed Load Byte and Zero (plbz)
  * Prefixed Load Halfword and Zero (plhz)
  * Prefixed Load Halfword Algebraic (plha)
  * Prefixed Load Word and Zero (plwz)
  * Prefixed Load Word Algebraic (plwa)
  * Prefixed Load Doubleword (pld)
  * Prefixed Store Byte (pstb)
  * Prefixed Store Halfword (psth)
  * Prefixed Store Word (pstw)
  * Prefixed Store Doubleword (pstd)
  * Prefixed Load Quadword (plq)
  * Prefixed Store Quadword (pstq)

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/lib/sstep.c | 110 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index ade3f5eba2e5..4f5ad1f602d8 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -187,6 +187,43 @@ static nokprobe_inline unsigned long xform_ea(unsigned int instr,
 	return ea;
 }
 
+/*
+ * Calculate effective address for a MLS:D-form / 8LS:D-form prefixed instruction
+ */
+static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
+						  unsigned int sufx,
+						  const struct pt_regs *regs)
+{
+	int ra, prefix_r;
+	unsigned int  dd;
+	unsigned long ea, d0, d1, d;
+
+	prefix_r = instr & (1ul << 20);
+	ra = (sufx >> 16) & 0x1f;
+
+	d0 = instr & 0x3ffff;
+	d1 = sufx & 0xffff;
+	d = (d0 << 16) | d1;
+
+	/*
+	 * sign extend a 34 bit number
+	 */
+	dd = (unsigned int) (d >> 2);
+	ea = (signed int) dd;
+	ea = (ea << 2) | (d & 0x3);
+
+	if (!prefix_r && ra)
+		ea += regs->gpr[ra];
+	else if (!prefix_r && !ra)
+		; /* Leave ea as is */
+	else if (prefix_r && !ra)
+		ea += regs->nip;
+	else if (prefix_r && ra)
+		; /* Invalid form. Should already be checked for by caller! */
+
+	return ea;
+}
+
 /*
  * Return the largest power of 2, not greater than sizeof(unsigned long),
  * such that x is a multiple of it.
@@ -1166,6 +1203,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		  unsigned int instr, unsigned int sufx)
 {
 	unsigned int opcode, ra, rb, rc, rd, spr, u;
+	unsigned int sufxopcode, prefixtype, prefix_r;
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
@@ -2652,6 +2690,78 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	}
 
+/*
+ * Prefixed instructions
+ */
+	switch (opcode) {
+	case 1:
+		prefix_r = instr & (1ul << 20);
+		ra = (sufx >> 16) & 0x1f;
+		op->update_reg = ra;
+		rd = (sufx >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+
+		sufxopcode = sufx >> 26;
+		prefixtype = (instr >> 24) & 0x3;
+		switch (prefixtype) {
+		case 0: /* Type 00  Eight-Byte Load/Store */
+			if (prefix_r && ra)
+				break;
+			op->ea = mlsd_8lsd_ea(instr, sufx, regs);
+			switch (sufxopcode) {
+			case 41:	/* plwa */
+				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
+				break;
+			case 56:        /* plq */
+				op->type = MKOP(LOAD, PREFIXED, 16);
+				break;
+			case 57:	/* pld */
+				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 8);
+				break;
+			case 60:        /* stq */
+				op->type = MKOP(STORE, PREFIXED, 16);
+				break;
+			case 61:	/* pstd */
+				op->type = MKOP(STORE, PREFIXED | SIGNEXT, 8);
+				break;
+			}
+			break;
+		case 1: /* Type 01 Modified Register-to-Register */
+			break;
+		case 2: /* Type 10 Modified Load/Store */
+			if (prefix_r && ra)
+				break;
+			op->ea = mlsd_8lsd_ea(instr, sufx, regs);
+			switch (sufxopcode) {
+			case 32:	/* plwz */
+				op->type = MKOP(LOAD, PREFIXED, 4);
+				break;
+			case 34:	/* plbz */
+				op->type = MKOP(LOAD, PREFIXED, 1);
+				break;
+			case 36:	/* pstw */
+				op->type = MKOP(STORE, PREFIXED, 4);
+				break;
+			case 38:	/* pstb */
+				op->type = MKOP(STORE, PREFIXED, 1);
+				break;
+			case 40:	/* plhz */
+				op->type = MKOP(LOAD, PREFIXED, 2);
+				break;
+			case 42:	/* plha */
+				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 2);
+				break;
+			case 44:	/* psth */
+				op->type = MKOP(STORE, PREFIXED, 2);
+				break;
+			}
+			break;
+		case 3: /* Type 11 Modified Register-to-Register */
+			break;
+		}
+	}
+
 #ifdef CONFIG_VSX
 	if ((GETTYPE(op->type) == LOAD_VSX ||
 	     GETTYPE(op->type) == STORE_VSX) &&
-- 
2.20.1

