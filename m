Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 256963770DE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 11:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FchlL0l1Wz3by0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 19:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fchkg4DZ0z2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 19:25:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fchkc4QLwz9sbC;
 Sat,  8 May 2021 11:25:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ke41vRBUCvmZ; Sat,  8 May 2021 11:25:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fchkc3V2Lz9sZs;
 Sat,  8 May 2021 11:25:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C0EA8B774;
 Sat,  8 May 2021 11:25:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zNCmdLJsctqi; Sat,  8 May 2021 11:25:44 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 28FFE8B76B;
 Sat,  8 May 2021 11:25:44 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 0435C64921; Sat,  8 May 2021 09:25:44 +0000 (UTC)
Message-Id: <cadc0a328bc8e6c5bf133193e7547d5c10ae7895.1620465920.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/signal: Fix possible build failure with
 unsafe_copy_fpr_{to/from}_user
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  8 May 2021 09:25:44 +0000 (UTC)
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

When neither CONFIG_VSX nor CONFIG_PPC_FPU_REGS are selected,
unsafe_copy_fpr_to_user() and unsafe_copy_fpr_from_user() are
doing nothing.

Then, unless the 'label' operand is used elsewhere, GCC complains
about it being defined but not used.

To fix that, add an impossible 'goto label'.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index f4aafa337c2e..1f07317964e4 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -166,9 +166,9 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 #else
-#define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
+#define unsafe_copy_fpr_to_user(to, task, label) do { if (0) goto label;} while (0)
 
-#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
+#define unsafe_copy_fpr_from_user(task, from, label) do { if (0) goto label;} while (0)
 
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
-- 
2.25.0

