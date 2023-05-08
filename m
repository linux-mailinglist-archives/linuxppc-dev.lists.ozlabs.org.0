Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E92956F9D99
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4PP5JXcz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:05:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jWGYaAQo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jWGYaAQo;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Kb2nmgz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:01:54 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3481Q5XJ002026;
	Mon, 8 May 2023 02:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tkF3uGP/Xkby8DCuvcQOJS39vLakzFsuNg3W0HnUGoQ=;
 b=jWGYaAQogYPsgxK7hKpR2Q4aBo9Xzgz39dfgD9pjgKSGMAEkec8iGg5ujfVhymel4/D7
 RILUTqVeOtsaDjrcZSBAHA3xI0m5jq6yeyh1YgQKJtw68WftEImzlyfgCdBqXCpVHsgb
 kfBU4epREozuWr0OI9VwUxtCE49R6TJl4K5q6rk1br98cCpSdm9Ys1t4dWvPtMFuRZF9
 P+ED61MaZtZecFUPm/0IC17VHInoFiYqLhO/b08IJjMNkjV5CNrOOZqGel/kAVUyDN62
 KUYAmh3LVYSPI+8ulMnJTwuVTW/A5ybPaTVYGW77NySMmMQHmBnFYNQ3kiIMDWiTHgid RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdm3139pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:46 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481kxNc030448;
	Mon, 8 May 2023 02:01:45 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdm3139nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:45 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3481fEBJ013975;
	Mon, 8 May 2023 02:01:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qdeh68txm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821fwu26608316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2124920040;
	Mon,  8 May 2023 02:01:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2005B20043;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 58A98605B2;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/12] powerpc: powernv: Fix KCSAN datarace warnings on idle_state contention
Date: Mon,  8 May 2023 12:01:15 +1000
Message-Id: <20230508020120.218494-8-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MnAk8kYx3r-I4SC5vbKV9yW0v0yRb3zW
X-Proofpoint-ORIG-GUID: up9ajB8EmtO4XBd4ArvTt2AXEUZeAgp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080009
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
Cc: Rohan McLure <rmclure@ibm.com>, arnd@arndb.de, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
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
Signed-off-by: Rohan McLure <rmclure@ibm.com>
---
 arch/powerpc/include/asm/paca.h       |  1 +
 arch/powerpc/platforms/powernv/idle.c | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

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
index 841cb7f31f4f..97dbb7bc2b00 100644
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
@@ -380,9 +382,9 @@ static unsigned long power7_idle_insn(unsigned long type)
 		sprs.uamor	= mfspr(SPRN_UAMOR);
 	}
 
-	local_paca->thread_idle_state = type;
+	WRITE_ONCE(local_paca->thread_idle_state, type);
 	srr1 = isa206_idle_insn_mayloss(type);		/* go idle */
-	local_paca->thread_idle_state = PNV_THREAD_RUNNING;
+	WRITE_ONCE(local_paca->thread_idle_state, PNV_THREAD_RUNNING);
 
 	WARN_ON_ONCE(!srr1);
 	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
-- 
2.37.2

