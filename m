Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0536919E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:19:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCmqj1b02z3fZq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:19:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HafP76kc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HafP76kc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmVB1jQDz3cYd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:04:33 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A7hGwP006814;
	Fri, 10 Feb 2023 08:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zSEZrMlK5XdvgnzG74xZ/ZPh+mM8+8y+gjBHHLL40qM=;
 b=HafP76kcZgiCBadFYK7iBCh0TMvmNEAX/Tu3eKDheSuevQ0hRqHLUCiUcF0YcRYvbEd8
 2AHYLaGUt4skkGwxX2tgDNzBOmw36J+c25YM/Lkm+fvzmKXcNyjGip5kRkaYbppUb5Mh
 02ovzSxaV7yHvWnbk38Z/KqNYi0gS88BR88oWC2j1P2SgYClnP8UItpZho9wiNzvXvuQ
 mi6LEn+KjscHv1ve4e1GHXWOC1sbWVmDoFe5q8B8jB1y3nVQMEKguCzyaKCQXKRD/m5s
 WcubVfWQ/cd5CJlmYMZm/wa/etQywdgqyPEfxF6YJ8IuZUqfnznjr51WV6T8YYvmR4gK Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnhsjrhr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:28 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A7jIOU014131;
	Fri, 10 Feb 2023 08:04:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnhsjrhph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:27 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319M5HkL017256;
	Fri, 10 Feb 2023 08:04:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nhf06w4au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:26 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84NqG23593382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31BB620040;
	Fri, 10 Feb 2023 08:04:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A3842004D;
	Fri, 10 Feb 2023 08:04:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:22 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E8BAA609C3;
	Fri, 10 Feb 2023 19:04:15 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 23/26] powerpc/pseries: Pass PLPKS password on kexec
Date: Fri, 10 Feb 2023 19:03:58 +1100
Message-Id: <20230210080401.345462-24-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UyQQHUI7rD3uf3eYxFOd24zj4LWhQWo_
X-Proofpoint-ORIG-GUID: ZZOfsixlVGk2DcgzlSCRD_Rb34zmUUX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100070
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Before interacting with the PLPKS, we ask the hypervisor to generate a
password for the current boot, which is then required for most further
PLPKS operations.

If we kexec into a new kernel, the new kernel will try and fail to
generate a new password, as the password has already been set.

Pass the password through to the new kernel via the device tree, in
/chosen/ibm,plpks-pw. Check for the presence of this property before
trying to generate a new password - if it exists, use the existing
password and remove it from the device tree.

This only works with the kexec_file_load() syscall, not the older
kexec_load() syscall, however if you're using Secure Boot then you want
to be using kexec_file_load() anyway.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch

v4: Fix compile when CONFIG_PSERIES_PLPKS=n (snowpatch)

    Fix error handling on fdt_path_offset() call (ruscur)

v5: Fix DT property name in commit message (npiggin)

    Clear prop in FDT during init to prevent password exposure (mpe)

    Rework to remove ifdefs from C code (npiggin)

v6: Rebase on top of 7294194b47e994753a86eee8cf1c61f3f36458a3 and
    fc546faa559538fb312c77e055243ece18ab3288

    Whitespace (stefanb)

    Use more const (stefanb)

    Get rid of FDT extra space allocation for node overhead, as it
    shouldn't be necessary (ruscur)

    Note kexec_file_load() restriction in commit message
---
 arch/powerpc/include/asm/plpks.h       | 14 ++++++
 arch/powerpc/kernel/prom.c             |  4 ++
 arch/powerpc/kexec/file_load_64.c      | 18 +++++---
 arch/powerpc/platforms/pseries/plpks.c | 61 ++++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 757313e00521..23b77027c916 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -176,6 +176,20 @@ u64 plpks_get_signedupdatealgorithms(void);
  */
 u16 plpks_get_passwordlen(void);
 
+/**
+ * Called in early init to retrieve and clear the PLPKS password from the DT.
+ */
+void plpks_early_init_devtree(void);
+
+/**
+ * Populates the FDT with the PLPKS password to prepare for kexec.
+ */
+int plpks_populate_fdt(void *fdt);
+#else // CONFIG_PSERIES_PLPKS
+static inline bool plpks_is_available(void) { return false; }
+static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
+static inline void plpks_early_init_devtree(void) { }
+static inline int plpks_populate_fdt(void *fdt) { BUILD_BUG(); }
 #endif // CONFIG_PSERIES_PLPKS
 
 #endif // _ASM_POWERPC_PLPKS_H
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 4f1c920aa13e..8a13b378770f 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -56,6 +56,7 @@
 #include <asm/drmem.h>
 #include <asm/ultravisor.h>
 #include <asm/prom.h>
+#include <asm/plpks.h>
 
 #include <mm/mmu_decl.h>
 
@@ -893,6 +894,9 @@ void __init early_init_devtree(void *params)
 		powerpc_firmware_features |= FW_FEATURE_PS3_POSSIBLE;
 #endif
 
+	/* If kexec left a PLPKS password in the DT, get it and clear it */
+	plpks_early_init_devtree();
+
 	tm_init();
 
 	DBG(" <- early_init_devtree()\n");
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 52085751f5f4..8a9469e1ce71 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -27,6 +27,7 @@
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
 #include <asm/prom.h>
+#include <asm/plpks.h>
 
 struct umem_info {
 	u64 *buf;		/* data buffer for usable-memory property */
@@ -977,12 +978,17 @@ static unsigned int cpu_node_size(void)
  */
 unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 {
-	unsigned int cpu_nodes, extra_size;
+	unsigned int cpu_nodes, extra_size = 0;
 	struct device_node *dn;
 	u64 usm_entries;
 
+	// Budget some space for the password blob. There's already extra space
+	// for the key name
+	if (plpks_is_available())
+		extra_size += (unsigned int)plpks_get_passwordlen();
+
 	if (image->type != KEXEC_TYPE_CRASH)
-		return 0;
+		return extra_size;
 
 	/*
 	 * For kdump kernel, account for linux,usable-memory and
@@ -992,9 +998,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	if (drmem_lmb_size()) {
 		usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
 			       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
-		extra_size = (unsigned int)(usm_entries * sizeof(u64));
-	} else {
-		extra_size = 0;
+		extra_size += (unsigned int)(usm_entries * sizeof(u64));
 	}
 
 	/*
@@ -1233,6 +1237,10 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		}
 	}
 
+	// If we have PLPKS active, we need to provide the password to the new kernel
+	if (plpks_is_available())
+		ret = plpks_populate_fdt(fdt);
+
 out:
 	kfree(rmem);
 	kfree(umem);
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 671a10acaebf..cdf09e5bd741 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -16,6 +16,9 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+#include <linux/memblock.h>
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
 #include <asm/plpks.h>
@@ -128,6 +131,12 @@ static int plpks_gen_password(void)
 	u8 *password, consumer = PLPKS_OS_OWNER;
 	int rc;
 
+	// If we booted from kexec, we could be reusing an existing password already
+	if (ospassword) {
+		pr_debug("Password of length %u already in use\n", ospasswordlength);
+		return 0;
+	}
+
 	// The password must not cross a page boundary, so we align to the next power of 2
 	password = kzalloc(roundup_pow_of_two(maxpwsize), GFP_KERNEL);
 	if (!password)
@@ -621,6 +630,58 @@ int plpks_read_bootloader_var(struct plpks_var *var)
 	return plpks_read_var(PLPKS_BOOTLOADER_OWNER, var);
 }
 
+int plpks_populate_fdt(void *fdt)
+{
+	int chosen_offset = fdt_path_offset(fdt, "/chosen");
+
+	if (chosen_offset < 0) {
+		pr_err("Can't find chosen node: %s\n",
+		       fdt_strerror(chosen_offset));
+		return chosen_offset;
+	}
+
+	return fdt_setprop(fdt, chosen_offset, "ibm,plpks-pw", ospassword, ospasswordlength);
+}
+
+// Once a password is registered with the hypervisor it cannot be cleared without
+// rebooting the LPAR, so to keep using the PLPKS across kexec boots we need to
+// recover the previous password from the FDT.
+//
+// There are a few challenges here.  We don't want the password to be visible to
+// users, so we need to clear it from the FDT.  This has to be done in early boot.
+// Clearing it from the FDT would make the FDT's checksum invalid, so we have to
+// manually cause the checksum to be recalculated.
+void __init plpks_early_init_devtree(void)
+{
+	void *fdt = initial_boot_params;
+	int chosen_node = fdt_path_offset(fdt, "/chosen");
+	const u8 *password;
+	int len;
+
+	if (chosen_node < 0)
+		return;
+
+	password = fdt_getprop(fdt, chosen_node, "ibm,plpks-pw", &len);
+	if (len <= 0) {
+		pr_debug("Couldn't find ibm,plpks-pw node.\n");
+		return;
+	}
+
+	ospassword = memblock_alloc_raw(len, SMP_CACHE_BYTES);
+	if (!ospassword) {
+		pr_err("Error allocating memory for password.\n");
+		goto out;
+	}
+
+	memcpy(ospassword, password, len);
+	ospasswordlength = (u16)len;
+
+out:
+	fdt_nop_property(fdt, chosen_node, "ibm,plpks-pw");
+	// Since we've cleared the password, we must update the FDT checksum
+	early_init_dt_verify(fdt);
+}
+
 static __init int pseries_plpks_init(void)
 {
 	int rc;
-- 
2.39.1

