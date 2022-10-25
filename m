Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83E60C2C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 06:49:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxKGR0JSJz3dtp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 15:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSWT2N9q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSWT2N9q;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxK9M4DtTz3bjl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 15:44:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P4HRWN005804;
	Tue, 25 Oct 2022 04:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7vNwLBbThkPfmjNMQG2lAiYw3pVsEXJP37SZb8I02Qs=;
 b=QSWT2N9qF946CFFm/KJ28vvbhDI6A80+OZxg2osHLSz1L1lWrBDjUe8gQgApQzzz/pJX
 oKuM4hZTKW40q6aU1/7/43SyI8lGwJcqE61FKGNhPkgESbg5ttisuXLbc3w6LekFd0Fs
 2LcKrfRHy1hnO0aVgb8L+0CnrXtleT+xg2V09EzWnQ5d3EL3wiWBVxsBABsgoccDpHaf
 yvpiDrrXF/3Ue3ElFcdrxb3rl4CweJDYhB08g2dKIrpv0LViZRtCoar77XuwIAQPcc2z
 VF4rKJUnxHEcM8sOHWSGnPzPVQqNfeQ3CFn87Y87YBlV7PjG6nIxckCVnb4fDZkFBGmZ 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke8n58p53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P4KrQf018152;
	Tue, 25 Oct 2022 04:44:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke8n58p4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P4KtiX011986;
	Tue, 25 Oct 2022 04:44:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kdugas0e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P4dBQD34210060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 04:39:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B67CEA4053;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16639A4040;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3E2E060805;
	Tue, 25 Oct 2022 15:44:21 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 1/7] powerpc: Allow clearing and restoring registers independent of saved breakpoint state
Date: Tue, 25 Oct 2022 15:44:03 +1100
Message-Id: <20221025044409.448755-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025044409.448755-1-bgray@linux.ibm.com>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qyMo33HUJf4K0sgWOm6PRWPqpeN9Jvnd
X-Proofpoint-ORIG-GUID: jw4H2Z-ygM20we71IIbK46MYHNsLFqSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=368 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250024
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
2.37.3

