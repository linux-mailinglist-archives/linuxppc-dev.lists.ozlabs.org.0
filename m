Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADC6FD474
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLKy0D0Zz3fZT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:36:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YzOTbdoJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YzOTbdoJ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDV073Qz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:31:53 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3OR1D012343;
	Wed, 10 May 2023 03:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gN80LWIaP6Gfr/zCsAOj5Fvzeysfp+hDTqzAqVOFZMk=;
 b=YzOTbdoJNeeUhItqhFQ/JzJgJeZCdSN4RiUIosSZo0iE2rIYdyRmz3lSZV1TPCLN9gBP
 pSSI4Ax1O+EFBjqmU0GGX209VFk0RNN3U+RXhOBA9iTAa70pMspQY7eKklS+yn5HMFLx
 85NNDQhnXSHISvOevVzfIS7j2tnV2iY+UmMK+aOivw4WwgHGRbu0U8PQn2Z4gzC212XH
 AZIWN+W1QR+V2cWcrDBho87lPCHEYoEOfnMJRlA1XW7qMT8wlRPON9h6MWr/SZTQTsQa
 ZNvB7koSd83FhDsNuDsuJ1KpgoU0ZrgqdAiByIpCj/+Iahp7Kuv6rvf5WxUhGfv3x+K8 Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg3b4r3ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:41 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3VeTG000302;
	Wed, 10 May 2023 03:31:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg3b4r3a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3DExH013485;
	Wed, 10 May 2023 03:31:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qf896rs0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3Vaep41812686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 539AA20043;
	Wed, 10 May 2023 03:31:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52F8220040;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 11926605AB;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/11] powerpc: powernv: Fix KCSAN datarace warnings on idle_state contention
Date: Wed, 10 May 2023 13:31:12 +1000
Message-Id: <20230510033117.1395895-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t5MKm4rwnScpfm2gfbcwLeziOH4JL28T
X-Proofpoint-GUID: z_nW9AByGhI-vwTp4LVwf1hPD4PBk7ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100021
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
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The idle_state entry in the PACA on PowerNV features a bit which is
atomically tested and set through ldarx/stdcx. to be used as a spinlock.
This lock then guards access to other bit fields of idle_state. KCSAN
cannot differentiate between any of these bitfield accesses as they all
are implemented by 8-byte store/load instructions, thus cores contending
on the bit-lock appear to data race with modifications to idle_state.

Separate the bit-lock entry from the data guarded by the lock to avoid
the possibility of data races being detected by KCSAN.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v2: Remove extraneous WRITE_ONCE on paca thread_idle_state, which are
only read diagnostically.
---
 arch/powerpc/include/asm/paca.h       |  1 +
 arch/powerpc/platforms/powernv/idle.c | 16 +++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index da0377f46597..cb325938766a 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -191,6 +191,7 @@ struct paca_struct {
 #ifdef CONFIG_PPC_POWERNV
 	/* PowerNV idle fields */
 	/* PNV_CORE_IDLE_* bits, all siblings work on thread 0 paca */
+	unsigned long idle_lock; /* A value of 1 means acquired */
 	unsigned long idle_state;
 	union {
 		/* P7/P8 specific fields */
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 841cb7f31f4f..c1e0ecb014a5 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -246,9 +246,9 @@ static inline void atomic_lock_thread_idle(void)
 {
 	int cpu = raw_smp_processor_id();
 	int first = cpu_first_thread_sibling(cpu);
-	unsigned long *state = &paca_ptrs[first]->idle_state;
+	unsigned long *lock = &paca_ptrs[first]->idle_lock;
 
-	while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, state)))
+	while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, lock)))
 		barrier();
 }
 
@@ -258,29 +258,31 @@ static inline void atomic_unlock_and_stop_thread_idle(void)
 	int first = cpu_first_thread_sibling(cpu);
 	unsigned long thread = 1UL << cpu_thread_in_core(cpu);
 	unsigned long *state = &paca_ptrs[first]->idle_state;
+	unsigned long *lock = &paca_ptrs[first]->idle_lock;
 	u64 s = READ_ONCE(*state);
 	u64 new, tmp;
 
-	BUG_ON(!(s & PNV_CORE_IDLE_LOCK_BIT));
+	BUG_ON(!(READ_ONCE(*lock) & PNV_CORE_IDLE_LOCK_BIT));
 	BUG_ON(s & thread);
 
 again:
-	new = (s | thread) & ~PNV_CORE_IDLE_LOCK_BIT;
+	new = s | thread;
 	tmp = cmpxchg(state, s, new);
 	if (unlikely(tmp != s)) {
 		s = tmp;
 		goto again;
 	}
+	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, lock);
 }
 
 static inline void atomic_unlock_thread_idle(void)
 {
 	int cpu = raw_smp_processor_id();
 	int first = cpu_first_thread_sibling(cpu);
-	unsigned long *state = &paca_ptrs[first]->idle_state;
+	unsigned long *lock = &paca_ptrs[first]->idle_lock;
 
-	BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, state));
-	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, state);
+	BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, lock));
+	clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, lock);
 }
 
 /* P7 and P8 */
-- 
2.37.2

