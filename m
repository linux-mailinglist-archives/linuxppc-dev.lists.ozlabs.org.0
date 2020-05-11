Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185B1CD8DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 13:50:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LK4B6BzBzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 21:50:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJX45B8bzDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:25:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJWr0X5Xz9ty3p;
 Mon, 11 May 2020 13:25:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6IzsmW3rgw_U; Mon, 11 May 2020 13:25:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJWq6smjz9ty3g;
 Mon, 11 May 2020 13:25:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4BCA8B7B1;
 Mon, 11 May 2020 13:25:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q-UWe4hNu2U6; Mon, 11 May 2020 13:25:34 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 602518B7AD;
 Mon, 11 May 2020 13:25:34 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EF19865A09; Mon, 11 May 2020 11:25:33 +0000 (UTC)
Message-Id: <55e07412794112aadb3f4b91027bfd17e1aa1421.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 08/45] powerpc/ptdump: Reorder flags
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:25:33 +0000 (UTC)
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

Reorder flags in a more logical way:
- Page size (huge) first
- User
- RWX
- Present
- WIMG
- Special
- Dirty and Accessed

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/8xx.c    | 30 +++++++++++++++---------------
 arch/powerpc/mm/ptdump/shared.c | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index ca9ce94672f5..a3169677dced 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -11,11 +11,6 @@
 
 static const struct flag_info flag_array[] = {
 	{
-		.mask	= _PAGE_SH,
-		.val	= _PAGE_SH,
-		.set	= "sh",
-		.clear	= "  ",
-	}, {
 		.mask	= _PAGE_RO | _PAGE_NA,
 		.val	= 0,
 		.set	= "rw",
@@ -37,11 +32,26 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_PRESENT,
 		.set	= "p",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_NO_CACHE,
+		.val	= _PAGE_NO_CACHE,
+		.set	= "i",
+		.clear	= " ",
 	}, {
 		.mask	= _PAGE_GUARDED,
 		.val	= _PAGE_GUARDED,
 		.set	= "g",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_SH,
+		.val	= _PAGE_SH,
+		.set	= "sh",
+		.clear	= "  ",
+	}, {
+		.mask	= _PAGE_SPECIAL,
+		.val	= _PAGE_SPECIAL,
+		.set	= "s",
+		.clear	= " ",
 	}, {
 		.mask	= _PAGE_DIRTY,
 		.val	= _PAGE_DIRTY,
@@ -52,16 +62,6 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_ACCESSED,
 		.set	= "a",
 		.clear	= " ",
-	}, {
-		.mask	= _PAGE_NO_CACHE,
-		.val	= _PAGE_NO_CACHE,
-		.set	= "i",
-		.clear	= " ",
-	}, {
-		.mask	= _PAGE_SPECIAL,
-		.val	= _PAGE_SPECIAL,
-		.set	= "s",
-		.clear	= " ",
 	}
 };
 
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index 44a8a64a664f..dab5d8028a9b 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -30,21 +30,6 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_PRESENT,
 		.set	= "p",
 		.clear	= " ",
-	}, {
-		.mask	= _PAGE_GUARDED,
-		.val	= _PAGE_GUARDED,
-		.set	= "g",
-		.clear	= " ",
-	}, {
-		.mask	= _PAGE_DIRTY,
-		.val	= _PAGE_DIRTY,
-		.set	= "d",
-		.clear	= " ",
-	}, {
-		.mask	= _PAGE_ACCESSED,
-		.val	= _PAGE_ACCESSED,
-		.set	= "a",
-		.clear	= " ",
 	}, {
 		.mask	= _PAGE_WRITETHRU,
 		.val	= _PAGE_WRITETHRU,
@@ -55,11 +40,26 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_NO_CACHE,
 		.set	= "i",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_GUARDED,
+		.val	= _PAGE_GUARDED,
+		.set	= "g",
+		.clear	= " ",
 	}, {
 		.mask	= _PAGE_SPECIAL,
 		.val	= _PAGE_SPECIAL,
 		.set	= "s",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_DIRTY,
+		.val	= _PAGE_DIRTY,
+		.set	= "d",
+		.clear	= " ",
+	}, {
+		.mask	= _PAGE_ACCESSED,
+		.val	= _PAGE_ACCESSED,
+		.set	= "a",
+		.clear	= " ",
 	}
 };
 
-- 
2.25.0

