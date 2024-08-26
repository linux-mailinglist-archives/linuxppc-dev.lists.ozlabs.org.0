Return-Path: <linuxppc-dev+bounces-548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1095FBE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:41:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt3zH3j22z2yMh;
	Tue, 27 Aug 2024 07:41:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724685622;
	cv=none; b=SADMLRmqt3bQnDeSijcxl/UaQiPoKjo0uXS/UmHk4y7Bg3Lwkw/eVKmo0CEAWwdfx48XBsS+bkgRrIva/Nj4AUAgDqZXzcIW1V0DtDWvTnkwY+LEVG/4vxBksnkENth872cCQbG2aJErpQ4mg+laj/o1Hlyp2W9zwr+gmJGr/ECjYGZtWxCzktncO/7ACRI1Y0+65ca1r2KjmhRXR0CbgVXSz0gLtr7uOCOXcOShACS123mCagM3vs5awidUpXZ6HLVhMGfS4rWmU6L1D+UJRO0MOpR05oUmwXWeGJTarZq7spYLKZeJ5/nKXtm47rWRgbwJdMo5LUDxGyc3+iRohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724685622; c=relaxed/relaxed;
	bh=5OBcE1bBS1fURtoMUF7ZhYU8f5DJqDUkB/ypiBUjPc0=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=cfwM5c0r9J7+YjfGLp6OWM7NB/IzvrTixP8H/S+6QSYPVBDJOAHQ/JrDdJ8meUDfqoOywBNddjO35zKwQZa8MSEzNwX5+U4faOJDgVeYCDVzk2U9AROmrjdrBOFosjN7gxqIENcHTJmQYdsMk03CMo8aiGm1woSNDUb9XE577StOFvghsh2S5Ftuv7GFMDyFCWighlnu2AbJjGum9jYxvdEB23wFSBp75a3QUxlvgGvGI8oGTq9c3o/amGzd2sDIYa9q9FC5ZzsOhRDSuljZkuMxULwyn5wbTBJ9iv1ugKXeJJI4L6fIyGPL0TKx0YLR0tRMsJxE3NmY8IVrWChf+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=huangxiaojia2@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=huangxiaojia2@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsvW90XwQz2xwc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:20:18 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wsv5q010qz1S90G;
	Mon, 26 Aug 2024 23:01:50 +0800 (CST)
Received: from dggpemm500021.china.huawei.com (unknown [7.185.36.109])
	by mail.maildlp.com (Postfix) with ESMTPS id 8ADFC1402E1;
	Mon, 26 Aug 2024 23:02:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500021.china.huawei.com
 (7.185.36.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 23:02:00 +0800
From: Huang Xiaojia <huangxiaojia2@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <yuehaibing@huawei.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <huangxiaojia2@huawei.com>
Subject: [PATCH -next 3/3] powerpc: pseries: Constify struct kobj_type
Date: Mon, 26 Aug 2024 23:09:57 +0800
Message-ID: <20240826150957.3500237-3-huangxiaojia2@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826150957.3500237-1-huangxiaojia2@huawei.com>
References: <20240826150957.3500237-1-huangxiaojia2@huawei.com>
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
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500021.china.huawei.com (7.185.36.109)

'struct kobj_type' is not modified. It is only used in kobject_init()
which takes a 'const struct kobj_type *ktype' parameter.

Constifying this structure moves some data to a read-only section,
so increase over all security.

On a x86_64, compiled with ppc64 defconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   1885	    368	     16	   2269	    8dd	arch/powerpc/platforms/pseries/vas-sysfs.o

After:
======
   text	   data	    bss	    dec	    hex	filename
   1981	    272	     16	   2269	    8dd	arch/powerpc/platforms/pseries/vas-sysfs.o

Signed-off-by: Huang Xiaojia <huangxiaojia2@huawei.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index f9f682724e77..9e05a0e99cad 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -162,13 +162,13 @@ static const struct sysfs_ops vas_sysfs_ops = {
 	.store	=	vas_type_store,
 };
 
-static struct kobj_type vas_def_attr_type = {
+static const struct kobj_type vas_def_attr_type = {
 		.release	=	vas_type_release,
 		.sysfs_ops      =       &vas_sysfs_ops,
 		.default_groups	=	vas_def_capab_groups,
 };
 
-static struct kobj_type vas_qos_attr_type = {
+static const struct kobj_type vas_qos_attr_type = {
 		.release	=	vas_type_release,
 		.sysfs_ops	=	&vas_sysfs_ops,
 		.default_groups	=	vas_qos_capab_groups,
-- 
2.34.1


