Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C11BB3FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:30:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5G833h6zDqHP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:30:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CBKBBXwU; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4cF2cz6zDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:00:45 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id t40so433075pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QjGxzStQncjuBwOfvDa7lR3TKqtlM/c95zBwBsQpDUY=;
 b=CBKBBXwU579Xw8Xhrb34J55+uX989SOzmKas1XT/RBxEWwzF0y3aP5SAB0XLWTdxt/
 61UE9PVo2s8op1lYe7zYKN01KFpSxxilNm98v7HODgRngt4HKjlSPSd8EoiphRW4meqF
 GlK5WuWhI2a85zfLf58udt1m4YMp9Rv+WE9aopmuw5SuMYiueK2gZYbIZv0nq0DvlZsV
 wxWmhHjHpYwv3/4etsf96AQi3H/LinbFajo3mbOTgyI+5AG2mrj6wk7S2tZHH1A1v9/+
 taiGw1jHmNY/gLa1SQf+eLjJsT8mTWcUzIbZiqLUYtzXdlB4RTwsa3s6kJkZ+iotmwIZ
 5Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QjGxzStQncjuBwOfvDa7lR3TKqtlM/c95zBwBsQpDUY=;
 b=UPe4Glycnaw++iEfOy5FUOuZ3L6QS+wSiH8oPXSfJO/l8jJ6+jbYG/UgyLjqRzCCbF
 KfNd5alydlSjKyUBEz9Bw0aCUoMz1erhpAssMUd39S1m11M95bhJTEgtna4zOCq0G/L8
 k27lxrPCqT35gWjLnACIXtNk8DpwDrLAZ+X2TYOFuLYKlB3TcyrnaIDIUcfwwyHR5D8Q
 tCwvi4KiMPi4LXm1KyMUAlbowMU9vI1kXXQgnJFFZ9NVWGm6ojkaz6dhRC0Jo2lrBZvl
 wbzYLxa/b+y52Ic+RQcwLX/kgq2uaYaRr/pEDA5s4nWM8NJISV24hFnoQ0+5owj+Tgu+
 fG6g==
X-Gm-Message-State: AGi0PubWG98f0OKFsabpXUG9Ml+8mrjqTX5y63ujbqDK2wczRCWnK0yj
 0fEqCwJE6dfI3POq1prw2TWWdn40wcQ=
X-Google-Smtp-Source: APiQypJA5bA1SRry3Q7dZx9pdaJLQhvxz+59A34pe4K8ppcq6xJ2vTEicDpuCR5mEET/g6AF8zvHRQ==
X-Received: by 2002:a17:90a:2365:: with SMTP id
 f92mr1987493pje.117.1588039241998; 
 Mon, 27 Apr 2020 19:00:41 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:00:41 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 14/28] powerpc: Add a probe_kernel_read_inst() function
Date: Tue, 28 Apr 2020 11:58:00 +1000
Message-Id: <20200428015814.15380-15-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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

Introduce a probe_kernel_read_inst() function to use in cases where
probe_kernel_read() is used for getting an instruction. This will be
more useful for prefixed instructions.

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
index 63228e0e8cfc..a6064e1977ca 100644
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
@@ -196,7 +196,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
 	 * on first pass after boot we will see mflr r0.
 	 */
-	if (probe_kernel_read(&op, (void *)(ip+4), MCOUNT_INSN_SIZE)) {
+	if (probe_kernel_read_inst(&op, (void *)(ip+4))) {
 		pr_err("Fetching op failed.\n");
 		return -EFAULT;
 	}
@@ -348,7 +348,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 			return -1;
 
 	/* New trampoline -- read where this goes */
-	if (probe_kernel_read(&op, (void *)tramp, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
 		return -1;
 	}
@@ -398,7 +398,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	struct ppc_inst op;
 
 	/* Read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -524,7 +524,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	struct module *mod = rec->arch.mod;
 
 	/* read where this goes */
-	if (probe_kernel_read(op, ip, sizeof(op)))
+	if (probe_kernel_read_inst(op, ip))
+		return -EFAULT;
+
+	if (probe_kernel_read_inst(op + 1, ip + 4))
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
@@ -587,7 +590,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	unsigned long ip = rec->ip;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, MCOUNT_INSN_SIZE))
+	if (probe_kernel_read_inst(&op, (void *)ip))
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
@@ -643,7 +646,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Make sure we have a nop */
-	if (probe_kernel_read(&op, ip, sizeof(op))) {
+	if (probe_kernel_read_inst(&op, ip)) {
 		pr_err("Unable to read ftrace location %p\n", ip);
 		return -EFAULT;
 	}
@@ -721,7 +724,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
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

