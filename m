Return-Path: <linuxppc-dev+bounces-3901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57FE9EA802
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 06:42:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6nfv32Yvz2ytT;
	Tue, 10 Dec 2024 16:41:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733809319;
	cv=none; b=os9xKa3t5dYSvRXeo2fRr17/q3bBhnZgnRgEupio6HWok9r8Q9ye5MkD9oYKuh3/Cso+RRUrJ+kOZRNMRMP8M+lfMuYKPcb09w2Dk9B5hc1gW/www380xxPPY7VhGpRWnQu+xD9W14L1ppN8Z/nFULV9kinvlDkt6JSSNaQtrdRbFDq024aqx1ENtNtPUpxDTeqdTZnkJKWFOZ1eI7QrnNTcdET8r+A9ZnIYnnPU1qgI5JlCuXEgPVPA0NAo6VrKYHrdg580X51W6rPK7tyG1ZqOQuw6Ig5jU4qb3gogno7OGzcycaM5pfBwCX8DOlHCJCbaXSGcIW0jDN3BD4v3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733809319; c=relaxed/relaxed;
	bh=9b7d+qyvkKmlZann7J+1XFkGmFtpdtEdxyDOAxkGRuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbo+8gDYYPcs3ksn6y482H2/ug+mXbMxLIY4CFDUr4twLzbauQoHNkIX7T8UOls5x1KTrnof1fl93iDb032tQxZ/RqeuAkFFM1O88LiY3Sj6Yj0Tq2ngSZDByolz9l6a00grgcFJsXsyC24F94WmNp3vN2vPOBcYunCF5lQUpS1k+W0fXG1J9Bx/9lbQ0Y5qJSUMfbJ+1Z62Ot0myvJtlZTNRbdzSGUVnq/kp6FD3S9cLthT2LIRl+3/9ihxjnKqHrBJ1HM4tjk5DxGXQnjecTZYBDy9GYTE5tFuURHoPi5t+lKDKrtBP2DN0xAkGJVOL3yUgd4fWlqTlzvVwbF4yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HFKtCLIt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HFKtCLIt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nft4c96z2yhn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 16:41:58 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9MLtEY018470;
	Tue, 10 Dec 2024 05:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9b7d+qyvkKmlZann7
	J+1XFkGmFtpdtEdxyDOAxkGRuc=; b=HFKtCLItxw+KCK/uI1qeGE3R6e6tNmeAI
	qIUNQueHcNFM6zsGep6lJ9UwqgGMwlrMwQWK7wyhaDFmA02y5OS13cv3M5wsmh9f
	4oVdoaluCLgI57+Q1UpWnhpaomo4cS/9pShC7kELqlSEr/70/DJSho7+axxDjuCl
	fc/2gd8QeO7yFmyvHgWlWtEr20KdgQ+rLZM0CKPj3r/8qwfuWG5Co3H0l/VwNKNI
	NCvmbaxYBxtnLda1MDjkhbdHJ9kthkSLF8YMD0D30biH/+6ppRd6b4KzFZg8H6Hr
	drQ+klz8LDzvPwZZqx8imiqzVo4XXdRzb2BvfdZGqrrqfyBpQ1cZg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cbsq4jjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:41:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA4trxY017369;
	Tue, 10 Dec 2024 05:41:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d3d1hu7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:41:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BA5frog65601834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 05:41:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48BBD20043;
	Tue, 10 Dec 2024 05:41:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C4E20040;
	Tue, 10 Dec 2024 05:41:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 05:41:52 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.5.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 438FC60AF0;
	Tue, 10 Dec 2024 16:41:47 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, ukrishn@linux.ibm.com,
        manoj@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com
Subject: [PATCH 2/2] scsi/cxlflash: Deprecate driver
Date: Tue, 10 Dec 2024 16:40:55 +1100
Message-ID: <20241210054055.144813-3-ajd@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ZpxFikb_j4vs-7Bvs-T4OsDSdT_Ho2Al
X-Proofpoint-GUID: ZpxFikb_j4vs-7Bvs-T4OsDSdT_Ho2Al
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=625 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

We intend to remove the cxlflash driver in an upcoming release. It is
already marked as Obsolete in MAINTAINERS.

The cxlflash driver has received minimal maintenance for some time, and
the CAPI Flash hardware that uses it is no longer commercially available.

Add a warning message on probe and change Kconfig to label the driver as
deprecated and not build the driver by default.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 drivers/scsi/cxlflash/Kconfig | 6 ++++--
 drivers/scsi/cxlflash/main.c  | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/cxlflash/Kconfig b/drivers/scsi/cxlflash/Kconfig
index 5533bdcb0458..c424d36e89a6 100644
--- a/drivers/scsi/cxlflash/Kconfig
+++ b/drivers/scsi/cxlflash/Kconfig
@@ -4,10 +4,12 @@
 #
 
 config CXLFLASH
-	tristate "Support for IBM CAPI Flash"
+	tristate "Support for IBM CAPI Flash (DEPRECATED)"
 	depends on PCI && SCSI && (CXL || OCXL) && EEH
 	select IRQ_POLL
-	default m
 	help
+	  The cxlflash driver is deprecated and will be removed in a future
+	  kernel release.
+
 	  Allows CAPI Accelerated IO to Flash
 	  If unsure, say N.
diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
index 60d62b93d624..62806f5e32e6 100644
--- a/drivers/scsi/cxlflash/main.c
+++ b/drivers/scsi/cxlflash/main.c
@@ -3651,6 +3651,8 @@ static int cxlflash_probe(struct pci_dev *pdev,
 	int rc = 0;
 	int k;
 
+	dev_err_once(&pdev->dev, "DEPRECATION: cxlflash is deprecated and will be removed in a future kernel release\n");
+
 	dev_dbg(&pdev->dev, "%s: Found CXLFLASH with IRQ: %d\n",
 		__func__, pdev->irq);
 
-- 
2.47.1


