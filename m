Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C167BD2EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:57:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tUs7l4Bl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pGg2WMdz3vd2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:57:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tUs7l4Bl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBw5cZrz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:32 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995ifaH001251;
	Mon, 9 Oct 2023 05:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P4bKbUjz+FMHZd4LURo+jCDaLFGOEKNqXp3lTajBeZs=;
 b=tUs7l4BlyDD9X5vTMbSuniTk83Koki4ZBt92oV1IRdNVm33RFz7/nmW6Nf5FGz87+AYb
 gm3O5TLoxo+EZO/rSltnRHfCnm22NiG0zRFF5bF3uepYH5yqQWL4KKd1q0OOy450HdoR
 s4aTNJiXnG075bYeHXY2TXaV9YHMwZL66FcnOI2NgU5JERkeY8Q2bwTrirItwEaIQZs2
 eAFGePavYXZjieLrWaOS9TZHvGWPRxYThswmT6HQmZBZJTJ1hsyFgyrgJJ/piZWImWWI
 cph0qaIkoJ10NtyGUq3GIlypGkvevNB7XUow7lwsVMGdA4uoQw/6QBRYwwT5QM2a4LMo Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbn0r60v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:25 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995j9V9004035;
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbn0r60p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39950nJw023032;
	Mon, 9 Oct 2023 05:54:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc16dca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sNou42008836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BA8B2004E;
	Mon,  9 Oct 2023 05:54:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DE3720043;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A978A6047D;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/6] powerpc/dexcr: Make all aspects CPU features
Date: Mon,  9 Oct 2023 16:54:01 +1100
Message-ID: <20231009055406.142940-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009055406.142940-1-bgray@linux.ibm.com>
References: <20231009055406.142940-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SNFupuKkxLrM2wcA4oGtxL_4Ot2SLxo9
X-Proofpoint-ORIG-GUID: fD-TMAQLm25r6oVS6TUfIIKEq7xO6v6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=808 adultscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090051
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The CPU_FEATURE_* mechanism is the only way right now to get
configuration from the "ibm,pa-features" devicetree node. Add a
CPU_FEATURE_* entry for each other DEXCR aspect that will be
exposed to userspace.

The NPHIE feature value is changed for consistency; the actual value is
never accessed or exposed to userspace, so there is no breakage.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h | 6 +++++-
 arch/powerpc/kernel/prom.c          | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 8765d5158324..bd087d0cb5fa 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -192,7 +192,10 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
 #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
-#define CPU_FTR_DEXCR_NPHIE		LONG_ASM_CONST(0x0010000000000000)
+#define CPU_FTR_DEXCR_SBHE		LONG_ASM_CONST(0x0010000000000000)
+#define CPU_FTR_DEXCR_IBRTPD		LONG_ASM_CONST(0x0020000000000000)
+#define CPU_FTR_DEXCR_SRAPD		LONG_ASM_CONST(0x0040000000000000)
+#define CPU_FTR_DEXCR_NPHIE		LONG_ASM_CONST(0x0080000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -453,6 +456,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
 	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
+	    CPU_FTR_DEXCR_SBHE | CPU_FTR_DEXCR_IBRTPD | CPU_FTR_DEXCR_SRAPD | \
 	    CPU_FTR_DEXCR_NPHIE)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..ea081a5d2023 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -182,6 +182,9 @@ static struct ibm_feature ibm_pa_features[] __initdata = {
 	  .cpu_user_ftrs2 = PPC_FEATURE2_HTM_COMP | PPC_FEATURE2_HTM_NOSC_COMP },
 
 	{ .pabyte = 64, .pabit = 0, .cpu_features = CPU_FTR_DAWR1 },
+	{ .pabyte = 68, .pabit = 0, .cpu_features = CPU_FTR_DEXCR_SBHE },
+	{ .pabyte = 68, .pabit = 3, .cpu_features = CPU_FTR_DEXCR_IBRTPD },
+	{ .pabyte = 68, .pabit = 4, .cpu_features = CPU_FTR_DEXCR_SRAPD },
 	{ .pabyte = 68, .pabit = 5, .cpu_features = CPU_FTR_DEXCR_NPHIE },
 };
 
-- 
2.41.0

