Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DBE19F1CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:49:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkjx00jbzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sg9fFq4F; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjsq0fH0zDqly
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:11:11 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g6so5226785pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N75ZnFdOwXEhMXRGy/mGmBUpxt7H73+bui2+kC9eyCk=;
 b=sg9fFq4FXEXrlTV02kc5ULKCa/nDSw1C//myO4n11SjZanKO4WzpQA1P0oRBHB5XF3
 f039UW3xSCs0nSHxIJER4CZPpZuGi9GRSJ3ND8x3JS7OROnaF0ShH/A7f+WUffa6Cc2h
 cxUp2731DUJOuT8aHoXtFodeP3qlAx1yOWOuXroDjfHCssPK5D5koD8b/lYui/BBMHgX
 Dt70/X8gB7s+u0wB4oDp5YcuDiSBuTtY3P8/ZFhom1zkLWILslKmI996ZetzPn23vxkX
 HBoEM89eYArZJT5KepOcYMkd7ej0MLi8lkwyPy2nC8TEtyDOClP1MgpdjpsPrCsAZ38l
 b5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N75ZnFdOwXEhMXRGy/mGmBUpxt7H73+bui2+kC9eyCk=;
 b=KC70rzOL3dqnlKxkEijqRsqu8HseDx3Dhz4m0qTTPhX31XQIGpxBKnuP8pQTh4Mn4o
 556lYNmg7X3P52JvK1PPgNLHpGw4MzB1f7MtMfvpjdMMDxWQzkzYy8Avo8zteYRQ213j
 M+ImCkuc9V6YPFpDvyRUPjm8qyxgzPnRGIbk0MQxd5HKVneJj3ikOkdd6gOw15aoxDSS
 rO45TEeJmLnnr5/TpZBbQXwNLc+6bnRpukGR55z7kVSCGPjNVphnT9IQYr/ytsui0oxl
 mm6RKSdi1roBew2brICI2PWfbGFSIFYUm0msA4YDK6x135LdHc+wvf33JdGu71O9f1Ai
 nEFQ==
X-Gm-Message-State: AGi0PubBxLlGmVg19fDkaJ/3YnKRJEbSm8+fZRtblyWHcvpkdl2voFNv
 PXx1efWM8KmLK4BkTmT93B0IYKyXmZc=
X-Google-Smtp-Source: APiQypJa7nSprvShDMAzCKpfnBNuM3c6J0cT5mDSpb+fyoO4X1fajgbuo2/2YITYXnlbj7wAM9HcZQ==
X-Received: by 2002:a63:d904:: with SMTP id r4mr14393912pgg.323.1586160668467; 
 Mon, 06 Apr 2020 01:11:08 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:11:08 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 20/21] powerpc sstep: Add support for prefixed load/stores
Date: Mon,  6 Apr 2020 18:09:35 +1000
Message-Id: <20200406080936.7180-21-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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

the follow prefixed floating-point load/stores:
  * Prefixed Load Floating-Point Single (plfs)
  * Prefixed Load Floating-Point Double (plfd)
  * Prefixed Store Floating-Point Single (pstfs)
  * Prefixed Store Floating-Point Double (pstfd)

and for the following prefixed VSX load/stores:
  * Prefixed Load VSX Scalar Doubleword (plxsd)
  * Prefixed Load VSX Scalar Single-Precision (plxssp)
  * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
  * Prefixed Store VSX Scalar Doubleword (pstxsd)
  * Prefixed Store VSX Scalar Single-Precision (pstxssp)
  * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Combine all load/store patches
    - Fix the name of Type 01 instructions
    - Remove sign extension flag from pstd/pld
    - Rename sufx -> suffix
v3: - Move prefixed loads and stores into the switch statement
---
 arch/powerpc/include/asm/sstep.h |   4 +
 arch/powerpc/lib/sstep.c         | 159 +++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index c3ce903ac488..9b200a5f8794 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -90,11 +90,15 @@ enum instruction_type {
 #define VSX_LDLEFT	4	/* load VSX register from left */
 #define VSX_CHECK_VEC	8	/* check MSR_VEC not MSR_VSX for reg >= 32 */
 
+/* Prefixed flag, ORed in with type */
+#define PREFIXED       0x800
+
 /* Size field in type word */
 #define SIZE(n)		((n) << 12)
 #define GETSIZE(w)	((w) >> 12)
 
 #define GETTYPE(t)	((t) & INSTR_TYPE_MASK)
+#define GETLENGTH(t)   (((t) & PREFIXED) ? 8 : 4)
 
 #define MKOP(t, f, s)	((t) | (f) | SIZE(s))
 
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 8b285bf11218..8b6aee0ee636 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -187,6 +187,44 @@ static nokprobe_inline unsigned long xform_ea(unsigned int instr,
 	return ea;
 }
 
+/*
+ * Calculate effective address for a MLS:D-form / 8LS:D-form
+ * prefixed instruction
+ */
+static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
+						  unsigned int suffix,
+						  const struct pt_regs *regs)
+{
+	int ra, prefix_r;
+	unsigned int  dd;
+	unsigned long ea, d0, d1, d;
+
+	prefix_r = instr & (1ul << 20);
+	ra = (suffix >> 16) & 0x1f;
+
+	d0 = instr & 0x3ffff;
+	d1 = suffix & 0xffff;
+	d = (d0 << 16) | d1;
+
+	/*
+	 * sign extend a 34 bit number
+	 */
+	dd = (unsigned int)(d >> 2);
+	ea = (signed int)dd;
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
@@ -1166,6 +1204,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		  struct ppc_inst instr)
 {
 	unsigned int opcode, ra, rb, rc, rd, spr, u;
+	unsigned int suffixopcode, prefixtype, prefix_r;
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
@@ -2652,6 +2691,126 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 		}
 		break;
+	case 1: /* Prefixed instructions */
+		prefix_r = word & (1ul << 20);
+		ra = (suffix >> 16) & 0x1f;
+		op->update_reg = ra;
+		rd = (suffix >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+
+		suffixopcode = suffix >> 26;
+		prefixtype = (word >> 24) & 0x3;
+		switch (prefixtype) {
+		case 0: /* Type 00  Eight-Byte Load/Store */
+			if (prefix_r && ra)
+				break;
+			op->ea = mlsd_8lsd_ea(word, suffix, regs);
+			switch (suffixopcode) {
+			case 41:	/* plwa */
+				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
+				break;
+			case 42:        /* plxsd */
+				op->reg = rd + 32;
+				op->type = MKOP(LOAD_VSX, PREFIXED, 8);
+				op->element_size = 8;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 43:	/* plxssp */
+				op->reg = rd + 32;
+				op->type = MKOP(LOAD_VSX, PREFIXED, 4);
+				op->element_size = 8;
+				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
+				break;
+			case 46:	/* pstxsd */
+				op->reg = rd + 32;
+				op->type = MKOP(STORE_VSX, PREFIXED, 8);
+				op->element_size = 8;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 47:	/* pstxssp */
+				op->reg = rd + 32;
+				op->type = MKOP(STORE_VSX, PREFIXED, 4);
+				op->element_size = 8;
+				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
+				break;
+			case 51:	/* plxv1 */
+				op->reg += 32;
+
+				/* fallthru */
+			case 50:	/* plxv0 */
+				op->type = MKOP(LOAD_VSX, PREFIXED, 16);
+				op->element_size = 16;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 55:	/* pstxv1 */
+				op->reg = rd + 32;
+
+				/* fallthru */
+			case 54:	/* pstxv0 */
+				op->type = MKOP(STORE_VSX, PREFIXED, 16);
+				op->element_size = 16;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 56:        /* plq */
+				op->type = MKOP(LOAD, PREFIXED, 16);
+				break;
+			case 57:	/* pld */
+				op->type = MKOP(LOAD, PREFIXED, 8);
+				break;
+			case 60:        /* stq */
+				op->type = MKOP(STORE, PREFIXED, 16);
+				break;
+			case 61:	/* pstd */
+				op->type = MKOP(STORE, PREFIXED, 8);
+				break;
+			}
+			break;
+		case 1: /* Type 01 Eight-Byte Register-to-Register */
+			break;
+		case 2: /* Type 10 Modified Load/Store */
+			if (prefix_r && ra)
+				break;
+			op->ea = mlsd_8lsd_ea(word, suffix, regs);
+			switch (suffixopcode) {
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
+			case 48:        /* plfs */
+				op->type = MKOP(LOAD_FP, PREFIXED | FPCONV, 4);
+				break;
+			case 50:        /* plfd */
+				op->type = MKOP(LOAD_FP, PREFIXED, 8);
+				break;
+			case 52:        /* pstfs */
+				op->type = MKOP(STORE_FP, PREFIXED | FPCONV, 4);
+				break;
+			case 54:        /* pstfd */
+				op->type = MKOP(STORE_FP, PREFIXED, 8);
+				break;
+			}
+			break;
+		case 3: /* Type 11 Modified Register-to-Register */
+			break;
+		}
 #endif /* __powerpc64__ */
 
 	}
-- 
2.17.1

