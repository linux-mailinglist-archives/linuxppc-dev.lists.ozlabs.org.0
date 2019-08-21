Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CD97E84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 17:20:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DBF2076fzDqNP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 01:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D9zd0r6gzDr86
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:09:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46D9zc5r5Hz8tQW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:09:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46D9zc4NG9z9sND; Thu, 22 Aug 2019 01:09:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46D9zb6FWrz9sN6
 for <linuxppc-dev@ozlabs.org>; Thu, 22 Aug 2019 01:08:59 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LExhwS120382
 for <linuxppc-dev@ozlabs.org>; Wed, 21 Aug 2019 11:08:58 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uh81xsbg0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 21 Aug 2019 11:08:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Wed, 21 Aug 2019 16:08:55 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 16:08:51 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LF8nir58720296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 15:08:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0DBBA405F;
 Wed, 21 Aug 2019 15:08:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F07AA4040;
 Wed, 21 Aug 2019 15:08:47 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.158.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 15:08:46 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v2 4/4] powerpc: load firmware trusted keys into kernel keyring
Date: Wed, 21 Aug 2019 11:08:23 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082115-0020-0000-0000-0000036225A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082115-0021-0000-0000-000021B75CA1
Message-Id: <1566400103-18201-5-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210160
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

The keys used to verify the Host OS kernel are managed by OPAL as secure
variables. This patch loads the verification keys into the .platform
keyring and revocation keys into .blacklist keyring. This enables
verification and loading of the kernels signed by the boot time keys which
are trusted by firmware.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 security/integrity/Kconfig                    |  9 ++
 security/integrity/Makefile                   |  3 +
 .../integrity/platform_certs/load_powerpc.c   | 94 +++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 security/integrity/platform_certs/load_powerpc.c

diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 0bae6adb63a9..2b4109c157e2 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -72,6 +72,15 @@ config LOAD_IPL_KEYS
        depends on S390
        def_bool y
 
+config LOAD_PPC_KEYS
+	bool "Enable loading of platform and revocation keys for POWER"
+	depends on INTEGRITY_PLATFORM_KEYRING
+	depends on PPC_SECURE_BOOT
+	def_bool y
+	help
+	  Enable loading of db keys to the .platform keyring and dbx keys to
+	  the .blacklist keyring for powerpc based platforms.
+
 config INTEGRITY_AUDIT
 	bool "Enables integrity auditing support "
 	depends on AUDIT
diff --git a/security/integrity/Makefile b/security/integrity/Makefile
index 525bf1d6e0db..9eeb6b053de3 100644
--- a/security/integrity/Makefile
+++ b/security/integrity/Makefile
@@ -14,6 +14,9 @@ integrity-$(CONFIG_LOAD_UEFI_KEYS) += platform_certs/efi_parser.o \
 				      platform_certs/load_uefi.o \
 				      platform_certs/keyring_handler.o
 integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
+integrity-$(CONFIG_LOAD_PPC_KEYS) += platform_certs/efi_parser.o \
+					 platform_certs/load_powerpc.o \
+					 platform_certs/keyring_handler.o
 $(obj)/load_uefi.o: KBUILD_CFLAGS += -fshort-wchar
 
 subdir-$(CONFIG_IMA)			+= ima
diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
new file mode 100644
index 000000000000..f4d869171062
--- /dev/null
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain <nayna@linux.ibm.com>
+ *
+ * load_powernv.c
+ *      - loads keys and certs stored and controlled
+ *      by the firmware.
+ */
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/cred.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <asm/secboot.h>
+#include <asm/secvar.h>
+#include "keyring_handler.h"
+
+static struct secvar_operations *secvarops;
+
+/*
+ * Get a certificate list blob from the named EFI variable.
+ */
+static __init void *get_cert_list(u8 *key, unsigned long keylen,
+				  unsigned long *size)
+{
+	int rc;
+	void *db;
+
+	rc = secvarops->get_variable(key, keylen, NULL, size);
+	if (rc) {
+		pr_err("Couldn't get size: %d\n", rc);
+		return NULL;
+	}
+
+	db = kmalloc(*size, GFP_KERNEL);
+	if (!db)
+		return NULL;
+
+	rc = secvarops->get_variable(key, keylen, db, size);
+	if (rc) {
+		kfree(db);
+		pr_err("Error reading db var: %d\n", rc);
+		return NULL;
+	}
+
+	return db;
+}
+
+/*
+ * Load the certs contained in the UEFI databases into the platform trusted
+ * keyring and the UEFI blacklisted X.509 cert SHA256 hashes into the blacklist
+ * keyring.
+ */
+static int __init load_powerpc_certs(void)
+{
+	void *db = NULL, *dbx = NULL;
+	unsigned long dbsize = 0, dbxsize = 0;
+	int rc = 0;
+
+	secvarops = get_secvar_ops();
+	if (!secvarops)
+		return -ENOENT;
+
+	/* Get db, and dbx.  They might not exist, so it isn't
+	 * an error if we can't get them.
+	 */
+	db = get_cert_list("db", 3, &dbsize);
+	if (!db) {
+		pr_err("Couldn't get db list from OPAL\n");
+	} else {
+		rc = parse_efi_signature_list("OPAL:db",
+				db, dbsize, get_handler_for_db);
+		if (rc)
+			pr_err("Couldn't parse db signatures: %d\n",
+					rc);
+		kfree(db);
+	}
+
+	dbx = get_cert_list("dbx", 3,  &dbxsize);
+	if (!dbx) {
+		pr_info("Couldn't get dbx list from OPAL\n");
+	} else {
+		rc = parse_efi_signature_list("OPAL:dbx",
+				dbx, dbxsize,
+				get_handler_for_dbx);
+		if (rc)
+			pr_err("Couldn't parse dbx signatures: %d\n", rc);
+		kfree(dbx);
+	}
+
+	return rc;
+}
+late_initcall(load_powerpc_certs);
-- 
2.20.1

