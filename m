Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A695A02B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:10:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JR1T3Sq2zDr84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 23:10:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JQvq2hZBzDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 23:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46JQvq0KZ3z9sNf; Wed, 28 Aug 2019 23:05:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JQvp66Zkz9sN1; Wed, 28 Aug 2019 23:05:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 1/2] powerpc/powernv/opal-msglog: Refactor memcons code
Date: Wed, 28 Aug 2019 23:05:20 +1000
Message-Id: <20190828130521.26764-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: cclaudio@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Claudio Carvalho <cclaudio@linux.ibm.com>

This patch refactors the code in opal-msglog that operates on the OPAL
memory console in order to make it cleaner and also allow the reuse of
the new memcons_* functions.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v4: mpe: Rename memcons_load_from_dt() to memcons_init().
         Make memcons_init() and memcons_get_size() non-static.
	 Continue to use opal_msglog_copy() in opal_msglog_read().
---
 arch/powerpc/platforms/powernv/opal-msglog.c | 57 +++++++++++++-------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index dc51d03c6370..d26da19a611f 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -29,23 +29,23 @@ struct memcons {
 
 static struct memcons *opal_memcons = NULL;
 
-ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
+ssize_t memcons_copy(struct memcons *mc, char *to, loff_t pos, size_t count)
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
@@ -53,7 +53,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	if (out_pos & MEMCONS_OUT_POS_WRAP) {
 
 		out_pos &= MEMCONS_OUT_POS_MASK;
-		avail = be32_to_cpu(opal_memcons->obuf_size) - out_pos;
+		avail = be32_to_cpu(mc->obuf_size) - out_pos;
 
 		ret = memory_read_from_buffer(to, count, &pos,
 				conbuf + out_pos, avail);
@@ -71,7 +71,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
 	}
 
 	/* Sanity check. The firmware should not do this to us. */
-	if (out_pos > be32_to_cpu(opal_memcons->obuf_size)) {
+	if (out_pos > be32_to_cpu(mc->obuf_size)) {
 		pr_err("OPAL: memory console corruption. Aborting read.\n");
 		return -EINVAL;
 	}
@@ -86,6 +86,11 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
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
@@ -98,32 +103,48 @@ static struct bin_attribute opal_msglog_attr = {
 	.read = opal_msglog_read
 };
 
-void __init opal_msglog_init(void)
+struct memcons *memcons_init(struct device_node *node, const char *mc_prop_name)
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
+u32 memcons_get_size(struct memcons *mc)
+{
+	return be32_to_cpu(mc->ibuf_size) + be32_to_cpu(mc->obuf_size);
+}
+
+void __init opal_msglog_init(void)
+{
+	opal_memcons = memcons_init(opal_node, "ibm,opal-memcons");
+	if (!opal_memcons) {
+		pr_warn("OPAL: memcons failed to load from ibm,opal-memcons\n");
+		return;
+	}
 
-	opal_memcons = mc;
+	opal_msglog_attr.size = memcons_get_size(opal_memcons);
 }
 
 void __init opal_msglog_sysfs_init(void)
-- 
2.21.0

