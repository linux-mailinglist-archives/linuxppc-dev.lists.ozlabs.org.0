Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95E6C426C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHkz66RTz3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:55:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gPYnD9ew;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gPYnD9ew;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXq3SDDz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:51 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M3041h026724
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3pdvcWVckO5ruvmU5KxPXMip56i1Kp3wswn+AxshQ9A=;
 b=gPYnD9ewfVcyYEKtdCKGY8OTwR55sW6lm0f3I1mjUUe9ZNgbiLK7ylzIBMQZkDQP/tGe
 WGO6wDx/YtTPZ+a5ccN2XwwtbzBUNfIKcHG2Qbtmd3x+xekJKc6m/H6QITnPYCPxV2ge
 xBMyqEDewh7vkycXV5w7AWfHTb1vkqAIXullCr7q0snt9om9HKWMtdzQ8Nx0LGmtWt6w
 A2yAZj57tMGVvQRhJvWRsbiCU1QglkKACRasLB03z1aiBkUz2kbXu0wkZrLRJIgaEavU
 LC1/bX3zsN7v3+itmKTGLVC8u6yXNHkwz7YPqsNh+9SlTjRA6s++S/X2L5n8nm0Zga3q fA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfscstp8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:49 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M16Tm9006837
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pd4x64k8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kcBF43319778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2164120065
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95F8720043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 887AF6067F;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/9] powerpc/dexcr: Support custom default DEXCR value
Date: Wed, 22 Mar 2023 16:46:08 +1100
Message-Id: <20230322054612.1340573-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322054612.1340573-1-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XhoouVkMkvnnfoFj44RZZ453CbODZ90U
X-Proofpoint-GUID: XhoouVkMkvnnfoFj44RZZ453CbODZ90U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxlogscore=873 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220039
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make the DEXCR value configurable at config time. Intentionally don't
limit possible values to support future aspects without needing kernel
updates.

The default config value enables hashst/hashchk in problem state.
This should be safe, as generally software needs to request these
instructions be included in the first place.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---
New in v1

Preface with: I'm note sure on the best place to put the config.

I also don't think there's any need to zero out unknown/unsupported
bits. Reserved implies they are ignored by the hardware (from my
understanding of the ISA). Current P10s boot with all bits set; lsdexcr
(later patch) reports

   uDEXCR: ff000000 (SBHE, IBRTPD, SRAPD, NPHIE, PHIE, unknown)

when you try to read it back. Leaving them be also makes it easier to
support newer aspects without a kernel update.

If arbitrary value support isn't important, it's probably a nicer
interface to make each aspect an entry in a menu.

Future work may include dynamic DEXCR controls via prctl() and sysfs.
The dynamic controls would be able to override this default DEXCR on a
per-process basis. A stronger "PPC_ENFORCE_USER_ROP_PROCTETION" config
may be required at such a time to prevent dynamically disabling the
hash checks.
---
 arch/powerpc/Kconfig                  | 14 ++++++++++++++
 arch/powerpc/kernel/cpu_setup_power.c |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a6c4407d3ec8..18ffb18fa70f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1036,6 +1036,20 @@ config PPC_MEM_KEYS
 
 	  If unsure, say y.
 
+config PPC_DEXCR_DEFAULT
+	hex "Default DEXCR value"
+	default 0x0000000004000000
+	depends on PPC_BOOK3S_64
+	help
+	  Power10 introduces the Dynamic Execution Control Register (DEXCR)
+	  to provide fine grained control over various speculation and
+	  security capabilities. This is used as the default DEXCR value.
+
+	  It is a 64 bit value that splits into 32 bits for supervisor mode
+	  and 32 bits for problem state. The default config value enables
+	  the hashst/hashck instructions in userspace. See the ISA for
+	  specifics of what each bit controls.
+
 config PPC_SECURE_BOOT
 	prompt "Enable secure boot support"
 	bool
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index c00721801a1b..814c825a0661 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -10,6 +10,7 @@
 #include <asm/reg.h>
 #include <asm/synch.h>
 #include <linux/bitops.h>
+#include <linux/kconfig.h>
 #include <asm/cputable.h>
 #include <asm/cpu_setup.h>
 
@@ -128,7 +129,7 @@ static void init_PMU_ISA31(void)
 
 static void init_DEXCR(void)
 {
-	mtspr(SPRN_DEXCR, 0);
+	mtspr(SPRN_DEXCR, CONFIG_PPC_DEXCR_DEFAULT);
 	mtspr(SPRN_HASHKEYR, 0);
 }
 
-- 
2.39.2

