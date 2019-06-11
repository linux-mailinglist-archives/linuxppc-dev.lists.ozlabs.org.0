Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 361913C48E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:56:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLPp2dQqzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:56:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKr03h13zDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:30:24 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B6RNdU099673; Tue, 11 Jun 2019 02:30:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t25e3kj42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2019 02:30:12 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5B6RMlN099625;
 Tue, 11 Jun 2019 02:30:11 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t25e3kj31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2019 02:30:11 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5B5UemO015326;
 Tue, 11 Jun 2019 05:32:16 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2t1x6sbmn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2019 05:32:16 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B6U7r915991068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 06:30:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA4AEC605A;
 Tue, 11 Jun 2019 06:30:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FEA0C6061;
 Tue, 11 Jun 2019 06:30:02 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.227.34])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 06:30:02 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v11 11/13] ima: Define ima-modsig template
Date: Tue, 11 Jun 2019 03:28:15 -0300
Message-Id: <20190611062817.18412-12-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611062817.18412-1-bauerman@linux.ibm.com>
References: <20190611062817.18412-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
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

Define new "d-modsig" template field which holds the digest that is
expected to match the one contained in the modsig, and also new "modsig"
template field which holds the appended file signature.

Add a new "ima-modsig" defined template descriptor with the new fields as
well as the ones from the "ima-sig" descriptor.

Change ima_store_measurement() to accept a struct modsig * argument so that
it can be passed along to the templates via struct ima_event_data.

Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
---
 Documentation/security/IMA-templates.rst  |  7 ++-
 security/integrity/ima/ima.h              | 20 +++++++-
 security/integrity/ima/ima_api.c          |  5 +-
 security/integrity/ima/ima_main.c         |  2 +-
 security/integrity/ima/ima_modsig.c       | 19 +++++++
 security/integrity/ima/ima_policy.c       | 41 ++++++++++++++++
 security/integrity/ima/ima_template.c     |  7 ++-
 security/integrity/ima/ima_template_lib.c | 60 ++++++++++++++++++++++-
 security/integrity/ima/ima_template_lib.h |  4 ++
 9 files changed, 157 insertions(+), 8 deletions(-)

diff --git a/Documentation/security/IMA-templates.rst b/Documentation/security/IMA-templates.rst
index 2cd0e273cc9a..8da20b444be0 100644
--- a/Documentation/security/IMA-templates.rst
+++ b/Documentation/security/IMA-templates.rst
@@ -68,15 +68,18 @@ descriptors by adding their identifier to the format string
  - 'd-ng': the digest of the event, calculated with an arbitrary hash
    algorithm (field format: [<hash algo>:]digest, where the digest
    prefix is shown only if the hash algorithm is not SHA1 or MD5);
+ - 'd-modsig': the digest of the event without the appended modsig;
  - 'n-ng': the name of the event, without size limitations;
- - 'sig': the file signature.
+ - 'sig': the file signature;
+ - 'modsig' the appended file signature.
 
 
 Below, there is the list of defined template descriptors:
 
  - "ima": its format is ``d|n``;
  - "ima-ng" (default): its format is ``d-ng|n-ng``;
- - "ima-sig": its format is ``d-ng|n-ng|sig``.
+ - "ima-sig": its format is ``d-ng|n-ng|sig``;
+ - "ima-modsig": its format is ``d-ng|n-ng|sig|d-modsig|modsig``.
 
 
 
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 0acc8e56ec73..a2b2c13ceda8 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -64,6 +64,7 @@ struct ima_event_data {
 	const unsigned char *filename;
 	struct evm_ima_xattr_data *xattr_value;
 	int xattr_len;
+	const struct modsig *modsig;
 	const char *violation;
 };
 
@@ -207,7 +208,7 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
 			   const unsigned char *filename,
 			   struct evm_ima_xattr_data *xattr_value,
-			   int xattr_len, int pcr,
+			   int xattr_len, const struct modsig *modsig, int pcr,
 			   struct ima_template_desc *template_desc);
 void ima_audit_measurement(struct integrity_iint_cache *iint,
 			   const unsigned char *filename);
@@ -308,6 +309,10 @@ bool ima_hook_supports_modsig(enum ima_hooks func);
 int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
 		    struct modsig **modsig);
 void ima_collect_modsig(struct modsig *modsig, const void *buf, loff_t size);
+int ima_get_modsig_digest(const struct modsig *modsig, enum hash_algo *algo,
+			  const u8 **digest, u32 *digest_size);
+int ima_get_raw_modsig(const struct modsig *modsig, const void **data,
+		       u32 *data_len);
 void ima_free_modsig(struct modsig *modsig);
 #else
 static inline bool ima_hook_supports_modsig(enum ima_hooks func)
@@ -326,6 +331,19 @@ static inline void ima_collect_modsig(struct modsig *modsig, const void *buf,
 {
 }
 
+static inline int ima_get_modsig_digest(const struct modsig *modsig,
+					enum hash_algo *algo, const u8 **digest,
+					u32 *digest_size)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int ima_get_raw_modsig(const struct modsig *modsig,
+				     const void **data, u32 *data_len)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline void ima_free_modsig(struct modsig *modsig)
 {
 }
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index c351b8c37278..32297d1e6164 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -291,7 +291,7 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 void ima_store_measurement(struct integrity_iint_cache *iint,
 			   struct file *file, const unsigned char *filename,
 			   struct evm_ima_xattr_data *xattr_value,
-			   int xattr_len, int pcr,
+			   int xattr_len, const struct modsig *modsig, int pcr,
 			   struct ima_template_desc *template_desc)
 {
 	static const char op[] = "add_template_measure";
@@ -303,7 +303,8 @@ void ima_store_measurement(struct integrity_iint_cache *iint,
 					     .file = file,
 					     .filename = filename,
 					     .xattr_value = xattr_value,
-					     .xattr_len = xattr_len };
+					     .xattr_len = xattr_len,
+					     .modsig = modsig };
 	int violation = 0;
 
 	if (iint->measured_pcrs & (0x1 << pcr))
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 2c9d3cf85726..85afb31fafe0 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -323,7 +323,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 
 	if (action & IMA_MEASURE)
 		ima_store_measurement(iint, file, pathname,
-				      xattr_value, xattr_len, pcr,
+				      xattr_value, xattr_len, modsig, pcr,
 				      template_desc);
 	if (rc == 0 && (action & IMA_APPRAISE_SUBMASK)) {
 		inode_lock(inode);
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index d438b87dba89..b01bbfeb1d98 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -140,6 +140,25 @@ int ima_modsig_verify(struct key *keyring, const struct modsig *modsig)
 					VERIFYING_MODULE_SIGNATURE, NULL, NULL);
 }
 
+int ima_get_modsig_digest(const struct modsig *modsig, enum hash_algo *algo,
+			  const u8 **digest, u32 *digest_size)
+{
+	*algo = modsig->hash_algo;
+	*digest = modsig->digest;
+	*digest_size = modsig->digest_size;
+
+	return 0;
+}
+
+int ima_get_raw_modsig(const struct modsig *modsig, const void **data,
+		       u32 *data_len)
+{
+	*data = &modsig->raw_pkcs7;
+	*data_len = modsig->raw_pkcs7_len;
+
+	return 0;
+}
+
 void ima_free_modsig(struct modsig *modsig)
 {
 	if (!modsig)
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index f64ef84516db..6463ab8921ea 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -10,6 +10,9 @@
  *	- initialize default measure policy rules
  *
  */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/fs.h>
@@ -766,6 +769,38 @@ static void ima_log_string(struct audit_buffer *ab, char *key, char *value)
 	ima_log_string_op(ab, key, value, NULL);
 }
 
+/*
+ * Validating the appended signature included in the measurement list requires
+ * the file hash calculated without the appended signature (i.e., the 'd-modsig'
+ * field). Therefore, notify the user if they have the 'modsig' field but not
+ * the 'd-modsig' field in the template.
+ */
+static void check_template_modsig(const struct ima_template_desc *template)
+{
+#define MSG "template with 'modsig' field also needs 'd-modsig' field\n"
+	bool has_modsig, has_dmodsig;
+	static bool checked;
+	int i;
+
+	/* We only need to notify the user once. */
+	if (checked)
+		return;
+
+	has_modsig = has_dmodsig = false;
+	for (i = 0; i < template->num_fields; i++) {
+		if (!strcmp(template->fields[i]->field_id, "modsig"))
+			has_modsig = true;
+		else if (!strcmp(template->fields[i]->field_id, "d-modsig"))
+			has_dmodsig = true;
+	}
+
+	if (has_modsig && !has_dmodsig)
+		pr_notice(MSG);
+
+	checked = true;
+#undef MSG
+}
+
 static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
 {
 	struct audit_buffer *ab;
@@ -1096,6 +1131,12 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
 	else if (entry->action == APPRAISE)
 		temp_ima_appraise |= ima_appraise_flag(entry->func);
 
+	if (!result && entry->flags & IMA_MODSIG_ALLOWED) {
+		template_desc = entry->template ? entry->template :
+						  ima_template_desc_current();
+		check_template_modsig(template_desc);
+	}
+
 	audit_log_format(ab, "res=%d", !result);
 	audit_log_end(ab);
 	return result;
diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
index e6e892f31cbd..e25bef419c87 100644
--- a/security/integrity/ima/ima_template.c
+++ b/security/integrity/ima/ima_template.c
@@ -26,6 +26,7 @@ static struct ima_template_desc builtin_templates[] = {
 	{.name = IMA_TEMPLATE_IMA_NAME, .fmt = IMA_TEMPLATE_IMA_FMT},
 	{.name = "ima-ng", .fmt = "d-ng|n-ng"},
 	{.name = "ima-sig", .fmt = "d-ng|n-ng|sig"},
+	{.name = "ima-modsig", .fmt = "d-ng|n-ng|sig|d-modsig|modsig"},
 	{.name = "", .fmt = ""},	/* placeholder for a custom format */
 };
 
@@ -43,8 +44,12 @@ static const struct ima_template_field supported_fields[] = {
 	 .field_show = ima_show_template_string},
 	{.field_id = "sig", .field_init = ima_eventsig_init,
 	 .field_show = ima_show_template_sig},
+	{.field_id = "d-modsig", .field_init = ima_eventdigest_modsig_init,
+	 .field_show = ima_show_template_digest_ng},
+	{.field_id = "modsig", .field_init = ima_eventmodsig_init,
+	 .field_show = ima_show_template_sig},
 };
-#define MAX_TEMPLATE_NAME_LEN 15
+#define MAX_TEMPLATE_NAME_LEN sizeof("d|n|d-ng|n-ng|sig|d-modisg|modsig")
 
 static struct ima_template_desc *ima_template;
 static int template_desc_init_fields(const char *template_fmt,
diff --git a/security/integrity/ima/ima_template_lib.c b/security/integrity/ima/ima_template_lib.c
index 513b457ae900..dacb01fb105f 100644
--- a/security/integrity/ima/ima_template_lib.c
+++ b/security/integrity/ima/ima_template_lib.c
@@ -223,7 +223,8 @@ int ima_parse_buf(void *bufstartp, void *bufendp, void **bufcurp,
 	return 0;
 }
 
-static int ima_eventdigest_init_common(u8 *digest, u32 digestsize, u8 hash_algo,
+static int ima_eventdigest_init_common(const u8 *digest, u32 digestsize,
+				       u8 hash_algo,
 				       struct ima_field_data *field_data)
 {
 	/*
@@ -326,6 +327,41 @@ int ima_eventdigest_ng_init(struct ima_event_data *event_data,
 					   hash_algo, field_data);
 }
 
+/*
+ * This function writes the digest of the file which is expected to match the
+ * digest contained in the file's embedded signature.
+ */
+int ima_eventdigest_modsig_init(struct ima_event_data *event_data,
+				struct ima_field_data *field_data)
+{
+	enum hash_algo hash_algo;
+	const u8 *cur_digest;
+	u32 cur_digestsize;
+
+	if (!event_data->modsig)
+		return 0;
+
+	if (event_data->violation) {
+		/* Recording a violation. */
+		hash_algo = HASH_ALGO_SHA1;
+		cur_digest = NULL;
+		cur_digestsize = 0;
+	} else {
+		int rc;
+
+		rc = ima_get_modsig_digest(event_data->modsig, &hash_algo,
+					   &cur_digest, &cur_digestsize);
+		if (rc)
+			return rc;
+		else if (hash_algo == HASH_ALGO__LAST || cur_digestsize == 0)
+			/* There was some error collecting the digest. */
+			return -EINVAL;
+	}
+
+	return ima_eventdigest_init_common(cur_digest, cur_digestsize,
+					   hash_algo, field_data);
+}
+
 static int ima_eventname_init_common(struct ima_event_data *event_data,
 				     struct ima_field_data *field_data,
 				     bool size_limit)
@@ -389,3 +425,25 @@ int ima_eventsig_init(struct ima_event_data *event_data,
 	return ima_write_template_field_data(xattr_value, event_data->xattr_len,
 					     DATA_FMT_HEX, field_data);
 }
+
+int ima_eventmodsig_init(struct ima_event_data *event_data,
+			 struct ima_field_data *field_data)
+{
+	const void *data;
+	u32 data_len;
+	int rc;
+
+	if (!event_data->modsig)
+		return 0;
+
+	/*
+	 * modsig is a runtime structure containing pointers. Get its raw data
+	 * instead.
+	 */
+	rc = ima_get_raw_modsig(event_data->modsig, &data, &data_len);
+	if (rc)
+		return rc;
+
+	return ima_write_template_field_data(data, data_len, DATA_FMT_HEX,
+					     field_data);
+}
diff --git a/security/integrity/ima/ima_template_lib.h b/security/integrity/ima/ima_template_lib.h
index 6a3d8b831deb..1d7c690ebae5 100644
--- a/security/integrity/ima/ima_template_lib.h
+++ b/security/integrity/ima/ima_template_lib.h
@@ -38,8 +38,12 @@ int ima_eventname_init(struct ima_event_data *event_data,
 		       struct ima_field_data *field_data);
 int ima_eventdigest_ng_init(struct ima_event_data *event_data,
 			    struct ima_field_data *field_data);
+int ima_eventdigest_modsig_init(struct ima_event_data *event_data,
+				struct ima_field_data *field_data);
 int ima_eventname_ng_init(struct ima_event_data *event_data,
 			  struct ima_field_data *field_data);
 int ima_eventsig_init(struct ima_event_data *event_data,
 		      struct ima_field_data *field_data);
+int ima_eventmodsig_init(struct ima_event_data *event_data,
+			 struct ima_field_data *field_data);
 #endif /* __LINUX_IMA_TEMPLATE_LIB_H */
