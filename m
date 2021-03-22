Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B1344BD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:40:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F40bM6hkjz3ckw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:39:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F40Xz2tbxz304V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:37:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F40Xp581Bz9txkL;
 Mon, 22 Mar 2021 17:37:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YZ7j8Sjp_lcc; Mon, 22 Mar 2021 17:37:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F40Xp43Txz9txkT;
 Mon, 22 Mar 2021 17:37:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3273E8B7A3;
 Mon, 22 Mar 2021 17:37:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y3k_e_OhNYem; Mon, 22 Mar 2021 17:37:52 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5C418B79C;
 Mon, 22 Mar 2021 17:37:51 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B988F675F4; Mon, 22 Mar 2021 16:37:51 +0000 (UTC)
Message-Id: <f7bd573a368edd78006f8a5af508c726e7ce1ed2.1616430991.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616430991.git.christophe.leroy@csgroup.eu>
References: <cover.1616430991.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 6/8] powerpc/asm: Add some opcodes in asm/ppc-opcode.h for
 PPC32 eBPF
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Mon, 22 Mar 2021 16:37:51 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following opcodes will be needed for the implementation
of eBPF for PPC32. Add them in asm/ppc-opcode.h

PPC_RAW_ADDE
PPC_RAW_ADDZE
PPC_RAW_ADDME
PPC_RAW_MFLR
PPC_RAW_ADDIC
PPC_RAW_ADDIC_DOT
PPC_RAW_SUBFC
PPC_RAW_SUBFE
PPC_RAW_SUBFIC
PPC_RAW_SUBFZE
PPC_RAW_ANDIS
PPC_RAW_NOR

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ed161ef2b3ca..5b60020dc1f4 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -437,6 +437,9 @@
 #define PPC_RAW_STFDX(s, a, b)		(0x7c0005ae | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_LVX(t, a, b)		(0x7c0000ce | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_STVX(s, a, b)		(0x7c0001ce | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADDE(t, a, b)		(0x7c000114 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADDZE(t, a)		(0x7c000194 | ___PPC_RT(t) | ___PPC_RA(a))
+#define PPC_RAW_ADDME(t, a)		(0x7c0001d4 | ___PPC_RT(t) | ___PPC_RA(a))
 #define PPC_RAW_ADD(t, a, b)		(PPC_INST_ADD | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
 #define PPC_RAW_ADDC(t, a, b)		(0x7c000014 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
@@ -445,11 +448,14 @@
 #define PPC_RAW_BLR()			(PPC_INST_BLR)
 #define PPC_RAW_BLRL()			(0x4e800021)
 #define PPC_RAW_MTLR(r)			(0x7c0803a6 | ___PPC_RT(r))
+#define PPC_RAW_MFLR(t)			(PPC_INST_MFLR | ___PPC_RT(t))
 #define PPC_RAW_BCTR()			(PPC_INST_BCTR)
 #define PPC_RAW_MTCTR(r)		(PPC_INST_MTCTR | ___PPC_RT(r))
 #define PPC_RAW_ADDI(d, a, i)		(PPC_INST_ADDI | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_LI(r, i)		PPC_RAW_ADDI(r, 0, i)
 #define PPC_RAW_ADDIS(d, a, i)		(PPC_INST_ADDIS | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_ADDIC(d, a, i)		(0x30000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_ADDIC_DOT(d, a, i)	(0x34000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_LIS(r, i)		PPC_RAW_ADDIS(r, 0, i)
 #define PPC_RAW_STDX(r, base, b)	(0x7c00012a | ___PPC_RS(r) | ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_RAW_STDU(r, base, i)	(0xf8000001 | ___PPC_RS(r) | ___PPC_RA(base) | ((i) & 0xfffc))
@@ -472,6 +478,10 @@
 #define PPC_RAW_CMPLW(a, b)		(0x7c000040 | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_CMPLD(a, b)		(0x7c200040 | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_SUB(d, a, b)		(0x7c000050 | ___PPC_RT(d) | ___PPC_RB(a) | ___PPC_RA(b))
+#define PPC_RAW_SUBFC(d, a, b)		(0x7c000010 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_SUBFE(d, a, b)		(0x7c000110 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_SUBFIC(d, a, i)		(0x20000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_SUBFZE(d, a)		(0x7c000190 | ___PPC_RT(d) | ___PPC_RA(a))
 #define PPC_RAW_MULD(d, a, b)		(0x7c0001d2 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_MULW(d, a, b)		(0x7c0001d6 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_MULHWU(d, a, b)		(0x7c000016 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
@@ -484,11 +494,13 @@
 #define PPC_RAW_DIVDEU_DOT(t, a, b)	(0x7c000312 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
 #define PPC_RAW_AND(d, a, b)		(0x7c000038 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_ANDI(d, a, i)		(0x70000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_ANDIS(d, a, i)		(0x74000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
 #define PPC_RAW_AND_DOT(d, a, b)	(0x7c000039 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_OR(d, a, b)		(0x7c000378 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_MR(d, a)		PPC_RAW_OR(d, a, a)
 #define PPC_RAW_ORI(d, a, i)		(PPC_INST_ORI | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
 #define PPC_RAW_ORIS(d, a, i)		(PPC_INST_ORIS | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_NOR(d, a, b)		(0x7c0000f8 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_XOR(d, a, b)		(0x7c000278 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_XORI(d, a, i)		(0x68000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
 #define PPC_RAW_XORIS(d, a, i)		(0x6c000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
-- 
2.25.0

