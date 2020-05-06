Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9421C669D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:10:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H35j6g94zDrJ5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:10:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ni8O6sCZ; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2Yv5q8MzDqjg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:45:55 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n11so181873pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DOZukLkyec8eEyXSM8nxTV5c0TW9quSbRWLg/KESK+Q=;
 b=Ni8O6sCZWPXWjuwx/LhVUsPD33vpWzjioAkH4fQwU2rN2ZR69NslnJa86pcGgyRA32
 sgJQntGJ/8H9e3otuTRRRJtqoHmE72AhcIwV7JJAo4VtItcWVsvnXTDUDj4WYhLYkHWS
 bFYbniFPtuBOoipMPzUi58+sGU9GInalXO4AzAXqals+WOWO2hfKnZhxBoVXS50/tPlT
 QQpK1/RFtcxKJvo3Kkcd8iJrx1ZIsQxyVvrWA9n/vBJbgP/5ln21xWrER2eepC4ryqhf
 MuNLbthi7FXO4i02wIspCuxD5bZ4tafg0lA7U3Dzp1WhuROXvT7sFIiEnVnKYZEtMiJb
 E7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DOZukLkyec8eEyXSM8nxTV5c0TW9quSbRWLg/KESK+Q=;
 b=pWLV6bzyx79sm4EkrOCuDSDeexN+B2cGeb+ei1KGrj9T8OeXlwAYcK/cC7a8DiYg0R
 DqiqjS1EZpTZQ56O1EvD7s6mg9b6KiFyk4toV4mS3z6W5FzwA4r4bCL7hl5FelrnE6D7
 WpIH1QlMhuipd1j7cM6Kc7KzvLMGMXqWVd0xoRuvc+/YGWbEKv4n/ixOFyiG+1294b/I
 NZhRkdtmd0mSMvp1xpyqW38ER4XBN9cmh1GciwBNXjT8CHVu8+WPlKGu3ykqbe2BX78o
 HYv8B1bMdJy1865nieK1ktU6AQ59xJrwo78a/NrGgpzIpMOKLe8sLpZ8eCorbSt9ae08
 dh5g==
X-Gm-Message-State: AGi0PuYA4zIeLa1uzcluzVFRlvegONiiSY88K7Wj+HgbSRSmJYtEwL9N
 W1KSVI7bZYx5TvncQqOG0Mp99K68NwPRtg==
X-Google-Smtp-Source: APiQypJQF2C1V6/G1XgjFdsXDZvExlyuAd6b4lVyxwjrvwvjwGmBXcnFzB2FFaigAymx6sGPSsKTbA==
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr6319735pfr.36.1588736752683;
 Tue, 05 May 2020 20:45:52 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:45:52 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 14/30] powerpc: Add a probe_kernel_read_inst() function
Date: Wed,  6 May 2020 13:40:34 +1000
Message-Id: <20200506034050.24806-15-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a probe_kernel_read_inst() function to use in cases where
probe_kernel_read() is used for getting an instruction. This will be
more useful for prefixed instructions.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: - This was previously just in ftrace.c
---
 arch/powerpc/include/asm/inst.h    |  2 ++
 arch/powerpc/kernel/trace/ftrace.c | 23 +++++++++++++----------
 arch/powerpc/lib/inst.c            | 11 +++++++++++
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 3e9a58420151..0d581b332c20 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -39,5 +39,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 
 int probe_user_read_inst(struct ppc_inst *inst,
 			 struct ppc_inst *nip);
+int probe_kernel_read_inst(struct ppc_inst *inst,
+			   struct ppc_inst *src);
 
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index acd5b889815f..5e399628f51a 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -68,7 +68,7 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
 	 */
 
 	/* read the text we want to modify */
-	if (probe_kernel_read(&replaced, (void *)ip, MCOUNT_INSN_SIZE))
+	if (probe_kernel_read_inst(&replaced, (void *)ip))
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
@@ -130,7 +130,7 @@ __ftrace_make_nop(struct module *mod,
 	struct ppc_inst op, pop;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -164,7 +164,7 @@ __ftrace_make_nop(struct module *mod,
 	/* When using -mkernel_profile there is no load to jump over */
 	pop = ppc_inst(PPC_INST_NOP);
 
-	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
+	if (probe_kernel_read_inst(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
 		return -EFAULT;
 	}
@@ -197,7 +197,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
 	 * on first pass after boot we will see mflr r0.
 	 */
-	if (probe_kernel_read(&op, (void *)(ip+4), MCOUNT_INSN_SIZE)) {
+	if (probe_kernel_read_inst(&op, (void *)(ip + 4))) {
 		pr_err("Fetching op failed.\n");
 		return -EFAULT;
 	}
@@ -349,7 +349,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 			return -1;
 
 	/* New trampoline -- read where this goes */
-	if (probe_kernel_read(&op, (void *)tramp, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
 		return -1;
 	}
@@ -399,7 +399,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	struct ppc_inst op;
 
 	/* Read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -526,7 +526,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	struct module *mod = rec->arch.mod;
 
 	/* read where this goes */
-	if (probe_kernel_read(op, ip, sizeof(op)))
+	if (probe_kernel_read_inst(op, ip))
+		return -EFAULT;
+
+	if (probe_kernel_read_inst(op + 1, ip + 4))
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
@@ -589,7 +592,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	unsigned long ip = rec->ip;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, MCOUNT_INSN_SIZE))
+	if (probe_kernel_read_inst(&op, (void *)ip))
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
@@ -645,7 +648,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Make sure we have a nop */
-	if (probe_kernel_read(&op, ip, sizeof(op))) {
+	if (probe_kernel_read_inst(&op, ip)) {
 		pr_err("Unable to read ftrace location %p\n", ip);
 		return -EFAULT;
 	}
@@ -723,7 +726,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
index eaf786afad2b..08dedd927268 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -16,3 +16,14 @@ int probe_user_read_inst(struct ppc_inst *inst,
 	*inst = ppc_inst(val);
 	return err;
 }
+
+int probe_kernel_read_inst(struct ppc_inst *inst,
+			   struct ppc_inst *src)
+{
+	unsigned int val;
+	int err;
+
+	err = probe_kernel_read(&val, src, sizeof(val));
+	*inst = ppc_inst(val);
+	return err;
+}
-- 
2.17.1

