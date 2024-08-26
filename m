Return-Path: <linuxppc-dev+bounces-549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F495FBE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt3zb3DVhz2yQ9;
	Tue, 27 Aug 2024 07:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724685676;
	cv=none; b=gcguZQQjjrYu3GQTuCp62kr7E21EcZGTT1/DgTAup294QNPqVEUsYbsg4InaR8dfJXQGbtxo57fwuyYKE6nqqHukOMfXsTVnBBureDXS7ECSCPa2bGU4p+om6FV4nZJBbuz8oGjqVku7ZhnBUiDEuUD5RXOVvrM1enWtVu0HOyrsbXAgt1GRGFdQV9yqLS0L+9al3gHIpNr1TTQt5AaRTvbst66YE/5fegcniTqD2OMKKCJ8b4UYeJ1voEoneBS5UX1b7zTPx0MaqtDQ0KcicZ1WCLTdqcPnvbXdm4Sc+3OlOvBKB8niRtSyvjIhfKIG1pMtcpwh7kEQpO0DQfvLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724685676; c=relaxed/relaxed;
	bh=PAF4mbMxPEsnfEO4VxPgsMoDKKG5UA4k2fq2FWnQNFc=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=fFoVvHO6tm4Ge074DYMyv3/RGsUo4VXFD6AwMPhx/h7cIHq4X7Jgdn9C6V/27j0l4yery2pVkAEhiBJAI0lQYWpVQAvy6Ot3UOvf+vfVKBEBCe/vEcSSOnu1ZY/LbQyOP5K6a+U6s9OIntQpLxHghXDke3I16wQZ54aP2Yl776y3vOD9PgiW7E/BO2xDD+dJxVIRCSlwQQEkQkuf4eX3Mw+2I36y5vQEIMBwObXbYl6OYMlyYQivsCN8+VCIVDdnlvhC+H6/ikV03p/Iw2drAamQW54pdK4L8snBJhm7aRo+t5SG2rNN5NKEAfkzr2pVzQUaM1Mq4LGTY58IyOMl+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=huangxiaojia2@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=huangxiaojia2@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsvXC4SzBz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:21:15 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wsv5S09j6zyRCG;
	Mon, 26 Aug 2024 23:01:32 +0800 (CST)
Received: from dggpemm500021.china.huawei.com (unknown [7.185.36.109])
	by mail.maildlp.com (Postfix) with ESMTPS id 5715E1800D0;
	Mon, 26 Aug 2024 23:02:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500021.china.huawei.com
 (7.185.36.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 23:02:00 +0800
From: Huang Xiaojia <huangxiaojia2@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <yuehaibing@huawei.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <huangxiaojia2@huawei.com>
Subject: [PATCH -next 1/3] powerpc: Constify struct kobj_type
Date: Mon, 26 Aug 2024 23:09:55 +0800
Message-ID: <20240826150957.3500237-1-huangxiaojia2@huawei.com>
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
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500021.china.huawei.com (7.185.36.109)

'struct kobj_type' is not modified. It is only used in
kobject_init_and_add()/kobject_init() which takes
a 'const struct kobj_type *ktype' parameter.

Constifying this structure moves some data to a read-only section,
so increase over all security.

On a x86_64, compiled with ppc64 defconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   7145	    606	      0	   7751	   1e47	arch/powerpc/kernel/cacheinfo.o
   3663	    384	     16	   4063	    fdf	arch/powerpc/kernel/secvar-sysfs.o

After:
======
   text    data     bss     dec     hex filename
   7193	    558	      0	   7751	   1e47	arch/powerpc/kernel/cacheinfo.o
   3663	    384	     16	   4063	    fdf	arch/powerpc/kernel/secvar-sysfs.o

Signed-off-by: Huang Xiaojia <huangxiaojia2@huawei.com>
---
 arch/powerpc/kernel/cacheinfo.c    | 2 +-
 arch/powerpc/kernel/secvar-sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index f502337dd37d..0fcc463b02e2 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -735,7 +735,7 @@ static const struct sysfs_ops cache_index_ops = {
 	.show = cache_index_show,
 };
 
-static struct kobj_type cache_index_type = {
+static const struct kobj_type cache_index_type = {
 	.release = cache_index_release,
 	.sysfs_ops = &cache_index_ops,
 	.default_groups = cache_index_default_groups,
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index eb3c053f323f..fbeb1cbac01b 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -125,7 +125,7 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
-static struct kobj_type secvar_ktype = {
+static const struct kobj_type secvar_ktype = {
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.34.1


