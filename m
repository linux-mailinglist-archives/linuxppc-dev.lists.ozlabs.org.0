Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDB550357
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 09:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ6cW1KhMz3cj2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 17:15:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Z8hMvxqr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Z8hMvxqr;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ6br3GGnz3bvP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 17:14:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yUGvi
	HoDuaYWc3NS2cFfqUOpZuOBhcDVFg5fEUfO50k=; b=Z8hMvxqr2n6DWaX01Dqgs
	N8xvqKxQPOHDuees4IkR4vaAqWNlFZHhfH4V3tdtGjQlP+7sHnSqd4u1RITTh65j
	3WoGSBbPMFGDBaU70sqqfPHMHAqOy4YKHgAgoGfZzYpTm5k3HRivJp+FrSDPSnKz
	iFXdhpW6rMK8iBoKm/Lbxo=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowAD3Ovoxe61i4dmmDg--.41080S2;
	Sat, 18 Jun 2022 15:13:54 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	atrajeev@linux.vnet.ibm.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: perf: Fix refcount leak bug in imc-pmu.c
Date: Sat, 18 Jun 2022 15:13:53 +0800
Message-Id: <20220618071353.4059000-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAD3Ovoxe61i4dmmDg--.41080S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4UXry5Xw4xKrW3uF4fuFg_yoW8WFy5pr
	WkCayFgr48tw1xu34SqFsFvrZ5t340gr4qqrW7W39FvFnrZr1ktF48Ar1rZryFyFyfJa4x
	Xw4Yqw47Ka4akaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziZYF_UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgokF1-HZUrvjAABs2
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In update_events_in_group(), of_find_node_by_phandle() will return
a node pointer with refcount incremented. We should use of_node_put()
in fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/perf/imc-pmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index d7976ab40d38..d517aba94d1b 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -240,8 +240,10 @@ static int update_events_in_group(struct device_node *node, struct imc_pmu *pmu)
 	ct = of_get_child_count(pmu_events);
 
 	/* Get the event prefix */
-	if (of_property_read_string(node, "events-prefix", &prefix))
+	if (of_property_read_string(node, "events-prefix", &prefix)) {
+		of_node_put(pmu_events);
 		return 0;
+	}
 
 	/* Get a global unit and scale data if available */
 	if (of_property_read_string(node, "scale", &g_scale))
@@ -255,8 +257,10 @@ static int update_events_in_group(struct device_node *node, struct imc_pmu *pmu)
 
 	/* Allocate memory for the events */
 	pmu->events = kcalloc(ct, sizeof(struct imc_events), GFP_KERNEL);
-	if (!pmu->events)
+	if (!pmu->events) {
+		of_node_put(pmu_events);
 		return -ENOMEM;
+	}
 
 	ct = 0;
 	/* Parse the events and update the struct */
@@ -266,6 +270,8 @@ static int update_events_in_group(struct device_node *node, struct imc_pmu *pmu)
 			ct++;
 	}
 
+	of_node_put(pmu_events);
+
 	/* Allocate memory for attribute group */
 	attr_group = kzalloc(sizeof(*attr_group), GFP_KERNEL);
 	if (!attr_group) {
-- 
2.25.1

