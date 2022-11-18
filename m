Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F58662EA36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:27:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCyK54ZBVz3f9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 11:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BsLtAVe9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BsLtAVe9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCyDD6gcdz3dvk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 11:22:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI0Jd0C010738;
	Fri, 18 Nov 2022 00:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=99qPwCvx/uSl7alTGdGVqY/LF9DXXSxotoVg72KOscQ=;
 b=BsLtAVe9hwBn2VkMpbwlOPn8ELOI2NjvdgENCWvC51XSsvtCM4lpOPVsSUV+HW/Zia1i
 W2NuHfl4t0O0pEGM+aUQRGRke1iwaUaRPg2dNmSU6WrsPF/gVhIzzUZt58DwCa/TDtP/
 jO1z7auszZKE9OQikVvXpeCKlME/shp2ccG97rHUMHa+IdayzB6EAAM3tDqZGryegRMb
 v+OVniOWvYQ1UAatawUO5TSkEIiBY4s8ZQMpkqdadpDJsjBAi0zxKmnyL0XZhGC0tWLL
 abwnQOpps+HeTcLaMz9Wc+hpiyRMTdco5+nWc0GyZfEyivKCRcmdkGCDTbAI0uivSc4n 8A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwydfr1rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AI0Kcal025205;
	Fri, 18 Nov 2022 00:22:21 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3kwu4yg7k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AI0MIHw57278868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 00:22:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF6C4A404D;
	Fri, 18 Nov 2022 00:22:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A87EA4051;
	Fri, 18 Nov 2022 00:22:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 00:22:18 +0000 (GMT)
Received: from civic.. (unknown [9.177.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 00924603CD;
	Fri, 18 Nov 2022 11:22:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 3/5] powerpc: mm: Add common pud_pfn stub for all platforms
Date: Fri, 18 Nov 2022 00:21:44 +0000
Message-Id: <20221118002146.25979-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118002146.25979-1-rmclure@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: smsHQtESpOJlCUXKyh8jD1krM6_iFRLt
X-Proofpoint-GUID: smsHQtESpOJlCUXKyh8jD1krM6_iFRLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=830 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211170170
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prior to this commit, pud_pfn was implemented with BUILD_BUG as the inline
function for 64-bit Book3S systems but is never included, as its
invocations in generic code are guarded by calls to pud_devmap which return
zero on such systems. A future patch will provide support for page table
checks, the generic code for which depends on a pud_pfn stub being
implemented, even while the patch will not interact with puds directly.

Remove the 64-bit Book3S stub and define pud_pfn to warn on all
platforms. pud_pfn may be defined properly on a per-platform basis
should it grow real usages in future.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2: Remove conditional BUILD_BUG and BUG. Instead warn on usage.
V3: Replace WARN with WARN_ONCE, which should suffice to demonstrate
misuse of puds.
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
 arch/powerpc/include/asm/pgtable.h           | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 9a6db4ad3228..5fb910ab250d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1394,16 +1394,6 @@ static inline int pgd_devmap(pgd_t pgd)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline int pud_pfn(pud_t pud)
-{
-	/*
-	 * Currently all calls to pud_pfn() are gated around a pud_devmap()
-	 * check so this should never be used. If it grows another user we
-	 * want to know about it.
-	 */
-	BUILD_BUG();
-	return 0;
-}
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
 pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, pte_t *);
 void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 68a3f271aebe..5db9fa157685 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -159,6 +159,20 @@ struct seq_file;
 void arch_report_meminfo(struct seq_file *m);
 #endif /* CONFIG_PPC64 */
 
+/*
+ * Currently only consumed by page_table_check_pud_{set,clear}. Since clears
+ * and sets to page table entries at any level are done through
+ * page_table_check_pte_{set,clear}, provide stub implementation.
+ */
+#ifndef pud_pfn
+#define pud_pfn pud_pfn
+static inline int pud_pfn(pud_t pud)
+{
+	WARN_ONCE(1, "pud: platform does not use pud entries directly");
+	return 0;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.37.2

