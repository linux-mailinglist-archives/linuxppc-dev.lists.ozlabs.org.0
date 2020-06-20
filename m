Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0692023D4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 14:48:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pwTG0M4xzDqND
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 22:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pwR34xHdzDr7j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 22:46:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05KCWNHJ051808; Sat, 20 Jun 2020 08:46:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sfjm35mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Jun 2020 08:46:29 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05KCWTOa052436;
 Sat, 20 Jun 2020 08:46:29 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sfjm35mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Jun 2020 08:46:28 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05KCk3bX004645;
 Sat, 20 Jun 2020 12:46:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 31sa38076v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Jun 2020 12:46:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05KCkNGm61472984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Jun 2020 12:46:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93D2152051;
 Sat, 20 Jun 2020 12:46:23 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.213.186])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9FD3F52050;
 Sat, 20 Jun 2020 12:46:20 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mce: Avoid using addr_to_pfn in realmode
Date: Sat, 20 Jun 2020 18:14:35 +0530
Message-Id: <20200620124435.9900-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-20_03:2020-06-19,
 2020-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 cotscore=-2147483648
 suspectscore=0 mlxscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006200094
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
Cc: mahesh@linux.vnet.ibm.com, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When an UE or memory error exception is encountered the MCE handler
tries to find the pfn using addr_to_pfn() which takes effective
address as an argument, later pfn is used to poison the page where
memory error occurred, recent rework in this area made addr_to_pfn
to run in realmode, which can be fatal as it may try to access
memory outside RMO region.

To fix this move the use of addr_to_pfn to save_mce_event(), which
runs in virtual mode.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c            |  7 +++++
 arch/powerpc/kernel/mce_power.c      | 39 +++++++---------------------
 arch/powerpc/platforms/pseries/ras.c | 12 ++-------
 3 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd90c0eda229..c5581a742367 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -148,6 +148,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	} else if (mce->error_type == MCE_ERROR_TYPE_UE) {
 		mce->u.ue_error.effective_address_provided = true;
 		mce->u.ue_error.effective_address = addr;
+		if (phys_addr == ULONG_MAX && mce->sync_error && addr) {
+			unsigned long pfn;
+
+			pfn = addr_to_pfn(regs, addr);
+			if (pfn != ULONG_MAX)
+				phys_addr = pfn << PAGE_SHIFT;
+		}
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c3b522bff9b4..1b2582818f2b 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -361,8 +361,7 @@ static const struct mce_derror_table mce_p9_derror_table[] = {
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
-static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
-					uint64_t *phys_addr)
+static int mce_find_instr_ea(struct pt_regs *regs, uint64_t *addr)
 {
 	/*
 	 * Carefully look at the NIP to determine
@@ -380,9 +379,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
 		instr = ppc_inst_read((struct ppc_inst *)instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
-			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
-			*phys_addr = (pfn << PAGE_SHIFT);
 			return 0;
 		}
 		/*
@@ -398,8 +395,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 
 static int mce_handle_ierror(struct pt_regs *regs,
 		const struct mce_ierror_table table[],
-		struct mce_error_info *mce_err, uint64_t *addr,
-		uint64_t *phys_addr)
+		struct mce_error_info *mce_err, uint64_t *addr)
 {
 	uint64_t srr1 = regs->msr;
 	int handled = 0;
@@ -455,21 +451,8 @@ static int mce_handle_ierror(struct pt_regs *regs,
 		mce_err->sync_error = table[i].sync_error;
 		mce_err->severity = table[i].severity;
 		mce_err->initiator = table[i].initiator;
-		if (table[i].nip_valid) {
+		if (table[i].nip_valid)
 			*addr = regs->nip;
-			if (mce_err->sync_error &&
-				table[i].error_type == MCE_ERROR_TYPE_UE) {
-				unsigned long pfn;
-
-				if (get_paca()->in_mce < MAX_MCE_DEPTH) {
-					pfn = addr_to_pfn(regs, regs->nip);
-					if (pfn != ULONG_MAX) {
-						*phys_addr =
-							(pfn << PAGE_SHIFT);
-					}
-				}
-			}
-		}
 		return handled;
 	}
 
@@ -484,8 +467,7 @@ static int mce_handle_ierror(struct pt_regs *regs,
 
 static int mce_handle_derror(struct pt_regs *regs,
 		const struct mce_derror_table table[],
-		struct mce_error_info *mce_err, uint64_t *addr,
-		uint64_t *phys_addr)
+		struct mce_error_info *mce_err, uint64_t *addr)
 {
 	uint64_t dsisr = regs->dsisr;
 	int handled = 0;
@@ -562,8 +544,7 @@ static int mce_handle_derror(struct pt_regs *regs,
 			 * kernel/exception-64s.h
 			 */
 			if (get_paca()->in_mce < MAX_MCE_DEPTH)
-				mce_find_instr_ea_and_phys(regs, addr,
-							   phys_addr);
+				mce_find_instr_ea(regs, addr);
 		}
 		found = 1;
 	}
@@ -608,21 +589,19 @@ static long mce_handle_error(struct pt_regs *regs,
 		const struct mce_ierror_table itable[])
 {
 	struct mce_error_info mce_err = { 0 };
-	uint64_t addr, phys_addr = ULONG_MAX;
+	uint64_t addr;
 	uint64_t srr1 = regs->msr;
 	long handled;
 
 	if (SRR1_MC_LOADSTORE(srr1))
-		handled = mce_handle_derror(regs, dtable, &mce_err, &addr,
-				&phys_addr);
+		handled = mce_handle_derror(regs, dtable, &mce_err, &addr);
 	else
-		handled = mce_handle_ierror(regs, itable, &mce_err, &addr,
-				&phys_addr);
+		handled = mce_handle_ierror(regs, itable, &mce_err, &addr);
 
 	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
 		handled = mce_handle_ue_error(regs, &mce_err);
 
-	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
+	save_mce_event(regs, handled, &mce_err, regs->nip, addr, ULONG_MAX);
 
 	return handled;
 }
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f3736fcd98fc..6d64a9fb6130 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -526,7 +526,7 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 {
 	struct mce_error_info mce_err = { 0 };
-	unsigned long eaddr = 0, paddr = 0;
+	unsigned long eaddr = 0, paddr = ULONG_MAX;
 	struct pseries_errorlog *pseries_log;
 	struct pseries_mc_errorlog *mce_log;
 	int disposition = rtas_error_disposition(errp);
@@ -610,16 +610,8 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 		if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED)
 			eaddr = be64_to_cpu(mce_log->effective_address);
 
-		if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
+		if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED)
 			paddr = be64_to_cpu(mce_log->logical_address);
-		} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
-			unsigned long pfn;
-
-			pfn = addr_to_pfn(regs, eaddr);
-			if (pfn != ULONG_MAX)
-				paddr = pfn << PAGE_SHIFT;
-		}
-
 		break;
 	case MC_ERROR_TYPE_SLB:
 		mce_err.error_type = MCE_ERROR_TYPE_SLB;
-- 
2.17.2

