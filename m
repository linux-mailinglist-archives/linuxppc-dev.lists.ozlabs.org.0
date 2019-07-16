Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C676A8A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 14:25:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p03c74q4zDqNr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 22:25:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyxF5BH7zDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyxF3VQCz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyxF24Qkz9sN4; Tue, 16 Jul 2019 21:34:57 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nyxD2gZ7z9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:34:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMHqJ112841
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:54 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsbmknwy5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:34:52 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:34:50 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6GBYZrt32112932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:34:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95F2A4060;
 Tue, 16 Jul 2019 11:34:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EFA9A4062;
 Tue, 16 Jul 2019 11:34:47 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:34:46 +0000 (GMT)
Subject: [PATCH v4 23/25] powernv/opalcore: provide an option to invalidate
 /sys/firmware/opal/core file
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:04:46 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0008-0000-0000-000002FDA6D7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0009-0000-0000-0000226B1C71
Message-Id: <156327688631.27462.6625253388718832089.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
 arch/powerpc/platforms/powernv/opal-core.c |   38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 55bea53..9663d70 100644
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
@@ -562,6 +564,36 @@ static void opalcore_cleanup(void)
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
+			pr_err("'/sys/firmware/opal/core' file not accessible!\n");
+			return -EPERM;
+		}
+
+		/*
+		 * Take away '/sys/firmware/opal/core' and release all memory
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
@@ -594,6 +626,12 @@ static int __init opalcore_init(void)
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

