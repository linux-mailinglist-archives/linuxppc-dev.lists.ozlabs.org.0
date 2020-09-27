Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE527A06C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 12:05:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzh9C17BWzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 20:05:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg5G4Gc7zDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg571RFvz9vCyF;
 Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Mf8CywmqNvaK; Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg570hcNz9vCxw;
 Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FBF78B771;
 Sun, 27 Sep 2020 11:16:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pDHqG16cN43H; Sun, 27 Sep 2020 11:16:47 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31BCA8B75B;
 Sun, 27 Sep 2020 11:16:47 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1492865DE8; Sun, 27 Sep 2020 09:16:47 +0000 (UTC)
Message-Id: <6c4d6570d886bbe1cc471e8ca01602e4b4d9beb5.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 29/30] powerpc/vdso: Remove VDSO32_LBASE and VDSO64_LBASE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:47 +0000 (UTC)
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

VDSO32_LBASE and VDSO64_LBASE are 0. Remove them to simplify code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso.h         | 4 ----
 arch/powerpc/kernel/vdso32/vdso32.lds.S | 2 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index a97384909fe5..2448419cb3e5 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -4,10 +4,6 @@
 
 #ifdef __KERNEL__
 
-/* Default link addresses for the vDSOs */
-#define VDSO32_LBASE	0x0
-#define VDSO64_LBASE	0x0
-
 /* Default map addresses for 32bit vDSO */
 #define VDSO32_MBASE	0x100000
 
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 7b476a6f2dba..2636b359c9ce 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -17,7 +17,7 @@ ENTRY(_start)
 SECTIONS
 {
 	PROVIDE(_vdso_datapage = . - PAGE_SIZE);
-	. = VDSO32_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash          	: { *(.hash) }			:text
 	.gnu.hash      	: { *(.gnu.hash) }
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index a543826cd857..f256525e633f 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -17,7 +17,7 @@ ENTRY(_start)
 SECTIONS
 {
 	PROVIDE(_vdso_datapage = . - PAGE_SIZE);
-	. = VDSO64_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }
-- 
2.25.0

