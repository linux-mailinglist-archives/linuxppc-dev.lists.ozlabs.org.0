Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69FD68E699
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:29:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBQTH4s77z3fCC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:29:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IiCOJyxg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IiCOJyxg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBQLT3Mjqz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 14:23:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3182fvi6001879;
	Wed, 8 Feb 2023 03:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DyFWRIqJjWCeebzbvL85ebvZKhqfAsyiC0aFRmcbhvw=;
 b=IiCOJyxgbb5qviyUpUh/9uZC6LOOt+Zf+QYCB1/PVr1zwtBDzW3s9QNrKVGeq7GOWURh
 q6DPlTvLElw+zBww1bsaTEflig9gFoUKMCUnc28LlO33qaQrmQCF0LhH1WUZyEM/Rot3
 m/zXgOZdsjKdOj6K+36IYVFOQoKCMwUabgdjFomNzFdSnZd7X3DPCBAQwdieNkjBjzoS
 qdzafp0ZFrowS7fnd4AtsSWb2YWFMwc1vLOfj6RnqQ/nKhZQg6SB7N+gvP4SczYSi4DM
 3jB9zzbSTU4R2WsMzX3o7Ytozwyovl/vY81woVr78BMXEddwApsaNlbGTPOgRkPxjlFZ 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3658t3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:23:09 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3182sf1r015341;
	Wed, 8 Feb 2023 03:23:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3658t3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:23:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317C14Ea001883;
	Wed, 8 Feb 2023 03:23:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06ma0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:23:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3183N3PK43516400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 03:23:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E416320043;
	Wed,  8 Feb 2023 03:23:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60B1920040;
	Wed,  8 Feb 2023 03:23:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 03:23:03 +0000 (GMT)
Received: from civic.. (unknown [9.177.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B6BB660636;
	Wed,  8 Feb 2023 14:22:57 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux.xtensa.org
Subject: [PATCH v4 6/7] powerpc: kcsan: Prevent recursive instrumentation with IRQ save/restores
Date: Wed,  8 Feb 2023 14:22:01 +1100
Message-Id: <20230208032202.1357949-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208032202.1357949-1-rmclure@linux.ibm.com>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: okg78LKirzPcRDrIlkncIed3OuWO2-wq
X-Proofpoint-ORIG-GUID: 2C8iCV3kctIksK96eZ0r6kcL15LtkNoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=768
 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080027
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
Cc: chris@zankel.net, elver@google.com, npiggin@gmail.com, jcmvbkbc@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instrumented memory accesses provided by KCSAN will access core-local
memories (which will save and restore IRQs) as well as restoring IRQs
directly. Avoid recursive instrumentation by applying __no_kcsan
annotation to IRQ restore routines.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/kernel/irq_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index eb2b380e52a0..3a1e0bffe9e0 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -97,7 +97,7 @@ static inline bool irq_happened_test_and_clear(u8 irq)
 	return false;
 }
 
-void replay_soft_interrupts(void)
+__no_kcsan void replay_soft_interrupts(void)
 {
 	struct pt_regs regs;
 
@@ -185,7 +185,7 @@ void replay_soft_interrupts(void)
 }
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_KUAP)
-static inline void replay_soft_interrupts_irqrestore(void)
+__no_kcsan static inline void replay_soft_interrupts_irqrestore(void)
 {
 	unsigned long kuap_state = get_kuap();
 
@@ -209,7 +209,7 @@ static inline void replay_soft_interrupts_irqrestore(void)
 #define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
 #endif
 
-notrace void arch_local_irq_restore(unsigned long mask)
+notrace __no_kcsan void arch_local_irq_restore(unsigned long mask)
 {
 	unsigned char irq_happened;
 
-- 
2.37.2

