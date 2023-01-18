Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CDE671443
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:33:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxbZ828Z3z3ff4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:33:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k9X17KQB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k9X17KQB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxb4N060Qz3fBX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:31 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I4Hm14008429;
	Wed, 18 Jan 2023 06:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gKmctAbEoVSJh+STbpQjqFTlXKnJs2vfjJ8NG4/pbcM=;
 b=k9X17KQB0/vBrtXxMYGwqnJTuD35wIoRbGpxXIvN3ntk1P3oobavdKZMsxia53PbNw7I
 POA2RZEx5iPIj3FaLWT3makewc/xybjB243jCN4SGkXewJzaFlFZZkNQUcKGFBnlhEHh
 /NisVSZwbFpV/fRPaxklqVyMW5yB9qw+NnA+AGl/OcWbX3uk/QNlnL+8Poh5ODZfUCVr
 VY61zy2uEnlw2PPdfIBGa/lr7X/WZGjg8/2oNi/V6RsQCWQEzoa1bICae/9l1LYQ9GDv
 155x5z8k+kB2dHe0rotsL+xld9aZAo1k1wRbFa1KWhoeCoLZa+nsGLX4NeG3ez0I6f2B FQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n69ma1wvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HLo66C005139;
	Wed, 18 Jan 2023 06:11:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16mtnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I6BFlm44302814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 06:11:15 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 336EA2004D;
	Wed, 18 Jan 2023 06:11:15 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F6F820040;
	Wed, 18 Jan 2023 06:11:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 06:11:14 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 94173609BE;
	Wed, 18 Jan 2023 17:11:08 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 21/24] powerpc/pseries: Pass PLPKS password on kexec
Date: Wed, 18 Jan 2023 17:10:46 +1100
Message-Id: <20230118061049.1006141-22-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061049.1006141-1-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8NB8u-wE6gBWeMo37igpwsigabP7qowd
X-Proofpoint-ORIG-GUID: 8NB8u-wE6gBWeMo37igpwsigabP7qowd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=867
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301180051
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Before interacting with the PLPKS, we ask the hypervisor to generate a
password for the current boot, which is then required for most further
PLPKS operations.

If we kexec into a new kernel, the new kernel will try and fail to
generate a new password, as the password has already been set.

Pass the password through to the new kernel via the device tree, in
/chosen/plpks-pw. Check for the presence of this property before trying
to generate a new password - if it exists, use the existing password and
remove it from the device tree.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch
---
 arch/powerpc/kexec/file_load_64.c      | 17 ++++++++++++++++-
 arch/powerpc/platforms/pseries/plpks.c | 18 +++++++++++++++++-
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index af8854f9eae3..f0e25700ae77 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -27,6 +27,7 @@
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
 #include <asm/prom.h>
+#include <asm/plpks.h>
 
 struct umem_info {
 	u64 *buf;		/* data buffer for usable-memory property */
@@ -1155,7 +1156,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_len, const char *cmdline)
 {
 	struct crash_mem *umem = NULL, *rmem = NULL;
-	int i, nr_ranges, ret;
+	int i, nr_ranges, ret, chosen_node;
 
 	/*
 	 * Restrict memory usage for kdump kernel by setting up
@@ -1230,6 +1231,20 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		}
 	}
 
+#ifdef CONFIG_PSERIES_PLPKS
+	// If we have PLPKS active, we need to provide the password
+	if (plpks_is_available()) {
+		chosen_node = fdt_path_offset(fdt, "/chosen");
+		if (!chosen_node) {
+			pr_err("Can't find chosen node: %s\n",
+			       fdt_strerror(chosen_node));
+			goto out;
+		}
+		ret = fdt_setprop(fdt, chosen_node, "ibm,plpks-pw",
+				  plpks_get_password(), plpks_get_passwordlen());
+	}
+#endif // CONFIG_PSERIES_PLPKS
+
 out:
 	kfree(rmem);
 	kfree(umem);
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index b3c7410a4f13..0350f10e1755 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/of.h>
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
 #include <asm/plpks.h>
@@ -126,7 +127,22 @@ static int plpks_gen_password(void)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
 	u8 *password, consumer = PLPKS_OS_OWNER;
-	int rc;
+	struct property *prop;
+	int rc, len;
+
+	// Before we generate the password, we may have been booted by kexec and
+	// provided with a previous password.  Check for that first.
+	prop = of_find_property(of_chosen, "ibm,plpks-pw", &len);
+	if (prop) {
+		ospasswordlength = (u16)len;
+		ospassword = kzalloc(ospasswordlength, GFP_KERNEL);
+		if (!ospassword) {
+			of_remove_property(of_chosen, prop);
+			return -ENOMEM;
+		}
+		memcpy(ospassword, prop->value, len);
+		return of_remove_property(of_chosen, prop);
+	}
 
 	// The password must not cross a page boundary, so we align to the next power of 2
 	password = kzalloc(roundup_pow_of_two(maxpwsize), GFP_KERNEL);
-- 
2.39.0

