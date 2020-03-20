Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47A18C700
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:29:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kC4c4YfPzDrSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JMLQHdcx; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBs93BgNzDrTs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:09 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so2631435pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S/r32Q7grwQQf3uHgdNTaaRJ9xKAmkDdHphVshqxgn0=;
 b=JMLQHdcxkOh40BGu5bSQaFy04CDLFvWuwC1l60DUkEp887HDbr97WKEcFFTU4V9wOA
 oNAx0/8MWlpvwa1QVrfMLNI8ROOt8BhRdbu2ULIjL/5a9mY0yc9wR7TMhQ/cw6l/88jg
 4RgZwhs2vNdcuQzZ0kg4sSDinrmriix49FeMNx0mlofROj+zO8DjguBdAGD4Rsbay/zL
 ApsP7em6uU2mogx7FJwQWyZ+FvgPJ+AX6ItvqoBQQUCTjWWqdyVM752qaM6d42bkyCZI
 rPPpqoDPJCBSOixCFNw+g+aryAsDrFB+zioqHO5UHPJI/YkIVgPqOEIowbqcGfsOMySu
 JdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S/r32Q7grwQQf3uHgdNTaaRJ9xKAmkDdHphVshqxgn0=;
 b=VjAmpYeR4sktlz0pmlhVietFy57PI6MQQqv9KoAqik1/TXy4Aac+blRosGRQbWZ0D3
 iSHe6GO2o8FxfySFGFlq5VctqoBxRtqehUU0lzMnCXoxqfelQb7M0H3XmmoKiyyWMUkr
 AkVhJevUhypXss3a4F7HrhOuZDlB20JH4eYNz9cvpcrJp6TFZ8tAvLfuWm4ErXuSQSvC
 aWo0yqjl5BNqZtf042w7IiJtO7I0PmdsA5oOeXB4LNW3jXoc7JZUOJY/EelwzrapmENo
 wwHT3pDc5eUi3noZa0F/DUqwHFOYI00boZt/dYjqKZUu8hg7/4dmpMeFbGABnp/UvpVI
 sTTA==
X-Gm-Message-State: ANhLgQ2o7blLCt8D/5Isf2Eu2vsAoPMCo3peu4KDeq4JlbjuEdLa+GHe
 x/+QOiD1hhVeAmMJc9DFkx+yNU4I8j8=
X-Google-Smtp-Source: ADFU+vsZSShlTCWaOtJb+1ECsrRwCD5re4N9C8Noh+hX2FuExN+cXWyuSRNrNR8kYDs6fiuRiNJLRQ==
X-Received: by 2002:a05:6a00:2a5:: with SMTP id
 q5mr7621431pfs.183.1584681547113; 
 Thu, 19 Mar 2020 22:19:07 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:06 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/16] powerpc: Use a function for masking instructions
Date: Fri, 20 Mar 2020 16:17:58 +1100
Message-Id: <20200320051809.24332-6-jniethe5@gmail.com>
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

In preparation for using an instruction data type that can not be used
directly with the '&' operator, use a function to mask instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/include/asm/sstep.h   |  6 +++---
 arch/powerpc/kernel/align.c        |  2 +-
 arch/powerpc/kernel/trace/ftrace.c |  8 ++++----
 arch/powerpc/lib/code-patching.c   | 12 ++++++------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 9353916fcba7..ef5483288920 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -16,9 +16,9 @@ struct pt_regs;
  * Note that IS_MTMSRD returns true for both an mtmsr (32-bit)
  * and an mtmsrd (64-bit).
  */
-#define IS_MTMSRD(instr)	(((instr) & 0xfc0007be) == 0x7c000124)
-#define IS_RFID(instr)		(((instr) & 0xfc0007fe) == 0x4c000024)
-#define IS_RFI(instr)		(((instr) & 0xfc0007fe) == 0x4c000064)
+#define IS_MTMSRD(instr)	((ppc_inst_mask((instr), 0xfc0007be) == 0x7c000124))
+#define IS_RFID(instr)		((ppc_inst_mask((instr), 0xfc0007fe) == 0x4c000024))
+#define IS_RFI(instr)		((ppc_inst_mask((instr), 0xfc0007fe) == 0x4c000064))
 
 enum instruction_type {
 	COMPUTE,		/* arith/logical/CR op, etc. */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 6008f14a145b..38542fffa179 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -331,7 +331,7 @@ int fix_alignment(struct pt_regs *regs)
 	 * when pasting to a co-processor. Furthermore, paste_last is the
 	 * synchronisation point for preceding copy/paste sequences.
 	 */
-	if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
+	if (ppc_inst_mask(instr, 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
 		return -EIO;
 
 	r = analyse_instr(&op, regs, instr);
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 380f1ce77715..b189a34baaa2 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -98,19 +98,19 @@ static ppc_inst test_24bit_addr(unsigned long ip, unsigned long addr)
 
 static int is_bl_op(ppc_inst op)
 {
-	return (op & 0xfc000003) == 0x48000001;
+	return ppc_inst_mask(op, 0xfc000003) == 0x48000001;
 }
 
 static int is_b_op(ppc_inst op)
 {
-	return (op & 0xfc000003) == 0x48000000;
+	return ppc_inst_mask(op, 0xfc000003) == 0x48000000;
 }
 
 static unsigned long find_bl_target(unsigned long ip, ppc_inst op)
 {
 	int offset;
 
-	offset = (op & 0x03fffffc);
+	offset = ppc_inst_mask(op, 0x03fffffc);
 	/* make it signed */
 	if (offset & 0x02000000)
 		offset |= 0xfe000000;
@@ -494,7 +494,7 @@ expected_nop_sequence(void *ip, ppc_inst op0, ppc_inst op1)
 	 * The load offset is different depending on the ABI. For simplicity
 	 * just mask it out when doing the compare.
 	 */
-	if ((op0 != 0x48000008) || ((op1 & 0xffff0000) != 0xe8410000))
+	if ((op0 != 0x48000008) || (ppc_inst_mask(op1, 0xffff0000) != 0xe8410000))
 		return 0;
 	return 1;
 }
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 5d69e836337d..e2ba23fd6f4d 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -301,7 +301,7 @@ static int instr_is_branch_bform(ppc_inst instr)
 
 int instr_is_relative_branch(ppc_inst instr)
 {
-	if (instr & BRANCH_ABSOLUTE)
+	if (ppc_inst_mask(instr, BRANCH_ABSOLUTE))
 		return 0;
 
 	return instr_is_branch_iform(instr) || instr_is_branch_bform(instr);
@@ -309,20 +309,20 @@ int instr_is_relative_branch(ppc_inst instr)
 
 int instr_is_relative_link_branch(ppc_inst instr)
 {
-	return instr_is_relative_branch(instr) && (instr & BRANCH_SET_LINK);
+	return instr_is_relative_branch(instr) && ppc_inst_mask(instr, BRANCH_SET_LINK);
 }
 
 static unsigned long branch_iform_target(const ppc_inst *instr)
 {
 	signed long imm;
 
-	imm = *instr & 0x3FFFFFC;
+	imm = ppc_inst_mask(*instr, 0x3FFFFFC);
 
 	/* If the top bit of the immediate value is set this is negative */
 	if (imm & 0x2000000)
 		imm -= 0x4000000;
 
-	if ((*instr & BRANCH_ABSOLUTE) == 0)
+	if ((ppc_inst_mask(*instr, BRANCH_ABSOLUTE)) == 0)
 		imm += (unsigned long)instr;
 
 	return (unsigned long)imm;
@@ -332,13 +332,13 @@ static unsigned long branch_bform_target(const ppc_inst *instr)
 {
 	signed long imm;
 
-	imm = *instr & 0xFFFC;
+	imm = ppc_inst_mask(*instr, 0xFFFC);
 
 	/* If the top bit of the immediate value is set this is negative */
 	if (imm & 0x8000)
 		imm -= 0x10000;
 
-	if ((*instr & BRANCH_ABSOLUTE) == 0)
+	if ((ppc_inst_mask(*instr, BRANCH_ABSOLUTE)) == 0)
 		imm += (unsigned long)instr;
 
 	return (unsigned long)imm;
-- 
2.17.1

