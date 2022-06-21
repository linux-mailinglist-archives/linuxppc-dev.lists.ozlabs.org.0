Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279B552C8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 10:04:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRzZX2KdPz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 18:04:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=fR6bfQsP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=fR6bfQsP;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRzYv55n5z2ypY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 18:04:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vFnBj
	Gw+9JL2N7Y2k8dFZKUj6OvFP4+rfVqd64+q2Qw=; b=fR6bfQsPBx2ONSE5LHcO9
	3mmgcu2zIgmz0qVBvPZ91Sp8xT1xVtJTyR4u7EXOI2iUa17zf6qv95MhWfZInFJG
	9wOqN22/7S1zEs7wpqPVfx7XsvUtsxtaI6Z1I7ukCVu2VXhmDanC0vebRQPYqWAv
	REaqjeWDi+ylfPU5EW5jow=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowADn7zdme7FiW+YzFA--.19932S2;
	Tue, 21 Jun 2022 16:03:51 +0800 (CST)
From: Liang He <windhl@126.com>
To: agust@denx.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/512x: Hold the reference returned by of_find_compatible_node
Date: Tue, 21 Jun 2022 16:03:49 +0800
Message-Id: <20220621080349.4081689-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowADn7zdme7FiW+YzFA--.19932S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF43Cw4UCr1xWF4fur1rZwb_yoW8GrW3pF
	y09a93JayrJF1v9r1jvFyUXayYvFsYvFWxXanxCasxZwn8JrykZF18tw1avFZ5XryxAa95
	Zr1xKr1DA3Z3Z3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziwZ2DUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QgnF1pEAPwfWAAAsw
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In mpc5121_clk_provide_migration_support(), we need to hold the
reference returned by of_find_compatible_node() and use it to call
of_node_put for refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/512x/clock-commonclk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index ca475462e95b..42abeba4f698 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -950,7 +950,7 @@ static void __init mpc5121_clk_register_of_provider(struct device_node *np)
  */
 static void __init mpc5121_clk_provide_migration_support(void)
 {
-
+	struct device_node *np;
 	/*
 	 * pre-enable those clock items which are not yet appropriately
 	 * acquired by their peripheral driver
@@ -970,7 +970,9 @@ static void __init mpc5121_clk_provide_migration_support(void)
 	 * unused and so it gets disabled
 	 */
 	clk_prepare_enable(clks[MPC512x_CLK_PSC3_MCLK]);/* serial console */
-	if (of_find_compatible_node(NULL, "pci", "fsl,mpc5121-pci"))
+	np = of_find_compatible_node(NULL, "pci", "fsl,mpc5121-pci");
+	of_node_put(np);
+	if (np)
 		clk_prepare_enable(clks[MPC512x_CLK_PCI]);
 }
 
-- 
2.25.1

