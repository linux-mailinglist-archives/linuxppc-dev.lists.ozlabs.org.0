Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEC66384C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 05:43:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrdVv000mz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 15:43:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SM6GJiAu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SM6GJiAu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrdTx6YQZz2xVY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 15:43:01 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A2vv77015859
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZA0UcEkM9tTjAjEfBTsDUaqLCkKizmRT0zTA+KOsfzw=;
 b=SM6GJiAuknLUS8wr59hkAf8HpghNvGM4dRmub4VeojAuB+BJ5IzdrqBBZXmVh3V9XGmM
 AWt5wcjMDGj2UYqRcbfDWysMOBMad0KoVOSRcyploHCylkPMYBnradg0mLFuP16W6Wb6
 Rjt265Qcf+cWASNwa2T2E945dRnVEpJqLoFYPnmb5b52cZNASFhfKBAiUHKXJlJmnsDp
 UcyYV2vHtZLWR2s2oW19aPW5OTF13sIQADH+hQYurV4s6xWOlkmYHfRCCxi6RsIh4+GC
 tzlbewioIQxnQT1roXDGTTLL+EAuD6FJVGORAVlhPiha3C0MF6BU9YA5JTUXSKaMMZ9j AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6k2n4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:42:58 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30A4gS3D031409
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:42:58 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6k2n42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 04:42:58 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30A13FVL017937;
	Tue, 10 Jan 2023 04:42:57 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3my0c7qs6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 04:42:57 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30A4gtUS6357720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 04:42:56 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B3F258059;
	Tue, 10 Jan 2023 04:42:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79E7A58043;
	Tue, 10 Jan 2023 04:42:55 +0000 (GMT)
Received: from localhost (unknown [9.163.4.210])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jan 2023 04:42:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/rtas: upgrade internal arch spinlocks
Date: Mon,  9 Jan 2023 22:42:55 -0600
Message-Id: <20230110044255.122616-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bU2BOZcEwG6N282Mo5vger_H2ySBiVZj
X-Proofpoint-GUID: IG9I7wCuvOr-vAMZpHseGLkfrwh_GpcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=762 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100028
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
Cc: ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the time commit f97bb36f705d ("powerpc/rtas: Turn rtas lock into a
raw spinlock") was written, the spinlock lockup detection code called
__delay(), which will not make progress if the timebase is not
advancing. Since the interprocessor timebase synchronization sequence
for chrp, cell, and some now-unsupported Power models can temporarily
freeze the timebase through an RTAS function (freeze-time-base), the
lock that serializes most RTAS calls was converted to arch_spinlock_t
to prevent kernel hangs in the lockup detection code.

However, commit bc88c10d7e69 ("locking/spinlock/debug: Remove spinlock
lockup detection code") removed that inconvenient property from the
lock debug code several years ago. So now it should be safe to
reintroduce generic locks into the RTAS support code, primarily to
increase lockdep coverage.

Making rtas.lock a spinlock_t would violate lock type nesting rules
because it can be acquired while holding raw locks, e.g. pci_lock and
irq_desc->lock. So convert it to raw_spinlock_t. There's no apparent
reason not to upgrade timebase_lock as well.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas-types.h |  2 +-
 arch/powerpc/kernel/rtas.c            | 52 ++++++++-------------------
 2 files changed, 15 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
index 8df6235d64d1..a58f96eb2d19 100644
--- a/arch/powerpc/include/asm/rtas-types.h
+++ b/arch/powerpc/include/asm/rtas-types.h
@@ -18,7 +18,7 @@ struct rtas_t {
 	unsigned long entry;		/* physical address pointer */
 	unsigned long base;		/* physical address pointer */
 	unsigned long size;
-	arch_spinlock_t lock;
+	raw_spinlock_t lock;
 	struct rtas_args args;
 	struct device_node *dev;	/* virtual address pointer */
 };
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index deded51a7978..a834726f18e3 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -61,7 +61,7 @@ static inline void do_enter_rtas(unsigned long args)
 }
 
 struct rtas_t rtas = {
-	.lock = __ARCH_SPIN_LOCK_UNLOCKED
+	.lock = __RAW_SPIN_LOCK_UNLOCKED(rtas.lock),
 };
 EXPORT_SYMBOL(rtas);
 
@@ -80,28 +80,6 @@ unsigned long rtas_rmo_buf;
 void (*rtas_flash_term_hook)(int);
 EXPORT_SYMBOL(rtas_flash_term_hook);
 
-/* RTAS use home made raw locking instead of spin_lock_irqsave
- * because those can be called from within really nasty contexts
- * such as having the timebase stopped which would lockup with
- * normal locks and spinlock debugging enabled
- */
-static unsigned long lock_rtas(void)
-{
-	unsigned long flags;
-
-	local_irq_save(flags);
-	preempt_disable();
-	arch_spin_lock(&rtas.lock);
-	return flags;
-}
-
-static void unlock_rtas(unsigned long flags)
-{
-	arch_spin_unlock(&rtas.lock);
-	local_irq_restore(flags);
-	preempt_enable();
-}
-
 /*
  * call_rtas_display_status and call_rtas_display_status_delay
  * are designed only for very early low-level debugging, which
@@ -109,14 +87,14 @@ static void unlock_rtas(unsigned long flags)
  */
 static void call_rtas_display_status(unsigned char c)
 {
-	unsigned long s;
+	unsigned long flags;
 
 	if (!rtas.base)
 		return;
 
-	s = lock_rtas();
+	raw_spin_lock_irqsave(&rtas.lock, flags);
 	rtas_call_unlocked(&rtas.args, 10, 1, 1, NULL, c);
-	unlock_rtas(s);
+	raw_spin_unlock_irqrestore(&rtas.lock, flags);
 }
 
 static void call_rtas_display_status_delay(char c)
@@ -534,7 +512,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 {
 	va_list list;
 	int i;
-	unsigned long s;
+	unsigned long flags;
 	struct rtas_args *rtas_args;
 	char *buff_copy = NULL;
 	int ret;
@@ -557,8 +535,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 		return -1;
 	}
 
-	s = lock_rtas();
-
+	raw_spin_lock_irqsave(&rtas.lock, flags);
 	/* We use the global rtas args buffer */
 	rtas_args = &rtas.args;
 
@@ -576,7 +553,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 			outputs[i] = be32_to_cpu(rtas_args->rets[i+1]);
 	ret = (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
 
-	unlock_rtas(s);
+	raw_spin_unlock_irqrestore(&rtas.lock, flags);
 
 	if (buff_copy) {
 		log_error(buff_copy, ERR_TYPE_RTAS_LOG, 0);
@@ -1268,7 +1245,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	buff_copy = get_errorlog_buffer();
 
-	flags = lock_rtas();
+	raw_spin_lock_irqsave(&rtas.lock, flags);
 
 	rtas.args = args;
 	do_enter_rtas(__pa(&rtas.args));
@@ -1279,7 +1256,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	if (be32_to_cpu(args.rets[0]) == -1)
 		errbuf = __fetch_rtas_last_error(buff_copy);
 
-	unlock_rtas(flags);
+	raw_spin_unlock_irqrestore(&rtas.lock, flags);
 
 	if (buff_copy) {
 		if (errbuf)
@@ -1401,19 +1378,18 @@ int __init early_init_dt_scan_rtas(unsigned long node,
 	return 1;
 }
 
-static arch_spinlock_t timebase_lock;
+static DEFINE_RAW_SPINLOCK(timebase_lock);
 static u64 timebase = 0;
 
 void rtas_give_timebase(void)
 {
 	unsigned long flags;
 
-	local_irq_save(flags);
+	raw_spin_lock_irqsave(&timebase_lock, flags);
 	hard_irq_disable();
-	arch_spin_lock(&timebase_lock);
 	rtas_call(rtas_token("freeze-time-base"), 0, 1, NULL);
 	timebase = get_tb();
-	arch_spin_unlock(&timebase_lock);
+	raw_spin_unlock(&timebase_lock);
 
 	while (timebase)
 		barrier();
@@ -1425,8 +1401,8 @@ void rtas_take_timebase(void)
 {
 	while (!timebase)
 		barrier();
-	arch_spin_lock(&timebase_lock);
+	raw_spin_lock(&timebase_lock);
 	set_tb(timebase >> 32, timebase & 0xffffffff);
 	timebase = 0;
-	arch_spin_unlock(&timebase_lock);
+	raw_spin_unlock(&timebase_lock);
 }
-- 
2.37.1

