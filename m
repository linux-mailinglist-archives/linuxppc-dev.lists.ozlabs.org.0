Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76123431265
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:46:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXr7j6qS5z2yp1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:46:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j00ZJMKl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXr6D4llbz2yPq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:44:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j00ZJMKl; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HXr6B6K1Zz4xd9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:44:50 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HXr6B6GXTz4xd8; Mon, 18 Oct 2021 19:44:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j00ZJMKl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HXr6B3v5xz4xbT;
 Mon, 18 Oct 2021 19:44:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I8e7fo026549; 
 Mon, 18 Oct 2021 04:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=npvkGEPGqKwEoUSC4SyInPdrQa1CL4fDAiEEVRVxIec=;
 b=j00ZJMKl86WicRslvupXWfmorP8zEx/4UlTYrOdN/nwxOwkCNocapHte2P7ClJ7G2DW9
 sY5WHMyND2vZUoNpzXB9btLCZlpBDanYiE21LxjntYWtrPwz4/XuBaD1AMaqAhCXWMMy
 5GPVvvz0mdHNSLKe55UfNxMuuonik9Ql7UjuOSfzSJCyRLMsMg6HtT/NtHenMLUt3+8E
 dC3OoADff6BapdbjOMItVB0w0rXTT5n9uz8RbnqRJMtvI6hrPnZUnDDT2eBvNwxMU9hM
 qD8r+8SFtKgFa2zlxlBwSZZsZe3j4Kg/euM4rFy49tXv3Z/uJ066nDaBAZarFqRVz+6J 4Q== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs2n8bvay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 04:44:47 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I8dHFv011326;
 Mon, 18 Oct 2021 08:44:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3bqpcb2x78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 08:44:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19I8ig9t3277504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 08:44:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04B4011C05C;
 Mon, 18 Oct 2021 08:44:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21ED711C052;
 Mon, 18 Oct 2021 08:44:40 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.54.237])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 08:44:39 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [RESEND PATCH v2 2/3] Remove 256MB limit restriction for boot cpu
 paca allocation
Date: Mon, 18 Oct 2021 14:14:33 +0530
Message-Id: <20211018084434.217772-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018084434.217772-1-sourabhjain@linux.ibm.com>
References: <20211018084434.217772-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: brxudAHafEho-4cIRPl_SyxXEYwWndtz
X-Proofpoint-ORIG-GUID: brxudAHafEho-4cIRPl_SyxXEYwWndtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
 arch/powerpc/kernel/prom.c               | 6 ++++++
 arch/powerpc/mm/book3s64/hash_utils.c    | 5 ++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index d60be5051d60..9b05a84313bb 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -199,6 +199,7 @@ extern int mmu_io_psize;
 /* MMU initialization */
 void update_cpu_features(void);
 void mmu_early_init_devtree(void);
+void hash__early_detect_seg_size(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
 #ifdef CONFIG_PPC_PKEY
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 889c909e4ed4..5da2bfff4dea 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -385,6 +385,12 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	identical_pvr_fixup(node);
 	init_mmu_slb_size(node);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* Initialize segment sizes */
+	if (!early_radix_enabled())
+		hash__early_detect_seg_size();
+#endif
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

