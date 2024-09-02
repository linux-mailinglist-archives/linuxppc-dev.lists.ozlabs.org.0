Return-Path: <linuxppc-dev+bounces-898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65584968F73
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 00:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyN404kGFz2xGp;
	Tue,  3 Sep 2024 08:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725284435;
	cv=none; b=Mu8cUgTOdSgIfhXdWnTQYpAYqEFPD9F/YqkFcpLVMHA/1TZ5rKu8BjA7sFglxsURpljoTQeMxl/LyMVify8OJI0kr+JEpPV1U76/PA5Bs1JPktr1JtIcxdm0Z3IIv1NzwSNIPBjS76QGfEaey47yo64U7mkHnjkXnxrJbbyX8Ja60Faje8m6tqq+5x1BJ3SHiG0dE4T2viTdjhaJ4cFQHgXE5MEfunC8H4X3jgY57zS/0VlULZvKAzs33zN9jzxrk2yHBI9gue0Viv9wjIm95+EqnppAPQPON6hjhcP8hehqgTdCXzRY2D8cger7g9ekkuFdXtw/h2qKSfwxjEpi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725284435; c=relaxed/relaxed;
	bh=NGkfYjo1L7ODEBgurzxbTfN4xG3fAwg0tEZKlaJSbQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cAdCnkPaZYkYNFsqKXetBjr0Gg1QI9ogA/Ia9braAn9vBj//fvaSCiQ4L4t4WjzWv7kH49zhsNi3ArRDLKWDHKtGlhUFEi/Qs83AqgV4VZM3vrsBk2kPWWYBcb9jrM+vbsH+01pPMSmX1Q4SnPPKMCnO3bz9n9g3Q1q+gLtKqfW9JpMRP/5/3+g5vaWoluKpY14FSB8lW9tDpcxbMQshv4Tg9xyGWhpGRRcruDBxyjHw450jqnPebPQXHGJSW4pWGY3wWNPxiLoJpOzt9Akgv6idCH2LRrpIxswwUxzM4ANnzF7TGWLU5MS47xv9soXog6Rt3OLjB0woceCQQ9h0+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1039 seconds by postgrey-1.37 at boromir; Mon, 02 Sep 2024 23:40:31 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy8yl4zTQz2xjH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 23:40:28 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wy8YS1rq0z13Kl2;
	Mon,  2 Sep 2024 21:22:04 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D3AB140120;
	Mon,  2 Sep 2024 21:22:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 21:22:58 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <christophe.leroy@csgroup.eu>
CC: <lihongbo22@huawei.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] soc/fsl/qbman: make use of the helper function kthread_run_on_cpu()
Date: Mon, 2 Sep 2024 21:31:25 +0800
Message-ID: <20240902133125.3089560-1-lihongbo22@huawei.com>
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
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Replace kthread_create/kthread_bind/wake_up_process() with
kthread_run_on_cpu() to simplify the code.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..32cd9beb6879 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -108,14 +108,12 @@ static int on_all_cpus(int (*fn)(void))
 			.fn = fn,
 			.started = ATOMIC_INIT(0)
 		};
-		struct task_struct *k = kthread_create(bstrap_fn, &bstrap,
-			"hotpotato%d", cpu);
+		struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
+						cpu, "hotpotato%d", cpu);
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


