Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B518641B98C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 23:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJtJx48t4z3bhg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 07:42:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UaD6YKqg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UaD6YKqg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJtJ94Jjcz2xY2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 07:42:01 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SJrw3Q025780; 
 Tue, 28 Sep 2021 17:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5glOt95BHaVLLFxD5eQ4TORvbGGsf4cfff0nWY59uDY=;
 b=UaD6YKqgzNdiKqbptLvJAdPrBICXTBzBavJsTscaPSUrOoQBSCI6SaM70qx/XnAxEhmG
 gGQpIDTqc7gM0t75aWGR7wakRdX4gph02JMia6OerVFnvh2QUTEYs82vFYiSoJrfWeWW
 41oh9Kx/wtbh8CR2hWZx9vyKzaLizodcCIQr6Z/+MBcsewNBRAnIXEMPmIpJCkDX54ps
 eYhEWsTN65Qy39YBkoSvY5iIC1uMSWhLijRptg1uoSy+3Cf9YTL8C+wui6PSb5S+Jk5t
 x6BqkQihFPIyTJ4vdAqfOA2hLT+vOaYUFFsZ3LIzjIv6ejF91Q7Z4yZx4MbMCga/a5/O wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bc7p1vm8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18SKsoBM014556;
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bc7p1vm87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SLbB2X017113;
 Tue, 28 Sep 2021 21:41:54 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3b9udbcb81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 21:41:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SLfrwN11796764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 21:41:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 654D16A061;
 Tue, 28 Sep 2021 21:41:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 494996A051;
 Tue, 28 Sep 2021 21:41:53 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 21:41:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/paravirt: vcpu_is_preempted() commentary
Date: Tue, 28 Sep 2021 16:41:46 -0500
Message-Id: <20210928214147.312412-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928214147.312412-1-nathanl@linux.ibm.com>
References: <20210928214147.312412-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9h6O95MRIlQm0RxiO1TeHZxxXKZ4fkRq
X-Proofpoint-GUID: 3VteJImo8SE4iZGA5I1RjME-y4uLVo2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_10,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280126
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add comments more clearly documenting that this function determines whether
hypervisor-level preemption of the VM has occurred.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index bcb7b5f917be..39f173961f6a 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -21,7 +21,7 @@ static inline bool is_shared_processor(void)
 	return static_branch_unlikely(&shared_processor);
 }
 
-/* If bit 0 is set, the cpu has been preempted */
+/* If bit 0 is set, the cpu has been ceded, conferred, or preempted */
 static inline u32 yield_count_of(int cpu)
 {
 	__be32 yield_count = READ_ONCE(lppaca_of(cpu).yield_count);
@@ -92,6 +92,19 @@ static inline void prod_cpu(int cpu)
 #define vcpu_is_preempted vcpu_is_preempted
 static inline bool vcpu_is_preempted(int cpu)
 {
+	/*
+	 * The dispatch/yield bit alone is an imperfect indicator of
+	 * whether the hypervisor has dispatched @cpu to run on a physical
+	 * processor. When it is clear, @cpu is definitely not preempted.
+	 * But when it is set, it means only that it *might* be, subject to
+	 * other conditions. So we check other properties of the VM and
+	 * @cpu first, resorting to the yield count last.
+	 */
+
+	/*
+	 * Hypervisor preemption isn't possible in dedicated processor
+	 * mode by definition.
+	 */
 	if (!is_shared_processor())
 		return false;
 
@@ -100,9 +113,10 @@ static inline bool vcpu_is_preempted(int cpu)
 		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
 
 		/*
-		 * Preemption can only happen at core granularity. This CPU
-		 * is not preempted if one of the CPU of this core is not
-		 * preempted.
+		 * The PowerVM hypervisor dispatches VMs on a whole core
+		 * basis. So we know that a thread sibling of the local CPU
+		 * cannot have been preempted by the hypervisor, even if it
+		 * has called H_CONFER, which will set the yield bit.
 		 */
 		if (cpu_first_thread_sibling(cpu) == first_cpu)
 			return false;
-- 
2.31.1

