Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A28C0F16
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 14:00:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MhNHZD1T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrDS70Qrz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:00:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MhNHZD1T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrBD5SSQz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 21:58:12 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 449BgFku016242;
	Thu, 9 May 2024 11:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cZ2gUxtU8hT9E3We2QPtH4/qhGoRlI7P8NvNpMxldO0=;
 b=MhNHZD1T5WDjrcSt8PrnihWRVyBUab/Av8G2IifAE52jIiZEUQOCPaFX54gybd07s9vh
 FjRbmXCpk6gmKLABoRoqvKwW8QH04Kb5DCQdjGQ0QeKMlvB3/V/fUJkgOfaCMpqtzuWh
 R79DuVUIzkeZZx+5BDf3KkknfSoqttItoSYvdLIQqjeq26ky80nZfHnYijWRM3XStpfH
 7jL7k8PcuOEo8apAxtvKUdItmfTVQTfD2fi/+3F8S6lX46q3cuCZD9UXoOBz7LOCLdAP
 fwqZUpNbmqAhFod6225B7GNtoJsEhmF6m82HqAWeFowlUqd8+5P9ufafkREz9cOD3519 /A== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0wug811r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 11:58:07 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 449BXR7p009268;
	Thu, 9 May 2024 11:58:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xyshtamp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 11:58:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 449Bw17l52691224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 11:58:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 362E420043;
	Thu,  9 May 2024 11:58:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7B5620040;
	Thu,  9 May 2024 11:57:59 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2024 11:57:59 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/3] powerpc/fadump: setup additional parameters for dump capture kernel
Date: Thu,  9 May 2024 17:27:54 +0530
Message-ID: <20240509115755.519982-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509115755.519982-1-hbathini@linux.ibm.com>
References: <20240509115755.519982-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ngnrehCWR4q1JJo0mVCvtcyhW4gfYXWj
X-Proofpoint-GUID: ngnrehCWR4q1JJo0mVCvtcyhW4gfYXWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405090079
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For fadump case, passing additional parameters to dump capture kernel
helps in minimizing the memory footprint for it and also provides the
flexibility to disable components/modules, like hugepages, that are
hindering the boot process of the special dump capture environment.

Set up a dedicated parameter area to be passed to the capture kernel.
This area type is defined as RTAS_FADUMP_PARAM_AREA. Sysfs attribute
'/sys/kernel/fadump/bootargs_append' is exported to the userspace to
specify the additional parameters to be passed to the capture kernel

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump-internal.h   |  3 +
 arch/powerpc/kernel/fadump.c                 | 87 ++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c |  6 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c | 35 +++++++-
 arch/powerpc/platforms/pseries/rtas-fadump.h | 11 ++-
 5 files changed, 133 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 35787fa1ac60..e83869a4eb6a 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -124,6 +124,8 @@ struct fw_dump {
 	unsigned long	cpu_notes_buf_vaddr;
 	unsigned long	cpu_notes_buf_size;
 
+	unsigned long	param_area;
+
 	/*
 	 * Maximum size supported by firmware to copy from source to
 	 * destination address per entry.
@@ -138,6 +140,7 @@ struct fw_dump {
 	unsigned long	dump_active:1;
 	unsigned long	dump_registered:1;
 	unsigned long	nocma:1;
+	unsigned long	param_area_supported:1;
 
 	struct fadump_ops	*ops;
 };
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index fe6be00451b9..6d35b09d6f3a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1431,6 +1431,43 @@ static ssize_t registered_show(struct kobject *kobj,
 	return sprintf(buf, "%d\n", fw_dump.dump_registered);
 }
 
+static ssize_t bootargs_append_show(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   char *buf)
+{
+	return sprintf(buf, "%s\n", (char *)__va(fw_dump.param_area));
+}
+
+static ssize_t bootargs_append_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	char *params;
+
+	if (!fw_dump.fadump_enabled || fw_dump.dump_active)
+		return -EPERM;
+
+	if (count >= COMMAND_LINE_SIZE)
+		return -EINVAL;
+
+	/*
+	 * Fail here instead of handling this scenario with
+	 * some silly workaround in capture kernel.
+	 */
+	if (saved_command_line_len + count >= COMMAND_LINE_SIZE) {
+		pr_err("Appending parameters exceeds cmdline size!\n");
+		return -ENOSPC;
+	}
+
+	params = __va(fw_dump.param_area);
+	strscpy_pad(params, buf, COMMAND_LINE_SIZE);
+	/* Remove newline character at the end. */
+	if (params[count-1] == '\n')
+		params[count-1] = '\0';
+
+	return count;
+}
+
 static ssize_t registered_store(struct kobject *kobj,
 				struct kobj_attribute *attr,
 				const char *buf, size_t count)
@@ -1490,6 +1527,7 @@ static struct kobj_attribute enable_attr = __ATTR_RO(enabled);
 static struct kobj_attribute register_attr = __ATTR_RW(registered);
 static struct kobj_attribute mem_reserved_attr = __ATTR_RO(mem_reserved);
 static struct kobj_attribute hotplug_ready_attr = __ATTR_RO(hotplug_ready);
+static struct kobj_attribute bootargs_append_attr = __ATTR_RW(bootargs_append);
 
 static struct attribute *fadump_attrs[] = {
 	&enable_attr.attr,
@@ -1663,6 +1701,54 @@ static void __init fadump_process(void)
 	fadump_invalidate_release_mem();
 }
 
+/*
+ * Reserve memory to store additional parameters to be passed
+ * for fadump/capture kernel.
+ */
+static void fadump_setup_param_area(void)
+{
+	phys_addr_t range_start, range_end;
+
+	if (!fw_dump.param_area_supported || fw_dump.dump_active)
+		return;
+
+	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
+	if (radix_enabled()) {
+		/*
+		 * Anywhere in the upper half should be good enough as all memory
+		 * is accessible in real mode.
+		 */
+		range_start = memblock_end_of_DRAM() / 2;
+		range_end = memblock_end_of_DRAM();
+	} else {
+		/*
+		 * Passing additional parameters is supported for hash MMU only
+		 * if the first memory block size is 768MB or higher.
+		 */
+		if (ppc64_rma_size < 0x30000000)
+			return;
+
+		/*
+		 * 640 MB to 768 MB is not used by PFW/bootloader. So, try reserving
+		 * memory for passing additional parameters in this range to avoid
+		 * being stomped on by PFW/bootloader.
+		 */
+		range_start = 0x2A000000;
+		range_end = range_start + 0x4000000;
+	}
+
+	fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,
+						       COMMAND_LINE_SIZE,
+						       range_start,
+						       range_end);
+	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr)) {
+		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
+		return;
+	}
+
+	memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
+}
+
 /*
  * Prepare for firmware-assisted dump.
  */
@@ -1686,6 +1772,7 @@ int __init setup_fadump(void)
 	}
 	/* Initialize the kernel dump memory structure and register with f/w */
 	else if (fw_dump.reserve_dump_area_size) {
+		fadump_setup_param_area();
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 		register_fadump();
 	}
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 5a88d7efb48a..c9c1dfb35464 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -665,8 +665,10 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 		}
 	}
 
-	fadump_conf->ops		= &opal_fadump_ops;
-	fadump_conf->fadump_supported	= 1;
+	fadump_conf->ops			= &opal_fadump_ops;
+	fadump_conf->fadump_supported		= 1;
+	/* TODO: Add support to pass additional parameters */
+	fadump_conf->param_area_supported	= 0;
 
 	/*
 	 * Firmware supports 32-bit field for size. Align it to PAGE_SIZE
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 4db78b2bb2a8..eceb3289383e 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -18,6 +18,7 @@
 
 #include <asm/page.h>
 #include <asm/rtas.h>
+#include <asm/setup.h>
 #include <asm/fadump.h>
 #include <asm/fadump-internal.h>
 
@@ -81,6 +82,9 @@ static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
 			last_end = base + size;
 			fadump_conf->boot_mem_regs_cnt++;
 			break;
+		case RTAS_FADUMP_PARAM_AREA:
+			fadump_conf->param_area = be64_to_cpu(fdm->rgn[i].destination_address);
+			break;
 		default:
 			pr_warn("Section type %d unsupported on this kernel. Ignoring!\n", type);
 			break;
@@ -154,7 +158,17 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 		sec_cnt++;
 	}
 
+	/* Parameters area */
+	if (fadump_conf->param_area) {
+		fdm.rgn[sec_cnt].request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+		fdm.rgn[sec_cnt].source_data_type = cpu_to_be16(RTAS_FADUMP_PARAM_AREA);
+		fdm.rgn[sec_cnt].source_address = cpu_to_be64(fadump_conf->param_area);
+		fdm.rgn[sec_cnt].source_len = cpu_to_be64(COMMAND_LINE_SIZE);
+		fdm.rgn[sec_cnt].destination_address = cpu_to_be64(fadump_conf->param_area);
+		sec_cnt++;
+	}
 	fdm.header.dump_num_sections = cpu_to_be16(sec_cnt);
+
 	rtas_fadump_update_config(fadump_conf, &fdm);
 
 	return addr;
@@ -453,6 +467,13 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 				return rc;
 			}
 			break;
+		case RTAS_FADUMP_PARAM_AREA:
+			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len ||
+			    fdm_active->rgn[i].error_flags != 0) {
+				pr_warn("Failed to process additional parameters! Proceeding anyway..\n");
+				fadump_conf->param_area = 0;
+			}
+			break;
 		default:
 			/*
 			 * If the first/crashed kernel added a new region type that the
@@ -509,6 +530,13 @@ static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
 				   be64_to_cpu(fdm_ptr->rgn[i].source_len),
 				   be64_to_cpu(fdm_ptr->rgn[i].bytes_dumped));
 			break;
+		case RTAS_FADUMP_PARAM_AREA:
+			seq_printf(m, "\n[%#016llx-%#016llx]: cmdline append: '%s'\n",
+				   be64_to_cpu(fdm_ptr->rgn[i].destination_address),
+				   be64_to_cpu(fdm_ptr->rgn[i].destination_address) +
+				   be64_to_cpu(fdm_ptr->rgn[i].source_len) - 1,
+				   (char *)__va(be64_to_cpu(fdm_ptr->rgn[i].destination_address)));
+			break;
 		default:
 			seq_printf(m, "Unknown region type %d : Src: %#016llx, Dest: %#016llx, ",
 				   type, be64_to_cpu(fdm_ptr->rgn[i].source_address),
@@ -571,9 +599,10 @@ void __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	if (!token)
 		return;
 
-	fadump_conf->ibm_configure_kernel_dump = be32_to_cpu(*token);
-	fadump_conf->ops		= &rtas_fadump_ops;
-	fadump_conf->fadump_supported	= 1;
+	fadump_conf->ibm_configure_kernel_dump	= be32_to_cpu(*token);
+	fadump_conf->ops			= &rtas_fadump_ops;
+	fadump_conf->fadump_supported		= 1;
+	fadump_conf->param_area_supported	= 1;
 
 	/* Firmware supports 64-bit value for size, align it to pagesize. */
 	fadump_conf->max_copy_size = ALIGN_DOWN(U64_MAX, PAGE_SIZE);
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index 6740f4981bb8..c109abf6befd 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -23,6 +23,9 @@
 #define RTAS_FADUMP_HPTE_REGION		0x0002
 #define RTAS_FADUMP_REAL_MODE_REGION	0x0011
 
+/* OS defined sections */
+#define RTAS_FADUMP_PARAM_AREA		0x0100
+
 /* Dump request flag */
 #define RTAS_FADUMP_REQUEST_FLAG	0x00000001
 
@@ -31,12 +34,12 @@
 
 /*
  * The Firmware Assisted Dump Memory structure supports a maximum of 10 sections
- * in the dump memory structure. Presently, first two sections are used for
- * CPU and HPTE data, while the remaining eight sections can be used for
- * boot memory regions.
+ * in the dump memory structure. Presently, three sections are used for
+ * CPU state data, HPTE & Parameters area, while the remaining seven sections
+ * can be used for boot memory regions.
  */
 #define MAX_SECTIONS				10
-#define RTAS_FADUMP_MAX_BOOT_MEM_REGS		8
+#define RTAS_FADUMP_MAX_BOOT_MEM_REGS		7
 
 /* Kernel Dump section info */
 struct rtas_fadump_section {
-- 
2.45.0

