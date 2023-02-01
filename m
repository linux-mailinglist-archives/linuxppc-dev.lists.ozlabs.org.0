Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96274685E94
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:40:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P68NR3Fj5z3f5p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 15:40:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZTTocAF3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZTTocAF3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P68HY74S0z3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 15:35:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3113IEAI029761;
	Wed, 1 Feb 2023 04:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DyFWRIqJjWCeebzbvL85ebvZKhqfAsyiC0aFRmcbhvw=;
 b=ZTTocAF3b/DYquG6dVueL72/3S1vqOLEXkX6M6U/Me3tf8mGTBLuJcXDx4RR+LVaukvr
 SZhU7vppge86pXv5R+pC1SdJp5rXzdbWeeaBraqu2vX70wfhlxPCA3a6FjC39TtruHeZ
 Iqo0LB/5qlTXpNYVsnBsOaRMhfxnEW198ITo3aUWJTARl58cP4QdVYfFLcSJ5wbWZ6t7
 5+0Y8axKxyNIBa47GOJlOl9v29Z8fEvTWzDc2hfAvGloWINM3jn1jIDAx2Tymcnza82j
 TvQLScS35qLpRBAXAvPjozfxvuRymuJk0Ap/pCSf0j6+R96YsfHTsjj7srd2cX3B6MuH 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfcp3d7fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:46 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3114TMeJ015467;
	Wed, 1 Feb 2023 04:35:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfcp3d7f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30V7AIfl026092;
	Wed, 1 Feb 2023 04:35:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ncvuqu3ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:44 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3114Zg3B22938366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 04:35:42 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBDAA20040;
	Wed,  1 Feb 2023 04:35:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E11420043;
	Wed,  1 Feb 2023 04:35:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 04:35:41 +0000 (GMT)
Received: from civic.. (unknown [9.177.78.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A92F260637;
	Wed,  1 Feb 2023 15:35:36 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] powerpc: kcsan: Prevent recursive instrumentation with IRQ save/restores
Date: Wed,  1 Feb 2023 15:34:37 +1100
Message-Id: <20230201043438.1301212-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201043438.1301212-1-rmclure@linux.ibm.com>
References: <20230201043438.1301212-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YHosSSh4K5-ekioyj0invMOZLFoQp3la
X-Proofpoint-GUID: JiQuP7ZS0cCufOgjMEMT5jYPyeAawKue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_01,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=701 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010028
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
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

