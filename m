Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31318C736
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:46:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCT72YxLzDrcP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z766tROY; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsy4hgRzDrTQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:50 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id m15so1972279pje.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fj7OIHh+P/mMO3kNKWMPWKCkhlppM+3F2mvflwmTM6g=;
 b=Z766tROYX1xCgO67ay0nBl36bZuTHSIp9KDsIgg4LXvj0W+IWWHOnjrQ8tdMDWnPRT
 THcKKmxZBetmaDMUt7GrHXFGrlzupGjWmgFnTFjBgMH4uWIh5B5csVqElMksJlfAFfjF
 O2Fy/wuHw5GijH+1rKRrcPGVhxrq+I2Z4QcvwH/CxZiZhK2scEiTIDW6Vy1cKM3QQz1i
 +BIkFmVtdOgmvIb5v8imbHiRNGBudpWhVe18UH91XoBbp3mNJNqBksPLx61+mv4uDSfV
 pylO/vZApxzPh5U7d7gDH5/GBhL9nt+HMkXgZ4PygwsP53BCnxKdcPNMCnWX9zohmQrH
 jaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fj7OIHh+P/mMO3kNKWMPWKCkhlppM+3F2mvflwmTM6g=;
 b=uEXxBTOa82DBjDRjKuZaLL0lHCI1j5IHsRbEWsDPxcNWzz5ObF3YnZhWE3G6tHovFk
 WMkRDJr5GUyqiQoDwfYtFU0/DcmVC3TqGNVaDgz8HayCEu6UA6BGdnkeeIwfQh5xFvz9
 m9jjXkwxPxnhE/d1sDQgac5ThlCLrkpqF/YlkTw6esh6VBTqvGkCF0q3lQc9KJEwtXQ4
 yhLvBCo1oIbC/6sMXiat95/mceBMExVVVcKPZo2OO8ZMvJ3Fu1YArwK1c0ffEKL24ZAX
 7EVwBRbGh0oORjDRbVB23JdGbX/kd3FobPLos5pea4FYKbmwxYG4sxUn8kLBkjyyiQxu
 hC8g==
X-Gm-Message-State: ANhLgQ2RffXk1AbAwLUsGthkOdOmtkiA7uFRU97de3Ai/HRxbKIhr1nR
 i0zgcGxbWAO1vrAJAVrxCpXhthDzHpI=
X-Google-Smtp-Source: ADFU+vu0xWtUYcreYFj6FtuvEVyHSx5gk3piDa8qjR2pSq3eYKVqtYUsa7OWSyaZpZxMsGh30vZTpg==
X-Received: by 2002:a17:90a:1697:: with SMTP id
 o23mr7531059pja.62.1584681587317; 
 Thu, 19 Mar 2020 22:19:47 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:46 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 15/16] powerpc sstep: Add support for prefixed load/stores
Date: Fri, 20 Mar 2020 16:18:08 +1100
Message-Id: <20200320051809.24332-16-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Combine all load/store patches
    - Fix the name of Type 01 instructions
    - Remove sign extension flag from pstd/pld
    - Rename sufx -> suffix
v3: - Move prefixed loads and stores into the switch statement
---
 arch/powerpc/lib/sstep.c | 159 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index ab4c71c43c8c..daef70eb8e22 100644
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
 		  ppc_inst instr)
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

