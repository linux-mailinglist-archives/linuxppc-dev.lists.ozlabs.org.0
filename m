Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B521C0D07
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:05:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzDD0zQ3zDrQY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:05:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VdAAV11J; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CypD070lzDrJj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:45:56 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x15so1079375pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NMuB4otYN+7CESjuzUp1d4qxWmHROaST0+RwUXmejgw=;
 b=VdAAV11J5/rYXJ2nn93AHm93A9jW6px3uLtkH5Bsk580c8fFbdOCC6mW1Lh/RJBiYJ
 PSF3PzJKE/La6W2OhqyvFEJCbehp4PDeCu68K+golZJcR+Jl/xo5J0cxELQl4N//kera
 jpLd29f5RV5EKBWHKAa5wdR4piMvgthBqFcg+hIU0VxFIWOARKQIQaMv6HnVU3eylpW7
 3dwdXnU5+sl4ueiNkf2BMKwOgUoSnxvhX1iDHiGOzIqhn4CW79b/2RgiwW6A04JNCgVe
 v2YmG6thudO4/Tlr2kIVg1OcPbcjEsH+mT5tWesSlj5LLh8E1WX1MycWXHQ+IW8nJGVz
 V1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NMuB4otYN+7CESjuzUp1d4qxWmHROaST0+RwUXmejgw=;
 b=NNU3Qy818zNZjUWTV2qzzXE7ru24QncNJ099PMZQOO4ghthz5OidVYtpwWuJACtE34
 lWnM7fJe9XiSSQ22VT4XZdCoWBi8vnB4UfZYck2ZaB3PlxHrpuKPkaHdEUsjYyxhSJKC
 C/uoRXfwUOvU4xvFz2W+3TgCsazGypxzP2XUagSWPFJM/Acakp2EiR/Ze+eboQW6UqlT
 w4mvOC0G0XAFGW2URUbDfWqD7kDF8ygev0TAqmZiGfYksT7XhvhZGUN7a2cPBfwcQjuw
 fB5ZeYSAOV+YdKEqA5je/1/1yqx1/OKHWo0ScepbEHoUnhIv81apXwWpEczbJ1AtbTjX
 ZI1g==
X-Gm-Message-State: AGi0PuZaTADkDQlgDMLzuUI07LaZ/pU3RjDqt5gmaCpm3AIizdIypV/6
 dbbmLj8+OhZrzZjGjivQpj5VZapWJnEYXQ==
X-Google-Smtp-Source: APiQypIIiIYNJvSN1PhbX3aQ2GCB7bn0EXgljhCGpFI+/0EHc2GhEOcVgpsh3hArlINk1CzF53hgYg==
X-Received: by 2002:a62:1bd0:: with SMTP id b199mr2148460pfb.283.1588304752061; 
 Thu, 30 Apr 2020 20:45:52 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:45:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 10/28] powerpc: Introduce functions for instruction equality
Date: Fri,  1 May 2020 13:42:02 +1000
Message-Id: <20200501034220.8982-11-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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

In preparation for an instruction data type that can not be directly
used with the '==' operator use functions for checking equality.

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v5: Remove ppc_inst_null()
v7: Fix compilation issue in expected_nop_sequence() when no
    CONFIG_MPROFILE_KERNEL
---
 arch/powerpc/include/asm/inst.h    |  5 +++++
 arch/powerpc/kernel/trace/ftrace.c | 15 ++++++++-------
 arch/powerpc/lib/code-patching.c   | 12 ++++++------
 arch/powerpc/xmon/xmon.c           |  4 ++--
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 23fd57a86b03..0c5dc539160a 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -23,4 +23,9 @@ static inline u32 ppc_inst_swab(u32 x)
 	return ppc_inst(swab32(ppc_inst_val(x)));
 }
 
+static inline bool ppc_inst_equal(u32 x, u32 y)
+{
+	return x == y;
+}
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 335b10008035..d83c1be417f2 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -72,7 +72,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
-	if (replaced != old) {
+	if (!ppc_inst_equal(replaced, old)) {
 		pr_err("%p: replaced (%#x) != old (%#x)",
 		(void *)ip, ppc_inst_val(replaced), ppc_inst_val(old));
 		return -EINVAL;
@@ -170,7 +170,8 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (op != ppc_inst(PPC_INST_MFLR) && op != ppc_inst(PPC_INST_STD_LR)) {
+	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_MFLR)) &&
+	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
 		pr_err("Unexpected instruction %08x around bl _mcount\n", ppc_inst_val(op));
 		return -EINVAL;
 	}
@@ -200,7 +201,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EFAULT;
 	}
 
-	if (op != ppc_inst(PPC_INST_LD_TOC)) {
+	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
 		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, ppc_inst_val(op));
 		return -EINVAL;
 	}
@@ -497,7 +498,7 @@ expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 	 * The load offset is different depending on the ABI. For simplicity
 	 * just mask it out when doing the compare.
 	 */
-	if ((op0 != ppc_inst(0x48000008)) || (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
+	if ((!ppc_inst_equal(op0, ppc_inst(0x48000008))) || (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
 		return 0;
 	return 1;
 }
@@ -506,7 +507,7 @@ static int
 expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
-	if (op0 != ppc_inst(PPC_INST_NOP))
+	if (!ppc_inst_equal(op0, ppc_inst(PPC_INST_NOP)))
 		return 0;
 	return 1;
 }
@@ -589,7 +590,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
-	if (op != ppc_inst(PPC_INST_NOP)) {
+	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_NOP))) {
 		pr_err("Expected NOP but have %x\n", op);
 		return -EINVAL;
 	}
@@ -646,7 +647,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	if (op != ppc_inst(PPC_INST_NOP)) {
+	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_NOP))) {
 		pr_err("Unexpected call sequence at %p: %x\n", ip, ppc_inst_val(op));
 		return -EINVAL;
 	}
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f5c6dcbac44b..d298bb16936e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -479,7 +479,7 @@ static void __init test_branch_iform(void)
 	/* Check flags are masked correctly */
 	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == ppc_inst(0x48000000));
+	check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
 }
 
 static void __init test_create_function_call(void)
@@ -564,7 +564,7 @@ static void __init test_branch_bform(void)
 	/* Check flags are masked correctly */
 	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == ppc_inst(0x43FF0000));
+	check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
 }
 
 static void __init test_translate_branch(void)
@@ -598,7 +598,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x4a000000));
+	check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
 
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
@@ -609,7 +609,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x49fffffc));
+	check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
 
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
@@ -655,7 +655,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x43ff8000));
+	check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
 
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
@@ -667,7 +667,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x43ff7ffc));
+	check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
 
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 855676785c56..5064e29a3dab 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -947,7 +947,7 @@ static void remove_bpts(void)
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
 		if (mread(bp->address, &instr, 4) == 4
-		    && instr == ppc_inst(bpinstr)
+		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
 			(unsigned int *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
@@ -2862,7 +2862,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			break;
 		}
 		inst = ppc_inst(GETWORD(val));
-		if (adr > first_adr && inst == last_inst) {
+		if (adr > first_adr && ppc_inst_equal(inst, last_inst)) {
 			if (!dotted) {
 				printf(" ...\n");
 				dotted = 1;
-- 
2.17.1

