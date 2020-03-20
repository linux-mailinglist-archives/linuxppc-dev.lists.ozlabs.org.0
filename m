Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B6518C708
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:31:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kC6y1CDqzDrfQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:31:06 +1100 (AEDT)
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
 header.s=20161025 header.b=VwUWpO8a; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsG15bdzDrT2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:13 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id d17so1921763pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=47ZTgaT4e6mi0NjK6miw5fls+T/eF1jO5otBlIoDje0=;
 b=VwUWpO8aEBq+6EjcCwobvUSkqWfqLpkOLH52oBdGVKdomWVJvK3ErX/2AfWeHD4Xd2
 RI5ARhDMVdGaLtBvS+xUWcRF0g3QEnN5nJ0fF5Gs9dOndojEh7PdhhzmaZtNWdSJcnps
 1CTQthafLOtiD8lRS2ZbIit03Mm1bMpsvVlanExssmVHD48qke15Y+DZe6BTLW7ZkQ1f
 vy3caWoDBkRncEk4ApxZpq0uqj7Cm04Pk7w5h1Q0E3pQRKbzA3Be/dB2cBES91pI0Lxt
 WDpb2wDmoSpKqemW7pWaXkYwQTShWOe2uEOhrdy30D/I7JUje/jHCodmp866zgx3t9UL
 iDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=47ZTgaT4e6mi0NjK6miw5fls+T/eF1jO5otBlIoDje0=;
 b=N3ZMpRcW8fypHdWdJ4jdGChRXL7QESMbQB6PquGedsYbAyYriGxjlNtzLamKqLokU5
 xakg9Xf6YRG0z8D4po16tb/gToz2xykIUOg2Xi09a0jQOS/v3ordsdE44dzsin5nINvX
 uIDul0elRaK1Udr/Fd2PVj9LrYEIzwF+KtfuosBCbA/KilecSSfhwvzdYxOZEqwEdu+E
 e2j0MUUGyXK1/CnUUlUgbU7WcclPDg2WGAHnRGMZHQ5akY4/zF5/h4L59CP0XYjivRhw
 Aa44PTBq+rkN+WVbcgkijLYAN08yLDKjP5kG9Fm7CqtiGozISbN9xHY54kUWHrq3YdmN
 4jKQ==
X-Gm-Message-State: ANhLgQ2KhWykwlmKmCQqK7MFShYU1QjqurC4padmhvUg9A2dWQO7eIc7
 Duh1tt4HPqJVByofkyMnRas6Y3obReE=
X-Google-Smtp-Source: ADFU+vsxM8s0oGo3MWyrwF2hnZK+6g4QWIOwPROrdqv9d74aIAm8LgD3vOEGOHS7PtMEngQZvjffXA==
X-Received: by 2002:a62:d144:: with SMTP id t4mr179899pfl.10.1584681551349;
 Thu, 19 Mar 2020 22:19:11 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:10 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/16] powerpc: Use a function for getting the instruction
 op code
Date: Fri, 20 Mar 2020 16:17:59 +1100
Message-Id: <20200320051809.24332-7-jniethe5@gmail.com>
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

In preparation for using a data type for instructions that can not be
directly used with the '>>' operator use a function for getting the op
code of an instruction.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/kernel/align.c      | 4 ++--
 arch/powerpc/lib/code-patching.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 38542fffa179..77c49dfdc1b4 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -313,8 +313,8 @@ int fix_alignment(struct pt_regs *regs)
 	}
 
 #ifdef CONFIG_SPE
-	if ((instr >> 26) == 0x4) {
-		int reg = (instr >> 21) & 0x1f;
+	if (ppc_inst_opcode(instr) == 0x4) {
+		int reg = (ppc_inst_word(instr) >> 21) & 0x1f;
 		PPC_WARN_ALIGNMENT(spe, regs);
 		return emulate_spe(regs, reg, instr);
 	}
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index e2ba23fd6f4d..04a303c059e2 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -228,7 +228,7 @@ bool is_offset_in_branch_range(long offset)
  */
 bool is_conditional_branch(ppc_inst instr)
 {
-	unsigned int opcode = instr >> 26;
+	unsigned int opcode = ppc_inst_opcode(instr);
 
 	if (opcode == 16)       /* bc, bca, bcl, bcla */
 		return true;
@@ -286,7 +286,7 @@ unsigned int create_cond_branch(const unsigned int *addr,
 
 static unsigned int branch_opcode(ppc_inst instr)
 {
-	return (instr >> 26) & 0x3F;
+	return ppc_inst_opcode(instr) & 0x3F;
 }
 
 static int instr_is_branch_iform(ppc_inst instr)
-- 
2.17.1

