Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4681C77B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 19:20:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HNdw6rkSzDqZx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 03:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMwj3s0YzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMwb0z8Xz9v4kJ;
 Wed,  6 May 2020 18:48:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0ripaQKRQceS; Wed,  6 May 2020 18:48:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMwb0Cnhz9v4kF;
 Wed,  6 May 2020 18:48:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D56F88B7C5;
 Wed,  6 May 2020 18:48:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id flrb3IfwgV-6; Wed,  6 May 2020 18:48:16 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FCA48B7C3;
 Wed,  6 May 2020 18:48:16 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 4FCD965911; Wed,  6 May 2020 16:48:16 +0000 (UTC)
Message-Id: <a2e03189c968f8eaa833dd96f04d572e0d6c8b1a.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 11/45] powerpc/ptdump: Standardise display of BAT flags
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:16 +0000 (UTC)
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

Display BAT flags the same way as page flags: rwx and wimg

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/bats.c | 37 ++++++++++++++---------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index d6c660f63d71..cebb58c7e289 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -15,12 +15,12 @@
 static char *pp_601(int k, int pp)
 {
 	if (pp == 0)
-		return k ? "NA" : "RWX";
+		return k ? "   " : "rwx";
 	if (pp == 1)
-		return k ? "ROX" : "RWX";
+		return k ? "r x" : "rwx";
 	if (pp == 2)
-		return k ? "RWX" : "RWX";
-	return k ? "ROX" : "ROX";
+		return "rwx";
+	return "r x";
 }
 
 static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
@@ -48,12 +48,9 @@ static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
 
 	seq_printf(m, "Kernel %s User %s", pp_601(k & 2, pp), pp_601(k & 1, pp));
 
-	if (lower & _PAGE_WRITETHRU)
-		seq_puts(m, "write through ");
-	if (lower & _PAGE_NO_CACHE)
-		seq_puts(m, "no cache ");
-	if (lower & _PAGE_COHERENT)
-		seq_puts(m, "coherent ");
+	seq_puts(m, lower & _PAGE_WRITETHRU ? "w " : "  ");
+	seq_puts(m, lower & _PAGE_NO_CACHE ? "i " : "  ");
+	seq_puts(m, lower & _PAGE_COHERENT ? "m " : "  ");
 	seq_puts(m, "\n");
 }
 
@@ -101,20 +98,16 @@ static void bat_show_603(struct seq_file *m, int idx, u32 lower, u32 upper, bool
 		seq_puts(m, "Kernel/User ");
 
 	if (lower & BPP_RX)
-		seq_puts(m, is_d ? "RO " : "EXEC ");
+		seq_puts(m, is_d ? "r   " : "  x ");
 	else if (lower & BPP_RW)
-		seq_puts(m, is_d ? "RW " : "EXEC ");
+		seq_puts(m, is_d ? "rw  " : "  x ");
 	else
-		seq_puts(m, is_d ? "NA " : "NX   ");
-
-	if (lower & _PAGE_WRITETHRU)
-		seq_puts(m, "write through ");
-	if (lower & _PAGE_NO_CACHE)
-		seq_puts(m, "no cache ");
-	if (lower & _PAGE_COHERENT)
-		seq_puts(m, "coherent ");
-	if (lower & _PAGE_GUARDED)
-		seq_puts(m, "guarded ");
+		seq_puts(m, is_d ? "    " : "    ");
+
+	seq_puts(m, lower & _PAGE_WRITETHRU ? "w " : "  ");
+	seq_puts(m, lower & _PAGE_NO_CACHE ? "i " : "  ");
+	seq_puts(m, lower & _PAGE_COHERENT ? "m " : "  ");
+	seq_puts(m, lower & _PAGE_GUARDED ? "g " : "  ");
 	seq_puts(m, "\n");
 }
 
-- 
2.25.0

