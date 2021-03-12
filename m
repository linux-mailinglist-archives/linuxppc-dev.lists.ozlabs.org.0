Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD0338E33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:04:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmGm13Lnz3jPp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxlzc5lSZz3dRp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxlzY3Rtbz9ttBZ;
 Fri, 12 Mar 2021 13:50:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SZC8Yc15Jl1H; Fri, 12 Mar 2021 13:50:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxlzY2CZHz9ttBV;
 Fri, 12 Mar 2021 13:50:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F0288B812;
 Fri, 12 Mar 2021 13:50:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JA3IzOfs8Gcl; Fri, 12 Mar 2021 13:50:50 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 090B18B764;
 Fri, 12 Mar 2021 13:50:50 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CE963675C9; Fri, 12 Mar 2021 12:50:49 +0000 (UTC)
Message-Id: <2be8fb729da4a0f9863b25e1b9d547174fcd5056.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 39/41] powerpc/32s: Create C version of kuap
 save/restore/check helpers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:49 +0000 (UTC)
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

In preparation of porting PPC32 to C syscall entry/exit,
create C version of kuap_save_and_lock() and kuap_user_restore() and
kuap_kernel_restore() and kuap_assert_locked() and
kuap_get_and_assert_locked() on book3s/32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index b97ea60f6fa3..46599bbc4525 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -72,6 +72,51 @@ static inline void kuap_update_sr(u32 sr, u32 addr, u32 end)
 	isync();	/* Context sync required after mtsr() */
 }
 
+static inline void kuap_save_and_lock(struct pt_regs *regs)
+{
+	unsigned long kuap = current->thread.kuap;
+	u32 addr = kuap & 0xf0000000;
+	u32 end = kuap << 28;
+
+	regs->kuap = kuap;
+	if (unlikely(!kuap))
+		return;
+
+	current->thread.kuap = 0;
+	kuap_update_sr(mfsr(addr) | SR_KS, addr, end);	/* Set Ks */
+}
+
+static inline void kuap_user_restore(struct pt_regs *regs)
+{
+}
+
+static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+{
+	u32 addr = regs->kuap & 0xf0000000;
+	u32 end = regs->kuap << 28;
+
+	current->thread.kuap = regs->kuap;
+
+	if (unlikely(regs->kuap == kuap))
+		return;
+
+	kuap_update_sr(mfsr(addr) & ~SR_KS, addr, end);	/* Clear Ks */
+}
+
+static inline unsigned long kuap_get_and_assert_locked(void)
+{
+	unsigned long kuap = current->thread.kuap;
+
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && kuap != 0);
+
+	return kuap;
+}
+
+static inline void kuap_assert_locked(void)
+{
+	kuap_get_and_assert_locked();
+}
+
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      u32 size, unsigned long dir)
 {
-- 
2.25.0

