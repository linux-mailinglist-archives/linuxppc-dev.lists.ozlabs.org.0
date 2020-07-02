Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17540212DAB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 22:12:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yTmF35b0zDqTL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 06:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yTPS34SyzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:56:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49yTPR7055z8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:56:27 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49yTPR62QQz9sRf; Fri,  3 Jul 2020 05:56:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49yTPR2BMwz9sPF
 for <linuxppc-dev@ozlabs.org>; Fri,  3 Jul 2020 05:56:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062JVptm191059; Thu, 2 Jul 2020 15:56:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320yr5vpev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:56:21 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062JdkIA038276;
 Thu, 2 Jul 2020 15:56:20 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320yr5vpe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:56:20 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062Jt1l2015456;
 Thu, 2 Jul 2020 19:56:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 31wyyauuhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:56:17 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 062JuEUZ63898014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 19:56:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5879842042;
 Thu,  2 Jul 2020 19:56:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 432AE42041;
 Thu,  2 Jul 2020 19:56:11 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.21.221])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jul 2020 19:56:11 +0000 (GMT)
Subject: [PATCH v2 08/12] ppc64/kexec_file: setup the stack for purgatory
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 03 Jul 2020 01:26:10 +0530
Message-ID: <159371976272.21555.11015926634292123159.stgit@hbathini.in.ibm.com>
In-Reply-To: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
References: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 cotscore=-2147483648 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007020129
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
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid any weird errors, the purgatory should run with its own
stack. Set one up by adding the stack buffer to .data section of
the purgatory. Also, setup opal base & entry values in r8 & r9
registers to help early OPAL debugging.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
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
index adca9c0..f06dcf1 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -873,6 +873,8 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr)
 {
+	struct device_node *dn;
+	void *stack_buf;
 	uint64_t val;
 	int ret;
 
@@ -896,10 +898,37 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
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
 	val = get_toc_ptr(image->purgatory_info.ehdr);
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

