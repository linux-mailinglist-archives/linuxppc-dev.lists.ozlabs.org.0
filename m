Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8B4BD85B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 09:48:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2GDf4Fm7z3cT7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 19:48:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQzj8EhX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2GBL2PLKz3c9t
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:46:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hQzj8EhX; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K2GBL5cTWz4xbs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:46:50 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K2GBL5Z3fz4xcl; Mon, 21 Feb 2022 19:46:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hQzj8EhX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K2GBL2YgGz4xbs
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Feb 2022 19:46:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21L663bb011979; 
 Mon, 21 Feb 2022 08:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i/c1hxbI6CU4dQzMiR4F7EkSFS+zAQihKfDIhQadNhc=;
 b=hQzj8EhXjNIpt8CG5Yr5LbvjHyOb5iHOJgFLnfKP4UmJPtCgYS/r/iny1JyNAly/D3DD
 rI4UGnxnHsUsZXf3DmgPafS+WL363ZA4EsFqqIay5SMeByGp8+B9NI/zNHefQ9B/6Wlk
 GvzQMRIKSay1JFZ8gNwObYYhVkJGNacOz0n8MS/RWbdNHBGKatgris3q0Dz6zstcoisX
 vrWcD8bJ6fCai0d9MVU9qke23WoNGjj4dJrIcbSQHXKuUyY34IfpynDg4Z+3NXcLhwSr
 NhRehtnf6W2AuZcCZkLQT61aaAVlS/NnIGZv/Dcp0CNY9aaeo7d665ZLKlVVHMgkGs9Z Vg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eby66rfaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:46:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21L8govO009009;
 Mon, 21 Feb 2022 08:46:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ear68rv0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:46:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21L8keA047710710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 08:46:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51FD54204B;
 Mon, 21 Feb 2022 08:46:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A842642042;
 Mon, 21 Feb 2022 08:46:37 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.10.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 08:46:37 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 2/5] powerpc/kdump: setup kexec crash FDT
Date: Mon, 21 Feb 2022 14:16:21 +0530
Message-Id: <20220221084624.85792-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
References: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0ErF0HYrTpkbdCwGtE_Q2s8XDXJQci6J
X-Proofpoint-GUID: 0ErF0HYrTpkbdCwGtE_Q2s8XDXJQci6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_03,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210052
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DLPAR operation post kexec_load or kexec_file_load system call makes the
kexec crash kernel FDT stale. Booting kdump kernel with stale FDT leads
to kernel hang. To keep the kdump FDT updated kdump reload is performed
after DLPAR operation.

The kdump reloading after each DLPAR operation can be avoided if kdump_load
and kexec_file_load can use the FDT created and maintained by the kernel.

Set up a kexec crash FDT in crashkernel reserved region by allocating a memory
hole in crashkernel reserved region. Subsequent patches take care of updating
this FDT and using this FDT in kexec_load and kexec_file_load system calls.

A new config KEXEC_CRASH_FDT is added to include this feature at the build
time.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig             | 11 +++++++
 arch/powerpc/include/asm/kexec.h |  5 +++
 arch/powerpc/kexec/core_64.c     | 52 ++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ba5b66189358..b11a50851d2c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -634,6 +634,17 @@ config PRESERVE_FA_DUMP
 	  memory preserving kernel boot would process this crash data.
 	  Petitboot kernel is the typical usecase for this option.
 
+config KEXEC_CRASH_FDT
+	bool "Update crash kernel FDT on hotplug event"
+	depends on CRASH_DUMP && HOTPLUG_CPU
+	help
+	  This option avoids the need to reload kdump on every hotplug event.
+	  During boot, the kernel pre-allocates the space for kdump FDT in
+	  the reserved area and uses the same space to store the FDT created
+	  during kexec_load or kexec_file_load. This helps the kernel to just
+	  update the FDT with the latest hotplug event info rather than
+	  preparing and reloading all the kexec components again.
+
 config OPAL_CORE
 	bool "Export OPAL memory as /sys/firmware/opal/core"
 	depends on PPC64 && PPC_POWERNV
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c2398140aa3b..dc5b29eb2ddb 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -119,6 +119,11 @@ int setup_purgatory(struct kimage *image, const void *slave_code,
 #ifdef CONFIG_PPC64
 struct kexec_buf;
 
+#ifdef CONFIG_KEXEC_CRASH_FDT
+extern void *kexec_crash_fdt;
+extern u32 kexec_crash_fdt_size;
+#endif /* CONFIG_KEXEC_CRASH_FDT */
+
 int load_crashdump_segments_ppc64(struct kimage *image,
 				  struct kexec_buf *kbuf);
 int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 583eb7fa3388..be15aaf17a88 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -19,6 +19,7 @@
 #include <linux/memblock.h>
 
 #include <asm/page.h>
+#include <asm/kexec.h>
 #include <asm/current.h>
 #include <asm/machdep.h>
 #include <asm/cacheflush.h>
@@ -34,6 +35,13 @@
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
 
+#ifdef CONFIG_KEXEC_CRASH_FDT
+void *kexec_crash_fdt;
+EXPORT_SYMBOL_GPL(kexec_crash_fdt);
+u32 kexec_crash_fdt_size;
+EXPORT_SYMBOL_GPL(kexec_crash_fdt_size);
+#endif
+
 int default_machine_kexec_prepare(struct kimage *image)
 {
 	int i;
@@ -571,3 +579,47 @@ static int __init export_htab_values(void)
 }
 late_initcall(export_htab_values);
 #endif /* CONFIG_PPC_BOOK3S_64 */
+
+#ifdef CONFIG_KEXEC_CRASH_FDT
+/* Calculate the size of kexec crash fdt */
+static u32 get_kexec_crash_fdt_size(void)
+{
+	// TODO: add logic to calculate it based on system configuration
+	return 1024*1024;
+}
+
+/* Setup the memory hole for kdump fdt in reserved region below RMA.
+ */
+static int __init setup_kexec_crash_fdt(void)
+{
+	int ret = 0;
+	struct crash_mem *exclude_ranges = NULL;
+	struct kexec_buf kbuf;
+
+	/* make sure kdump is enabled and necessary memory reservation
+	 * is done. The kexec crash FDT will be part of reserved memory
+	 * region.
+	 */
+	if (!crash_get_memory_size())
+		goto out;
+
+	if (get_exclude_memory_ranges(&exclude_ranges))
+		goto out;
+
+	/* locate memory hole for kdump fdt in reserved region below RMA */
+	kbuf.mem = 0;
+	kbuf.memsz = (unsigned long) get_kexec_crash_fdt_size();
+	ret = locate_mem_hole_top_down_ppc64(&kbuf, crashk_res.start,
+					     min(ppc64_rma_size, crashk_res.end),
+					     exclude_ranges);
+	if (ret)
+		return -ENOMEM;
+
+	kexec_crash_fdt = __va(kbuf.mem);
+	kexec_crash_fdt_size = kbuf.memsz;
+
+out:
+	return ret;
+}
+late_initcall(setup_kexec_crash_fdt);
+#endif /* CONFIG_KEXEC_CRASH_FDT */
-- 
2.34.1

