Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAF6889C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 23:31:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7D5d0QLvz3fD4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 09:31:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p3b5qokE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p3b5qokE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7D2Z3yRFz3cCF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 09:28:22 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312KrFZt004389;
	Thu, 2 Feb 2023 22:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AiZTmifYs+4xG39q2dNGwfbChtkRg6LjLeKsv8ePRQI=;
 b=p3b5qokEVw24UZJVoL+BlE16jUCNxH1Jk0q4s01MuCbEJ9WzwA8oqEhTMNu3z4CmZQ/n
 x0n0d17xZX8lqMGGbpmNkc6fT86Xm0K/WAMT7MLmYq7P5o0yzWHaYXAdVm/4AP0yJuOR
 NQXY6eVd9LPJ5eS9JdQJQzKFwFXEE5YN80noVcBsymsCLFrPNC2WQ5YcuoCJ5XaQttVu
 OfZNJ7f93ZxGv8n2KUrXJ2Qi1FWK4tcRWb4YMMsLXzLm9kC4bLWeaKISq3tv4u+IM7DN
 khhdH366LkwH6cgqJSWGnmrwFAG4xE71HLnPZ8S4sBSxIajeLpgzzGzBxbms9aDQMclL ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngkm0bgd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 22:28:19 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 312M0Wlc006476;
	Thu, 2 Feb 2023 22:28:18 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngkm0bgcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 22:28:18 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312LUBrY006449;
	Thu, 2 Feb 2023 22:28:17 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtmw298-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 22:28:17 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312MSGT88192628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 22:28:16 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FEE85804B;
	Thu,  2 Feb 2023 22:28:16 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6B7A58055;
	Thu,  2 Feb 2023 22:28:15 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.158.218])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 22:28:15 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 2/6] hvcs: Use dev_groups to manage hvcs device attributes
Date: Thu,  2 Feb 2023 16:28:00 -0600
Message-Id: <20230202222804.383229-3-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230202222804.383229-1-brking@linux.vnet.ibm.com>
References: <20230202222804.383229-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oFDDLA-gS-oDZzkh7-wPyFIVTAq1wFCX
X-Proofpoint-GUID: 0IgVWNrYR7TZFMejvjX6ouq8GJr3e7Ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020196
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

Use the dev_groups functionality to manage the attribute groups
for hvcs devices. This simplifies the code and also eliminates
errors coming from kernfs when attempting to remove a console
device that is in use.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index faf5ccfc561e..7f79444b4d89 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -432,7 +432,7 @@ static ssize_t hvcs_index_show(struct device *dev, struct device_attribute *attr
 
 static DEVICE_ATTR(index, S_IRUGO, hvcs_index_show, NULL);
 
-static struct attribute *hvcs_attrs[] = {
+static struct attribute *hvcs_dev_attrs[] = {
 	&dev_attr_partner_vtys.attr,
 	&dev_attr_partner_clcs.attr,
 	&dev_attr_current_vty.attr,
@@ -441,8 +441,13 @@ static struct attribute *hvcs_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group hvcs_attr_group = {
-	.attrs = hvcs_attrs,
+static struct attribute_group hvcs_attr_dev_group = {
+	.attrs = hvcs_dev_attrs,
+};
+
+const static struct attribute_group *hvcs_attr_dev_groups[] = {
+	&hvcs_attr_dev_group,
+	NULL,
 };
 
 static ssize_t rescan_show(struct device_driver *ddp, char *buf)
@@ -688,8 +693,6 @@ static void hvcs_destruct_port(struct tty_port *p)
 	spin_unlock_irqrestore(&hvcsd->lock, flags);
 	spin_unlock(&hvcs_structs_lock);
 
-	sysfs_remove_group(&vdev->dev.kobj, &hvcs_attr_group);
-
 	kfree(hvcsd);
 }
 
@@ -721,7 +724,6 @@ static int hvcs_probe(
 {
 	struct hvcs_struct *hvcsd;
 	int index, rc;
-	int retval;
 
 	if (!dev || !id) {
 		printk(KERN_ERR "HVCS: probed with invalid parameter.\n");
@@ -778,13 +780,6 @@ static int hvcs_probe(
 	list_add_tail(&(hvcsd->next), &hvcs_structs);
 	spin_unlock(&hvcs_structs_lock);
 
-	retval = sysfs_create_group(&dev->dev.kobj, &hvcs_attr_group);
-	if (retval) {
-		printk(KERN_ERR "HVCS: Can't create sysfs attrs for vty-server@%X\n",
-		       hvcsd->vdev->unit_address);
-		return retval;
-	}
-
 	printk(KERN_INFO "HVCS: vty-server@%X added to the vio bus.\n", dev->unit_address);
 
 	/*
@@ -831,6 +826,9 @@ static struct vio_driver hvcs_vio_driver = {
 	.probe		= hvcs_probe,
 	.remove		= hvcs_remove,
 	.name		= hvcs_driver_name,
+	.driver = {
+		.dev_groups = hvcs_attr_dev_groups,
+	},
 };
 
 /* Only called from hvcs_get_pi please */
-- 
2.31.1

