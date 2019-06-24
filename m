Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FAB50EEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 16:44:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XXBN6kvDzDqCh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 00:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XX7C4Vy8zDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 00:41:58 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OEaKxJ111832
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:41:54 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tb0ak0uva-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:41:54 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 24 Jun 2019 15:41:51 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 15:41:50 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5OEfeHE31326546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 14:41:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 487794C04A;
 Mon, 24 Jun 2019 14:41:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F2B04C044;
 Mon, 24 Jun 2019 14:41:49 +0000 (GMT)
Received: from pic2.home (unknown [9.145.155.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 14:41:48 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com, groug@kaod.org, alastair@au1.ibm.com
Subject: [PATCH] ocxl: Fix concurrent AFU open and device removal
Date: Mon, 24 Jun 2019 16:41:48 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062414-0028-0000-0000-0000037D1EE1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062414-0029-0000-0000-0000243D3C8B
Message-Id: <20190624144148.32022-1-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240118
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an ocxl device is unbound through sysfs at the same time its AFU is
being opened by a user process, the open code may dereference freed
stuctures, which can lead to kernel oops messages. You'd have to hit a
tiny time window, but it's possible. It's fairly easy to test by
making the time window bigger artificially.

Fix it with a combination of 2 changes:
- when an AFU device is found in the IDR by looking for the device
minor number, we should hold a reference on the device until after the
context is allocated. A reference on the AFU structure is kept when
the context is allocated, so we can release the reference on the
device after the context allocation.
- with the fix above, there's still another even tinier window,
between the time the AFU device is found in the IDR and the reference
on the device is taken. We can fix this one by removing the IDR entry
earlier, when the device setup is removed, instead of waiting for the
'release' device callback. With proper locking around the IDR.

Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
mpe: this fixes a commit merged in v5.2-rc1. It's late, and I don't think it's that important. If it's for the next merge window, I would add:
Cc: stable@vger.kernel.org      # v5.2


drivers/misc/ocxl/file.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index 2870c25da166..4d1b44de1492 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -18,18 +18,15 @@ static struct class *ocxl_class;
 static struct mutex minors_idr_lock;
 static struct idr minors_idr;
 
-static struct ocxl_file_info *find_file_info(dev_t devno)
+static struct ocxl_file_info *find_and_get_file_info(dev_t devno)
 {
 	struct ocxl_file_info *info;
 
-	/*
-	 * We don't declare an RCU critical section here, as our AFU
-	 * is protected by a reference counter on the device. By the time the
-	 * info reference is removed from the idr, the ref count of
-	 * the device is already at 0, so no user API will access that AFU and
-	 * this function can't return it.
-	 */
+	mutex_lock(&minors_idr_lock);
 	info = idr_find(&minors_idr, MINOR(devno));
+	if (info)
+		get_device(&info->dev);
+	mutex_unlock(&minors_idr_lock);
 	return info;
 }
 
@@ -58,14 +55,16 @@ static int afu_open(struct inode *inode, struct file *file)
 
 	pr_debug("%s for device %x\n", __func__, inode->i_rdev);
 
-	info = find_file_info(inode->i_rdev);
+	info = find_and_get_file_info(inode->i_rdev);
 	if (!info)
 		return -ENODEV;
 
 	rc = ocxl_context_alloc(&ctx, info->afu, inode->i_mapping);
-	if (rc)
+	if (rc) {
+		put_device(&info->dev);
 		return rc;
-
+	}
+	put_device(&info->dev);
 	file->private_data = ctx;
 	return 0;
 }
@@ -487,7 +486,6 @@ static void info_release(struct device *dev)
 {
 	struct ocxl_file_info *info = container_of(dev, struct ocxl_file_info, dev);
 
-	free_minor(info);
 	ocxl_afu_put(info->afu);
 	kfree(info);
 }
@@ -577,6 +575,7 @@ void ocxl_file_unregister_afu(struct ocxl_afu *afu)
 
 	ocxl_file_make_invisible(info);
 	ocxl_sysfs_unregister_afu(info);
+	free_minor(info);
 	device_unregister(&info->dev);
 }
 
-- 
2.21.0

