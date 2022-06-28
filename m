Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514555EA6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 19:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXW7L612zz3dwK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 03:00:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IXYT7+F/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IXYT7+F/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXW5D2zh5z3by6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 02:58:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SGglQH024324;
	Tue, 28 Jun 2022 16:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qlhl1lk6fdqhJgoMMasfXfIFRDEKsuZkp9LrgskVcNk=;
 b=IXYT7+F/77dNde8/fbnpwU34eVo1AW2IKFkVFqjTfZCt4gyHhiVv+kWpnsBybYHg7loX
 +kSspbf6Uhs/KlKO9jixeNjDjMpsFodVLBQQBQ/HC212O6dwCNgwdG2JB/5otaCDgEtF
 GqJkTkgo//Mq33A1ieZQmDyWVI6MAWmy6lEWPq+Zgx+SZ5mVUfGV6HjTazEPkn1XfnNy
 FQ2Rbrwgo/gUZAw1vJRyS7RZm9EqM92VcHZdH6EcjWi5qHZqiPrSf/fGeyHM/GqXxLLw
 gBcER+zOjan+exfje2ZsIJCyoVRiMZOgaSZxgwIRG0sAxiPe8vHQFOPq4hSmgg5nTJpG 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h05dh0byg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:58:29 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25SGhiM9031341;
	Tue, 28 Jun 2022 16:58:28 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h05dh0bxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:58:28 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25SGptFF005990;
	Tue, 28 Jun 2022 16:58:27 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3gwt09xs68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:58:27 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25SGwQ7P28574022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 16:58:26 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02F757805E;
	Tue, 28 Jun 2022 16:58:26 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B9897805F;
	Tue, 28 Jun 2022 16:58:25 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 28 Jun 2022 16:58:25 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/3] tpm: of: Make of-tree specific function commonly available
Date: Tue, 28 Jun 2022 12:58:18 -0400
Message-Id: <20220628165820.883222-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628165820.883222-1-stefanb@linux.ibm.com>
References: <20220628165820.883222-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xe27eIK8AXNJXNN6UKLPN4yhlsAKB_dZ
X-Proofpoint-ORIG-GUID: f1EvZCYa9hzkQaiLUzTutJYVQZSevIkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280065
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
Cc: nayna@linux.ibm.com, Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Frank Rowand <frowand.list@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify tpm_read_log_of() by moving reusable parts of the code into
its own file to make the code commonly available so it can be used also
for kexec support. Call the new of_tpm_get_sml_parameters() function
from the TPM Open Firmware driver.

Compile the new file when CONFIG_OF is enabled so that
of_tpm_get_sml_parameters() can be called from kexec even if the TPM
subsystem is not enabled.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
---
 drivers/char/Makefile              |  1 +
 drivers/char/tpm/Makefile          |  1 +
 drivers/char/tpm/eventlog/of.c     | 31 +++++-------------------------
 drivers/char/tpm/eventlog/tpm_of.c | 27 ++++++++++++++++++++++++++
 include/linux/tpm.h                |  5 +++++
 5 files changed, 39 insertions(+), 26 deletions(-)
 create mode 100644 drivers/char/tpm/eventlog/tpm_of.c

diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index 264eb398fdd4..af9edafb944e 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PCMCIA)		+= pcmcia/
 
 obj-$(CONFIG_HANGCHECK_TIMER)	+= hangcheck-timer.o
 obj-$(CONFIG_TCG_TPM)		+= tpm/
+obj-$(CONFIG_OF)		+= tpm/
 
 obj-$(CONFIG_PS3_FLASH)		+= ps3flash.o
 
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 66d39ea6bd10..3c0eaac81f5c 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -19,6 +19,7 @@ tpm-y += eventlog/tpm2.o
 tpm-$(CONFIG_ACPI) += tpm_ppi.o eventlog/acpi.o
 tpm-$(CONFIG_EFI) += eventlog/efi.o
 tpm-$(CONFIG_OF) += eventlog/of.o
+obj-$(CONFIG_OF) += eventlog/tpm_of.o
 obj-$(CONFIG_TCG_TIS_CORE) += tpm_tis_core.o
 obj-$(CONFIG_TCG_TIS) += tpm_tis.o
 obj-$(CONFIG_TCG_TIS_SYNQUACER) += tpm_tis_synquacer.o
diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
index a9ce66d09a75..f9462d19632e 100644
--- a/drivers/char/tpm/eventlog/of.c
+++ b/drivers/char/tpm/eventlog/of.c
@@ -12,6 +12,7 @@
 
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/tpm.h>
 #include <linux/tpm_eventlog.h>
 
 #include "../tpm.h"
@@ -20,11 +21,10 @@
 int tpm_read_log_of(struct tpm_chip *chip)
 {
 	struct device_node *np;
-	const u32 *sizep;
-	const u64 *basep;
 	struct tpm_bios_log *log;
 	u32 size;
 	u64 base;
+	int ret;
 
 	log = &chip->log;
 	if (chip->dev.parent && chip->dev.parent->of_node)
@@ -35,30 +35,9 @@ int tpm_read_log_of(struct tpm_chip *chip)
 	if (of_property_read_bool(np, "powered-while-suspended"))
 		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
 
-	sizep = of_get_property(np, "linux,sml-size", NULL);
-	basep = of_get_property(np, "linux,sml-base", NULL);
-	if (sizep == NULL && basep == NULL)
-		return -ENODEV;
-	if (sizep == NULL || basep == NULL)
-		return -EIO;
-
-	/*
-	 * For both vtpm/tpm, firmware has log addr and log size in big
-	 * endian format. But in case of vtpm, there is a method called
-	 * sml-handover which is run during kernel init even before
-	 * device tree is setup. This sml-handover function takes care
-	 * of endianness and writes to sml-base and sml-size in little
-	 * endian format. For this reason, vtpm doesn't need conversion
-	 * but physical tpm needs the conversion.
-	 */
-	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
-	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
-		size = be32_to_cpup((__force __be32 *)sizep);
-		base = be64_to_cpup((__force __be64 *)basep);
-	} else {
-		size = *sizep;
-		base = *basep;
-	}
+	ret = of_tpm_get_sml_parameters(np, &base, &size);
+	if (ret < 0)
+		return ret;
 
 	if (size == 0) {
 		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
diff --git a/drivers/char/tpm/eventlog/tpm_of.c b/drivers/char/tpm/eventlog/tpm_of.c
new file mode 100644
index 000000000000..2e6cfcc87035
--- /dev/null
+++ b/drivers/char/tpm/eventlog/tpm_of.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/export.h>
+#include <linux/tpm.h>
+
+int of_tpm_get_sml_parameters(struct device_node *np, u64 *base, u32 *size)
+{
+	const u32 *sizep;
+	const u64 *basep;
+
+	sizep = of_get_property(np, "linux,sml-size", NULL);
+	basep = of_get_property(np, "linux,sml-base", NULL);
+	if (sizep == NULL && basep == NULL)
+		return -ENODEV;
+	if (sizep == NULL || basep == NULL)
+		return -EIO;
+
+	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
+	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
+		*size = be32_to_cpup((__force __be32 *)sizep);
+		*base = be64_to_cpup((__force __be64 *)basep);
+	} else {
+		*size = *sizep;
+		*base = *basep;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_tpm_get_sml_parameters);
diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index dfeb25a0362d..429bf045db80 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -460,4 +460,9 @@ static inline struct tpm_chip *tpm_default_chip(void)
 	return NULL;
 }
 #endif
+
+#ifdef CONFIG_OF
+int of_tpm_get_sml_parameters(struct device_node *np, u64 *base, u32 *size);
+#endif
+
 #endif
-- 
2.35.1

