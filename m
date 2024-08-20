Return-Path: <linuxppc-dev+bounces-234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFC958D2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGYH29T5z2yF0;
	Wed, 21 Aug 2024 03:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGYH039Zz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:24:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGY62GD2z9sSN;
	Tue, 20 Aug 2024 19:24:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zCLHuRAKaCm; Tue, 20 Aug 2024 19:24:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGY55Xh8z9sSH;
	Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AF5518B763;
	Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vu3ggRc7gXuk; Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 51E698B778;
	Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/14] powerpc/8xx: Fix initial memory mapping
Date: Tue, 20 Aug 2024 19:23:45 +0200
Message-ID: <dac7a828d8497c4548c91840575a706657baa4f1.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724173828.git.christophe.leroy@csgroup.eu>
References: <cover.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174647; l=1398; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=YSS0Z4TGY3GQo2hL9A1Rle4r3NsVDHe7D8HjYIEEHmg=; b=rJ+apkNytYuXWzZwrfzOPTHVel4446L8ztZ7RhbAawbvzWEAc9RqW4zTbHnviVla09/fj+Jun ZLC4A5NVQ13B5cqhq7Nc+1oaQqhvrMO6Dp7SKfdIrJUdSxWU56ZLA8N
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Commit cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
introduced an initial mapping of kernel TEXT using PAGE_KERNEL_TEXT,
but the pages that contain kernel TEXT may also contain kernel RODATA,
and depending on selected debug options PAGE_KERNEL_TEXT may be either
RWX or ROX. RODATA must be writable during init because it also
contains ro_after_init data.

So use PAGE_KERNEL_X instead to be sure it is RWX.

Fixes: cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/8xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 388bba0ab3e7..15d918dce27d 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -150,11 +150,11 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 
 	mmu_mapin_immr();
 
-	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, true);
+	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_X, true);
 	if (debug_pagealloc_enabled_or_kfence()) {
 		top = boundary;
 	} else {
-		mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL_TEXT, true);
+		mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL_X, true);
 		mmu_mapin_ram_chunk(einittext8, top, PAGE_KERNEL, true);
 	}
 
-- 
2.44.0


