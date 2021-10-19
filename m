Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F9432F85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQQj4BNXz3dbn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQPY6vXpz3cPP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPF19Kbz9sTJ;
 Tue, 19 Oct 2021 09:29:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5grTTbdrs8EZ; Tue, 19 Oct 2021 09:29:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP671Gxz9sSn;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC0218B774;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t655smvRxWHw; Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C0A78B77E;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TcTU3188418
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:38 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TcuW3188417;
 Tue, 19 Oct 2021 09:29:38 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 05/22] powerpc/32s: Remove capability to disable KUEP at
 boottime
Date: Tue, 19 Oct 2021 09:29:16 +0200
Message-Id: <96f583f82423a29a4205c60b9721079111b35567.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=1819; s=20211009;
 h=from:subject:message-id; bh=P+Knt97H/ROO0OmbGX5DKKQYseP+Jn0t0vKg+VOS9M4=;
 b=N/C/Naa1jFMedPudaYkTYWHRCxDMVmDB1pZHYIgjTgcW7ybKIvaQNbO/5hCtSye1acz5scqXwPss
 MHO25B2nCimpkVcqabkHpbtoxr4n/J373jyonviVqP7abcr3NMpH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Disabling KUEP at boottime makes things unnecessarily complex.

Still allow disabling KUEP at build time, but when it's built-in
it is always there.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h |  3 +--
 arch/powerpc/mm/book3s32/kuep.c          | 10 ++--------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 9f38040f0641..fb6c39225dd1 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -12,7 +12,6 @@
 #include <linux/jump_label.h>
 
 extern struct static_key_false disable_kuap_key;
-extern struct static_key_false disable_kuep_key;
 
 static __always_inline bool kuap_is_disabled(void)
 {
@@ -21,7 +20,7 @@ static __always_inline bool kuap_is_disabled(void)
 
 static __always_inline bool kuep_is_disabled(void)
 {
-	return !IS_ENABLED(CONFIG_PPC_KUEP) || static_branch_unlikely(&disable_kuep_key);
+	return !IS_ENABLED(CONFIG_PPC_KUEP);
 }
 
 static inline void kuep_lock(void)
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
index c20733d6e02c..8474edce3df9 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -3,18 +3,12 @@
 #include <asm/kup.h>
 #include <asm/smp.h>
 
-struct static_key_false disable_kuep_key;
-
 void setup_kuep(bool disabled)
 {
-	if (!disabled)
-		kuep_lock();
+	kuep_lock();
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
 
-	if (disabled)
-		static_branch_enable(&disable_kuep_key);
-	else
-		pr_info("Activating Kernel Userspace Execution Prevention\n");
+	pr_info("Activating Kernel Userspace Execution Prevention\n");
 }
-- 
2.31.1

