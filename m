Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF05559CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:20:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJwg5J4szDqWs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJC404vXzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:48:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJC36NmFz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJC35wjJz9s5c; Wed, 26 Jun 2019 06:47:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45YJC32MYHz9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:47:59 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKl1x9007791
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:56 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbrvew2cr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:55 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:47:53 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:47:50 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKlnmR51970134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:47:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17933A4057;
 Tue, 25 Jun 2019 20:47:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52B36A4051;
 Tue, 25 Jun 2019 20:47:46 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:47:45 +0000 (GMT)
Subject: [PATCH v3 14/16] powernv/opalcore: provide an option to invalidate
 /sys/firmware/opal/core file
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:17:45 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0020-0000-0000-0000034D57A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0021-0000-0000-000021A0C906
Message-Id: <156149566496.9094.9597570370031067578.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250158
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Writing '1' to /sys/kernel/fadump_release_opalcore would release the
memory held by kernel in exporting /sys/firmware/opal/core file.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-core.c |   40 +++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 56fb1cd..f3e336c 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -19,6 +19,8 @@
 #include <linux/proc_fs.h>
 #include <linux/elf.h>
 #include <linux/elfcore.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 #include <linux/slab.h>
 #include <linux/crash_core.h>
 #include <linux/of.h>
@@ -172,7 +174,7 @@ static ssize_t read_opalcore(struct file *file, struct kobject *kobj,
 	if (pos >= oc_conf->opalcore_size)
 		return 0;
 
-	/* Adjust count if it goes beyond opacore size */
+	/* Adjust count if it goes beyond opalcore size */
 	avail = oc_conf->opalcore_size - pos;
 	if (count > avail)
 		count = avail;
@@ -559,6 +561,36 @@ static void opalcore_cleanup(void)
 }
 __exitcall(opalcore_cleanup);
 
+static ssize_t fadump_release_opalcore_store(struct kobject *kobj,
+					     struct kobj_attribute *attr,
+					     const char *buf, size_t count)
+{
+	int input = -1;
+
+	if (kstrtoint(buf, 0, &input))
+		return -EINVAL;
+
+	if (input == 1) {
+		if (oc_conf == NULL) {
+			pr_err("'/proc/opalcore' file does not exist!\n");
+			return -EPERM;
+		}
+
+		/*
+		 * Take away '/proc/opalcore' and release all memory
+		 * used for exporting this file.
+		 */
+		opalcore_cleanup();
+	} else
+		return -EINVAL;
+
+	return count;
+}
+
+static struct kobj_attribute opalcore_rel_attr = __ATTR(fadump_release_opalcore,
+						0200, NULL,
+						fadump_release_opalcore_store);
+
 /* Init function for opalcore module. */
 static int __init opalcore_init(void)
 {
@@ -591,6 +623,12 @@ static int __init opalcore_init(void)
 		return rc;
 	}
 
+	rc = sysfs_create_file(kernel_kobj, &opalcore_rel_attr.attr);
+	if (rc) {
+		pr_warn("unable to create sysfs file fadump_release_opalcore (%d)\n",
+			rc);
+	}
+
 	return 0;
 }
 fs_initcall(opalcore_init);

