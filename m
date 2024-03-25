Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056E888E14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:07:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nn6xTFDS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31CH27hhz3d36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:07:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nn6xTFDS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31BT74clz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:06:57 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P3iOSg032524;
	Mon, 25 Mar 2024 05:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=93IxIEVNxtyr+ERORojTVn9AS1f7a+/VryecW1dOj48=;
 b=Nn6xTFDSmhlBHuY4GQ08uPYUqxMcD6/ARXNcszzc3mK/kz8+KXXsa4KszGUabhvmknZI
 YXaWackCn7Jg0vUIYUjDIcJ5ksWOHjL8A+TNe+bvYVgybnzhEZY1laEkwW6t76FEDt1k
 aSY1/6vGABhRps5ostdtn1umBFd1M+zt5valeyfTr0SwM6kKqw0YMhbBLAnIiVnG2HOg
 ZU8VW/3FHCcugA0p20n6zKV+hvDAm6+O60OJ2ULZaKumMiwEvxC62aVSfOQ1tFu664Yo
 nA/K26gbBwg0izVF7Pn4ne82TfrjMT0wVWAoTSASJn0klHHYLwkg9zmQGYOsgAUSIWWQ QA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x28fhtcwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:06:51 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P47B5j003744;
	Mon, 25 Mar 2024 05:06:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2c42ecn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:06:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P56l9c42140040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:06:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 424AA20043;
	Mon, 25 Mar 2024 05:06:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68B4B20040;
	Mon, 25 Mar 2024 05:06:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:06:46 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D817460429;
	Mon, 25 Mar 2024 16:06:43 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/2] powerpc64/dexcr: Enable PHIE on all CPUs
Date: Mon, 25 Mar 2024 16:06:29 +1100
Message-ID: <20240325050629.832497-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325050629.832497-1-bgray@linux.ibm.com>
References: <20240325050629.832497-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ruCBcARXtpwEOA8Bu2Dp8nVJGVRXt-sT
X-Proofpoint-GUID: ruCBcARXtpwEOA8Bu2Dp8nVJGVRXt-sT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=785
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250027
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While we can now compile the kernel with ROP
protection, it's possible the hash instructions
are acting as NOPs.

Enable the PHIE aspect at an appropriate stage in
boot so as to maximise coverage without requiring
certain functions be compiled without ROP
protection.

For the boot CPU, there are no arch defined functions
that do not return and get called before we start
spawning tasks. Therefore we insert the PHIE enablement
as a feature section after we call early_setup() where
CPU feature detection takes place.

For secondary CPUs, we can enable PHIE in
start_secondary().

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

This patch is probably incompatible with the
per-task DEXCR tracking in the userspace DEXCR
series, but I'll fix up whichever one lands last.

I tested on a Power10 (TCG and KVM) and Power9.
I also tried enabling ftrace; no apparent issues,
and the trace probes were definitely triggering.

The default config enables ROP protection when
the dependencies are satisfied but perhaps we
might want to phase it in slower by disabling it?

Finally, I've tied together inserting the hash
instructions and enabling the PHIE aspect. It
might be preferable for distros to have the option
to boot without enabling PHIE for performance
comparisons. This would be with a command line
option I guess?
---
 arch/powerpc/include/asm/reg.h |  2 ++
 arch/powerpc/kernel/head_64.S  | 10 ++++++++++
 arch/powerpc/kernel/smp.c      |  6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index d3d1aea009b4..185807119320 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -392,6 +392,8 @@
 #define   DEXCR_PR_IBRTPD 0x10000000UL /* 3: Indirect Branch Recurrent Target Prediction Disable */
 #define   DEXCR_PR_SRAPD  0x08000000UL /* 4: Subroutine Return Address Prediction Disable */
 #define   DEXCR_PR_NPHIE  0x04000000UL /* 5: Non-Privileged Hash Instruction Enable */
+#define   DEXCR_PR_PHIE   0x02000000UL /* 6: Privileged Hash Instruction Enable */
+#define   DEXCR_PNH_PHIE  (DEXCR_PR_PHIE << 32)
 #define   DEXCR_INIT	DEXCR_PR_NPHIE	/* Fixed DEXCR value to initialise all CPUs with */
 #define SPRN_IC		0x350	/* Virtual Instruction Count */
 #define SPRN_VTB	0x351	/* Virtual Time Base */
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 4690c219bfa4..490cd09dc9a4 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -1011,6 +1011,16 @@ start_here_multiplatform:
 	mtctr	r12
 	bctrl		/* also sets r13 and SPRG_PACA */
 
+#ifdef CONFIG_PPC_KERNEL_ROP_PROTECT
+BEGIN_FTR_SECTION
+	mfspr	r3,SPRN_DEXCR
+	LOAD_REG_IMMEDIATE(r4,DEXCR_PNH_PHIE)
+	or	r3,r3,r4
+	mtspr	SPRN_DEXCR,r3
+	isync
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
+#endif
+
 	LOAD_REG_ADDR(r3, start_here_common)
 	ld	r4,PACAKMSR(r13)
 	mtspr	SPRN_SRR0,r3
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index a60e4139214b..4a8e9f79aa0c 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1620,6 +1620,12 @@ void start_secondary(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
 
+	/* Enable hash instructions on this CPU in case not already enabled by the hypervisor */
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_ROP_PROTECT) && cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mtspr(SPRN_DEXCR, mfspr(SPRN_DEXCR) | DEXCR_PNH_PHIE);
+		isync();
+	}
+
 	/* PPC64 calls setup_kup() in early_setup_secondary() */
 	if (IS_ENABLED(CONFIG_PPC32))
 		setup_kup();
-- 
2.44.0

