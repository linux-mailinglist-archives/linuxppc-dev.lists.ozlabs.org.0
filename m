Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B03DDA0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 20:23:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wWVD6RBJzDqVL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 05:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wW7h1VFWzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 05:06:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wW7g2MLlz8tQJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 05:06:55 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wW7f5BPNz9sPL; Sun, 20 Oct 2019 05:06:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46wW7d1H1xz9sPx
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 05:06:52 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9JI6fGh146488
 for <linuxppc-dev@ozlabs.org>; Sat, 19 Oct 2019 14:06:50 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqy0mb91j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 19 Oct 2019 14:06:50 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Sat, 19 Oct 2019 19:06:48 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 19 Oct 2019 19:06:44 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9JI6g5w32571810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 18:06:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE3635204F;
 Sat, 19 Oct 2019 18:06:42 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.146.216])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EB7F752050;
 Sat, 19 Oct 2019 18:06:39 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v8 4/8] powerpc/ima: add measurement rules to ima arch
 specific policy
Date: Sat, 19 Oct 2019 14:06:13 -0400
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571508377-23603-1-git-send-email-nayna@linux.ibm.com>
References: <1571508377-23603-1-git-send-email-nayna@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19101918-0008-0000-0000-0000032401CB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101918-0009-0000-0000-00004A4325F1
Message-Id: <1571508377-23603-5-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190171
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
Cc: Prakhar Srivastava <prsriva02@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds the measurement rules to the arch specific policies on
trusted boot enabled systems.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/kernel/ima_arch.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index 65d82ee74ea4..710872ea8f35 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -26,6 +26,32 @@ static const char *const secure_rules[] = {
 	NULL
 };
 
+/*
+ * The "measure_rules" are enabled only on "trustedboot" enabled systems.
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
 /*
  * Returns the relevant IMA arch-specific policies based on the system secure
  * boot state.
@@ -33,7 +59,13 @@ static const char *const secure_rules[] = {
 const char *const *arch_get_ima_policy(void)
 {
 	if (is_ppc_secureboot_enabled())
-		return secure_rules;
+		if (is_ppc_trustedboot_enabled())
+			return secure_and_trusted_rules;
+		else
+			return secure_rules;
+	else
+		if (is_ppc_trustedboot_enabled())
+			return trusted_rules;
 
 	return NULL;
 }
-- 
2.20.1

