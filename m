Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2115188D5AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 06:05:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JblpmIH7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4F456Qhzz3vZB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:05:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JblpmIH7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4F3K1Qlsz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 16:05:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42R3oDRf003154;
	Wed, 27 Mar 2024 05:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Xy749pr4ANI8S1kI2hjv5J/U5FI734Yj9pdk9vDyhVs=;
 b=JblpmIH7yMtqeRe/82rGz5b+IGXpOIW2Pah0tzLgMeaEmySl6SamaEg/7ZsdyLluuGE7
 drIpgY0w9RyNfXY1rm/DnrWuKYsi0d7IYr00w6oZ7ScvvLfHkLqAgj7xKaM/LW+zXBf+
 QhgpaFo9zS23UE7X6a3w7hKJ0D1W9rewbN61NDg0nwDsNVgZDSW2k8T/wkAglFXC2DeG
 bQZ7PyIqBwZN1IFLt+x+R2Lpaxm05YptF6irHYl+cMihcZDIsAZN6pX5i4OkmLb4X39q
 b9HIgygkIxudUbo7nRZ/jHJEr3eWNtKS/VUjWefQ7lfgVe9FGNk/67XdnnIm2j8n/b0m vg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x49xwr986-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 05:04:53 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42R20C6C011243;
	Wed, 27 Mar 2024 04:59:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2bmm449c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 04:59:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42R4xmGE52625894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Mar 2024 04:59:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF8812004B;
	Wed, 27 Mar 2024 04:59:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19D0920065;
	Wed, 27 Mar 2024 04:59:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Mar 2024 04:59:48 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE12060125;
	Wed, 27 Mar 2024 15:59:45 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] Add static_key_feature_checks_initialized flag
Date: Wed, 27 Mar 2024 04:59:11 +0000
Message-Id: <20240327045911.64543-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JQFq7nq6rIknJKo0KB1tJV0-0W7eKvXV
X-Proofpoint-GUID: JQFq7nq6rIknJKo0KB1tJV0-0W7eKvXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403270031
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

JUMP_LABEL_FEATURE_CHECK_DEBUG used static_key_initialized to determine
whether {cpu,mmu}_has_feature() was used before static keys were
initialized. However, {cpu,mmu}_has_feature() should not be used before
setup_feature_keys() is called. As static_key_initalized is set much
earlier during boot there is a window in which JUMP_LABEL_FEATURE_CHECK_DEBUG
will not report errors. Add a flag specifically to indicate when
{cpu,mmu}_has_feature() is safe to use.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/include/asm/cpu_has_feature.h | 2 +-
 arch/powerpc/include/asm/feature-fixups.h  | 2 ++
 arch/powerpc/include/asm/mmu.h             | 2 +-
 arch/powerpc/lib/feature-fixups.c          | 8 ++++++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cpu_has_feature.h b/arch/powerpc/include/asm/cpu_has_feature.h
index 727d4b321937..0efabccd820c 100644
--- a/arch/powerpc/include/asm/cpu_has_feature.h
+++ b/arch/powerpc/include/asm/cpu_has_feature.h
@@ -29,7 +29,7 @@ static __always_inline bool cpu_has_feature(unsigned long feature)
 #endif
 
 #ifdef CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
-	if (!static_key_initialized) {
+	if (!static_key_feature_checks_initialized) {
 		printk("Warning! cpu_has_feature() used prior to jump label init!\n");
 		dump_stack();
 		return early_cpu_has_feature(feature);
diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
index 77824bd289a3..17d168dd8b49 100644
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -291,6 +291,8 @@ extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
 extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
 extern long __start__btb_flush_fixup, __stop__btb_flush_fixup;
 
+extern bool static_key_feature_checks_initialized;
+
 void apply_feature_fixups(void);
 void update_mmu_feature_fixups(unsigned long mask);
 void setup_feature_keys(void);
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 3b72c7ed24cf..24f830cf9bb4 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -251,7 +251,7 @@ static __always_inline bool mmu_has_feature(unsigned long feature)
 #endif
 
 #ifdef CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
-	if (!static_key_initialized) {
+	if (!static_key_feature_checks_initialized) {
 		printk("Warning! mmu_has_feature() used prior to jump label init!\n");
 		dump_stack();
 		return early_mmu_has_feature(feature);
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 4f82581ca203..b7201ba50b2e 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -25,6 +25,13 @@
 #include <asm/firmware.h>
 #include <asm/inst.h>
 
+/*
+ * Used to generate warnings if mmu or cpu feature check functions that
+ * use static keys before they are initialized.
+ */
+bool static_key_feature_checks_initialized __read_mostly;
+EXPORT_SYMBOL_GPL(static_key_feature_checks_initialized);
+
 struct fixup_entry {
 	unsigned long	mask;
 	unsigned long	value;
@@ -679,6 +686,7 @@ void __init setup_feature_keys(void)
 	jump_label_init();
 	cpu_feature_keys_init();
 	mmu_feature_keys_init();
+	static_key_feature_checks_initialized = true;
 }
 
 static int __init check_features(void)
-- 
2.40.1

