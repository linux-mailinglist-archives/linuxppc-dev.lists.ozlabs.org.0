Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 940911CD8BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 13:45:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LJyZ6cNKzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 21:45:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJX50PFWzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:25:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJWs66KRz9ty3s;
 Mon, 11 May 2020 13:25:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SHhRSs8UalBx; Mon, 11 May 2020 13:25:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJWs58RQz9ty3g;
 Mon, 11 May 2020 13:25:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6252B8B7B1;
 Mon, 11 May 2020 13:25:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FAKEqwHH8dui; Mon, 11 May 2020 13:25:36 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2675A8B7AD;
 Mon, 11 May 2020 13:25:36 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0B79065A0A; Mon, 11 May 2020 11:25:36 +0000 (UTC)
Message-Id: <4fc349f2cfe5910965e4ef198c6d4e5106455069.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 10/45] powerpc/ptdump: Display size of BATs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:25:36 +0000 (UTC)
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

Display the size of areas mapped with BATs.

For that, the size display for pages is refactorised.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Add missing include of linux/seq_file.h (Thanks to kbuild test robot)
---
 arch/powerpc/mm/ptdump/bats.c   |  4 ++++
 arch/powerpc/mm/ptdump/ptdump.c | 23 ++++++++++++++---------
 arch/powerpc/mm/ptdump/ptdump.h |  3 +++
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index d3a5d6b318d1..d6c660f63d71 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -10,6 +10,8 @@
 #include <asm/pgtable.h>
 #include <asm/cpu_has_feature.h>
 
+#include "ptdump.h"
+
 static char *pp_601(int k, int pp)
 {
 	if (pp == 0)
@@ -42,6 +44,7 @@ static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
 #else
 	seq_printf(m, "0x%08x ", pbn);
 #endif
+	pt_dump_size(m, size);
 
 	seq_printf(m, "Kernel %s User %s", pp_601(k & 2, pp), pp_601(k & 1, pp));
 
@@ -88,6 +91,7 @@ static void bat_show_603(struct seq_file *m, int idx, u32 lower, u32 upper, bool
 #else
 	seq_printf(m, "0x%08x ", brpn);
 #endif
+	pt_dump_size(m, size);
 
 	if (k == 1)
 		seq_puts(m, "User ");
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index d92bb8ea229c..1f97668853e3 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -112,6 +112,19 @@ static struct addr_marker address_markers[] = {
 		seq_putc(m, c);		\
 })
 
+void pt_dump_size(struct seq_file *m, unsigned long size)
+{
+	static const char units[] = "KMGTPE";
+	const char *unit = units;
+
+	/* Work out what appropriate unit to use */
+	while (!(size & 1023) && unit[1]) {
+		size >>= 10;
+		unit++;
+	}
+	pt_dump_seq_printf(m, "%9lu%c ", size, *unit);
+}
+
 static void dump_flag_info(struct pg_state *st, const struct flag_info
 		*flag, u64 pte, int num)
 {
@@ -146,8 +159,6 @@ static void dump_flag_info(struct pg_state *st, const struct flag_info
 
 static void dump_addr(struct pg_state *st, unsigned long addr)
 {
-	static const char units[] = "KMGTPE";
-	const char *unit = units;
 	unsigned long delta;
 
 #ifdef CONFIG_PPC64
@@ -164,13 +175,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 		pt_dump_seq_printf(st->seq, " " REG " ", st->start_pa);
 		delta = (addr - st->start_address) >> 10;
 	}
-	/* Work out what appropriate unit to use */
-	while (!(delta & 1023) && unit[1]) {
-		delta >>= 10;
-		unit++;
-	}
-	pt_dump_seq_printf(st->seq, "%9lu%c", delta, *unit);
-
+	pt_dump_size(st->seq, delta);
 }
 
 static void note_prot_wx(struct pg_state *st, unsigned long addr)
diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
index 5d513636de73..154efae96ae0 100644
--- a/arch/powerpc/mm/ptdump/ptdump.h
+++ b/arch/powerpc/mm/ptdump/ptdump.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/types.h>
+#include <linux/seq_file.h>
 
 struct flag_info {
 	u64		mask;
@@ -17,3 +18,5 @@ struct pgtable_level {
 };
 
 extern struct pgtable_level pg_level[5];
+
+void pt_dump_size(struct seq_file *m, unsigned long delta);
-- 
2.25.0

