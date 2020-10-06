Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 196F8284545
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 07:26:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C55Xs3gnSzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 16:26:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C55W4744PzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 16:24:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CKMzlPc2; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C55W45vV0z8tWb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 16:24:32 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C55W45N0jz9sSG; Tue,  6 Oct 2020 16:24:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CKMzlPc2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C55W42502z9s1t
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Oct 2020 16:24:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09651dVl188108
 for <linuxppc-dev@ozlabs.org>; Tue, 6 Oct 2020 01:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=73hSblmBAeh+P5TYguzSurlyJN1SnOQdHPaOiZmRTdU=;
 b=CKMzlPc2In8YuX8CcTWHhzNSnToDo/1DUj1QVxrAZnlAfE6NNXx12bLgUjrCwgY1feKd
 u6pA+NPw5+uUVt0+dwF1T92iZUd7UJQMx3rPkeddl//U+Dcr26AwWI/Ce8uekZTV0sYb
 ZbFq6XXhJ5i6/jFgwbZCL4294IYKxlpGrrMV1eKrNITv9H5mCT46fCrqIYQpZkjTX8zt
 BUhBUE2RIDT9p6q4FM2kOF+iKwyUuj2mOdmxNZBVN3siGMHQACy4ux49HgQYPV3eARE0
 iohOvpFEMXj+NVAJL/rmw8jzNW9VgyIk1bKgIj+UvI7w9+e5EyagimXevuxV8pzXzFct rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340j2m8j41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 06 Oct 2020 01:24:30 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09653iF0004560
 for <linuxppc-dev@ozlabs.org>; Tue, 6 Oct 2020 01:24:29 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340j2m8j3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 01:24:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0965I9Fn012291;
 Tue, 6 Oct 2020 05:24:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 33xgx82v5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 05:24:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0965OOGW25231620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 05:24:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56BCFAE05D;
 Tue,  6 Oct 2020 05:24:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9851CAE04D;
 Tue,  6 Oct 2020 05:24:23 +0000 (GMT)
Received: from [192.168.0.63] (unknown [9.85.71.114])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Oct 2020 05:24:23 +0000 (GMT)
Subject: [PATCH v3] powernv/elog: Fix the race while processing OPAL error log
 event.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 06 Oct 2020 10:54:22 +0530
Message-ID: <160196186190.1803505.7293993132725212105.stgit@jupiter>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_01:2020-10-05,
 2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=2 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060025
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Every error log reported by OPAL is exported to userspace through a sysfs
interface and notified using kobject_uevent(). The userspace daemon
(opal_errd) then reads the error log and acknowledges it error log is saved
safely to disk. Once acknowledged the kernel removes the respective sysfs
file entry causing respective resources getting released including kobject.

However there are chances where user daemon may already be scanning elog
entries while new sysfs elog entry is being created by kernel. User daemon
may read this new entry and ack it even before kernel can notify userspace
about it through kobject_uevent() call. If that happens then we have a
potential race between elog_ack_store->kobject_put() and kobject_uevent
which can lead to use-after-free issue of a kernfs object resulting into a
kernel crash. This patch fixes this race by protecting a sysfs file
creation/notification by holding an additional reference count on kobject
until we safely send kobject_uevent().

The function create_elog_obj() returns the elog object which if used by
caller function will end up in use-after-free problem again. However, the
return value of create_elog_obj() function isn't being used today and there
is need as well. Hence change it to return void to make this fix complete.

Fixes: 774fea1a38c6 ("powerpc/powernv: Read OPAL error log and export it through sysfs")
Cc: <stable@vger.kernel.org> # v3.15+
Reported-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
Change in v3:
- Change create_elog_obj function signature to return void.
Change in v2:
- Instead of mutex and use extra reference count on kobject to avoid the
  race.
---
 arch/powerpc/platforms/powernv/opal-elog.c |   25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 62ef7ad995da..e61cbf08e17e 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -179,14 +179,14 @@ static ssize_t raw_attr_read(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
-static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
+static void create_elog_obj(uint64_t id, size_t size, uint64_t type)
 {
 	struct elog_obj *elog;
 	int rc;
 
 	elog = kzalloc(sizeof(*elog), GFP_KERNEL);
 	if (!elog)
-		return NULL;
+		return;
 
 	elog->kobj.kset = elog_kset;
 
@@ -219,18 +219,33 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	rc = kobject_add(&elog->kobj, NULL, "0x%llx", id);
 	if (rc) {
 		kobject_put(&elog->kobj);
-		return NULL;
+		return;
 	}
 
+	/*
+	 * As soon as sysfs file for this elog is created/activated there is
+	 * chance opal_errd daemon might read and acknowledge this elog before
+	 * kobject_uevent() is called. If that happens then we have a potential
+	 * race between elog_ack_store->kobject_put() and kobject_uevent which
+	 * leads to use-after-free issue of a kernfs object resulting into
+	 * kernel crash. To avoid this race take an additional reference count
+	 * on kobject until we safely send kobject_uevent().
+	 */
+
+	kobject_get(&elog->kobj);  /* extra reference count */
 	rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
 	if (rc) {
 		kobject_put(&elog->kobj);
-		return NULL;
+		/* Drop the extra reference count  */
+		kobject_put(&elog->kobj);
+		return;
 	}
 
 	kobject_uevent(&elog->kobj, KOBJ_ADD);
+	/* Drop the extra reference count  */
+	kobject_put(&elog->kobj);
 
-	return elog;
+	return;
 }
 
 static irqreturn_t elog_event(int irq, void *data)


