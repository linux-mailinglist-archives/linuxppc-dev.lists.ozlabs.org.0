Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734145B7D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:56:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzbxK0ZJnz2yxP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WwuT0QGG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WwuT0QGG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbwX4R9cz2yPT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:55:24 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AO8AsT7017013; 
 Wed, 24 Nov 2021 09:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dXyBflvB3b+NxvEXn7TTfeMdWvJhf3xN4PlcN+0NstI=;
 b=WwuT0QGGjCNlehm3M9y1jvp3SgCv453FASJnuSBnq0uaIG57aGIS3LDviKa6GTyeAUz0
 torBrkfAOqFAFdfmMeOdthAjfhxSXJbDMHDGx/zdgHxdmECpj1S2RtgUA1y13azM+0Lm
 iWy+iS7Zl2WZQMpUTvqUYRQ52Xw6jjkR3Mp7RYhmgM06zVeRB+7QDRaPeWUdXXmDZU6Y
 wbgPcU19ix/HtFhRnl49zAokYn8iC5AkA/Nl6GZQ13uTbqirx5gFRI8zmn1nkXS5RjAu
 9Su0LRqqsoobxg48GXqCk8AyFdGpcx8aqDtvNWDD3ubEjUZUj6YdTy7V5buw0mwc5TJI mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chf6b51ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 09:55:18 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AO8E52c020294;
 Wed, 24 Nov 2021 09:55:18 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chf6b51dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 09:55:18 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AO9qbmJ001081;
 Wed, 24 Nov 2021 09:55:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3cern9pf1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 09:55:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AO9tCbF57606636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 09:55:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D26A352063;
 Wed, 24 Nov 2021 09:55:12 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.domain.name
 (unknown [9.43.72.119])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 88F6752054;
 Wed, 24 Nov 2021 09:55:10 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 2/2] pseries/mce: Refactor the pseries mce handling code
Date: Wed, 24 Nov 2021 15:25:00 +0530
Message-Id: <20211124095500.98656-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
References: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6S7T_jkr9Q1UscH71EdIcayRRpVy1tCv
X-Proofpoint-ORIG-GUID: GyyOWYugHpVBqdJPjfzPft-tT3zo57hA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_03,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111240053
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we are no longer switching on the mmu in realmode
mce handler, Revert the commit 4ff753feab02("powerpc/pseries:
Avoid using addr_to_pfn in real mode") partially, which
introduced functions mce_handle_err_virtmode/realmode() to
separate mce handler code which needed translation to enabled.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/ras.c | 122 +++++++++++----------------
 1 file changed, 49 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 8613f9cc5798..62e1519b8355 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -511,58 +511,17 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 	return 0; /* need to perform reset */
 }
 
-static int mce_handle_err_realmode(int disposition, u8 error_type)
-{
-#ifdef CONFIG_PPC_BOOK3S_64
-	if (disposition == RTAS_DISP_NOT_RECOVERED) {
-		switch (error_type) {
-		case	MC_ERROR_TYPE_ERAT:
-			flush_erat();
-			disposition = RTAS_DISP_FULLY_RECOVERED;
-			break;
-		case	MC_ERROR_TYPE_SLB:
-			/*
-			 * Store the old slb content in paca before flushing.
-			 * Print this when we go to virtual mode.
-			 * There are chances that we may hit MCE again if there
-			 * is a parity error on the SLB entry we trying to read
-			 * for saving. Hence limit the slb saving to single
-			 * level of recursion.
-			 */
-			if (local_paca->in_mce == 1)
-				slb_save_contents(local_paca->mce_faulty_slbs);
-			flush_and_reload_slb();
-			disposition = RTAS_DISP_FULLY_RECOVERED;
-			break;
-		default:
-			break;
-		}
-	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
-		/* Platform corrected itself but could be degraded */
-		pr_err("MCE: limited recovery, system may be degraded\n");
-		disposition = RTAS_DISP_FULLY_RECOVERED;
-	}
-#endif
-	return disposition;
-}
-
-static int mce_handle_err_virtmode(struct pt_regs *regs,
-				   struct rtas_error_log *errp,
-				   struct pseries_mc_errorlog *mce_log,
-				   int disposition)
+static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 {
 	struct mce_error_info mce_err = { 0 };
+	unsigned long eaddr = 0, paddr = 0;
+	struct pseries_errorlog *pseries_log;
+	struct pseries_mc_errorlog *mce_log;
+	int disposition = rtas_error_disposition(errp);
 	int initiator = rtas_error_initiator(errp);
 	int severity = rtas_error_severity(errp);
-	unsigned long eaddr = 0, paddr = 0;
 	u8 error_type, err_sub_type;
 
-	if (!mce_log)
-		goto out;
-
-	error_type = mce_log->error_type;
-	err_sub_type = rtas_mc_error_sub_type(mce_log);
-
 	if (initiator == RTAS_INITIATOR_UNKNOWN)
 		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
 	else if (initiator == RTAS_INITIATOR_CPU)
@@ -588,6 +547,8 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 		mce_err.severity = MCE_SEV_SEVERE;
 	else if (severity == RTAS_SEVERITY_ERROR)
 		mce_err.severity = MCE_SEV_SEVERE;
+	else if (severity == RTAS_SEVERITY_FATAL)
+		mce_err.severity = MCE_SEV_FATAL;
 	else
 		mce_err.severity = MCE_SEV_FATAL;
 
@@ -599,7 +560,18 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 	mce_err.error_class = MCE_ECLASS_UNKNOWN;
 
-	switch (error_type) {
+	if (!rtas_error_extended(errp))
+		goto out;
+
+	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
+	if (!pseries_log)
+		goto out;
+
+	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
+	error_type = mce_log->error_type;
+	err_sub_type = rtas_mc_error_sub_type(mce_log);
+
+	switch (mce_log->error_type) {
 	case MC_ERROR_TYPE_UE:
 		mce_err.error_type = MCE_ERROR_TYPE_UE;
 		mce_common_process_ue(regs, &mce_err);
@@ -692,41 +664,45 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
 		break;
 	case MC_ERROR_TYPE_I_CACHE:
-		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
+		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
 		break;
 	case MC_ERROR_TYPE_UNKNOWN:
 	default:
 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 		break;
 	}
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (disposition == RTAS_DISP_NOT_RECOVERED) {
+		switch (error_type) {
+		case	MC_ERROR_TYPE_SLB:
+		case	MC_ERROR_TYPE_ERAT:
+			/*
+			 * Store the old slb content in paca before flushing.
+			 * Print this when we go to virtual mode.
+			 * There are chances that we may hit MCE again if there
+			 * is a parity error on the SLB entry we trying to read
+			 * for saving. Hence limit the slb saving to single
+			 * level of recursion.
+			 */
+			if (local_paca->in_mce == 1)
+				slb_save_contents(local_paca->mce_faulty_slbs);
+			flush_and_reload_slb();
+			disposition = RTAS_DISP_FULLY_RECOVERED;
+			break;
+		default:
+			break;
+		}
+	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
+		/* Platform corrected itself but could be degraded */
+		pr_err("MCE: limited recovery, system may be degraded\n");
+		disposition = RTAS_DISP_FULLY_RECOVERED;
+	}
+#endif
 out:
 	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
-		       &mce_err, regs->nip, eaddr, paddr);
-	return disposition;
-}
+			&mce_err, regs->nip, eaddr, paddr);
 
-static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
-{
-	struct pseries_errorlog *pseries_log;
-	struct pseries_mc_errorlog *mce_log = NULL;
-	int disposition = rtas_error_disposition(errp);
-	unsigned long msr;
-	u8 error_type;
-
-	if (!rtas_error_extended(errp))
-		goto out;
-
-	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
-	if (!pseries_log)
-		goto out;
-
-	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
-	error_type = mce_log->error_type;
-
-	disposition = mce_handle_err_realmode(disposition, error_type);
-out:
-	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
-					      disposition);
 	return disposition;
 }
 
-- 
2.31.1

