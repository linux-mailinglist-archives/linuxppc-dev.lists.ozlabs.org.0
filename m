Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C82243A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 20:59:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7gR85YJrzDr9N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 04:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7gHx1QGSzDrNN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 04:53:32 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HIWvKq054045; Fri, 17 Jul 2020 14:53:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32autbm0be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:53:26 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06HIiGjT110048;
 Fri, 17 Jul 2020 14:53:26 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32autbm0aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:53:26 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HIdgcJ006165;
 Fri, 17 Jul 2020 18:53:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 327527y6mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 18:53:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HIrK6K31326716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 18:53:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B67F55204E;
 Fri, 17 Jul 2020 18:53:20 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.74.95])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3F70D52054;
 Fri, 17 Jul 2020 18:53:17 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, benh@kernel.crashing.org,
 paulus@samba.org, mikey@neuling.org, ego@linux.vnet.ibm.com,
 svaidy@linux.ibm.com, psampat@linux.ibm.com, pratik.r.sampat@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] powerpc/powernv/idle: Rename pnv_first_spr_loss_level
 variable
Date: Sat, 18 Jul 2020 00:23:05 +0530
Message-Id: <20200717185306.60607-3-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200717185306.60607-1-psampat@linux.ibm.com>
References: <20200717185306.60607-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_09:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170129
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the variable name from using "pnv_first_spr_loss_level" to
"pnv_first_fullstate_loss_level".

As pnv_first_spr_loss_level is supposed to be the earliest state that
has OPAL_PM_LOSE_FULL_CONTEXT set, however as shallow states too loose
SPR values, render an incorrect terminology.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index f62904f70fc6..d439e11af101 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -48,7 +48,7 @@ static bool default_stop_found;
  * First stop state levels when SPR and TB loss can occur.
  */
 static u64 pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
-static u64 pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
+static u64 pnv_first_fullstate_loss_level = MAX_STOP_STATE + 1;
 
 /*
  * psscr value and mask of the deepest stop idle state.
@@ -657,7 +657,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		  */
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
-	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
+	if ((psscr & PSSCR_RL_MASK) >= pnv_first_fullstate_loss_level) {
 		sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
 		sprs.fscr	= mfspr(SPRN_FSCR);
@@ -741,7 +741,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	 * just always test PSSCR for SPR/TB state loss.
 	 */
 	pls = (psscr & PSSCR_PLS) >> PSSCR_PLS_SHIFT;
-	if (likely(pls < pnv_first_spr_loss_level)) {
+	if (likely(pls < pnv_first_fullstate_loss_level)) {
 		if (sprs_saved)
 			atomic_stop_thread_idle();
 		goto out;
@@ -1088,7 +1088,7 @@ static void __init pnv_power9_idle_init(void)
 	 * the deepest loss-less (OPAL_PM_STOP_INST_FAST) stop state.
 	 */
 	pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
-	pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
+	pnv_first_fullstate_loss_level = MAX_STOP_STATE + 1;
 	for (i = 0; i < nr_pnv_idle_states; i++) {
 		int err;
 		struct pnv_idle_states_t *state = &pnv_idle_states[i];
@@ -1099,8 +1099,8 @@ static void __init pnv_power9_idle_init(void)
 			pnv_first_tb_loss_level = psscr_rl;
 
 		if ((state->flags & OPAL_PM_LOSE_FULL_CONTEXT) &&
-		     (pnv_first_spr_loss_level > psscr_rl))
-			pnv_first_spr_loss_level = psscr_rl;
+		     (pnv_first_fullstate_loss_level > psscr_rl))
+			pnv_first_fullstate_loss_level = psscr_rl;
 
 		/*
 		 * The idle code does not deal with TB loss occurring
@@ -1111,8 +1111,8 @@ static void __init pnv_power9_idle_init(void)
 		 * compatibility.
 		 */
 		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
-		     (pnv_first_spr_loss_level > psscr_rl))
-			pnv_first_spr_loss_level = psscr_rl;
+		     (pnv_first_fullstate_loss_level > psscr_rl))
+			pnv_first_fullstate_loss_level = psscr_rl;
 
 		err = validate_psscr_val_mask(&state->psscr_val,
 					      &state->psscr_mask,
@@ -1158,7 +1158,7 @@ static void __init pnv_power9_idle_init(void)
 	}
 
 	pr_info("cpuidle-powernv: First stop level that may lose SPRs = 0x%llx\n",
-		pnv_first_spr_loss_level);
+		pnv_first_fullstate_loss_level);
 
 	pr_info("cpuidle-powernv: First stop level that may lose timebase = 0x%llx\n",
 		pnv_first_tb_loss_level);
-- 
2.25.4

