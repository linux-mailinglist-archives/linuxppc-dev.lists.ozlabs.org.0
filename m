Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4693C484
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:52:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLKV5s5yzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:52:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKqn0Z3zzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:30:12 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B6RPZ9000687
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:30:11 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t24qcd2j3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:30:10 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 11 Jun 2019 07:30:09 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 07:30:04 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B6U2iA28639586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 06:30:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D5FFC6072;
 Tue, 11 Jun 2019 06:30:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DCE1C6059;
 Tue, 11 Jun 2019 06:29:56 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.227.34])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 06:29:56 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v11 10/13] ima: Collect modsig
Date: Tue, 11 Jun 2019 03:28:14 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611062817.18412-1-bauerman@linux.ibm.com>
References: <20190611062817.18412-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061106-0016-0000-0000-000009C11C67
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011245; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216304; UDB=6.00639510; IPR=6.00997404; 
 MB=3.00027259; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-11 06:30:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061106-0017-0000-0000-0000439AFD9E
Message-Id: <20190611062817.18412-11-bauerman@linux.ibm.com>
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

Obtain the modsig and calculate its corresponding hash in
ima_collect_measurement().

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 security/integrity/ima/ima.h          |  8 ++++-
 security/integrity/ima/ima_api.c      |  5 ++-
 security/integrity/ima/ima_appraise.c |  2 +-
 security/integrity/ima/ima_main.c     |  2 +-
 security/integrity/ima/ima_modsig.c   | 50 ++++++++++++++++++++++++++-
 5 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index ebbfae10f174..0acc8e56ec73 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -203,7 +203,7 @@ int ima_get_action(struct inode *inode, const struct cred *cred, u32 secid,
 int ima_must_measure(struct inode *inode, int mask, enum ima_hooks func);
 int ima_collect_measurement(struct integrity_iint_cache *iint,
 			    struct file *file, void *buf, loff_t size,
-			    enum hash_algo algo);
+			    enum hash_algo algo, struct modsig *modsig);
 void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
 			   const unsigned char *filename,
 			   struct evm_ima_xattr_data *xattr_value,
@@ -307,6 +307,7 @@ static inline int ima_read_xattr(struct dentry *dentry,
 bool ima_hook_supports_modsig(enum ima_hooks func);
 int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
 		    struct modsig **modsig);
+void ima_collect_modsig(struct modsig *modsig, const void *buf, loff_t size);
 void ima_free_modsig(struct modsig *modsig);
 #else
 static inline bool ima_hook_supports_modsig(enum ima_hooks func)
@@ -320,6 +321,11 @@ static inline int ima_read_modsig(enum ima_hooks func, const void *buf,
 	return -EOPNOTSUPP;
 }
 
+static inline void ima_collect_modsig(struct modsig *modsig, const void *buf,
+				      loff_t size)
+{
+}
+
 static inline void ima_free_modsig(struct modsig *modsig)
 {
 }
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index c0cf4bcfc82f..c351b8c37278 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -208,7 +208,7 @@ int ima_get_action(struct inode *inode, const struct cred *cred, u32 secid,
  */
 int ima_collect_measurement(struct integrity_iint_cache *iint,
 			    struct file *file, void *buf, loff_t size,
-			    enum hash_algo algo)
+			    enum hash_algo algo, struct modsig *modsig)
 {
 	const char *audit_cause = "failed";
 	struct inode *inode = file_inode(file);
@@ -255,6 +255,9 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 	memcpy(iint->ima_hash, &hash, length);
 	iint->version = i_version;
 
+	if (modsig)
+		ima_collect_modsig(modsig, buf, size);
+
 	/* Possibly temporary failure due to type of read (eg. O_DIRECT) */
 	if (!result)
 		iint->flags |= IMA_COLLECTED;
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 70252ac3321d..aa14e3fe25d5 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -438,7 +438,7 @@ void ima_update_xattr(struct integrity_iint_cache *iint, struct file *file)
 	    !(iint->flags & IMA_HASH))
 		return;
 
-	rc = ima_collect_measurement(iint, file, NULL, 0, ima_hash_algo);
+	rc = ima_collect_measurement(iint, file, NULL, 0, ima_hash_algo, NULL);
 	if (rc < 0)
 		return;
 
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 8ddf9faa8d02..2c9d3cf85726 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -314,7 +314,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 
 	hash_algo = ima_get_hash_algo(xattr_value, xattr_len);
 
-	rc = ima_collect_measurement(iint, file, buf, size, hash_algo);
+	rc = ima_collect_measurement(iint, file, buf, size, hash_algo, modsig);
 	if (rc != 0 && rc != -EBADF && rc != -EINVAL)
 		goto out_locked;
 
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index f41ebe370fa0..d438b87dba89 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -17,6 +17,19 @@
 
 struct modsig {
 	struct pkcs7_message *pkcs7_msg;
+
+	enum hash_algo hash_algo;
+
+	/* This digest will go in the 'd-modsig' field of the IMA template. */
+	const u8 *digest;
+	u32 digest_size;
+
+	/*
+	 * This is what will go to the measurement list if the template requires
+	 * storing the signature.
+	 */
+	int raw_pkcs7_len;
+	u8 raw_pkcs7[];
 };
 
 /**
@@ -71,7 +84,8 @@ int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
 	sig_len = be32_to_cpu(sig->sig_len);
 	buf_len -= sig_len + sizeof(*sig);
 
-	hdr = kmalloc(sizeof(*hdr), GFP_KERNEL);
+	/* Allocate sig_len additional bytes to hold the raw PKCS#7 data. */
+	hdr = kzalloc(sizeof(*hdr) + sig_len, GFP_KERNEL);
 	if (!hdr)
 		return -ENOMEM;
 
@@ -81,11 +95,45 @@ int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
 		return PTR_ERR(hdr->pkcs7_msg);
 	}
 
+	memcpy(hdr->raw_pkcs7, buf + buf_len, sig_len);
+	hdr->raw_pkcs7_len = sig_len;
+
+	/* We don't know the hash algorithm yet. */
+	hdr->hash_algo = HASH_ALGO__LAST;
+
 	*modsig = hdr;
 
 	return 0;
 }
 
+/**
+ * ima_collect_modsig - Calculate the file hash without the appended signature.
+ *
+ * Since the modsig is part of the file contents, the hash used in its signature
+ * isn't the same one ordinarily calculated by IMA. Therefore PKCS7 code
+ * calculates a separate one for signature verification.
+ */
+void ima_collect_modsig(struct modsig *modsig, const void *buf, loff_t size)
+{
+	int rc;
+
+	/*
+	 * Provide the file contents (minus the appended sig) so that the PKCS7
+	 * code can calculate the file hash.
+	 */
+	size -= modsig->raw_pkcs7_len + strlen(MODULE_SIG_STRING) +
+		sizeof(struct module_signature);
+	rc = pkcs7_supply_detached_data(modsig->pkcs7_msg, buf, size);
+	if (rc)
+		return;
+
+	/* Ask the PKCS7 code to calculate the file hash. */
+	rc = pkcs7_get_digest(modsig->pkcs7_msg, &modsig->digest,
+			      &modsig->digest_size, &modsig->hash_algo);
+	if (rc)
+		return;
+}
+
 int ima_modsig_verify(struct key *keyring, const struct modsig *modsig)
 {
 	return verify_pkcs7_message_sig(NULL, 0, modsig->pkcs7_msg, keyring,

