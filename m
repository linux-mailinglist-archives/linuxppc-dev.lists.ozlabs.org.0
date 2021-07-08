Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 192833C1769
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 18:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLMjy0Pbgz3cj0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 02:50:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLMj06Q0mz3bW6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 02:49:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GLMhk62lJzBF3P;
 Thu,  8 Jul 2021 18:49:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bmw1aYb6biQj; Thu,  8 Jul 2021 18:49:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GLMhk57TRzBF3J;
 Thu,  8 Jul 2021 18:49:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A37788B801;
 Thu,  8 Jul 2021 18:49:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f6n3LzTP5Unu; Thu,  8 Jul 2021 18:49:42 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6307E8B7E3;
 Thu,  8 Jul 2021 18:49:42 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 42D686640E; Thu,  8 Jul 2021 16:49:42 +0000 (UTC)
Message-Id: <d76495c574132b197b445a1f133755cca4b912a4.1625762906.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
References: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 3/4] powerpc/ptdump: Reduce level numbers by 1 in
 note_page() and add p4d level
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Jul 2021 16:49:42 +0000 (UTC)
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

Do the same as commit f8f0d0b6fa20 ("mm: ptdump: reduce level numbers
by 1 in note_page()") and add missing p4d level.

This will align powerpc to the users of generic ptdump.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/8xx.c      |  6 ++++--
 arch/powerpc/mm/ptdump/book3s64.c |  6 ++++--
 arch/powerpc/mm/ptdump/ptdump.c   | 17 +++++++++--------
 arch/powerpc/mm/ptdump/shared.c   |  6 ++++--
 4 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index 86da2a669680..fac932eb8f9a 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -75,8 +75,10 @@ static const struct flag_info flag_array[] = {
 };
 
 struct pgtable_level pg_level[5] = {
-	{
-	}, { /* pgd */
+	{ /* pgd */
+		.flag	= flag_array,
+		.num	= ARRAY_SIZE(flag_array),
+	}, { /* p4d */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pud */
diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
index 14f73868db66..5ad92d9dc5d1 100644
--- a/arch/powerpc/mm/ptdump/book3s64.c
+++ b/arch/powerpc/mm/ptdump/book3s64.c
@@ -103,8 +103,10 @@ static const struct flag_info flag_array[] = {
 };
 
 struct pgtable_level pg_level[5] = {
-	{
-	}, { /* pgd */
+	{ /* pgd */
+		.flag	= flag_array,
+		.num	= ARRAY_SIZE(flag_array),
+	}, { /* p4d */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pud */
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 3eb8732641da..fb531bc64fc5 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -58,7 +58,7 @@ struct pg_state {
 	const struct addr_marker *marker;
 	unsigned long start_address;
 	unsigned long start_pa;
-	unsigned int level;
+	int level;
 	u64 current_flags;
 	bool check_wx;
 	unsigned long wx_pages;
@@ -188,10 +188,9 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
 }
 
-static void note_page_update_state(struct pg_state *st, unsigned long addr,
-				   unsigned int level, u64 val)
+static void note_page_update_state(struct pg_state *st, unsigned long addr, int level, u64 val)
 {
-	u64 flag = val & pg_level[level].mask;
+	u64 flag = level >= 0 ? val & pg_level[level].mask : 0;
 	u64 pa = val & PTE_RPN_MASK;
 
 	st->level = level;
@@ -206,12 +205,12 @@ static void note_page_update_state(struct pg_state *st, unsigned long addr,
 }
 
 static void note_page(struct pg_state *st, unsigned long addr,
-	       unsigned int level, u64 val, unsigned long page_size)
+		      int level, u64 val, unsigned long page_size)
 {
-	u64 flag = val & pg_level[level].mask;
+	u64 flag = level >= 0 ? val & pg_level[level].mask : 0;
 
 	/* At first no level is set */
-	if (!st->level) {
+	if (st->level == -1) {
 		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 		note_page_update_state(st, addr, level, val);
 	/*
@@ -383,6 +382,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 	struct pg_state st = {
 		.seq = m,
 		.marker = address_markers,
+		.level = -1,
 		.start_address = IS_ENABLED(CONFIG_PPC64) ? PAGE_OFFSET : TASK_SIZE,
 	};
 
@@ -393,7 +393,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 
 	/* Traverse kernel page tables */
 	walk_pagetables(&st);
-	note_page(&st, 0, 0, 0, 0);
+	note_page(&st, 0, -1, 0, 0);
 	return 0;
 }
 
@@ -415,6 +415,7 @@ void ptdump_check_wx(void)
 	struct pg_state st = {
 		.seq = NULL,
 		.marker = address_markers,
+		.level = -1,
 		.check_wx = true,
 		.start_address = IS_ENABLED(CONFIG_PPC64) ? PAGE_OFFSET : TASK_SIZE,
 	};
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index c005fe041c18..03607ab90c66 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -68,8 +68,10 @@ static const struct flag_info flag_array[] = {
 };
 
 struct pgtable_level pg_level[5] = {
-	{
-	}, { /* pgd */
+	{ /* pgd */
+		.flag	= flag_array,
+		.num	= ARRAY_SIZE(flag_array),
+	}, { /* p4d */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pud */
-- 
2.25.0

