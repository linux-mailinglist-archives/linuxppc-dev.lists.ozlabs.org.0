Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0AB011D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:17:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6WS4r2LzF3hM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4k2665RzF3F8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4k23XLPz8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4k231kYz9sNF; Thu, 12 Sep 2019 00:56:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4k15xgnz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:56:57 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgfms107512
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:56:56 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy107nnpa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:56:55 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:56:53 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:56:50 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEumUu22413390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:56:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC4B011C054;
 Wed, 11 Sep 2019 14:56:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB78F11C05B;
 Wed, 11 Sep 2019 14:56:46 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:56:46 +0000 (GMT)
Subject: [PATCH v6 32/36] powernv/opalcore: provide an option to invalidate
 /sys/firmware/opal/core file
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:26:45 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-4275-0000-0000-0000036481FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-4276-0000-0000-00003876DA04
Message-Id: <156821380161.5656.17827032108471421830.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Writing '1' to /sys/kernel/fadump_release_opalcore would release the
memory held by kernel in exporting /sys/firmware/opal/core file.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No changes in v6.


 arch/powerpc/platforms/powernv/opal-core.c |   38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 6fa6b8a..ed895d8 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -13,6 +13,8 @@
 #include <linux/proc_fs.h>
 #include <linux/elf.h>
 #include <linux/elfcore.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 #include <linux/slab.h>
 #include <linux/crash_core.h>
 #include <linux/of.h>
@@ -561,6 +563,36 @@ static void __init opalcore_config_init(void)
 	of_node_put(np);
 }
 
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
 static int __init opalcore_init(void)
 {
 	int rc = -1;
@@ -593,6 +625,12 @@ static int __init opalcore_init(void)
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

