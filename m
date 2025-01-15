Return-Path: <linuxppc-dev+bounces-5314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF2A12EA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLn82rdTz3ccS;
	Thu, 16 Jan 2025 09:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981436;
	cv=none; b=i7dWlSz3UnVOfFvk5rTtuIplcelBmWVcCEFT6q7O7Zm8zYe4h0Yp6Oq4xvPRxtqc7q/TncDqYZxmtxgQCm9oROG48WZA7/rGVQpqedVIJh6n6BeBQOuGKu4fbVhIVfS7i3uRKlAjknZ5X+jF3NmoXaFoiRf1Nq3GlNZCKR1zSJggYJXUJmInUibDjH2qJ/rl7+gup/XETx7rfy8R7nOh/taFjJpn2RC4DAOSCTEoFETWDLiQpA5lsLnoPi03FDzpm7t0NrE36EMTD5JsRSvEhfk5Ozb3h2ftgBkqF+yNLwfh2tr2ixEplyG9B/9kDUJh6D+4hfQESg+AA+aHtoDxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981436; c=relaxed/relaxed;
	bh=leojvhhzx7AmvcvtIzSQu/2B4Uin5HS+S4U1IY2M6kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NctvmwtI5rllLmEWscX5jbP1qZxOhDqG7JONItNGc8oMVPd91ijFpYNI/CAr+Rqu4iDnvwP4jrV9U2Rem2N6vtTcGgxNxZihWik0fRTHs48fz9kGTd8oWvFqGUnQTThvTHlrjfL8ZdfcsgJyr7X59PAbuzEFXhYtM7K/Y1kev+3CZRxzZZUOZAq0jaNQAuflGVisEAbKyGT51BdPF3TaxfiSJ8n7g5ZSrQLcoLQjEON1aVSVvpfC8YbSarXKjlN3bxc3maZHGv8yTJ4eEjGqpRbkCiB2/hFuf6QZTrsZFGpXkZEyNLl03oiD6B06sk/cznxDKbMHfDScePwEB1fhYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLn76DwGz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcD37V4z9sRr;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RuBQKud5YVsR; Wed, 15 Jan 2025 23:42:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcD2Npxz9sRk;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DCAA8B77A;
	Wed, 15 Jan 2025 23:42:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AEhSP7Uv2wGL; Wed, 15 Jan 2025 23:42:52 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15DC18B774;
	Wed, 15 Jan 2025 23:42:49 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 01/15] objtool: Fix generic annotation infrastructure cross build
Date: Wed, 15 Jan 2025 23:42:41 +0100
Message-ID: <0ac0217b174efcefe772822089e9b64ff8c65da3.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=1213; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=n5PKzA7GDiJ+vIl39yQ9EFUuhqglOyZ5+cDQqSVGCYs=; b=9nUpCHBH2MuF6kXRB8OESgj5pUg/Vwv9wBjo8aA5eEAfC5w5ABcr8HV2k0ZEnp+s+LP7Gxt50 WQWIL/XE0cwCPiSVvzpusLaUHSL+qQXRPwvYEDKhMfdGh7WefoesJgX
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Cross build for powerpc/32 on x86_64 leads to:

  CC      init/main.o
init/main.o: warning: objtool: early_randomize_kstack_offset+0xf0: Unknown annotation type: 134217728
init/main.o: warning: objtool: start_kernel+0x4a8: Unknown annotation type: 134217728
init/main.o: warning: objtool: do_one_initcall+0x178: Unknown annotation type: 134217728

Fix byte order.

Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New in v5
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e92c5564d9ca..129c4e2245ae 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2272,7 +2272,7 @@ static int read_annotate(struct objtool_file *file,
 	}
 
 	for_each_reloc(sec->rsec, reloc) {
-		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
+		type = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4));
 
 		offset = reloc->sym->offset + reloc_addend(reloc);
 		insn = find_insn(file, reloc->sym->sec, offset);
-- 
2.47.0


