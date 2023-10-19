Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172947CF3C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 11:15:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gELg/ZYV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB2Bh6rMNz3cVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 20:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gELg/ZYV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB29r5cQdz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 20:15:12 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J97Jo7032585;
	Thu, 19 Oct 2023 09:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ABt7ADKK8tsXYCvzjlIR2O1T/6z1I1a3pW7ZzNN+dV0=;
 b=gELg/ZYVZOCDvUy6GAi62Bo7pOSF4DHB1lFZ9CCMvQ9PREVD2/Q7TwQ0gaXKSaeIaERf
 0sfaMx/uXIARfGo2B7IWOzNZ5ZpETwmEXt5Ci86WmnaxT+LQho6GrFKL7XtrblITqvXb
 tFu9m+pptuKN4dLFtV0cUOHZes52AatZ2A0BbHJ0sXrcoaxwFujRpE6VhExwsgl3S4SZ
 RQxV2Odr7VofoiTEbsq73Bsx19feTLStLByHw+2w6y4EC4wwshVamyCCoSwFmK3vzgo8
 Gmxpmy7OTFbFq7zCL/FDcVGajTg4JJPQRVTnANYuc+Xffjeukk23AMwd0z4eUG0HUJc0 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu1hx08um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:15:01 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39J97gcK002996;
	Thu, 19 Oct 2023 09:15:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu1hx08tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:15:00 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39J88Pch020150;
	Thu, 19 Oct 2023 09:14:59 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6anfr3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:14:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39J9Ev9927460236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 09:14:57 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19EF020040;
	Thu, 19 Oct 2023 09:14:57 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6F7420043;
	Thu, 19 Oct 2023 09:14:54 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.109.198.63])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Oct 2023 09:14:54 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4] powerpc/paravirt: Improve vcpu_is_preempted
Date: Thu, 19 Oct 2023 14:44:52 +0530
Message-ID: <20231019091452.95260-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zIHbyWlsj8PSg93w1BZId6u8pJalyHr6
X-Proofpoint-ORIG-GUID: PTeXcGKCHRu49IjQ_8I_63TZW_iZncgV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_06,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190077
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org, Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM Hypervisor dispatches on a whole core basis. In a shared LPAR, a
CPU from a core that is CEDED or preempted may have a larger latency. In
such a scenario, its preferable to choose a different CPU to run.

If one of the CPUs in the core is active, i.e neither CEDED nor
preempted, then consider this CPU as not preempted.

Also if any of the CPUs in the core has yielded but OS has not requested
CEDE or CONFER, then consider this CPU to be preempted.

Correct detection of preempted CPUs is important for detecting idle
CPUs/cores in task scheduler.

Tested-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v2 (http://lkml.kernel.org/r/20231018155838.2332822-1-srikar@linux.vnet.ibm.com) -> v4:
Resolved comments from Michael Ellerman

v1 (http://lkml.kernel.org/r/20231009051740.17683-1-srikar@linux.vnet.ibm.com) -> v2:
Handle lppaca_of(cpu) in !PPC_SPLPAR case.
1. Fixed some compilation issues reported by kernelbot
	a. https://lore.kernel.org/oe-kbuild-all/202310102341.K0sgoqQL-lkp@intel.com/
	b.  https://lore.kernel.org/oe-kbuild-all/202310091636.lElmJkYV-lkp@intel.com/
2. Resolved comments from Shrikanth

---
 arch/powerpc/include/asm/paravirt.h | 47 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index e08513d73119..ac4279208d63 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -71,6 +71,11 @@ static inline void yield_to_any(void)
 {
 	plpar_hcall_norets_notrace(H_CONFER, -1, 0);
 }
+
+static inline bool is_vcpu_idle(int vcpu)
+{
+	return lppaca_of(vcpu).idle;
+}
 #else
 static inline bool is_shared_processor(void)
 {
@@ -100,6 +105,10 @@ static inline void prod_cpu(int cpu)
 	___bad_prod_cpu(); /* This would be a bug */
 }
 
+static inline bool is_vcpu_idle(int vcpu)
+{
+	return false;
+}
 #endif
 
 #define vcpu_is_preempted vcpu_is_preempted
@@ -121,9 +130,23 @@ static inline bool vcpu_is_preempted(int cpu)
 	if (!is_shared_processor())
 		return false;
 
+	/*
+	 * If the hypervisor has dispatched the target CPU on a physical
+	 * processor, then the target CPU is definitely not preempted.
+	 */
+	if (!(yield_count_of(cpu) & 1))
+		return false;
+
+	/*
+	 * If the target CPU has yielded to Hypervisor but OS has not
+	 * requested idle then the target CPU is definitely preempted.
+	 */
+	if (!is_vcpu_idle(cpu))
+		return true;
+
 #ifdef CONFIG_PPC_SPLPAR
 	if (!is_kvm_guest()) {
-		int first_cpu;
+		int first_cpu, i;
 
 		/*
 		 * The result of vcpu_is_preempted() is used in a
@@ -149,11 +172,29 @@ static inline bool vcpu_is_preempted(int cpu)
 		 */
 		if (cpu_first_thread_sibling(cpu) == first_cpu)
 			return false;
+
+		/*
+		 * If any of the threads of the target CPU's core are not
+		 * preempted or ceded, then consider target CPU to be
+		 * non-preempted.
+		 */
+		first_cpu = cpu_first_thread_sibling(cpu);
+		for (i = first_cpu; i < first_cpu + threads_per_core; i++) {
+			if (i == cpu)
+				continue;
+			if (!(yield_count_of(i) & 1))
+				return false;
+			if (!is_vcpu_idle(i))
+				return true;
+		}
 	}
 #endif
 
-	if (yield_count_of(cpu) & 1)
-		return true;
+	/*
+	 * None of the threads in target CPU's core are running but none of
+	 * them were preempted too. Hence assume the target CPU to be
+	 * non-preempted.
+	 */
 	return false;
 }
 

base-commit: eddc90ea2af5933249ea1a78119f2c8ef8d07156
-- 
2.31.1

