Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D711A559D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:22:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJyh083SzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:22:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJCH4PS9zDqH5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:48:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJCG2XHZz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:48:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJCG0KY3z9s4Y; Wed, 26 Jun 2019 06:48:10 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45YJCF3p9Yz9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:48:09 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKlBR0141543
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:48:08 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbtashge1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:48:04 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:48:02 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:47:59 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKlvl959768982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:47:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B57DBA405C;
 Tue, 25 Jun 2019 20:47:57 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 865CDA405B;
 Tue, 25 Jun 2019 20:47:55 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:47:55 +0000 (GMT)
Subject: [PATCH v3 15/16] powernv/fadump: consider f/w load area
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:17:54 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0016-0000-0000-0000028C51B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0017-0000-0000-000032E9C620
Message-Id: <156149567448.9094.13568480898134973004.stgit@hbathini.in.ibm.com>
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

OPAL loads kernel & initrd at 512MB offset (256MB size), also exported
as ibm,opal/dump/fw-load-area. So, if boot memory size of FADump is
less than 768MB, kernel memory to be exported as '/proc/vmcore' would
be overwritten by f/w while loading kernel & initrd. To avoid such a
scenario, enforce a minimum boot memory size of 768MB on OPAL platform.

Also, skip using FADump if a newer F/W version loads kernel & initrd
above 768MB.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump-common.h          |   11 +---------
 arch/powerpc/kernel/fadump.c                 |   11 +++++++++-
 arch/powerpc/platforms/powernv/opal-fadump.c |   28 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h |    7 +++++++
 arch/powerpc/platforms/pseries/rtas-fadump.c |    6 ++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h |   10 +++++++++
 6 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index fea6872..64e1f9e 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -23,16 +23,6 @@
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
 
@@ -169,6 +159,7 @@ struct fadump_ops {
 	ulong	(*init_fadump_mem_struct)(struct fw_dump *fadump_config);
 	ulong	(*get_kernel_metadata_size)(void);
 	int	(*setup_kernel_metadata)(struct fw_dump *fadump_config);
+	ulong	(*get_bootmem_min)(void);
 	int	(*register_fadump)(struct fw_dump *fadump_config);
 	int	(*unregister_fadump)(struct fw_dump *fadump_config);
 	int	(*invalidate_fadump)(struct fw_dump *fadump_config);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 569221a..d9e44c8 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -358,7 +358,8 @@ static inline unsigned long fadump_calculate_reserve_size(void)
 	if (memory_limit && size > memory_limit)
 		size = memory_limit;
 
-	return (size > MIN_BOOT_MEM ? size : MIN_BOOT_MEM);
+	return (size > fw_dump.ops->get_bootmem_min() ? size :
+		fw_dump.ops->get_bootmem_min());
 }
 
 /*
@@ -573,6 +574,14 @@ int __init fadump_reserve_mem(void)
 				ALIGN(fw_dump.boot_memory_size,
 							FADUMP_CMA_ALIGNMENT);
 #endif
+
+		if (fw_dump.boot_memory_size < fw_dump.ops->get_bootmem_min()) {
+			pr_err("Can't enable fadump with boot memory size (0x%lx) less than 0x%lx\n",
+			       fw_dump.boot_memory_size,
+			       fw_dump.ops->get_bootmem_min());
+			goto error_out;
+		}
+
 		fw_dump.rmr_source_len = fw_dump.boot_memory_size;
 		if (!fadump_get_rmr_regions()) {
 			pr_err("Too many holes in boot memory area to enable fadump\n");
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 2c87812..51f8342 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -230,6 +230,11 @@ static int opal_setup_kernel_metadata(struct fw_dump *fadump_conf)
 	return err;
 }
 
+static ulong opal_get_bootmem_min(void)
+{
+	return OPAL_MIN_BOOT_MEM;
+}
+
 static int opal_register_fadump(struct fw_dump *fadump_conf)
 {
 	int i, err = -EIO;
@@ -516,6 +521,7 @@ static struct fadump_ops opal_fadump_ops = {
 	.init_fadump_mem_struct		= opal_init_fadump_mem_struct,
 	.get_kernel_metadata_size	= opal_get_kernel_metadata_size,
 	.setup_kernel_metadata		= opal_setup_kernel_metadata,
+	.get_bootmem_min		= opal_get_bootmem_min,
 	.register_fadump		= opal_register_fadump,
 	.unregister_fadump		= opal_unregister_fadump,
 	.invalidate_fadump		= opal_invalidate_fadump,
@@ -528,6 +534,7 @@ int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
 {
 	unsigned long dn;
 	const __be32 *prop;
+	int i, len;
 
 	/*
 	 * Check if Firmware-Assisted Dump is supported. if yes, check
@@ -544,6 +551,27 @@ int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
 		return 1;
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
+			if (end > OPAL_MIN_BOOT_MEM) {
+				pr_err("F/W load area: 0x%llx-0x%llx\n",
+				       base, end);
+				pr_err("F/W version not supported!\n");
+				return 1;
+			}
+		}
+	}
+
 	fadump_conf->ops		= &opal_fadump_ops;
 	fadump_conf->fadump_platform	= FADUMP_PLATFORM_POWERNV;
 	fadump_conf->fadump_supported	= 1;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index fe293c8..400e79a 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -15,6 +15,13 @@
 
 #include <asm/reg.h>
 
+/*
+ * With kernel & initrd loaded at 512MB (with 256MB size), enforce a minimum
+ * boot memory size of 768MB to ensure f/w loading kernel and initrd doesn't
+ * mess with crash'ed kernel's memory during MPIPL.
+ */
+#define OPAL_MIN_BOOT_MEM	(0x30000000UL)
+
 /* FADump structure format version */
 #define FADUMP_VERSION				0x1
 
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index bc53a38..2d37b6d 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -148,6 +148,11 @@ static int pseries_setup_kernel_metadata(struct fw_dump *fadump_conf)
 	return 0;
 }
 
+static ulong pseries_get_bootmem_min(void)
+{
+	return PSERIES_MIN_BOOT_MEM;
+}
+
 static int pseries_register_fadump(struct fw_dump *fadump_conf)
 {
 	int rc, err;
@@ -479,6 +484,7 @@ static struct fadump_ops pseries_fadump_ops = {
 	.init_fadump_mem_struct		= pseries_init_fadump_mem_struct,
 	.get_kernel_metadata_size	= pseries_get_kernel_metadata_size,
 	.setup_kernel_metadata		= pseries_setup_kernel_metadata,
+	.get_bootmem_min		= pseries_get_bootmem_min,
 	.register_fadump		= pseries_register_fadump,
 	.unregister_fadump		= pseries_unregister_fadump,
 	.invalidate_fadump		= pseries_invalidate_fadump,
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index d61e5d9..feab2d7 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -13,6 +13,16 @@
 #ifndef __PPC64_PSERIES_FA_DUMP_H__
 #define __PPC64_PSERIES_FA_DUMP_H__
 
+/*
+ * On some Power systems where RMO is 128MB, it still requires minimum of
+ * 256MB for kernel to boot successfully. When kdump infrastructure is
+ * configured to save vmcore over network, we run into OOM issue while
+ * loading modules related to network setup. Hence we need additional 64M
+ * of memory to avoid OOM issue.
+ */
+#define PSERIES_MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : \
+				 RMA_END) + (0x1UL << 26))
+
 /* Firmware provided dump sections */
 #define PSERIES_FADUMP_CPU_STATE_DATA	0x0001
 #define PSERIES_FADUMP_HPTE_REGION	0x0002

