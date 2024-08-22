Return-Path: <linuxppc-dev+bounces-345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3195B4C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMb2730Hz2xHQ;
	Thu, 22 Aug 2024 22:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1046 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 19:25:14 AEST
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqHqG5rxFz2xGs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:25:11 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WqHQt1LGmz1S88K;
	Thu, 22 Aug 2024 17:07:34 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 342C41400FD;
	Thu, 22 Aug 2024 17:07:38 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 17:07:37 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 0/2] Use helper function for_each_child_of_node()
Date: Thu, 22 Aug 2024 16:54:28 +0800
Message-ID: <20240822085430.25753-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use for_each_child_of_node() to iterate through the device_node, this
can make code more simple.

Zhang Zekun (2):
  powerpc/powermac/pfunc_base: Use helper function
    for_each_child_of_node()
  powerpc/pseries/dlpar: Use helper function for_each_child_of_node()

 arch/powerpc/platforms/powermac/pfunc_base.c | 2 +-
 arch/powerpc/platforms/pseries/dlpar.c       | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.17.1


