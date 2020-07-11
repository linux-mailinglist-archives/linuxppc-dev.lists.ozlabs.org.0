Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636521C1C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 04:27:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3YjB2vG8zDrMh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 12:27:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3YgF6RG4zDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 12:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B3YgF12Mxz8t3x
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 12:26:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B3YgD62nsz9sRR; Sat, 11 Jul 2020 12:26:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B3YgC4q9Fz9sDX;
 Sat, 11 Jul 2020 12:25:58 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06B23EZ7156055; Fri, 10 Jul 2020 22:25:55 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326b8yvbc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 22:25:55 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06B2LD2U023542;
 Sat, 11 Jul 2020 02:25:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 326bc90jqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Jul 2020 02:25:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06B2PotF25231464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 11 Jul 2020 02:25:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0F47A4057;
 Sat, 11 Jul 2020 02:25:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60170A404D;
 Sat, 11 Jul 2020 02:25:49 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.160.34.17])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 11 Jul 2020 02:25:49 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc/pseries: detect secure and trusted boot state of
 the system.
Date: Fri, 10 Jul 2020 22:25:29 -0400
Message-Id: <1594434329-31219-1-git-send-email-nayna@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_14:2020-07-10,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=956
 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=1
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007110012
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
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device-tree property to check secure and trusted boot state is
different for guests(pseries) compared to baremetal(powernv).

This patch updates the existing is_ppc_secureboot_enabled() and
is_ppc_trustedboot_enabled() function to add support for pseries.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Daniel Axtens <dja@axtens.net>
---
v2:
* included Michael Ellerman's feedback.
* added Daniel Axtens's Reviewed-by.

 arch/powerpc/kernel/secure_boot.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
index 4b982324d368..efb325cbd42f 100644
--- a/arch/powerpc/kernel/secure_boot.c
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/of.h>
 #include <asm/secure_boot.h>
+#include <asm/machdep.h>
 
 static struct device_node *get_ppc_fw_sb_node(void)
 {
@@ -23,12 +24,21 @@ bool is_ppc_secureboot_enabled(void)
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
+	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot)) {
+		if (secureboot)
+			enabled = (secureboot > 1) ? true : false;
+	}
+
+out:
 	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
 
 	return enabled;
@@ -38,12 +48,21 @@ bool is_ppc_trustedboot_enabled(void)
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
+	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot)) {
+		if (trustedboot)
+			enabled = (trustedboot > 0) ? true : false;
+	}
+
+out:
 	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
 
 	return enabled;
-- 
2.26.2

