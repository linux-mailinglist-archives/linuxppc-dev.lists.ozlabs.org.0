Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E24E92E512
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 12:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKWjM6lDsz3cZ6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 20:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKWj04RYMz3cW7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 20:50:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WKWhx1TF9z9sSd;
	Thu, 11 Jul 2024 12:50:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0b594mVLDho; Thu, 11 Jul 2024 12:50:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WKWhx0n6Nz9sSV;
	Thu, 11 Jul 2024 12:50:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 097478B778;
	Thu, 11 Jul 2024 12:50:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Xq-Gfk8HJ7XO; Thu, 11 Jul 2024 12:50:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.107])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 83A168B764;
	Thu, 11 Jul 2024 12:50:24 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation/powerpc: Mention 40x is removed
Date: Thu, 11 Jul 2024 12:50:21 +0200
Message-ID: <c2d64bebc514ca892a12e51a68821a6317048d3a.1720694954.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720695022; l=1613; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=j3LRkam5HWHIbp7v5gKW1hLYjKVtdjDe5VGZuKDG4jo=; b=Wq8oiOcpAfRUrVsYCRB5hx2gY5s2R68t8KTD0mC8TZXhf7eg3/5jbxnTvXLZahghqUG4faej2 Gt07yMKtSZSDeQQvbE19Y3iuroPTXViBAibEH/HleUPcnPeugm/3A6Q
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 732b32daef80 ("powerpc: Remove core support for 40x") removed 40x.

Update documentation accordingly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 Documentation/arch/powerpc/cpu_families.rst | 18 ------------------
 Documentation/arch/powerpc/elf_hwcaps.rst   |  1 +
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/arch/powerpc/cpu_families.rst b/Documentation/arch/powerpc/cpu_families.rst
index eb7e60649b43..f55433c6b8f3 100644
--- a/Documentation/arch/powerpc/cpu_families.rst
+++ b/Documentation/arch/powerpc/cpu_families.rst
@@ -128,24 +128,6 @@ IBM BookE
 - All 32 bit::
 
    +--------------+
-   |     401      |
-   +--------------+
-          |
-          |
-          v
-   +--------------+
-   |     403      |
-   +--------------+
-          |
-          |
-          v
-   +--------------+
-   |     405      |
-   +--------------+
-          |
-          |
-          v
-   +--------------+
    |     440      |
    +--------------+
           |
diff --git a/Documentation/arch/powerpc/elf_hwcaps.rst b/Documentation/arch/powerpc/elf_hwcaps.rst
index 4c896cf077c2..fce7489877b5 100644
--- a/Documentation/arch/powerpc/elf_hwcaps.rst
+++ b/Documentation/arch/powerpc/elf_hwcaps.rst
@@ -91,6 +91,7 @@ PPC_FEATURE_HAS_MMU
 
 PPC_FEATURE_HAS_4xxMAC
     The processor is 40x or 44x family.
+    Unused in the kernel since 732b32daef80 ("powerpc: Remove core support for 40x")
 
 PPC_FEATURE_UNIFIED_CACHE
     The processor has a unified L1 cache for instructions and data, as
-- 
2.44.0

