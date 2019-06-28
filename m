Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB459169
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:42:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZgzT2B5KzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:42:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZgV36rrNzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:20:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S2GXt5013677; Thu, 27 Jun 2019 22:20:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2td86gur2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 22:20:29 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5S2Hc68015982;
 Thu, 27 Jun 2019 22:20:29 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2td86gur25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 22:20:29 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5S2JYlk031936;
 Fri, 28 Jun 2019 02:20:28 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 2t9by7jp2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 02:20:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5S2KRtQ42205670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 02:20:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B63B112061;
 Fri, 28 Jun 2019 02:20:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9862112065;
 Fri, 28 Jun 2019 02:20:23 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.218.134])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 02:20:23 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v12 09/11] ima: Define ima-modsig template
Date: Thu, 27 Jun 2019 23:19:32 -0300
Message-Id: <20190628021934.4260-10-bauerman@linux.ibm.com>
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
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
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
 Documentation/security/IMA-templates.rst  |  3 ++
 security/integrity/ima/ima.h              | 20 ++++++-
 security/integrity/ima/ima_api.c          |  5 +-
 security/integrity/ima/ima_main.c         |  2 +-
 security/integrity/ima/ima_modsig.c       | 19 +++++++
 security/integrity/ima/ima_policy.c       | 41 +++++++++++++++
 security/integrity/ima/ima_template.c     |  7 ++-
 security/integrity/ima/ima_template_lib.c | 64 ++++++++++++++++++++++-
 security/integrity/ima/ima_template_lib.h |  4 ++
 9 files changed, 159 insertions(+), 6 deletions(-)

diff --git a/Documentation/security/IMA-templates.rst b/Documentation/security/IMA-templates.rst
index 3d1cca287aa4..c5a8432972ef 100644
--- a/Documentation/security/IMA-templates.rst
+++ b/Documentation/security/IMA-templates.rst
@@ -68,8 +68,10 @@ descriptors by adding their identifier to the format string
  - 'd-ng': the digest of the event, calculated with an arbitrary hash
    algorithm (field format: [<hash algo>:]digest, where the digest
    prefix is shown only if the hash algorithm is not SHA1 or MD5);
+ - 'd-modsig': the digest of the event without the appended modsig;
  - 'n-ng': the name of the event, without size limitations;
  - 'sig': the file signature;
+ - 'modsig' the appended file signature;
  - 'buf': the buffer data that was used to generate the hash without size limitations;
 
 
@@ -79,6 +81,7 @@ Below, there is the list of defined template descriptors:
  - "ima-ng" (default): its format is ``d-ng|n-ng``;
  - "ima-sig": its format is ``d-ng|n-ng|sig``;
  - "ima-buf": its format is ``d-ng|n-ng|buf``;
+ - "ima-modsig": its format is ``d-ng|n-ng|sig|d-modsig|modsig``;
 
 
 Use
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index baf2ffd52a41..3293dd07b6c9 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -64,6 +64,7 @@ struct ima_event_data {
 	const unsigned char *filename;
 	struct evm_ima_xattr_data *xattr_value;
 	int xattr_len;
+	const struct modsig *modsig;
 	const char *violation;
 	const void *buf;
 	int buf_len;
@@ -215,7 +216,7 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
 			   const unsigned char *filename,
 			   struct evm_ima_xattr_data *xattr_value,
-			   int xattr_len, int pcr,
+			   int xattr_len, const struct modsig *modsig, int pcr,
 			   struct ima_template_desc *template_desc);
 void ima_audit_measurement(struct integrity_iint_cache *iint,
 			   const unsigned char *filename);
@@ -316,6 +317,10 @@ bool ima_hook_supports_modsig(enum ima_hooks func);
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
@@ -334,6 +339,19 @@ static inline void ima_collect_modsig(struct modsig *modsig, const void *buf,
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
index ac35bc3d6e35..9d1fe712a6cc 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -292,7 +292,7 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 void ima_store_measurement(struct integrity_iint_cache *iint,
 			   struct file *file, const unsigned char *filename,
 			   struct evm_ima_xattr_data *xattr_value,
-			   int xattr_len, int pcr,
+			   int xattr_len, const struct modsig *modsig, int pcr,
 			   struct ima_template_desc *template_desc)
 {
 	static const char op[] = "add_template_measure";
@@ -304,7 +304,8 @@ void ima_store_measurement(struct integrity_iint_cache *iint,
 					     .file = file,
 					     .filename = filename,
 					     .xattr_value = xattr_value,
-					     .xattr_len = xattr_len };
+					     .xattr_len = xattr_len,
+					     .modsig = modsig };
 	int violation = 0;
 
 	if (iint->measured_pcrs & (0x1 << pcr))
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index cc4500f93408..8b35a200e0cc 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -327,7 +327,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 
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
index 4c5b968c4721..4fc13e591f1d 100644
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
@@ -847,6 +850,38 @@ static void ima_log_string(struct audit_buffer *ab, char *key, char *value)
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
@@ -1189,6 +1224,12 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
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
index 7343e8e0ae2f..ac526b34973f 100644
--- a/security/integrity/ima/ima_template.c
+++ b/security/integrity/ima/ima_template.c
@@ -27,6 +27,7 @@ static struct ima_template_desc builtin_templates[] = {
 	{.name = "ima-ng", .fmt = "d-ng|n-ng"},
 	{.name = "ima-sig", .fmt = "d-ng|n-ng|sig"},
 	{.name = "ima-buf", .fmt = "d-ng|n-ng|buf"},
+	{.name = "ima-modsig", .fmt = "d-ng|n-ng|sig|d-modsig|modsig"},
 	{.name = "", .fmt = ""},	/* placeholder for a custom format */
 };
 
@@ -46,6 +47,10 @@ static const struct ima_template_field supported_fields[] = {
 	 .field_show = ima_show_template_sig},
 	{.field_id = "buf", .field_init = ima_eventbuf_init,
 	 .field_show = ima_show_template_buf},
+	{.field_id = "d-modsig", .field_init = ima_eventdigest_modsig_init,
+	 .field_show = ima_show_template_digest_ng},
+	{.field_id = "modsig", .field_init = ima_eventmodsig_init,
+	 .field_show = ima_show_template_sig},
 };
 
 /*
@@ -53,7 +58,7 @@ static const struct ima_template_field supported_fields[] = {
  * need to be accounted for since they shouldn't be defined in the same template
  * description as 'd-ng' and 'n-ng' respectively.
  */
-#define MAX_TEMPLATE_NAME_LEN sizeof("d-ng|n-ng|sig|buf")
+#define MAX_TEMPLATE_NAME_LEN sizeof("d-ng|n-ng|sig|buf|d-modisg|modsig")
 
 static struct ima_template_desc *ima_template;
 
diff --git a/security/integrity/ima/ima_template_lib.c b/security/integrity/ima/ima_template_lib.c
index baf4de45c5aa..22e71cd5ca02 100644
--- a/security/integrity/ima/ima_template_lib.c
+++ b/security/integrity/ima/ima_template_lib.c
@@ -229,7 +229,8 @@ int ima_parse_buf(void *bufstartp, void *bufendp, void **bufcurp,
 	return 0;
 }
 
-static int ima_eventdigest_init_common(u8 *digest, u32 digestsize, u8 hash_algo,
+static int ima_eventdigest_init_common(const u8 *digest, u32 digestsize,
+				       u8 hash_algo,
 				       struct ima_field_data *field_data)
 {
 	/*
@@ -332,6 +333,41 @@ int ima_eventdigest_ng_init(struct ima_event_data *event_data,
 					   hash_algo, field_data);
 }
 
+/*
+ * This function writes the digest of the file which is expected to match the
+ * digest contained in the file's appended signature.
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
@@ -410,3 +446,29 @@ int ima_eventbuf_init(struct ima_event_data *event_data,
 					     event_data->buf_len, DATA_FMT_HEX,
 					     field_data);
 }
+
+/*
+ *  ima_eventmodsig_init - include the appended file signature as part of the
+ *  template data
+ */
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
index 12f1a8578b31..6544eac1c77d 100644
--- a/security/integrity/ima/ima_template_lib.h
+++ b/security/integrity/ima/ima_template_lib.h
@@ -40,10 +40,14 @@ int ima_eventname_init(struct ima_event_data *event_data,
 		       struct ima_field_data *field_data);
 int ima_eventdigest_ng_init(struct ima_event_data *event_data,
 			    struct ima_field_data *field_data);
+int ima_eventdigest_modsig_init(struct ima_event_data *event_data,
+				struct ima_field_data *field_data);
 int ima_eventname_ng_init(struct ima_event_data *event_data,
 			  struct ima_field_data *field_data);
 int ima_eventsig_init(struct ima_event_data *event_data,
 		      struct ima_field_data *field_data);
 int ima_eventbuf_init(struct ima_event_data *event_data,
 		      struct ima_field_data *field_data);
+int ima_eventmodsig_init(struct ima_event_data *event_data,
+			 struct ima_field_data *field_data);
 #endif /* __LINUX_IMA_TEMPLATE_LIB_H */
