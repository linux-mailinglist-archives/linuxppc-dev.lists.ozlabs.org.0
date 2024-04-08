Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BFF89B723
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:25:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r8XnDt4M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCcx52hq4z3vYw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r8XnDt4M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCcwL3zTMz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:24:34 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4384t3KX002006;
	Mon, 8 Apr 2024 05:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kqIjjwKN6krYNAxA/eD2juriN7ggeStERDPmnEbVGYE=;
 b=r8XnDt4M/i0yUxU9+w/PVelPMvcBsk7UeFDi73kIElJZKa8YiWA0mUaOB4PTWtzWdOvG
 Dt7CKs1irkGuFsNoxTpiPfgMXG7cLh6tYQ7l4k6CKedoyAMzYZXl0Bdue6AAOYrp2Tr4
 QJr+3FMIfkP3uJWAKOlh6OaIwp1meI+UaqbEnUDFqpF65O/VCXpqT8nz9PSUexRJm+Yq
 ToyAHp/PJjA6aQkSaqxYboP1Ofwe0s9QH7Sz2HoiSxFhY/dTKbDNXWwQMlEUoP8GG6ar
 cLOFzOQLGYMbWK+jLP9DZWveBUeba3SCEoiiDQWhqSMLremycqrG4SYcYmHGJeyRDx1j Qw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xc7ca882s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 05:24:27 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4383b2tu013760;
	Mon, 8 Apr 2024 05:24:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbgqt6g69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 05:24:26 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4385OMkP45482450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Apr 2024 05:24:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A141C20043;
	Mon,  8 Apr 2024 05:24:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C382820040;
	Mon,  8 Apr 2024 05:24:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Apr 2024 05:24:21 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C7B206010C;
	Mon,  8 Apr 2024 15:24:16 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] Add static_key_feature_checks_initialized flag
Date: Mon,  8 Apr 2024 05:23:58 +0000
Message-Id: <20240408052358.5030-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V0KGTCxUApbzJjAST7bXLSwAo4kv03vX
X-Proofpoint-ORIG-GUID: V0KGTCxUApbzJjAST7bXLSwAo4kv03vX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_03,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404080040
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

JUMP_LABEL_FEATURE_CHECK_DEBUG used static_key_intialized to determine
whether {cpu,mmu}_has_feature() is used before static keys were
initialized. However, {cpu,mmu}_has_feature() should not be used before
setup_feature_keys() is called but static_key_initialized is set well
before this by the call to jump_label_init() in early_init_devtree().
This creates a window in which JUMP_LABEL_FEATURE_CHECK_DEBUG will not
detect misuse and report errors. Add a flag specifically to indicate
when {cpu,mmu}_has_feature() is safe to use.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
v2: Reword commit message

v1: https://lore.kernel.org/linuxppc-dev/20240327045911.64543-1-nicholas@linux.ibm.com/
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

