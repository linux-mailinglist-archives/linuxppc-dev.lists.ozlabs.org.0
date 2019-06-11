Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7DC3C488
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:54:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLMk75j1zDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:54:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKr04XyRzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:30:24 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B6RPe5000758
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:30:21 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t24qcd2we-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:30:20 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 11 Jun 2019 07:30:19 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 07:30:15 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B6UDAR24445218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 06:30:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131FEC6055;
 Tue, 11 Jun 2019 06:30:13 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DBCBC6063;
 Tue, 11 Jun 2019 06:30:08 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.227.34])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 06:30:07 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v11 12/13] ima: Store the measurement again when appraising a
 modsig
Date: Tue, 11 Jun 2019 03:28:16 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611062817.18412-1-bauerman@linux.ibm.com>
References: <20190611062817.18412-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061106-0016-0000-0000-000009C11C6F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011245; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216304; UDB=6.00639510; IPR=6.00997404; 
 MB=3.00027259; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-11 06:30:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061106-0017-0000-0000-0000439AFDC7
Message-Id: <20190611062817.18412-13-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
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

If the IMA template contains the "modsig" or "d-modsig" field, then the
modsig should be added to the measurement list when the file is appraised.

And that is what normally happens, but if a measurement rule caused a file
containing a modsig to be measured before a different rule causes it to be
appraised, the resulting measurement entry will not contain the modsig
because it is only fetched during appraisal. When the appraisal rule
triggers, it won't store a new measurement containing the modsig because
the file was already measured.

We need to detect that situation and store an additional measurement with
the modsig. This is done by adding an IMA_MEASURE action flag if we read a
modsig and the IMA template contains a modsig field.

Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 security/integrity/ima/ima.h          |  1 +
 security/integrity/ima/ima_api.c      | 19 +++++++++++++++----
 security/integrity/ima/ima_main.c     | 15 ++++++++++++---
 security/integrity/ima/ima_template.c | 19 +++++++++++++++++++
 4 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index a2b2c13ceda8..44f5f60424c2 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -149,6 +149,7 @@ void ima_putc(struct seq_file *m, void *data, int datalen);
 void ima_print_digest(struct seq_file *m, u8 *digest, u32 size);
 struct ima_template_desc *ima_template_desc_current(void);
 struct ima_template_desc *lookup_template_desc(const char *name);
+bool ima_template_has_modsig(const struct ima_template_desc *ima_template);
 int ima_restore_measurement_entry(struct ima_template_entry *entry);
 int ima_restore_measurement_list(loff_t bufsize, void *buf);
 int ima_measurements_show(struct seq_file *m, void *v);
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index 32297d1e6164..bb887ed3d8a7 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -222,6 +222,14 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 		char digest[IMA_MAX_DIGEST_SIZE];
 	} hash;
 
+	/*
+	 * Always collect the modsig, because IMA might have already collected
+	 * the file digest without collecting the modsig in a previous
+	 * measurement rule.
+	 */
+	if (modsig)
+		ima_collect_modsig(modsig, buf, size);
+
 	if (iint->flags & IMA_COLLECTED)
 		goto out;
 
@@ -255,9 +263,6 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 	memcpy(iint->ima_hash, &hash, length);
 	iint->version = i_version;
 
-	if (modsig)
-		ima_collect_modsig(modsig, buf, size);
-
 	/* Possibly temporary failure due to type of read (eg. O_DIRECT) */
 	if (!result)
 		iint->flags |= IMA_COLLECTED;
@@ -307,7 +312,13 @@ void ima_store_measurement(struct integrity_iint_cache *iint,
 					     .modsig = modsig };
 	int violation = 0;
 
-	if (iint->measured_pcrs & (0x1 << pcr))
+	/*
+	 * We still need to store the measurement in the case of MODSIG because
+	 * we only have its contents to put in the list at the time of
+	 * appraisal, but a file measurement from earlier might already exist in
+	 * the measurement list.
+	 */
+	if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
 		return;
 
 	result = ima_alloc_init_template(&event_data, &entry, template_desc);
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 85afb31fafe0..e0ca39f81a59 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -307,9 +307,18 @@ static int process_measurement(struct file *file, const struct cred *cred,
 		/* read 'security.ima' */
 		xattr_len = ima_read_xattr(file_dentry(file), &xattr_value);
 
-		/* Read the appended modsig if allowed by the policy. */
-		if (iint->flags & IMA_MODSIG_ALLOWED)
-			ima_read_modsig(func, buf, size, &modsig);
+		/*
+		 * Read the appended modsig if allowed by the policy, and allow
+		 * an additional measurement list entry, if needed, based on the
+		 * template format and whether the file was already measured.
+		 */
+		if (iint->flags & IMA_MODSIG_ALLOWED) {
+			rc = ima_read_modsig(func, buf, size, &modsig);
+
+			if (!rc && ima_template_has_modsig(template_desc) &&
+			    iint->flags & IMA_MEASURED)
+				action |= IMA_MEASURE;
+		}
 	}
 
 	hash_algo = ima_get_hash_algo(xattr_value, xattr_len);
diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
index e25bef419c87..00d9a6cc8a60 100644
--- a/security/integrity/ima/ima_template.c
+++ b/security/integrity/ima/ima_template.c
@@ -56,6 +56,25 @@ static int template_desc_init_fields(const char *template_fmt,
 				     const struct ima_template_field ***fields,
 				     int *num_fields);
 
+/**
+ * ima_template_has_modsig - Check whether template has modsig-related fields.
+ * @ima_template: IMA template to check.
+ *
+ * Tells whether the given template has fields referencing a file's appended
+ * signature.
+ */
+bool ima_template_has_modsig(const struct ima_template_desc *ima_template)
+{
+	int i;
+
+	for (i = 0; i < ima_template->num_fields; i++)
+		if (!strcmp(ima_template->fields[i]->field_id, "modsig") ||
+		    !strcmp(ima_template->fields[i]->field_id, "d-modsig"))
+			return true;
+
+	return false;
+}
+
 static int __init ima_template_setup(char *str)
 {
 	struct ima_template_desc *template_desc;

