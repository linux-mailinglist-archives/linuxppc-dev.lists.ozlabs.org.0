Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2E681E5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 23:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Nbz1XkDz3f5Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g5jT/Q+3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g5jT/Q+3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NWz1h1jz2xkm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 09:43:58 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ULKdeT004111
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2xwKp84M79wmucUQK2UjfTEtoLiOx5WCvSxnoWSN6LM=;
 b=g5jT/Q+3yBW2SE5FI3V9DQv3QPAAQyjGOGWgANIesv+jupxIDEgX9iN9xgDhyo2E4GYU
 MQJpTTm259vo6hJYvwIr6kntcih+nrVzmasSxsCNMXO6FcP+eGr6IgXQbH1Qxrtu6yuc
 7VM9D3SvccSb5l5CcW+4Hd1xlBaz1hqqIZHlZetZ6pb76RzEuHpfhZmhZ4q3fZPP/zob
 5lu5dLXanIQXspV5CW5ZcOFpGnWFu4l+u6HcACoTYcas+MYskmXobrgGzVXYg8mEj40Z
 dO1qo4onmKIe+ExLYY1fseVyjMnAYetPq4LHvdkxP1vqw0nNOW4rxEbb9EKQJyRAZGHE Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nenqq1r64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:55 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UMcuuF030921
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nenqq1r5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 22:43:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ULUKMN006475;
	Mon, 30 Jan 2023 22:43:54 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtm86cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 22:43:54 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30UMhrex41550318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 22:43:53 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 097065805F;
	Mon, 30 Jan 2023 22:43:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D81F58043;
	Mon, 30 Jan 2023 22:43:52 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.163.39.106])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jan 2023 22:43:52 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/7] hvcs: Remove sysfs file prior to vio unregister
Date: Mon, 30 Jan 2023 16:43:16 -0600
Message-Id: <20230130224321.164843-3-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
References: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jHCAQCGRFUaH0Cc8hj7Ghur9ZZ_nKc7Y
X-Proofpoint-GUID: sI34prKdPvMbRyuPn6QtfYwrh223kE8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 adultscore=0 mlxlogscore=934 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300206
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
Cc: Brian King <brking@linux.vnet.ibm.com>, mmc@linux.vnet.ibm.com, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves the removal of the rescan sysfs attribute to occur
before the call to unregister the vio to ensure the removal
does not fail due to the vio driver already being freed.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index faf5ccfc561e..9131dcb2e8d8 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -1519,6 +1519,8 @@ static int __init hvcs_module_init(void)
 
 static void __exit hvcs_module_exit(void)
 {
+	driver_remove_file(&hvcs_vio_driver.driver, &driver_attr_rescan);
+
 	/*
 	 * This driver receives hvcs_remove callbacks for each device upon
 	 * module removal.
@@ -1538,8 +1540,6 @@ static void __exit hvcs_module_exit(void)
 	hvcs_pi_buff = NULL;
 	spin_unlock(&hvcs_pi_lock);
 
-	driver_remove_file(&hvcs_vio_driver.driver, &driver_attr_rescan);
-
 	tty_unregister_driver(hvcs_tty_driver);
 
 	hvcs_free_index_list();
-- 
2.31.1

