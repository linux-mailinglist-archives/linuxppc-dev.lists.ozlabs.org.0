Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E837CE217
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 18:03:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Burc6BeQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9bHC0T9lz3d81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 03:03:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Burc6BeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9bGH5Jbfz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 03:02:31 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IFtNpo010898;
	Wed, 18 Oct 2023 16:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CrA5ifTKPkXf2d1eQ8Ndso/nJHsoQI2THPTkwjlrOjw=;
 b=Burc6BeQGIMOJLHUCdPHIBtvoRLGrXKIt9sjlMUw4Co4p4AX62rZP2FaLhTrsEhnCuZo
 QIjW8JarQnsNrqE5uPHkFkt0/Odfbk04hT6zPch+tJhVfbNUV9tBzCiARAi4wNLKLAKv
 ccfEB0GLr4lSzr4IFpHVT1kX8ReGsWRHO4OHsKC1Bvl9kFsPVvmzd0Kr8mqnfLgolNh6
 gJcArKdO+9bfnttxuOJrXXmhyaipm4pn8FeS1f1N3jHiWCfsJf75xEALiFns2doG4IKY
 soRnAVtR7mqUSExwfzv/lOXzctM+YUwvjKqT7qa0FYlt6Ow78jNmtLMdcdRsuSKZ+PCG 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttjdy83ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:02:18 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39IG2FG2027398;
	Wed, 18 Oct 2023 16:02:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttjdy837a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:02:15 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39IENL4k026885;
	Wed, 18 Oct 2023 15:59:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr5asj0sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 15:59:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39IFxABD11731464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 15:59:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B86220049;
	Wed, 18 Oct 2023 15:59:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B75D2004B;
	Wed, 18 Oct 2023 15:59:07 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.43.47.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 15:59:07 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/paravirt: Improve vcpu_is_preempted
Date: Wed, 18 Oct 2023 21:28:38 +0530
Message-ID: <20231018155838.2332822-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OecCgnMb9qrF0Tvp8MK9i5rXUVnWzkAV
X-Proofpoint-ORIG-GUID: Su2-Mapken8cEtKPTwg0JzpAAKihAm54
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_14,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180129
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

Changelog:
v1 -> v2: Handle lppaca_of(cpu) in !PPC_SPLPAR case.
v1: https://lore.kernel.org/r/20231009051740.17683-1-srikar%40linux.vnet.ibm.com
1. Fixed some compilation issues reported by kernelbot
a. https://lore.kernel.org/oe-kbuild-all/202310102341.K0sgoqQL-lkp@intel.com/
b.  https://lore.kernel.org/oe-kbuild-all/202310091636.lElmJkYV-lkp@intel.com/
2. Resolved comments from Shrikanth

Tested-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 42 ++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index e08513d73119..0372b0093f72 100644
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
@@ -121,9 +130,19 @@ static inline bool vcpu_is_preempted(int cpu)
 	if (!is_shared_processor())
 		return false;
 
+	if (!(yield_count_of(cpu) & 1))
+		return false;
+
+	/*
+	 * If CPU has yielded to Hypervisor but OS has not requested idle
+	 * then this CPU is definitely preempted.
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
@@ -149,11 +168,28 @@ static inline bool vcpu_is_preempted(int cpu)
 		 */
 		if (cpu_first_thread_sibling(cpu) == first_cpu)
 			return false;
+
+		/*
+		 * If any of the threads of this core is not preempted or
+		 * ceded, then consider this CPU to be non-preempted
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
+	 * None of the threads in this core are running but none of
+	 * them were preempted too. Hence assume the thread to be
+	 * non-preempted.
+	 */
 	return false;
 }
 

base-commit: eddc90ea2af5933249ea1a78119f2c8ef8d07156
-- 
2.31.1

