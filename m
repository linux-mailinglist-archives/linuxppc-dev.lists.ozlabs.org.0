Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C360FF6D41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 04:21:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BGPc2jrJzF4X6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 14:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BG9Z3fw0zF2Wh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 14:11:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47BG9Y6pqxz8t2R
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 14:11:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47BG9Y5NBMz9sPc; Mon, 11 Nov 2019 14:11:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47BG9X5JxDz9sPn
 for <linuxppc-dev@ozlabs.org>; Mon, 11 Nov 2019 14:11:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAB371n8023038
 for <linuxppc-dev@ozlabs.org>; Sun, 10 Nov 2019 22:11:10 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w6p5p6084-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 10 Nov 2019 22:11:10 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Mon, 11 Nov 2019 03:11:08 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 11 Nov 2019 03:11:04 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAB3B2tb47186000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 03:11:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1FAD4C04A;
 Mon, 11 Nov 2019 03:11:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37FC04C04E;
 Mon, 11 Nov 2019 03:10:59 +0000 (GMT)
Received: from mhp50.ibm.com (unknown [9.80.199.87])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Nov 2019 03:10:58 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v9 4/4] powerpc: load firmware trusted keys/hashes into kernel
 keyring
Date: Sun, 10 Nov 2019 21:10:36 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1573441836-3632-1-git-send-email-nayna@linux.ibm.com>
References: <1573441836-3632-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19111103-0028-0000-0000-000003B4C22C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111103-0029-0000-0000-00002477C81B
Message-Id: <1573441836-3632-5-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911110029
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The keys used to verify the Host OS kernel are managed by firmware as
secure variables. This patch loads the verification keys into the .platform
keyring and revocation hashes into .blacklist keyring. This enables
verification and loading of the kernels signed by the boot time keys which
are trusted by firmware.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Eric Richter <erichte@linux.ibm.com>
---
 security/integrity/Kconfig                       |  9 +++
 security/integrity/Makefile                      |  4 +-
 security/integrity/platform_certs/load_powerpc.c | 99 ++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 security/integrity/platform_certs/load_powerpc.c

diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 0bae6adb63a9..71f0177e8716 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -72,6 +72,15 @@ config LOAD_IPL_KEYS
        depends on S390
        def_bool y
 
+config LOAD_PPC_KEYS
+	bool "Enable loading of platform and blacklisted keys for POWER"
+	depends on INTEGRITY_PLATFORM_KEYRING
+	depends on PPC_SECURE_BOOT
+	default y
+	help
+	  Enable loading of keys to the .platform keyring and blacklisted
+	  hashes to the .blacklist keyring for powerpc based platforms.
+
 config INTEGRITY_AUDIT
 	bool "Enables integrity auditing support "
 	depends on AUDIT
diff --git a/security/integrity/Makefile b/security/integrity/Makefile
index 351c9662994b..7ee39d66cf16 100644
--- a/security/integrity/Makefile
+++ b/security/integrity/Makefile
@@ -14,6 +14,8 @@ integrity-$(CONFIG_LOAD_UEFI_KEYS) += platform_certs/efi_parser.o \
 				      platform_certs/load_uefi.o \
 				      platform_certs/keyring_handler.o
 integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
-
+integrity-$(CONFIG_LOAD_PPC_KEYS) += platform_certs/efi_parser.o \
+                                     platform_certs/load_powerpc.o \
+                                     platform_certs/keyring_handler.o
 obj-$(CONFIG_IMA)			+= ima/
 obj-$(CONFIG_EVM)			+= evm/
diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
new file mode 100644
index 000000000000..9b2596e838ac
--- /dev/null
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain
+ *
+ *      - loads keys and hashes stored and controlled by the firmware.
+ */
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/cred.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <asm/secure_boot.h>
+#include <asm/secvar.h>
+#include "keyring_handler.h"
+
+/*
+ * Get a certificate list blob from the named secure variable.
+ */
+static __init void *get_cert_list(u8 *key, unsigned long keylen, uint64_t *size)
+{
+	int rc;
+	void *db;
+
+	rc = secvar_ops->get(key, keylen, NULL, size);
+	if (rc) {
+		pr_err("Couldn't get size: %d\n", rc);
+		return NULL;
+	}
+
+	db = kmalloc(*size, GFP_KERNEL);
+	if (!db)
+		return NULL;
+
+	rc = secvar_ops->get(key, keylen, db, size);
+	if (rc) {
+		kfree(db);
+		pr_err("Error reading %s var: %d\n", key, rc);
+		return NULL;
+	}
+
+	return db;
+}
+
+/*
+ * Load the certs contained in the keys databases into the platform trusted
+ * keyring and the blacklisted X.509 cert SHA256 hashes into the blacklist
+ * keyring.
+ */
+static int __init load_powerpc_certs(void)
+{
+	void *db = NULL, *dbx = NULL;
+	uint64_t dbsize = 0, dbxsize = 0;
+	int rc = 0;
+	struct device_node *node;
+
+	if (!secvar_ops)
+		return -ENODEV;
+
+	/* The following only applies for the edk2-compat backend.
+	 * Return early if it is not set.
+	 */
+
+	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
+	rc = of_property_match_string(node, "format", "ibm,edk2-compat-v1");
+	if (rc)
+		return -ENODEV;
+
+	/* Get db, and dbx.  They might not exist, so it isn't
+	 * an error if we can't get them.
+	 */
+	db = get_cert_list("db", 3, &dbsize);
+	if (!db) {
+		pr_err("Couldn't get db list from firmware\n");
+	} else {
+		rc = parse_efi_signature_list("powerpc:db", db, dbsize,
+					      get_handler_for_db);
+		if (rc)
+			pr_err("Couldn't parse db signatures: %d\n", rc);
+		kfree(db);
+	}
+
+	dbx = get_cert_list("dbx", 4,  &dbxsize);
+	if (!dbx) {
+		pr_info("Couldn't get dbx list from firmware\n");
+	} else {
+		rc = parse_efi_signature_list("powerpc:dbx", dbx, dbxsize,
+					      get_handler_for_dbx);
+		if (rc)
+			pr_err("Couldn't parse dbx signatures: %d\n", rc);
+		kfree(dbx);
+	}
+
+	of_node_put(node);
+
+	return rc;
+}
+late_initcall(load_powerpc_certs);
-- 
2.13.6

