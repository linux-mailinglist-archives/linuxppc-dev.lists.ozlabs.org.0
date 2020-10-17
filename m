Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C529133B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 18:44:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CD83y02S7zDqnf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 03:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CD82F2pLZzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 03:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=THPvMWyC; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CD82F1ZVMz8tWl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 03:42:29 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CD82F12xnz9sTc; Sun, 18 Oct 2020 03:42:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=THPvMWyC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CD82D1YN9z9sSf;
 Sun, 18 Oct 2020 03:42:27 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09HGVSWA003914; Sat, 17 Oct 2020 12:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=TJrrx6CbW4YGaKcttkF/rcLBpQLzi/KpdcKJxAa+Ij4=;
 b=THPvMWyCTKR4OuVfQbFpbnRgUF0BWGmsKT3hpyKoOK3vGqHwiB8mDrXIU1aH5hjbWKlZ
 y/yjpLTcd+OGP/rQXGRdaPcB45iz2use388lZZHY3KKTNwWfHa3F5TSjkyv/S/zxaooN
 eUPC2GwNS8lj+4U+KD4qnCdq28hlzyFLTayzPFh3agumtwfRwxGlUEtsHCcJQwZO/UIA
 fZ7A4tc0ofZYgAJHHaWH8LS2eZxtRZxlVqIQSU9BGn9dI0i+uUO0XKZLJODB2xB4Xm5E
 MBBsqTo40Ad1e7qGnpIjuNGcMzUm31SI+iNe4kkO7+rDPSC837LUg3evJC9wKHguYfDd aQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3483wyre32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 12:42:22 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09HGcTfs015532;
 Sat, 17 Oct 2020 16:42:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 347r88086s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 16:42:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09HGgIsu32899362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Oct 2020 16:42:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99A4052050;
 Sat, 17 Oct 2020 16:42:18 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.199.43.235])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 94BBE52052;
 Sat, 17 Oct 2020 16:42:17 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc/powernv/dump: Fix race while processing OPAL dump
Date: Sat, 17 Oct 2020 22:12:10 +0530
Message-Id: <20201017164210.264619-1-hegdevasant@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-17_11:2020-10-16,
 2020-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010170111
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
 arch/powerpc/platforms/powernv/opal-dump.c | 41 +++++++++++++++-------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 543c816fa99e..0e6693bacb7e 100644
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
-	if (rc) {
+	if (rc == 0) {
+		kobject_uevent(&dump->kobj, KOBJ_ADD);
+
+		pr_info("%s: New platform dump. ID = 0x%x Size %u\n",
+			__func__, dump->id, dump->size);
+	} else {
+		/* Drop reference count taken for bin file */
 		kobject_put(&dump->kobj);
-		return NULL;
 	}
 
-	pr_info("%s: New platform dump. ID = 0x%x Size %u\n",
-		__func__, dump->id, dump->size);
-
-	kobject_uevent(&dump->kobj, KOBJ_ADD);
-
-	return dump;
+	/* Drop our reference */
+	kobject_put(&dump->kobj);
+	return;
 }
 
 static irqreturn_t process_dump(int irq, void *data)
-- 
2.26.2

