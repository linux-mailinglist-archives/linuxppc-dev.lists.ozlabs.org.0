Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92EC10A38B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 18:47:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mrvg5JngzDqBP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 04:47:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hkifk1G9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MrqF0wNZzDqJh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:43:34 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mrq461YPz9ty2c;
 Tue, 26 Nov 2019 18:43:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hkifk1G9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YnnBfpl8RO2W; Tue, 26 Nov 2019 18:43:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mrq44t0zz9ty2Y;
 Tue, 26 Nov 2019 18:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574790208; bh=m0aiphzXsLV8MFDpVGE+DZGy/eAZvjSQu0FaIgxpnvg=;
 h=From:Subject:To:Cc:Date:From;
 b=hkifk1G9JpLdhz6pmBZ8Yxj50jyOjV6x7eQmTB2hl/JH3ixxZfPlxvUfiERkd+v4G
 WdVTX1JMBn3v5GjfI/omgrns1XsL6noEdo1p+TyL7FeOiXNNgnjgRYgl4gzrjYTbZS
 tXwkWDjK7FpXFS3okBSgka2aED5JcfyMcl5l22tU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F2078B825;
 Tue, 26 Nov 2019 18:43:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jmirWul1SeLN; Tue, 26 Nov 2019 18:43:30 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1918C8B81A;
 Tue, 26 Nov 2019 18:43:30 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AA65A6B76D; Tue, 26 Nov 2019 17:43:29 +0000 (UTC)
Message-Id: <05105deeaf63bc02151aea2cdeaf525534e0e9d4.1574790198.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 1/2] powerpc/hw_breakpoints: Rewrite 8xx breakpoints to
 allow any address range size.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ravi.bangoria@linux.ibm.com
Date: Tue, 26 Nov 2019 17:43:29 +0000 (UTC)
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

Unlike standard powerpc, Powerpc 8xx doesn't have SPRN_DABR, but
it has a breakpoint support based on a set of comparators which
allow more flexibility.

Commit 4ad8622dc548 ("powerpc/8xx: Implement hw_breakpoint")
implemented breakpoints by emulating the DABR behaviour. It did
this by setting one comparator the match 4 bytes at breakpoint address
and the other comparator to match 4 bytes at breakpoint address + 4.

Rewrite 8xx hw_breakpoint to make breakpoints match all addresses
defined by the breakpoint address and length by making full use of
comparators.

Now, comparator E is set to match any address greater than breakpoint
address minus one. Comparator F is set to match any address lower than
breakpoint address plus breakpoint length. Addresses are aligned
to 32 bits.

When the breakpoint range starts at address 0, the breakpoint is set
to match comparator F only. When the breakpoint range end at address
0xffffffff, the breakpoint is set to match comparator E only.
Otherwise the breakpoint is set to match comparator E and F.

At the same time, use registers bit names instead of hardcoded values.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

---
v2: rebased on today's powerpc/next ; added 32 bit alignment
---
 arch/powerpc/include/asm/hw_breakpoint.h |  4 +++
 arch/powerpc/include/asm/reg_8xx.h       | 14 ++++++++
 arch/powerpc/kernel/hw_breakpoint.c      | 15 +++++----
 arch/powerpc/kernel/process.c            | 57 ++++++++++++++++++++------------
 4 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 27ac6f5d2891..f2f8d8aa8e3b 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -34,7 +34,11 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+#ifdef CONFIG_PPC_8xx
+#define HW_BREAKPOINT_ALIGN 0x3
+#else
 #define HW_BREAKPOINT_ALIGN 0x7
+#endif
 
 #define DABR_MAX_LEN	8
 #define DAWR_MAX_LEN	512
diff --git a/arch/powerpc/include/asm/reg_8xx.h b/arch/powerpc/include/asm/reg_8xx.h
index 07df35ee8cbc..299ee7be0f67 100644
--- a/arch/powerpc/include/asm/reg_8xx.h
+++ b/arch/powerpc/include/asm/reg_8xx.h
@@ -35,7 +35,21 @@
 #define SPRN_CMPE	152
 #define SPRN_CMPF	153
 #define SPRN_LCTRL1	156
+#define   LCTRL1_CTE_GT		0xc0000000
+#define   LCTRL1_CTF_LT		0x14000000
+#define   LCTRL1_CRWE_RW	0x00000000
+#define   LCTRL1_CRWE_RO	0x00040000
+#define   LCTRL1_CRWE_WO	0x000c0000
+#define   LCTRL1_CRWF_RW	0x00000000
+#define   LCTRL1_CRWF_RO	0x00010000
+#define   LCTRL1_CRWF_WO	0x00030000
 #define SPRN_LCTRL2	157
+#define   LCTRL2_LW0EN		0x80000000
+#define   LCTRL2_LW0LA_E	0x00000000
+#define   LCTRL2_LW0LA_F	0x04000000
+#define   LCTRL2_LW0LA_EandF	0x08000000
+#define   LCTRL2_LW0LADC	0x02000000
+#define   LCTRL2_SLW0EN		0x00000002
 #ifdef CONFIG_PPC_8xx
 #define SPRN_ICTRL	158
 #endif
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 58ce3d37c2a3..2462cd7c565c 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -160,6 +160,9 @@ static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
 		/* DAWR region can't cross 512 bytes boundary */
 		if ((start_addr >> 9) != (end_addr >> 9))
 			return -EINVAL;
+	} else if (IS_ENABLED(CONFIG_PPC_8xx)) {
+		/* 8xx can setup a range without limitation */
+		max_len = U16_MAX;
 	}
 
 	if (hw_len > max_len)
@@ -328,13 +331,11 @@ int hw_breakpoint_handler(struct die_args *args)
 	}
 
 	info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
-	if (IS_ENABLED(CONFIG_PPC_8xx)) {
-		if (!dar_within_range(regs->dar, info))
-			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-	} else {
-		if (!stepping_handler(regs, bp, info))
-			goto out;
-	}
+	if (!dar_within_range(regs->dar, info))
+		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+
+	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info))
+		goto out;
 
 	/*
 	 * As a policy, the callback is invoked in a 'trigger-after-execute'
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4df94b6e2f32..7fcf72e58826 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -740,28 +740,6 @@ static inline int __set_dabr(unsigned long dabr, unsigned long dabrx)
 		mtspr(SPRN_DABRX, dabrx);
 	return 0;
 }
-#elif defined(CONFIG_PPC_8xx)
-static inline int __set_dabr(unsigned long dabr, unsigned long dabrx)
-{
-	unsigned long addr = dabr & ~HW_BRK_TYPE_DABR;
-	unsigned long lctrl1 = 0x90000000; /* compare type: equal on E & F */
-	unsigned long lctrl2 = 0x8e000002; /* watchpoint 1 on cmp E | F */
-
-	if ((dabr & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_READ)
-		lctrl1 |= 0xa0000;
-	else if ((dabr & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_WRITE)
-		lctrl1 |= 0xf0000;
-	else if ((dabr & HW_BRK_TYPE_RDWR) == 0)
-		lctrl2 = 0;
-
-	mtspr(SPRN_LCTRL2, 0);
-	mtspr(SPRN_CMPE, addr);
-	mtspr(SPRN_CMPF, addr + 4);
-	mtspr(SPRN_LCTRL1, lctrl1);
-	mtspr(SPRN_LCTRL2, lctrl2);
-
-	return 0;
-}
 #else
 static inline int __set_dabr(unsigned long dabr, unsigned long dabrx)
 {
@@ -782,6 +760,39 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
 	return __set_dabr(dabr, dabrx);
 }
 
+static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
+{
+	unsigned long lctrl1 = LCTRL1_CTE_GT | LCTRL1_CTF_LT | LCTRL1_CRWE_RW |
+			       LCTRL1_CRWF_RW;
+	unsigned long lctrl2 = LCTRL2_LW0EN | LCTRL2_LW0LADC | LCTRL2_SLW0EN;
+	unsigned long start_addr = brk->address & ~HW_BREAKPOINT_ALIGN;
+	unsigned long end_addr = (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
+
+	if (start_addr == 0)
+		lctrl2 |= LCTRL2_LW0LA_F;
+	else if (end_addr == ~0U)
+		lctrl2 |= LCTRL2_LW0LA_E;
+	else
+		lctrl2 |= LCTRL2_LW0LA_EandF;
+
+	mtspr(SPRN_LCTRL2, 0);
+
+	if ((brk->type & HW_BRK_TYPE_RDWR) == 0)
+		return 0;
+
+	if ((brk->type & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_READ)
+		lctrl1 |= LCTRL1_CRWE_RO | LCTRL1_CRWF_RO;
+	if ((brk->type & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_WRITE)
+		lctrl1 |= LCTRL1_CRWE_WO | LCTRL1_CRWF_WO;
+
+	mtspr(SPRN_CMPE, start_addr - 1);
+	mtspr(SPRN_CMPF, end_addr + 1);
+	mtspr(SPRN_LCTRL1, lctrl1);
+	mtspr(SPRN_LCTRL2, lctrl2);
+
+	return 0;
+}
+
 void __set_breakpoint(struct arch_hw_breakpoint *brk)
 {
 	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
@@ -789,6 +800,8 @@ void __set_breakpoint(struct arch_hw_breakpoint *brk)
 	if (dawr_enabled())
 		// Power8 or later
 		set_dawr(brk);
+	else if (IS_ENABLED(CONFIG_PPC_8xx))
+		set_breakpoint_8xx(brk);
 	else if (!cpu_has_feature(CPU_FTR_ARCH_207S))
 		// Power7 or earlier
 		set_dabr(brk);
-- 
2.13.3

