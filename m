Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C455A960C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJKBm2PXtz3cCk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:51:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJK8n1jnlz3c8M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:49:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJK7y0s3xz9spG;
	Thu,  1 Sep 2022 13:49:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9C26P2oxqw8L; Thu,  1 Sep 2022 13:49:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJK7t34jDz9spJ;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FD718B780;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EuLa8HTRY4s9; Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.131])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD9DC8B781;
	Thu,  1 Sep 2022 13:48:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 281BmseE1768901
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 13:48:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 281Bmsgp1768900;
	Thu, 1 Sep 2022 13:48:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, bgray@linux.ibm.com, agust@denx.de,
        jpoimboe@kernel.org, peterz@infradead.org, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com
Subject: [PATCH v3 6/6] powerpc/static_call: Implement inline static calls
Date: Thu,  1 Sep 2022 13:48:25 +0200
Message-Id: <73de83279d8a8cdcffa411a525d60eb8e1901bf5.1662032631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1662032631.git.christophe.leroy@csgroup.eu>
References: <cover.1662032631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662032901; l=2913; s=20211009; h=from:subject:message-id; bh=TvtmX4ECN9pg2ZGuTVxGQDwg0x2MKLzYnuieB2MCpwA=; b=+rUtG7bfs80qmRGzX7EsUv8yDVc6/0BPG5hLed+TUPAQfCOIjHWiG98lGSXdtrXkGM44BmnWmx3h R/eZNgA8DY5eQrY3gY3fAf8SfAaetBeNtvlUn+jNC72Vbye+XXg9
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: chenzhongjin@huawei.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement inline static calls:
- Put a 'bl' to the destination function ('b' if tail call)
- Put a 'nop' when the destination function is NULL ('blr' if tail call)
- Put a 'li r3,0' when the destination is the RET0 function and not
a tail call.

If the destination is too far (over the 32Mb limit), go via the
trampoline.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/static_call.h |  2 ++
 arch/powerpc/kernel/static_call.c      | 24 +++++++++++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6be2e68fa9eb..9deb97c28304 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -251,6 +251,7 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STATIC_CALL			if PPC32
+	select HAVE_STATIC_CALL_INLINE		if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
index de1018cc522b..e3d5d3823dac 100644
--- a/arch/powerpc/include/asm/static_call.h
+++ b/arch/powerpc/include/asm/static_call.h
@@ -26,4 +26,6 @@
 #define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__PPC_SCT(name, "blr")
 #define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)	__PPC_SCT(name, "b .+20")
 
+#define CALL_INSN_SIZE		4
+
 #endif /* _ASM_POWERPC_STATIC_CALL_H */
diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
index 97765b9e1c5b..ba59e987f92d 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -15,7 +15,29 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 
 	mutex_lock(&text_mutex);
 
-	if (tramp) {
+	if (site && tail) {
+		if (!func)
+			err = patch_instruction(site, ppc_inst(PPC_RAW_BLR()));
+		else if (is_ret0)
+			err = patch_branch(site, _ret0, 0);
+		else if (is_short)
+			err = patch_branch(site, _func, 0);
+		else if (tramp)
+			err = patch_branch(site, _tramp, 0);
+		else
+			err = 0;
+	} else if (site) {
+		if (!func)
+			err = patch_instruction(site, ppc_inst(PPC_RAW_NOP()));
+		else if (is_ret0)
+			err = patch_instruction(site, ppc_inst(PPC_RAW_LI(_R3, 0)));
+		else if (is_short)
+			err = patch_branch(site, _func, BRANCH_SET_LINK);
+		else if (tramp)
+			err = patch_branch(site, _tramp, BRANCH_SET_LINK);
+		else
+			err = 0;
+	} else if (tramp) {
 		if (func && !is_short) {
 			err = patch_instruction(tramp + PPC_SCT_DATA, ppc_inst(_func));
 			if (err)
-- 
2.37.1

