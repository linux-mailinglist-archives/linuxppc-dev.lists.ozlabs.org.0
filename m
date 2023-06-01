Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B071F614
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXLcM6DXCz3fJ8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NpsGTQt9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NpsGTQt9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXLbJ6KkFz3dxm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 08:36:44 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351MLCUf018089;
	Thu, 1 Jun 2023 22:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mU47nVdTexep16MaxjhHdEziD+FCGlC8fmtsxhP3bcg=;
 b=NpsGTQt9wXr7hWbHEkeMj9C430KqzAzcmiUfp7Pa4Z3kkz9yBbplOkun9lsT8QT6WMfn
 8R+8+OIl/powUWscVMUkP5gzj5jiSCRwy2Isd6dN2dN9csJRfbam9qYWa0gw3vbU/0Oc
 kMkBhubDHkT7ovSxIRYXEJJ6hudTZbyLwXNri6SHCSVixPyB1la/JnKtFGQHSfmEGbI6
 rOlkZXHJOYodZ4dgDfCVkAQ4DRUuiuY6qsVVEjO25YP/r0kS/mBNVuKQToHfdX9t2k38
 d1+oV4plVQD9Y1qb9yWeBJS/PQsnB9YgIfMLmyT/6GdEGIVWKPDq4hQisX+oqwfauyJO wA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qy41v86pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:36:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 351G5SXh017488;
	Thu, 1 Jun 2023 22:36:34 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3qu9g5af7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:36:34 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351MaXqr34930996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 22:36:33 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7471258056;
	Thu,  1 Jun 2023 22:36:33 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D21B158054;
	Thu,  1 Jun 2023 22:36:32 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.58.163])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 22:36:32 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v6 2/3] block/sed-opal: keystore access for SED Opal keys
Date: Thu,  1 Jun 2023 17:36:29 -0500
Message-Id: <20230601223630.2136006-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230601223630.2136006-1-gjoyce@linux.vnet.ibm.com>
References: <20230601223630.2136006-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EsIwT61g79xw5a2JZsRKbnn0JqywJ_Vr
X-Proofpoint-GUID: EsIwT61g79xw5a2JZsRKbnn0JqywJ_Vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010194
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Allow for permanent SED Opal authentication keys by
reading/writing to the SED Opal non-volatile keystore.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/sed-opal.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 7f5f235a9048..1e8cfa00b609 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -18,6 +18,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sed-opal.h>
 #include <linux/sed-opal.h>
+#include <linux/sed-opal-key.h>
 #include <linux/string.h>
 #include <linux/kdev_t.h>
 #include <linux/key.h>
@@ -2803,7 +2804,13 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
 	if (ret)
 		return ret;
 
-	/* update keyring with new password */
+	/* update keyring and key store with new password */
+	ret = sed_write_key(OPAL_AUTH_KEY,
+			    opal_pw->new_user_pw.opal_key.key,
+			    opal_pw->new_user_pw.opal_key.key_len);
+	if (ret != -EOPNOTSUPP)
+		pr_warn("error updating SED key: %d\n", ret);
+
 	ret = update_sed_opal_key(OPAL_AUTH_KEY,
 				  opal_pw->new_user_pw.opal_key.key,
 				  opal_pw->new_user_pw.opal_key.key_len);
@@ -3050,6 +3057,8 @@ EXPORT_SYMBOL_GPL(sed_ioctl);
 static int __init sed_opal_init(void)
 {
 	struct key *kr;
+	char init_sed_key[OPAL_KEY_MAX];
+	int keylen = OPAL_KEY_MAX - 1;
 
 	kr = keyring_alloc(".sed_opal",
 			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
@@ -3062,6 +3071,11 @@ static int __init sed_opal_init(void)
 
 	sed_opal_keyring = kr;
 
-	return 0;
+	if (sed_read_key(OPAL_AUTH_KEY, init_sed_key, &keylen) < 0) {
+		memset(init_sed_key, '\0', sizeof(init_sed_key));
+		keylen = OPAL_KEY_MAX - 1;
+	}
+
+	return update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);
 }
 late_initcall(sed_opal_init);
-- 
gjoyce@linux.vnet.ibm.com

