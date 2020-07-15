Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62F220143
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 02:10:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5ySk4qCvzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:10:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5yQc1PJDzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 10:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=sbINsA5q; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1010)
 id 4B5yQb42TBz9sRf; Wed, 15 Jul 2020 10:08:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594771703; bh=e4ciFxIDdxTvPKmHozP70SaavETGth4H5XKQ6IPhEUs=;
 h=From:To:Cc:Subject:Date:From;
 b=sbINsA5qVEBTbGuQoW3dW4+EcwiShlRlsMKI/8odplON5gUpVKXM9UQrg8SQG87hx
 KY2+MSzUxCO/qGn9GGXI9688k5qlPQf5pWHaXu6jGWcOXx9lPIUv2eG+I6S7qqiIf1
 Wm5SSMw1gWCJFm2sGmxd5DioBQcucjJ7/eOc9MouoP2aqfW8mbvj4tqtkQG+BMtsiH
 j90I+D095HByKflXcSXWx7GREWNBNJRiO6Vy2CPLFI0t6/AZtJpMXPQrfRyCWtT+QM
 Th/bxE/fL4IOzFjTaWPCQqaEkb+QDc7BYaVpsRFsoVjOU4qUym4UoaGtDoDsbr/PE6
 QQ+hYK3+pao+g==
From: Anton Blanchard <anton@ozlabs.org>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 nathanl@linux.ibm.com
Subject: [PATCH] pseries: Fix 64 bit logical memory block panic
Date: Wed, 15 Jul 2020 10:08:20 +1000
Message-Id: <20200715000820.1255764-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting with a 4GB LMB size causes us to panic:

  qemu-system-ppc64: OS terminated: OS panic:
      Memory block size not suitable: 0x0

Fix pseries_memory_block_size() to handle 64 bit LMBs.

Cc: stable@vger.kernel.org
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 5ace2f9a277e..6574ac33e887 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -27,7 +27,7 @@ static bool rtas_hp_event;
 unsigned long pseries_memory_block_size(void)
 {
 	struct device_node *np;
-	unsigned int memblock_size = MIN_MEMORY_BLOCK_SIZE;
+	uint64_t memblock_size = MIN_MEMORY_BLOCK_SIZE;
 	struct resource r;
 
 	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
-- 
2.26.2

