Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825032024D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 01:53:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj90b0bjVz3cHy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 11:53:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sioyeRCh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sioyeRCh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj9061FLJz3bVZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 11:52:37 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11K0VtFv132651; Fri, 19 Feb 2021 19:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OSByV+b1Nklm13aT9EiqD6ae/H4Zz6W+SPfdmBvZsCo=;
 b=sioyeRChu6DdQVvOTKELFPFyQqnfbJWwwM6frENi3CcszG7xR8/DjHYzU6WzJL9cFfs3
 m1BVf7yP49lg4LhS8Rf0sHkygsSVnXPmRiJw7DoFldGIEI+AV8sh7J8Xuwr3WCIIskAH
 dYFdJgrlD9/fR12bXi5pZNcDWI6BkL+rwReSOAKFRII3BZR7heQqvv/UcrhMyRvHvN4g
 /QZjgqxmmtsktBnjU4qoTKzK4QkiUDliwkxXINnI58MtQFWVnrLREEVsYFdugcNDlIvU
 B1cmlf5uh1KzQoJOUWephOtwKQ22Y2NQDlQU7Aj756J/652/oMOGQ1b3bdDOyfmm9lXF MQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36tqp7rj09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 19:52:22 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11K0qBD1014875;
 Sat, 20 Feb 2021 00:52:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 36p6dadmu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Feb 2021 00:52:21 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11K0qKFb33751520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Feb 2021 00:52:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E79FAC05F;
 Sat, 20 Feb 2021 00:52:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68FFCAC060;
 Sat, 20 Feb 2021 00:52:17 +0000 (GMT)
Received: from manicouagan.localdomain.com (unknown [9.85.174.98])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 20 Feb 2021 00:52:17 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/kexec_file: Restore FDT size estimation for kdump
 kernel
Date: Fri, 19 Feb 2021 21:52:04 -0300
Message-Id: <20210220005204.1417200-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190196
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
Cc: Rob Herring <robh@kernel.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump
kernel") fixed how elf64_load() estimates the FDT size needed by the
crashdump kernel.

At the same time, commit 130b2d59cec0 ("powerpc: Use common
of_kexec_alloc_and_setup_fdt()") changed the same code to use the generic
function of_kexec_alloc_and_setup_fdt() to calculate the FDT size. That
change made the code overestimate it a bit by counting twice the space
required for the kernel command line and /chosen properties.

Therefore change kexec_fdt_totalsize_ppc64() to calculate just the extra
space needed by the kdump kernel, and change the function name so that it
better reflects what the function is now doing.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 arch/powerpc/include/asm/kexec.h  |  2 +-
 arch/powerpc/kexec/elf_64.c       |  2 +-
 arch/powerpc/kexec/file_load_64.c | 26 ++++++++------------------
 3 files changed, 10 insertions(+), 20 deletions(-)

Applies on top of next-20210219.

Changes since v1:

- Adjusted comment describing kexec_extra_fdt_size_ppc64() as suggested
  by Lakshmi.

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index baab158e215c..5a11cc8d2350 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -128,7 +128,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr);
-unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image);
+unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
 int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline);
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 0492ca6003f3..5a569bb51349 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
 					   initrd_len, cmdline,
-					   kexec_fdt_totalsize_ppc64(image));
+					   kexec_extra_fdt_size_ppc64(image));
 	if (!fdt) {
 		pr_err("Error setting up the new device tree.\n");
 		ret = -EINVAL;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 3609de30a170..297f73795a1f 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -927,37 +927,27 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 }
 
 /**
- * kexec_fdt_totalsize_ppc64 - Return the estimated size needed to setup FDT
- *                             for kexec/kdump kernel.
- * @image:                     kexec image being loaded.
+ * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
+ *                              setup FDT for kexec/kdump kernel.
+ * @image:                      kexec image being loaded.
  *
- * Returns the estimated size needed for kexec/kdump kernel FDT.
+ * Returns the estimated extra size needed for kexec/kdump kernel FDT.
  */
-unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image)
+unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 {
-	unsigned int fdt_size;
 	u64 usm_entries;
 
-	/*
-	 * The below estimate more than accounts for a typical kexec case where
-	 * the additional space is to accommodate things like kexec cmdline,
-	 * chosen node with properties for initrd start & end addresses and
-	 * a property to indicate kexec boot..
-	 */
-	fdt_size = fdt_totalsize(initial_boot_params) + (2 * COMMAND_LINE_SIZE);
 	if (image->type != KEXEC_TYPE_CRASH)
-		return fdt_size;
+		return 0;
 
 	/*
-	 * For kdump kernel, also account for linux,usable-memory and
+	 * For kdump kernel, account for linux,usable-memory and
 	 * linux,drconf-usable-memory properties. Get an approximate on the
 	 * number of usable memory entries and use for FDT size estimation.
 	 */
 	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
 		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
-	fdt_size += (unsigned int)(usm_entries * sizeof(u64));
-
-	return fdt_size;
+	return (unsigned int)(usm_entries * sizeof(u64));
 }
 
 /**
