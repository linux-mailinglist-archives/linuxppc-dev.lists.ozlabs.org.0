Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4A365AAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 16:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPlkD0ZJwz3bms
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 00:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPljv3Lz6z2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 00:02:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPljn6cbjz9v0Dy;
 Tue, 20 Apr 2021 16:02:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w5X7gkbZO2QL; Tue, 20 Apr 2021 16:02:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPljn5sLLz9v0Dw;
 Tue, 20 Apr 2021 16:02:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 334188B807;
 Tue, 20 Apr 2021 16:02:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VkjBHKdmV6jb; Tue, 20 Apr 2021 16:02:07 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D40178B7ED;
 Tue, 20 Apr 2021 16:02:06 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 42F8F67A48; Tue, 20 Apr 2021 14:02:06 +0000 (UTC)
Message-Id: <22cadf29620664b600b82026d2a72b8b23351777.1618927318.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/2] powerpc/inst: ppc_inst_as_u64() becomes
 ppc_inst_as_ulong()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Tue, 20 Apr 2021 14:02:06 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to simplify use on PPC32, change ppc_inst_as_u64()
into ppc_inst_as_ulong() that returns the 32 bits instruction
on PPC32.

Will be used when porting OPTPROBES to PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h  | 13 +++++++------
 arch/powerpc/kernel/optprobes.c  |  2 +-
 arch/powerpc/lib/code-patching.c |  2 +-
 arch/powerpc/xmon/xmon.c         |  2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 19e18af2fac9..9646c63f7420 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -147,13 +147,14 @@ static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst *va
 	return location + ppc_inst_len(tmp);
 }
 
-static inline u64 ppc_inst_as_u64(struct ppc_inst x)
+static inline unsigned long ppc_inst_as_ulong(struct ppc_inst x)
 {
-#ifdef CONFIG_CPU_LITTLE_ENDIAN
-	return (u64)ppc_inst_suffix(x) << 32 | ppc_inst_val(x);
-#else
-	return (u64)ppc_inst_val(x) << 32 | ppc_inst_suffix(x);
-#endif
+	if (IS_ENABLED(CONFIG_PPC32))
+		return ppc_inst_val(x);
+	else if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
+		return (u64)ppc_inst_suffix(x) << 32 | ppc_inst_val(x);
+	else
+		return (u64)ppc_inst_val(x) << 32 | ppc_inst_suffix(x);
 }
 
 #define PPC_INST_STR_LEN sizeof("00000000 00000000")
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 7f7cdbeacd1a..58fdb9f66e0f 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -264,7 +264,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
 	temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
-	patch_imm64_load_insns(ppc_inst_as_u64(temp), 4, buff + TMPL_INSN_IDX);
+	patch_imm64_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 65aec4d6d9ba..870b30d9be2f 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -26,7 +26,7 @@ static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr
 
 		__put_kernel_nofault(patch_addr, &val, u32, failed);
 	} else {
-		u64 val = ppc_inst_as_u64(instr);
+		u64 val = ppc_inst_as_ulong(instr);
 
 		__put_kernel_nofault(patch_addr, &val, u64, failed);
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a619b9ed8458..ff2b92bfeedc 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2953,7 +2953,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		if (!ppc_inst_prefixed(inst))
 			dump_func(ppc_inst_val(inst), adr);
 		else
-			dump_func(ppc_inst_as_u64(inst), adr);
+			dump_func(ppc_inst_as_ulong(inst), adr);
 		printf("\n");
 	}
 	return adr - first_adr;
-- 
2.25.0

