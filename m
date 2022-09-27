Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D05EC68D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:36:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMdK40NQz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:36:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMZS0G5gz3c1c
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:34:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4McMYq3SC0z9spS;
	Tue, 27 Sep 2022 16:33:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EiTLqKzjR1na; Tue, 27 Sep 2022 16:33:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4McMYm2mf6z9snq;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 505538B77C;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bGs1x_KDTa2r; Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.35])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC1C08B778;
	Tue, 27 Sep 2022 16:33:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28REXSfF351184
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 16:33:28 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28REXS5V351183;
	Tue, 27 Sep 2022 16:33:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 5/6] powerpc/feature-fixups: Do not patch init section after init
Date: Tue, 27 Sep 2022 16:33:10 +0200
Message-Id: <6acb94d4762b788abff8619a7f392a1041db6220.1664289176.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
References: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664289185; l=1968; s=20211009; h=from:subject:message-id; bh=VMwAgVTdfAP1+6ctLb28oPppJbqmL7hFCqnWsutvyiM=; b=IAsOE8fmNuXoALJT3nhTw4931DaPehVItBvIltm3HHwVjWC01030ropkBiUvYl58NRZ9OO2iG1m6 ImKJfcZxCdYRzK07Jt1aQ85lvHKENmGImrppcV/IHcVuusvFduzb
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

Once init section is freed, attempting to patch init code
ends up in the weed.

Commit 51c3c62b58b3 ("powerpc: Avoid code patching freed init sections")
protected patch_instruction() against that, but it is the responsibility
of the caller to ensure that the patched memory is valid.

In the same spirit as jump_label with its jump_label_can_update()
function, add is_fixup_addr_valid() function to skip patching on
freed init section.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/feature-fixups.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index a03ed9931224..1d4342dc4b8d 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -118,6 +118,12 @@ void do_feature_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 }
 
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
+static bool is_fixup_addr_valid(void *dest, size_t size)
+{
+	return system_state < SYSTEM_FREEING_INITMEM ||
+	       !init_section_contains(dest, size);
+}
+
 static int do_patch_fixups(long *start, long *end, unsigned int *instrs, int num)
 {
 	int i;
@@ -126,6 +132,9 @@ static int do_patch_fixups(long *start, long *end, unsigned int *instrs, int num
 		int j;
 		unsigned int *dest = (void *)start + *start;
 
+		if (!is_fixup_addr_valid(dest, sizeof(*instrs) * num))
+			continue;
+
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
 		for (j = 0; j < num; j++)
@@ -144,6 +153,9 @@ static int do_patch_entry_fixups(long *start, long *end, unsigned int *instrs,
 	for (i = 0; start < end; start++, i++) {
 		unsigned int *dest = (void *)start + *start;
 
+		if (!is_fixup_addr_valid(dest, sizeof(*instrs) * 3))
+			continue;
+
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
 		// See comment in do_entry_flush_fixups() RE order of patching
-- 
2.37.1

