Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC598606F64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 07:26:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MttH14X68z3dx9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 16:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Agjw84GX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Agjw84GX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MttDz1Tcpz3c6N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 16:24:18 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L54CX0025992;
	Fri, 21 Oct 2022 05:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i+ib3j1JzPOh4Y0kDtFKJZG6HU9d5wD8cy/WPvZotpI=;
 b=Agjw84GXXTf2dZPbeWxuhmgodaYs42mv14xFGUF8nbZzwk++TWIGBf6wz8yqIx1vzkY1
 f7pnakKjd2Jm5Pyf6HmE5Z//kKYp0px4KpgAcQUJ2/tL/rICn8wEtWPSRTi8zRla6Jvy
 gNleo6h2a0AvwXp1KkGF4T6R9abNzw7IXoQrrh4LhVuWSugNb7JHRY2cnff5EOxX7HT+
 dpi7VEz0D8lPVOmzZjmn44V/+rf64pk7hm6mJGHqaAkZvLTuhvhx4YYQWaaK/OlXjy5k
 4iwfmMzAJGiKYzWvPyeUM+NKHKMwghcj7RdXtecvn1xQMhEfiWBxcdVYmAxLv/vVcgya EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbmy00r3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:07 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29L5M9Pk028801;
	Fri, 21 Oct 2022 05:24:07 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbmy00r2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29L5LZSV014976;
	Fri, 21 Oct 2022 05:24:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04fra.de.ibm.com with ESMTP id 3k7mg97g4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:05 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29L5Oac739321868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 05:24:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C49D3AE051;
	Fri, 21 Oct 2022 05:24:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25215AE045;
	Fri, 21 Oct 2022 05:24:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 05:24:02 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.89.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2C69A6064A;
	Fri, 21 Oct 2022 16:23:55 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 1/6] powerpc: Allow clearing and restoring registers independent of saved breakpoint state
Date: Fri, 21 Oct 2022 16:22:33 +1100
Message-Id: <20221021052238.580986-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021052238.580986-1-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u8urCdSf-1Rl-xomLj7iUBk3yLm6hX1l
X-Proofpoint-ORIG-GUID: knrwVYkDE9u-VGBdqMWfqcbf0o3ckkc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_01,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=346 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210029
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
breakpoints will be restored. The breakpoint state is stored in the per
cpu variable current_brk[]. Add a pause_breakpoints() function which will
clear the breakpoint registers without touching the state in
current_bkr[]. Add a pair function unpause_breakpoints() which will move
the state in current_brk[] back to the registers.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/debug.h |  2 ++
 arch/powerpc/kernel/process.c    | 36 +++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 86a14736c76c..83f2dc3785e8 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -46,6 +46,8 @@ static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
+void pause_breakpoints(void);
+void unpause_breakpoints(void);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 67da147fe34d..7aee1b30e73c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -685,6 +685,7 @@ DEFINE_INTERRUPT_HANDLER(do_break)
 
 static DEFINE_PER_CPU(struct arch_hw_breakpoint, current_brk[HBP_NUM_MAX]);
 
+
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 /*
  * Set the debug registers back to their default "safe" values.
@@ -862,10 +863,8 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	return 0;
 }
 
-void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+static void ____set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 {
-	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
-
 	if (dawr_enabled())
 		// Power8 or later
 		set_dawr(nr, brk);
@@ -879,6 +878,12 @@ void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 		WARN_ON_ONCE(1);
 }
 
+void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+{
+	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
+	____set_breakpoint(nr, brk);
+}
+
 /* Check if we have DAWR or DABR hardware */
 bool ppc_breakpoint_available(void)
 {
@@ -891,6 +896,31 @@ bool ppc_breakpoint_available(void)
 }
 EXPORT_SYMBOL_GPL(ppc_breakpoint_available);
 
+/* Disable the breakpoint in hardware without touching current_brk[] */
+void pause_breakpoints(void)
+{
+	struct arch_hw_breakpoint brk = {0};
+	int i;
+
+	if (!ppc_breakpoint_available())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++)
+		____set_breakpoint(i, &brk);
+}
+
+/* Renable the breakpoint in hardware from current_brk[] */
+void unpause_breakpoints(void)
+{
+	int i;
+
+	if (!ppc_breakpoint_available())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++)
+		____set_breakpoint(i, this_cpu_ptr(&current_brk[i]));
+}
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 
 static inline bool tm_enabled(struct task_struct *tsk)
-- 
2.37.3

