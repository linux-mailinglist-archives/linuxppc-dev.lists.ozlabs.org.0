Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F29431269
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXr8Y07Nkz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:46:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SclmIZLz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXr6D4qlPz2yQ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:44:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SclmIZLz; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HXr6723Fyz4xdB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:44:47 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HXr6721DYz4xd9; Mon, 18 Oct 2021 19:44:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SclmIZLz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HXr666CDDz4xbb;
 Mon, 18 Oct 2021 19:44:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I7pI3M028572; 
 Mon, 18 Oct 2021 04:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DsySnbhbJjdecykZ87cAKVg25yIoSWTsmeF5yUHMUpQ=;
 b=SclmIZLzg/Va8SP1TfMx2BlGaBZv9H5G0JOmbDu969osbY42LeVtTZFjBRBVfPkwldux
 0dWu7+RnflPZlhy/jmu0mqx8x7T7dt8IYVjgcrmpJ6wh0ov1U8dtRY+JtV7yfpwE98Jy
 xXMbW7ZOodcIlBBnvXNYX0qb0zR8DLjf8vMpecvGST5/xP2TXnx7comoUCtkN20PsWPZ
 0i8BwKN+pw/5GqX5c/AVeXAGBLMVlBUGwb2Y+bPDnUISb9s26brIk3qEBDMTbKb3cZuL
 nscPXCOIi6Lis0IujAUHRXaNHO1D9QGCKtUQi+qq4NKDpwqWT1COR1R26CgruAs8w9wz Pw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs4wc12ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 04:44:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I8bmQP000429;
 Mon, 18 Oct 2021 08:44:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpc9c2d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 08:44:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19I8cocp64815458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 08:38:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B20B911C05E;
 Mon, 18 Oct 2021 08:44:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D064C11C054;
 Mon, 18 Oct 2021 08:44:37 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.54.237])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 08:44:37 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [RESEND PATCH v2 1/3] fixup mmu_features immediately after getting
 cpu pa features.
Date: Mon, 18 Oct 2021 14:14:32 +0530
Message-Id: <20211018084434.217772-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018084434.217772-1-sourabhjain@linux.ibm.com>
References: <20211018084434.217772-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wTeEQlFTshyDw0ZMdwob70K3klsY36Kb
X-Proofpoint-GUID: wTeEQlFTshyDw0ZMdwob70K3klsY36Kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxlogscore=776 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180052
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, mahesh@linux.vnet.ibm.com,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>, aneesh.kumar@linux.ibm.com,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mahesh Salgaonkar <mahesh@linux.ibm.com>

On system with radix support available, early_radix_enabled() starts
returning true for a small window (until mmu_early_init_devtree() is
called) even when radix mode disabled on kernel command line. This causes
ppc64_bolted_size() to return ULONG_MAX in HPT mode instead of supported
segment size, during boot cpu paca allocation.

Withi kernel command line = "... disable_radix":

early_init_devtree:			  <- early_radix_enabled() = false
  early_init_dt_scan_cpus:		  <- early_radix_enabled() = false
      ...
      check_cpu_pa_features:		  <- early_radix_enabled() = false
      ...				^ <- early_radix_enabled() = TRUE
      allocate_paca:			| <- early_radix_enabled() = TRUE
          ...                           |
          ppc64_bolted_size:		| <- early_radix_enabled() = TRUE
              if (early_radix_enabled())| <- early_radix_enabled() = TRUE
                  return ULONG_MAX;     |
      ...                               |
  ...					| <- early_radix_enabled() = TRUE
  ...					| <- early_radix_enabled() = TRUE
  mmu_early_init_devtree()              V
  ...					  <- early_radix_enabled() = false

So far we have not seen any issue because allocate_paca() takes minimum of
ppc64_bolted_size and rma_size while allocating paca. However it is better
to close this window by fixing up the mmu features as early as possible.
This fixes early_radix_enabled() and ppc64_bolted_size() to return valid
values in radix disable mode. This patch will help subsequent patch to
depend on early_radix_enabled() check while detecting supported segment
size in HPT mode.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
 arch/powerpc/include/asm/mmu.h           | 1 +
 arch/powerpc/kernel/prom.c               | 2 ++
 arch/powerpc/mm/init_64.c                | 5 ++++-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..d60be5051d60 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -197,6 +197,7 @@ extern int mmu_vmemmap_psize;
 extern int mmu_io_psize;
 
 /* MMU initialization */
+void update_cpu_features(void);
 void mmu_early_init_devtree(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 8abe8e42e045..5eb494ea85d7 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -401,6 +401,7 @@ extern void early_init_mmu(void);
 extern void early_init_mmu_secondary(void);
 extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				       phys_addr_t first_memblock_size);
+static inline void update_cpu_features(void) { }
 static inline void mmu_early_init_devtree(void) { }
 
 static inline void pkey_early_init_devtree(void) {}
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 2e67588f6f6e..889c909e4ed4 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -380,6 +380,8 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 		check_cpu_pa_features(node);
 	}
 
+	/* Update cpu features based on kernel command line */
+	update_cpu_features();
 	identical_pvr_fixup(node);
 	init_mmu_slb_size(node);
 
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 386be136026e..19680b42898f 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -437,12 +437,15 @@ static void __init early_check_vec5(void)
 	}
 }
 
-void __init mmu_early_init_devtree(void)
+void __init update_cpu_features(void)
 {
 	/* Disable radix mode based on kernel command line. */
 	if (disable_radix)
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+}
 
+void __init mmu_early_init_devtree(void)
+{
 	/*
 	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
 	 * When running bare-metal, we can use radix if we like
-- 
2.31.1

