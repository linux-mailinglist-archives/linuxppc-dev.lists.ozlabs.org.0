Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA70220C76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:54:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6G4j2m7HzDql9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 21:53:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6G2s3xP1zDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 21:52:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6G2s0Q3Qz8sZx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 21:52:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6G2r72nkz9sTX; Wed, 15 Jul 2020 21:52:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6G2r3ptZz9sTS;
 Wed, 15 Jul 2020 21:52:18 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FBYM84047694; Wed, 15 Jul 2020 07:52:14 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3298ebmcbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 07:52:14 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06FBjuJk003424;
 Wed, 15 Jul 2020 11:52:12 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 327q2y1v9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 11:52:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06FBq9eH48955640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 11:52:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E72AD4203F;
 Wed, 15 Jul 2020 11:52:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD19742041;
 Wed, 15 Jul 2020 11:52:07 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.160.119.166])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 11:52:07 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3] powerpc/pseries: detect secure and trusted boot state of
 the system.
Date: Wed, 15 Jul 2020 07:52:01 -0400
Message-Id: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_10:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=1
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150093
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device-tree property to check secure and trusted boot state is
different for guests(pseries) compared to baremetal(powernv).

This patch updates the existing is_ppc_secureboot_enabled() and
is_ppc_trustedboot_enabled() functions to add support for pseries.

The secureboot and trustedboot state are exposed via device-tree property:
/proc/device-tree/ibm,secure-boot and /proc/device-tree/ibm,trusted-boot

The values of ibm,secure-boot under pseries are interpreted as:

0 - Disabled
1 - Enabled in Log-only mode. This patch interprets this value as
disabled, since audit mode is currently not supported for Linux.
2 - Enabled and enforced.
3-9 - Enabled and enforcing; requirements are at the discretion of the
operating system.

The values of ibm,trusted-boot under pseries are interpreted as:
0 - Disabled
1 - Enabled

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Daniel Axtens <dja@axtens.net>
---
v3:
* fixed double check. Thanks Daniel for noticing it.
* updated patch description.

v2:
* included Michael Ellerman's feedback.
* added Daniel Axtens's Reviewed-by.

 arch/powerpc/kernel/secure_boot.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
index 4b982324d368..118bcb5f79c4 100644
--- a/arch/powerpc/kernel/secure_boot.c
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/of.h>
 #include <asm/secure_boot.h>
+#include <asm/machdep.h>
 
 static struct device_node *get_ppc_fw_sb_node(void)
 {
@@ -23,12 +24,19 @@ bool is_ppc_secureboot_enabled(void)
 {
 	struct device_node *node;
 	bool enabled = false;
+	u32 secureboot;
 
 	node = get_ppc_fw_sb_node();
 	enabled = of_property_read_bool(node, "os-secureboot-enforcing");
-
 	of_node_put(node);
 
+	if (enabled)
+		goto out;
+
+	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot))
+		enabled = (secureboot > 1);
+
+out:
 	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
 
 	return enabled;
@@ -38,12 +46,19 @@ bool is_ppc_trustedboot_enabled(void)
 {
 	struct device_node *node;
 	bool enabled = false;
+	u32 trustedboot;
 
 	node = get_ppc_fw_sb_node();
 	enabled = of_property_read_bool(node, "trusted-enabled");
-
 	of_node_put(node);
 
+	if (enabled)
+		goto out;
+
+	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot))
+		enabled = (trustedboot > 0);
+
+out:
 	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
 
 	return enabled;
-- 
2.26.2

