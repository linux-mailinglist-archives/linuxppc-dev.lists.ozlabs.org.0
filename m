Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3C421268
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNPPk3Lp3z2yQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:14:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qv7zGvD0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNPMN4pwfz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qv7zGvD0; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNPMM1PtZz4xbY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:11:59 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNPMM1NMnz4xbX; Tue,  5 Oct 2021 02:11:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qv7zGvD0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNPML68Mvz4xbV;
 Tue,  5 Oct 2021 02:11:58 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194Evrmv013923; 
 Mon, 4 Oct 2021 11:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fibT7HHFTwvu0NqZIVv4G2uAf84MMhdoMrDj5ujioAw=;
 b=Qv7zGvD0HpFvv2/UaM0Pj0Vv/KyVAKg01AL38OU+x85nETLmyUSNVnQ8GC1nzt2JkZVC
 cRBMaMuf9kEM3xvu9cDN/teGj6/sEm/DbPtFF5EWvnZ59qjHmS1WG6WRWvabvHVbW8nW
 t9bgDtrqmB9tAQOBHgsSYCvquaqI8ks//fI0l0yotlINxuXZnFSvK+gZDS5yDC4ZG3YQ
 HmH3vIkh+sXAAO2yVzaNERa6hhtyUeAirfmhK/ls17YjeH13s2ppMK5HYoiwwvxeujRF
 L0CcT0fMeyKLYXRnfxNX2QKiIH5SXxWb/p6gjZShEgeMMKKPPxIE9e8gE/wo6NJtLNdi oA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg3kn8r7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 11:11:56 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194F8Ve1028018;
 Mon, 4 Oct 2021 15:11:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3beepj8u96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 15:11:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194FBpfM43516202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 15:11:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06C7811C04C;
 Mon,  4 Oct 2021 15:11:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EEB611C064;
 Mon,  4 Oct 2021 15:11:48 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.74.5])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 15:11:48 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/3] Remove 256MB limit restriction for boot cpu paca
 allocation
Date: Mon,  4 Oct 2021 20:41:41 +0530
Message-Id: <20211004151142.256251-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hlHMaci4NrqcffsT1PBJDUdmCm1b1I0I
X-Proofpoint-GUID: hlHMaci4NrqcffsT1PBJDUdmCm1b1I0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040104
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
 Sourabh Jain <sourabhjain@linu.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, aneesh.kumar@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mahesh Salgaonkar <mahesh@linux.ibm.com>

At the time when we detect and allocate paca for boot cpu, we havn't yet
detected mmu feature of 1T segments support (not until
mmu_early_init_devtree() call). This causes ppc64_bolted_size() to return
256MB as limit forcing boot cpu paca allocation below 256MB always.

This works fine for kdump kernel boot as long as crashkernel reservation is
at offset below 256MB. But when we move kdump offset to 256MB or above,
kdump kernel fails to allocate paca for boot cpu below 256MB and crashes in
allocate_paca().

Moving the detection of segment sizes just before paca allocation for boot
cpu removes this restriction of 256MB limit. This allows kdump kernel to
successfully boot and capture vmcore.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linu.ibm.com>
Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
 arch/powerpc/kernel/prom.c               | 4 ++++
 arch/powerpc/mm/book3s64/hash_utils.c    | 5 ++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 69a89fa1330d..f43070581f11 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -199,6 +199,7 @@ extern int mmu_io_psize;
 /* MMU initialization */
 void mmu_cpu_feature_fixup(void);
 void mmu_early_init_devtree(void);
+void hash__early_detect_seg_size(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
 #ifdef CONFIG_PPC_PKEY
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 1727a3abe6c1..68397f335caf 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -384,6 +384,10 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	identical_pvr_fixup(node);
 	init_mmu_slb_size(node);
 
+	/* Initialize segment sizes */
+	if (!early_radix_enabled())
+		hash__early_detect_seg_size();
+
 #ifdef CONFIG_PPC64
 	if (nthreads == 1)
 		cur_cpu_spec->cpu_features &= ~CPU_FTR_SMT;
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c145776d3ae5..ef4fc6bb1b30 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1020,11 +1020,14 @@ static void __init htab_initialize(void)
 #undef KB
 #undef MB
 
-void __init hash__early_init_devtree(void)
+void __init hash__early_detect_seg_size(void)
 {
 	/* Initialize segment sizes */
 	of_scan_flat_dt(htab_dt_scan_seg_sizes, NULL);
+}
 
+void __init hash__early_init_devtree(void)
+{
 	/* Initialize page sizes */
 	htab_scan_page_sizes();
 }
-- 
2.31.1

