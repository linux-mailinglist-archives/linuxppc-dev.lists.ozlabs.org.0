Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC67D69B8FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 10:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJjjq4qhJz3fTW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 20:16:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJjjF2y34z3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 20:16:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PJjj42s3rz9sct;
	Sat, 18 Feb 2023 10:16:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uJWeb0mWTZt; Sat, 18 Feb 2023 10:16:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PJjj41l34z9scr;
	Sat, 18 Feb 2023 10:16:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 239BD8B76E;
	Sat, 18 Feb 2023 10:16:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2bjNLcPQu38a; Sat, 18 Feb 2023 10:16:08 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.180])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E5A0B8B768;
	Sat, 18 Feb 2023 10:16:07 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31I9G2P6642520
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 18 Feb 2023 10:16:03 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31I9G2xl642519;
	Sat, 18 Feb 2023 10:16:02 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 02/10] powerpc/machdep: Define 'compatible' property in ppc_md and use it
Date: Sat, 18 Feb 2023 10:15:45 +0100
Message-Id: <c3334a1e7c5691fbd49daa9167ae4f6dcfe64d21.1676711562.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
References: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676711718; l=1879; s=20211009; h=from:subject:message-id; bh=4UtflhmaJKx0UHQvC6n4OOyGZUfXvGtlllCtkyUX3KE=; b=isGyfzhfQzFHgMU6JL0dIC/ZrLoyMoSi8WX14aM/3q+b0nwMFZGcogsLq5OxubVAQV1GOOEersY0 RO+FSPk7BlPFWmWlOwup5CWalbmGBfpTyETHELMVpN74QWDPWn5j
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

Most probe functions do nothing else than checking whether
the machine is compatible to a given string.

Define that string in ppc_md structure and check it directly from
probe_machine() instead of using ppc_md.probe() for that.

Keep checking in ppc_md.probe() only for more complex probing.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Make it const
---
 arch/powerpc/include/asm/machdep.h |  1 +
 arch/powerpc/kernel/setup-common.c | 13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 41815168a452..4f6e7d7ee388 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -21,6 +21,7 @@ struct pci_host_bridge;
 
 struct machdep_calls {
 	const char	*name;
+	const char	*compatible;
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PM
 	void		(*iommu_restore)(void);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index e77734e5a127..d2a446216444 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -630,13 +630,14 @@ static __init void probe_machine(void)
 	for (machine_id = &__machine_desc_start;
 	     machine_id < &__machine_desc_end;
 	     machine_id++) {
-		DBG("  %s ...", machine_id->name);
+		DBG("  %s ...\n", machine_id->name);
+		if (machine_id->compatible && !of_machine_is_compatible(machine_id->compatible))
+			continue;
 		memcpy(&ppc_md, machine_id, sizeof(struct machdep_calls));
-		if (ppc_md.probe()) {
-			DBG(" match !\n");
-			break;
-		}
-		DBG("\n");
+		if (ppc_md.probe && !ppc_md.probe())
+			continue;
+		DBG("   %s match !\n", machine_id->name);
+		break;
 	}
 	/* What can we do if we didn't find ? */
 	if (machine_id >= &__machine_desc_end) {
-- 
2.39.1

