Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242281B15A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 10:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwkyV15r3z3cR8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 20:04:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swkxb5GXBz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 20:03:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4SwkxP3FC7z9v9j;
	Thu, 21 Dec 2023 10:03:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fqs9y1ggkq6h; Thu, 21 Dec 2023 10:03:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Swkwl6cZLz9v6D;
	Thu, 21 Dec 2023 10:03:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF5B68B788;
	Thu, 21 Dec 2023 10:03:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id W2ziqtgAv9yK; Thu, 21 Dec 2023 10:03:03 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (PO25106.IDSI0.si.c-s.fr [192.168.232.169])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C38B8B765;
	Thu, 21 Dec 2023 10:03:03 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 2/3] modules: Remove #ifdef CONFIG_STRICT_MODULE_RWX around rodata_enabled
Date: Thu, 21 Dec 2023 10:02:47 +0100
Message-ID: <ac300e1a84eed4ba4d6a791eef2be30654bc566e.1703149011.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703149365; l=911; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=KgXa9tEdYbBGRtlR2Sk8FbMi8n/9B7ioVpOACaYMJnE=; b=bo+Bre38mcoaNi8xnqzMLLZvyIpZAWuADlq8yZdyZp1/UYDgHgyNKuVO+iy9JCZyGJYTIUT3f m9mnac+tp9rBKFv96ZmTDUPGfIg97OTiYd9K8LYhy1CkbzkJkVLe4W4
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
Cc: linux-modules@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that rodata_enabled is declared at all time, the #ifdef
CONFIG_STRICT_MODULE_RWX can be removed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module/strict_rwx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/kernel/module/strict_rwx.c b/kernel/module/strict_rwx.c
index a2b656b4e3d2..eadff63b6e80 100644
--- a/kernel/module/strict_rwx.c
+++ b/kernel/module/strict_rwx.c
@@ -34,12 +34,8 @@ void module_enable_x(const struct module *mod)
 
 void module_enable_ro(const struct module *mod, bool after_init)
 {
-	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
-		return;
-#ifdef CONFIG_STRICT_MODULE_RWX
-	if (!rodata_enabled)
+	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX) || !rodata_enabled)
 		return;
-#endif
 
 	module_set_memory(mod, MOD_TEXT, set_memory_ro);
 	module_set_memory(mod, MOD_INIT_TEXT, set_memory_ro);
-- 
2.41.0

