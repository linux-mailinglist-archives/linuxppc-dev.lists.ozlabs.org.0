Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DF54AE73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 12:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMlF33Hhjz3dvv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 20:35:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMlDf1XRSz3059
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 20:34:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LMlDZ55Ysz9tNV;
	Tue, 14 Jun 2022 12:34:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmOK5EWRTWTv; Tue, 14 Jun 2022 12:34:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LMlDZ3y1Vz9tNR;
	Tue, 14 Jun 2022 12:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 704C68B766;
	Tue, 14 Jun 2022 12:34:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id viGlSsPwX9aF; Tue, 14 Jun 2022 12:34:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 21BB38B763;
	Tue, 14 Jun 2022 12:34:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25EAYR2H198169
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 12:34:27 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25EAYLaA198135;
	Tue, 14 Jun 2022 12:34:21 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/32: Call mmu_mark_initmem_nx() regardless of data block mapping.
Date: Tue, 14 Jun 2022 12:34:08 +0200
Message-Id: <db3fc14f3bfa6215b0786ef58a6e2bc1e1f964d7.1655202804.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655202848; l=2629; s=20211009; h=from:subject:message-id; bh=CWIqUkDIpE0cTlWDObjuQQ9rCQCZ66wP1qn7E4f2HIU=; b=o4yZQIyM+TiCgO+EiPa4v7u+AtxpOfdZOftncIiUapJHJkXdLISDQwKbkXI/1PVyRODuQWUXGIa/ YGeActtVAtZWj4SFPH5la/D66PoFg8FRYbCsWKVxxDFrIWEdmiM6
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
Cc: Maxime Bizon <mbizon@freebox.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mark_initmem_nx() calls either mmu_mark_initmem_nx() or
set_memory_attr() based on return from v_block_mapped()
of _sinittext.

But we can now handle text and data independently, so that
text may be mapped by block even when data is mapped by pages.

On the 8xx for instance, at startup 32Mbytes of memory are
pinned in TLB. So the pinned entries need to go away for sinittext.

In next patch a BAT will be set to also covers sinittext on book3s/32.
So it will also be needed to call mmu_mark_initmem_nx() even when
data above sinittext is not mapped with BATs.

As this is highly dependent on the platform, call mmu_mark_initmem_nx()
regardless of data block mapping. Then the platform will know what to
do.

Modify 8xx mmu_mark_initmem_nx() so that inittext mapping is modified
only when pagealloc debug and kfence are not active, otherwise inittext
is mapped with standard pages. And don't do anything on kernel text
which is already mapped with PAGE_KERNEL_TEXT.

Cc: Maxime Bizon <mbizon@freebox.fr>
Fixes: da1adea07576 ("powerpc/8xx: Allow STRICT_KERNEL_RwX with pinned TLB")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/8xx.c | 4 ++--
 arch/powerpc/mm/pgtable_32.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 27f9186ae374..1ee08c3efe5b 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -179,8 +179,8 @@ void mmu_mark_initmem_nx(void)
 	unsigned long boundary = strict_kernel_rwx_enabled() ? sinittext : etext8;
 	unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
 
-	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, false);
-	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
+	if (!debug_pagealloc_enabled_or_kfence())
+		mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
 
 	mmu_pin_tlb(block_mapped_ram, false);
 }
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index a56ade39dc68..3ac73f9fb5d5 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -135,9 +135,9 @@ void mark_initmem_nx(void)
 	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
 				 PFN_DOWN((unsigned long)_sinittext);
 
-	if (v_block_mapped((unsigned long)_sinittext)) {
-		mmu_mark_initmem_nx();
-	} else {
+	mmu_mark_initmem_nx();
+
+	if (!v_block_mapped((unsigned long)_sinittext)) {
 		set_memory_nx((unsigned long)_sinittext, numpages);
 		set_memory_rw((unsigned long)_sinittext, numpages);
 	}
-- 
2.36.1

