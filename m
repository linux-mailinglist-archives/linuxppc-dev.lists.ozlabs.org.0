Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3497624914
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 19:08:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7VFJ63nHz3dty
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 05:08:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iT30AsLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iT30AsLo;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7VCH73fgz3cMJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 05:06:35 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAHqOLw028088;
	Thu, 10 Nov 2022 18:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6yrW636fqCp62zNO6e7icAOgbXhM+JFZKFb7pIKsSuo=;
 b=iT30AsLoEJb7+YFbxBU1jonNUwkumazsHkC1Li4N2nCSUkRMECQgUflyCCYvQYgR2jDG
 p3HGAizlCzoh2NAWv3VKTNJwHs1Ol04lWH1AMnpCSnSx/Des1BAW1E/2f3ytaJ6p+ZlU
 +EauujAZPyi54j9c0+/rSvvumiLzVJZ0rZE1zfXPV5X3xIiFNm0FMUTo+GZlJe1/r+Tz
 3i2c/YMTC1EI1e/CSlgIFj1o82LzYkzouMAihtg3YnkVawjgJkSikGTF4apbSYnKraFz
 qd93p+xPS7O77twRhcvlaYC7OOBU8ifJ2xMNJlGQuFHA7jeVWte/U/hpRHYMO/Ge31th 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks635ren4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:06:26 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AAHr131029255;
	Thu, 10 Nov 2022 18:06:26 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks635rem4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:06:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AAHoYZN015561;
	Thu, 10 Nov 2022 18:06:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04fra.de.ibm.com with ESMTP id 3kngmqnhdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:06:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AAI6MDH57672058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 18:06:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50A2CAE051;
	Thu, 10 Nov 2022 18:06:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F19F4AE045;
	Thu, 10 Nov 2022 18:06:21 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.101.4.33])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 10 Nov 2022 18:06:21 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH v2 2/2] powerpc: Take in account addition CPU node when building kexec FDT
Date: Thu, 10 Nov 2022 19:06:19 +0100
Message-Id: <20221110180619.15796-3-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110180619.15796-1-ldufour@linux.ibm.com>
References: <20221110180619.15796-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sw4pmto-tG0SojxlH4a3ZrKvAo6-WjVf
X-Proofpoint-ORIG-GUID: crMpBqeFaocd5gAKAcUPc_NX1uDxQ3Gt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100126
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a system with a large number of CPUs, the creation of the FDT for a
kexec kernel may fail because the allocated FDT is not large enough.

When this happens, such a message is displayed on the console:

Unable to add ibm,processor-vadd-size property: FDT_ERR_NOSPACE

The property's name may change depending when the buffer overwrite is
detected.

Obviously the created FDT is missing information, and it is expected that
system dump or kexec kernel failed to run properly.

When the FDT is allocated, the size of the FDT the kernel received at boot
time is used and an extra size can be applied. Currently, only memory added
after boot time is taken in account, not the CPU nodes.

The extra size should take in account these additional CPU nodes and
compute the required extra space. To achieve that, the size of a CPU node,
including its subnode is computed once and multiplied by the number of
additional CPU nodes.

The assumption is that the size of the CPU node is _same_ for all the node,
the only variable part should be the name "PowerPC,POWERxx@##" where "##"
may vary a bit.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kexec/file_load_64.c | 60 ++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 349a781cea0b..6865cd7dc3ca 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -26,6 +26,7 @@
 #include <asm/firmware.h>
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
+#include <asm/prom.h>
 
 struct umem_info {
 	u64 *buf;		/* data buffer for usable-memory property */
@@ -928,6 +929,46 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 	return ret;
 }
 
+/**
+ * get_cpu_node_size - Compute the size of a CPU node in the FDT.
+ *                     This should be done only once and the value is stored in
+ *                     a static variable.
+ * Returns the max size of a CPU node in the FDT.
+ */
+static unsigned int cpu_node_size(void)
+{
+	static unsigned int cpu_node_size;
+	struct device_node *dn;
+	struct property *pp;
+
+	/*
+	 * Don't compute it twice, we are assuming that the per CPU node size
+	 * doesn't change during the system's life.
+	 */
+	if (cpu_node_size)
+		return cpu_node_size;
+
+	dn = of_find_node_by_type(NULL, "cpu");
+	if (!dn) {
+		/* Unlikely to happen */
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	/*
+	 * We compute the sub node size for a CPU node, assuming it
+	 * will be the same for all.
+	 */
+	cpu_node_size += strlen(dn->name) + 5;
+	for_each_property_of_node(dn, pp) {
+		cpu_node_size += strlen(pp->name);
+		cpu_node_size += pp->length;
+	}
+
+	of_node_put(dn);
+	return cpu_node_size;
+}
+
 /**
  * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
  *                              setup FDT for kexec/kdump kernel.
@@ -937,7 +978,10 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
  */
 unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 {
+	struct device_node *dn;
 	u64 usm_entries;
+	unsigned int cpu_nodes = 0;
+	unsigned int extra_size;
 
 	if (image->type != KEXEC_TYPE_CRASH)
 		return 0;
@@ -949,7 +993,21 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	 */
 	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
 		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
-	return (unsigned int)(usm_entries * sizeof(u64));
+
+	extra_size = (unsigned int)(usm_entries * sizeof(u64));
+
+	/*
+	 * Get the number of CPU nodes in the current DT. This allows to
+	 * reserve places for CPU nodes added since the boot time.
+	 */
+	for_each_node_by_type(dn, "cpu") {
+		cpu_nodes++;
+	}
+
+	if (cpu_nodes > boot_cpu_node_count)
+		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
+
+	return extra_size;
 }
 
 /**
-- 
2.38.1

