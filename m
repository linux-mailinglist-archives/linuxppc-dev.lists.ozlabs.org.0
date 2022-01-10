Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C414895FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 11:08:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXV0N1RMVz2yMC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 21:08:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uz+N99PX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Uz+N99PX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXTzb4ly1z2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 21:08:11 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20A88WZH000542; 
 Mon, 10 Jan 2022 10:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nFvr2dV+OqCZAoMlMrn+XMtwH6JsPOzoQzLmIDjrq5w=;
 b=Uz+N99PXoomJe4v2bmz6kokDr/S7ITrgWL1v38vS5wKhOAWDxZR/fHXkD3H7YGDFOf2H
 ClKbYAiF8b7FKji1ZxttgBqDBsyzt6/RgahBEMEmP9sdqBLtY3N4j7Tv13SR1LAexmIS
 JM64l89w3WyuQoFDuxSYE08vJuO0izPBrA74VmeMShTQ+PB9gD7xk+r5QphCtd2X5fDQ
 H21vd6sLTzDp40NeS3NTH04Nnx8VZnLetySHGmEn/imU3Zw2EJq2GIKOTIJ6KIvfhlfi
 PSPMk28ZYlxgR6OZKMSpD/GL3FzpN0FIyElxuWPq6yCrWTlkTZKWe7BUqxJuCv/NHpy5 Mg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfmjdx8h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:08:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20A9w5H6028243;
 Mon, 10 Jan 2022 10:08:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3df288th4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:08:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20A9x0er47579512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 09:59:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0276E42042;
 Mon, 10 Jan 2022 10:07:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB87642056;
 Mon, 10 Jan 2022 10:07:57 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.113.57])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 10:07:57 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/security: Provide stubs for when PPC_BARRIER_NOSPEC
 isn't enabled
Date: Mon, 10 Jan 2022 15:37:45 +0530
Message-Id: <20220110100745.711970-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ei8r6PHAjekeU_k8VkdSQHczwO1Hp8CQ
X-Proofpoint-ORIG-GUID: ei8r6PHAjekeU_k8VkdSQHczwO1Hp8CQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_04,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201100071
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
Cc: linuxppc-dev@lists.ozlabs.org, lkp@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot reported the below build error with a randconfig:
  powerpc64-linux-ld: arch/powerpc/net/bpf_jit_comp64.o:(.toc+0x0):
  undefined reference to `powerpc_security_features'

This can happen if CONFIG_PPC_BARRIER_NOSPEC is not enabled. Address
this by providing stub functions for security_ftr_enabled() and related
helpers when the config option is not enabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/security_features.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
index 27574f218b371f..f2b990052641a0 100644
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -8,10 +8,6 @@
 #ifndef _ASM_POWERPC_SECURITY_FEATURES_H
 #define _ASM_POWERPC_SECURITY_FEATURES_H
 
-
-extern u64 powerpc_security_features;
-extern bool rfi_flush;
-
 /* These are bit flags */
 enum stf_barrier_type {
 	STF_BARRIER_NONE	= 0x1,
@@ -20,6 +16,10 @@ enum stf_barrier_type {
 	STF_BARRIER_SYNC_ORI	= 0x8,
 };
 
+#ifdef CONFIG_PPC_BARRIER_NOSPEC
+extern u64 powerpc_security_features;
+extern bool rfi_flush;
+
 void setup_stf_barrier(void);
 void do_stf_barrier_fixups(enum stf_barrier_type types);
 void setup_count_cache_flush(void);
@@ -45,6 +45,13 @@ enum stf_barrier_type stf_barrier_type_get(void);
 static inline enum stf_barrier_type stf_barrier_type_get(void) { return STF_BARRIER_NONE; }
 #endif
 
+#else /* CONFIG_PPC_BARRIER_NOSPEC */
+static inline void security_ftr_set(u64 feature) { }
+static inline void security_ftr_clear(u64 feature) { }
+static inline bool security_ftr_enabled(u64 feature) { return false; }
+static inline enum stf_barrier_type stf_barrier_type_get(void) { return STF_BARRIER_NONE; }
+#endif /* CONFIG_PPC_BARRIER_NOSPEC */
+
 // Features indicating support for Spectre/Meltdown mitigations
 
 // The L1-D cache can be flushed with ori r30,r30,0

base-commit: bdcf18e133f656b2c97390a594fc95e37849e682
-- 
2.34.1

