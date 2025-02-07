Return-Path: <linuxppc-dev+bounces-5923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4FA2B880
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 02:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxs80js6z30KY;
	Fri,  7 Feb 2025 12:56:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893372;
	cv=none; b=SfhDVLyRTaoTUxVUh0AH4h4WRGVIRvjDEIN4tDOAVD4r8QvjYQX1xMmbHvByA5i6xNMWS+xLG1zleLjZboWSFw8qrzSnptryPOCdZc9m0dSzLhPlza2hhgOip0+pkgIrjIgrkZVuKShEJO/3+AiXuGGdYtV0aRlb/MLuMPixkcNUoAlZbo62IgNVJj10ZjL2UfIyjpCKLSWAvkU+kNYvVO7ebveV77EIqSR5gV7zSMR7lRFMjc41BETWOpSoeDDoNHfnUuCbmO9r4NjhVB3PmZrNn3RFs43MJCNl7ZmBy9vUo4zND0kcl/Iq21lRxEH8xvCT4JdInXPD/HJ9sBrrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893372; c=relaxed/relaxed;
	bh=F4awucZl2DzuzJKZDigazC8Wzi0Yw3TMEYzGOP5iB3k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fjtbf7k2zZXMj9GtmGrqW6xGk7FOVggpfcjTVL5WC035yowhs8CuQew+Jiu8PeEDrDEzMt96qVNmC6ljkNu4JnotA/NBxID+WnMHJuwWiPULpFtacXpn/C9NBZGL9386M6WVpz9FV5po+Nbmp8c7yh4cVc3+yQmYdpkP1YUTMm7xHy741LIOpyiT0FQa8ACtUK+s75k/6014QPOhABVyZ9gHFFcdx7hVTRh8AFp82LfELqmRpAEE4auVZ/FPMP8Aofq2v3+Bgw2tfwjhHM1P+0AT7bn9tglg6t1/gqAc0WYaxXzM/HV1xHN7bc/UCxIhrvHFUbil+a9PS/0zSntl6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxs63h2tz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 12:56:10 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YpxSb3dxzz1JJdX;
	Fri,  7 Feb 2025 09:38:23 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id C4B5D1400CA;
	Fri,  7 Feb 2025 09:39:40 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:38 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: [PATCH 0/9] Add wrapper function of_find_node_by_name_balanced()
Date: Fri, 7 Feb 2025 09:31:08 +0800
Message-ID: <20250207013117.104205-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add wrapper function of_find_node_by_name_balanced() for drivers who
want to call of_find_node_by_name() and have to blance the ref count
by calling of_node_get(). For drivers who forget to call of_node_get(),
can also utilizing of_find_node_by_name_balanced() to fix a refcount
leak.

Zhang Zekun (9):
  of: Add warpper function of_find_node_by_name_balanced()
  net: bcmasp: Add missing of_node_get() before of_find_node_by_name()
  net: pse-pd: Add missing of_node_get() before of_find_node_by_name()
  media: max9286: Use of_find_node_by_name_balanced() to find
    device_node
  powerpc: Use of_find_node_by_name_balanced() to find device_node
  net: dsa: Use of_find_node_by_name_balanced() to find device_node
  net: dsa: hellcreek: Use of_find_node_by_name_balanced() to find
    device_node
  net: prestera: Use of_find_node_by_name_balanced() to find device_node
  regulator: scmi: Use of_find_node_by_name_balanced() to find
    device_node

 arch/powerpc/platforms/powermac/pic.c                 | 4 +---
 drivers/media/i2c/max9286.c                           | 4 +---
 drivers/net/dsa/bcm_sf2.c                             | 4 +---
 drivers/net/dsa/hirschmann/hellcreek_ptp.c            | 3 +--
 drivers/net/ethernet/broadcom/asp2/bcmasp.c           | 2 +-
 drivers/net/ethernet/marvell/prestera/prestera_main.c | 3 +--
 drivers/net/pse-pd/tps23881.c                         | 2 +-
 drivers/regulator/scmi-regulator.c                    | 3 +--
 include/linux/of.h                                    | 5 +++++
 9 files changed, 13 insertions(+), 17 deletions(-)

-- 
2.22.0


