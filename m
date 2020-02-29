Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0E174594
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 08:56:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TzHP32rXzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 18:56:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TzFs1TQGzDrCC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 18:54:37 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01T7pAqB124347
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 02:54:35 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepxp83k5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 02:54:34 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 29 Feb 2020 07:54:33 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Feb 2020 07:54:30 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01T7rVak47120764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 07:53:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4389AE045;
 Sat, 29 Feb 2020 07:54:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AE7EAE055;
 Sat, 29 Feb 2020 07:54:26 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.192.224])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 29 Feb 2020 07:54:25 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Subject: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
Date: Fri, 28 Feb 2020 23:54:04 -0800
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 20022907-0020-0000-0000-000003AEAF4F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022907-0021-0000-0000-00002206D51E
Message-Id: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_01:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=18 lowpriorityscore=0
 bulkscore=0 mlxlogscore=763 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002290057
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, linuxram@us.ibm.com, groug@kaod.org,
 clg@fr.ibm.com, sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.

Hence Secure VM, must always default to XICS interrupt controller.

If XIVE is requested through kernel command line option "xive=on",
override and turn it off.

If XIVE is the only supported platform interrupt controller; specified
through qemu option "ic-mode=xive", simply abort. Otherwise default to
XICS.

Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Michael Anderson <andmike@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Greg Kurz <groug@kaod.org>
Cc: Cedric Le Goater <clg@fr.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/kernel/prom_init.c | 43 ++++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 5773453..dd96c82 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -805,6 +805,18 @@ static void __init early_cmdline_parse(void)
 #endif
 	}
 
+#ifdef CONFIG_PPC_SVM
+	opt = prom_strstr(prom_cmd_line, "svm=");
+	if (opt) {
+		bool val;
+
+		opt += sizeof("svm=") - 1;
+		if (!prom_strtobool(opt, &val))
+			prom_svm_enable = val;
+		prom_printf("svm =%d\n", prom_svm_enable);
+	}
+#endif /* CONFIG_PPC_SVM */
+
 #ifdef CONFIG_PPC_PSERIES
 	prom_radix_disable = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
 	opt = prom_strstr(prom_cmd_line, "disable_radix");
@@ -823,23 +835,22 @@ static void __init early_cmdline_parse(void)
 	if (prom_radix_disable)
 		prom_debug("Radix disabled from cmdline\n");
 
-	opt = prom_strstr(prom_cmd_line, "xive=off");
-	if (opt) {
+#ifdef CONFIG_PPC_SVM
+	if (prom_svm_enable) {
 		prom_xive_disable = true;
-		prom_debug("XIVE disabled from cmdline\n");
+		prom_debug("XIVE disabled in Secure VM\n");
 	}
-#endif /* CONFIG_PPC_PSERIES */
-
-#ifdef CONFIG_PPC_SVM
-	opt = prom_strstr(prom_cmd_line, "svm=");
-	if (opt) {
-		bool val;
+#endif /* CONFIG_PPC_SVM */
 
-		opt += sizeof("svm=") - 1;
-		if (!prom_strtobool(opt, &val))
-			prom_svm_enable = val;
+	if (!prom_xive_disable) {
+		opt = prom_strstr(prom_cmd_line, "xive=off");
+		if (opt) {
+			prom_xive_disable = true;
+			prom_debug("XIVE disabled from cmdline\n");
+		}
 	}
-#endif /* CONFIG_PPC_SVM */
+
+#endif /* CONFIG_PPC_PSERIES */
 }
 
 #ifdef CONFIG_PPC_PSERIES
@@ -1251,6 +1262,12 @@ static void __init prom_parse_xive_model(u8 val,
 		break;
 	case OV5_FEAT(OV5_XIVE_EXPLOIT): /* Only Exploitation mode */
 		prom_debug("XIVE - exploitation mode supported\n");
+
+#ifdef CONFIG_PPC_SVM
+		if (prom_svm_enable)
+			prom_panic("WARNING: xive unsupported in Secure VM\n");
+#endif /* CONFIG_PPC_SVM */
+
 		if (prom_xive_disable) {
 			/*
 			 * If we __have__ to do XIVE, we're better off ignoring
-- 
1.8.3.1

