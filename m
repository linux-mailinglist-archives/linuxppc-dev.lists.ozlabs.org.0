Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998BD38E58C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 13:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpZsp07CQz301K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 21:36:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=liushixin2@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpZsQ2r2Bz2yRF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 21:35:49 +1000 (AEST)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FpZn32z1VzNybK;
 Mon, 24 May 2021 19:32:07 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:35:42 +0800
Received: from huawei.com (10.175.113.32) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 24 May
 2021 19:35:42 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Colin Leroy <colin@colino.net>
Subject: [PATCH -next] macintosh/therm_adt746x: Replaced simple_strtol() with
 kstrtoint()
Date: Mon, 24 May 2021 20:08:35 +0800
Message-ID: <20210524120835.1580420-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
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
Cc: Liu Shixin <liushixin2@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The simple_strtol() function is deprecated in some situation since
it does not check for the range overflow. Use kstrtoint() instead.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/macintosh/therm_adt746x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
index 7e218437730c..0d7ef55126ce 100644
--- a/drivers/macintosh/therm_adt746x.c
+++ b/drivers/macintosh/therm_adt746x.c
@@ -352,7 +352,8 @@ static ssize_t store_##name(struct device *dev, struct device_attribute *attr, c
 	struct thermostat *th = dev_get_drvdata(dev);		\
 	int val;						\
 	int i;							\
-	val = simple_strtol(buf, NULL, 10);			\
+	if (unlikely(kstrtoint(buf, 10, &val))			\
+		return -EINVAL;					\
 	printk(KERN_INFO "Adjusting limits by %d degrees\n", val);	\
 	limit_adjust = val;					\
 	for (i=0; i < 3; i++)					\
@@ -364,7 +365,8 @@ static ssize_t store_##name(struct device *dev, struct device_attribute *attr, c
 static ssize_t store_##name(struct device *dev, struct device_attribute *attr, const char *buf, size_t n) \
 {								\
 	int val;						\
-	val = simple_strtol(buf, NULL, 10);			\
+	if (unlikely(kstrtoint(buf, 10, &val))			\
+		return -EINVAL;					\
 	if (val < 0 || val > 255)				\
 		return -EINVAL;					\
 	printk(KERN_INFO "Setting specified fan speed to %d\n", val);	\
-- 
2.18.0.huawei.25

