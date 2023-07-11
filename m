Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858574F496
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mBc20qhz3dSc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:13:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m681DFSz3dFw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5L03j7z9sFH;
	Tue, 11 Jul 2023 18:08:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfltmwUXtH7X; Tue, 11 Jul 2023 18:08:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C4h3Tz9sFJ;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BC088B779;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oN3pvi3YSFD8; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F34D88B788;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8kR93696844
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:46 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8kID3696843;
	Tue, 11 Jul 2023 18:08:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 11/15] objtool: .rodata.cst{2/4/8/16} are not switch tables
Date: Tue, 11 Jul 2023 18:08:37 +0200
Message-ID: <7814504bb8c4fc2b5dc46149c2167f561b956746.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091706; l=775; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OuAD6RJc3n0xvnCE44eeiwBgvi8Xhb1MYfpIDC+MCDM=; b=gejtu8ZMg6nDOkYPW5EqIIJ59BOFP4bNtGkmKefOadu48FHfcxkoZttn1Ho+Qm+deuvU79QJT IbkUhwO5CmLAvQ8pNmFQdg6oeE+ajnycS24KWn2OlQILljRSJrMllnf
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

Exclude sections named
  .rodata.cst2
  .rodata.cst4
  .rodata.cst8
  .rodata.cst16
as they won't contain switch tables.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index ea0945f2195f..d2a0dfec5909 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2565,7 +2565,8 @@ static void mark_rodata(struct objtool_file *file)
 	 */
 	for_each_sec(file, sec) {
 		if (!strncmp(sec->name, ".rodata", 7) &&
-		    !strstr(sec->name, ".str1.")) {
+		    !strstr(sec->name, ".str1.") &&
+		    !strstr(sec->name, ".cst")) {
 			sec->rodata = true;
 			found = true;
 		}
-- 
2.41.0

