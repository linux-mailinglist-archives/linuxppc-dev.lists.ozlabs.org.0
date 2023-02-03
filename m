Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F232F689EBA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 17:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7gNw5dWwz3fDV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:00:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJbZbFv6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJbZbFv6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7gKy73r9z3f65
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 02:58:14 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313EiF1X021184;
	Fri, 3 Feb 2023 15:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wo7Tb3LptoObWpz/saZLrLdh3Gx5qXEfusOJKRb2fmo=;
 b=JJbZbFv6BXMp8HgaGAmROazTICCF4vC/6g3cS7HDTLGQ62//TNxFIKZRlPM8Ubb56gV5
 6VVMV/MHa12Qtw2QDUJJohojkKXUD1wVdmZ0xLceV39qPRBfw8hC9uhrCSMgWN8uG8B7
 GLokBt/TMq/XVjHX+12Cr1dHoZ3fDLXU6A9EK93M/PEN/8V0pZhLSzjxqZh5ENifqh6I
 LY61Zvj9QQOcPUxZyttSlYnZI1s/0z3TRyQKWp2BFJYKK8JPNKy0cA7y4MxYXsM2flWM
 8pXXxuAuw5CKX5/0jGZft2JoDiGIOU34kvMOyhzM0IhCqr+wVRQbHUUyuwCJG0YJeeTK 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh49u9t61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313EjC38024197;
	Fri, 3 Feb 2023 15:58:10 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh49u9t5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:10 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 313FpV9H004994;
	Fri, 3 Feb 2023 15:58:10 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ncvv29hpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 313Fw8Tv39780868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 15:58:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B69E458061;
	Fri,  3 Feb 2023 15:58:08 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4316258056;
	Fri,  3 Feb 2023 15:58:08 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.110.209])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Feb 2023 15:58:08 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3 2/5] hvcs: Use driver groups to manage driver attributes
Date: Fri,  3 Feb 2023 09:57:59 -0600
Message-Id: <20230203155802.404324-3-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
References: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o3XiLjNl6fhvpoXo96qK1R3eflp4Cd-i
X-Proofpoint-ORIG-GUID: YbernrDTxERiCmy45HWPNqc-p-P9nMnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_15,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030142
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
Cc: Brian King <brking@linux.vnet.ibm.com>, mmc@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than manually creating attributes for the hvcs driver,
let the driver core do this for us. This also fixes some hotplug
remove issues and ensures that cleanup of these attributes
is done in the right order.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 0416601357e1..522910716025 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -466,6 +466,13 @@ static ssize_t rescan_store(struct device_driver *ddp, const char * buf,
 
 static DRIVER_ATTR_RW(rescan);
 
+static struct attribute *hvcs_attrs[] = {
+	&driver_attr_rescan.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(hvcs);
+
 static void hvcs_kick(void)
 {
 	hvcs_kicked = 1;
@@ -820,6 +827,7 @@ static struct vio_driver hvcs_vio_driver = {
 	.remove		= hvcs_remove,
 	.name		= hvcs_driver_name,
 	.driver = {
+		.groups = hvcs_groups,
 		.dev_groups = hvcs_dev_groups,
 	},
 };
@@ -1498,13 +1506,6 @@ static int __init hvcs_module_init(void)
 
 	pr_info("HVCS: Driver registered.\n");
 
-	/* This needs to be done AFTER the vio_register_driver() call or else
-	 * the kobjects won't be initialized properly.
-	 */
-	rc = driver_create_file(&(hvcs_vio_driver.driver), &driver_attr_rescan);
-	if (rc)
-		pr_warn("HVCS: Failed to create rescan file (err %d)\n", rc);
-
 	return 0;
 }
 
@@ -1529,8 +1530,6 @@ static void __exit hvcs_module_exit(void)
 	hvcs_pi_buff = NULL;
 	spin_unlock(&hvcs_pi_lock);
 
-	driver_remove_file(&hvcs_vio_driver.driver, &driver_attr_rescan);
-
 	tty_unregister_driver(hvcs_tty_driver);
 
 	hvcs_free_index_list();
-- 
2.31.1

