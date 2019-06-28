Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 075FA5912E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:32:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZglB3ZHrzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZgTl632zzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:20:27 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S2I3fg026032; Thu, 27 Jun 2019 22:20:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td8xhj8ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 22:20:14 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5S2KD70045408;
 Thu, 27 Jun 2019 22:20:13 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td8xhj8bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 22:20:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5S2JYlV031936;
 Fri, 28 Jun 2019 02:20:12 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2t9by7jp17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 02:20:12 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5S2KBlC12190118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 02:20:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D066112065;
 Fri, 28 Jun 2019 02:20:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D497E112063;
 Fri, 28 Jun 2019 02:20:07 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.218.134])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 02:20:07 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v12 05/11] ima: Add modsig appraise_type option for
 module-style appended signatures
Date: Thu, 27 Jun 2019 23:19:28 -0300
Message-Id: <20190628021934.4260-6-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628021934.4260-1-bauerman@linux.ibm.com>
References: <20190628021934.4260-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280019
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce the modsig keyword to the IMA policy syntax to specify that
a given hook should expect the file to have the IMA signature appended
to it. Here is how it can be used in a rule:

appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig

With this rule, IMA will accept either a signature stored in the extended
attribute or an appended signature.

For now, the rule above will behave exactly the same as if
appraise_type=imasig was specified. The actual modsig implementation
will be introduced separately.

Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 Documentation/ABI/testing/ima_policy |  6 +++++-
 security/integrity/ima/Kconfig       | 10 +++++++++
 security/integrity/ima/Makefile      |  1 +
 security/integrity/ima/ima.h         |  9 ++++++++
 security/integrity/ima/ima_modsig.c  | 31 ++++++++++++++++++++++++++++
 security/integrity/ima/ima_policy.c  | 12 +++++++++--
 security/integrity/integrity.h       |  1 +
 7 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
index fc376a323908..29ebe9afdac4 100644
--- a/Documentation/ABI/testing/ima_policy
+++ b/Documentation/ABI/testing/ima_policy
@@ -37,7 +37,7 @@ Description:
 			euid:= decimal value
 			fowner:= decimal value
 		lsm:  	are LSM specific
-		option:	appraise_type:= [imasig]
+		option:	appraise_type:= [imasig] [imasig|modsig]
 			template:= name of a defined IMA template type
 			(eg, ima-ng). Only valid when action is "measure".
 			pcr:= decimal value
@@ -105,3 +105,7 @@ Description:
 
 			measure func=KEXEC_KERNEL_CHECK pcr=4
 			measure func=KEXEC_INITRAMFS_CHECK pcr=5
+
+		Example of appraise rule allowing modsig appended signatures:
+
+			appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index df65d2d41905..6fa78fbc8c30 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -232,6 +232,16 @@ config IMA_APPRAISE_BOOTPARAM
 	  This option enables the different "ima_appraise=" modes
 	  (eg. fix, log) from the boot command line.
 
+config IMA_APPRAISE_MODSIG
+	bool "Support module-style signatures for appraisal"
+	depends on IMA_APPRAISE
+	default n
+	help
+	   Adds support for signatures appended to files. The format of the
+	   appended signature is the same used for signed kernel modules.
+	   The modsig keyword can be used in the IMA policy to allow a hook
+	   to accept such signatures.
+
 config IMA_TRUSTED_KEYRING
 	bool "Require all keys on the .ima keyring be signed (deprecated)"
 	depends on IMA_APPRAISE && SYSTEM_TRUSTED_KEYRING
diff --git a/security/integrity/ima/Makefile b/security/integrity/ima/Makefile
index d921dc4f9eb0..31d57cdf2421 100644
--- a/security/integrity/ima/Makefile
+++ b/security/integrity/ima/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_IMA) += ima.o
 ima-y := ima_fs.o ima_queue.o ima_init.o ima_main.o ima_crypto.o ima_api.o \
 	 ima_policy.o ima_template.o ima_template_lib.o
 ima-$(CONFIG_IMA_APPRAISE) += ima_appraise.o
+ima-$(CONFIG_IMA_APPRAISE_MODSIG) += ima_modsig.o
 ima-$(CONFIG_HAVE_IMA_KEXEC) += ima_kexec.o
 obj-$(CONFIG_IMA_BLACKLIST_KEYRING) += ima_mok.o
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 6aa28ab53d27..904f7dd78007 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -306,6 +306,15 @@ static inline int ima_read_xattr(struct dentry *dentry,
 
 #endif /* CONFIG_IMA_APPRAISE */
 
+#ifdef CONFIG_IMA_APPRAISE_MODSIG
+bool ima_hook_supports_modsig(enum ima_hooks func);
+#else
+static inline bool ima_hook_supports_modsig(enum ima_hooks func)
+{
+	return false;
+}
+#endif /* CONFIG_IMA_APPRAISE_MODSIG */
+
 /* LSM based policy rules require audit */
 #ifdef CONFIG_IMA_LSM_RULES
 
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
new file mode 100644
index 000000000000..87503bfe8c8b
--- /dev/null
+++ b/security/integrity/ima/ima_modsig.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * IMA support for appraising module-style appended signatures.
+ *
+ * Copyright (C) 2019  IBM Corporation
+ *
+ * Author:
+ * Thiago Jung Bauermann <bauerman@linux.ibm.com>
+ */
+
+#include "ima.h"
+
+/**
+ * ima_hook_supports_modsig - can the policy allow modsig for this hook?
+ *
+ * modsig is only supported by hooks using ima_post_read_file(), because only
+ * they preload the contents of the file in a buffer. FILE_CHECK does that in
+ * some cases, but not when reached from vfs_open(). POLICY_CHECK can support
+ * it, but it's not useful in practice because it's a text file so deny.
+ */
+bool ima_hook_supports_modsig(enum ima_hooks func)
+{
+	switch (func) {
+	case KEXEC_KERNEL_CHECK:
+	case KEXEC_INITRAMFS_CHECK:
+	case MODULE_CHECK:
+		return true;
+	default:
+		return false;
+	}
+}
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index a3058b03a955..ac258df2f1f4 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -1132,6 +1132,10 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
 			ima_log_string(ab, "appraise_type", args[0].from);
 			if ((strcmp(args[0].from, "imasig")) == 0)
 				entry->flags |= IMA_DIGSIG_REQUIRED;
+			else if (ima_hook_supports_modsig(entry->func) &&
+				 strcmp(args[0].from, "imasig|modsig") == 0)
+				entry->flags |= IMA_DIGSIG_REQUIRED |
+						IMA_MODSIG_ALLOWED;
 			else
 				result = -EINVAL;
 			break;
@@ -1451,8 +1455,12 @@ int ima_policy_show(struct seq_file *m, void *v)
 	}
 	if (entry->template)
 		seq_printf(m, "template=%s ", entry->template->name);
-	if (entry->flags & IMA_DIGSIG_REQUIRED)
-		seq_puts(m, "appraise_type=imasig ");
+	if (entry->flags & IMA_DIGSIG_REQUIRED) {
+		if (entry->flags & IMA_MODSIG_ALLOWED)
+			seq_puts(m, "appraise_type=imasig|modsig ");
+		else
+			seq_puts(m, "appraise_type=imasig ");
+	}
 	if (entry->flags & IMA_PERMIT_DIRECTIO)
 		seq_puts(m, "permit_directio ");
 	rcu_read_unlock();
diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index 88a29f72a74f..0e7330a36a9d 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -36,6 +36,7 @@
 #define IMA_NEW_FILE		0x04000000
 #define EVM_IMMUTABLE_DIGSIG	0x08000000
 #define IMA_FAIL_UNVERIFIABLE_SIGS	0x10000000
+#define IMA_MODSIG_ALLOWED	0x20000000
 
 #define IMA_DO_MASK		(IMA_MEASURE | IMA_APPRAISE | IMA_AUDIT | \
 				 IMA_HASH | IMA_APPRAISE_SUBMASK)
