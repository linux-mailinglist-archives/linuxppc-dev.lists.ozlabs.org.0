Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE8253CCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:40:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVQr4JCRzDq5t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:40:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ooCBN2+P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTmK6PfbzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R42er5091221; Thu, 27 Aug 2020 00:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zkSzXVV1GYZOC5//8ErthbMugeOoU9c4npfSCIXRUT4=;
 b=ooCBN2+PJIKkXkv5SFjQOVH8OhR409H3Zl6V+sBiqL0mFYMibHMhHbJRlDvqnoEiBKy0
 RAQYva3ah5F434U6IDZU0PWl7wIDiUheD/1e+dBIOqPBWy5eP8V+XSLH22wYehcR/7gM
 U3YwBXws3CibTZYf1iUaHGi4ce4F69fdtx3zfRq9zXO/UAkTC0xGTH8MsL0bQyGLwOkn
 21g3pcT5kGoxE3jnSIj5Qfy/mkKuA3xWZvtbf7astsUq0Q0noXDG3LN9pwK5Vc/cV4O2
 vwwiNMdfzHPURvkfVuXLovAWBKa79Zk8QBuESw9+j3AkxlfFub9ngL6JpfveeYQLon4K /A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3365cy89qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47s20006877;
 Thu, 27 Aug 2020 04:10:35 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 335kvcgrc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:35 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AYGd47710612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E2FC28059;
 Thu, 27 Aug 2020 04:10:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04BC82805E;
 Thu, 27 Aug 2020 04:10:33 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 17/23] powerpc/book3s64/kuap: Improve error reporting with
 KUAP
Date: Thu, 27 Aug 2020 09:39:25 +0530
Message-Id: <20200827040931.297759-18-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=792
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With hash translation use DSISR_KEYFAULT to identify a wrong access.
With Radix we look at the AMR value and type of fault.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  4 +--
 arch/powerpc/include/asm/book3s/64/kup.h     | 27 ++++++++++++++++----
 arch/powerpc/include/asm/kup.h               |  4 +--
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 +--
 arch/powerpc/mm/fault.c                      |  2 +-
 5 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 32fd4452e960..b18cd931e325 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned long flags)
 		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
 }
 
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
+				  bool is_write, unsigned long error_code)
 {
 	unsigned long begin = regs->kuap & 0xf0000000;
 	unsigned long end = regs->kuap << 28;
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 878cd84922d8..9c85e4397b2d 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -330,12 +330,29 @@ static inline void restore_user_access(unsigned long flags)
 	set_kuap(flags);
 }
 
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+#define RADIX_KUAP_BLOCK_READ	UL(0x4000000000000000)
+#define RADIX_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
+
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
+				  bool is_write, unsigned long error_code)
 {
-	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
-		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
-		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
+	if (!mmu_has_feature(MMU_FTR_KUAP))
+		return false;
+
+	if (radix_enabled()) {
+		/*
+		 * Will be a storage protection fault.
+		 * Only check the details of AMR[0]
+		 */
+		return WARN((regs->kuap & (is_write ? RADIX_KUAP_BLOCK_WRITE : RADIX_KUAP_BLOCK_READ)),
+			    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
+	}
+	/*
+	 * We don't want to WARN here because userspace can setup
+	 * keys such that a kernel access to user address can cause
+	 * fault
+	 */
+	return !!(error_code & DSISR_KEYFAULT);
 }
 #endif /* CONFIG_PPC_KUAP */
 
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 6c3ee976ee15..8f5e2d820723 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -67,8 +67,8 @@ static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir) { }
 static inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static inline void restore_user_access(unsigned long flags) { }
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
+				  bool is_write, unsigned long error_code)
 {
 	return false;
 }
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 85ed2390fb99..c401e4e404d4 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -60,8 +60,8 @@ static inline void restore_user_access(unsigned long flags)
 	mtspr(SPRN_MD_AP, flags);
 }
 
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
+				  bool is_write, unsigned long error_code)
 {
 	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xf0000000),
 		    "Bug: fault blocked by AP register !");
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0add963a849b..c91621df0c61 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -227,7 +227,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 
 	// Read/write fault in a valid region (the exception table search passed
 	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write))
+	if (bad_kuap_fault(regs, address, is_write, error_code))
 		return true;
 
 	// What's left? Kernel fault on user in well defined regions (extable
-- 
2.26.2

