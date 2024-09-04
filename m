Return-Path: <linuxppc-dev+bounces-944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054A96AE7E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 04:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wz5kY6wPkz2xsH;
	Wed,  4 Sep 2024 12:18:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725416293;
	cv=none; b=ZV8eNRCFSD2nk+6K32RRQVfhsaswWQ3cUVku40l0igcJdoBxmZ2PC4NUKf5IqVFupL1fwP5/cJ1txVhiRDUDPF0mGQ0a4toqWnGOPWTBa64omt1UJ+OvEMGV/IjcKaabRyM5t9KacWnT/R/1BjsQL/Jt2QkM8ESGbtibpe5h+PmF1y4AQTLR5BAkIZZKTpHsL8d0F8FjClVnW4b1+o2BxmhmkbZ1yHdM1eip+Q2TKjKY8vh/DRfSEl39aTjLCtaA3O7OrZ6cxFaxLGDldgHJSCvy1/oZSC+4dE53wfGQZDEUE2RHxjUvbDX5TTxtZEY1euVsmf9nbdCDYiEROJfiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725416293; c=relaxed/relaxed;
	bh=sooL9IoI5x3i08yyZTvCV12CNg2urho5OAujQacY2BU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q7ECOo7b04hwe1e1+wEpqYocRwRijYagpONbX78BY5jNfjGqyIquO5k2GhJqj8AR8s2ZoW3cvfpyHuVOl3XKD/hHdh7gj8FOo2biB7y2oK9uLLmlgx9d8f1vdomQAC9KykS2TUmmx7N8hL5M+U6IweYFptXTgaNgqPwKKoZwGO/C9a43qMEvdYmxD9fNnp6OLJEuvTfbRmOnujdmg+mhclpnLWdBpJB8NzgQmdZMgl6vZAk7oieDcTby5N57Sez4ffx750Rb80CUHheOsYqPo6kKHYd5xdiogluNNBTbQ4UNTI0ZgVf0XY5TJZVX8MPT3/4847ZyqGB5S468pc9FpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wz5kX3Rd6z2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 12:18:08 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wz5cb72RDz69Ny;
	Wed,  4 Sep 2024 10:13:03 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E660180105;
	Wed,  4 Sep 2024 10:18:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 4 Sep
 2024 10:18:00 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <christophe.leroy@csgroup.eu>
CC: <lihongbo22@huawei.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next v2] soc/fsl/qbman: make use of the helper function kthread_run_on_cpu()
Date: Wed, 4 Sep 2024 10:26:33 +0800
Message-ID: <20240904022633.2079803-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Replace kthread_create/kthread_bind/wake_up_process() with
kthread_run_on_cpu() to simplify the code.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

---
v2:
  - Remove the extra parameter to solve the compilation.
  - Change cpu from int type to unsigned int type.

v1: https://lore.kernel.org/linux-arm-kernel/20240902133125.3089560-1-lihongbo22@huawei.com/T/
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..639acaf6ce18 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -101,21 +101,19 @@ static int bstrap_fn(void *bs)
 }
 static int on_all_cpus(int (*fn)(void))
 {
-	int cpu;
+	unsigned int cpu;
 
 	for_each_cpu(cpu, cpu_online_mask) {
 		struct bstrap bstrap = {
 			.fn = fn,
 			.started = ATOMIC_INIT(0)
 		};
-		struct task_struct *k = kthread_create(bstrap_fn, &bstrap,
-			"hotpotato%d", cpu);
+		struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
+						cpu, "hotpotato%u");
 		int ret;
 
 		if (IS_ERR(k))
 			return -ENOMEM;
-		kthread_bind(k, cpu);
-		wake_up_process(k);
 		/*
 		 * If we call kthread_stop() before the "wake up" has had an
 		 * effect, then the thread may exit with -EINTR without ever
-- 
2.34.1


