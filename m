Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F82421266
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNPNp53bPz2ywJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fu1nUACD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNPMJ3syjz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:11:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fu1nUACD; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNPMJ3mwpz4xbX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:11:56 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNPMJ3lYPz4xbV; Tue,  5 Oct 2021 02:11:56 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fu1nUACD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNPMJ1TmFz4xbR;
 Tue,  5 Oct 2021 02:11:56 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194F1LoD020663; 
 Mon, 4 Oct 2021 11:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J1NyJgw5/Ri2UCNpPIAPFw4VntFMYRN49EHROw1YtaE=;
 b=fu1nUACD/XbshjAC4ZtBHwNUvClEqr0IxsxvsEw00Puta8dWxINlmbiAr4e3FyocIY+H
 zDG61JpAXoi9u0vn3VxDFA7J/FgqQWCgw3YTmUk3MfuPPHhNB+yG83DVZNGrIq4E7VlU
 rb1X62EqM7wIMfiZVJYi77jQ/ZJsAXi35zSdjOF6I9mCwiy72SrfhJYShNpjm3TGCW6D
 NvBMjWuw+aGc1y0E/L/pEo3WJvHBXWCs64Nlwyb/r38zRBG0h2D/bfseISjt4DhavfEK
 gGRX3oSVDJTXJASKNE0p3IaaUf5Nhq5r3j2lYP2po2CWzV80OW1O3pegZm5ATZ6mw2Mq Yw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg38bs2xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 11:11:53 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194F8fEM029774;
 Mon, 4 Oct 2021 15:11:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3bef29775m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 15:11:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 194F6XA820251004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 15:06:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8B3F11C05C;
 Mon,  4 Oct 2021 15:11:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CAED11C06E;
 Mon,  4 Oct 2021 15:11:45 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.74.5])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 15:11:45 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/3] fixup mmu_features immediately after getting cpu pa
 features.
Date: Mon,  4 Oct 2021 20:41:40 +0530
Message-Id: <20211004151142.256251-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7vqGfFU_SHJOIOMquDpM0pjYMXVCJAyZ
X-Proofpoint-ORIG-GUID: 7vqGfFU_SHJOIOMquDpM0pjYMXVCJAyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=919 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040104
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
Cc: Abdul haleem <abdhalee@linux.vnet.ibm.com>, mahesh@linux.vnet.ibm.com,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, aneesh.kumar@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mahesh Salgaonkar <mahesh@linux.ibm.com>

On system with radix support available, early_radix_enabled() starts
returning true for a small window (until mmu_early_init_devtree() is
called) even when radix mode disabled on kernel command line. This causes
ppc64_bolted_size() to return ULONG_MAX in HPT mode instead of supported
segment size, during boot cpu paca allocation.

With kernel command line = "... disable_radix":

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
 arch/powerpc/kernel/prom.c               | 1 +
 arch/powerpc/mm/init_64.c                | 5 ++++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..69a89fa1330d 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -197,6 +197,7 @@ extern int mmu_vmemmap_psize;
 extern int mmu_io_psize;
 
 /* MMU initialization */
+void mmu_cpu_feature_fixup(void);
 void mmu_early_init_devtree(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 8abe8e42e045..c8eafd401fe9 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -401,6 +401,7 @@ extern void early_init_mmu(void);
 extern void early_init_mmu_secondary(void);
 extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				       phys_addr_t first_memblock_size);
+static inline void mmu_cpu_feature_fixup(void) { }
 static inline void mmu_early_init_devtree(void) { }
 
 static inline void pkey_early_init_devtree(void) {}
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 2e67588f6f6e..1727a3abe6c1 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -380,6 +380,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 		check_cpu_pa_features(node);
 	}
 
+	mmu_cpu_feature_fixup();
 	identical_pvr_fixup(node);
 	init_mmu_slb_size(node);
 
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 386be136026e..9ed452605a2c 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -437,12 +437,15 @@ static void __init early_check_vec5(void)
 	}
 }
 
-void __init mmu_early_init_devtree(void)
+void __init mmu_cpu_feature_fixup(void)
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

