Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC6857A12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 11:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbnp941V2z3vY9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 21:13:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbnnm3wWSz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 21:13:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Tbnnj3CMlz9syV;
	Fri, 16 Feb 2024 11:13:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxzEY0ci_yMv; Fri, 16 Feb 2024 11:13:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Tbnnj2cPyz9syQ;
	Fri, 16 Feb 2024 11:13:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55F138B786;
	Fri, 16 Feb 2024 11:13:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oPZ7HNpSeR9n; Fri, 16 Feb 2024 11:13:29 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F31F58B765;
	Fri, 16 Feb 2024 11:13:28 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/kprobes: Handle error returned by set_memory_rox()
Date: Fri, 16 Feb 2024 11:13:28 +0100
Message-ID: <b4907cf4339bd086abc40430d91311436cb0c18e.1708078401.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708078408; l=920; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=gFvxdGBn2gnL3Qmsqfyn1m40w0A0o3zw63K6CAs0gX4=; b=/IhHW28iLo2Vr4CTEJAwUYwwtuSKH+4Arca0BPk4cDLWtr2N6OVhNYmK8ndxZSjP4948b3wSt xXQoD/TyqVEBM1D4k7mx91IBxe7lQRxRQUXLsYFOfz6Uk9tn0AFkilG
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

set_memory_rox() can fail.

In case it fails, free allocated memory and return NULL.

Link: https://github.com/KSPP/linux/issues/7
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/kprobes.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index b20ee72e873a..bbca90a5e2ec 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -134,10 +134,16 @@ void *alloc_insn_page(void)
 	if (!page)
 		return NULL;
 
-	if (strict_module_rwx_enabled())
-		set_memory_rox((unsigned long)page, 1);
+	if (strict_module_rwx_enabled()) {
+		int err = set_memory_rox((unsigned long)page, 1);
 
+		if (err)
+			goto error;
+	}
 	return page;
+error:
+	module_memfree(page);
+	return NULL;
 }
 
 int arch_prepare_kprobe(struct kprobe *p)
-- 
2.43.0

