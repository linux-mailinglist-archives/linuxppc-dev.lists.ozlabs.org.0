Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812364FC9B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 02:46:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kcn8k15Ltz3bcK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 10:46:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bi0wmgXQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bi0wmgXQ; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kcn846fj6z2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 10:45:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0D9BFCE0EA2;
 Tue, 12 Apr 2022 00:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE837C385AC;
 Tue, 12 Apr 2022 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724336;
 bh=trBNC8YuPBKlcPxoBGVpvrmOv8vIPeg+n7tKXJ1+6Gs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bi0wmgXQhUjQlpV3tRAtY8C749xb5JpfSF7rctUw4i5i14/HPcNhfbEB4ZfAEFQUw
 1D7tTQ7XaUQByjrIvUsi2rQT+/+Wf4EgPEtfOUMnNAoTgLaa9sZtncwhf1o+OQkJKg
 MKygcl/YOeA5paVlUI/L7IznXlVPZ7Op6N4ksa8FZXNA5WVFzHgT+cwJoB9eSF/4k9
 cCgUVhW2WsWxgtr1atfnn0mwqPTYksRLocQ9xogtV4nd5QuJJgt0tNzeXkQ3a71bwc
 KSMCyETpZo7S2NFC068bxxr9KPxuGV4wz5i7+oVfayJ+1Dn82BQ1AmzPLy8Vj6gFJY
 wUfRCO6NXPO/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 27/49] static_call: Properly initialise
 DEFINE_STATIC_CALL_RET0()
Date: Mon, 11 Apr 2022 20:43:45 -0400
Message-Id: <20220412004411.349427-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004411.349427-1-sashal@kernel.org>
References: <20220412004411.349427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, dave.hansen@linux.intel.com,
 jbaron@akamai.com, mingo@redhat.com, bp@alien8.de,
 Josh Poimboeuf <jpoimboe@redhat.com>, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 5517d500829c683a358a8de04ecb2e28af629ae5 ]

When a static call is updated with __static_call_return0() as target,
arch_static_call_transform() set it to use an optimised set of
instructions which are meant to lay in the same cacheline.

But when initialising a static call with DEFINE_STATIC_CALL_RET0(),
we get a branch to the real __static_call_return0() function instead
of getting the optimised setup:

	c00d8120 <__SCT__perf_snapshot_branch_stack>:
	c00d8120:	4b ff ff f4 	b       c00d8114 <__static_call_return0>
	c00d8124:	3d 80 c0 0e 	lis     r12,-16370
	c00d8128:	81 8c 81 3c 	lwz     r12,-32452(r12)
	c00d812c:	7d 89 03 a6 	mtctr   r12
	c00d8130:	4e 80 04 20 	bctr
	c00d8134:	38 60 00 00 	li      r3,0
	c00d8138:	4e 80 00 20 	blr
	c00d813c:	00 00 00 00 	.long 0x0

Add ARCH_DEFINE_STATIC_CALL_RET0_TRAMP() defined by each architecture
to setup the optimised configuration, and rework
DEFINE_STATIC_CALL_RET0() to call it:

	c00d8120 <__SCT__perf_snapshot_branch_stack>:
	c00d8120:	48 00 00 14 	b       c00d8134 <__SCT__perf_snapshot_branch_stack+0x14>
	c00d8124:	3d 80 c0 0e 	lis     r12,-16370
	c00d8128:	81 8c 81 3c 	lwz     r12,-32452(r12)
	c00d812c:	7d 89 03 a6 	mtctr   r12
	c00d8130:	4e 80 04 20 	bctr
	c00d8134:	38 60 00 00 	li      r3,0
	c00d8138:	4e 80 00 20 	blr
	c00d813c:	00 00 00 00 	.long 0x0

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lore.kernel.org/r/1e0a61a88f52a460f62a58ffc2a5f847d1f7d9d8.1647253456.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/static_call.h |  1 +
 arch/x86/include/asm/static_call.h     |  2 ++
 include/linux/static_call.h            | 20 +++++++++++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
index 0a0bc79bd1fa..de1018cc522b 100644
--- a/arch/powerpc/include/asm/static_call.h
+++ b/arch/powerpc/include/asm/static_call.h
@@ -24,5 +24,6 @@
 
 #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)	__PPC_SCT(name, "b " #func)
 #define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__PPC_SCT(name, "blr")
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)	__PPC_SCT(name, "b .+20")
 
 #endif /* _ASM_POWERPC_STATIC_CALL_H */
diff --git a/arch/x86/include/asm/static_call.h b/arch/x86/include/asm/static_call.h
index ed4f8bb6c2d9..2455d721503e 100644
--- a/arch/x86/include/asm/static_call.h
+++ b/arch/x86/include/asm/static_call.h
@@ -38,6 +38,8 @@
 #define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
 	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "ret; int3; nop; nop; nop")
 
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)			\
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name, __static_call_return0)
 
 #define ARCH_ADD_TRAMP_KEY(name)					\
 	asm(".pushsection .static_call_tramp_key, \"a\"		\n"	\
diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 3e56a9751c06..e2d70435988c 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -196,6 +196,14 @@ extern long __static_call_return0(void);
 	};								\
 	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
 
+#define DEFINE_STATIC_CALL_RET0(name, _func)				\
+	DECLARE_STATIC_CALL(name, _func);				\
+	struct static_call_key STATIC_CALL_KEY(name) = {		\
+		.func = __static_call_return0,				\
+		.type = 1,						\
+	};								\
+	ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)
+
 #define static_call_cond(name)	(void)__static_call(name)
 
 #define EXPORT_STATIC_CALL(name)					\
@@ -231,6 +239,12 @@ static inline int static_call_init(void) { return 0; }
 	};								\
 	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
 
+#define DEFINE_STATIC_CALL_RET0(name, _func)				\
+	DECLARE_STATIC_CALL(name, _func);				\
+	struct static_call_key STATIC_CALL_KEY(name) = {		\
+		.func = __static_call_return0,				\
+	};								\
+	ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)
 
 #define static_call_cond(name)	(void)__static_call(name)
 
@@ -287,6 +301,9 @@ static inline long __static_call_return0(void)
 		.func = NULL,						\
 	}
 
+#define DEFINE_STATIC_CALL_RET0(name, _func)				\
+	__DEFINE_STATIC_CALL(name, _func, __static_call_return0)
+
 static inline void __static_call_nop(void) { }
 
 /*
@@ -330,7 +347,4 @@ static inline int static_call_text_reserved(void *start, void *end)
 #define DEFINE_STATIC_CALL(name, _func)					\
 	__DEFINE_STATIC_CALL(name, _func, _func)
 
-#define DEFINE_STATIC_CALL_RET0(name, _func)				\
-	__DEFINE_STATIC_CALL(name, _func, __static_call_return0)
-
 #endif /* _LINUX_STATIC_CALL_H */
-- 
2.35.1

