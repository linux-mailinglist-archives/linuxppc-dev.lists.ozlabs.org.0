Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D4199637
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:18:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s7dn1Hr7zDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 23:18:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s7Tl5BkJzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 23:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VC4jA2054498; Tue, 31 Mar 2020 08:11:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303vfh6cfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02VC4Ylf053782;
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303vfh6cff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:11:16 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02VCAUnd018657;
 Tue, 31 Mar 2020 12:11:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 301x76rn90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 12:11:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02VCBFD045482426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 12:11:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5397128058;
 Tue, 31 Mar 2020 12:11:15 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F30C62805E;
 Tue, 31 Mar 2020 12:11:14 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.71.250])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 12:11:14 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 911B22E346D; Tue, 31 Mar 2020 17:41:10 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 David Gibson <david@gibson.dropbear.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Subject: [RFC/PATCH 2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before guest
 entry
Date: Tue, 31 Mar 2020 17:40:57 +0530
Message-Id: <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_04:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=579 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310106
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
Cc: linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

ISA v3.0 allows the guest to execute a stop instruction. For this, the
PSSCR[ESL|EC] bits need to be cleared by the hypervisor before
scheduling in the guest vCPU.

Currently we always schedule in a vCPU with PSSCR[ESL|EC] bits
set. This patch changes the behaviour to enter the guest with
PSSCR[ESL|EC] bits cleared. This is a RFC patch where we
unconditionally clear these bits. Ideally this should be done
conditionally on platforms where the guest stop instruction has no
Bugs (starting POWER9 DD2.3).

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c            |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 25 +++++++++++++------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cdb7224..36d059a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3424,7 +3424,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_IC, vcpu->arch.ic);
 	mtspr(SPRN_PID, vcpu->arch.pid);
 
-	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
+	mtspr(SPRN_PSSCR, (vcpu->arch.psscr  & ~(PSSCR_EC | PSSCR_ESL)) |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
 
 	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index dbc2fec..c2daec3 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -823,6 +823,18 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_PID, r7
 	mtspr	SPRN_WORT, r8
 BEGIN_FTR_SECTION
+	/* POWER9-only registers */
+	ld	r5, VCPU_TID(r4)
+	ld	r6, VCPU_PSSCR(r4)
+	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
+	lis 	r7, (PSSCR_EC | PSSCR_ESL)@h /* Allow guest to call stop */
+	andc	r6, r6, r7
+	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
+	ld	r7, VCPU_HFSCR(r4)
+	mtspr	SPRN_TIDR, r5
+	mtspr	SPRN_PSSCR, r6
+	mtspr	SPRN_HFSCR, r7
+FTR_SECTION_ELSE
 	/* POWER8-only registers */
 	ld	r5, VCPU_TCSCR(r4)
 	ld	r6, VCPU_ACOP(r4)
@@ -833,18 +845,7 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_CSIGR, r7
 	mtspr	SPRN_TACR, r8
 	nop
-FTR_SECTION_ELSE
-	/* POWER9-only registers */
-	ld	r5, VCPU_TID(r4)
-	ld	r6, VCPU_PSSCR(r4)
-	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
-	oris	r6, r6, PSSCR_EC@h	/* This makes stop trap to HV */
-	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
-	ld	r7, VCPU_HFSCR(r4)
-	mtspr	SPRN_TIDR, r5
-	mtspr	SPRN_PSSCR, r6
-	mtspr	SPRN_HFSCR, r7
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
 8:
 
 	ld	r5, VCPU_SPRG0(r4)
-- 
1.9.4

