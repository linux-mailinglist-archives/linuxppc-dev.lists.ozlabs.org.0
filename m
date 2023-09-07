Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988579715E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 11:58:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=Wvn/1xqn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhF6y0l3Vz3c2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=Wvn/1xqn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhF584Xz4z3bV4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 19:56:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iJOjUytuDi14rkC3oZrvSAs7iUFKHk35xiEtUoBzWQY=;
  b=Wvn/1xqn5JLO07S13jHJAovo4kcnBJi0y8eMSuBgrIcFRrzOIyiAIPdq
   HkuvT5fcNo/kCAe/p20kFWawK73TiiMf7pCleBDDqIcVDeXTj66dBOXZn
   unFbd1TZekXDv/QNta4xe8N8308R2XiBQ8rtrtZh+NDE2dTzzE/nM1kXl
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; 
   d="scan'208";a="65324658"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:30 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 03/11] powerpc/powermac: add missing of_node_put
Date: Thu,  7 Sep 2023 11:55:13 +0200
Message-Id: <20230907095521.14053-4-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

for_each_node_by_name performs an of_node_get on each
iteration, so a break out of the loop requires an
of_node_put.

This was done using the Coccinelle semantic patch
iterators/for_each_child.cocci

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/platforms/powermac/low_i2c.c |    4 +++-
 arch/powerpc/platforms/powermac/smp.c     |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff -u -p a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -598,8 +598,10 @@ static void __init smp_core99_setup_i2c_
 			name = "Pulsar";
 			break;
 		}
-		if (pmac_tb_freeze != NULL)
+		if (pmac_tb_freeze != NULL) {
+			of_node_put(cc);
 			break;
+		}
 	}
 	if (pmac_tb_freeze != NULL) {
 		/* Open i2c bus for synchronous access */
diff -u -p a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -925,8 +925,10 @@ static void __init smu_i2c_probe(void)
 
 		sz = sizeof(struct pmac_i2c_bus) + sizeof(struct smu_i2c_cmd);
 		bus = kzalloc(sz, GFP_KERNEL);
-		if (bus == NULL)
+		if (bus == NULL) {
+			of_node_put(busnode);
 			return;
+		}
 
 		bus->controller = controller;
 		bus->busnode = of_node_get(busnode);

