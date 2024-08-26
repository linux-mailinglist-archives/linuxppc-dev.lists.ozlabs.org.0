Return-Path: <linuxppc-dev+bounces-547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9326695FBDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt3y92Htyz2y8W;
	Tue, 27 Aug 2024 07:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724685621;
	cv=none; b=PmSW/rJcpla8p1pPnT5hq0uoJiqsT93BtQfXsXc24jm1aCNxK+YCt9BSDT3Jn90beJvEBA/ibaTLx6wqMP5w0QWWEz2QZ6fvXrZ26+2lQsV/9yVMaRv1H0BNH/Eh7z4D/TgyUPGiSBx9SZJzoBWhcyascCoJ/uIoLWY9I+lT2RQToslL3PkYNv655/wTTcj5Tv1nePUA4LR6d2Swf0DF/0xE4PQ28QZtCDfVjGSF04IBpwRQYyQ8Lww73Loe2UB6IxseOk6AY5omxQWSja0cBrR4pMpzm31gFE2AdlsyGmHjj+tlqvuCjpKbpWjAcOeVtpVaf/ekzvzVhfJqiOdp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724685621; c=relaxed/relaxed;
	bh=a7lprmUU0TqJPbcK41GiWiLzgfDo/mGb+mtxGIXHIBM=;
	h=X-Greylist:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=CR/rmAXWTfpvYRyMyHehOLKc668la/sD8wmnpc+byGIrkmqKuGxWC8eJigA2OVExnG5y9tmB1edJnde/rgGKkJhI6H1EjS632x7CUAdlGjLZMHLTm5JRrE7drrsLgh3pdZ575zry5pkLHhfb8I7nROQkA+b635FIdGaVmgkWZR80eHEnkz0/95uT+jo/EsUQhWqbLq2QrSktA+pnYH+Oh+Pf0JFq39DtaVVsYeyXZLcP8UdNl2CW0aMm+fmR4ViF+rNy3/kPjSpajknO4VSR65y6V/9ZX0jPqxWAWAwdmcrxNgHEvoFGD5H8khzFs9mki4ZQMrzJELBVGEYYodw9JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=huangxiaojia2@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=huangxiaojia2@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1086 seconds by postgrey-1.37 at boromir; Tue, 27 Aug 2024 01:20:21 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsvW9073tz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:20:17 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wsv564GTBz14JcT;
	Mon, 26 Aug 2024 23:01:14 +0800 (CST)
Received: from dggpemm500021.china.huawei.com (unknown [7.185.36.109])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D504180101;
	Mon, 26 Aug 2024 23:02:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500021.china.huawei.com
 (7.185.36.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 23:02:00 +0800
From: Huang Xiaojia <huangxiaojia2@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <yuehaibing@huawei.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <huangxiaojia2@huawei.com>
Subject: [PATCH -next 2/3] powerpc: powernv: Constify struct kobj_type
Date: Mon, 26 Aug 2024 23:09:56 +0800
Message-ID: <20240826150957.3500237-2-huangxiaojia2@huawei.com>
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
   3775	    256	      8	   4039	    fc7	arch/powerpc/platforms/powernv/opal-dump.o
   2679	    260	      8	   2947	    b83	arch/powerpc/platforms/powernv/opal-elog.o

After:
======
   text	   data	    bss	    dec	    hex	filename
   3823	    208	      8	   4039	    fc7	arch/powerpc/platforms/powernv/opal-dump.o
   2727	    212	      8	   2947	    b83	arch/powerpc/platforms/powernv/opal-elog.o

Signed-off-by: Huang Xiaojia <huangxiaojia2@huawei.com>
---
 arch/powerpc/platforms/powernv/opal-dump.c | 2 +-
 arch/powerpc/platforms/powernv/opal-elog.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 16c5860f1372..608e4b68c5ea 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -210,7 +210,7 @@ static struct attribute *dump_default_attrs[] = {
 };
 ATTRIBUTE_GROUPS(dump_default);
 
-static struct kobj_type dump_ktype = {
+static const struct kobj_type dump_ktype = {
 	.sysfs_ops = &dump_sysfs_ops,
 	.release = &dump_release,
 	.default_groups = dump_default_groups,
diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 554fdd7f88b8..5db1e733143b 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -146,7 +146,7 @@ static struct attribute *elog_default_attrs[] = {
 };
 ATTRIBUTE_GROUPS(elog_default);
 
-static struct kobj_type elog_ktype = {
+static const struct kobj_type elog_ktype = {
 	.sysfs_ops = &elog_sysfs_ops,
 	.release = &elog_release,
 	.default_groups = elog_default_groups,
-- 
2.34.1


