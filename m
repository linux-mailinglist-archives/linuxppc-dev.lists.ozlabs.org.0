Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7EB92E50D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 12:49:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKWgz5640z3dBX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 20:49:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKWgb4PG1z30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 20:49:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WKWgR6DKKz9sSd;
	Thu, 11 Jul 2024 12:49:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RqFO7Mhyqy7; Thu, 11 Jul 2024 12:49:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WKWgR5VXDz9sSV;
	Thu, 11 Jul 2024 12:49:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AEB5C8B778;
	Thu, 11 Jul 2024 12:49:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fChFF1nWQOWT; Thu, 11 Jul 2024 12:49:07 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.107])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 480138B764;
	Thu, 11 Jul 2024 12:49:07 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Remove 40x leftovers
Date: Thu, 11 Jul 2024 12:49:01 +0200
Message-ID: <ab30ae302783d8617d407864b92db1b926ab5ab9.1720694914.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720694942; l=1243; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=34zE3+s18qxDmJ/g6Sn4JXCB/W17u3pBk+nhOORmuxw=; b=Qf3m+E0r0EGY3uzEtzcwi8SiBmKgleoMjAp6HDSuD2TpYSHYw25CR2atNoFUOFg4lT+JtRkrM s698EtKtPb/B34tw5FD0kXoR3v7c4E7tSTLHYLeZCcq5ezBxDL19Yg5
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes: e939da89d024 ("powerpc: Remove 40x from Kconfig and defconfig")
Fixes: 548f5244f106 ("powerpc/40x: Remove EP405")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/boot/wrapper              | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 585c4ea27ab9..b1f5549a3c9c 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -337,7 +337,7 @@ ps3)
     make_space=n
     pie=
     ;;
-ep88xc|ep405|ep8248e)
+ep88xc|ep8248e)
     platformo="$object/fixed-head.o $object/$platform.o"
     binary=y
     ;;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 1ec98688c915..4b0d7d4f88f6 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -250,7 +250,6 @@ config TARGET_CPU
 	default "e6500" if E6500_CPU
 	default "power4" if POWERPC64_CPU && !CPU_LITTLE_ENDIAN
 	default "power8" if POWERPC64_CPU && CPU_LITTLE_ENDIAN
-	default "405" if 405_CPU
 	default "440" if 440_CPU
 	default "464" if 464_CPU
 	default "476" if 476_CPU
-- 
2.44.0

