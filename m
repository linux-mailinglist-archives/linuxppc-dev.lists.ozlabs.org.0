Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3638619ECB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:33:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nmD5NRfz3f7N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:33:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j4VJkMTZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j4VJkMTZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nfH0Jxrz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4H0IjE000698;
	Fri, 4 Nov 2022 17:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=loEoK25Bu/YcSoWDF6I0ydMI+vDHW99cBCJVJ3oa68w=;
 b=j4VJkMTZarlbkxFt2vTsfcSY4/bmVUVtWc33HNown/QGK3x/OMA8w3+rc30c7lQbytJO
 fXyhNsZxrYjH5KZ6MF/oIbvrs3sWmPl/E1N+FQrM2A1Xa/+X+5VOIR2JqdAbtYvKnjoJ
 2xzigLH1WoTBa93sf+GZJybCfp75HpwcbQJa8jmjZUc4SCSaUWCX5cvjH6UkU+UrYoDv
 cwreWKSq/coyP82jcw4qPXciE1QBtatDEQvzR41RKLAk61JrbxHbm+ugJLpBS8+ovEM/
 fIr0ZelyI6rRACL6rWfmzw233SmgEDPtm6t2KJkm/8cvSrnubiHWAvXmuqjljjrGRxoS vQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmyqw6xux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HKsUw000886;
	Fri, 4 Nov 2022 17:28:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3kgut9apfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HSPdc1114814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:28:25 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 468045204F;
	Fri,  4 Nov 2022 17:28:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E52845204E;
	Fri,  4 Nov 2022 17:28:24 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A419960126;
	Sat,  5 Nov 2022 04:28:21 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/6] powerpc/64s: Enable CONFIG_VMAP_STACK
Date: Sat,  5 Nov 2022 04:27:37 +1100
Message-Id: <20221104172737.391978-7-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104172737.391978-1-ajd@linux.ibm.com>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LgnlmWjcTvVAB_Xa9Dl2EziGAybfCDzF
X-Proofpoint-GUID: LgnlmWjcTvVAB_Xa9Dl2EziGAybfCDzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=947 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable CONFIG_VMAP_STACK for book3s64.

To do this, we need to make some slight adjustments to set the stack SLB
entry up for vmalloc rather than linear.

For now, only enable if KVM_BOOK3S_64_HV is disabled (there's some real mode
handlers we need to fix there).

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/kernel/process.c          |  4 ++++
 arch/powerpc/mm/book3s64/slb.c         | 11 +++++++++--
 arch/powerpc/platforms/Kconfig.cputype |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 07917726c629..cadf2db5a2a8 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1685,7 +1685,11 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 {
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	unsigned long sp_vsid;
+#ifdef CONFIG_VMAP_STACK
+	unsigned long llp = mmu_psize_defs[mmu_vmalloc_psize].sllp;
+#else /* CONFIG_VMAP_STACK */
 	unsigned long llp = mmu_psize_defs[mmu_linear_psize].sllp;
+#endif /* CONFIG_VMAP_STACK */
 
 	if (radix_enabled())
 		return;
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 6956f637a38c..0e21f0eaa7bb 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -541,7 +541,7 @@ void slb_set_size(u16 size)
 void slb_initialize(void)
 {
 	unsigned long linear_llp, vmalloc_llp, io_llp;
-	unsigned long lflags;
+	unsigned long lflags, kstack_flags;
 	static int slb_encoding_inited;
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 	unsigned long vmemmap_llp;
@@ -582,11 +582,18 @@ void slb_initialize(void)
 	 * get_paca()->kstack hasn't been initialized yet.
 	 * For secondary cpus, we need to bolt the kernel stack entry now.
 	 */
+
+#ifdef CONFIG_VMAP_STACK
+	kstack_flags = SLB_VSID_KERNEL | vmalloc_llp;
+#else
+	kstack_flags = SLB_VSID_KERNEL | linear_llp;
+#endif
 	slb_shadow_clear(KSTACK_INDEX);
 	if (raw_smp_processor_id() != boot_cpuid &&
 	    (get_paca()->kstack & slb_esid_mask(mmu_kernel_ssize)) > PAGE_OFFSET)
 		create_shadowed_slbe(get_paca()->kstack,
-				     mmu_kernel_ssize, lflags, KSTACK_INDEX);
+				     mmu_kernel_ssize, kstack_flags,
+				     KSTACK_INDEX);
 
 	asm volatile("isync":::"memory");
 }
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0c4eed9aea80..998317257797 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -104,6 +104,7 @@ config PPC_BOOK3S_64
 	select IRQ_WORK
 	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
 	select KASAN_VMALLOC if KASAN
+	select HAVE_ARCH_VMAP_STACK if KVM_BOOK3S_64_HV = n
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
-- 
2.38.1

