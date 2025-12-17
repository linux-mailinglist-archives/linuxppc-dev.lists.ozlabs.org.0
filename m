Return-Path: <linuxppc-dev+bounces-14849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D658DCC90B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:26:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWggF15htz3bb2;
	Thu, 18 Dec 2025 04:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992345;
	cv=none; b=P+9ERR9P49RRAU9XMpYHgRbDB/qVsFO6dqF0/LoTGRqcAT6MVN6oYFmQA+6zZn84OOYxXC4bjKxIiZBurgXAMmZ4/kAy8w8nhD9vgswnH2sAHO85BeXfOfTKBTWmoY1c1o6AiOtXRZIo5PFpxjym4hCLS9JrUgiahlr+RHEq/PesE7rJQHdTy5sRt9WGO6hAWKczcuBYdqtN5XVHzRSUYvxpdsuM+Jrdkp7KJ4g/96lK+DHF1qEMNModtJsk/iQDADnAKxyersY4U4+qF8eE7TBUHPUio8e8VO1lasCsi0u/xlRTWX/Zo4jhGWLOV13IQqtX66UM0CDxef2TjNunDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992345; c=relaxed/relaxed;
	bh=VofaA8q/4ABtaWVAdbWNse/SgziEVn30CfP4o9F2G2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vv7iFxesJoa75Ft+5rb3w5plZ+ggmOKSLk75nVxlPtK9tzDsu0yy232WD97gARyqYUH2viHQ5vqWgfZUnjNJnUtbUsAmr5l3ROk1j3KDVNsIMVwsQbuOzU/u8wLRpO+tB879l+rbiNY8WOYCqmp+qaTkVu8SmXqSGRl6UTluccQ2pnYsCWKq8IqYPzO68HFAwez6GrVeTeMSyfj82IldAghK65zcp6A7HrNjeNugbX1ofpYzgTNdNnDxpX/1JiuBZ9gyJ2piPLHby2Ei80tK1/ex2j8xLMek0ZuLKswXVWeI9M2HBeiK9wxbP9dUDHZCSFJm0DAIgeo8u8R26BKj4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WjtlfQhd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WjtlfQhd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWggD206Fz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:25:43 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHBDZp0018154;
	Wed, 17 Dec 2025 17:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VofaA8q/4ABtaWVAd
	bWNse/SgziEVn30CfP4o9F2G2g=; b=WjtlfQhdW71UC6ku7wPdIXUG0iyc4uQXG
	slMLawU7QoaFfl+3VE05pU2pPjHklLiRmo+h/YBx4RRaRQ4KPKKGyBrMHqkxz3RR
	DVBKgIamQqjF91igFsUelvPy+Sb7xzwzeW1li+pOAngA5ObzoZbKzjID/+86Wz12
	qcJQnXUFZCZftngcKQrtNR1BJdmFrlU/PqgAG3/ybAScqk1xbwqhOfkMlt5UeJ4U
	A2lLjTKpccNYdjaYsojE2eP+e+YpsPz8dv2sfXSgqN6I9lNEV+E7D0bA/uZyelyx
	IP9uIZQgxBjg9quCiqB7oOC6Z317+vEt2b6vgbB2kyxSfiH7nDtZw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1nbk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:31 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BHHDmqd009332;
	Wed, 17 Dec 2025 17:25:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1nbk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHEkA4U014406;
	Wed, 17 Dec 2025 17:25:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpk3afs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BHHPQ8M26542526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 17:25:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 977152004B;
	Wed, 17 Dec 2025 17:25:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD3D920040;
	Wed, 17 Dec 2025 17:25:23 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.211.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 17:25:23 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v2 5/6] keys/trusted_keys: establish PKWM as a trusted source
Date: Wed, 17 Dec 2025 22:55:04 +0530
Message-ID: <20251217172505.112398-6-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217172505.112398-1-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j92BvtY8jI_MrRpFlQT2MO_SpqYwH-b4
X-Proofpoint-ORIG-GUID: rFPkEKvzYdDBUz6OSgPZKktOL4Y-vj_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXwT65vapD1Vhr
 PMFYUn4BhX1SN9oBKkcfPuYCAIVJwsNzMSocet92RoCzPJ62xt+s8cU28o2+V+6w/0Bswi6p9ut
 xC8G3GaQCJ12C230eTWGsilaYfuLtDdlsSpvefLwAnuaXVGpUQT0UOwCCFetYHIXhfp2aMMjPTO
 hF9xEo9KlYuVooS9F+ueyzP6XBPLSUQTafb4C+riQ5uXT9yTMi/7mmt1cof/UfGWyqKMfiab0hN
 vsh+VIVMthaZz++Do4vuEPWRGPXRAXg8/TKCcsqKwp6GRLLJUs1uBBMtZg+/mOGw56ZPDX26v6T
 Hti6ofj+VV8q9J2gdCX33vPy3j1aryJhjkJdva+w2zChId+oCC4CvsZ6OYv9mDEXaIJHKP46FcG
 1K9op2RrWXJOpndXYvgul7ZRSlse1Q==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=6942e78b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=SGwaXr-4V_wxwTcTBwMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The wrapping key does not exist by default and is generated by the
hypervisor as a part of PKWM initialization. This key is then persisted by
the hypervisor and is used to wrap trusted keys. These are variable length
symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) are
generated using the kernel RNG. PKWM can be used as a trust source through
the following example keyctl command

keyctl add trusted my_trusted_key "new 32" @u

Use the wrap_flags command option to set the secure boot requirement for
the wrapping request through the following keyctl commands

case1: no secure boot requirement. (default)
keyctl usage: keyctl add trusted my_trusted_key "new 32" @u
	      OR
	      keyctl add trusted my_trusted_key "new 32 wrap_flags=0x00" @u

case2: secure boot required to in either audit or enforce mode. set bit 0
keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x01" @u

case3: secure boot required to be in enforce mode. set bit 1
keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x02" @u

NOTE:
-> Setting the secure boot requirement is NOT a must.
-> Only either of the secure boot requirement options should be set. Not
both.
-> All the other bits are requied to be not set.
-> Set the kernel parameter trusted.source=pkwm to choose PKWM as the
backend for trusted keys implementation.
-> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.

Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
KeyStore, as a new trust source for trusted keys.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
---
 MAINTAINERS                               |   9 ++
 include/keys/trusted-type.h               |   7 +-
 include/keys/trusted_pkwm.h               |  22 +++
 security/keys/trusted-keys/Kconfig        |   8 ++
 security/keys/trusted-keys/Makefile       |   2 +
 security/keys/trusted-keys/trusted_core.c |   6 +-
 security/keys/trusted-keys/trusted_pkwm.c | 168 ++++++++++++++++++++++
 7 files changed, 220 insertions(+), 2 deletions(-)
 create mode 100644 include/keys/trusted_pkwm.h
 create mode 100644 security/keys/trusted-keys/trusted_pkwm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c6..be4f561ec28a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13994,6 +13994,15 @@ S:	Supported
 F:	include/keys/trusted_dcp.h
 F:	security/keys/trusted-keys/trusted_dcp.c
 
+KEYS-TRUSTED-PLPKS
+M:	Srish Srinivasan <ssrish@linux.ibm.com>
+M:	Nayna Jain <nayna@linux.ibm.com>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_plpks.h
+F:	security/keys/trusted-keys/trusted_pkwm.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@kernel.org>
 L:	linux-integrity@vger.kernel.org
diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
index 4eb64548a74f..45c6c538df22 100644
--- a/include/keys/trusted-type.h
+++ b/include/keys/trusted-type.h
@@ -19,7 +19,11 @@
 
 #define MIN_KEY_SIZE			32
 #define MAX_KEY_SIZE			128
-#define MAX_BLOB_SIZE			512
+#if IS_ENABLED(CONFIG_TRUSTED_KEYS_PKWM)
+#define MAX_BLOB_SIZE			1152
+#else
+#define MAX_BLOB_SIZE                   512
+#endif
 #define MAX_PCRINFO_SIZE		64
 #define MAX_DIGEST_SIZE			64
 
@@ -46,6 +50,7 @@ struct trusted_key_options {
 	uint32_t policydigest_len;
 	unsigned char policydigest[MAX_DIGEST_SIZE];
 	uint32_t policyhandle;
+	uint16_t wrap_flags;
 };
 
 struct trusted_key_ops {
diff --git a/include/keys/trusted_pkwm.h b/include/keys/trusted_pkwm.h
new file mode 100644
index 000000000000..c7249d08b4d8
--- /dev/null
+++ b/include/keys/trusted_pkwm.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PKWM_TRUSTED_KEY_H
+#define __PKWM_TRUSTED_KEY_H
+
+#include <keys/trusted-type.h>
+
+extern struct trusted_key_ops pkwm_trusted_key_ops;
+
+static inline void dump_options(struct trusted_key_options *o)
+{
+	bool sb_audit_or_enforce_bit = o->wrap_flags & BIT(0);
+	bool sb_enforce_bit = o->wrap_flags & BIT(1);
+
+	if (sb_audit_or_enforce_bit)
+		pr_debug("secure boot mode required: audit or enforce");
+	else if (sb_enforce_bit)
+		pr_debug("secure boot mode required: enforce");
+	else
+		pr_debug("secure boot mode required: disabled");
+}
+
+#endif
diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
index 204a68c1429d..9e00482d886a 100644
--- a/security/keys/trusted-keys/Kconfig
+++ b/security/keys/trusted-keys/Kconfig
@@ -46,6 +46,14 @@ config TRUSTED_KEYS_DCP
 	help
 	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
 
+config TRUSTED_KEYS_PKWM
+	bool "PKWM-based trusted keys"
+	depends on PSERIES_PLPKS >= TRUSTED_KEYS
+	default y
+	select HAVE_TRUSTED_KEYS
+	help
+	  Enable use of IBM PowerVM Key Wrapping Module (PKWM) as a trusted key backend.
+
 if !HAVE_TRUSTED_KEYS
 	comment "No trust source selected!"
 endif
diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
index f0f3b27f688b..5fc053a21dad 100644
--- a/security/keys/trusted-keys/Makefile
+++ b/security/keys/trusted-keys/Makefile
@@ -16,3 +16,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TEE) += trusted_tee.o
 trusted-$(CONFIG_TRUSTED_KEYS_CAAM) += trusted_caam.o
 
 trusted-$(CONFIG_TRUSTED_KEYS_DCP) += trusted_dcp.o
+
+trusted-$(CONFIG_TRUSTED_KEYS_PKWM) += trusted_pkwm.o
diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
index b1680ee53f86..2d328de170e8 100644
--- a/security/keys/trusted-keys/trusted_core.c
+++ b/security/keys/trusted-keys/trusted_core.c
@@ -12,6 +12,7 @@
 #include <keys/trusted_caam.h>
 #include <keys/trusted_dcp.h>
 #include <keys/trusted_tpm.h>
+#include <keys/trusted_pkwm.h>
 #include <linux/capability.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -31,7 +32,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
 
 static char *trusted_key_source;
 module_param_named(source, trusted_key_source, charp, 0);
-MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or dcp)");
+MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam, dcp or pkwm)");
 
 static const struct trusted_key_source trusted_key_sources[] = {
 #if defined(CONFIG_TRUSTED_KEYS_TPM)
@@ -46,6 +47,9 @@ static const struct trusted_key_source trusted_key_sources[] = {
 #if defined(CONFIG_TRUSTED_KEYS_DCP)
 	{ "dcp", &dcp_trusted_key_ops },
 #endif
+#if defined(CONFIG_TRUSTED_KEYS_PKWM)
+	{ "pkwm", &pkwm_trusted_key_ops },
+#endif
 };
 
 DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
diff --git a/security/keys/trusted-keys/trusted_pkwm.c b/security/keys/trusted-keys/trusted_pkwm.c
new file mode 100644
index 000000000000..d822b81afacf
--- /dev/null
+++ b/security/keys/trusted-keys/trusted_pkwm.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 IBM Corporation, Srish Srinivasan <ssrish@linux.ibm.com>
+ */
+
+#include <keys/trusted_pkwm.h>
+#include <keys/trusted-type.h>
+#include <linux/build_bug.h>
+#include <linux/key-type.h>
+#include <linux/parser.h>
+#include <asm/plpks.h>
+
+enum {
+	Opt_err,
+	Opt_wrap_flags,
+};
+
+static const match_table_t key_tokens = {
+	{Opt_wrap_flags, "wrap_flags=%s"},
+	{Opt_err, NULL}
+};
+
+static int getoptions(char *datablob, struct trusted_key_options **opt)
+{
+	substring_t args[MAX_OPT_ARGS];
+	char *p = datablob;
+	int token;
+	int res;
+	unsigned long wrap_flags;
+	unsigned long token_mask = 0;
+
+	if (!datablob)
+		return 0;
+
+	while ((p = strsep(&datablob, " \t"))) {
+		if (*p == '\0' || *p == ' ' || *p == '\t')
+			continue;
+
+		token = match_token(p, key_tokens, args);
+		if (test_and_set_bit(token, &token_mask))
+			return -EINVAL;
+
+		switch (token) {
+		case Opt_wrap_flags:
+			res = kstrtoul(args[0].from, 16, &wrap_flags);
+			if (res < 0 || wrap_flags > 2)
+				return -EINVAL;
+			(*opt)->wrap_flags = wrap_flags;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static struct trusted_key_options *trusted_options_alloc(void)
+{
+	struct trusted_key_options *options;
+
+	options = kzalloc(sizeof(*options), GFP_KERNEL);
+	return options;
+}
+
+static int trusted_pkwm_seal(struct trusted_key_payload *p, char *datablob)
+{
+	struct trusted_key_options *options = NULL;
+	u8 *input_buf, *output_buf;
+	u32 output_len, input_len;
+	int rc;
+
+	options = trusted_options_alloc();
+	if (!options)
+		return -ENOMEM;
+
+	rc = getoptions(datablob, &options);
+	if (rc < 0)
+		goto out;
+	dump_options(options);
+
+	input_len = p->key_len;
+	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
+	if (!input_buf) {
+		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
+		return -ENOMEM;
+	}
+
+	memcpy(input_buf, p->key, p->key_len);
+
+	rc = plpks_wrap_object(&input_buf, input_len, options->wrap_flags,
+			       &output_buf, &output_len);
+	if (!rc) {
+		memcpy(p->blob, output_buf, output_len);
+		p->blob_len = output_len;
+		dump_payload(p);
+	} else {
+		pr_err("Wrapping of payload key failed: %d\n", rc);
+	}
+
+	kfree(input_buf);
+	kfree(output_buf);
+
+out:
+	kfree_sensitive(options);
+	return rc;
+}
+
+static int trusted_pkwm_unseal(struct trusted_key_payload *p, char *datablob)
+{
+	u8 *input_buf, *output_buf;
+	u32 input_len, output_len;
+	int rc;
+
+	input_len = p->blob_len;
+	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
+	if (!input_buf) {
+		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
+		return -ENOMEM;
+	}
+
+	memcpy(input_buf, p->blob, p->blob_len);
+
+	rc = plpks_unwrap_object(&input_buf, input_len, &output_buf,
+				 &output_len);
+	if (!rc) {
+		memcpy(p->key, output_buf, output_len);
+		p->key_len = output_len;
+		dump_payload(p);
+	} else {
+		pr_err("Unwrapping of payload failed: %d\n", rc);
+	}
+
+	kfree(input_buf);
+	kfree(output_buf);
+
+	return rc;
+}
+
+static int trusted_pkwm_init(void)
+{
+	int ret;
+
+	if (!plpks_wrapping_is_supported()) {
+		pr_err("H_PKS_WRAP_OBJECT interface not supported\n");
+		return -ENODEV;
+	}
+
+	ret = plpks_gen_wrapping_key();
+	if (ret) {
+		pr_err("Failed to generate default wrapping key\n");
+		return -EINVAL;
+	}
+
+	return register_key_type(&key_type_trusted);
+}
+
+static void trusted_pkwm_exit(void)
+{
+	unregister_key_type(&key_type_trusted);
+}
+
+struct trusted_key_ops pkwm_trusted_key_ops = {
+	.migratable = 0, /* non-migratable */
+	.init = trusted_pkwm_init,
+	.seal = trusted_pkwm_seal,
+	.unseal = trusted_pkwm_unseal,
+	.exit = trusted_pkwm_exit,
+};
-- 
2.47.3


