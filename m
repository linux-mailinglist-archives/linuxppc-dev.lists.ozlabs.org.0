Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C283B0180
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:21:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6bW5bSjzF3Zl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4kK6nNQzF3FC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:57:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4kK1gMRz8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:57:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4kK1Cpjz9sNT; Thu, 12 Sep 2019 00:57:13 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4kJ4MMPz9sNF
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:57:12 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgeff051868
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:57:11 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2702ja1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:57:10 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:57:08 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:57:04 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEv2dl53805268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:57:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A763F42041;
 Wed, 11 Sep 2019 14:57:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B947142047;
 Wed, 11 Sep 2019 14:57:00 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:57:00 +0000 (GMT)
Subject: [PATCH v6 33/36] powerpc/fadump: consider f/w load area
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:26:59 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0012-0000-0000-0000034A0F28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0013-0000-0000-00002184783E
Message-Id: <156821381414.5656.1592867278535469652.stgit@hbathini.in.ibm.com>
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

OPAL loads kernel & initrd at 512MB offset (256MB size), also exported
as ibm,opal/dump/fw-load-area. So, if boot memory size of FADump is
less than 768MB, kernel memory to be exported as '/proc/vmcore' would
be overwritten by f/w while loading kernel & initrd. To avoid such a
scenario, enforce a minimum boot memory size of 768MB on OPAL platform
and skip using FADump if a newer F/W version loads kernel & initrd
above 768MB.

Also, irrespective of RMA size, set the minimum boot memory size
expected on pseries platform at 320MB. This is to avoid inflating the
minimum memory requirements on systems with 512M/1024M RMA size.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No major changes in v6.


 arch/powerpc/include/asm/fadump-internal.h   |   11 +---------
 arch/powerpc/kernel/fadump.c                 |   16 ++++++++++----
 arch/powerpc/platforms/powernv/opal-fadump.c |   30 +++++++++++++++++++++++++-
 arch/powerpc/platforms/powernv/opal-fadump.h |    7 ++++++
 arch/powerpc/platforms/pseries/rtas-fadump.c |    6 +++++
 arch/powerpc/platforms/pseries/rtas-fadump.h |    9 ++++++++
 6 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 6c2868d..a669aaa 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -19,16 +19,6 @@
 #define RMA_START	0x0
 #define RMA_END		(ppc64_rma_size)
 
-/*
- * On some Power systems where RMO is 128MB, it still requires minimum of
- * 256MB for kernel to boot successfully. When kdump infrastructure is
- * configured to save vmcore over network, we run into OOM issue while
- * loading modules related to network setup. Hence we need additional 64M
- * of memory to avoid OOM issue.
- */
-#define MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : RMA_END) \
-			+ (0x1UL << 26))
-
 /* The upper limit percentage for user specified boot memory size (25%) */
 #define MAX_BOOT_MEM_RATIO			4
 
@@ -128,6 +118,7 @@ struct fadump_ops {
 	u64	(*fadump_init_mem_struct)(struct fw_dump *fadump_conf);
 	u64	(*fadump_get_metadata_size)(void);
 	int	(*fadump_setup_metadata)(struct fw_dump *fadump_conf);
+	u64	(*fadump_get_bootmem_min)(void);
 	int	(*fadump_register)(struct fw_dump *fadump_conf);
 	int	(*fadump_unregister)(struct fw_dump *fadump_conf);
 	int	(*fadump_invalidate)(struct fw_dump *fadump_conf);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 645d9d4..bd49b1f 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -240,10 +240,10 @@ static void fadump_show_config(void)
  * that is required for a kernel to boot successfully.
  *
  */
-static inline unsigned long fadump_calculate_reserve_size(void)
+static inline u64 fadump_calculate_reserve_size(void)
 {
+	u64 base, size, bootmem_min;
 	int ret;
-	unsigned long long base, size;
 
 	if (fw_dump.reserve_bootvar)
 		pr_warn("'fadump_reserve_mem=' parameter is deprecated in favor of 'crashkernel=' parameter.\n");
@@ -293,7 +293,8 @@ static inline unsigned long fadump_calculate_reserve_size(void)
 	if (memory_limit && size > memory_limit)
 		size = memory_limit;
 
-	return (size > MIN_BOOT_MEM ? size : MIN_BOOT_MEM);
+	bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
+	return (size > bootmem_min ? size : bootmem_min);
 }
 
 /*
@@ -323,8 +324,8 @@ static unsigned long get_fadump_area_size(void)
 
 int __init fadump_reserve_mem(void)
 {
+	u64 base, size, mem_boundary, bootmem_min, align = PAGE_SIZE;
 	bool is_memblock_bottom_up = memblock_bottom_up();
-	u64 base, size, mem_boundary, align = PAGE_SIZE;
 	int ret = 1;
 
 	if (!fw_dump.fadump_enabled)
@@ -350,6 +351,13 @@ int __init fadump_reserve_mem(void)
 				ALIGN(fw_dump.boot_memory_size, align);
 		}
 #endif
+
+		bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
+		if (fw_dump.boot_memory_size < bootmem_min) {
+			pr_err("Can't enable fadump with boot memory size (0x%lx) less than 0x%llx\n",
+			       fw_dump.boot_memory_size, bootmem_min);
+			goto error_out;
+		}
 	}
 
 	/*
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index a89d3a0..006648e 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -9,6 +9,7 @@
 
 #include <linux/string.h>
 #include <linux/seq_file.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/mm.h>
@@ -262,6 +263,11 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
 	return err;
 }
 
+static u64 opal_fadump_get_bootmem_min(void)
+{
+	return OPAL_FADUMP_MIN_BOOT_MEM;
+}
+
 static int opal_fadump_register(struct fw_dump *fadump_conf)
 {
 	s64 rc = OPAL_PARAMETER;
@@ -606,6 +612,7 @@ static struct fadump_ops opal_fadump_ops = {
 	.fadump_init_mem_struct		= opal_fadump_init_mem_struct,
 	.fadump_get_metadata_size	= opal_fadump_get_metadata_size,
 	.fadump_setup_metadata		= opal_fadump_setup_metadata,
+	.fadump_get_bootmem_min		= opal_fadump_get_bootmem_min,
 	.fadump_register		= opal_fadump_register,
 	.fadump_unregister		= opal_fadump_unregister,
 	.fadump_invalidate		= opal_fadump_invalidate,
@@ -620,9 +627,9 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	const __be32 *prop;
 	unsigned long dn;
 	u64 addr = 0;
+	int i, len;
 	s64 ret;
 
-
 	/*
 	 * Check if Firmware-Assisted Dump is supported. if yes, check
 	 * if dump has been initiated on last reboot.
@@ -638,6 +645,27 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 		return;
 	}
 
+	prop = of_get_flat_dt_prop(dn, "fw-load-area", &len);
+	if (prop) {
+		/*
+		 * Each f/w load area is an (address,size) pair,
+		 * 2 cells each, totalling 4 cells per range.
+		 */
+		for (i = 0; i < len / (sizeof(*prop) * 4); i++) {
+			u64 base, end;
+
+			base = of_read_number(prop + (i * 4) + 0, 2);
+			end = base;
+			end += of_read_number(prop + (i * 4) + 2, 2);
+			if (end > OPAL_FADUMP_MIN_BOOT_MEM) {
+				pr_err("F/W load area: 0x%llx-0x%llx\n",
+				       base, end);
+				pr_err("F/W version not supported!\n");
+				return;
+			}
+		}
+	}
+
 	fadump_conf->ops		= &opal_fadump_ops;
 	fadump_conf->fadump_supported	= 1;
 
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index d0e17d6..e630cb0 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -11,6 +11,13 @@
 #include <asm/reg.h>
 
 /*
+ * With kernel & initrd loaded at 512MB (with 256MB size), enforce a minimum
+ * boot memory size of 768MB to ensure f/w loading kernel and initrd doesn't
+ * mess with crash'ed kernel's memory during MPIPL.
+ */
+#define OPAL_FADUMP_MIN_BOOT_MEM		(0x30000000UL)
+
+/*
  * OPAL FADump metadata structure format version
  *
  * OPAL FADump kernel metadata structure stores kernel metadata needed to
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index bf1e8fc..1d8f287 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -116,6 +116,11 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	return addr;
 }
 
+static u64 rtas_fadump_get_bootmem_min(void)
+{
+	return RTAS_FADUMP_MIN_BOOT_MEM;
+}
+
 static int rtas_fadump_register(struct fw_dump *fadump_conf)
 {
 	unsigned int wait_time;
@@ -467,6 +472,7 @@ static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
 
 static struct fadump_ops rtas_fadump_ops = {
 	.fadump_init_mem_struct		= rtas_fadump_init_mem_struct,
+	.fadump_get_bootmem_min		= rtas_fadump_get_bootmem_min,
 	.fadump_register		= rtas_fadump_register,
 	.fadump_unregister		= rtas_fadump_unregister,
 	.fadump_invalidate		= rtas_fadump_invalidate,
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index 531f3f3..6602ff6 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -9,6 +9,15 @@
 #ifndef _PSERIES_RTAS_FADUMP_H
 #define _PSERIES_RTAS_FADUMP_H
 
+/*
+ * On some Power systems where RMO is 128MB, it still requires minimum of
+ * 256MB for kernel to boot successfully. When kdump infrastructure is
+ * configured to save vmcore over network, we run into OOM issue while
+ * loading modules related to network setup. Hence we need additional 64M
+ * of memory to avoid OOM issue.
+ */
+#define RTAS_FADUMP_MIN_BOOT_MEM	((0x1UL << 28) + (0x1UL << 26))
+
 /* Firmware provided dump sections */
 #define RTAS_FADUMP_CPU_STATE_DATA	0x0001
 #define RTAS_FADUMP_HPTE_REGION		0x0002

