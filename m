Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA5D26F4E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 06:07:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt0fn2w3FzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TqE8WxSV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt0ch1yW1zDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 14:05:53 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08I43PtN060038; Fri, 18 Sep 2020 00:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=YAUrMVL4x2pUs7tqu1nZsTJ6sGbHVRcLIuJecU5LqtA=;
 b=TqE8WxSVFfeZFxp+S+C32h6r8eyaXQ5/O6zjBPs9clgFH3cIJeF4zR6tqcfu4btygGiO
 YpoYP1AAtUmLXy3MgXdGoA07wt1evevQtOYCKakadZD22IL2w7Y74vMq1DK3Dx0jnhKA
 egAHAm7wisDSFU8YPsXewtyU3B/Bqgb9dD6RzygYe6slv5Jip1JCrC/VFT6u4qICMw7y
 BHePryx7WCzDN+XdgumxSEih3VOdEE1QVQ6P/wdhR1HlK9dV+zI6GM20sNLB0m33lDxQ
 GPkJnd25YuFIaTiAes74KWanrhAzflRIhCfJDvAAJEwAoa+AmTczoJwl2lmWEfLRks3t XQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mnbh081u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 00:05:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08I420Ew012226;
 Fri, 18 Sep 2020 04:05:44 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 33k6769ccr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 04:05:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08I45irC54067550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 04:05:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B283AC05B;
 Fri, 18 Sep 2020 04:05:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C08B1AC059;
 Fri, 18 Sep 2020 04:05:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.136.9])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 18 Sep 2020 04:05:40 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/tm: Save and restore AMR on treclaim and trechkpt
Date: Fri, 18 Sep 2020 01:05:36 -0300
Message-Id: <20200918040536.9046-1-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_02:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=852
 impostorscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009180028
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
Cc: mikey@neuling.org, gromero@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Althought AMR is stashed on the checkpoint area, currently we don't save
it to the per thread checkpoint struct after a treclaim and so we don't
restore it either from that struct when we trechkpt. As a consequence when
the transaction is later rolled back kernel space AMR value when the
trechkpt was done appears in userspace.

That commit saves and restores AMR accordingly on treclaim and trechkpt.
Since AMR value is also used in kernel space in other functions, it also
takes care of stashing kernel live AMR into PACA before treclaim and before
trechkpt, restoring it later, just before returning from tm_reclaim and
__tm_recheckpoint.

Is also fixes two nonrelated comments about CR and MSR.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 arch/powerpc/include/asm/paca.h      |  1 +
 arch/powerpc/include/asm/processor.h |  1 +
 arch/powerpc/kernel/asm-offsets.c    |  2 ++
 arch/powerpc/kernel/tm.S             | 31 +++++++++++++++++++++++-----
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9454d29ff4b4..44c605181529 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -179,6 +179,7 @@ struct paca_struct {
 	u64 sprg_vdso;			/* Saved user-visible sprg */
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	u64 tm_scratch;                 /* TM scratch area for reclaim */
+	u64 tm_amr;			/* Saved Kernel AMR for treclaim/trechkpt */
 #endif
 
 #ifdef CONFIG_PPC_POWERNV
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..9f4f6cc033ac 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -220,6 +220,7 @@ struct thread_struct {
 	unsigned long	tm_tar;
 	unsigned long	tm_ppr;
 	unsigned long	tm_dscr;
+	unsigned long   tm_amr;
 
 	/*
 	 * Checkpointed FP and VSX 0-31 register set.
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8711c2164b45..cf1a6d68a91f 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -170,12 +170,14 @@ int main(void)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	OFFSET(PACATMSCRATCH, paca_struct, tm_scratch);
+	OFFSET(PACATMAMR, paca_struct, tm_amr);
 	OFFSET(THREAD_TM_TFHAR, thread_struct, tm_tfhar);
 	OFFSET(THREAD_TM_TEXASR, thread_struct, tm_texasr);
 	OFFSET(THREAD_TM_TFIAR, thread_struct, tm_tfiar);
 	OFFSET(THREAD_TM_TAR, thread_struct, tm_tar);
 	OFFSET(THREAD_TM_PPR, thread_struct, tm_ppr);
 	OFFSET(THREAD_TM_DSCR, thread_struct, tm_dscr);
+	OFFSET(THREAD_TM_AMR, thread_struct, tm_amr);
 	OFFSET(PT_CKPT_REGS, thread_struct, ckpt_regs);
 	OFFSET(THREAD_CKVRSTATE, thread_struct, ckvr_state.vr);
 	OFFSET(THREAD_CKVRSAVE, thread_struct, ckvrsave);
diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
index 6ba0fdd1e7f8..e178ddb43619 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -152,6 +152,10 @@ _GLOBAL(tm_reclaim)
 	li	r5, 0
 	mtmsrd	r5, 1
 
+        /* Save AMR since it's used elsewhere in kernel space */
+	mfspr	r8, SPRN_AMR
+	std	r8, PACATMAMR(r13)
+
 	/*
 	 * BE CAREFUL HERE:
 	 * At this point we can't take an SLB miss since we have MSR_RI
@@ -245,7 +249,7 @@ _GLOBAL(tm_reclaim)
 	 * but is used in signal return to 'wind back' to the abort handler.
 	 */
 
-	/* ******************** CR,LR,CCR,MSR ********** */
+	/* ***************** CTR, LR, CR, XER ********** */
 	mfctr	r3
 	mflr	r4
 	mfcr	r5
@@ -256,7 +260,6 @@ _GLOBAL(tm_reclaim)
 	std	r5, _CCR(r7)
 	std	r6, _XER(r7)
 
-
 	/* ******************** TAR, DSCR ********** */
 	mfspr	r3, SPRN_TAR
 	mfspr	r4, SPRN_DSCR
@@ -264,6 +267,10 @@ _GLOBAL(tm_reclaim)
 	std	r3, THREAD_TM_TAR(r12)
 	std	r4, THREAD_TM_DSCR(r12)
 
+        /* ******************** AMR **************** */
+        mfspr	r3, SPRN_AMR
+        std	r3, THREAD_TM_AMR(r12)
+
 	/*
 	 * MSR and flags: We don't change CRs, and we don't need to alter MSR.
 	 */
@@ -308,8 +315,6 @@ _GLOBAL(tm_reclaim)
 	std	r3, THREAD_TM_TFHAR(r12)
 	std	r4, THREAD_TM_TFIAR(r12)
 
-	/* AMR is checkpointed too, but is unsupported by Linux. */
-
 	/* Restore original MSR/IRQ state & clear TM mode */
 	ld	r14, TM_FRAME_L0(r1)		/* Orig MSR */
 
@@ -330,6 +335,10 @@ _GLOBAL(tm_reclaim)
 	ld	r0, PACA_DSCR_DEFAULT(r13)
 	mtspr	SPRN_DSCR, r0
 
+        /* Restore kernel saved AMR */
+	ld	r4, PACATMAMR(r13)
+	mtspr	SPRN_AMR, r4
+
 	blr
 
 
@@ -355,6 +364,10 @@ _GLOBAL(__tm_recheckpoint)
 	 */
 	SAVE_NVGPRS(r1)
 
+	/* Save kernel AMR since it's used elsewhare in kernel space */
+	mfspr	r8, SPRN_AMR
+	std	r8, PACATMAMR(r13)
+
 	/* Load complete register state from ts_ckpt* registers */
 
 	addi	r7, r3, PT_CKPT_REGS		/* Thread's ckpt_regs */
@@ -404,7 +417,7 @@ _GLOBAL(__tm_recheckpoint)
 
 restore_gprs:
 
-	/* ******************** CR,LR,CCR,MSR ********** */
+	/* ****************** CTR, LR, XER ************* */
 	ld	r4, _CTR(r7)
 	ld	r5, _LINK(r7)
 	ld	r8, _XER(r7)
@@ -417,6 +430,10 @@ restore_gprs:
 	ld	r4, THREAD_TM_TAR(r3)
 	mtspr	SPRN_TAR,	r4
 
+	/* ******************** AMR ******************** */
+	ld	r4, THREAD_TM_AMR(r3)
+	mtspr	SPRN_AMR, r4
+
 	/* Load up the PPR and DSCR in GPRs only at this stage */
 	ld	r5, THREAD_TM_DSCR(r3)
 	ld	r6, THREAD_TM_PPR(r3)
@@ -522,6 +539,10 @@ restore_gprs:
 	ld	r0, PACA_DSCR_DEFAULT(r13)
 	mtspr	SPRN_DSCR, r0
 
+	/* Restore kernel saved AMR */
+	ld	r4, PACATMAMR(r13)
+	mtspr	SPRN_AMR, r4
+
 	blr
 
 	/* ****************************************************************** */
-- 
2.17.1

