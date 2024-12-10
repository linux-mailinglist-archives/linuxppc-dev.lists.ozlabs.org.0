Return-Path: <linuxppc-dev+bounces-3899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3A9EA7FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 06:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6nfr3qJ3z2yjb;
	Tue, 10 Dec 2024 16:41:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733809316;
	cv=none; b=LWUXVNA7qUr3UI2o/Kgsa807vRwLZdZjBVTZd2+GO3o6hDXXQL29LRIeG7oK9xj3LQarpN+qpTiFBqrQXeINSAFcCVLiImi+L0iN7U8ADZWAUnQJWOYA06Sal6eG5n6kqBG/ubkr4rT83qgR22j7f8c4LnL54xzxff76fx3yQgL8M1UAy0qlOvzBqxn33k3vrpcjnooDZGuS7zEp+Ln0RiKcTYIByujtASJysWsxfrPCesyeS+Ppom6cm91oiKr2nsnQ6izlclcesfd7ruoDy9tGqaRnsQUWtDkDZCknKlVxSreM1+ZA5gn1tQra54pFngNTZky6rv5AnveIf0m1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733809316; c=relaxed/relaxed;
	bh=WCHpOB2dijxIicf69mD0X9a9sLWniS13w4MUVHZV6NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzQgEHUUOB3NAa8TAHFSl4IbeD3nd9jylhOLyXx3bqs6wVYAIF4Q88Y2gbNo57dLtsrRHsvvIJr5QRAbTwws2MqiyX9kLBrzEuAzv7HOUQzlqwxSgdqE82SMDgZQpVWl8RmafLila7bHtfQkaQCU1IAlPaVNMG4cW/2H/GA7vuGkfL8ViBqH9+nyFGPIxbHnoRhEGQOVly3X+iwM051D6cNJYIq1XHRWKN8TeGkYzoqUgqIteZZKXW4p6u1ytqQ/oSPTCL7SwjeEISE+cnogxcRqqNX/1pH8k45I2Gvps0MYcZ3jmyO118fG0+AODxGya8vyJLE9J8xqhZyVpRs4uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BXjTx5Xf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BXjTx5Xf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nfq18rCz2yZ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 16:41:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GOBP5024510;
	Tue, 10 Dec 2024 05:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=WCHpOB2dijxIicf69
	mD0X9a9sLWniS13w4MUVHZV6NY=; b=BXjTx5Xfgj2h6WSFeybnhOZhCPuOSRK9d
	SqaBIdMqdDbfJ8WjGLNXyFk3vevb1geaqIZScAxnpGmd3QzBB+sdtkSMSmoihO+u
	ahAa0xznJ1LWHmDg69u3OkDe2GZC5UjDbFTOPTFJoG34WMvEKtzwR+m+bKIuFwYo
	mHz8HgDat+Vu+Uss7Eo8cyiVL8ZWZhfvadV7ggQmI0F4OhrG/9kYiqH/kfy3Ocff
	siwVzC6WnURPWUvRCfnsjO8ysBlv3rZ3x4nq4EmkPBWfJuF1kijWa3QsdNjpPX+E
	kqVcl/PfhZ8ZQxcBEYfDm9MHKmYuS2+TvtAVxmK2PGT2RDlg8m2TQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsjcc18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:41:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA21PUn000358;
	Tue, 10 Dec 2024 05:41:51 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0psad02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:41:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BA5fnwU18153866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 05:41:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D81C020043;
	Tue, 10 Dec 2024 05:41:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 174D220040;
	Tue, 10 Dec 2024 05:41:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 05:41:49 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.5.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CB98B60ADE;
	Tue, 10 Dec 2024 16:41:44 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, ukrishn@linux.ibm.com,
        manoj@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com
Subject: [PATCH 1/2] cxl: Deprecate driver
Date: Tue, 10 Dec 2024 16:40:54 +1100
Message-ID: <20241210054055.144813-2-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210054055.144813-1-ajd@linux.ibm.com>
References: <20241210054055.144813-1-ajd@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uVn_5-KbzRBUi20CBngvoN0zj4zJLrRZ
X-Proofpoint-ORIG-GUID: uVn_5-KbzRBUi20CBngvoN0zj4zJLrRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The cxl driver is no longer actively maintained and we intend to remove it
in a future kernel release.

cxl has received minimal maintenance for several years, and is not
supported on the Power10 processor. We aren't aware of any users who are
likely to be using recent kernels.

Change its MAINTAINERS status to obsolete, update the sysfs ABI
documentation accordingly, add a warning message on device probe, change
the Kconfig options to label it as deprecated, and don't build it by
default.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 Documentation/ABI/{testing => obsolete}/sysfs-class-cxl | 3 +++
 MAINTAINERS                                             | 4 ++--
 drivers/misc/cxl/Kconfig                                | 6 ++++--
 drivers/misc/cxl/of.c                                   | 2 ++
 drivers/misc/cxl/pci.c                                  | 2 ++
 5 files changed, 13 insertions(+), 4 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-class-cxl (99%)

diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/obsolete/sysfs-class-cxl
similarity index 99%
rename from Documentation/ABI/testing/sysfs-class-cxl
rename to Documentation/ABI/obsolete/sysfs-class-cxl
index cfc48a87706b..8cba1b626985 100644
--- a/Documentation/ABI/testing/sysfs-class-cxl
+++ b/Documentation/ABI/obsolete/sysfs-class-cxl
@@ -1,3 +1,6 @@
+The cxl driver is no longer maintained, and will be removed from the kernel in
+the near future.
+
 Please note that attributes that are shared between devices are stored in
 the directory pointed to by the symlink device/.
 For example, the real path of the attribute /sys/class/cxl/afu0.0s/irqs_max is
diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..1737a8ff4f2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6228,8 +6228,8 @@ CXL (IBM Coherent Accelerator Processor Interface CAPI) DRIVER
 M:	Frederic Barrat <fbarrat@linux.ibm.com>
 M:	Andrew Donnellan <ajd@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Supported
-F:	Documentation/ABI/testing/sysfs-class-cxl
+S:	Obsolete
+F:	Documentation/ABI/obsolete/sysfs-class-cxl
 F:	Documentation/arch/powerpc/cxl.rst
 F:	arch/powerpc/platforms/powernv/pci-cxl.c
 F:	drivers/misc/cxl/
diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
index 5efc4151bf58..15307f5e4307 100644
--- a/drivers/misc/cxl/Kconfig
+++ b/drivers/misc/cxl/Kconfig
@@ -9,11 +9,13 @@ config CXL_BASE
 	select PPC_64S_HASH_MMU
 
 config CXL
-	tristate "Support for IBM Coherent Accelerators (CXL)"
+	tristate "Support for IBM Coherent Accelerators (CXL) (DEPRECATED)"
 	depends on PPC_POWERNV && PCI_MSI && EEH
 	select CXL_BASE
-	default m
 	help
+	  The cxl driver is deprecated and will be removed in a future
+	  kernel release.
+
 	  Select this option to enable driver support for IBM Coherent
 	  Accelerators (CXL).  CXL is otherwise known as Coherent Accelerator
 	  Processor Interface (CAPI).  CAPI allows accelerators in FPGAs to be
diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index cf6bd8a43056..e26ee85279fa 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -295,6 +295,8 @@ int cxl_of_probe(struct platform_device *pdev)
 	int ret;
 	int slice = 0, slice_ok = 0;
 
+	dev_err_once(&pdev->dev, "DEPRECATION: cxl is deprecated and will be removed in a future kernel release\n");
+
 	pr_devel("in %s\n", __func__);
 
 	np = pdev->dev.of_node;
diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
index 3d52f9b92d0d..92bf7c5c7b35 100644
--- a/drivers/misc/cxl/pci.c
+++ b/drivers/misc/cxl/pci.c
@@ -1726,6 +1726,8 @@ static int cxl_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	int slice;
 	int rc;
 
+	dev_err_once(&dev->dev, "DEPRECATED: cxl is deprecated and will be removed in a future kernel release\n");
+
 	if (cxl_pci_is_vphb_device(dev)) {
 		dev_dbg(&dev->dev, "cxl_init_adapter: Ignoring cxl vphb device\n");
 		return -ENODEV;
-- 
2.47.1


