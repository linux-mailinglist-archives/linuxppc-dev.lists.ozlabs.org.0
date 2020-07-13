Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2721DED6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:36:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B59mq5FhkzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B59TF2pXQzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:22:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B59TF1Khgz8vnS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:22:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B59TD60LWz9sSJ; Tue, 14 Jul 2020 03:22:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B59TD13m8z9sRW
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 03:22:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DH226b145170; Mon, 13 Jul 2020 13:22:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279dtb8pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:22:49 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DHIibl193771;
 Mon, 13 Jul 2020 13:22:48 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279dtb8nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:22:48 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DHLDWc027163;
 Mon, 13 Jul 2020 17:22:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 327527tfcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 17:22:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DHMhCX12583402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 17:22:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7BE2A4055;
 Mon, 13 Jul 2020 17:22:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37BE6A4053;
 Mon, 13 Jul 2020 17:22:40 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.11])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 17:22:39 +0000 (GMT)
Subject: [PATCH v3 08/12] ppc64/kexec_file: setup the stack for purgatory
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Jul 2020 22:52:39 +0530
Message-ID: <159466095278.24747.9161591016931052627.stgit@hbathini.in.ibm.com>
In-Reply-To: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130120
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid any weird errors, the purgatory should run with its own
stack. Set one up by adding the stack buffer to .data section of
the purgatory. Also, setup opal base & entry values in r8 & r9
registers to help early OPAL debugging.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
---

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* Setting up opal base & entry values in r8 & r9 for early OPAL debug.


 arch/powerpc/include/asm/kexec.h       |    4 ++++
 arch/powerpc/kexec/file_load_64.c      |   29 +++++++++++++++++++++++++++++
 arch/powerpc/purgatory/trampoline_64.S |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bf47a01..e78cd0a 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -45,6 +45,10 @@
 #define KEXEC_ARCH KEXEC_ARCH_PPC
 #endif
 
+#ifdef CONFIG_KEXEC_FILE
+#define KEXEC_PURGATORY_STACK_SIZE	16384	/* 16KB stack size */
+#endif
+
 #define KEXEC_STATE_NONE 0
 #define KEXEC_STATE_IRQS_OFF 1
 #define KEXEC_STATE_REAL_MODE 2
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 8bff29e..adad297 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -875,6 +875,8 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr)
 {
+	struct device_node *dn;
+	void *stack_buf;
 	uint64_t val;
 	int ret;
 
@@ -898,10 +900,37 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			goto out;
 	}
 
+	/* Setup the stack top */
+	stack_buf = kexec_purgatory_get_symbol_addr(image, "stack_buf");
+	if (!stack_buf)
+		goto out;
+
+	val = (u64)stack_buf + KEXEC_PURGATORY_STACK_SIZE;
+	ret = kexec_purgatory_get_set_symbol(image, "stack", &val, sizeof(val),
+					     false);
+	if (ret)
+		goto out;
+
 	/* Setup the TOC pointer */
 	val = get_toc_ptr(&(image->purgatory_info));
 	ret = kexec_purgatory_get_set_symbol(image, "my_toc", &val, sizeof(val),
 					     false);
+	if (ret)
+		goto out;
+
+	/* Setup OPAL base & entry values */
+	dn = of_find_node_by_path("/ibm,opal");
+	if (dn) {
+		of_property_read_u64(dn, "opal-base-address", &val);
+		ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
+						     sizeof(val), false);
+		if (ret)
+			goto out;
+
+		of_property_read_u64(dn, "opal-entry-address", &val);
+		ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
+						     sizeof(val), false);
+	}
 out:
 	if (ret)
 		pr_err("Failed to setup purgatory symbols");
diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
index 7b4a5f7..83e93b7 100644
--- a/arch/powerpc/purgatory/trampoline_64.S
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -9,6 +9,7 @@
  * Copyright (C) 2013, Anton Blanchard, IBM Corporation
  */
 
+#include <asm/kexec.h>
 #include <asm/asm-compat.h>
 
 	.machine ppc64
@@ -53,6 +54,8 @@ master:
 
 	ld	%r2,(my_toc - 0b)(%r18)		/* setup toc */
 
+	ld	%r1,(stack - 0b)(%r18)		/* setup stack */
+
 	/* load device-tree address */
 	ld	%r3, (dt_offset - 0b)(%r18)
 	mr	%r16,%r3	/* save dt address in reg16 */
@@ -63,6 +66,11 @@ master:
 	li	%r4,28
 	STWX_BE	%r17,%r3,%r4	/* Store my cpu as __be32 at byte 28 */
 1:
+
+	/* Load opal base and entry values in r8 & r9 respectively */
+	ld	%r8,(opal_base - 0b)(%r18)
+	ld	%r9,(opal_entry - 0b)(%r18)
+
 	/* load the kernel address */
 	ld	%r4,(kernel - 0b)(%r18)
 
@@ -111,6 +119,24 @@ my_toc:
 	.8byte  0x0
 	.size my_toc, . - my_toc
 
+	.balign 8
+	.globl stack
+stack:
+	.8byte  0x0
+	.size stack, . - stack
+
+	.balign 8
+	.globl opal_base
+opal_base:
+	.8byte  0x0
+	.size opal_base, . - opal_base
+
+	.balign 8
+	.globl opal_entry
+opal_entry:
+	.8byte  0x0
+	.size opal_entry, . - opal_entry
+
 	.data
 	.balign 8
 .globl purgatory_sha256_digest
@@ -123,3 +149,9 @@ purgatory_sha256_digest:
 purgatory_sha_regions:
 	.skip	8 * 2 * 16
 	.size purgatory_sha_regions, . - purgatory_sha_regions
+
+	.balign 8
+.globl stack_buf
+stack_buf:
+	.skip	KEXEC_PURGATORY_STACK_SIZE
+	.size stack_buf, . - stack_buf

