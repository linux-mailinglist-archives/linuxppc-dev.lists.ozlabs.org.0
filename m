Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5061845E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 12:25:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f3K47147zDqXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 22:25:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f3CH4Z0kzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 22:20:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CpQp0Ons; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48f3CH47CWz9sQx; Fri, 13 Mar 2020 22:20:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48f3CH3H9wz9sSR; Fri, 13 Mar 2020 22:20:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584098427;
 bh=eDe5tL5SvThErl4x2eswJcsyyAk5RV/aNF8vouzlUtE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CpQp0OnstwxTvUyno4QL0RaQWfcM2NWwVlYps+oGiJNNwRoA/uUanVDWyiNeXJldp
 5FCvvMt9DCEaMC9Ehjm0Exj4xtCOuypEgwXMg7p5qDWKBi/bhG1CA+MEXXKqiyl4RG
 CiHLCviJUP9LZND2B6C8PnDMbpSvBocJwieIYDjTOHjT6a7Y2FjBwQgm2cyyjwb8lq
 mUjG2NNzw0VNakFr/ZiklvO1OM0gkO/KIIAr9fe0KdI9eUsMP5LREkPIacRrKNb0BK
 UKGRCAYYprOSvAIMMjHk4FGQjJxLwWZXkAbIWo1YVVL3v3/epIUHK1T4b4W7uQaekf
 q09fYe1PmUdYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/2] powerpc/smp: Use IS_ENABLED() to avoid #ifdef
Date: Fri, 13 Mar 2020 22:20:20 +1100
Message-Id: <20200313112020.28235-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313112020.28235-1-mpe@ellerman.id.au>
References: <20200313112020.28235-1-mpe@ellerman.id.au>
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

We can avoid the #ifdef by using IS_ENABLED() in the existing
condition check.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/smp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index aae61a3b3201..6d2a3a3666f0 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1189,18 +1189,17 @@ int get_physical_package_id(int cpu)
 {
 	int pkg_id = cpu_to_chip_id(cpu);
 
-#ifdef CONFIG_PPC_SPLPAR
 	/*
 	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
 	 * defined. Hence we would return the chip-id as the result of
 	 * get_physical_package_id.
 	 */
-	if (pkg_id == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
+	if (pkg_id == -1 && firmware_has_feature(FW_FEATURE_LPAR) &&
+	    IS_ENABLED(CONFIG_PPC_SPLPAR)) {
 		struct device_node *np = of_get_cpu_node(cpu, NULL);
 		pkg_id = of_node_to_nid(np);
 		of_node_put(np);
 	}
-#endif /* CONFIG_PPC_SPLPAR */
 
 	return pkg_id;
 }
-- 
2.21.1

