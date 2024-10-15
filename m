Return-Path: <linuxppc-dev+bounces-2277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38999E4EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 13:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSWPb3VR2z3blR;
	Tue, 15 Oct 2024 22:01:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728990099;
	cv=none; b=NadmVYAb+cC5+xhUbnYkUEyL5Ngr1do7ZF5pbrwjWIdfR1tCgZkkONuyis6MWkit8HuVAh/u4hdu21RnYIcUtVvWA1PJLvqWO5tQwcMdvQ0QBPlZp1TvEskrfdR33gFUeHNwL1Y1Qbv9hBRI//Eu7czudDcgok4OBVFDPp6vOtPpuYAiqIiw+7oEiBEWkIyUSV80N/wGe4aRENjLHA6c0fkB8keDpfZ/noAm/8jB31RiUYEKU6eYuBgJVZMcwehyFoVTLVZsa3KK+EIW7VWgM+yC1K0GTAEW466kyutzYQaZfUOXgqNmz6Wmq/XkRj0nZnqgK5Y2RLju1PjVK2C+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728990099; c=relaxed/relaxed;
	bh=LB7FsJPHDA9rdk+4dKBXnIGSzRIi5liTlRKzH/4/ncU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTfOOkhRCPS7qwOn/xqTZRe72hut9sLJ/ibgrPU1Ih3o20iR4/aZ9ooLUnDcFn88IeavqaTPWCH7OL4HlauHWaMp1xAcU61q7k7/0XVK56XAJRXfESkBIq4yUABMCCTZy/PQIGLjObeZ2h88PDeKGDD/BS11jWTjWDbBivw+BvYMAJUDNar2IOUUsN60oeUcjgDyRh5T5HavtaLAZXyakDWai7a6hb9LrooSo4b67AjedmOwFzcaqIq/CsA0qiS9jq36MVTtnAnxuFuIvsiyN8wln91jc+2f1R2qgoEzjzZx8b4U01QqoRGreyzctnprxN6YaIpYIOhskBN+9JONfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDYfLvVt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDYfLvVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSWPZ3Sfcz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 22:01:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9t14A030685;
	Tue, 15 Oct 2024 10:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LB7FsJPHDA9rdk+4dKBXnIGSzRIi5liTlRKzH/4/n
	cU=; b=QDYfLvVtbTCXEAVj649bpIuroNr6bXtbQQkjwPE2oJm246L/+uhvxUNQ8
	gTjRSZctmAgCvPqNadCAGqg+uCK/O5SBVaEKuQ5XtjXgetOYIsF1vms6bT9NDqe2
	CCnNaRMVaeYycfWVxOUlxHS77OivI14Zvrl4I0tMvKpt8C/omfth3kszISa4JXpA
	w7mUFsYe5+RxdPWmUdk+w5qUx5auxW6rU2/EkHmIGPpNUwX2JgUfcdInaEbiXsx0
	zm8xxXwNyYqH4r+XMIYjQK3S3i4vQChvFlz5tNXJ0vRYRKSV2Ku6RuS28I3U/LPX
	lNFEnEZvd/Kcy4mqzWJywXko3dyDQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429p6d092k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:56:24 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49FAuNdR017447;
	Tue, 15 Oct 2024 10:56:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429p6d092c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:56:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49F7WVeK002408;
	Tue, 15 Oct 2024 10:56:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284emkc5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:56:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49FAuHrs50856252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 10:56:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0D3A20063;
	Tue, 15 Oct 2024 10:56:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3057320040;
	Tue, 15 Oct 2024 10:56:15 +0000 (GMT)
Received: from vishalc-ibm.ibmuc.com (unknown [9.39.24.36])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Oct 2024 10:56:14 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Vishal Chourasia <vishalc@linux.ibm.com>
Subject: [v2 PATCH 1/2] crypto/nx: Rename devdata_mutex to devdata_spinlock
Date: Tue, 15 Oct 2024 16:25:51 +0530
Message-ID: <20241015105551.1817348-2-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HKfRnHAqL1xiFkXwLc3bSU4HDEzsYXU-
X-Proofpoint-ORIG-GUID: nU97NAV6X78iUj4JyH_ltF9gpyi0-IwX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxlogscore=928 spamscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150072
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rename devdata_mutex to devdata_spinlock to accurately reflect its
implementation as a spinlock.

[1] v1 https://lore.kernel.org/all/ZwyqD-w5hEhrnqTB@linux.ibm.com

Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 drivers/crypto/nx/nx-common-pseries.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 35f2d0d8507ed..a0eb900383af7 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -133,7 +133,7 @@ struct nx842_devdata {
 };
 
 static struct nx842_devdata __rcu *devdata;
-static DEFINE_SPINLOCK(devdata_mutex);
+static DEFINE_SPINLOCK(devdata_spinlock);
 
 #define NX842_COUNTER_INC(_x) \
 static inline void nx842_inc_##_x( \
@@ -750,15 +750,15 @@ static int nx842_OF_upd(struct property *new_prop)
 	if (!new_devdata)
 		return -ENOMEM;
 
-	spin_lock_irqsave(&devdata_mutex, flags);
+	spin_lock_irqsave(&devdata_spinlock, flags);
 	old_devdata = rcu_dereference_check(devdata,
-			lockdep_is_held(&devdata_mutex));
+			lockdep_is_held(&devdata_spinlock));
 	if (old_devdata)
 		of_node = old_devdata->dev->of_node;
 
 	if (!old_devdata || !of_node) {
 		pr_err("%s: device is not available\n", __func__);
-		spin_unlock_irqrestore(&devdata_mutex, flags);
+		spin_unlock_irqrestore(&devdata_spinlock, flags);
 		kfree(new_devdata);
 		return -ENODEV;
 	}
@@ -810,7 +810,7 @@ static int nx842_OF_upd(struct property *new_prop)
 			old_devdata->max_sg_len);
 
 	rcu_assign_pointer(devdata, new_devdata);
-	spin_unlock_irqrestore(&devdata_mutex, flags);
+	spin_unlock_irqrestore(&devdata_spinlock, flags);
 	synchronize_rcu();
 	dev_set_drvdata(new_devdata->dev, new_devdata);
 	kfree(old_devdata);
@@ -821,13 +821,13 @@ static int nx842_OF_upd(struct property *new_prop)
 		dev_info(old_devdata->dev, "%s: device disabled\n", __func__);
 		nx842_OF_set_defaults(new_devdata);
 		rcu_assign_pointer(devdata, new_devdata);
-		spin_unlock_irqrestore(&devdata_mutex, flags);
+		spin_unlock_irqrestore(&devdata_spinlock, flags);
 		synchronize_rcu();
 		dev_set_drvdata(new_devdata->dev, new_devdata);
 		kfree(old_devdata);
 	} else {
 		dev_err(old_devdata->dev, "%s: could not update driver from hardware\n", __func__);
-		spin_unlock_irqrestore(&devdata_mutex, flags);
+		spin_unlock_irqrestore(&devdata_spinlock, flags);
 	}
 
 	if (!ret)
@@ -1045,9 +1045,9 @@ static int nx842_probe(struct vio_dev *viodev,
 		return -ENOMEM;
 	}
 
-	spin_lock_irqsave(&devdata_mutex, flags);
+	spin_lock_irqsave(&devdata_spinlock, flags);
 	old_devdata = rcu_dereference_check(devdata,
-			lockdep_is_held(&devdata_mutex));
+			lockdep_is_held(&devdata_spinlock));
 
 	if (old_devdata && old_devdata->vdev != NULL) {
 		dev_err(&viodev->dev, "%s: Attempt to register more than one instance of the hardware\n", __func__);
@@ -1062,7 +1062,7 @@ static int nx842_probe(struct vio_dev *viodev,
 	nx842_OF_set_defaults(new_devdata);
 
 	rcu_assign_pointer(devdata, new_devdata);
-	spin_unlock_irqrestore(&devdata_mutex, flags);
+	spin_unlock_irqrestore(&devdata_spinlock, flags);
 	synchronize_rcu();
 	kfree(old_devdata);
 
@@ -1101,7 +1101,7 @@ static int nx842_probe(struct vio_dev *viodev,
 	return 0;
 
 error_unlock:
-	spin_unlock_irqrestore(&devdata_mutex, flags);
+	spin_unlock_irqrestore(&devdata_spinlock, flags);
 	if (new_devdata)
 		kfree(new_devdata->counters);
 	kfree(new_devdata);
@@ -1122,12 +1122,12 @@ static void nx842_remove(struct vio_dev *viodev)
 
 	crypto_unregister_alg(&nx842_pseries_alg);
 
-	spin_lock_irqsave(&devdata_mutex, flags);
+	spin_lock_irqsave(&devdata_spinlock, flags);
 	old_devdata = rcu_dereference_check(devdata,
-			lockdep_is_held(&devdata_mutex));
+			lockdep_is_held(&devdata_spinlock));
 	of_reconfig_notifier_unregister(&nx842_of_nb);
 	RCU_INIT_POINTER(devdata, NULL);
-	spin_unlock_irqrestore(&devdata_mutex, flags);
+	spin_unlock_irqrestore(&devdata_spinlock, flags);
 	synchronize_rcu();
 	dev_set_drvdata(&viodev->dev, NULL);
 	if (old_devdata)
@@ -1257,11 +1257,11 @@ static void __exit nx842_pseries_exit(void)
 
 	crypto_unregister_alg(&nx842_pseries_alg);
 
-	spin_lock_irqsave(&devdata_mutex, flags);
+	spin_lock_irqsave(&devdata_spinlock, flags);
 	old_devdata = rcu_dereference_check(devdata,
-			lockdep_is_held(&devdata_mutex));
+			lockdep_is_held(&devdata_spinlock));
 	RCU_INIT_POINTER(devdata, NULL);
-	spin_unlock_irqrestore(&devdata_mutex, flags);
+	spin_unlock_irqrestore(&devdata_spinlock, flags);
 	synchronize_rcu();
 	if (old_devdata && old_devdata->dev)
 		dev_set_drvdata(old_devdata->dev, NULL);
-- 
2.47.0


