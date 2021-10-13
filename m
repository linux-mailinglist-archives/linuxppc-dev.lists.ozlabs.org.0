Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4C42C3CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 16:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTwKf16VJz307l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 01:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTwKB5q62z2xrx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 01:44:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HTwK46BYsz9sS3;
 Wed, 13 Oct 2021 16:44:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TpKPfGchi9lR; Wed, 13 Oct 2021 16:44:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HTwK45NbRz9sS0;
 Wed, 13 Oct 2021 16:44:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2C028B786;
 Wed, 13 Oct 2021 16:44:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EnVTRYWogTQZ; Wed, 13 Oct 2021 16:44:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 818138B763;
 Wed, 13 Oct 2021 16:44:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19DEhwZg2125395
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 16:43:58 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19DEhw8q2125394;
 Wed, 13 Oct 2021 16:43:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Mark .opd section read-only
Date: Wed, 13 Oct 2021 16:43:54 +0200
Message-Id: <3cd40b682fb6f75bb40947b55ca0bac20cb3f995.1634136222.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634136233; l=1235; s=20211009;
 h=from:subject:message-id; bh=lpaC6Oi5RiGO/pS0hBKg1xO31nCFLyBbA6zQNLxTo/Y=;
 b=0J8NsJzOJ6is94Yh3RvTBReeZ+Y5seuf/gHQnsqrhpHtHzIGk/GIXipWo+MpOXe216JuUMF64FNH
 cQffp7I+C27voKsh2wKovwoHlQ2ewpK5EPp+y6k0fjXrRn9cnuQU
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

.opd section contains function descriptors used to locate
functions in the kernel. If someone is able to modify a
function descriptor he will be able to run arbitrary
kernel function instead of another.

To avoid that, move .opd section inside read-only memory.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vmlinux.lds.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 40bdefe9caa7..18e42c74abdd 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -143,6 +143,12 @@ SECTIONS
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
+	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
+		__start_opd = .;
+		KEEP(*(.opd))
+		__end_opd = .;
+	}
+
 	. = ALIGN(8);
 	__stf_entry_barrier_fixup : AT(ADDR(__stf_entry_barrier_fixup) - LOAD_OFFSET) {
 		__start___stf_entry_barrier_fixup = .;
@@ -339,12 +345,6 @@ SECTIONS
 		*(.branch_lt)
 	}
 
-	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
-		__start_opd = .;
-		KEEP(*(.opd))
-		__end_opd = .;
-	}
-
 	. = ALIGN(256);
 	.got : AT(ADDR(.got) - LOAD_OFFSET) {
 		__toc_start = .;
-- 
2.31.1

