Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0B74F480
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0m6w0p3nz3dTk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m5P3t8Lz3chN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:08:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5C2mMPz9sFF;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9jn_gTS9xtG; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C26y9z9sFC;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 441DB8B78C;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qAb5vznBg5NF; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE41D8B77A;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8iXP3696806
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:44 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8i1a3696805;
	Tue, 11 Jul 2023 18:08:44 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 03/15] objtool: Allow an architecture to disable objtool on ASM files
Date: Tue, 11 Jul 2023 18:08:29 +0200
Message-ID: <f7902ba65573fd46691db0a00d92b1ff78f81ce3.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091705; l=1429; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=LpZtEBaGHh5V3WGM+V+sJTc1/w2XLjECt2Sdv79iyT8=; b=LpGh/tS33is/AsbgigCGB02KZVjeyfe9Tfn7tbIEREYKTRoJ+IKKUtLDLY97tJ9qrG4C/BiUj f7zl9we0J/5D+9WFKejAtNj0j8M+Uh988fQx84sq96oNHhpfNb2Fsvq
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

Supporting objtool on ASM files requires quite an effort.

Features like UACCESS validation don't require ASM files validation.

In order to allow architectures to enable objtool validation
without spending unnecessary effort on cleaning up ASM files,
provide an option to disable objtool validation on ASM files.

Suggested-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/Kconfig           | 5 +++++
 scripts/Makefile.build | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..3330ed761260 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1111,6 +1111,11 @@ config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 config HAVE_OBJTOOL
 	bool
 
+config ARCH_OBJTOOL_SKIP_ASM
+	bool
+	help
+	  Architecture doesn't support objtool on ASM files
+
 config HAVE_JUMP_LABEL_HACK
 	bool
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6413342a03f4..5818baddfb27 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -342,7 +342,11 @@ $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
+ifndef CONFIG_ARCH_OBJTOOL_SKIP_ASM
       cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
+else
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+endif
 
 ifdef CONFIG_ASM_MODVERSIONS
 
-- 
2.41.0

