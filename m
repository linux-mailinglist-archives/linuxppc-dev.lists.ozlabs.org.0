Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B066C3026A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 16:03:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPY631qHTzDr4N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 02:03:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPXmR6sCYzDqjg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:48:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPXmF6H9bz9v0Gv;
 Mon, 25 Jan 2021 15:48:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id quqkfYA1gVdP; Mon, 25 Jan 2021 15:48:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPXmF5RgPz9v0Gh;
 Mon, 25 Jan 2021 15:48:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E9BA8B79E;
 Mon, 25 Jan 2021 15:48:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nHsFHEqBjpbA; Mon, 25 Jan 2021 15:48:19 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16A9E8B79B;
 Mon, 25 Jan 2021 15:48:19 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0C4A466AD8; Mon, 25 Jan 2021 14:48:19 +0000 (UTC)
Message-Id: <4bfae182b09d6df95f4cecebbb1e7315edd40e94.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611585031.git.christophe.leroy@csgroup.eu>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 06/23] powerpc/32s: Create C version of
 kuap_user/kernel_restore() and friends
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon, 25 Jan 2021 14:48:19 +0000 (UTC)
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
create C version of kuap_user_restore() and kuap_kernel_restore()
and kuap_check() and kuap_get_and_check() on book3s/32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index a0117a9d5b06..a3e72e1141c5 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -103,6 +103,39 @@ static inline void kuap_update_sr(u32 sr, u32 addr, u32 end)
 	isync();	/* Context sync required after mtsrin() */
 }
 
+static inline void kuap_user_restore(struct pt_regs *regs)
+{
+}
+
+static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long kuap)
+{
+	u32 addr = kuap & 0xf0000000;
+	u32 end = kuap << 28;
+
+	if (unlikely(!kuap))
+		return;
+
+	current->thread.kuap = 0;
+	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
+}
+
+static inline void kuap_check(void)
+{
+	if (!IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
+		return;
+
+	WARN_ON_ONCE(current->thread.kuap != 0);
+}
+
+static inline unsigned long kuap_get_and_check(void)
+{
+	unsigned long kuap = current->thread.kuap;
+
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && kuap != 0);
+
+	return kuap;
+}
+
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      u32 size, unsigned long dir)
 {
-- 
2.25.0

