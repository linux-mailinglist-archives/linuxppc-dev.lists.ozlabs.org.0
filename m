Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FBB76A647
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:25:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tIpxu6x9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHTt52m2z3cmC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:25:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tIpxu6x9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHLC0McQz30JF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:26 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3711AfHe002593
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cp08nUadOdxfRJ/w5v5uIDwmVkTUWOgf27XIAEp8thE=;
 b=tIpxu6x9rMzSp/tfY+q/nF7l2SC/gxl0xwcHgHS3rFt9dqJnv1cIQmNHXS/HgmFWF+gm
 5sHRurSQJX7pXxR2+//AIewznGr0AyCY119nMinkeQS7cWAG0y6YLBILoOfW8F8xMDLw
 ZbEybSjgdJY1NS27DRV1aRQk/t34fOpMkkGU8nTyK+ljj/NASPE59tUHH1JRHOpectHy
 xcxr9uYPRoZE1CZvcQ4W67m/CcE7sBNSRUVWgxigpafctxdeqvN20boqOtZehRSOSAjL
 tte3A+meXqQjESU9xkxtUwX4zjUXBJGBh5MmwMIFsyq5SfU+RyFNSxj78ROpmwsbzcXv xQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6r01ga0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37102L1B017143
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5fajfagh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711IJS858130746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6DBD20049
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46D0020040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:19 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 626AB60460;
	Tue,  1 Aug 2023 11:18:17 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/7] perf/hw_breakpoint: Remove arch breakpoint hooks
Date: Tue,  1 Aug 2023 11:17:44 +1000
Message-ID: <20230801011744.153973-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yhuz0IIMneugto0e1JmckyC3HFqSiro5
X-Proofpoint-ORIG-GUID: yhuz0IIMneugto0e1JmckyC3HFqSiro5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
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

PowerPC was the only user of these hooks, and has been refactored to no
longer require them. There is no need to keep them around, so remove
them to reduce complexity.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 include/linux/hw_breakpoint.h |  3 ---
 kernel/events/hw_breakpoint.c | 28 ----------------------------
 2 files changed, 31 deletions(-)

diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index 7fbb45911273..db199d653dd1 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -90,9 +90,6 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
 extern int dbg_release_bp_slot(struct perf_event *bp);
 extern int reserve_bp_slot(struct perf_event *bp);
 extern void release_bp_slot(struct perf_event *bp);
-int arch_reserve_bp_slot(struct perf_event *bp);
-void arch_release_bp_slot(struct perf_event *bp);
-void arch_unregister_hw_breakpoint(struct perf_event *bp);
 
 extern void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
 
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index c3797701339c..6c2cb4e4f48d 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -523,26 +523,6 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type, int we
 	return 0;
 }
 
-__weak int arch_reserve_bp_slot(struct perf_event *bp)
-{
-	return 0;
-}
-
-__weak void arch_release_bp_slot(struct perf_event *bp)
-{
-}
-
-/*
- * Function to perform processor-specific cleanup during unregistration
- */
-__weak void arch_unregister_hw_breakpoint(struct perf_event *bp)
-{
-	/*
-	 * A weak stub function here for those archs that don't define
-	 * it inside arch/.../kernel/hw_breakpoint.c
-	 */
-}
-
 /*
  * Constraints to check before allowing this new breakpoint counter.
  *
@@ -594,7 +574,6 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
 	enum bp_type_idx type;
 	int max_pinned_slots;
 	int weight;
-	int ret;
 
 	/* We couldn't initialize breakpoint constraints on boot */
 	if (!constraints_initialized)
@@ -613,10 +592,6 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
 	if (max_pinned_slots > hw_breakpoint_slots_cached(type))
 		return -ENOSPC;
 
-	ret = arch_reserve_bp_slot(bp);
-	if (ret)
-		return ret;
-
 	return toggle_bp_slot(bp, true, type, weight);
 }
 
@@ -634,8 +609,6 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
 	enum bp_type_idx type;
 	int weight;
 
-	arch_release_bp_slot(bp);
-
 	type = find_slot_idx(bp_type);
 	weight = hw_breakpoint_weight(bp);
 	WARN_ON(toggle_bp_slot(bp, false, type, weight));
@@ -645,7 +618,6 @@ void release_bp_slot(struct perf_event *bp)
 {
 	struct mutex *mtx = bp_constraints_lock(bp);
 
-	arch_unregister_hw_breakpoint(bp);
 	__release_bp_slot(bp, bp->attr.bp_type);
 	bp_constraints_unlock(mtx);
 }
-- 
2.41.0

