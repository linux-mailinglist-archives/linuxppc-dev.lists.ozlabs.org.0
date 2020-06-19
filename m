Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A120190E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 19:08:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pQHg4BjszDqnG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 03:08:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pMbR0cDmzDrQQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 01:06:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49pMbH42GRz9v09m;
 Fri, 19 Jun 2020 17:06:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ePyZpffX__Ia; Fri, 19 Jun 2020 17:06:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49pMbH368wz9v09j;
 Fri, 19 Jun 2020 17:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80F4E8B879;
 Fri, 19 Jun 2020 17:06:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Qazh7sgDx-BC; Fri, 19 Jun 2020 17:06:53 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C4088B868;
 Fri, 19 Jun 2020 17:06:53 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 28A7C65AF4; Fri, 19 Jun 2020 15:06:53 +0000 (UTC)
Message-Id: <85e3ee58f3231223d7cd4954d94282bab7c44945.1592578278.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1592578278.git.christophe.leroy@csgroup.eu>
References: <cover.1592578278.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/8] powerpc/ptdump: Refactor update of pg_state
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 19 Jun 2020 15:06:53 +0000 (UTC)
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

In note_page(), the pg_state is updated the same way in two places.

Add note_page_update_state() to do it.

Also include the display of boundary markers there as it is missing
"no level" leg, leading to a mismatch when the first two markers
are at the same address and the first displayed area uses that
address.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/ptdump.c | 34 +++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index d5e42b958e86..b71cc628facd 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -195,6 +195,24 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
 }
 
+static void note_page_update_state(struct pg_state *st, unsigned long addr,
+				   unsigned int level, u64 val, unsigned long page_size)
+{
+	u64 flag = val & pg_level[level].mask;
+	u64 pa = val & PTE_RPN_MASK;
+
+	st->level = level;
+	st->current_flags = flag;
+	st->start_address = addr;
+	st->start_pa = pa;
+	st->page_size = page_size;
+
+	while (addr >= st->marker[1].start_address) {
+		st->marker++;
+		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
+	}
+}
+
 static void note_page(struct pg_state *st, unsigned long addr,
 	       unsigned int level, u64 val, unsigned long page_size)
 {
@@ -203,12 +221,8 @@ static void note_page(struct pg_state *st, unsigned long addr,
 
 	/* At first no level is set */
 	if (!st->level) {
-		st->level = level;
-		st->current_flags = flag;
-		st->start_address = addr;
-		st->start_pa = pa;
-		st->page_size = page_size;
 		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
+		note_page_update_state(st, addr, level, val, page_size);
 	/*
 	 * Dump the section of virtual memory when:
 	 *   - the PTE flags from one entry to the next differs.
@@ -240,15 +254,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		 * Address indicates we have passed the end of the
 		 * current section of virtual memory
 		 */
-		while (addr >= st->marker[1].start_address) {
-			st->marker++;
-			pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
-		}
-		st->start_address = addr;
-		st->start_pa = pa;
-		st->page_size = page_size;
-		st->current_flags = flag;
-		st->level = level;
+		note_page_update_state(st, addr, level, val, page_size);
 	}
 	st->last_pa = pa;
 }
-- 
2.25.0

