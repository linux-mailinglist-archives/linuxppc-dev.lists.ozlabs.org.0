Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C757F3C47B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:50:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLGv0PDqzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKqg1lHpzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:30:07 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B6RNIB099762
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:30:05 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t25e3kht7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:30:04 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 11 Jun 2019 07:30:02 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 07:29:57 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B6Tu4730474566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 06:29:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1021CC605B;
 Tue, 11 Jun 2019 06:29:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0977EC605A;
 Tue, 11 Jun 2019 06:29:50 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.227.34])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 06:29:49 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v11 09/13] ima: Implement support for module-style appended
 signatures
Date: Tue, 11 Jun 2019 03:28:13 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611062817.18412-1-bauerman@linux.ibm.com>
References: <20190611062817.18412-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061106-0012-0000-0000-00001742EB55
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011245; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216304; UDB=6.00639510; IPR=6.00997404; 
 MB=3.00027259; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-11 06:30:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061106-0013-0000-0000-000057A5FB76
Message-Id: <20190611062817.18412-10-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906110044
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

Implement the appraise_type=imasig|modsig option, allowing IMA to read and
verify modsig signatures.

In case a file has both an xattr signature and an appended modsig, IMA will
only use the appended signature if the key used by the xattr signature
isn't present in the IMA or platform keyring.

Because modsig verification needs to convert from an integrity keyring id
to the keyring itself, add an integrity_keyring_from_id() function in
digsig.c so that integrity_modsig_verify() can use it.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/digsig.c           | 43 ++++++++++++----
 security/integrity/ima/Kconfig        |  3 ++
 security/integrity/ima/ima.h          | 22 ++++++++-
 security/integrity/ima/ima_appraise.c | 51 +++++++++++++++++--
 security/integrity/ima/ima_main.c     | 11 ++++-
 security/integrity/ima/ima_modsig.c   | 71 +++++++++++++++++++++++++++
 security/integrity/ima/ima_policy.c   | 12 ++---
 security/integrity/integrity.h        | 19 +++++++
 8 files changed, 209 insertions(+), 23 deletions(-)

diff --git a/security/integrity/digsig.c b/security/integrity/digsig.c
index e19c2eb72c51..3399a7e32830 100644
--- a/security/integrity/digsig.c
+++ b/security/integrity/digsig.c
@@ -43,11 +43,10 @@ static const char * const keyring_name[INTEGRITY_KEYRING_MAX] = {
 #define restrict_link_to_ima restrict_link_by_builtin_trusted
 #endif
 
-int integrity_digsig_verify(const unsigned int id, const char *sig, int siglen,
-			    const char *digest, int digestlen)
+static struct key *integrity_keyring_from_id(const unsigned int id)
 {
-	if (id >= INTEGRITY_KEYRING_MAX || siglen < 2)
-		return -EINVAL;
+	if (id >= INTEGRITY_KEYRING_MAX)
+		return ERR_PTR(-EINVAL);
 
 	if (!keyring[id]) {
 		keyring[id] =
@@ -56,23 +55,49 @@ int integrity_digsig_verify(const unsigned int id, const char *sig, int siglen,
 			int err = PTR_ERR(keyring[id]);
 			pr_err("no %s keyring: %d\n", keyring_name[id], err);
 			keyring[id] = NULL;
-			return err;
+			return ERR_PTR(err);
 		}
 	}
 
+	return keyring[id];
+}
+
+int integrity_digsig_verify(const unsigned int id, const char *sig, int siglen,
+			    const char *digest, int digestlen)
+{
+	struct key *keyring;
+
+	if (siglen < 2)
+		return -EINVAL;
+
+	keyring = integrity_keyring_from_id(id);
+	if (IS_ERR(keyring))
+		return PTR_ERR(keyring);
+
 	switch (sig[1]) {
 	case 1:
 		/* v1 API expect signature without xattr type */
-		return digsig_verify(keyring[id], sig + 1, siglen - 1,
-				     digest, digestlen);
+		return digsig_verify(keyring, sig + 1, siglen - 1, digest,
+				     digestlen);
 	case 2:
-		return asymmetric_verify(keyring[id], sig, siglen,
-					 digest, digestlen);
+		return asymmetric_verify(keyring, sig, siglen, digest,
+					 digestlen);
 	}
 
 	return -EOPNOTSUPP;
 }
 
+int integrity_modsig_verify(const unsigned int id, const struct modsig *modsig)
+{
+	struct key *keyring;
+
+	keyring = integrity_keyring_from_id(id);
+	if (IS_ERR(keyring))
+		return PTR_ERR(keyring);
+
+	return ima_modsig_verify(keyring, modsig);
+}
+
 static int __integrity_init_keyring(const unsigned int id, key_perm_t perm,
 				    struct key_restriction *restriction)
 {
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index bba19f9ea184..0fb542455698 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -234,6 +234,9 @@ config IMA_APPRAISE_BOOTPARAM
 config IMA_APPRAISE_MODSIG
 	bool "Support module-style signatures for appraisal"
 	depends on IMA_APPRAISE
+	depends on INTEGRITY_ASYMMETRIC_KEYS
+	select PKCS7_MESSAGE_PARSER
+	select MODULE_SIG_FORMAT
 	default n
 	help
 	   Adds support for signatures appended to files. The format of the
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 9e2580164e97..ebbfae10f174 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -192,6 +192,10 @@ enum ima_hooks {
 	__ima_hooks(__ima_hook_enumify)
 };
 
+extern const char *const func_tokens[];
+
+struct modsig;
+
 /* LIM API function definitions */
 int ima_get_action(struct inode *inode, const struct cred *cred, u32 secid,
 		   int mask, enum ima_hooks func, int *pcr,
@@ -245,7 +249,7 @@ int ima_appraise_measurement(enum ima_hooks func,
 			     struct integrity_iint_cache *iint,
 			     struct file *file, const unsigned char *filename,
 			     struct evm_ima_xattr_data *xattr_value,
-			     int xattr_len);
+			     int xattr_len, const struct modsig *modsig);
 int ima_must_appraise(struct inode *inode, int mask, enum ima_hooks func);
 void ima_update_xattr(struct integrity_iint_cache *iint, struct file *file);
 enum integrity_status ima_get_cache_status(struct integrity_iint_cache *iint,
@@ -261,7 +265,8 @@ static inline int ima_appraise_measurement(enum ima_hooks func,
 					   struct file *file,
 					   const unsigned char *filename,
 					   struct evm_ima_xattr_data *xattr_value,
-					   int xattr_len)
+					   int xattr_len,
+					   const struct modsig *modsig)
 {
 	return INTEGRITY_UNKNOWN;
 }
@@ -300,11 +305,24 @@ static inline int ima_read_xattr(struct dentry *dentry,
 
 #ifdef CONFIG_IMA_APPRAISE_MODSIG
 bool ima_hook_supports_modsig(enum ima_hooks func);
+int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
+		    struct modsig **modsig);
+void ima_free_modsig(struct modsig *modsig);
 #else
 static inline bool ima_hook_supports_modsig(enum ima_hooks func)
 {
 	return false;
 }
+
+static inline int ima_read_modsig(enum ima_hooks func, const void *buf,
+				  loff_t buf_len, struct modsig **modsig)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void ima_free_modsig(struct modsig *modsig)
+{
+}
 #endif /* CONFIG_IMA_APPRAISE_MODSIG */
 
 /* LSM based policy rules require audit */
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 5d4772f39757..70252ac3321d 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -279,6 +279,33 @@ static int xattr_verify(enum ima_hooks func, struct integrity_iint_cache *iint,
 	return rc;
 }
 
+/*
+ * modsig_verify - verify modsig signature
+ *
+ * Verify whether the signature matches the file contents.
+ *
+ * Return 0 on success, error code otherwise.
+ */
+static int modsig_verify(enum ima_hooks func, const struct modsig *modsig,
+			 enum integrity_status *status, const char **cause)
+{
+	int rc;
+
+	rc = integrity_modsig_verify(INTEGRITY_KEYRING_IMA, modsig);
+	if (IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING) && rc &&
+	    func == KEXEC_KERNEL_CHECK)
+		rc = integrity_modsig_verify(INTEGRITY_KEYRING_PLATFORM,
+					     modsig);
+	if (rc) {
+		*cause = "invalid-signature";
+		*status = INTEGRITY_FAIL;
+	} else {
+		*status = INTEGRITY_PASS;
+	}
+
+	return rc;
+}
+
 /*
  * ima_appraise_measurement - appraise file measurement
  *
@@ -291,7 +318,7 @@ int ima_appraise_measurement(enum ima_hooks func,
 			     struct integrity_iint_cache *iint,
 			     struct file *file, const unsigned char *filename,
 			     struct evm_ima_xattr_data *xattr_value,
-			     int xattr_len)
+			     int xattr_len, const struct modsig *modsig)
 {
 	static const char op[] = "appraise_data";
 	const char *cause = "unknown";
@@ -299,11 +326,14 @@ int ima_appraise_measurement(enum ima_hooks func,
 	struct inode *inode = d_backing_inode(dentry);
 	enum integrity_status status = INTEGRITY_UNKNOWN;
 	int rc = xattr_len;
+	bool try_modsig = iint->flags & IMA_MODSIG_ALLOWED && modsig;
 
-	if (!(inode->i_opflags & IOP_XATTR))
+	/* If not appraising a modsig, we need an xattr. */
+	if (!(inode->i_opflags & IOP_XATTR) && !try_modsig)
 		return INTEGRITY_UNKNOWN;
 
-	if (rc <= 0) {
+	/* If reading the xattr failed and there's no modsig, error out. */
+	if (rc <= 0 && !try_modsig) {
 		if (rc && rc != -ENODATA)
 			goto out;
 
@@ -326,6 +356,10 @@ int ima_appraise_measurement(enum ima_hooks func,
 	case INTEGRITY_UNKNOWN:
 		break;
 	case INTEGRITY_NOXATTRS:	/* No EVM protected xattrs. */
+		/* It's fine not to have xattrs when using a modsig. */
+		if (try_modsig)
+			break;
+		/* fall through */
 	case INTEGRITY_NOLABEL:		/* No security.evm xattr. */
 		cause = "missing-HMAC";
 		goto out;
@@ -340,6 +374,15 @@ int ima_appraise_measurement(enum ima_hooks func,
 		rc = xattr_verify(func, iint, xattr_value, xattr_len, &status,
 				  &cause);
 
+	/*
+	 * If we have a modsig and either no imasig or the imasig's key isn't
+	 * known, then try verifying the modsig.
+	 */
+	if (try_modsig &&
+	    (!xattr_value || xattr_value->type == IMA_XATTR_DIGEST_NG ||
+	     rc == -ENOKEY))
+		rc = modsig_verify(func, modsig, &status, &cause);
+
 out:
 	/*
 	 * File signatures on some filesystems can not be properly verified.
@@ -356,7 +399,7 @@ int ima_appraise_measurement(enum ima_hooks func,
 				    op, cause, rc, 0);
 	} else if (status != INTEGRITY_PASS) {
 		/* Fix mode, but don't replace file signatures. */
-		if ((ima_appraise & IMA_APPRAISE_FIX) &&
+		if ((ima_appraise & IMA_APPRAISE_FIX) && !try_modsig &&
 		    (!xattr_value ||
 		     xattr_value->type != EVM_IMA_XATTR_DIGSIG)) {
 			if (!ima_fix_xattr(dentry, iint))
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index af341a80118f..8ddf9faa8d02 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -202,6 +202,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 	int rc = 0, action, must_appraise = 0;
 	int pcr = CONFIG_IMA_MEASURE_PCR_IDX;
 	struct evm_ima_xattr_data *xattr_value = NULL;
+	struct modsig *modsig = NULL;
 	int xattr_len = 0;
 	bool violation_check;
 	enum hash_algo hash_algo;
@@ -302,10 +303,15 @@ static int process_measurement(struct file *file, const struct cred *cred,
 	}
 
 	if ((action & IMA_APPRAISE_SUBMASK) ||
-		    strcmp(template_desc->name, IMA_TEMPLATE_IMA_NAME) != 0)
+	    strcmp(template_desc->name, IMA_TEMPLATE_IMA_NAME) != 0) {
 		/* read 'security.ima' */
 		xattr_len = ima_read_xattr(file_dentry(file), &xattr_value);
 
+		/* Read the appended modsig if allowed by the policy. */
+		if (iint->flags & IMA_MODSIG_ALLOWED)
+			ima_read_modsig(func, buf, size, &modsig);
+	}
+
 	hash_algo = ima_get_hash_algo(xattr_value, xattr_len);
 
 	rc = ima_collect_measurement(iint, file, buf, size, hash_algo);
@@ -322,7 +328,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 	if (rc == 0 && (action & IMA_APPRAISE_SUBMASK)) {
 		inode_lock(inode);
 		rc = ima_appraise_measurement(func, iint, file, pathname,
-					      xattr_value, xattr_len);
+					      xattr_value, xattr_len, modsig);
 		inode_unlock(inode);
 		if (!rc)
 			rc = mmap_violation_check(func, file, &pathbuf,
@@ -339,6 +345,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 		rc = -EACCES;
 	mutex_unlock(&iint->mutex);
 	kfree(xattr_value);
+	ima_free_modsig(modsig);
 out:
 	if (pathbuf)
 		__putname(pathbuf);
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index 87503bfe8c8b..f41ebe370fa0 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -8,8 +8,17 @@
  * Thiago Jung Bauermann <bauerman@linux.ibm.com>
  */
 
+#include <linux/types.h>
+#include <linux/module_signature.h>
+#include <keys/asymmetric-type.h>
+#include <crypto/pkcs7.h>
+
 #include "ima.h"
 
+struct modsig {
+	struct pkcs7_message *pkcs7_msg;
+};
+
 /**
  * ima_hook_supports_modsig - can the policy allow modsig for this hook?
  *
@@ -29,3 +38,65 @@ bool ima_hook_supports_modsig(enum ima_hooks func)
 		return false;
 	}
 }
+
+/*
+ * ima_read_modsig - Read modsig from buf.
+ *
+ * Return: 0 on success, error code otherwise.
+ */
+int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
+		    struct modsig **modsig)
+{
+	const size_t marker_len = strlen(MODULE_SIG_STRING);
+	const struct module_signature *sig;
+	struct modsig *hdr;
+	size_t sig_len;
+	const void *p;
+	int rc;
+
+	if (buf_len <= marker_len + sizeof(*sig))
+		return -ENOENT;
+
+	p = buf + buf_len - marker_len;
+	if (memcmp(p, MODULE_SIG_STRING, marker_len))
+		return -ENOENT;
+
+	buf_len -= marker_len;
+	sig = (const struct module_signature *)(p - sizeof(*sig));
+
+	rc = mod_check_sig(sig, buf_len, func_tokens[func]);
+	if (rc)
+		return rc;
+
+	sig_len = be32_to_cpu(sig->sig_len);
+	buf_len -= sig_len + sizeof(*sig);
+
+	hdr = kmalloc(sizeof(*hdr), GFP_KERNEL);
+	if (!hdr)
+		return -ENOMEM;
+
+	hdr->pkcs7_msg = pkcs7_parse_message(buf + buf_len, sig_len);
+	if (IS_ERR(hdr->pkcs7_msg)) {
+		kfree(hdr);
+		return PTR_ERR(hdr->pkcs7_msg);
+	}
+
+	*modsig = hdr;
+
+	return 0;
+}
+
+int ima_modsig_verify(struct key *keyring, const struct modsig *modsig)
+{
+	return verify_pkcs7_message_sig(NULL, 0, modsig->pkcs7_msg, keyring,
+					VERIFYING_MODULE_SIGNATURE, NULL, NULL);
+}
+
+void ima_free_modsig(struct modsig *modsig)
+{
+	if (!modsig)
+		return;
+
+	pkcs7_free_message(modsig->pkcs7_msg);
+	kfree(modsig);
+}
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 06ae4b7b3676..f64ef84516db 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -1167,6 +1167,12 @@ void ima_delete_rules(void)
 	}
 }
 
+#define __ima_hook_stringify(str)	(#str),
+
+const char *const func_tokens[] = {
+	__ima_hooks(__ima_hook_stringify)
+};
+
 #ifdef	CONFIG_IMA_READ_POLICY
 enum {
 	mask_exec = 0, mask_write, mask_read, mask_append
@@ -1179,12 +1185,6 @@ static const char *const mask_tokens[] = {
 	"^MAY_APPEND"
 };
 
-#define __ima_hook_stringify(str)	(#str),
-
-static const char *const func_tokens[] = {
-	__ima_hooks(__ima_hook_stringify)
-};
-
 void *ima_policy_start(struct seq_file *m, loff_t *pos)
 {
 	loff_t l = *pos;
diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index 0e7330a36a9d..c6e7f41db470 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -153,10 +153,13 @@ int integrity_kernel_read(struct file *file, loff_t offset,
 
 extern struct dentry *integrity_dir;
 
+struct modsig;
+
 #ifdef CONFIG_INTEGRITY_SIGNATURE
 
 int integrity_digsig_verify(const unsigned int id, const char *sig, int siglen,
 			    const char *digest, int digestlen);
+int integrity_modsig_verify(unsigned int id, const struct modsig *modsig);
 
 int __init integrity_init_keyring(const unsigned int id);
 int __init integrity_load_x509(const unsigned int id, const char *path);
@@ -171,6 +174,12 @@ static inline int integrity_digsig_verify(const unsigned int id,
 	return -EOPNOTSUPP;
 }
 
+static inline int integrity_modsig_verify(unsigned int id,
+					  const struct modsig *modsig)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int integrity_init_keyring(const unsigned int id)
 {
 	return 0;
@@ -196,6 +205,16 @@ static inline int asymmetric_verify(struct key *keyring, const char *sig,
 }
 #endif
 
+#ifdef CONFIG_IMA_APPRAISE_MODSIG
+int ima_modsig_verify(struct key *keyring, const struct modsig *modsig);
+#else
+static inline int ima_modsig_verify(struct key *keyring,
+				    const struct modsig *modsig)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #ifdef CONFIG_IMA_LOAD_X509
 void __init ima_load_x509(void);
 #else

