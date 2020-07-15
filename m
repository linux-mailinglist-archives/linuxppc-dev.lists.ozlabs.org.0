Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499D22187F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 01:38:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Yk209K1zDqpG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6YhP6TT8zDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 09:37:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=rxH6rVJy; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1010)
 id 4B6YhP4NRWz9sQt; Thu, 16 Jul 2020 09:37:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594856245; bh=PGPXONDLak4FHorLbk+WPFS43jKW5Y/AEvHQgO7H0YU=;
 h=From:To:Cc:Subject:Date:From;
 b=rxH6rVJyAFj64RsRQXaz35lILCLK11Q71PROeIh36srLNQBjTqShcqB336fBGiICJ
 4z8oADC1pWLAhgUWHPnnDldfkpzdgBv28cse3JdNy/cvYwvlL6ip1Chn8ud2glFQ5+
 /YlT2zFh3SpHyI687hnjcWhmuurrRCGMUBxEgRJtIzTOKweCTH+uytvKOaeczMXR1V
 ZSmXyye2T9HiSUnbVAPg2ZwIVUENQoYdtBaxV7a9kBlWhjQ0Bf/hmliWYOIMCF4eIM
 kSrLx4SSVvEw7YbUX8+IARuIWHjNIUL5563LMCdbaO2YFnUp0pI7ANir4gNqU9wZOe
 8QQNHLRK9Qm4A==
From: Anton Blanchard <anton@ozlabs.org>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 miltonm@us.ibm.com
Subject: [PATCH] powerpc/vdso: Fix vdso cpu truncation
Date: Thu, 16 Jul 2020 09:37:04 +1000
Message-Id: <20200715233704.1352257-1-anton@ozlabs.org>
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

From: Milton Miller <miltonm@us.ibm.com>

The code in vdso_cpu_init that exposes the cpu and numa node to
userspace via SPRG_VDSO incorrctly masks the cpu to 12 bits. This means
that any kernel running on a box with more than 4096 threads (NR_CPUS
advertises a limit of of 8192 cpus) would expose userspace to two cpu
contexts running at the same time with the same cpu number.

Note: I'm not aware of any distro shipping a kernel with support for more
than 4096 threads today, nor of any system image that currently exceeds
4096 threads. Found via code browsing.

Fixes: 18ad51dd342a7eb09dbcd059d0b451b616d4dafc ("powerpc: Add VDSO version of getcpu")
Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Anton Blanchard <anton@linux.ibm.com>
---
 arch/powerpc/kernel/vdso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index e0f4ba45b6cc..8dad44262e75 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -677,7 +677,7 @@ int vdso_getcpu_init(void)
 	node = cpu_to_node(cpu);
 	WARN_ON_ONCE(node > 0xffff);
 
-	val = (cpu & 0xfff) | ((node & 0xffff) << 16);
+	val = (cpu & 0xffff) | ((node & 0xffff) << 16);
 	mtspr(SPRN_SPRG_VDSO_WRITE, val);
 	get_paca()->sprg_vdso = val;
 
-- 
2.26.2

