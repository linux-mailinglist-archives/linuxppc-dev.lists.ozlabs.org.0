Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C0186CBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:59:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gybd4YmkzDqFv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=B/PhvFjR; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlG0p3xzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwl615Gbz9v02h;
 Mon, 16 Mar 2020 13:36:02 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=B/PhvFjR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 48D5OFzLj0p6; Mon, 16 Mar 2020 13:36:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwl602rkz9v02f;
 Mon, 16 Mar 2020 13:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362162; bh=ICMxCBMNGcTfz0cst3VWC9Qy4LnOx0ZwiA0OhAg96c8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=B/PhvFjRA2bt7iIWvGy0579aw2F8jGDilok+ZGqJxG2UjMCjs0wC3YZBwEFJl2PM+
 PIVhaheQfSnzfCVKK//Ew970wImOkdN+EMFeC/kZ09gpLvEcSF92KKAS5VaJoTcemj
 g5JWsspmKirAXXoVsGEuCUCPKJ42jHiym/CM6WhI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F210A8B7D2;
 Mon, 16 Mar 2020 13:36:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NJWxDvuUzYcX; Mon, 16 Mar 2020 13:36:06 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A61CF8B7CB;
 Mon, 16 Mar 2020 13:36:06 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9C2C365595; Mon, 16 Mar 2020 12:36:06 +0000 (UTC)
Message-Id: <8b0e2f8614261e6565f8345341a563aa3f99c270.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 21/46] powerpc/mm: Standardise
 __ptep_test_and_clear_young() params between PPC32 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:06 +0000 (UTC)
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

On PPC32, __ptep_test_and_clear_young() takes the mm->context.id

In preparation of standardising pte_update() params between PPC32 and
PPC64, __ptep_test_and_clear_young() need mm instead of mm->context.id

Replace context param by mm.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 7 ++++---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index d1108d25e2e5..8122f0b55d21 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -288,18 +288,19 @@ static inline pte_basic_t pte_update(pte_t *p, unsigned long clr, unsigned long
  * for our hash-based implementation, we fix that up here.
  */
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
-static inline int __ptep_test_and_clear_young(unsigned int context, unsigned long addr, pte_t *ptep)
+static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
+					      unsigned long addr, pte_t *ptep)
 {
 	unsigned long old;
 	old = pte_update(ptep, _PAGE_ACCESSED, 0);
 	if (old & _PAGE_HASHPTE) {
 		unsigned long ptephys = __pa(ptep) & PAGE_MASK;
-		flush_hash_pages(context, addr, ptephys, 1);
+		flush_hash_pages(mm->context.id, addr, ptephys, 1);
 	}
 	return (old & _PAGE_ACCESSED) != 0;
 }
 #define ptep_test_and_clear_young(__vma, __addr, __ptep) \
-	__ptep_test_and_clear_young((__vma)->vm_mm->context.id, __addr, __ptep)
+	__ptep_test_and_clear_young((__vma)->vm_mm, __addr, __ptep)
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 9eaf386a747b..ddf681ceb860 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -256,14 +256,15 @@ static inline pte_basic_t pte_update(pte_t *p, unsigned long clr, unsigned long
 }
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
-static inline int __ptep_test_and_clear_young(unsigned int context, unsigned long addr, pte_t *ptep)
+static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
+					      unsigned long addr, pte_t *ptep)
 {
 	unsigned long old;
 	old = pte_update(ptep, _PAGE_ACCESSED, 0);
 	return (old & _PAGE_ACCESSED) != 0;
 }
 #define ptep_test_and_clear_young(__vma, __addr, __ptep) \
-	__ptep_test_and_clear_young((__vma)->vm_mm->context.id, __addr, __ptep)
+	__ptep_test_and_clear_young((__vma)->vm_mm, __addr, __ptep)
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
-- 
2.25.0

