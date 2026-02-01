Return-Path: <linuxppc-dev+bounces-16493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPVWKo9cf2m0owIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 15:00:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A13C60D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 15:00:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3rwr2JMdz3cBN;
	Mon, 02 Feb 2026 01:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769954412;
	cv=none; b=YSZxdvDlDU5Byflv9s4hEnOyL3QtZWXrX5JCjLC5diXuLCQE5/MVsc5RYKvcRU2dzlGLURp+/twKNUNXGyLRKfIR2aylGuR1fkVWX3ZRNqdYbws4xvnMjrtNndX/a9vP2xt6RIIebdkn9P65nZeMk2EQ9B3iaRbqKpCV83wiObqQILvI0DSglg1OeucNoqeLQceFZvpMnwi2k5nQ08JxmWOyP1rd94YmHRyIqnc44WrNuK+fekJa09eCNCqRahGL0P0lnXic+ZZfStozEvFtnd10jMAanwVMTahWNUtjrESiEXN78YBlXDYiDAP+SmlOu1s2A3/K4ygdZGsC/Vg7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769954412; c=relaxed/relaxed;
	bh=JPX9D80ShV/Vh62aBWDxM9M6aEzJOTHR1/BpdkwVEEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXGVihkiuuNflaYKpD6gfX7m3IHB/71AIN+wUVxe1sDGxGxE7OzvPFUAW4jPVygukDCWLFoydUcNmFeqMR2TolbNN/Hl97GizsHOeoQc5wldrsvlyVCpIrtyf+PzDYwL4dFWv/Zw6ck/O6wKkgtbzy2p+O/BQlxdxdeBef7cW2Yj0bAjlFuNgHlvHDszAFW8nRxECyLPLQQO7lUxG5Here4lZSz4gdh6F3qhw3KCd9HK+wFmMq83xAM5VPeAKjDAIK65J9ck0T1K/kzqnHEly8xmsUCGIWHiHsL9k7oVQUsMgpvfXH9lL69eRs+/q+v2QH6plZdTxaZffJqYkUjCyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S8uC7eMP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S8uC7eMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3rwq2mvQz3btf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 01:00:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 611804YK008775;
	Sun, 1 Feb 2026 13:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JPX9D80ShV/Vh62aB
	WDxM9M6aEzJOTHR1/BpdkwVEEw=; b=S8uC7eMPegxckvofTXBZpHtxZeN05NUjn
	9YxzvroqJbJMchuCfdkclRbIzo7ehKPY9uvwV5r+Nab7fUDiGl7phalDEz9r70Iq
	bHkKDfNBUT9SlDcqcUejBZ2aioLYs1zjvSvDvg4vS5PvFmgZWQohRByjZvhtScFf
	PXlGFpCzbdlIXJ5+jEL1YtgMVRLd75szIEIN+e7+Y0T97jQ1g8zYvwVDAXAsfR9T
	Ajk6H5J/HUIodeNARhA6Cm9PSmHzKx3s3tmAktAY6rRYx4hy6+b4SgE4Ungm4pBA
	ku1WxrUB14ZqmyEWn1Ym/36a+Zwocey3J8/8B1P8UyxhkJxKxvuow==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c185gkt4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 13:59:58 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 611Dxv06000499;
	Sun, 1 Feb 2026 13:59:57 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c185gkt4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 13:59:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61187s8T025696;
	Sun, 1 Feb 2026 13:59:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c1w2mhkq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 13:59:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 611Dxr8d13697450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 1 Feb 2026 13:59:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F4F520043;
	Sun,  1 Feb 2026 13:59:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E837120040;
	Sun,  1 Feb 2026 13:59:49 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.20.39])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  1 Feb 2026 13:59:49 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v6 5/6] keys/trusted_keys: establish PKWM as a trusted source
Date: Sun,  1 Feb 2026 19:29:29 +0530
Message-ID: <20260201135930.898721-6-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201135930.898721-1-ssrish@linux.ibm.com>
References: <20260201135930.898721-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=UdxciaSN c=1 sm=1 tr=0 ts=697f5c5e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=6hcB66QTelQ3WYe9m3UA:9
X-Proofpoint-GUID: dvlZM0pJONVTpG8C-cyyAEqLVT6K_W1x
X-Proofpoint-ORIG-GUID: t2eacskfmF420wyF_lXk8jsO-JzQi3QC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDEyMCBTYWx0ZWRfX0EwaMa03mfQF
 nR+oDv38Ly/JttSqzJwM2Xs78zgpDvr/9JcqNzuIjRMTK4LiRVAYlveX1CLO3wV2quPR1glSjOX
 xalQ/laBb/fSPc57Ei2bjX7w+iNgVyUqNefjmpIMmJHRZoNQhPP6cZOIOrU/8A3gsc5hHaYruIk
 PbAXOyzEtWwTUfMb9fVwIcN1x+9qowViDyzQWHlcpzDBvp6u9O/SzNxRklScvE1BJEpkfdvFsuH
 n7mAAfvw1YzW1fkO6y0QB2h0hF1XQaCktBLwWJqZOs6mJJ74qSX63XPzLRy49tRPloMd2GQZZKk
 JkUKBpDkwJWHmVr6vE8N8CZYkBAjsGiHJeicDZk6E4QunHYJrsBqZgcEdHxgX1WyLjtpCkVHxCz
 reyekBIH/8qn9R1f6ixSTdDIAGVMeV8T39osJLrEW07ukdMEoItUluDYOxRu2XXy+9nGjv7+QcD
 0Abwt9EnlAgvK8fCdVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_05,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602010120
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16493-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: B7A13C60D7
X-Rspamd-Action: no action

The wrapping key does not exist by default and is generated by the
hypervisor as a part of PKWM initialization. This key is then persisted by
the hypervisor and is used to wrap trusted keys. These are variable length
symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) are
generated using the kernel RNG. PKWM can be used as a trust source through
the following example keyctl commands:

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
-> All the other bits are required to be not set.
-> Set the kernel parameter trusted.source=pkwm to choose PKWM as the
backend for trusted keys implementation.
-> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.

Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
KeyStore, as a new trust source for trusted keys.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Tested-by: Nayna Jain <nayna@linux.ibm.com>
---
 MAINTAINERS                               |   9 +
 include/keys/trusted-type.h               |   7 +-
 include/keys/trusted_pkwm.h               |  33 ++++
 security/keys/trusted-keys/Kconfig        |   8 +
 security/keys/trusted-keys/Makefile       |   2 +
 security/keys/trusted-keys/trusted_core.c |   6 +-
 security/keys/trusted-keys/trusted_pkwm.c | 190 ++++++++++++++++++++++
 7 files changed, 253 insertions(+), 2 deletions(-)
 create mode 100644 include/keys/trusted_pkwm.h
 create mode 100644 security/keys/trusted-keys/trusted_pkwm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0efa8cc6775b..b037648e66fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14013,6 +14013,15 @@ S:	Supported
 F:	include/keys/trusted_dcp.h
 F:	security/keys/trusted-keys/trusted_dcp.c
 
+KEYS-TRUSTED-PLPKS
+M:	Srish Srinivasan <ssrish@linux.ibm.com>
+M:	Nayna Jain <nayna@linux.ibm.com>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_pkwm.h
+F:	security/keys/trusted-keys/trusted_pkwm.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@kernel.org>
 L:	linux-integrity@vger.kernel.org
diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
index 4eb64548a74f..03527162613f 100644
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
+	void *private;
 };
 
 struct trusted_key_ops {
diff --git a/include/keys/trusted_pkwm.h b/include/keys/trusted_pkwm.h
new file mode 100644
index 000000000000..4035b9776394
--- /dev/null
+++ b/include/keys/trusted_pkwm.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PKWM_TRUSTED_KEY_H
+#define __PKWM_TRUSTED_KEY_H
+
+#include <keys/trusted-type.h>
+#include <linux/bitops.h>
+#include <linux/printk.h>
+
+extern struct trusted_key_ops pkwm_trusted_key_ops;
+
+struct trusted_pkwm_options {
+	u16 wrap_flags;
+};
+
+static inline void dump_options(struct trusted_key_options *o)
+{
+	const struct trusted_pkwm_options *pkwm;
+	bool sb_audit_or_enforce_bit;
+	bool sb_enforce_bit;
+
+	pkwm = o->private;
+	sb_audit_or_enforce_bit = pkwm->wrap_flags & BIT(0);
+	sb_enforce_bit = pkwm->wrap_flags & BIT(1);
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
index 000000000000..4f391b77a907
--- /dev/null
+++ b/security/keys/trusted-keys/trusted_pkwm.c
@@ -0,0 +1,190 @@
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
+static int getoptions(char *datablob, struct trusted_key_options *opt)
+{
+	substring_t args[MAX_OPT_ARGS];
+	char *p = datablob;
+	int token;
+	int res;
+	u16 wrap_flags;
+	unsigned long token_mask = 0;
+	struct trusted_pkwm_options *pkwm;
+
+	if (!datablob)
+		return 0;
+
+	pkwm = opt->private;
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
+			res = kstrtou16(args[0].from, 16, &wrap_flags);
+			if (res < 0 || wrap_flags > 2)
+				return -EINVAL;
+			pkwm->wrap_flags = wrap_flags;
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
+	struct trusted_pkwm_options *pkwm;
+
+	options = kzalloc(sizeof(*options), GFP_KERNEL);
+
+	if (options) {
+		pkwm = kzalloc(sizeof(*pkwm), GFP_KERNEL);
+
+		if (!pkwm) {
+			kfree_sensitive(options);
+			options = NULL;
+		} else {
+			options->private = pkwm;
+		}
+	}
+
+	return options;
+}
+
+static int trusted_pkwm_seal(struct trusted_key_payload *p, char *datablob)
+{
+	struct trusted_key_options *options = NULL;
+	struct trusted_pkwm_options *pkwm = NULL;
+	u8 *input_buf, *output_buf;
+	u32 output_len, input_len;
+	int rc;
+
+	options = trusted_options_alloc();
+
+	if (!options)
+		return -ENOMEM;
+
+	rc = getoptions(datablob, options);
+	if (rc < 0)
+		goto out;
+	dump_options(options);
+
+	input_len = p->key_len;
+	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
+	if (!input_buf) {
+		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	memcpy(input_buf, p->key, p->key_len);
+
+	pkwm = options->private;
+
+	rc = plpks_wrap_object(&input_buf, input_len, pkwm->wrap_flags,
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
+	kfree_sensitive(options->private);
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


