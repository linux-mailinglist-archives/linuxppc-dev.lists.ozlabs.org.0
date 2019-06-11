Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7823C456
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:36:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NKzJ03wczDqTG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:36:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKpv1ZZNzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:29:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B6RNsY126182
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:29:24 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t26p28wqs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:29:24 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 11 Jun 2019 07:29:23 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 07:29:17 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B6TFxT18153748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 06:29:15 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A319C6059;
 Tue, 11 Jun 2019 06:29:15 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06D9DC6055;
 Tue, 11 Jun 2019 06:29:08 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.227.34])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 06:29:07 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v11 02/13] PKCS#7: Refactor verify_pkcs7_signature()
Date: Tue, 11 Jun 2019 03:28:06 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611062817.18412-1-bauerman@linux.ibm.com>
References: <20190611062817.18412-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061106-0012-0000-0000-00001742EB4B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011245; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216304; UDB=6.00639510; IPR=6.00997403; 
 MB=3.00027259; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-11 06:29:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061106-0013-0000-0000-000057A5FADF
Message-Id: <20190611062817.18412-3-bauerman@linux.ibm.com>
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

IMA will need to verify a PKCS#7 signature which has already been parsed.
For this reason, factor out the code which does that from
verify_pkcs7_signature() into a new function which takes a struct
pkcs7_message instead of a data buffer.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
---
 certs/system_keyring.c       | 61 ++++++++++++++++++++++++++----------
 include/linux/verification.h | 10 ++++++
 2 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index c05c29ae4d5d..4ba82e52e4b4 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -194,33 +194,27 @@ late_initcall(load_system_certificate_list);
 #ifdef CONFIG_SYSTEM_DATA_VERIFICATION
 
 /**
- * verify_pkcs7_signature - Verify a PKCS#7-based signature on system data.
+ * verify_pkcs7_message_sig - Verify a PKCS#7-based signature on system data.
  * @data: The data to be verified (NULL if expecting internal data).
  * @len: Size of @data.
- * @raw_pkcs7: The PKCS#7 message that is the signature.
- * @pkcs7_len: The size of @raw_pkcs7.
+ * @pkcs7: The PKCS#7 message that is the signature.
  * @trusted_keys: Trusted keys to use (NULL for builtin trusted keys only,
  *					(void *)1UL for all trusted keys).
  * @usage: The use to which the key is being put.
  * @view_content: Callback to gain access to content.
  * @ctx: Context for callback.
  */
-int verify_pkcs7_signature(const void *data, size_t len,
-			   const void *raw_pkcs7, size_t pkcs7_len,
-			   struct key *trusted_keys,
-			   enum key_being_used_for usage,
-			   int (*view_content)(void *ctx,
-					       const void *data, size_t len,
-					       size_t asn1hdrlen),
-			   void *ctx)
+int verify_pkcs7_message_sig(const void *data, size_t len,
+			     struct pkcs7_message *pkcs7,
+			     struct key *trusted_keys,
+			     enum key_being_used_for usage,
+			     int (*view_content)(void *ctx,
+						 const void *data, size_t len,
+						 size_t asn1hdrlen),
+			     void *ctx)
 {
-	struct pkcs7_message *pkcs7;
 	int ret;
 
-	pkcs7 = pkcs7_parse_message(raw_pkcs7, pkcs7_len);
-	if (IS_ERR(pkcs7))
-		return PTR_ERR(pkcs7);
-
 	/* The data should be detached - so we need to supply it. */
 	if (data && pkcs7_supply_detached_data(pkcs7, data, len) < 0) {
 		pr_err("PKCS#7 signature with non-detached data\n");
@@ -273,6 +267,41 @@ int verify_pkcs7_signature(const void *data, size_t len,
 	}
 
 error:
+	pr_devel("<==%s() = %d\n", __func__, ret);
+	return ret;
+}
+
+/**
+ * verify_pkcs7_signature - Verify a PKCS#7-based signature on system data.
+ * @data: The data to be verified (NULL if expecting internal data).
+ * @len: Size of @data.
+ * @raw_pkcs7: The PKCS#7 message that is the signature.
+ * @pkcs7_len: The size of @raw_pkcs7.
+ * @trusted_keys: Trusted keys to use (NULL for builtin trusted keys only,
+ *					(void *)1UL for all trusted keys).
+ * @usage: The use to which the key is being put.
+ * @view_content: Callback to gain access to content.
+ * @ctx: Context for callback.
+ */
+int verify_pkcs7_signature(const void *data, size_t len,
+			   const void *raw_pkcs7, size_t pkcs7_len,
+			   struct key *trusted_keys,
+			   enum key_being_used_for usage,
+			   int (*view_content)(void *ctx,
+					       const void *data, size_t len,
+					       size_t asn1hdrlen),
+			   void *ctx)
+{
+	struct pkcs7_message *pkcs7;
+	int ret;
+
+	pkcs7 = pkcs7_parse_message(raw_pkcs7, pkcs7_len);
+	if (IS_ERR(pkcs7))
+		return PTR_ERR(pkcs7);
+
+	ret = verify_pkcs7_message_sig(data, len, pkcs7, trusted_keys, usage,
+				       view_content, ctx);
+
 	pkcs7_free_message(pkcs7);
 	pr_devel("<==%s() = %d\n", __func__, ret);
 	return ret;
diff --git a/include/linux/verification.h b/include/linux/verification.h
index 018fb5f13d44..5e1d41f2b336 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -36,6 +36,7 @@ extern const char *const key_being_used_for[NR__KEY_BEING_USED_FOR];
 #ifdef CONFIG_SYSTEM_DATA_VERIFICATION
 
 struct key;
+struct pkcs7_message;
 
 extern int verify_pkcs7_signature(const void *data, size_t len,
 				  const void *raw_pkcs7, size_t pkcs7_len,
@@ -45,6 +46,15 @@ extern int verify_pkcs7_signature(const void *data, size_t len,
 						      const void *data, size_t len,
 						      size_t asn1hdrlen),
 				  void *ctx);
+extern int verify_pkcs7_message_sig(const void *data, size_t len,
+				    struct pkcs7_message *pkcs7,
+				    struct key *trusted_keys,
+				    enum key_being_used_for usage,
+				    int (*view_content)(void *ctx,
+							const void *data,
+							size_t len,
+							size_t asn1hdrlen),
+				    void *ctx);
 
 #ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
 extern int verify_pefile_signature(const void *pebuf, unsigned pelen,

