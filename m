Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA39285CB6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 12:19:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5r110H6GzDqKh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 21:19:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5qzB1FfmzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 21:17:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gUXbcNF0; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C5qz94bmBz8tYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 21:17:57 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C5qz93bRDz9sTm; Wed,  7 Oct 2020 21:17:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gUXbcNF0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C5qz821p9z9sSf;
 Wed,  7 Oct 2020 21:17:55 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097A2arW154036; Wed, 7 Oct 2020 06:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/7MDLueO9/C/YAJx6bS62ZLEcClh+ZIoJyLtW3j1Pig=;
 b=gUXbcNF0IVcORkhvCqVpKYwPn4B2aqhelozSFsWWlFnjwRESr+vZQRlS4VEP5CXe/3+3
 J2YhwyKZcDTC27FxH3b+pwUgIuPdtu+QBgr0npszc0cy1WzjcLeLkvz4WVtWRAXotTJD
 gQREAFDCvIS1WQ7Vj3/7P8CrdFFWoYx11xMgtvuyPGgHdBG8kA5J5MnOh4lXhHk+9gX4
 TqNh4QP/bhrLaubzpwMFlXi32Zhyw0ihXI+KUXFoc7S5VBlLdtlt9HuSh4MfK7jljbwr
 tpSRjd2M4iiyeox8urpshBdi0AAbBiZ5ijx0y8KhM6afO3cOoVDf4fFDP04FuUWDJk4G 9w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341auh9tpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 06:17:52 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097AHpRK031827;
 Wed, 7 Oct 2020 10:17:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 33xgx8a5jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 10:17:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097AHmxJ26345968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 10:17:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E3F6A4062;
 Wed,  7 Oct 2020 10:17:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39815A4064;
 Wed,  7 Oct 2020 10:17:47 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.85.85.113])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 10:17:46 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/powernv/dump: Fix race while processing OPAL dump
Date: Wed,  7 Oct 2020 15:47:42 +0530
Message-Id: <20201007101742.40757-1-hegdevasant@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_05:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=3
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070065
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Every dump reported by OPAL is exported to userspace through a sysfs
interface and notified using kobject_uevent(). The userspace daemon
(opal_errd) then reads the dump and acknowledges that the dump is
saved safely to disk. Once acknowledged the kernel removes the
respective sysfs file entry causing respective resources to be
released including kobject.

However it's possible the userspace daemon may already be scanning
dump entries when a new sysfs dump entry is created by the kernel.
User daemon may read this new entry and ack it even before kernel can
notify userspace about it through kobject_uevent() call. If that
happens then we have a potential race between
dump_ack_store->kobject_put() and kobject_uevent which can lead to
use-after-free of a kernfs object resulting in a kernel crash.

This patch fixes this race by protecting the sysfs file
creation/notification by holding a reference count on kobject until we
safely send kobject_uevent().

The function create_dump_obj() returns the dump object which if used
by caller function will end up in use-after-free problem again.
However, the return value of create_dump_obj() function isn't being
used today and there is no need as well. Hence change it to return
void to make this fix complete.

Fixes: c7e64b9c ("powerpc/powernv Platform dump interface")
CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-dump.c | 31 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 543c816fa99e..7e6eeedec32b 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -318,15 +318,14 @@ static ssize_t dump_attr_read(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
-static struct dump_obj *create_dump_obj(uint32_t id, size_t size,
-					uint32_t type)
+static void create_dump_obj(uint32_t id, size_t size, uint32_t type)
 {
 	struct dump_obj *dump;
 	int rc;
 
 	dump = kzalloc(sizeof(*dump), GFP_KERNEL);
 	if (!dump)
-		return NULL;
+		return;
 
 	dump->kobj.kset = dump_kset;
 
@@ -346,21 +345,39 @@ static struct dump_obj *create_dump_obj(uint32_t id, size_t size,
 	rc = kobject_add(&dump->kobj, NULL, "0x%x-0x%x", type, id);
 	if (rc) {
 		kobject_put(&dump->kobj);
-		return NULL;
+		return;
 	}
 
+	/*
+	 * As soon as the sysfs file for this dump is created/activated there is
+	 * a chance the opal_errd daemon (or any userspace) might read and
+	 * acknowledge the dump before kobject_uevent() is called. If that
+	 * happens then there is a potential race between
+	 * dump_ack_store->kobject_put() and kobject_uevent() which leads to a
+	 * use-after-free of a kernfs object resulting in a kernel crash.
+	 *
+	 * To avoid that, we need to take a reference on behalf of the bin file,
+	 * so that our reference remains valid while we call kobject_uevent().
+	 * We then drop our reference before exiting the function, leaving the
+	 * bin file to drop the last reference (if it hasn't already).
+	 */
+
+	/* Take a reference for the bin file */
+	kobject_get(&dump->kobj);
 	rc = sysfs_create_bin_file(&dump->kobj, &dump->dump_attr);
 	if (rc) {
 		kobject_put(&dump->kobj);
-		return NULL;
+		/* Drop reference count taken for bin file */
+		kobject_put(&dump->kobj);
+		return;
 	}
 
 	pr_info("%s: New platform dump. ID = 0x%x Size %u\n",
 		__func__, dump->id, dump->size);
 
 	kobject_uevent(&dump->kobj, KOBJ_ADD);
-
-	return dump;
+	/* Drop reference count taken for bin file */
+	kobject_put(&dump->kobj);
 }
 
 static irqreturn_t process_dump(int irq, void *data)
-- 
2.26.2

