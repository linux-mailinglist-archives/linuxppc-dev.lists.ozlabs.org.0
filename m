Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2C096022
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:33:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CWwH5PgtzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CV184PQwzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:07:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CV182DmZz8tFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:07:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CV180Xpjz9sBF; Tue, 20 Aug 2019 22:07:56 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CV1736w7z9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:07:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC7Qgp090278
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:07:53 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uggd18nn2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:07:53 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:07:51 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:07:47 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC7kUN46333968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:07:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E17C842047;
 Tue, 20 Aug 2019 12:07:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64A4C42049;
 Tue, 20 Aug 2019 12:07:44 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:07:44 +0000 (GMT)
Subject: [PATCH v5 29/31] powerpc/fadump: consider f/w load area
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:37:43 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-4275-0000-0000-0000035B1371
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-4276-0000-0000-0000386D335C
Message-Id: <156630286359.8896.1571256853376924215.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200129
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
 arch/powerpc/kernel/fadump-common.h          |   11 +---------
 arch/powerpc/kernel/fadump.c                 |   11 +++++++++-
 arch/powerpc/platforms/powernv/opal-fadump.c |   29 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h |    7 ++++++
 arch/powerpc/platforms/pseries/rtas-fadump.c |    6 +++++
 arch/powerpc/platforms/pseries/rtas-fadump.h |    9 ++++++++
 6 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index ba8481b..55e4f25 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -22,16 +22,6 @@
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
 
@@ -139,6 +129,7 @@ struct fadump_ops {
 	ulong	(*fadump_init_mem_struct)(struct fw_dump *fadump_config);
 	ulong	(*fadump_get_metadata_size)(void);
 	int	(*fadump_setup_metadata)(struct fw_dump *fadump_config);
+	ulong	(*fadump_get_bootmem_min)(void);
 	int	(*fadump_register)(struct fw_dump *fadump_config);
 	int	(*fadump_unregister)(struct fw_dump *fadump_config);
 	int	(*fadump_invalidate)(struct fw_dump *fadump_config);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 43038f5..4b168c4 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -238,7 +238,8 @@ static inline unsigned long fadump_calculate_reserve_size(void)
 	if (memory_limit && size > memory_limit)
 		size = memory_limit;
 
-	return (size > MIN_BOOT_MEM ? size : MIN_BOOT_MEM);
+	return (size > fw_dump.ops->fadump_get_bootmem_min() ? size :
+		fw_dump.ops->fadump_get_bootmem_min());
 }
 
 /*
@@ -291,6 +292,14 @@ int __init fadump_reserve_mem(void)
 				ALIGN(fw_dump.boot_memory_size,
 							FADUMP_CMA_ALIGNMENT);
 #endif
+
+		if (fw_dump.boot_memory_size <
+		    fw_dump.ops->fadump_get_bootmem_min()) {
+			pr_err("Can't enable fadump with boot memory size (0x%lx) less than 0x%lx\n",
+			       fw_dump.boot_memory_size,
+			       fw_dump.ops->fadump_get_bootmem_min());
+			goto error_out;
+		}
 	}
 
 	/*
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 58faa38..50cf9e6 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -11,6 +11,7 @@
 
 #include <linux/string.h>
 #include <linux/seq_file.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/mm.h>
@@ -271,6 +272,11 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
 	return err;
 }
 
+static ulong opal_fadump_get_bootmem_min(void)
+{
+	return OPAL_FADUMP_MIN_BOOT_MEM;
+}
+
 static int opal_fadump_register(struct fw_dump *fadump_conf)
 {
 	int i, err = -EIO;
@@ -587,6 +593,7 @@ static struct fadump_ops opal_fadump_ops = {
 	.fadump_init_mem_struct		= opal_fadump_init_mem_struct,
 	.fadump_get_metadata_size	= opal_fadump_get_metadata_size,
 	.fadump_setup_metadata		= opal_fadump_setup_metadata,
+	.fadump_get_bootmem_min		= opal_fadump_get_bootmem_min,
 	.fadump_register		= opal_fadump_register,
 	.fadump_unregister		= opal_fadump_unregister,
 	.fadump_invalidate		= opal_fadump_invalidate,
@@ -600,6 +607,7 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 {
 	unsigned long dn;
 	const __be32 *prop;
+	int i, len;
 
 	/*
 	 * Check if Firmware-Assisted Dump is supported. if yes, check
@@ -616,6 +624,27 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
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
+			if (end > OPAL_FADUMP_MIN_BOOT_MEM) {
+				pr_err("F/W load area: 0x%llx-0x%llx\n",
+				       base, end);
+				pr_err("F/W version not supported!\n");
+				return 1;
+			}
+		}
+	}
+
 	fadump_conf->ops		= &opal_fadump_ops;
 	fadump_conf->fadump_supported	= 1;
 
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index b1a340b..ae71a16 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -11,6 +11,13 @@
 
 #include <asm/reg.h>
 
+/*
+ * With kernel & initrd loaded at 512MB (with 256MB size), enforce a minimum
+ * boot memory size of 768MB to ensure f/w loading kernel and initrd doesn't
+ * mess with crash'ed kernel's memory during MPIPL.
+ */
+#define OPAL_FADUMP_MIN_BOOT_MEM		(0x30000000UL)
+
 /* OPAL FADump structure format version */
 #define OPAL_FADUMP_VERSION			0x1
 
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 6164c5a..7dee6d0 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -136,6 +136,11 @@ static int rtas_fadump_setup_metadata(struct fw_dump *fadump_conf)
 	return 0;
 }
 
+static ulong rtas_fadump_get_bootmem_min(void)
+{
+	return RTAS_FADUMP_MIN_BOOT_MEM;
+}
+
 static int rtas_fadump_register(struct fw_dump *fadump_conf)
 {
 	int rc, err = -EIO;
@@ -507,6 +512,7 @@ static struct fadump_ops rtas_fadump_ops = {
 	.fadump_init_mem_struct		= rtas_fadump_init_mem_struct,
 	.fadump_get_metadata_size	= rtas_fadump_get_metadata_size,
 	.fadump_setup_metadata		= rtas_fadump_setup_metadata,
+	.fadump_get_bootmem_min		= rtas_fadump_get_bootmem_min,
 	.fadump_register		= rtas_fadump_register,
 	.fadump_unregister		= rtas_fadump_unregister,
 	.fadump_invalidate		= rtas_fadump_invalidate,
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index a3a2918..feaeb75 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -12,6 +12,15 @@
 #ifndef __PPC64_RTAS_FA_DUMP_H__
 #define __PPC64_RTAS_FA_DUMP_H__
 
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

