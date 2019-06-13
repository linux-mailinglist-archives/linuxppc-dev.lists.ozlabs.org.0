Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BD44DE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 22:54:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PwwQ3yxQzDrCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 06:54:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Pwqs5XNTzDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 06:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45Pwqs1Dxnz8t30
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 06:50:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45Pwqs0D8hz9sND; Fri, 14 Jun 2019 06:50:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45Pwqr288Gz9sBr
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Jun 2019 06:50:48 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5DKlE8H067039
 for <linuxppc-dev@ozlabs.org>; Thu, 13 Jun 2019 16:50:45 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t3sr5svwy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 13 Jun 2019 16:50:45 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Thu, 13 Jun 2019 21:50:42 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Jun 2019 21:50:38 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5DKobsI31719474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 20:50:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E30265204F;
 Thu, 13 Jun 2019 20:50:36 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.207.125])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C0EEC5204E;
 Thu, 13 Jun 2019 20:50:33 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org
Subject: [PATCH 1/2] powerpc/powernv: add OPAL APIs for secure variables
Date: Thu, 13 Jun 2019 16:50:26 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560459027-5248-1-git-send-email-nayna@linux.ibm.com>
References: <1560459027-5248-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19061320-4275-0000-0000-000003421DD5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061320-4276-0000-0000-00003852391C
Message-Id: <1560459027-5248-2-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-13_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906130156
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Claudio Carvalho <cclaudio@linux.ibm.com>

The X.509 certificates trusted by the platform and other information
required to secure boot the OS kernel are wrapped in secure variables,
which are controlled by OPAL. These variables are manipulated by
userspace tools using filesystem interface. This patch adds support
for the OPAL APIs required to expose variables to userspace.

OPAL_SECVAR_GET_NEXT:
For a given secure variable, it returns the name and vendor GUID
of the next variable.

OPAL_SECVAR_ENQUEUE_UPDATE:
Enqueue the supplied secure variable update so that it can be processed
by OPAL in the next boot. Variable updates cannot be be processed right
away because the variable storage is write locked at runtime.

OPAL_SECVAR_GET_SIZE:
Returns size information about the variable.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h          |  3 +
 arch/powerpc/include/asm/opal-secvar.h       |  9 +++
 arch/powerpc/include/asm/opal.h              |  8 +++
 arch/powerpc/platforms/powernv/opal-call.c   |  3 +
 arch/powerpc/platforms/powernv/opal-secvar.c | 60 +++++++++++++++++++-
 5 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index a505e669b4b6..fa3083966efc 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -213,6 +213,9 @@
 #define	OPAL_NX_COPROC_INIT			167
 #define OPAL_XIVE_GET_VP_STATE			170
 #define OPAL_SECVAR_GET                         173
+#define OPAL_SECVAR_GET_SIZE                    174
+#define OPAL_SECVAR_GET_NEXT                    175
+#define OPAL_SECVAR_ENQUEUE_UPDATE              176
 #define OPAL_SECVAR_BACKEND                     177
 #define OPAL_LAST				177
 
diff --git a/arch/powerpc/include/asm/opal-secvar.h b/arch/powerpc/include/asm/opal-secvar.h
index b677171a0368..26ebbc63dd70 100644
--- a/arch/powerpc/include/asm/opal-secvar.h
+++ b/arch/powerpc/include/asm/opal-secvar.h
@@ -20,4 +20,13 @@ extern int opal_get_variable(u8 *key, unsigned long ksize,
 
 extern int opal_variable_version(unsigned long *backend);
 
+extern int opal_get_variable_size(u8 *key, unsigned long ksize,
+				  unsigned long *mdsize, unsigned long *dsize);
+
+extern int opal_get_next_variable(u8 *key, unsigned long *keylen,
+				  unsigned long keysize);
+
+extern int opal_set_variable(u8 *key, unsigned long ksize, u8 *metadata,
+			     unsigned long mdsize, u8 *data,
+			     unsigned long dsize);
 #endif
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 57d2c2356eda..a6fcb59c91cc 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -399,6 +399,14 @@ extern int opal_secvar_get(uint64_t k_key, uint64_t k_key_len,
 			   uint64_t k_data, uint64_t k_data_size);
 
 extern int opal_secvar_backend(uint64_t k_backend);
+extern int opal_secvar_get_size(uint64_t k_key, uint64_t k_key_len,
+				uint64_t k_metadata_size, uint64_t k_data_size);
+extern int opal_secvar_get_next(uint64_t k_key, uint64_t k_key_len,
+				uint64_t k_key_size);
+extern int opal_secvar_enqueue_update(uint64_t k_key, uint64_t k_key_len,
+				      uint64_t k_metadata,
+				      uint64_t k_metadata_size,
+				      uint64_t k_data, uint64_t k_data_size);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 0445980f294f..dda3a4c5bb79 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -290,3 +290,6 @@ OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
 OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
 OPAL_CALL(opal_secvar_get,                      OPAL_SECVAR_GET);
 OPAL_CALL(opal_secvar_backend,                  OPAL_SECVAR_BACKEND);
+OPAL_CALL(opal_secvar_get_size,                 OPAL_SECVAR_GET_SIZE);
+OPAL_CALL(opal_secvar_get_next,                 OPAL_SECVAR_GET_NEXT);
+OPAL_CALL(opal_secvar_enqueue_update,           OPAL_SECVAR_ENQUEUE_UPDATE);
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index dba441dd5af1..afa67b87ad7a 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -30,7 +30,10 @@ static bool is_opal_secvar_supported(void)
 		return opal_secvar_supported;
 
 	if (!opal_check_token(OPAL_SECVAR_GET)
-	    || !opal_check_token(OPAL_SECVAR_BACKEND)) {
+	    || !opal_check_token(OPAL_SECVAR_BACKEND)
+	    || !opal_check_token(OPAL_SECVAR_GET_SIZE)
+	    || !opal_check_token(OPAL_SECVAR_GET_NEXT)
+	    || !opal_check_token(OPAL_SECVAR_ENQUEUE_UPDATE)) {
 		pr_err("OPAL doesn't support secure variables\n");
 		opal_secvar_supported = false;
 	} else {
@@ -83,3 +86,58 @@ int opal_variable_version(unsigned long *backend)
 
 	return rc;
 }
+
+int opal_get_variable_size(u8 *key, unsigned long ksize, unsigned long *mdsize,
+			   unsigned long *dsize)
+{
+	int rc;
+
+	if (!is_opal_secvar_supported())
+		return OPAL_UNSUPPORTED;
+
+	if (mdsize)
+		*mdsize = cpu_to_be64(*mdsize);
+	if (dsize)
+		*dsize = cpu_to_be64(*dsize);
+
+	rc = opal_secvar_get_size(__pa(key), ksize, __pa(mdsize), __pa(dsize));
+
+	if (mdsize)
+		*mdsize = be64_to_cpu(*mdsize);
+	if (dsize)
+		*dsize = be64_to_cpu(*dsize);
+	return rc;
+}
+
+int opal_get_next_variable(u8 *key, unsigned long *keylen,
+			   unsigned long keysize)
+{
+	int rc;
+
+	if (!is_opal_secvar_supported())
+		return OPAL_UNSUPPORTED;
+
+	if (!keylen)
+		return OPAL_PARAMETER;
+	*keylen = cpu_to_be64(*keylen);
+
+	rc = opal_secvar_get_next(__pa(key), __pa(keylen), keysize);
+
+	*keylen = be64_to_cpu(*keylen);
+
+	return rc;
+}
+
+int opal_set_variable(u8 *key, unsigned long ksize, u8 *metadata,
+		      unsigned long mdsize, u8 *data, unsigned long dsize)
+{
+	int rc;
+
+	if (!is_opal_secvar_supported())
+		return OPAL_UNSUPPORTED;
+
+	rc = opal_secvar_enqueue_update(__pa(key), ksize, __pa(metadata),
+			mdsize, __pa(data), dsize);
+
+	return rc;
+}
-- 
2.20.1

