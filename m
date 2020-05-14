Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC41D2E28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 13:23:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N8Ks2xtRzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N8D44mq7zDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 21:18:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EB2D94022874; Thu, 14 May 2020 07:17:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310x55vchq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:17:59 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EB2Kv4023583;
 Thu, 14 May 2020 07:17:59 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310x55vcgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:17:58 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EBFw6W015503;
 Thu, 14 May 2020 11:17:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3100ubbgrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:17:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04EBGhxC52822514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 11:16:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BB6F42047;
 Thu, 14 May 2020 11:17:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E28D242041;
 Thu, 14 May 2020 11:17:50 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 11:17:50 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 01/16] powerpc/watchpoint: Rename current DAWR macros
Date: Thu, 14 May 2020 16:47:26 +0530
Message-Id: <20200514111741.97993-2-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
References: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=978 impostorscore=0
 adultscore=0 clxscore=1015 cotscore=-2147483648 lowpriorityscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005140095
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Power10 is introducing second DAWR. Use real register names from ISA
for current macros:
  s/SPRN_DAWR/SPRN_DAWR0/
  s/SPRN_DAWRX/SPRN_DAWRX0/

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/reg.h          |  4 ++--
 arch/powerpc/kernel/dawr.c              |  4 ++--
 arch/powerpc/kvm/book3s_hv.c            | 12 ++++++------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 18 +++++++++---------
 arch/powerpc/xmon/xmon.c                |  2 +-
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index f95eb8f97756..60a21b6b2057 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -283,14 +283,14 @@
 #define   CTRL_CT1	0x40000000	/* thread 1 */
 #define   CTRL_TE	0x00c00000	/* thread enable */
 #define   CTRL_RUNLATCH	0x1
-#define SPRN_DAWR	0xB4
+#define SPRN_DAWR0	0xB4
 #define SPRN_RPR	0xBA	/* Relative Priority Register */
 #define SPRN_CIABR	0xBB
 #define   CIABR_PRIV		0x3
 #define   CIABR_PRIV_USER	1
 #define   CIABR_PRIV_SUPER	2
 #define   CIABR_PRIV_HYPER	3
-#define SPRN_DAWRX	0xBC
+#define SPRN_DAWRX0	0xBC
 #define   DAWRX_USER	__MASK(0)
 #define   DAWRX_KERNEL	__MASK(1)
 #define   DAWRX_HYP	__MASK(2)
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index cc14aa6c4a1b..e91b613bf137 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -39,8 +39,8 @@ int set_dawr(struct arch_hw_breakpoint *brk)
 	if (ppc_md.set_dawr)
 		return ppc_md.set_dawr(dawr, dawrx);
 
-	mtspr(SPRN_DAWR, dawr);
-	mtspr(SPRN_DAWRX, dawrx);
+	mtspr(SPRN_DAWR0, dawr);
+	mtspr(SPRN_DAWRX0, dawrx);
 
 	return 0;
 }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 93493f0cbfe8..db07199f0977 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3392,8 +3392,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	int trap;
 	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
 	unsigned long host_ciabr = mfspr(SPRN_CIABR);
-	unsigned long host_dawr = mfspr(SPRN_DAWR);
-	unsigned long host_dawrx = mfspr(SPRN_DAWRX);
+	unsigned long host_dawr = mfspr(SPRN_DAWR0);
+	unsigned long host_dawrx = mfspr(SPRN_DAWRX0);
 	unsigned long host_psscr = mfspr(SPRN_PSSCR);
 	unsigned long host_pidr = mfspr(SPRN_PID);
 
@@ -3422,8 +3422,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_SPURR, vcpu->arch.spurr);
 
 	if (dawr_enabled()) {
-		mtspr(SPRN_DAWR, vcpu->arch.dawr);
-		mtspr(SPRN_DAWRX, vcpu->arch.dawrx);
+		mtspr(SPRN_DAWR0, vcpu->arch.dawr);
+		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx);
 	}
 	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
 	mtspr(SPRN_IC, vcpu->arch.ic);
@@ -3475,8 +3475,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
 	mtspr(SPRN_HFSCR, host_hfscr);
 	mtspr(SPRN_CIABR, host_ciabr);
-	mtspr(SPRN_DAWR, host_dawr);
-	mtspr(SPRN_DAWRX, host_dawrx);
+	mtspr(SPRN_DAWR0, host_dawr);
+	mtspr(SPRN_DAWRX0, host_dawrx);
 	mtspr(SPRN_PID, host_pidr);
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 780a499c7114..70de3325d0e9 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -707,8 +707,8 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 BEGIN_FTR_SECTION
 	mfspr	r5, SPRN_CIABR
-	mfspr	r6, SPRN_DAWR
-	mfspr	r7, SPRN_DAWRX
+	mfspr	r6, SPRN_DAWR0
+	mfspr	r7, SPRN_DAWRX0
 	mfspr	r8, SPRN_IAMR
 	std	r5, STACK_SLOT_CIABR(r1)
 	std	r6, STACK_SLOT_DAWR(r1)
@@ -803,8 +803,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	beq	1f
 	ld	r5, VCPU_DAWR(r4)
 	ld	r6, VCPU_DAWRX(r4)
-	mtspr	SPRN_DAWR, r5
-	mtspr	SPRN_DAWRX, r6
+	mtspr	SPRN_DAWR0, r5
+	mtspr	SPRN_DAWRX0, r6
 1:
 	ld	r7, VCPU_CIABR(r4)
 	ld	r8, VCPU_TAR(r4)
@@ -1766,8 +1766,8 @@ BEGIN_FTR_SECTION
 	 * If the DAWR doesn't work, it's ok to write these here as
 	 * this value should always be zero
 	*/
-	mtspr	SPRN_DAWR, r6
-	mtspr	SPRN_DAWRX, r7
+	mtspr	SPRN_DAWR0, r6
+	mtspr	SPRN_DAWRX0, r7
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 BEGIN_FTR_SECTION
 	ld	r5, STACK_SLOT_TID(r1)
@@ -2577,8 +2577,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	mfmsr	r6
 	andi.	r6, r6, MSR_DR		/* in real mode? */
 	bne	4f
-	mtspr	SPRN_DAWR, r4
-	mtspr	SPRN_DAWRX, r5
+	mtspr	SPRN_DAWR0, r4
+	mtspr	SPRN_DAWRX0, r5
 4:	li	r3, 0
 	blr
 
@@ -3329,7 +3329,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 	mtspr	SPRN_AMR, r0
 	mtspr	SPRN_IAMR, r0
 	mtspr	SPRN_CIABR, r0
-	mtspr	SPRN_DAWRX, r0
+	mtspr	SPRN_DAWRX0, r0
 
 BEGIN_MMU_FTR_SECTION
 	b	4f
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index d1a79f9e0566..effb10c2e32f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1956,7 +1956,7 @@ static void dump_207_sprs(void)
 	printf("hfscr  = %.16lx  dhdes = %.16lx rpr    = %.16lx\n",
 		mfspr(SPRN_HFSCR), mfspr(SPRN_DHDES), mfspr(SPRN_RPR));
 	printf("dawr   = %.16lx  dawrx = %.16lx ciabr  = %.16lx\n",
-		mfspr(SPRN_DAWR), mfspr(SPRN_DAWRX), mfspr(SPRN_CIABR));
+		mfspr(SPRN_DAWR0), mfspr(SPRN_DAWRX0), mfspr(SPRN_CIABR));
 #endif
 }
 
-- 
2.26.2

