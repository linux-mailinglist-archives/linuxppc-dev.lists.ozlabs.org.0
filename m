Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 659AE1845D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 12:22:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f3Fg2VFQzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 22:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f3CG5XxMzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 22:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=q6WOdmE8; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48f3CG0WPpz9sQx; Fri, 13 Mar 2020 22:20:26 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48f3CF6g3wz9sRN; Fri, 13 Mar 2020 22:20:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584098425;
 bh=n7X+1yYdbYEOKjn86aGWRcGEqmCuAetdkPBqXXllafU=;
 h=From:To:Cc:Subject:Date:From;
 b=q6WOdmE8T+yaMBPHJjrt69gUfpQdlO98A1SEW/fLEc5aUthpXccRXfJtKmb8BO23+
 maCEIrOHCogmQPnD95P9X43BfDovHP19ItSKffGLkkQpteknM7Bdxwmf0LFlVxYh/E
 Ez1CdUMOAYBaaPGioYu7Q18rtJd/paJzl421DcZEQZvQAp/GGCxUgZYYuGhznLfGjH
 DbBCbDRiScykAYd0QVCa4erd2rozbAhRIB5AzBqXN49S36wGwzC3akXBMzBvzUDLUd
 3CQyL1MD/ROaDZckIGWZbdFQh9TTFds93pPcKCqwLI9vkIvpHTa444MOVvk6nuB6xV
 v423xvG8aS/qQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/2] powerpc/smp: Drop superfluous NULL check
Date: Fri, 13 Mar 2020 22:20:19 +1100
Message-Id: <20200313112020.28235-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Cc: srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We don't need the NULL check of np, the result is the same because the
OF helpers cope with NULL, of_node_to_nid(NULL) == NUMA_NO_NODE (-1).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/smp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 37c12e3bab9e..aae61a3b3201 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1197,11 +1197,8 @@ int get_physical_package_id(int cpu)
 	 */
 	if (pkg_id == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
 		struct device_node *np = of_get_cpu_node(cpu, NULL);
-
-		if (np) {
-			pkg_id = of_node_to_nid(np);
-			of_node_put(np);
-		}
+		pkg_id = of_node_to_nid(np);
+		of_node_put(np);
 	}
 #endif /* CONFIG_PPC_SPLPAR */
 
-- 
2.21.1

