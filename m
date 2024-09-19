Return-Path: <linuxppc-dev+bounces-1469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385497CDDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 20:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8l9Z65fmz2yLC;
	Fri, 20 Sep 2024 04:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726772194;
	cv=none; b=AmRujfOyPjSPkkZp/a/s9gTFfmMfu2Mx80UGDdFeqdhNToVjEQ0y41FHxaoBUfO5OKQRstXxGPR76wikeOazQLz3Pw1TDCmDNYbsbFQ0tlpSLShMdwI4bQ/cXh2tee6+OC9kJk/jqTSDBXyVm8nyVD/LkQnLMAqKUL1whgcD83rUy08bTL402WBASWUVMkaMSwDQGclA1UKkIProgVsdyhLaH0pfYOM2r+XhyBWc0+Y4WlWMob07WxJrlzr6Lcszd4W+mXv13IXQ1RKOxErTjpqGsnl6zddlpIdPItmUBC8wcj0WIv3wkYLHfUjFjwBgDbpNL6pbmTdE46qJ1cv+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726772194; c=relaxed/relaxed;
	bh=E2SzX8BV6Npe4WTZHAs5Pplg78ggO66eL6gUlA13pGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gr2t+azD3/mWI3b5qM1B9opBAkImMqUzGHK3N0Fb7S8CcjScCNIIZ6ebclFI8aqWbJQl0B9ogNyfi5ilry5m+NR29yMHTfTePCwq0FdyfeqGjWvZU9Bf1zvZUEs+3uCunFX0eHCKBjb6qsZyym3qVdbxkWKxZ/5eTyda3jC9WFaHxBf3NWzw50GZfVUj1dnjCnMBJqd1Gi//Rd+BPL7RlA6CaP7ZAIe1O/mBRg9KCpdtuxD+kwQk/QlVurdVYrfPTvtkLK3LoSCvKNjHnSgx1O7FZREjKb/5WGDqgtmfVeV55gx0Y5rmAOv7eoK7XRjillJ8AzXodNhFH3S49JTr6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8l9Z3m6Cz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 04:56:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X8l9T6Pm8z9tQt;
	Thu, 19 Sep 2024 20:56:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xu1xsNImuLeA; Thu, 19 Sep 2024 20:56:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X8l9T5cQTz9tQs;
	Thu, 19 Sep 2024 20:56:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD9F18B77E;
	Thu, 19 Sep 2024 20:56:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zfBuktewYKi7; Thu, 19 Sep 2024 20:56:29 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 410F78B77D;
	Thu, 19 Sep 2024 20:56:29 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH] powerpc/vdso32: Fix use of crtsavres for PPC64
Date: Thu, 19 Sep 2024 20:55:57 +0200
Message-ID: <aded2b257018fe654db759fdfa4ab1a0b5426b1b.1726772140.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726772181; l=1070; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Ixprgg6LkwtGPXf5sq+EpdCerjqIvCA498WKeSc8mhw=; b=5VKYFxFvFtbMuepxvehhrD2IPe9sgUYcgB8FAAa8ZN81yL6OwdYmrJznlodbv3Jy/bn91Jw6/ uwwsU639hEADF5RqWOrLWHtp8l3nvykjoH5v1k/XhW5QrjQWV0cB+aV
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

crtsavres.S content is encloded by a #ifndef CONFIG_PPC64

To be used on VDSO32 on PPC64 it's content must available on PPC64 as
well.

Replace #ifndef CONFIG_PPC64 by #ifndef __powerpc64__ as __powerpc64__
is not set when building VDSO32 on PPC64.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closed: https://lore.kernel.org/linuxppc-dev/047b7503-af0c-4bb0-b12a-2f6b1e461752@csgroup.eu/T/
Fixes: b163596a5b6f ("powerpc/vdso32: Add crtsavres")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/crtsavres.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/crtsavres.S b/arch/powerpc/lib/crtsavres.S
index 7e5e1c28e56a..8967903c15e9 100644
--- a/arch/powerpc/lib/crtsavres.S
+++ b/arch/powerpc/lib/crtsavres.S
@@ -46,7 +46,7 @@
 
 	.section ".text"
 
-#ifndef CONFIG_PPC64
+#ifndef __powerpc64__
 
 /* Routines for saving integer registers, called by the compiler.  */
 /* Called with r11 pointing to the stack header word of the caller of the */
-- 
2.44.0


