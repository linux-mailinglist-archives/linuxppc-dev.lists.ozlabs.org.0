Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEAB7EAAC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 08:14:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ciEHfoko;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STyGd6xzcz3d9H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:14:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ciEHfoko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STyFm5Lz4z30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 18:13:48 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE79cdw021592;
	Tue, 14 Nov 2023 07:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/xcRIxss24vPX7LOcN8YbMFBW+zGe4pjlFCLcTsmRDI=;
 b=ciEHfoko1oUQ75aqAKPKhljOChwTRo++ArDr9En7Xd0sMrSbm0q1HqUGQiUH4YjXfzWN
 t2NyArFVzuorg7mYL3DBSkQtc9ykoH9ySuOvUVLxU660zSU3ohSDyjVu+TVu6dtd90l1
 7KZ6iIjlbAjGWGunEpKpwWvJfbJhhozJneWJ12nDLazlftlb9nI6CqzfhFZGzEwKrwIs
 l2RMNw9pbkaBSxw7K1ugDP8dj/ThRvsCLCVefXlBtrZl9r6bUbu1lFSnQ0RB9lhajvJi
 1F43HU0MZxD5bpD1Eu7on3/78Pw8CVmaiOBbqHXjxRYlMuq1q9H4pb4I7KZyNaX7dwQl 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc48rg30c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 07:13:37 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE79pgr022041;
	Tue, 14 Nov 2023 07:13:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc48rg305-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 07:13:36 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE5QvIP014869;
	Tue, 14 Nov 2023 07:13:36 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamxn64a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 07:13:36 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AE7DZxF8061620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 07:13:35 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AF8558059;
	Tue, 14 Nov 2023 07:13:35 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F4E258058;
	Tue, 14 Nov 2023 07:13:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.56.65])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 07:13:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/sched: Cleanup vcpu_is_preempted()
Date: Tue, 14 Nov 2023 12:42:19 +0530
Message-ID: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fr6bV5ICTGrfZORGoGuG9krcx1-t-gVh
X-Proofpoint-ORIG-GUID: P3eL1KlwpzTTQch_y1hNTSUzVyJNTI-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_05,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140054
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No functional change in this patch. A helper is added to find if
vcpu is dispatched by hypervisor. Use that instead of opencoding.
Also clarify some of the comments.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index ac4279208d63..b78b82d66057 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -76,6 +76,17 @@ static inline bool is_vcpu_idle(int vcpu)
 {
 	return lppaca_of(vcpu).idle;
 }
+
+static inline bool vcpu_is_dispatched(int vcpu)
+{
+	/*
+	 * This is the yield_count.  An "odd" value (low bit on) means that
+	 * the processor is yielded (either because of an OS yield or a
+	 * hypervisor preempt).  An even value implies that the processor is
+	 * currently executing.
+	 */
+	return (!(yield_count_of(vcpu) & 1));
+}
 #else
 static inline bool is_shared_processor(void)
 {
@@ -109,6 +120,10 @@ static inline bool is_vcpu_idle(int vcpu)
 {
 	return false;
 }
+static inline bool vcpu_is_dispatched(int vcpu)
+{
+	return true;
+}
 #endif
 
 #define vcpu_is_preempted vcpu_is_preempted
@@ -134,12 +149,12 @@ static inline bool vcpu_is_preempted(int cpu)
 	 * If the hypervisor has dispatched the target CPU on a physical
 	 * processor, then the target CPU is definitely not preempted.
 	 */
-	if (!(yield_count_of(cpu) & 1))
+	if (vcpu_is_dispatched(cpu))
 		return false;
 
 	/*
-	 * If the target CPU has yielded to Hypervisor but OS has not
-	 * requested idle then the target CPU is definitely preempted.
+	 * if the target CPU is not dispatched and the guest OS
+	 * has not marked the CPU idle, then it is hypervisor preempted.
 	 */
 	if (!is_vcpu_idle(cpu))
 		return true;
@@ -166,7 +181,7 @@ static inline bool vcpu_is_preempted(int cpu)
 
 		/*
 		 * The PowerVM hypervisor dispatches VMs on a whole core
-		 * basis. So we know that a thread sibling of the local CPU
+		 * basis. So we know that a thread sibling of the executing CPU
 		 * cannot have been preempted by the hypervisor, even if it
 		 * has called H_CONFER, which will set the yield bit.
 		 */
@@ -174,15 +189,17 @@ static inline bool vcpu_is_preempted(int cpu)
 			return false;
 
 		/*
-		 * If any of the threads of the target CPU's core are not
-		 * preempted or ceded, then consider target CPU to be
-		 * non-preempted.
+		 * The specific target CPU was marked by guest OS as idle, but
+		 * then also check all other cpus in the core for PowerVM
+		 * because it does core scheduling and one of the vcpu
+		 * of the core getting preempted by hypervisor implies
+		 * other vcpus can also be considered preempted.
 		 */
 		first_cpu = cpu_first_thread_sibling(cpu);
 		for (i = first_cpu; i < first_cpu + threads_per_core; i++) {
 			if (i == cpu)
 				continue;
-			if (!(yield_count_of(i) & 1))
+			if (vcpu_is_dispatched(i))
 				return false;
 			if (!is_vcpu_idle(i))
 				return true;
-- 
2.41.0

