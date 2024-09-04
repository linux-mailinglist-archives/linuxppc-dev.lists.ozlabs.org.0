Return-Path: <linuxppc-dev+bounces-942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9842A96ADA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 03:11:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wz4FZ34yQz2y72;
	Wed,  4 Sep 2024 11:11:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725412290;
	cv=none; b=AzRY0dcZT/hUq0nHG/Yil4uv00Jm9uD8IqrV8e4FgIjkVdGwp6c42eNWfYM6n4mn2SlwrxJZbtGf+o9HIeRVALkBaoPuWeCvwahvL+1NuQjlPKkrr+KDkBz0wqe90/QqcJN5fCgOKDt7zvxdbvX/Nf+Hz9GJxECyXitTFKGtslaD32GhfM5peb1fI5mTGRroTMtsyLYb1zQ95h32wa25dzqUIsK3xgSokHAY6BGvGjsI7phcU65aecTSGrSy+KHKaH/CQ7ol0KyYgztE5hZLegP+iNQALxQfUoQW86+KM01UorQ9FVUJWQz5jc0vPQtrhh5rAtyhjZEVj1D4LKEN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725412290; c=relaxed/relaxed;
	bh=QwwuWxpGT6wlPvJE2+Klf8cFFLsQyZ5bYmDuwBpi5wA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MQpCyhNKrBrPNluSf5qMoYw2vWA6n/+eigCXbc7nBdm7x5R6vkRBjT2/adCdKyPBLx32fQoQ7b+zymqa7/veAAY67s/entKBxeBmCzoXp9w23xSYCnNbRMBwTvwL9l0yR4LQoJMtLV06Zrk385gupxg2kld034rgv2nF9qFojv+jH2S33Sc4ykCczVKS4yMOSXO+I14++Z8apxgWwrQvBvQ2qSaaKIZ/xneolFw+nfpnfZ6DVsLEcYoAIUm3Rs2KbvRBechonVEWFjEkr+kZ3ow5cz75+PCGktreYXTONVb5YCAawE/IwYEoiCAf0CU+28rFpDMq/bZ/97hE57VSlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wz4FY3RjDz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 11:11:24 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wz49M4httz1HJ6J;
	Wed,  4 Sep 2024 09:07:51 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id AEDE418002B;
	Wed,  4 Sep 2024 09:11:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 4 Sep
 2024 09:11:18 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] cxl: Constify struct kobj_type
Date: Wed, 4 Sep 2024 09:19:51 +0800
Message-ID: <20240904011951.2010646-1-lihongbo22@huawei.com>
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

This 'struct kobj_type' is not modified. It is only used in
kobject_init_and_add() which takes a 'const struct kobj_type *ktype'
parameter.

Constifying this structure and moving it to a read-only section,
and can increase over all security.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/misc/cxl/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/sysfs.c b/drivers/misc/cxl/sysfs.c
index 315c43f17dd3..409bd1c39663 100644
--- a/drivers/misc/cxl/sysfs.c
+++ b/drivers/misc/cxl/sysfs.c
@@ -579,7 +579,7 @@ static void release_afu_config_record(struct kobject *kobj)
 	kfree(cr);
 }
 
-static struct kobj_type afu_config_record_type = {
+static const struct kobj_type afu_config_record_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 	.release = release_afu_config_record,
 	.default_groups = afu_cr_groups,
-- 
2.34.1


