Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4EB2D215C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 04:17:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqljY4NZBzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 14:17:37 +1100 (AEDT)
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
 header.s=pp1 header.b=BdkEHtUJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cqlgb4j9DzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 14:15:55 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B833Ess068331; Mon, 7 Dec 2020 22:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hCfRyZl6uW4NYQCJ6meiECS52LrZ74DguokQW7fqlgo=;
 b=BdkEHtUJ4fyZQUZ3o71tu1M5ybWV8rqbB3jPDL4FHOUd1+iEvzWHDvPFVpzxqpm/M53f
 72ZQWRh6vQ46ORREO2w00zLPn9LbPLGi6HO98Dr9hQ+sahxALQSCXezmDxmZqGvF7IjZ
 m5wmoRmdKDcegjtbDijm4ZpXU0YilepetVshBHUNt/RyxVR8juX9dKOSP9WW/+7EHBUm
 qMk1apUeLrXJ+fNXV3FUSxDRQC4nc8YIFJE9fcu3I0bhX0ic5upcrZXWbIO2NYwz6hlI
 2gOk5USIxSAZ3pDavuTT+O8ILU7x/Y5F2+hvckaqilwcf+7BvHMGHHfHVlJ+we34GLH9 PA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359p7xm8y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 22:15:50 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B83CMA1004407;
 Tue, 8 Dec 2020 03:15:48 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3581u91s12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 03:15:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B83Fl5A29819138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 03:15:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DDB7112063;
 Tue,  8 Dec 2020 03:15:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CAF4112061;
 Tue,  8 Dec 2020 03:15:45 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.77])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 03:15:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s64/kuap: Improve error reporting with KUAP
Date: Tue,  8 Dec 2020 08:45:39 +0530
Message-Id: <20201208031539.84878-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_19:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080018
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

This partially reverts commit eb232b162446 ("powerpc/book3s64/kuap: Improve
error reporting with KUAP") and update the fault handler to print

[   55.022514] Kernel attempted to access user page (7e6725b70000) - exploit attempt? (uid: 0)
[   55.022528] BUG: Unable to handle kernel data access on read at 0x7e6725b70000
[   55.022533] Faulting instruction address: 0xc000000000e8b9bc
[   55.022540] Oops: Kernel access of bad area, sig: 11 [#1]
....

when the kernel access userspace address without unlocking AMR.

bad_kuap_fault() is added as part of commit 5e5be3aed230 ("powerpc/mm: Detect
bad KUAP faults") to catch userspace access incorrectly blocked by AMR. Hence
retain the full stack dump there even with hash translation. Also, add a comment
explaining the difference between hash and radix.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  4 +--
 arch/powerpc/include/asm/book3s/64/kup.h     | 34 ++++++++++----------
 arch/powerpc/include/asm/kup.h               |  4 +--
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 +--
 arch/powerpc/mm/fault.c                      |  4 +--
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index b18cd931e325..32fd4452e960 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned long flags)
 		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	unsigned long begin = regs->kuap & 0xf0000000;
 	unsigned long end = regs->kuap << 28;
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index f2e6dd78d5e2..7075c92c320c 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -353,29 +353,29 @@ static inline void set_kuap(unsigned long value)
 	isync();
 }
 
-#define RADIX_KUAP_BLOCK_READ	UL(0x4000000000000000)
-#define RADIX_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
-
 static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+				  bool is_write)
 {
 	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		return false;
-
-	if (radix_enabled()) {
-		/*
-		 * Will be a storage protection fault.
-		 * Only check the details of AMR[0]
-		 */
-		return WARN((regs->kuap & (is_write ? RADIX_KUAP_BLOCK_WRITE : RADIX_KUAP_BLOCK_READ)),
-			    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
-	}
 	/*
-	 * We don't want to WARN here because userspace can setup
-	 * keys such that a kernel access to user address can cause
-	 * fault
+	 * For radix this will be a storage protection fault (DSISR_PROTFAULT).
+	 * For hash this will be a key fault (DSISR_KEYFAULT)
 	 */
-	return !!(error_code & DSISR_KEYFAULT);
+	/*
+	 * We do have exception table entry, but accessing the
+	 * userspace results in fault.  This could be because we
+	 * didn't unlock the AMR or access is denied by userspace
+	 * using a key value that blocks access. We are only interested
+	 * in catching the use case of accessing without unlocking
+	 * the AMR. Hence check for BLOCK_WRITE/READ against AMR.
+	 */
+	if (is_write) {
+		return WARN(((regs->amr & AMR_KUAP_BLOCK_WRITE) == AMR_KUAP_BLOCK_WRITE),
+			    "Bug: Write fault blocked by AMR!");
+	}
+	return WARN(((regs->amr & AMR_KUAP_BLOCK_READ) == AMR_KUAP_BLOCK_READ),
+		    "Bug: Read fault blocked by AMR!");
 }
 
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index f8ec679bd2de..5a9820c54da9 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -62,8 +62,8 @@ void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return false;
 }
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 7bdd9e5b63ed..567cdc557402 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -60,8 +60,8 @@ static inline void restore_user_access(unsigned long flags)
 	mtspr(SPRN_MD_AP, flags);
 }
 
-static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
-				  bool is_write, unsigned long error_code)
+static inline bool
+bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xff000000),
 		    "Bug: fault blocked by AP register !");
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c91621df0c61..b12595102525 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -210,7 +210,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 		return true;
 	}
 
-	if (!is_exec && address < TASK_SIZE && (error_code & DSISR_PROTFAULT) &&
+	if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
 	    !search_exception_tables(regs->nip)) {
 		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
 				    address,
@@ -227,7 +227,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 
 	// Read/write fault in a valid region (the exception table search passed
 	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write, error_code))
+	if (bad_kuap_fault(regs, address, is_write))
 		return true;
 
 	// What's left? Kernel fault on user in well defined regions (extable
-- 
2.28.0

