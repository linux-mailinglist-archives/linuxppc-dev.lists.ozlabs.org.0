Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89B2C317F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 20:58:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZZw3MNxzDqJV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:58:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZRR0cR4zDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 06:52:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgZRJ6hJWz9v0DP;
 Tue, 24 Nov 2020 20:51:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NXRSA4NxUpNN; Tue, 24 Nov 2020 20:51:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgZRJ5QHsz9v0DM;
 Tue, 24 Nov 2020 20:51:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9BEC8B7B7;
 Tue, 24 Nov 2020 20:51:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3xv1ibxVlHXJ; Tue, 24 Nov 2020 20:51:56 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7312C8B7AF;
 Tue, 24 Nov 2020 20:51:56 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 504726688D; Tue, 24 Nov 2020 19:51:56 +0000 (UTC)
Message-Id: <3907199974c89b85a3441cf3f528751173b7649c.1606247495.git.christophe.leroy@csgroup.eu>
In-Reply-To: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
References: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/3] powerpc/32s: In add_hash_page(), calculate VSID later
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 24 Nov 2020 19:51:56 +0000 (UTC)
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

VSID is only for create_hpte(). When _PAGE_HASHPTE is
already set, add_hash_page() bails out without calling
create_hpte() and doesn't need the value of VSID.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s32/hash_low.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index f964fd34dad9..1366e8e4fc05 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -188,12 +188,6 @@ _GLOBAL(add_hash_page)
 	mflr	r0
 	stw	r0,4(r1)
 
-	/* Convert context and va to VSID */
-	mulli	r3,r3,897*16		/* multiply context by context skew */
-	rlwinm	r0,r4,4,28,31		/* get ESID (top 4 bits of va) */
-	mulli	r0,r0,0x111		/* multiply by ESID skew */
-	add	r3,r3,r0		/* note create_hpte trims to 24 bits */
-
 #ifdef CONFIG_SMP
 	lwz	r8,TASK_CPU(r2)		/* to go in mmu_hash_lock */
 	oris	r8,r8,12
@@ -257,6 +251,12 @@ _GLOBAL(add_hash_page)
 	stwcx.	r5,0,r8
 	bne-	1b
 
+	/* Convert context and va to VSID */
+	mulli	r3,r3,897*16		/* multiply context by context skew */
+	rlwinm	r0,r4,4,28,31		/* get ESID (top 4 bits of va) */
+	mulli	r0,r0,0x111		/* multiply by ESID skew */
+	add	r3,r3,r0		/* note create_hpte trims to 24 bits */
+
 	bl	create_hpte
 
 9:
-- 
2.25.0

