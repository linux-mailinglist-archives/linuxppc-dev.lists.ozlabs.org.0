Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8830F2B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:52:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWcNP5ZYMzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:52:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbwg5Y5dzDwlT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:31:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aSmSdG40; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4DWbwg2C1Pz9tD5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:31:31 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DWbwf71S7z9tD3; Thu,  4 Feb 2021 22:31:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aSmSdG40; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DWbwf1B1dz9t19;
 Thu,  4 Feb 2021 22:31:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114B67Ol026397; Thu, 4 Feb 2021 06:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=iw3r13OE9yJxvplZfDM3/nYSRoGUFrYF6yJBrHnpjOc=;
 b=aSmSdG40k5AfQO99BiBnFaXr6FTeCKwNn+6hj41z9wUl+I4ij/MhkZHO2HsVZJQT+auT
 V4bKYTHBl9pLTFojKbTvYO8+coeNthBwwdvWZEUGYtlrC8b5EIkygB5et0FZ55Zatkzk
 K9blpCMAbWwRBEbENrV7zwq4a3l05JljTREhlvHIKPUuxX+Q4q5d/abKgo2M7RdX5QPk
 xSJzyPwCX1UJlEJS6zJ5/xNP1qPwnCJbJ2tcX0IMP9wh6wNL35BdW/NKpAChqlICb5tf
 Tf4YXsRiA9yu/DnKoZXxL5+7yS9dsTvBRggmG+Ub3NUVN+VWJY7a7eJ2wQXAM222kQAA 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gfdjs72c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 06:31:27 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114B6NMu028115;
 Thu, 4 Feb 2021 06:31:27 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gfdjs71q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 06:31:27 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114BQnqK011541;
 Thu, 4 Feb 2021 11:31:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf2ex6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 11:31:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114BVMiF42598788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 11:31:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09240A4040;
 Thu,  4 Feb 2021 11:31:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 170DAA4053;
 Thu,  4 Feb 2021 11:31:18 +0000 (GMT)
Received: from [192.168.0.9] (unknown [9.211.144.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 11:31:17 +0000 (GMT)
Subject: [PATCH] powerpc/kexec_file: fix FDT size estimation for kdump kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 04 Feb 2021 17:01:10 +0530
Message-ID: <161243826811.119001.14083048209224609814.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_05:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040065
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, stable@vger.kernel.org,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On systems with large amount of memory, loading kdump kernel through
kexec_file_load syscall may fail with the below error:

    "Failed to update fdt with linux,drconf-usable-memory property"

This happens because the size estimation for kdump kernel's FDT does
not account for the additional space needed to setup usable memory
properties. Fix it by accounting for the space needed to include
linux,usable-memory & linux,drconf-usable-memory properties while
estimating kdump kernel's FDT size.

Fixes: 6ecd0163d360 ("powerpc/kexec_file: Add appropriate regions for memory reserve map")
Cc: stable@vger.kernel.org
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |    1 +
 arch/powerpc/kexec/elf_64.c       |    2 +-
 arch/powerpc/kexec/file_load_64.c |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 55d6ede30c19..9ab344d29a54 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -136,6 +136,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr);
+unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image);
 int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline);
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index d0e459bb2f05..9842e33533df 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -102,7 +102,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
-	fdt_size = fdt_totalsize(initial_boot_params) * 2;
+	fdt_size = kexec_fdt_totalsize_ppc64(image);
 	fdt = kmalloc(fdt_size, GFP_KERNEL);
 	if (!fdt) {
 		pr_err("Not enough memory for the device tree.\n");
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index c69bcf9b547a..67fa7bfcfa30 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -21,6 +21,7 @@
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <asm/setup.h>
 #include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
@@ -925,6 +926,39 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 	return ret;
 }
 
+/**
+ * kexec_fdt_totalsize_ppc64 - Return the estimated size needed to setup FDT
+ *                             for kexec/kdump kernel.
+ * @image:                     kexec image being loaded.
+ *
+ * Returns the estimated size needed for kexec/kdump kernel FDT.
+ */
+unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image)
+{
+	unsigned int fdt_size;
+	uint64_t usm_entries;
+
+	/*
+	 * The below estimate more than accounts for a typical kexec case where
+	 * the additional space is to accommodate things like kexec cmdline,
+	 * chosen node with properties for initrd start & end addresses and
+	 * a property to indicate kexec boot..
+	 */
+	fdt_size = fdt_totalsize(initial_boot_params) + (2 * COMMAND_LINE_SIZE);
+	if (image->type != KEXEC_TYPE_CRASH)
+		return fdt_size;
+
+	/*
+	 * For kdump kernel, also account for linux,usable-memory and
+	 * linux,drconf-usable-memory properties. Get an approximate on the
+	 * number of usable memory entries and use for FDT size estimation.
+	 */
+	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
+		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
+	fdt_size += (unsigned int)(usm_entries * sizeof(uint64_t));
+	return fdt_size;
+}
+
 /**
  * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
  *                       being loaded.


