Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B95907388C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 17:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmRzd4tVFz3c0w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 01:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmRz51VgXz301r
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 01:20:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QmRz004c7z9sJj;
	Wed, 21 Jun 2023 17:20:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCGSmOT-fKYY; Wed, 21 Jun 2023 17:20:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QmRyx2PMJz9sJs;
	Wed, 21 Jun 2023 17:20:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EE338B779;
	Wed, 21 Jun 2023 17:20:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dIDcK9DBKVGZ; Wed, 21 Jun 2023 17:20:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24B988B763;
	Wed, 21 Jun 2023 17:20:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35LFKbuK2124260
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 17:20:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35LFKbQZ2124256;
	Wed, 21 Jun 2023 17:20:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] objtool: Make 'sec-address' always on
Date: Wed, 21 Jun 2023 17:20:31 +0200
Message-Id: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687360830; l=2749; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=cug9KrnhkD0tWNRN91NqNAgvx0YYURd13fBg+W5IvHQ=; b=MSMupOM8tiZHXuHmbGUr+49tsvsHOoMqLJJr6dQ9WAhib0c9wQaeZlV1OoHElkm//dypb0DWq 8Ers3uhG87CCZKBc1aSQNebBr5BBhwJHfoFpOCSe2UDbQpXq9wSto2C
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

Most of the time objtool warnings are useless without the
absolute address within the section.

Today there is --sec-address option to get it printed, but
that option is nowhere used and requires a change in Makefile
to use it.

Having the address inside the section at all time in addition
to the address within the object doesn't hurt and will help.

Remove the --sec-address option and print it at all time.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/builtin-check.c           | 1 -
 tools/objtool/include/objtool/builtin.h | 1 -
 tools/objtool/include/objtool/warn.h    | 6 ++----
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 7c175198d09f..d5024a95467a 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -91,7 +91,6 @@ static const struct option check_options[] = {
 	OPT_BOOLEAN(0, "module", &opts.module, "object is part of a kernel module"),
 	OPT_BOOLEAN(0, "mnop", &opts.mnop, "nop out mcount call sites"),
 	OPT_BOOLEAN(0, "no-unreachable", &opts.no_unreachable, "skip 'unreachable instruction' warnings"),
-	OPT_BOOLEAN(0, "sec-address", &opts.sec_address, "print section addresses in warnings"),
 	OPT_BOOLEAN(0, "stats", &opts.stats, "print statistics"),
 
 	OPT_END(),
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index 2a108e648b7a..af79618cf6ab 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -35,7 +35,6 @@ struct opts {
 	bool mnop;
 	bool module;
 	bool no_unreachable;
-	bool sec_address;
 	bool stats;
 };
 
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index b1c920dc9516..2db9717d0558 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -21,7 +21,6 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 	bool is_text = (sec->sh.sh_flags & SHF_EXECINSTR);
 	struct symbol *sym = NULL;
 	char *str;
-	int len;
 
 	if (is_text)
 		sym = find_func_containing(sec, offset);
@@ -30,9 +29,8 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 
 	if (sym) {
 		str = malloc(strlen(sym->name) + strlen(sec->name) + 40);
-		len = sprintf(str, "%s+0x%lx", sym->name, offset - sym->offset);
-		if (opts.sec_address)
-			sprintf(str+len, " (%s+0x%lx)", sec->name, offset);
+		sprintf(str, "%s+0x%lx (%s+0x%lx)", sym->name,
+			offset - sym->offset, sec->name, offset);
 	} else {
 		str = malloc(strlen(sec->name) + 20);
 		sprintf(str, "%s+0x%lx", sec->name, offset);
-- 
2.40.1

