Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FD5912F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:33:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zgn16Ng2zDqWn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:33:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZgTp2K11zDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:20:30 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S2H1gN135698; Thu, 27 Jun 2019 22:20:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td71fe5g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 22:20:17 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5S2HaN5141524;
 Thu, 27 Jun 2019 22:20:17 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td71fe5fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 22:20:17 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5S2JYKs017193;
 Fri, 28 Jun 2019 02:20:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2t9by7jjp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 02:20:15 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5S2KF7l28246448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 02:20:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33562112065;
 Fri, 28 Jun 2019 02:20:15 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B362F112062;
 Fri, 28 Jun 2019 02:20:11 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.218.134])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 02:20:11 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v12 06/11] ima: Factor xattr_verify() out of
 ima_appraise_measurement()
Date: Thu, 27 Jun 2019 23:19:29 -0300
Message-Id: <20190628021934.4260-7-bauerman@linux.ibm.com>
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
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
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

Verify xattr signature in a separate function so that the logic in
ima_appraise_measurement() remains clear when it gains the ability to also
verify an appended module signature.

The code in the switch statement is unchanged except for having to
dereference the status and cause variables (since they're now pointers),
and fixing the style of a block comment to appease checkpatch.

Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/ima/ima_appraise.c | 141 +++++++++++++++-----------
 1 file changed, 81 insertions(+), 60 deletions(-)

diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 18bbe753421a..5d4772f39757 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -202,6 +202,83 @@ int ima_read_xattr(struct dentry *dentry,
 	return ret;
 }
 
+/*
+ * xattr_verify - verify xattr digest or signature
+ *
+ * Verify whether the hash or signature matches the file contents.
+ *
+ * Return 0 on success, error code otherwise.
+ */
+static int xattr_verify(enum ima_hooks func, struct integrity_iint_cache *iint,
+			struct evm_ima_xattr_data *xattr_value, int xattr_len,
+			enum integrity_status *status, const char **cause)
+{
+	int rc = -EINVAL, hash_start = 0;
+
+	switch (xattr_value->type) {
+	case IMA_XATTR_DIGEST_NG:
+		/* first byte contains algorithm id */
+		hash_start = 1;
+		/* fall through */
+	case IMA_XATTR_DIGEST:
+		if (iint->flags & IMA_DIGSIG_REQUIRED) {
+			*cause = "IMA-signature-required";
+			*status = INTEGRITY_FAIL;
+			break;
+		}
+		clear_bit(IMA_DIGSIG, &iint->atomic_flags);
+		if (xattr_len - sizeof(xattr_value->type) - hash_start >=
+				iint->ima_hash->length)
+			/*
+			 * xattr length may be longer. md5 hash in previous
+			 * version occupied 20 bytes in xattr, instead of 16
+			 */
+			rc = memcmp(&xattr_value->data[hash_start],
+				    iint->ima_hash->digest,
+				    iint->ima_hash->length);
+		else
+			rc = -EINVAL;
+		if (rc) {
+			*cause = "invalid-hash";
+			*status = INTEGRITY_FAIL;
+			break;
+		}
+		*status = INTEGRITY_PASS;
+		break;
+	case EVM_IMA_XATTR_DIGSIG:
+		set_bit(IMA_DIGSIG, &iint->atomic_flags);
+		rc = integrity_digsig_verify(INTEGRITY_KEYRING_IMA,
+					     (const char *)xattr_value,
+					     xattr_len,
+					     iint->ima_hash->digest,
+					     iint->ima_hash->length);
+		if (rc == -EOPNOTSUPP) {
+			*status = INTEGRITY_UNKNOWN;
+			break;
+		}
+		if (IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING) && rc &&
+		    func == KEXEC_KERNEL_CHECK)
+			rc = integrity_digsig_verify(INTEGRITY_KEYRING_PLATFORM,
+						     (const char *)xattr_value,
+						     xattr_len,
+						     iint->ima_hash->digest,
+						     iint->ima_hash->length);
+		if (rc) {
+			*cause = "invalid-signature";
+			*status = INTEGRITY_FAIL;
+		} else {
+			*status = INTEGRITY_PASS;
+		}
+		break;
+	default:
+		*status = INTEGRITY_UNKNOWN;
+		*cause = "unknown-ima-data";
+		break;
+	}
+
+	return rc;
+}
+
 /*
  * ima_appraise_measurement - appraise file measurement
  *
@@ -221,7 +298,7 @@ int ima_appraise_measurement(enum ima_hooks func,
 	struct dentry *dentry = file_dentry(file);
 	struct inode *inode = d_backing_inode(dentry);
 	enum integrity_status status = INTEGRITY_UNKNOWN;
-	int rc = xattr_len, hash_start = 0;
+	int rc = xattr_len;
 
 	if (!(inode->i_opflags & IOP_XATTR))
 		return INTEGRITY_UNKNOWN;
@@ -259,65 +336,9 @@ int ima_appraise_measurement(enum ima_hooks func,
 		WARN_ONCE(true, "Unexpected integrity status %d\n", status);
 	}
 
-	switch (xattr_value->type) {
-	case IMA_XATTR_DIGEST_NG:
-		/* first byte contains algorithm id */
-		hash_start = 1;
-		/* fall through */
-	case IMA_XATTR_DIGEST:
-		if (iint->flags & IMA_DIGSIG_REQUIRED) {
-			cause = "IMA-signature-required";
-			status = INTEGRITY_FAIL;
-			break;
-		}
-		clear_bit(IMA_DIGSIG, &iint->atomic_flags);
-		if (xattr_len - sizeof(xattr_value->type) - hash_start >=
-				iint->ima_hash->length)
-			/* xattr length may be longer. md5 hash in previous
-			   version occupied 20 bytes in xattr, instead of 16
-			 */
-			rc = memcmp(&xattr_value->data[hash_start],
-				    iint->ima_hash->digest,
-				    iint->ima_hash->length);
-		else
-			rc = -EINVAL;
-		if (rc) {
-			cause = "invalid-hash";
-			status = INTEGRITY_FAIL;
-			break;
-		}
-		status = INTEGRITY_PASS;
-		break;
-	case EVM_IMA_XATTR_DIGSIG:
-		set_bit(IMA_DIGSIG, &iint->atomic_flags);
-		rc = integrity_digsig_verify(INTEGRITY_KEYRING_IMA,
-					     (const char *)xattr_value,
-					     xattr_len,
-					     iint->ima_hash->digest,
-					     iint->ima_hash->length);
-		if (rc == -EOPNOTSUPP) {
-			status = INTEGRITY_UNKNOWN;
-			break;
-		}
-		if (IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING) && rc &&
-		    func == KEXEC_KERNEL_CHECK)
-			rc = integrity_digsig_verify(INTEGRITY_KEYRING_PLATFORM,
-						     (const char *)xattr_value,
-						     xattr_len,
-						     iint->ima_hash->digest,
-						     iint->ima_hash->length);
-		if (rc) {
-			cause = "invalid-signature";
-			status = INTEGRITY_FAIL;
-		} else {
-			status = INTEGRITY_PASS;
-		}
-		break;
-	default:
-		status = INTEGRITY_UNKNOWN;
-		cause = "unknown-ima-data";
-		break;
-	}
+	if (xattr_value)
+		rc = xattr_verify(func, iint, xattr_value, xattr_len, &status,
+				  &cause);
 
 out:
 	/*
