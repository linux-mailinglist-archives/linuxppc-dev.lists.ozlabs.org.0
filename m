Return-Path: <linuxppc-dev+bounces-258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C144959649
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 10:07:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpf8P13ljz2yDr;
	Wed, 21 Aug 2024 18:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k3FlO0u/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wpf8P0xTVz2xjH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:07:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724227669;
	bh=0pUHCOG/CSNrNQr5sKwNENvcyqcC40T8GoTdn+gWfbw=;
	h=From:To:Subject:Date:From;
	b=k3FlO0u/CD5IOcRWdj/vjvY3AnDl4XZQh8DiT/EPY5hHL6mAPgm3G2jJBjaqhxzaH
	 N3eNHeAbt+grr6Y4yzDGEky4uBvVuNHvpiJNr5yultIKctjx9myQ8vOuIg81ZaqKB2
	 mYZPSZ7M7O0QCoUgaQ+Wlrk4F69UWB2IM5sdJEVcAHG6pK/lIk5wvDWEai803d9qFF
	 gw1XtkYnXR9HI003fuJK2Pu2ZsMzF0vQO0j6EBqqG/A7zEhHpDscTKNyLI6vX9rOGF
	 AqX86rqCU/DFMd1hV8SItzvK30HutAyDi014qcI2GszQj4Nva0/X7PcwQznE4MNYEG
	 SXMd6+7MRpzHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wpf8N6tjbz4wbp;
	Wed, 21 Aug 2024 18:07:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Make mmu_hash_ops __ro_after_init
Date: Wed, 21 Aug 2024 18:07:45 +1000
Message-ID: <20240821080745.872151-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mmu_hash_ops are only assigned to during boot, so mark them
__ro_after_init to prevent any further modification.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 01c3b4b65241..845fb7ef0ad3 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -125,7 +125,7 @@ int mmu_ci_restrictions;
 #endif
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
-struct mmu_hash_ops mmu_hash_ops;
+struct mmu_hash_ops mmu_hash_ops __ro_after_init;
 EXPORT_SYMBOL(mmu_hash_ops);
 
 /*
-- 
2.46.0


