Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C1622342
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xjm1nCLz3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oh9NrUs2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oh9NrUs2;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch2T60z307C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94k2HY029926;
	Wed, 9 Nov 2022 04:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UGb1t5dgWWIhDJLlC2n/RBsLh9/5pNfbJxY0UcBYoEU=;
 b=oh9NrUs2WDvj9mUOP6OawTH9ItUQ26RblpSiYGq/wB0DY6d6FnF9p7ZaYVMe2G/JlLzL
 L4706ZHNLbkWnlEex9MkvNTEqe0cSDKpYZnwAMxhWXOVvfXbWOlbRSWfepqrcgMLvs4m
 UPI5gh15vTuUmX1cC/CCDpdr79wXqy2tTg29JXHwiZZ9Qsbw25+KqLtvAGvPFKvg6mo4
 9NGIy9zvz4KB8zRLFrAFFMn861V8srTtVcmfy++HIKyGGvxyUXyL2SCWeJAHMoG+fMSo
 Jaego8bZoZQqokMYM8yULp4Ivy1we4b/sx+AH5QDTy+Errs+BVMcxsb3Xl+hYB5IRLyD /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr2vx4y10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:36 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A941OAA025329;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr2vx4y0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94pF8A014683;
	Wed, 9 Nov 2022 04:51:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3kngqdd1vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94jl3Z50004258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:45:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 493C25204F;
	Wed,  9 Nov 2022 04:51:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9FA2D5204E;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BA42A60371;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 1/9] powerpc: Allow clearing and restoring registers independent of saved breakpoint state
Date: Wed,  9 Nov 2022 15:51:04 +1100
Message-Id: <20221109045112.187069-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O9tbWHY9AQp6WoDtvlTXZYXJBko4Fx7o
X-Proofpoint-GUID: tFLUn__9L0TaNBjXyIureBIwKco88d9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-08_06,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 mlxlogscore=407 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090028
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jordan Niethe <jniethe5@gmail.com>

For the coming temporary mm used for instruction patching, the
breakpoint registers need to be cleared to prevent them from
accidentally being triggered. As soon as the patching is done, the
breakpoints will be restored.

The breakpoint state is stored in the per-cpu variable current_brk[].
Add a suspend_breakpoints() function which will clear the breakpoint
registers without touching the state in current_brk[]. Add a pair
function restore_breakpoints() which will move the state in
current_brk[] back to the registers.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* Unchanged
v9:	* Renamed ____set_breakpoint to set_hw_breakpoint
	* Renamed pause/unpause to suspend/restore
	* Removed unrelated whitespace change
---
 arch/powerpc/include/asm/debug.h |  2 ++
 arch/powerpc/kernel/process.c    | 38 +++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 86a14736c76c..51c744608f37 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -46,6 +46,8 @@ static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
+void suspend_breakpoints(void);
+void restore_breakpoints(void);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 67da147fe34d..5d5109ed01a5 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -862,10 +862,8 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	return 0;
 }
 
-void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+static void set_hw_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 {
-	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
-
 	if (dawr_enabled())
 		// Power8 or later
 		set_dawr(nr, brk);
@@ -879,6 +877,12 @@ void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 		WARN_ON_ONCE(1);
 }
 
+void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+{
+	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
+	set_hw_breakpoint(nr, brk);
+}
+
 /* Check if we have DAWR or DABR hardware */
 bool ppc_breakpoint_available(void)
 {
@@ -891,6 +895,34 @@ bool ppc_breakpoint_available(void)
 }
 EXPORT_SYMBOL_GPL(ppc_breakpoint_available);
 
+/* Disable the breakpoint in hardware without touching current_brk[] */
+void suspend_breakpoints(void)
+{
+	struct arch_hw_breakpoint brk = {0};
+	int i;
+
+	if (!ppc_breakpoint_available())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++)
+		set_hw_breakpoint(i, &brk);
+}
+
+/*
+ * Re-enable breakpoints suspended by suspend_breakpoints() in hardware
+ * from current_brk[]
+ */
+void restore_breakpoints(void)
+{
+	int i;
+
+	if (!ppc_breakpoint_available())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++)
+		set_hw_breakpoint(i, this_cpu_ptr(&current_brk[i]));
+}
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 
 static inline bool tm_enabled(struct task_struct *tsk)
-- 
2.38.1

