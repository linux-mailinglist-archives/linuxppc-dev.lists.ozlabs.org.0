Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8ED62A36
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 22:14:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jGrZ0wBVzDqRS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 06:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jGph0S6LzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 06:13:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45jGpg5JzCz8tXg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 06:12:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45jGpg51WGz9sP2; Tue,  9 Jul 2019 06:12:59 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45jGpg13r7z9sNk;
 Tue,  9 Jul 2019 06:12:58 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68KCMVo032434; Mon, 8 Jul 2019 16:12:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tmbt81suw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 16:12:54 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x68KCQMp032698;
 Mon, 8 Jul 2019 16:12:54 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tmbt81sun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 16:12:54 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x68KAe6d017975;
 Mon, 8 Jul 2019 20:12:53 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2tjk970f27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 20:12:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68KCqC450659820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 20:12:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F2DAAC059;
 Mon,  8 Jul 2019 20:12:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FA45AC05E;
 Mon,  8 Jul 2019 20:12:50 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.80.216.78])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 20:12:50 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH] powerpc/powernv: Add ultravisor message log interface
Date: Mon,  8 Jul 2019 17:12:49 -0300
Message-Id: <20190708201249.29649-1-cclaudio@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080252
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
 Ryan Grimm <grimm@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Ultravisor provides an in-memory circular buffer containing a message
log populated with various runtime message produced by firmware.

Based on "powernv/opal-msglog.c", this patch provides a sysfs interface
/sys/firmware/opal/uv_msglog for userspace to view the messages.

CC: Joel Stanley <joel@jms.id.au>
CC: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
[ Read ibm,opal-uv-memcons instead of OPAL's ]
Signed-off-by: Ryan Grimm <grimm@linux.ibm.com>
[ Fix license, update the commit message ]
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/include/asm/opal.h               |   2 +
 arch/powerpc/platforms/powernv/Makefile       |   1 +
 .../platforms/powernv/opal-uv-msglog.c        | 141 ++++++++++++++++++
 arch/powerpc/platforms/powernv/opal.c         |   2 +
 4 files changed, 146 insertions(+)
 create mode 100644 arch/powerpc/platforms/powernv/opal-uv-msglog.c

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 4cc37e708bc7..86299c5d866b 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -351,6 +351,8 @@ extern void opal_platform_dump_init(void);
 extern void opal_sys_param_init(void);
 extern void opal_msglog_init(void);
 extern void opal_msglog_sysfs_init(void);
+extern void opal_uv_msglog_init(void);
+extern void opal_uv_msglog_sysfs_init(void);
 extern int opal_async_comp_init(void);
 extern int opal_sensor_init(void);
 extern int opal_hmi_handler_init(void);
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index da2e99efbd04..216629c63e1d 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -4,6 +4,7 @@ obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
 obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
 obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
 obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
+obj-y			+= opal-uv-msglog.o
 
 obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
 obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
diff --git a/arch/powerpc/platforms/powernv/opal-uv-msglog.c b/arch/powerpc/platforms/powernv/opal-uv-msglog.c
new file mode 100644
index 000000000000..87d665d7e6ad
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-uv-msglog.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * PowerNV OPAL in-memory ultravisor console interface
+ *
+ * Copyright 2018 IBM Corp.
+ */
+#include <asm/io.h>
+#include <asm/opal.h>
+#include <linux/debugfs.h>
+#include <linux/of.h>
+#include <linux/types.h>
+#include <asm/barrier.h>
+
+/* OPAL in-memory console. Defined in OPAL source at core/console.c */
+struct memcons {
+	__be64 magic;
+#define MEMCONS_MAGIC	0x6630696567726173L
+	__be64 obuf_phys;
+	__be64 ibuf_phys;
+	__be32 obuf_size;
+	__be32 ibuf_size;
+	__be32 out_pos;
+#define MEMCONS_OUT_POS_WRAP	0x80000000u
+#define MEMCONS_OUT_POS_MASK	0x00ffffffu
+	__be32 in_prod;
+	__be32 in_cons;
+};
+
+static struct memcons *opal_uv_memcons;
+
+ssize_t opal_uv_msglog_copy(char *to, loff_t pos, size_t count)
+{
+	const char *conbuf;
+	ssize_t ret;
+	size_t first_read = 0;
+	uint32_t out_pos, avail;
+
+	if (!opal_uv_memcons)
+		return -ENODEV;
+
+	out_pos = be32_to_cpu(READ_ONCE(opal_uv_memcons->out_pos));
+
+	/*
+	 * Now we've read out_pos, put a barrier in before reading the new data
+	 * it points to in conbuf.
+	 */
+	smp_rmb();
+
+	conbuf = phys_to_virt(be64_to_cpu(opal_uv_memcons->obuf_phys));
+
+	/*
+	 * When the buffer has wrapped, read from the out_pos marker to the end
+	 * of the buffer, and then read the remaining data as in the un-wrapped
+	 * case.
+	 */
+	if (out_pos & MEMCONS_OUT_POS_WRAP) {
+
+		out_pos &= MEMCONS_OUT_POS_MASK;
+		avail = be32_to_cpu(opal_uv_memcons->obuf_size) - out_pos;
+
+		ret = memory_read_from_buffer(to, count, &pos,
+				conbuf + out_pos, avail);
+
+		if (ret < 0)
+			goto out;
+
+		first_read = ret;
+		to += first_read;
+		count -= first_read;
+		pos -= avail;
+
+		if (count <= 0)
+			goto out;
+	}
+
+	/* Sanity check. The firmware should not do this to us. */
+	if (out_pos > be32_to_cpu(opal_uv_memcons->obuf_size)) {
+		pr_err("OPAL: memory console corruption. Aborting read.\n");
+		return -EINVAL;
+	}
+
+	ret = memory_read_from_buffer(to, count, &pos, conbuf, out_pos);
+
+	if (ret < 0)
+		goto out;
+
+	ret += first_read;
+out:
+	return ret;
+}
+
+static ssize_t opal_uv_msglog_read(struct file *file, struct kobject *kobj,
+				struct bin_attribute *bin_attr, char *to,
+				loff_t pos, size_t count)
+{
+	return opal_uv_msglog_copy(to, pos, count);
+}
+
+static struct bin_attribute opal_uv_msglog_attr = {
+	.attr = {.name = "uv_msglog", .mode = 0444},
+	.read = opal_uv_msglog_read
+};
+
+void __init opal_uv_msglog_init(void)
+{
+	u64 mcaddr;
+	struct memcons *mc;
+
+	if (of_property_read_u64(opal_node, "ibm,opal-uv-memcons", &mcaddr)) {
+		pr_warn("OPAL: Property ibm,opal-uv-memcons not found\n");
+		return;
+	}
+
+	mc = phys_to_virt(mcaddr);
+	if (!mc) {
+		pr_warn("OPAL: uv memory console address is invalid\n");
+		return;
+	}
+
+	if (be64_to_cpu(mc->magic) != MEMCONS_MAGIC) {
+		pr_warn("OPAL: uv memory console version is invalid\n");
+		return;
+	}
+
+	/* Report maximum size */
+	opal_uv_msglog_attr.size =  be32_to_cpu(mc->ibuf_size) +
+		be32_to_cpu(mc->obuf_size);
+
+	opal_uv_memcons = mc;
+}
+
+void __init opal_uv_msglog_sysfs_init(void)
+{
+	if (!opal_uv_memcons) {
+		pr_warn("OPAL: message log initialisation failed, not creating sysfs entry\n");
+		return;
+	}
+
+	if (sysfs_create_bin_file(opal_kobj, &opal_uv_msglog_attr) != 0)
+		pr_warn("OPAL: sysfs file creation failed\n");
+}
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 89b6ddc3ed38..ed000a788456 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -946,6 +946,7 @@ static int __init opal_init(void)
 
 	/* Initialise OPAL message log interface */
 	opal_msglog_init();
+	opal_uv_msglog_init();
 
 	/* Create "opal" kobject under /sys/firmware */
 	rc = opal_sysfs_init();
@@ -964,6 +965,7 @@ static int __init opal_init(void)
 		opal_sys_param_init();
 		/* Setup message log sysfs interface. */
 		opal_msglog_sysfs_init();
+		opal_uv_msglog_sysfs_init();
 	}
 
 	/* Export all properties */
-- 
2.20.1

