Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D527472242C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 13:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZW5p4mjlz3fdD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 21:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZW3r5Gvnz3f5l
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 21:05:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QZW3Z2c5nz9sB3;
	Mon,  5 Jun 2023 13:05:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yEWczW9iAZB; Mon,  5 Jun 2023 13:05:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QZW3Y1dpTz9sCR;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32E7D8B779;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id R9d0TXpTKiEu; Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E8268B776;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 355B58u9063398
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 5 Jun 2023 13:05:08 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 355B588S063397;
	Mon, 5 Jun 2023 13:05:08 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 4/4] powerpc/kuap: Make disabling KUAP at boottime optional
Date: Mon,  5 Jun 2023 13:04:53 +0200
Message-Id: <8d5438da7174ecb32e1c28cdb49987648df6ef15.1685963081.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu>
References: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685963090; l=2341; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=eT9dbnSEcz2YcoX5jD10s2KJ33ea3/IkWQJaOBRD95A=; b=H6XlWSUuB/kOUc1vmlRR5qOOSJQG3fTBDWC7aiOv6mdbtuPZvfSoYZ7DXsJrJ4NtzxxS3qSXX J8ONXUcaRs6ABFYmQryhV0OIXTsKecJgzYb5TjYoBvAhWKwzElphtLm
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is possible to disable KUAP at boottime with 'nosmap' parameter.

That is implemented with jump_label hence adds a 'nop' in front
of each open/close of userspace access.

From a security point of view it makes sence to disallow disabling
KUAP. And on processors like the 8xx where 'nop' is not seamless,
it saves a few cycles.

So add a CONFIG item to make it optionnal.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h         |  2 +-
 arch/powerpc/mm/init-common.c          |  3 +++
 arch/powerpc/platforms/Kconfig.cputype | 10 ++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 74b7f4cee2ed..f3280169aeec 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -53,7 +53,7 @@ extern struct static_key_false disable_kuap_key;
 
 static __always_inline bool kuap_is_disabled(void)
 {
-	return static_branch_unlikely(&disable_kuap_key);
+	return IS_ENABLED(CONFIG_PPC_KUAP_BOOTTIME) && static_branch_unlikely(&disable_kuap_key);
 }
 #endif
 #else
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 74e140b1efef..994ee58f0092 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -48,6 +48,9 @@ early_param("nosmep", parse_nosmep);
 
 static int __init parse_nosmap(char *p)
 {
+	if (!IS_ENABLED(CONFIG_PPC_KUAP_BOOTTIME))
+		return 0;
+
 	disable_kuap = true;
 	pr_warn("Disabling Kernel Userspace Access Protection\n");
 	return 0;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 45fd975ef521..f75c2d5cd182 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -502,6 +502,16 @@ config PPC_KUAP
 
 	  If you're unsure, say Y.
 
+config PPC_KUAP_BOOTTIME
+	bool "Allow disabling Kernel Userspace Access Protection at boottime"
+	depends on PPC_KUAP
+	default y
+	help
+	  Allow the user to disable Kernel Userspace Access Protection (KUAP)
+	  at boot time using 'nosmap' kernel parameter.
+
+	  If you're unsure, say Y.
+
 config PPC_KUAP_DEBUG
 	bool "Extra debugging for Kernel Userspace Access Protection"
 	depends on PPC_KUAP
-- 
2.40.1

