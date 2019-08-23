Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAF9A762
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 08:08:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F9vX27VJzDrgH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 16:08:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F9sk1ZP8zDqgG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 16:07:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46F9sk0dJVz8shd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 16:07:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46F9sk0RRFz9sNC; Fri, 23 Aug 2019 16:07:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46F9sj3thjz9sN6;
 Fri, 23 Aug 2019 16:07:20 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7N67FIE115244; Fri, 23 Aug 2019 02:07:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uj7cvdvtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 02:07:16 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7N6773k114607;
 Fri, 23 Aug 2019 02:07:07 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uj7cvdvq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 02:07:07 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7N66XLN027689;
 Fri, 23 Aug 2019 06:06:59 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 2ue977a6bf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 06:06:59 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7N66wlA5571536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 06:06:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0BE3AE067;
 Fri, 23 Aug 2019 06:06:58 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55321AE062;
 Fri, 23 Aug 2019 06:06:56 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.85.165.148])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 23 Aug 2019 06:06:56 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc/powernv: Add ultravisor message log interface
Date: Fri, 23 Aug 2019 03:06:54 -0300
Message-Id: <20190823060654.28842-1-cclaudio@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230067
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Ryan Grimm <grimm@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ultravisor (UV) provides an in-memory console which follows the OPAL
in-memory console structure.

This patch extends the OPAL msglog code to also initialize the UV memory
console and provide a sysfs interface (uv_msglog) for userspace to view
the UV message log.

CC: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
CC: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
This patch depends on the "kvmppc: Paravirtualize KVM to support
ultravisor" patchset submitted by Claudio Carvalho.
---
 arch/powerpc/platforms/powernv/opal-msglog.c | 99 ++++++++++++++------
 1 file changed, 72 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index dc51d03c6370..da73908fdabe 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/types.h>
 #include <asm/barrier.h>
+#include <asm/firmware.h>
 
 /* OPAL in-memory console. Defined in OPAL source at core/console.c */
 struct memcons {
@@ -28,24 +29,26 @@ struct memcons {
 };
 
 static struct memcons *opal_memcons = NULL;
+static struct memcons *opal_uv_memcons;
 
-ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
+static ssize_t msglog_copy(struct memcons *memcons, const char *bin_attr_name,
+			   char *to, loff_t pos, size_t count)
 {
 	const char *conbuf;
 	ssize_t ret;
 	size_t first_read = 0;
 	uint32_t out_pos, avail;
 
-	if (!opal_memcons)
+	if (!memcons)
 		return -ENODEV;
 
-	out_pos = be32_to_cpu(READ_ONCE(opal_memcons->out_pos));
+	out_pos = be32_to_cpu(READ_ONCE(memcons->out_pos));
 
 	/* Now we've read out_pos, put a barrier in before reading the new
 	 * data it points to in conbuf. */
 	smp_rmb();
 
-	conbuf = phys_to_virt(be64_to_cpu(opal_memcons->obuf_phys));
+	conbuf = phys_to_virt(be64_to_cpu(memcons->obuf_phys));
 
 	/* When the buffer has wrapped, read from the out_pos marker to the end
 	 * of the buffer, and then read the remaining data as in the un-wrapped
@@ -53,7 +56,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	if (out_pos & MEMCONS_OUT_POS_WRAP) {
 
 		out_pos &= MEMCONS_OUT_POS_MASK;
-		avail = be32_to_cpu(opal_memcons->obuf_size) - out_pos;
+		avail = be32_to_cpu(memcons->obuf_size) - out_pos;
 
 		ret = memory_read_from_buffer(to, count, &pos,
 				conbuf + out_pos, avail);
@@ -71,8 +74,8 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	}
 
 	/* Sanity check. The firmware should not do this to us. */
-	if (out_pos > be32_to_cpu(opal_memcons->obuf_size)) {
-		pr_err("OPAL: memory console corruption. Aborting read.\n");
+	if (out_pos > be32_to_cpu(memcons->obuf_size)) {
+		pr_err("OPAL: %s corruption. Aborting read.\n", bin_attr_name);
 		return -EINVAL;
 	}
 
@@ -86,53 +89,95 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	return ret;
 }
 
+#define BIN_ATTR_NAME_OPAL	"msglog"
+#define BIN_ATTR_NAME_UV	"uv_msglog"
+
+ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
+{
+	return msglog_copy(opal_memcons, BIN_ATTR_NAME_OPAL, to, pos,
+			   count);
+}
+
 static ssize_t opal_msglog_read(struct file *file, struct kobject *kobj,
 				struct bin_attribute *bin_attr, char *to,
 				loff_t pos, size_t count)
 {
-	return opal_msglog_copy(to, pos, count);
+	return msglog_copy(opal_memcons, BIN_ATTR_NAME_OPAL, to, pos,
+			   count);
+}
+
+static ssize_t opal_uv_msglog_read(struct file *file, struct kobject *kobj,
+				   struct bin_attribute *bin_attr, char *to,
+				   loff_t pos, size_t count)
+{
+	return msglog_copy(opal_uv_memcons, BIN_ATTR_NAME_UV, to, pos,
+			   count);
 }
 
 static struct bin_attribute opal_msglog_attr = {
-	.attr = {.name = "msglog", .mode = 0400},
+	.attr = {.name = BIN_ATTR_NAME_OPAL, .mode = 0400},
 	.read = opal_msglog_read
 };
 
-void __init opal_msglog_init(void)
+static struct bin_attribute opal_uv_msglog_attr = {
+	.attr = {.name = BIN_ATTR_NAME_UV, .mode = 0400},
+	.read = opal_uv_msglog_read
+};
+
+static void __init msglog_init(struct memcons **memcons,
+			       struct bin_attribute *bin_attr,
+			       const char *dt_prop_name)
 {
-	u64 mcaddr;
-	struct memcons *mc;
+	u64 memcons_addr;
 
-	if (of_property_read_u64(opal_node, "ibm,opal-memcons", &mcaddr)) {
-		pr_warn("OPAL: Property ibm,opal-memcons not found, no message log\n");
+	if (of_property_read_u64(opal_node, dt_prop_name, &memcons_addr)) {
+		pr_warn("OPAL: Property '%s' not found, no message log\n",
+			dt_prop_name);
 		return;
 	}
 
-	mc = phys_to_virt(mcaddr);
-	if (!mc) {
-		pr_warn("OPAL: memory console address is invalid\n");
+	*memcons = phys_to_virt(memcons_addr);
+	if (!(*memcons)) {
+		pr_warn("OPAL: '%s' address is invalid\n", dt_prop_name);
 		return;
 	}
 
-	if (be64_to_cpu(mc->magic) != MEMCONS_MAGIC) {
-		pr_warn("OPAL: memory console version is invalid\n");
+	if (be64_to_cpu((*memcons)->magic) != MEMCONS_MAGIC) {
+		pr_warn("OPAL: '%s' version is invalid\n", dt_prop_name);
+		*memcons = NULL;
 		return;
 	}
 
 	/* Report maximum size */
-	opal_msglog_attr.size =  be32_to_cpu(mc->ibuf_size) +
-		be32_to_cpu(mc->obuf_size);
+	bin_attr->size = be32_to_cpu((*memcons)->ibuf_size) +
+			 be32_to_cpu((*memcons)->obuf_size);
+}
 
-	opal_memcons = mc;
+void __init opal_msglog_init(void)
+{
+	msglog_init(&opal_memcons, &opal_msglog_attr, "ibm,opal-memcons");
+	if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		msglog_init(&opal_uv_memcons, &opal_uv_msglog_attr,
+			    "ibm,opal-uv-memcons");
 }
 
-void __init opal_msglog_sysfs_init(void)
+static void __init msglog_sysfs_create(struct memcons *memcons,
+				       struct bin_attribute *bin_attr)
 {
-	if (!opal_memcons) {
-		pr_warn("OPAL: message log initialisation failed, not creating sysfs entry\n");
+	if (!memcons) {
+		pr_warn("OPAL: %s initialization failed, not creating sysfs entry\n",
+			bin_attr->attr.name);
 		return;
 	}
 
-	if (sysfs_create_bin_file(opal_kobj, &opal_msglog_attr) != 0)
-		pr_warn("OPAL: sysfs file creation failed\n");
+	if (sysfs_create_bin_file(opal_kobj, bin_attr) != 0)
+		pr_warn("OPAL: sysfs %s creation failed\n",
+			bin_attr->attr.name);
+}
+
+void __init opal_msglog_sysfs_init(void)
+{
+	msglog_sysfs_create(opal_memcons, &opal_msglog_attr);
+	if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		msglog_sysfs_create(opal_uv_memcons, &opal_uv_msglog_attr);
 }
-- 
2.20.1

