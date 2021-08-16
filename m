Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCF3ECD7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 06:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp11x3vRxz3c8Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 14:11:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FyQWuOlc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FyQWuOlc; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp11H211Jz301J
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 14:10:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Gp11C0SrQz9sWw; Mon, 16 Aug 2021 14:10:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629087055;
 bh=vL6PDLUTi4v2XAGCSY2os4ZBsblrndcYDG5h8EUgeyo=;
 h=From:To:Cc:Subject:Date:From;
 b=FyQWuOlcZm2GrjoI6G0//rqi8i1tuL9CU94oKd3rbEHKouH26AYEtSAhcNCxmJ+zB
 ZFwbav5AXgmvGoOt0NqZWYtlCUkJk6ZQXD3eZR/2L2CN+W9WiWUGWTqfKUAnHzShGH
 7pSFSiIAgzs1Znu/axkbl0T/PPmUcd3Rde1lu+JmLW9wR4p4ww/H8/Ri9yfhazFZXW
 t161L7RhS3C2XzwZhyFmMrf1KbjOk51ADNQ4E2nkzA2tdg351bbVlpWLviKOe1Gw+b
 Wb3UUXym2cwQg7/bhJND/Ab9OkgNRYHwVaeh4mKExDu0/Un+yBmbEW/bCqF5MPCD2w
 0/Qb41mS7V68Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Fix build error when NUMA=n
Date: Mon, 16 Aug 2021 14:10:32 +1000
Message-Id: <20210816041032.2839343-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by lkp, if NUMA=n we see a build error:

   arch/powerpc/platforms/pseries/hotplug-cpu.c: In function 'pseries_cpu_hotplug_init':
   arch/powerpc/platforms/pseries/hotplug-cpu.c:1022:8: error: 'node_to_cpumask_map' undeclared
    1022 |        node_to_cpumask_map[node]);

Use cpumask_of_node() which has an empty stub for NUMA=n, and when
NUMA=y does a lookup from node_to_cpumask_map[].

Fixes: bd1dd4c5f528 ("powerpc/pseries: Prevent free CPU ids being reused on another node")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 1ef40ef699a6..d646c22e94ab 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -1021,7 +1021,7 @@ static int __init pseries_cpu_hotplug_init(void)
 			/* Record ids of CPU added at boot time */
 			cpumask_or(node_recorded_ids_map[node],
 				   node_recorded_ids_map[node],
-				   node_to_cpumask_map[node]);
+				   cpumask_of_node(node));
 		}
 
 		of_reconfig_notifier_register(&pseries_smp_nb);
-- 
2.25.1

