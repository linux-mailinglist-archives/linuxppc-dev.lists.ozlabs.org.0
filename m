Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FCAE2936
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 05:57:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zD2r2xJ4zDqNj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 14:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zCrL21SwzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 14:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46zCrK2NWRz8vDJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 14:48:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46zCrK05JMz9sQm; Thu, 24 Oct 2019 14:48:01 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 46zCrH6LwYz9sPL
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Oct 2019 14:47:59 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9O3l5nP135667
 for <linuxppc-dev@ozlabs.org>; Wed, 23 Oct 2019 23:47:58 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vu42xreut-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 23 Oct 2019 23:47:58 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Thu, 24 Oct 2019 04:47:55 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 24 Oct 2019 04:47:50 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9O3lmYn43712986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 03:47:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E054CAE04D;
 Thu, 24 Oct 2019 03:47:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 203A2AE045;
 Thu, 24 Oct 2019 03:47:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.192.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 03:47:45 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v9 4/8] powerpc/ima: define trusted boot policy
Date: Wed, 23 Oct 2019 22:47:13 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024034717.70552-1-nayna@linux.ibm.com>
References: <20191024034717.70552-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102403-0020-0000-0000-0000037D810B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102403-0021-0000-0000-000021D3C52A
Message-Id: <20191024034717.70552-5-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=899 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240033
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

This patch defines an arch-specific trusted boot only policy and a
combined secure and trusted boot policy.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/kernel/ima_arch.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index d88913dc0da7..0ef5956c9753 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -30,6 +30,32 @@ static const char *const secure_rules[] = {
 	NULL
 };
 
+/*
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
 /*
  * Returns the relevant IMA arch-specific policies based on the system secure
  * boot state.
@@ -37,7 +63,12 @@ static const char *const secure_rules[] = {
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
2.20.1

