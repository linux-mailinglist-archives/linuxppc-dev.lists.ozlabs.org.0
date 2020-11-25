Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90A2C38D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:47:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgqg03BWyzDqrZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:47:56 +1100 (AEDT)
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
 header.s=pp1 header.b=s3YN88iG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgq016fmtzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52Vkv069145; Wed, 25 Nov 2020 00:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=N3x6xLcwbjr+NaEPY3l34OwHCzREcLi8Gc+CbMG4CJo=;
 b=s3YN88iGqb5Pi0TnzNiy9NU3/a4PWjo4yQAvKTInvk37iSp5/r4YG6IJle7rxAj40TI5
 dIkSe2HAnL6flyDEV0dZA/VJajG7t3UlY9IH9k/nDomzPudrk/QJ96GcsgMCXSEJ4TKO
 dUcGI02UQ+n4u3tWuuQI10QwQEOmrCYTLyxWWlDe5R0jiQRZL8vFHXPMnxScrqPbCiIW
 ZNHTC5jmKq+H2owunPKCmE6PW0dUEzHjpBMoSmtXMPViEsR7Ozlr2a7REKGoixrGIG6L
 LHHp/BRsr3QarlQz1CWqmWmiY2JVs8/n0v1p3UHCukapuh8dS0PRLFh747k+6mLzkfiG 0w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351dgsvtsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:34 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5DA67007349;
 Wed, 25 Nov 2020 05:17:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 35133nw7du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:32 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HWvm57606622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:32 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56AB8124058;
 Wed, 25 Nov 2020 05:17:32 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B405B124052;
 Wed, 25 Nov 2020 05:17:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:30 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 16/22] powerpc/book3s64/kuap: Improve error reporting with
 KUAP
Date: Wed, 25 Nov 2020 10:46:28 +0530
Message-Id: <20201125051634.509286-17-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=844 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240121
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
index 4a3d0d601745..2922c442a218 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -301,12 +301,29 @@ static inline void set_kuap(unsigned long value)
 	isync();
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
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index a06e50b68d40..952be0414f43 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -59,8 +59,8 @@ void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
 
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
+				  bool is_write, unsigned long error_code)
 {
 	return false;
 }
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 567cdc557402..7bdd9e5b63ed 100644
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
 	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xff000000),
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
2.28.0

