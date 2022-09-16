Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33085BAEF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:10:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTbYn1PQZz3cDb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 00:10:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTbYK1F0kz3bc3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 00:09:35 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MTbSj4sJWzmVMf;
	Fri, 16 Sep 2022 22:05:41 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 22:09:30 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 16 Sep
 2022 22:09:29 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next] macintosh: Switch to use for_each_child_of_node() macro
Date: Fri, 16 Sep 2022 22:16:38 +0800
Message-ID: <20220916141638.685575-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use for_each_child_of_node() macro instead of open coding it.
No functional change.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/macintosh/windfarm_smu_controls.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/macintosh/windfarm_smu_controls.c b/drivers/macintosh/windfarm_smu_controls.c
index e9957ad49a2a..bdd92b27da2a 100644
--- a/drivers/macintosh/windfarm_smu_controls.c
+++ b/drivers/macintosh/windfarm_smu_controls.c
@@ -266,12 +266,11 @@ static int __init smu_controls_init(void)
 		return -ENODEV;
 
 	/* Look for RPM fans */
-	for (fans = NULL; (fans = of_get_next_child(smu, fans)) != NULL;)
+	for_each_child_of_node(smu, fans)
 		if (of_node_name_eq(fans, "rpm-fans") ||
 		    of_device_is_compatible(fans, "smu-rpm-fans"))
 			break;
-	for (fan = NULL;
-	     fans && (fan = of_get_next_child(fans, fan)) != NULL;) {
+	for_each_child_of_node(fans, fan) {
 		struct smu_fan_control *fct;
 
 		fct = smu_fan_create(fan, 0);
@@ -286,11 +285,10 @@ static int __init smu_controls_init(void)
 
 
 	/* Look for PWM fans */
-	for (fans = NULL; (fans = of_get_next_child(smu, fans)) != NULL;)
+	for_each_child_of_node(smu, fans)
 		if (of_node_name_eq(fans, "pwm-fans"))
 			break;
-	for (fan = NULL;
-	     fans && (fan = of_get_next_child(fans, fan)) != NULL;) {
+	for_each_child_of_node(fans, fan) {
 		struct smu_fan_control *fct;
 
 		fct = smu_fan_create(fan, 1);
-- 
2.25.1

