Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 751687ADF3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX0d32y1z3htg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWj53ZBfz3cRC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgZ4F6Vz9vB3;
	Mon, 25 Sep 2023 20:32:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRgL3VdRgIrP; Mon, 25 Sep 2023 20:32:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg545v4z9vC5;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89CB38B78C;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 60eUuk7TKb54; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C2828B7A0;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVZPS1499223
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:35 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVZLr1499222;
	Mon, 25 Sep 2023 20:31:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 23/37] powerpc: Remove pte_mkuser() and pte_mkpriviledged()
Date: Mon, 25 Sep 2023 20:31:37 +0200
Message-ID: <1a1dc18816456c637dc8a9c38d532f7598b60ac4.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666675; l=4628; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=4IpNSMWmiL1iL/Y9JmoIU6o/p33WZ1XVr0Bhz5VwC0Y=; b=X7cYcxqlP3KYJMcVFH+ofWvZqFRZK0Gbz8saBkTC2Ue30hNG413EUaMYicFomQjLDY8pA0W1N f48GCjwPyrHDr7x58hIHaKx0apGkKnKCmlNb5VK9Bac5XpQ2gnKBmeJ
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

pte_mkuser() is never used. Remove it.

pte_mkpriviledged() is not used anymore. Remove it too.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 10 ----------
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 14 --------------
 arch/powerpc/include/asm/nohash/pgtable.h    | 14 --------------
 arch/powerpc/include/asm/nohash/pte-e500.h   | 15 ---------------
 5 files changed, 63 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 45b69ae2631e..80505915c77c 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -522,16 +522,6 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
-static inline pte_t pte_mkprivileged(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~_PAGE_USER);
-}
-
-static inline pte_t pte_mkuser(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_USER);
-}
-
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dbd545e73161..c3b921769ece 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -630,16 +630,6 @@ static inline pte_t pte_mkdevmap(pte_t pte)
 	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_SPECIAL | _PAGE_DEVMAP));
 }
 
-static inline pte_t pte_mkprivileged(pte_t pte)
-{
-	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PRIVILEGED));
-}
-
-static inline pte_t pte_mkuser(pte_t pte)
-{
-	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_PRIVILEGED));
-}
-
 /*
  * This is potentially called with a pmd as the argument, in which case it's not
  * safe to check _PAGE_DEVMAP unless we also confirm that _PAGE_PTE is set.
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 52395a5ecd70..843fe0138a66 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -122,20 +122,6 @@ static inline bool pte_user(pte_t pte)
 
 #define pte_user pte_user
 
-static inline pte_t pte_mkprivileged(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_SH);
-}
-
-#define pte_mkprivileged pte_mkprivileged
-
-static inline pte_t pte_mkuser(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~_PAGE_SH);
-}
-
-#define pte_mkuser pte_mkuser
-
 static inline pte_t pte_mkhuge(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_SPS | _PAGE_HUGE);
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 1493f0b09ae9..9619beae4454 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -252,20 +252,6 @@ static inline pte_t pte_mkhuge(pte_t pte)
 }
 #endif
 
-#ifndef pte_mkprivileged
-static inline pte_t pte_mkprivileged(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~_PAGE_USER);
-}
-#endif
-
-#ifndef pte_mkuser
-static inline pte_t pte_mkuser(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_USER);
-}
-#endif
-
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 99288e26b6b0..9f9e3f02d414 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -54,7 +54,6 @@
 #define _PAGE_KERNEL_RWX	(_PAGE_BAP_SW | _PAGE_BAP_SR | _PAGE_DIRTY | _PAGE_BAP_SX)
 #define _PAGE_KERNEL_ROX	(_PAGE_BAP_SR | _PAGE_BAP_SX)
 #define _PAGE_USER		(_PAGE_BAP_UR | _PAGE_BAP_SR) /* Can be read */
-#define _PAGE_PRIVILEGED	(_PAGE_BAP_SR)
 
 #define _PAGE_SPECIAL	_PAGE_SW0
 
@@ -99,20 +98,6 @@
 #define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_BAP_UX)
 
 #ifndef __ASSEMBLY__
-static inline pte_t pte_mkprivileged(pte_t pte)
-{
-	return __pte((pte_val(pte) & ~_PAGE_USER) | _PAGE_PRIVILEGED);
-}
-
-#define pte_mkprivileged pte_mkprivileged
-
-static inline pte_t pte_mkuser(pte_t pte)
-{
-	return __pte((pte_val(pte) & ~_PAGE_PRIVILEGED) | _PAGE_USER);
-}
-
-#define pte_mkuser pte_mkuser
-
 static inline pte_t pte_mkexec(pte_t pte)
 {
 	return __pte((pte_val(pte) & ~_PAGE_BAP_SX) | _PAGE_BAP_UX);
-- 
2.41.0

