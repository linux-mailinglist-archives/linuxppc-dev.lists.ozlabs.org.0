Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40754EA9BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:42:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473WND2n8KzF3dd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 14:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473W8Z6VZhzF3Pb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 14:31:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 473W8Z3wkTz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 14:31:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 473W8Z1Kmkz9sQw; Thu, 31 Oct 2019 14:31:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 473W8Y1W3vz9sPp
 for <linuxppc-dev@ozlabs.org>; Thu, 31 Oct 2019 14:31:57 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9V3S6UW144472
 for <linuxppc-dev@ozlabs.org>; Wed, 30 Oct 2019 23:31:55 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vym56dt7x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 30 Oct 2019 23:31:55 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Thu, 31 Oct 2019 03:31:53 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 31 Oct 2019 03:31:48 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9V3VlHN54067224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 03:31:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CE0AA405B;
 Thu, 31 Oct 2019 03:31:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66198A405F;
 Thu, 31 Oct 2019 03:31:45 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.85.201.217])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Oct 2019 03:31:45 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v10 4/9] powerpc/ima: define trusted boot policy
Date: Wed, 30 Oct 2019 23:31:29 -0400
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1572492694-6520-1-git-send-email-zohar@linux.ibm.com>
References: <1572492694-6520-1-git-send-email-zohar@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19103103-0016-0000-0000-000002BF5594
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19103103-0017-0000-0000-00003320B621
Message-Id: <1572492694-6520-5-git-send-email-zohar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-31_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=910 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910310031
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
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nayna Jain <nayna@linux.ibm.com>

This patch defines an arch-specific trusted boot only policy and a
combined secure and trusted boot policy.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
---
 arch/powerpc/kernel/ima_arch.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index d88913dc0da7..0ef5956c9753 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -31,13 +31,44 @@ static const char *const secure_rules[] = {
 };
 
 /*
+ * The "trusted_rules" are enabled only on "trustedboot" enabled systems.
+ * These rules add the kexec kernel image and kernel modules file hashes to
+ * the IMA measurement list.
+ */
+static const char *const trusted_rules[] = {
+	"measure func=KEXEC_KERNEL_CHECK",
+	"measure func=MODULE_CHECK",
+	NULL
+};
+
+/*
+ * The "secure_and_trusted_rules" contains rules for both the secure boot and
+ * trusted boot. The "template=ima-modsig" option includes the appended
+ * signature, when available, in the IMA measurement list.
+ */
+static const char *const secure_and_trusted_rules[] = {
+	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
+	"measure func=MODULE_CHECK template=ima-modsig",
+	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
+#ifndef CONFIG_MODULE_SIG_FORCE
+	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
+#endif
+	NULL
+};
+
+/*
  * Returns the relevant IMA arch-specific policies based on the system secure
  * boot state.
  */
 const char *const *arch_get_ima_policy(void)
 {
 	if (is_ppc_secureboot_enabled())
-		return secure_rules;
+		if (is_ppc_trustedboot_enabled())
+			return secure_and_trusted_rules;
+		else
+			return secure_rules;
+	else if (is_ppc_trustedboot_enabled())
+		return trusted_rules;
 
 	return NULL;
 }
-- 
2.7.5

