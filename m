Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04E68B421
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 03:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P994m46x6z3fDw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 13:22:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rCoj4BkE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rCoj4BkE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P990j3Pv4z3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 13:18:29 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 315MHNrs009348;
	Mon, 6 Feb 2023 02:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DyFWRIqJjWCeebzbvL85ebvZKhqfAsyiC0aFRmcbhvw=;
 b=rCoj4BkEJD1YB4zY84vNWqfCcXLPJjtpnj/xKmkUSvaRzI+uA3tzk9vKlEXfKRDN3ZcB
 cXu/vZjGtzM/vdJEUcrC7jjxMoFKiZTboOdNOh48k2j2GVfXdEVg0nzI2uCIoDMdFohN
 Tn4Bf7mlOnATiF2p0wVyTzaenYzixVbitD519AIMp9n2l//Jbd1T2HNbluyhQyr51NAi
 A6gjv5vWKuyDkEn6DW5VXIouyqbFCMyroB0ZNAm/IKs8mSjIo68QY4kvVr9CpKV+prZ3
 jzDP9MUDGX6fya/LsvMjA4wpk7qOUuLtB/a/4AM2nq2JStIqR1aIf+fPWbyfJqODfPYj tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj176tpwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:22 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3162BejD015006;
	Mon, 6 Feb 2023 02:18:22 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj176tpwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3158T8D2017531;
	Mon, 6 Feb 2023 02:18:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nhemfhb74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3162IH6F24314328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 02:18:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAEAD2004B;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2715020040;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8BBF760636;
	Mon,  6 Feb 2023 13:18:14 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/5] powerpc: kcsan: Prevent recursive instrumentation with IRQ save/restores
Date: Mon,  6 Feb 2023 13:18:00 +1100
Message-Id: <20230206021801.105268-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230206021801.105268-1-rmclure@linux.ibm.com>
References: <20230206021801.105268-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W7PpaC4WRXN0_Fd05navtLgFzLLNNnO5
X-Proofpoint-ORIG-GUID: 7pIcuSn1LWDgc6t-TaUs8uYAxxGsuyE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_01,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=718 phishscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302060018
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

