Return-Path: <linuxppc-dev+bounces-3754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C46069E2C47
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rkz605Nz30TN;
	Wed,  4 Dec 2024 06:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255211;
	cv=none; b=YI6GSAarbw7tyGyOsRdloEAOVSBUupZVGljbgUxYMZmB1r1Qg/DrP0fcE7IKkR8GbXIJLx5wTQXUoF4kEh8g6PWAjtXwS9WLfLz1hP03lTKrA5IFCTyKKhpiRiOYWv4WxwH27avs16ZsbufxcNCQbvNweyvoJnpPvTlgPfStU3SFs1BQ9gQC1q2pD+ilYPUyztVbIi1/OfIl/ORVGBdisu2QPyVXS/ug4KjQeHY8x5Tqqk32SDiarT+O61qqM4c9xjSyOzDz2+whb4sWccG/q6rWSZ2HxT5GE6Ds2p3rUbKm+kADkbOQN3b3UEoY9EMndG3UrQXwBjgyQNg1cgOoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255211; c=relaxed/relaxed;
	bh=ZZKDg104gVIc1a/lsJz37szJNV882/4I4EWcir1qknM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0OVcSZnTpZNTlj2U/nBQUM3rOg+R8Ehrv2NrhgL6FMlkV5mXSSfmuXrhnl6MULqfzRcre7T8bBuZU1YlqdZZCgjP7L/O81gHFP+QVFructuaoTOxRGV1mEDc1xSoGpaUBYsSWScHamvFTksng2lmlfGpYBKWn+gb55YMXVMYr1wWGjbj/OaZAH9wfd9fNHIP0JkjcxjEsD6cjoK0fvd9SK0gqtqddvxunJ/67lxRmORz0KWCz9UihBKRJs7iw5fAiK9lN7iVCnK8LxWnU6xYKaeRCn8B5Y/4U6C3yMzXfKSY2BuTnn7YGSr1bQNp9KwUwRRN/a6VuRgkSw7JGUyJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rky6ZzQz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:46:50 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rkY0ytrz9stJ;
	Tue,  3 Dec 2024 20:46:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1DaesogsHDn; Tue,  3 Dec 2024 20:46:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rkW4TSmz9stD;
	Tue,  3 Dec 2024 20:46:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85FDF8B763;
	Tue,  3 Dec 2024 20:46:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xC4QlQoN6kLD; Tue,  3 Dec 2024 20:46:27 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2B7B8B767;
	Tue,  3 Dec 2024 20:46:26 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 4/4] powerpc/static_call: Implement inline static calls
Date: Tue,  3 Dec 2024 20:44:52 +0100
Message-ID: <3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1733245362.git.christophe.leroy@csgroup.eu>
References: <cover.1733245362.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733255162; l=2956; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=zg0V8okVh2HcUM+I7hCx9fsftgdLb74b1p7T4df88FM=; b=jSBMxVv18VlXpPuDupbIyS5plVVdoSdXqAPZOJsldhnjbLavWN3Ndh72UGg82KviTra0e+M3P hCKRZRhv9Q4AQVQ/dJOxisbTfOoMv6GCOPbkcYtTdTMX/qsmDcSOEJ0
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index a0ce777f9706..285bc1ae17dd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -282,6 +282,7 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,$(m64-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -mstack-protector-guard-offset=0)
 	select HAVE_STATIC_CALL			if PPC32
+	select HAVE_STATIC_CALL_INLINE		if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
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
index 1b106fbcc567..ec3101f95e53 100644
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
 			err = patch_ulong(tramp + PPC_SCT_DATA, _func);
 			if (err)
-- 
2.47.0


