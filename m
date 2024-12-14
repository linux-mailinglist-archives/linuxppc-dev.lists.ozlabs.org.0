Return-Path: <linuxppc-dev+bounces-4127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED389F1E37
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 12:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9Nlt3F4kz2yK7;
	Sat, 14 Dec 2024 22:10:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734174618;
	cv=none; b=cl8JHAldKai1k9J3z66KOrD4DjUoDgGE3gu/ocJraLz//zrTK8ntmmcO32g0n2TkRZT4GkX5cSy4+PNV6nwlafIjwLL8Gh+bdeEVA+GPwRsIx4KaWrb3h1NAJ4DjKIEiM3gCCzezkPNiMqt5otiPWE/bGZo6fh4JpIStg1YwRmyjWa5h16qExtSsuJoUXtYtT8Daj8KFrCiFN4PDmy2OVBfjOvjAg3BDo2/4ou9g9dZdhgkzCfCfa7gV4xVO5xV4tbsyhEtlhGpuk664qQtxmjX+jQPsuwh4ZIx7koxyATWCyMreIGW+cYrtqRHs/ac5YP5RerXISuk5ePSY7ST4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734174618; c=relaxed/relaxed;
	bh=0758VdvCEtSaTy9z2aOmKZESxROS26uc39g9ksKRfSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G96NB6w+SH/A3AJJMZfLRyTGS81oiFLBzLLJ2ekW3LNl1xzDWm4TrkES+jFSs0g5UCY+KpkPlc5h4HYXz+4WonmIrxO3KfW6YZ5cnwY/xt+uegS3FqXlMPVyWAkIJa2ZNXHcJHuvczeO/dY/03npn/keXY2+uyB7ut9EmW0JIszRqHca/wlS6Xz4/2OxDFaiPmZQjTesin2BxKSYGu3d8Wxv/7k/Ojkp80Y0x1Q6Y6YbL5Pm5hew9SYBptldcQZHz+BxHq75fUI5YR2svOmgP/L8/zZgP8U/3WBB1eEDGhgAEhooXL/AmbIGovCRhed7RJa1JOxG9x2hWlGqOHv5bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9Nlr4vtPz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 22:10:15 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y9Nlk4CDZz9str;
	Sat, 14 Dec 2024 12:10:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPm7RNNVorGo; Sat, 14 Dec 2024 12:10:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y9Nlk3PCxz9stm;
	Sat, 14 Dec 2024 12:10:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 602158B764;
	Sat, 14 Dec 2024 12:10:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ORiar0U6Uyif; Sat, 14 Dec 2024 12:10:10 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F33D58B763;
	Sat, 14 Dec 2024 12:10:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: Mark the vDSO code read-only after init
Date: Sat, 14 Dec 2024 12:09:31 +0100
Message-ID: <e9892d288b646cbdfeef0b2b73edbaf6d3c6cabe.1734174500.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734174572; l=1376; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Id6VnkfkemUObNZrJoyLbuxhi3EqAsU20mkXAySK750=; b=BkUWT8O9VnSeJAtYPHRuUCKVQNbICBP9Qw5Ri8RHqimnXtai2Qj6qHyFuNzZ+iGMHDfNHnziB 3d2nMQnnn4WCUXQhT1vkDT0vPhW1vFPQhNF3QEARosbKaKsRDvOebKz
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

VDSO text is fixed-up during init so it can't be const,
but it can be read-only after init.

Do the same as x86 in commit 018ef8dcf3de ("x86/vdso: Mark the vDSO
code read-only after init") and arm in commit 11bf9b865898 ("ARM/vdso:
Mark the vDSO code read-only after init"), move it into
ro_after_init section.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso32_wrapper.S | 2 +-
 arch/powerpc/kernel/vdso64_wrapper.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32_wrapper.S b/arch/powerpc/kernel/vdso32_wrapper.S
index 10f92f265d51..20bca3548b44 100644
--- a/arch/powerpc/kernel/vdso32_wrapper.S
+++ b/arch/powerpc/kernel/vdso32_wrapper.S
@@ -2,7 +2,7 @@
 #include <linux/linkage.h>
 #include <asm/page.h>
 
-	__PAGE_ALIGNED_DATA
+	.section ".data..ro_after_init", "aw"
 
 	.globl vdso32_start, vdso32_end
 	.balign PAGE_SIZE
diff --git a/arch/powerpc/kernel/vdso64_wrapper.S b/arch/powerpc/kernel/vdso64_wrapper.S
index 839d1a61411d..1912936fa227 100644
--- a/arch/powerpc/kernel/vdso64_wrapper.S
+++ b/arch/powerpc/kernel/vdso64_wrapper.S
@@ -2,7 +2,7 @@
 #include <linux/linkage.h>
 #include <asm/page.h>
 
-	__PAGE_ALIGNED_DATA
+	.section ".data..ro_after_init", "aw"
 
 	.globl vdso64_start, vdso64_end
 	.balign PAGE_SIZE
-- 
2.47.0


