Return-Path: <linuxppc-dev+bounces-1143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0C9700F5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 10:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X164568sCz302P;
	Sat,  7 Sep 2024 18:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725698421;
	cv=none; b=iK/qL080VujWq/ihfWove+giF98FDDjg4WoLH2lBCmRTI8Vfhy2GfC1FmfqJaFc11olYMlnuw1zljtTASwcVbSIWSjh2QPGQD47ajTvmADmhKPJ41TQefPWzMPn21bpKmQzK5mqyHJTCpISI62g/wTvW96gQKbIEVbTZ0095lzIUudViHAvCmXFvY214iYCM/zf/g5IHYQSZdAQe6TysFq1sE3PwwzmRkeHmsYlGlby6ql8g1R2jN1sae5IK1RwiO0Zv20364gpMfa1/EQmv/DQCYA9I2RJvNwb6q4PvQobPr0enQdqFjy7jjIrS74+3OCcafk0MCtXJfCYdMRr2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725698421; c=relaxed/relaxed;
	bh=5wFsYmz8a5fLuobN4tUYASgAUxhOJYn2x5WO9OSzexA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ChWUibxJbmorfXfF4zHSYhh8qGzWJE7+FufRxMhwDJsB4DfZltSdjZwrDPQ9jnxFA7qc4im21CctWcvBxK4j7tT3tIxwiI/UIuoIj9yTVr70ubB3Zxp6jRifsgb+RjWLuvzOr6DM88ttCkydvQ9mWcGaTokrhi9Zr3NIp/hkumeUSwKFntQ/wMPSuWtQu2I85yLHIIvAK5vgpB9IqkRLW2/6XYoDqJL+Bay/RB4Shnv5vsYr8Kum4RLQKmlqQ+5KUks2IfVvBwv2cPWlT5caANec/MKz2mdZ4n0OPwInPWCWRDi93ojqK25wJPy83ie6xFnuvT2QpIdgrmH4Dx50UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X16441ZyTz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 18:40:16 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X162Q2Z74zyRYW;
	Sat,  7 Sep 2024 16:38:54 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 95854180A9E;
	Sat,  7 Sep 2024 16:39:35 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 7 Sep
 2024 16:39:34 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linuxppc-dev@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] ocxl: Remove the unused declarations in headr file
Date: Sat, 7 Sep 2024 16:25:55 +0800
Message-ID: <20240907082555.60836-1-zhangzekun11@huawei.com>
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
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

The definition of ocxl_create_cdev() and ocxl_destroy_cdev() has been
removed since commit 75ca758adbaf ("ocxl: Create a clear delineation
between ocxl backend & frontend"). So, let's remove the empty declarations.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/misc/ocxl/ocxl_internal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 10125a22d5a5..d2028d6c6f08 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -97,8 +97,6 @@ struct ocxl_process_element {
 	__be32 software_state;
 };
 
-int ocxl_create_cdev(struct ocxl_afu *afu);
-void ocxl_destroy_cdev(struct ocxl_afu *afu);
 int ocxl_file_register_afu(struct ocxl_afu *afu);
 void ocxl_file_unregister_afu(struct ocxl_afu *afu);
 
-- 
2.17.1


