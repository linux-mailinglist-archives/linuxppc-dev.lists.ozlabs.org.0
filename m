Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6990DDA14
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 20:28:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wWcb3hRrzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 05:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wW7z2BL3zDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 05:07:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wW7x4pFZz8tQJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 05:07:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wW7v2mXdz9sRW; Sun, 20 Oct 2019 05:07:07 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 46wW7t1Ywdz9sRV
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 05:07:06 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9JI6fba115244
 for <linuxppc-dev@ozlabs.org>; Sat, 19 Oct 2019 14:07:04 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqwss4q67-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 19 Oct 2019 14:07:04 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Sat, 19 Oct 2019 19:07:01 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 19 Oct 2019 19:06:57 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9JI6u3C47317424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 18:06:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4F25204E;
 Sat, 19 Oct 2019 18:06:56 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.146.216])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 721C55204F;
 Sat, 19 Oct 2019 18:06:53 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v8 7/8] ima: check against blacklisted hashes for files with
 modsig
Date: Sat, 19 Oct 2019 14:06:16 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571508377-23603-1-git-send-email-nayna@linux.ibm.com>
References: <1571508377-23603-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19101918-0012-0000-0000-0000035A050F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101918-0013-0000-0000-00002195288D
Message-Id: <1571508377-23603-8-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190171
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
Cc: Prakhar Srivastava <prsriva02@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Asymmetric private keys are used to sign multiple files. The kernel
currently support checking against blacklisted keys. However, if the
public key is blacklisted, any file signed by the blacklisted key will
automatically fail signature verification. We might not want to blacklist
all the files signed by a particular key, but just a single file.
Blacklisting the public key is not fine enough granularity.

This patch adds support for checking against the blacklisted hash of the
file based on the IMA policy. The blacklisted hash is the file hash
without the appended signature. Defined is a new policy option
"appraise_flag=check_blacklist".

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 Documentation/ABI/testing/ima_policy  |  1 +
 security/integrity/ima/ima.h          |  8 +++++++
 security/integrity/ima/ima_appraise.c | 31 +++++++++++++++++++++++++++
 security/integrity/ima/ima_main.c     | 12 +++++++----
 security/integrity/ima/ima_policy.c   | 10 +++++++--
 security/integrity/integrity.h        |  1 +
 6 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
index 29ebe9afdac4..4c97afcc0f3c 100644
--- a/Documentation/ABI/testing/ima_policy
+++ b/Documentation/ABI/testing/ima_policy
@@ -25,6 +25,7 @@ Description:
 			lsm:	[[subj_user=] [subj_role=] [subj_type=]
 				 [obj_user=] [obj_role=] [obj_type=]]
 			option:	[[appraise_type=]] [template=] [permit_directio]
+				[appraise_flag=[check_blacklist]]
 		base: 	func:= [BPRM_CHECK][MMAP_CHECK][CREDS_CHECK][FILE_CHECK][MODULE_CHECK]
 				[FIRMWARE_CHECK]
 				[KEXEC_KERNEL_CHECK] [KEXEC_INITRAMFS_CHECK]
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index a65772ffa427..df4ca482fb53 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -256,6 +256,8 @@ int ima_policy_show(struct seq_file *m, void *v);
 #define IMA_APPRAISE_KEXEC	0x40
 
 #ifdef CONFIG_IMA_APPRAISE
+int ima_check_blacklist(struct integrity_iint_cache *iint,
+			const struct modsig *modsig, int pcr);
 int ima_appraise_measurement(enum ima_hooks func,
 			     struct integrity_iint_cache *iint,
 			     struct file *file, const unsigned char *filename,
@@ -271,6 +273,12 @@ int ima_read_xattr(struct dentry *dentry,
 		   struct evm_ima_xattr_data **xattr_value);
 
 #else
+static inline int ima_check_blacklist(struct integrity_iint_cache *iint,
+				      const struct modsig *modsig, int pcr)
+{
+	return 0;
+}
+
 static inline int ima_appraise_measurement(enum ima_hooks func,
 					   struct integrity_iint_cache *iint,
 					   struct file *file,
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 136ae4e0ee92..7a002b08dde8 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -12,6 +12,7 @@
 #include <linux/magic.h>
 #include <linux/ima.h>
 #include <linux/evm.h>
+#include <keys/system_keyring.h>
 
 #include "ima.h"
 
@@ -303,6 +304,36 @@ static int modsig_verify(enum ima_hooks func, const struct modsig *modsig,
 	return rc;
 }
 
+/*
+ * ima_blacklist_measurement - Checks whether the binary is blacklisted. If
+ * yes, then adds the hash of the blacklisted binary to the measurement list.
+ *
+ * Returns -EPERM if the hash is blacklisted.
+ */
+int ima_check_blacklist(struct integrity_iint_cache *iint,
+			const struct modsig *modsig, int pcr)
+{
+	enum hash_algo hash_algo;
+	const u8 *digest = NULL;
+	u32 digestsize = 0;
+	int rc = 0;
+
+	if (!(iint->flags & IMA_CHECK_BLACKLIST))
+		return 0;
+
+	if (iint->flags & IMA_MODSIG_ALLOWED && modsig) {
+		ima_get_modsig_digest(modsig, &hash_algo, &digest, &digestsize);
+
+		rc = is_binary_blacklisted(digest, digestsize);
+		if ((rc == -EPERM) && (iint->flags & IMA_MEASURE))
+			process_buffer_measurement(digest, digestsize,
+						   "blacklisted-hash", NONE,
+						   pcr);
+	}
+
+	return rc;
+}
+
 /*
  * ima_appraise_measurement - appraise file measurement
  *
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index fe0b704ffdeb..13a0d64580ef 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -335,10 +335,14 @@ static int process_measurement(struct file *file, const struct cred *cred,
 				      xattr_value, xattr_len, modsig, pcr,
 				      template_desc);
 	if (rc == 0 && (action & IMA_APPRAISE_SUBMASK)) {
-		inode_lock(inode);
-		rc = ima_appraise_measurement(func, iint, file, pathname,
-					      xattr_value, xattr_len, modsig);
-		inode_unlock(inode);
+		rc = ima_check_blacklist(iint, modsig, pcr);
+		if (rc != -EPERM) {
+			inode_lock(inode);
+			rc = ima_appraise_measurement(func, iint, file,
+						      pathname, xattr_value,
+						      xattr_len, modsig);
+			inode_unlock(inode);
+		}
 		if (!rc)
 			rc = mmap_violation_check(func, file, &pathbuf,
 						  &pathname, filename);
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 5380aca2b351..bfaae7a8443a 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -765,8 +765,8 @@ enum {
 	Opt_fsuuid, Opt_uid_eq, Opt_euid_eq, Opt_fowner_eq,
 	Opt_uid_gt, Opt_euid_gt, Opt_fowner_gt,
 	Opt_uid_lt, Opt_euid_lt, Opt_fowner_lt,
-	Opt_appraise_type, Opt_permit_directio,
-	Opt_pcr, Opt_template, Opt_err
+	Opt_appraise_type, Opt_appraise_flag,
+	Opt_permit_directio, Opt_pcr, Opt_template, Opt_err
 };
 
 static const match_table_t policy_tokens = {
@@ -798,6 +798,7 @@ static const match_table_t policy_tokens = {
 	{Opt_euid_lt, "euid<%s"},
 	{Opt_fowner_lt, "fowner<%s"},
 	{Opt_appraise_type, "appraise_type=%s"},
+	{Opt_appraise_flag, "appraise_flag=%s"},
 	{Opt_permit_directio, "permit_directio"},
 	{Opt_pcr, "pcr=%s"},
 	{Opt_template, "template=%s"},
@@ -1172,6 +1173,11 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
 			else
 				result = -EINVAL;
 			break;
+		case Opt_appraise_flag:
+			ima_log_string(ab, "appraise_flag", args[0].from);
+			if (strstr(args[0].from, "blacklist"))
+				entry->flags |= IMA_CHECK_BLACKLIST;
+			break;
 		case Opt_permit_directio:
 			entry->flags |= IMA_PERMIT_DIRECTIO;
 			break;
diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index d9323d31a3a8..73fc286834d7 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -32,6 +32,7 @@
 #define EVM_IMMUTABLE_DIGSIG	0x08000000
 #define IMA_FAIL_UNVERIFIABLE_SIGS	0x10000000
 #define IMA_MODSIG_ALLOWED	0x20000000
+#define IMA_CHECK_BLACKLIST	0x40000000
 
 #define IMA_DO_MASK		(IMA_MEASURE | IMA_APPRAISE | IMA_AUDIT | \
 				 IMA_HASH | IMA_APPRAISE_SUBMASK)
-- 
2.20.1

