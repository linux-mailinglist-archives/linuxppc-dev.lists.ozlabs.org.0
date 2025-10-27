Return-Path: <linuxppc-dev+bounces-13342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C57C0EDAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:14:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwH8q6vdSz2yyx;
	Tue, 28 Oct 2025 02:14:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761578043;
	cv=none; b=Pe2fFJcmfca6QnzU1XH8rrkLtUyJ4jf1VGO171X9xrRkVnwaeQhKsEjrK7x26xmsAv5wdRMtddb6TAZtYAkiHlnEF4skoA5NDt22FfqzngsBU5TcLk/EOMN+Scid+thII/aD25ht95brpehO1oeMnGaER5hDKuwd06MyMN5/sL+PN7ZsnaLYxCcF7/RO4UriNxLX7jg7Mb/9YkOheLQdSMHo4YmBUQuTdY0sj7AOK5ef4Yy5vGcPJYm969yWtEw/HT588ee72zUYrJcvcAGSt3hYXAU7sgu/PYsrubreebzTnSN+o/ciqfnfpdy/FlU1fI2BaZESqfTAv/R/FjypzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761578043; c=relaxed/relaxed;
	bh=e89O1xzjRq9QXXtmE24QvhwUCMPclJZDwHpkMW0tEP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZh5rVTchsDdqyRP7Lw/LypNipgZxOCXiTbmJ1kqwAvhRXLdhEnElKORfFGfAZP8jW5KkEI3W4wfZczslF7Z2PsMWqjZ8GSmJ4iqKmGbP3cccRdT/GGBt8TSCZrg2YCI021iqIv7pDCaF2xLy1NKkkpg7PO+KV9yHQsaDGbgSNUvXIY8qhe83BAIXRXcymkCXapPpk2DILzUr3BKhp3E8IrRtZcvJOobCpKqs5q/bWvX+D7DTflonE17/BxL9CN91iOwqqjdc3sW7Z+yvPdBRHi0Ac5V1z8ovZeK/9smm/1buwmhzP6iELuTIYIW9doIUHUBLmHh6LXau7xDW2FO2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VW5EmRf2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VW5EmRf2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwH8q0h9pz3btv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:14:02 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDUJFa030658;
	Mon, 27 Oct 2025 15:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e89O1xzjRq9QXXtmE
	24QvhwUCMPclJZDwHpkMW0tEP4=; b=VW5EmRf2Ds+c0lhaUuJbHtvv6qyZwcW/M
	JPtZAFbO3CKa6iJs89j+cwtxmkgZAGalE3FVmlYMRONTBPkC9YnxmS7Lai6OF9Bd
	F1MUyKgLa+/6TiTfV0z7UBg25/4S9LS3lfNt4ybAw30f3Nj7mHlmsHU54Wz5Fr6m
	xYR2WggusZ3IowFGwMkW8kkW0URyNGgTqCyyGiIwrCrwkHFGzQd1f5Gv+rch5Le1
	nYkSQs24FXRttY5JOofvllETR/oAEIGrqsqM6Wu6vaut3gSGwKdQ3wNgD3HCn+Na
	42NqcWC4gvMw5q/Aa28Ecx44CXmRthTGT3GNEKFqpPLb6ZSJIp86A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:55 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59REaUiQ021160;
	Mon, 27 Oct 2025 15:13:55 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59RETx6A021635;
	Mon, 27 Oct 2025 15:13:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a18vrxaky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59RFDoQM52953400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 15:13:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CA1720040;
	Mon, 27 Oct 2025 15:13:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F02E520049;
	Mon, 27 Oct 2025 15:13:48 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Oct 2025 15:13:48 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 2/4] powerpc: move to 64-bit RTAS
Date: Mon, 27 Oct 2025 20:43:36 +0530
Message-ID: <20251027151338.819957-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xz-attZP7eeaRjN6c36-kmA7cq3x7e4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX/tlIEWmApzrN
 97Bn/KkVRBf6k0jmZjcP4v8/gKQhjgJguFDojPK76XvfVVQL7WcRThuJRWpy5ZY9gtYCNJiFIGE
 lgxQ/kbMaViDFj+AXl0Vymw+D1lZsOr3HwEpnGvTH6HBH6ObAw8Ek3o6+PTNUq/FUQycbw1FFR5
 5e9AFMJMhB75PLDP0rvmWv28wwaj7YVQ39z+UPfCiXB013LTNYXwhSw5WRv9VqdmNbIEsoX9d17
 CmMCbRcTf1JbtEtkDsndcTir3tS1v/n5en4ysmGq1y6KY/jPkKBjOcFdOtswZuyrXSC9ZM28sfW
 imHTljONkqyphTZvh1DEmehT8w48phqQ4iUjjt3wUhmpdwi+VwfGEDh3lepMq4BaGsF4y4FjxP+
 XvX5eDTY1TkNicQol3anjQztKuf+Kw==
X-Proofpoint-GUID: 1taxkNsIpkkxpl_hYCGsRWoFGYbBrQH3
X-Authority-Analysis: v=2.4 cv=FaE6BZ+6 c=1 sm=1 tr=0 ts=68ff8c33 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=p3B6Z5uG7NFaigtuLU4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kdump kernels loaded at high addresses (above 4G) could not boot
because the kernel used 32-bit RTAS.

Until now, the kernel always used 32-bit RTAS, even for 64-bit kernels.
Before making an RTAS call, it sets the MSR register with the SF bit off
and sets rtas_return_loc/rtas_entry.s to LR as the return address.
For kdump kernels loaded above 4G, RTAS cannot jump back to this LR
correctly and instead jumps to a 32-bit truncated address. This usually
causes exception which leads to kernel panic.

To fix this, the kernel initializes 64-bit RTAS and sets the SF bit in
the MSR register before each RTAS call, ensuring that RTAS jumps back
correctly if the LR address is higher than 4G. This allows kdump kernels
at high addresses to boot properly.

If 64-bit RTAS initialization fails or is not supported (e.g., in QEMU),
the kernel falls back to 32-bit RTAS. In this case, high-address kdump
kernels will not be allowed (handled in upcoming patches), and RTAS
calls will use SF bit off.

Changes made to achieve this:
 - Initialize 64-bit RTAS in prom_init and add a new FDT property
   linux,rtas-64
 - Kernel reads linux,rtas-64 and sets a global variable rtas_64 to
   indicate whether RTAS is 64-bit or 32-bit
 - Prepare MSR register for RTAS calls based on whether RTAS is 32-bit
   or 64-bit

Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h  |  2 ++
 arch/powerpc/kernel/prom_init.c  | 26 ++++++++++++++++++++++----
 arch/powerpc/kernel/rtas.c       |  5 +++++
 arch/powerpc/kernel/rtas_entry.S | 17 ++++++++++++++++-
 4 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index d046bbd5017d..aaa4c3bc1d61 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -10,6 +10,8 @@
 #include <linux/time.h>
 #include <linux/cpumask.h>
 
+extern int rtas_64;
+
 /*
  * Definitions for talking to the RTAS on CHRP machines.
  *
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 827c958677f8..ab85b8bb8d4f 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1841,6 +1841,7 @@ static void __init prom_instantiate_rtas(void)
 	u32 base, entry = 0;
 	__be32 val;
 	u32 size = 0;
+	u32 rtas_64 = 1;
 
 	prom_debug("prom_instantiate_rtas: start...\n");
 
@@ -1867,12 +1868,25 @@ static void __init prom_instantiate_rtas(void)
 
 	prom_printf("instantiating rtas at 0x%x...", base);
 
+	/*
+	 * First, try to instantiate 64-bit RTAS. If that fails, fall back
+	 * to 32-bit. Although 64-bit RTAS support has been available on
+	 * real machines for some time, QEMU still lacks this support.
+	 */
 	if (call_prom_ret("call-method", 3, 2, &entry,
-			  ADDR("instantiate-rtas"),
+			  ADDR("instantiate-rtas-64"),
 			  rtas_inst, base) != 0
-	    || entry == 0) {
-		prom_printf(" failed\n");
-		return;
+		|| entry == 0) {
+
+		rtas_64 = 0;
+		if (call_prom_ret("call-method", 3, 2, &entry,
+				ADDR("instantiate-rtas"),
+				rtas_inst, base) != 0
+			|| entry == 0) {
+
+			prom_printf(" failed\n");
+			return;
+		}
 	}
 	prom_printf(" done\n");
 
@@ -1884,6 +1898,9 @@ static void __init prom_instantiate_rtas(void)
 	val = cpu_to_be32(entry);
 	prom_setprop(rtas_node, "/rtas", "linux,rtas-entry",
 		     &val, sizeof(val));
+	val = cpu_to_be32(rtas_64);
+	prom_setprop(rtas_node, "/rtas", "linux,rtas-64",
+		     &val, sizeof(val));
 
 	/* Check if it supports "query-cpu-stopped-state" */
 	if (prom_getprop(rtas_node, "query-cpu-stopped-state",
@@ -1893,6 +1910,7 @@ static void __init prom_instantiate_rtas(void)
 	prom_debug("rtas base     = 0x%x\n", base);
 	prom_debug("rtas entry    = 0x%x\n", entry);
 	prom_debug("rtas size     = 0x%x\n", size);
+	prom_debug("rtas 64-bit   = 0x%x\n", rtas_64);
 
 	prom_debug("prom_instantiate_rtas: end...\n");
 }
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 8d81c1e7a8db..723806468984 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -45,6 +45,8 @@
 #include <asm/trace.h>
 #include <asm/udbg.h>
 
+int rtas_64 = 1;
+
 struct rtas_filter {
 	/* Indexes into the args buffer, -1 if not used */
 	const int buf_idx1;
@@ -2087,6 +2089,9 @@ int __init early_init_dt_scan_rtas(unsigned long node,
 	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
 	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
 
+	if (!of_get_flat_dt_prop(node, "linux,rtas-64", NULL))
+		rtas_64 = 0;
+
 #ifdef CONFIG_PPC64
 	/* need this feature to decide the crashkernel offset */
 	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 6ce95ddadbcd..df776f0103c9 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -54,6 +54,10 @@ _ASM_NOKPROBE_SYMBOL(enter_rtas)
 /*
  * 32-bit rtas on 64-bit machines has the additional problem that RTAS may
  * not preserve the upper parts of registers it uses.
+ *
+ * Note: In 64-bit RTAS, the SF bit is set so that RTAS can return
+ * correctly if the return address is above 4 GB. Everything else
+ * works the same as in 32-bit RTAS.
  */
 _GLOBAL(enter_rtas)
 	mflr	r0
@@ -113,7 +117,18 @@ __enter_rtas:
 	 * from the saved MSR value and insert into the value RTAS will use.
 	 */
 	extrdi	r0, r6, 1, 63 - MSR_HV_LG
-	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)
+
+	LOAD_REG_ADDR(r7, rtas_64)	/* Load the address rtas_64 into r7 */
+	ld      r8, 0(r7)               /* Load the value of rtas_64 from memory into r8 */
+	cmpdi   r8, 0                   /* Compare r8 with 0 (check if rtas_64 is zero) */
+	beq     no_sf_bit               /* Branch to no_sf_bit if rtas_64 is zero */
+	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI | MSR_SF)	/* r6 = ME|RI|SF */
+	b       continue
+
+no_sf_bit:
+	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)		/* r6 = ME|RI (NO SF bit in MSR) */
+
+continue:
 	insrdi	r6, r0, 1, 63 - MSR_HV_LG
 
 	li      r0,0
-- 
2.51.0


