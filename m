Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02F311D01
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 12:57:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXrQC2zn5zDrbg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 22:57:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXrBK4kH1zDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 22:47:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DXrB7103hz9v3fN;
 Sat,  6 Feb 2021 12:47:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pFCQbtLswfts; Sat,  6 Feb 2021 12:47:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DXrB66yWrz9v3fL;
 Sat,  6 Feb 2021 12:47:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30B2B8B784;
 Sat,  6 Feb 2021 12:47:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id djLX3raxKaRs; Sat,  6 Feb 2021 12:47:28 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D40368B766;
 Sat,  6 Feb 2021 12:47:27 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A8DD8672EC; Sat,  6 Feb 2021 11:47:27 +0000 (UTC)
Message-Id: <f92d99f4349391b77766745900231aa880a0efb5.1612612022.git.christophe.leroy@csgroup.eu>
In-Reply-To: <72c7b9879e2e2e6f5c27dadda6486386c2b50f23.1612612022.git.christophe.leroy@csgroup.eu>
References: <72c7b9879e2e2e6f5c27dadda6486386c2b50f23.1612612022.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/3] powerpc/32s: mfsrin()/mtsrin() become mfsr()/mtsr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  6 Feb 2021 11:47:27 +0000 (UTC)
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

Function names should tell what the function does, not how.

mfsrin() and mtsrin() are read/writing segment registers.

They are called that way because they are using mfsrin and mtsrin
instructions, but it doesn't matter for the caller.

In preparation of following patch, change their name to mfsr() and mtsr()
in order to make it obvious they manipulate segment registers without
messing up with how they do it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 8 ++++----
 arch/powerpc/include/asm/reg.h           | 4 ++--
 arch/powerpc/mm/book3s32/mmu.c           | 2 +-
 arch/powerpc/mm/ptdump/segment_regs.c    | 2 +-
 arch/powerpc/xmon/xmon.c                 | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index e8ea6ac809a9..d5e45eedf581 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -95,12 +95,12 @@ static inline void kuap_update_sr(u32 sr, u32 addr, u32 end)
 	addr &= 0xf0000000;	/* align addr to start of segment */
 	barrier();	/* make sure thread.kuap is updated before playing with SRs */
 	while (addr < end) {
-		mtsrin(sr, addr);
+		mtsr(sr, addr);
 		sr += 0x111;		/* next VSID */
 		sr &= 0xf0ffffff;	/* clear VSID overflow */
 		addr += 0x10000000;	/* address of next segment */
 	}
-	isync();	/* Context sync required after mtsrin() */
+	isync();	/* Context sync required after mtsr() */
 }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
@@ -122,7 +122,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	end = min(addr + size, TASK_SIZE);
 
 	current->thread.kuap = (addr & 0xf0000000) | ((((end - 1) >> 28) + 1) & 0xf);
-	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
+	kuap_update_sr(mfsr(addr) & ~SR_KS, addr, end);	/* Clear Ks */
 }
 
 static __always_inline void prevent_user_access(void __user *to, const void __user *from,
@@ -151,7 +151,7 @@ static __always_inline void prevent_user_access(void __user *to, const void __us
 	}
 
 	current->thread.kuap = 0;
-	kuap_update_sr(mfsrin(addr) | SR_KS, addr, end);	/* set Ks */
+	kuap_update_sr(mfsr(addr) | SR_KS, addr, end);	/* set Ks */
 }
 
 static inline unsigned long prevent_user_access_return(void)
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index f0fb03c9f289..eeab7e7dc699 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1414,7 +1414,7 @@ static inline void msr_check_and_clear(unsigned long bits)
 }
 
 #ifdef CONFIG_PPC32
-static inline u32 mfsrin(u32 idx)
+static inline u32 mfsr(u32 idx)
 {
 	u32 val;
 
@@ -1423,7 +1423,7 @@ static inline u32 mfsrin(u32 idx)
 	return val;
 }
 
-static inline void mtsrin(u32 val, u32 idx)
+static inline void mtsr(u32 val, u32 idx)
 {
 	asm volatile("mtsrin %0, %1" : : "r" (val), "r" (idx));
 }
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 859e5bd603ac..d7eb266a3f7a 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -234,7 +234,7 @@ void mmu_mark_initmem_nx(void)
 		if (is_module_segment(i << 28))
 			continue;
 
-		mtsrin(mfsrin(i << 28) | 0x10000000, i << 28);
+		mtsr(mfsr(i << 28) | 0x10000000, i << 28);
 	}
 }
 
diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
index dde2fe8de4b2..565048a0c9be 100644
--- a/arch/powerpc/mm/ptdump/segment_regs.c
+++ b/arch/powerpc/mm/ptdump/segment_regs.c
@@ -10,7 +10,7 @@
 
 static void seg_show(struct seq_file *m, int i)
 {
-	u32 val = mfsrin(i << 28);
+	u32 val = mfsr(i << 28);
 
 	seq_printf(m, "0x%01x0000000-0x%01xfffffff ", i, i);
 	seq_printf(m, "Kern key %d ", (val >> 30) & 1);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index cec432eb9189..3fe37495f63d 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3719,7 +3719,7 @@ void dump_segments(void)
 
 	printf("sr0-15 =");
 	for (i = 0; i < 16; ++i)
-		printf(" %x", mfsrin(i << 28));
+		printf(" %x", mfsr(i << 28));
 	printf("\n");
 }
 #endif
-- 
2.25.0

