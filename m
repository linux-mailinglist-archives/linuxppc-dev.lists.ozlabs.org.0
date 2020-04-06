Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8C19F17A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:21:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wk625kQqzDqwB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:21:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T6NZRX1p; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjrl1LnWzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:15 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k5so7199127pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GeUEHBpO+6jSwxC0iTTK20KosxvJD3ytnwdpUZmhQdk=;
 b=T6NZRX1pa7TiHjdOln06ZI7iGIKVDhjb6t9ohb37OBwpXe8GlmOLcLSNDOvC735rn+
 GCIJTjYO1jrEiGeQjWhobmIccJOSNW3vUQrVrh54OIWAveiwUwaUwJA1693A85YjnbtW
 Y8kKgN1pl1Pel7z5SnCGzk49/ssyw5X4JjFFoA0/W1FO8YW9gna1cG25PBwZSmOQXFEW
 qrUxRvIwIA1dL8Taoy0bsroRpBxaH9GpBOFLheB9SAd9UyyZsXDXrf10IcV5jWCwSBo+
 AheDoF6N/5hQLNSxoGkY9ksgOk+h/81UoGo0VXc+vg/4Vasn0WNyVhdCri2jNkjFaqrL
 e8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GeUEHBpO+6jSwxC0iTTK20KosxvJD3ytnwdpUZmhQdk=;
 b=hcl9dU27ZsG53ohtN34GI2xCj1VxW3y6yhIOha1r72YMLwX/1cnyunUGYt5WrubAlm
 CM4vwz02DHmLWRmbxG9kMMu8/8ETzMNE1q7xRp8c2L9ei06D6WJm3voTCMHQT1wzwNPS
 M1dzAq7jk9qSvEr6Roq+xYKJy9/XmtMoLtp8OM7UtQ3UPBF+h2Xkg/dYfExpEucTAyhH
 D4r6WpZanPuPSQbxrSGFLjg9E/qSk+FAxJyKGYhzJzY8j6fUUxCwWPf//yxHI0H+f53T
 bo9d3K3xtOPhKLg8v7CK3AWpcXDyHIWeN+U3nah08uiG0sQhSzCjZw3mD+JIei9SkC3Q
 QaJw==
X-Gm-Message-State: AGi0Puav+0r70RAVsEBNjRwNI28Vr26sU1uLp4lU7jun3Or7rh4JJ1/w
 lhV1767yf5Hkcf+OeKggBNOgbqtM5pE=
X-Google-Smtp-Source: APiQypIsJeGS0xIf34e+ti8bJ1hrM9/Y8VtPcsMC/u3zeZuPZeJ55gz/qfkm6IosEGy/5AnumOiT/w==
X-Received: by 2002:a63:8148:: with SMTP id t69mr19733482pgd.187.1586160612473; 
 Mon, 06 Apr 2020 01:10:12 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:12 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 05/21] powerpc: Use a function for getting the instruction
 op code
Date: Mon,  6 Apr 2020 18:09:20 +1000
Message-Id: <20200406080936.7180-6-jniethe5@gmail.com>
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

In preparation for using a data type for instructions that can not be
directly used with the '>>' operator use a function for getting the op
code of an instruction.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/include/asm/inst.h  | 5 +++++
 arch/powerpc/kernel/align.c      | 2 +-
 arch/powerpc/lib/code-patching.c | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 5298ba33b6e5..93959016fe4b 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -8,4 +8,9 @@
 
 #define ppc_inst(x) (x)
 
+static inline int ppc_inst_opcode(u32 x)
+{
+	return x >> 26;
+}
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 86e9bf62f18c..691013aa9f3c 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -314,7 +314,7 @@ int fix_alignment(struct pt_regs *regs)
 	}
 
 #ifdef CONFIG_SPE
-	if ((instr >> 26) == 0x4) {
+	if (ppc_inst_opcode(instr) == 0x4) {
 		int reg = (instr >> 21) & 0x1f;
 		PPC_WARN_ALIGNMENT(spe, regs);
 		return emulate_spe(regs, reg, instr);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index fdf0d6ea3575..099a515202aa 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -231,7 +231,7 @@ bool is_offset_in_branch_range(long offset)
  */
 bool is_conditional_branch(unsigned int instr)
 {
-	unsigned int opcode = instr >> 26;
+	unsigned int opcode = ppc_inst_opcode(instr);
 
 	if (opcode == 16)       /* bc, bca, bcl, bcla */
 		return true;
@@ -289,7 +289,7 @@ int create_cond_branch(unsigned int *instr, const unsigned int *addr,
 
 static unsigned int branch_opcode(unsigned int instr)
 {
-	return (instr >> 26) & 0x3F;
+	return ppc_inst_opcode(instr) & 0x3F;
 }
 
 static int instr_is_branch_iform(unsigned int instr)
-- 
2.17.1

