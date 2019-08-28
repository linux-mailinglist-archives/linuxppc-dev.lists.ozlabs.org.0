Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED029F903
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 05:59:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JBnC6NtNzDqTl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 13:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JBky0ZcGzDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:56:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JBkx74XVz8sxb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:56:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JBkx6fltz9sN1; Wed, 28 Aug 2019 13:56:57 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46JBkx17Llz9s7T;
 Wed, 28 Aug 2019 13:56:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7S3q1mB105118; Tue, 27 Aug 2019 23:56:53 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2unhmbh3pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2019 23:56:52 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7S3t8VK021443;
 Wed, 28 Aug 2019 03:56:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 2ujvv6knqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 03:56:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7S3uopK51446128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Aug 2019 03:56:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BED4D78063;
 Wed, 28 Aug 2019 03:56:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C288B7805F;
 Wed, 28 Aug 2019 03:56:47 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.85.147.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Aug 2019 03:56:47 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 1/2] powerpc/powernv/opal-msglog: Refactor memcons code
Date: Wed, 28 Aug 2019 00:56:45 -0300
Message-Id: <20190828035646.907-1-cclaudio@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-28_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908280039
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
 Ryan Grimm <grimm@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch refactors the code in opal-msglog that operates on the OPAL
memory console in order to make it cleaner and also allow the reuse of
the new memcons_* functions.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-msglog.c | 61 ++++++++++++++------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index dc51d03c6370..0e8eb62c8afe 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -29,23 +29,24 @@ struct memcons {
 
 static struct memcons *opal_memcons = NULL;
 
-ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
+static ssize_t memcons_copy(struct memcons *mc, char *to, loff_t pos,
+			   size_t count)
 {
 	const char *conbuf;
 	ssize_t ret;
 	size_t first_read = 0;
 	uint32_t out_pos, avail;
 
-	if (!opal_memcons)
+	if (!mc)
 		return -ENODEV;
 
-	out_pos = be32_to_cpu(READ_ONCE(opal_memcons->out_pos));
+	out_pos = be32_to_cpu(READ_ONCE(mc->out_pos));
 
 	/* Now we've read out_pos, put a barrier in before reading the new
 	 * data it points to in conbuf. */
 	smp_rmb();
 
-	conbuf = phys_to_virt(be64_to_cpu(opal_memcons->obuf_phys));
+	conbuf = phys_to_virt(be64_to_cpu(mc->obuf_phys));
 
 	/* When the buffer has wrapped, read from the out_pos marker to the end
 	 * of the buffer, and then read the remaining data as in the un-wrapped
@@ -53,7 +54,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	if (out_pos & MEMCONS_OUT_POS_WRAP) {
 
 		out_pos &= MEMCONS_OUT_POS_MASK;
-		avail = be32_to_cpu(opal_memcons->obuf_size) - out_pos;
+		avail = be32_to_cpu(mc->obuf_size) - out_pos;
 
 		ret = memory_read_from_buffer(to, count, &pos,
 				conbuf + out_pos, avail);
@@ -71,7 +72,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	}
 
 	/* Sanity check. The firmware should not do this to us. */
-	if (out_pos > be32_to_cpu(opal_memcons->obuf_size)) {
+	if (out_pos > be32_to_cpu(mc->obuf_size)) {
 		pr_err("OPAL: memory console corruption. Aborting read.\n");
 		return -EINVAL;
 	}
@@ -86,11 +87,16 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	return ret;
 }
 
+ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
+{
+	return memcons_copy(opal_memcons, to, pos, count);
+}
+
 static ssize_t opal_msglog_read(struct file *file, struct kobject *kobj,
 				struct bin_attribute *bin_attr, char *to,
 				loff_t pos, size_t count)
 {
-	return opal_msglog_copy(to, pos, count);
+	return memcons_copy(opal_memcons, to, pos, count);
 }
 
 static struct bin_attribute opal_msglog_attr = {
@@ -98,32 +104,49 @@ static struct bin_attribute opal_msglog_attr = {
 	.read = opal_msglog_read
 };
 
-void __init opal_msglog_init(void)
+static struct memcons *memcons_load_from_dt(struct device_node *node,
+					    const char *mc_prop_name)
 {
 	u64 mcaddr;
 	struct memcons *mc;
 
-	if (of_property_read_u64(opal_node, "ibm,opal-memcons", &mcaddr)) {
-		pr_warn("OPAL: Property ibm,opal-memcons not found, no message log\n");
-		return;
+	if (of_property_read_u64(node, mc_prop_name, &mcaddr)) {
+		pr_warn("%s property not found, no message log\n",
+			mc_prop_name);
+		goto out_err;
 	}
 
 	mc = phys_to_virt(mcaddr);
 	if (!mc) {
-		pr_warn("OPAL: memory console address is invalid\n");
-		return;
+		pr_warn("memory console address is invalid\n");
+		goto out_err;
 	}
 
 	if (be64_to_cpu(mc->magic) != MEMCONS_MAGIC) {
-		pr_warn("OPAL: memory console version is invalid\n");
-		return;
+		pr_warn("memory console version is invalid\n");
+		goto out_err;
 	}
 
-	/* Report maximum size */
-	opal_msglog_attr.size =  be32_to_cpu(mc->ibuf_size) +
-		be32_to_cpu(mc->obuf_size);
+	return mc;
+
+out_err:
+	return NULL;
+}
+
+static u32 memcons_get_size(struct memcons *mc)
+{
+	return be32_to_cpu(mc->ibuf_size) + be32_to_cpu(mc->obuf_size);
+}
+
+void __init opal_msglog_init(void)
+{
+	opal_memcons = memcons_load_from_dt(opal_node, "ibm,opal-memcons");
+	if (!opal_memcons) {
+		pr_warn("OPAL: memcons failed to load from ibm,opal-memcons\n");
+		return;
+	}
 
-	opal_memcons = mc;
+	opal_msglog_attr.size = memcons_get_size(opal_memcons);
 }
 
 void __init opal_msglog_sysfs_init(void)
-- 
2.20.1

