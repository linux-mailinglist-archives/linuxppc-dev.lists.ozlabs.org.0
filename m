Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054D679B26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1TP12c9Tz3fH4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 01:09:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=asSijbNc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=asSijbNc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1THx55BGz3c7v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 01:05:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OC6dnS000958;
	Tue, 24 Jan 2023 14:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UFG0QpGEHiNL5tzvUpHdh4IlPwqKca54ET+B9qTFeFk=;
 b=asSijbNcQ9j5wjRjS3pVsFcbxVxI3tAYkwpdAKEdlNFeYVgh0JZSQubE+RJ22yz4XPqx
 H6FPnwvw0svmEQz82je0CWO1BSPlOSumaJgx4TpQTdszH8BiCjv8oX1BMIxgb97O6LHJ
 2oumKxfnaiyFJXU3UVuwI0prE6UhCepHaWFTD71oTkI38lyR3Vj1mYMypty6L3eL7nBM
 kP1rKvYhUjY4eklbKY5wdrf1Gjvb/TDcoJugxTE59d/xRs33f3ik6LBj5oNkG2676n8P
 ORmlCUqtJ35Qhh1pF6/zWoaSnOGgb652CohQ7hVh9ga9gJ1KlFoBZ+eZw8gEXWR0fC+j 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nacg0pf8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:54 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30ODuevw031112;
	Tue, 24 Jan 2023 14:04:54 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nacg0pf86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:54 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OC30G3004898;
	Tue, 24 Jan 2023 14:04:53 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3n87p7y182-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:53 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OE4pn910093172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 14:04:51 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41ABB58065;
	Tue, 24 Jan 2023 14:04:51 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 253395805D;
	Tue, 24 Jan 2023 14:04:51 +0000 (GMT)
Received: from localhost (unknown [9.163.30.189])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 14:04:51 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/rtas: upgrade internal arch spinlocks
Date: Tue, 24 Jan 2023 08:04:48 -0600
Message-Id: <20230124140448.45938-5-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124140448.45938-1-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A48ixxc1ZDvk6O0s1w6y6LVRxaEv90_e
X-Proofpoint-GUID: lzSHW8yjTGKEs567K_hPdNH_Zkjhi4-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=998
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240127
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

Making rtas_lock a spinlock_t would violate lock type nesting rules
because it can be acquired while holding raw locks, e.g. pci_lock and
irq_desc->lock. So convert it to raw_spinlock_t. There's no apparent
reason not to upgrade timebase_lock as well.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 52 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 0059bb2a8f04..c02edec3c860 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -69,7 +69,7 @@ struct rtas_t rtas;
  * Exceptions to the RTAS serialization requirement (e.g. stop-self)
  * must use a separate rtas_args structure.
  */
-static arch_spinlock_t rtas_lock = __ARCH_SPIN_LOCK_UNLOCKED;
+static DEFINE_RAW_SPINLOCK(rtas_lock);
 static struct rtas_args rtas_args;
 
 DEFINE_SPINLOCK(rtas_data_buf_lock);
@@ -87,28 +87,6 @@ unsigned long rtas_rmo_buf;
 void (*rtas_flash_term_hook)(int);
 EXPORT_SYMBOL_GPL(rtas_flash_term_hook);
 
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
-	arch_spin_lock(&rtas_lock);
-	return flags;
-}
-
-static void unlock_rtas(unsigned long flags)
-{
-	arch_spin_unlock(&rtas_lock);
-	local_irq_restore(flags);
-	preempt_enable();
-}
-
 /*
  * call_rtas_display_status and call_rtas_display_status_delay
  * are designed only for very early low-level debugging, which
@@ -116,14 +94,14 @@ static void unlock_rtas(unsigned long flags)
  */
 static void call_rtas_display_status(unsigned char c)
 {
-	unsigned long s;
+	unsigned long flags;
 
 	if (!rtas.base)
 		return;
 
-	s = lock_rtas();
+	raw_spin_lock_irqsave(&rtas_lock, flags);
 	rtas_call_unlocked(&rtas_args, 10, 1, 1, NULL, c);
-	unlock_rtas(s);
+	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 }
 
 static void call_rtas_display_status_delay(char c)
@@ -541,7 +519,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 {
 	va_list list;
 	int i;
-	unsigned long s;
+	unsigned long flags;
 	struct rtas_args *args;
 	char *buff_copy = NULL;
 	int ret;
@@ -564,8 +542,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 		return -1;
 	}
 
-	s = lock_rtas();
-
+	raw_spin_lock_irqsave(&rtas_lock, flags);
 	/* We use the global rtas args buffer */
 	args = &rtas_args;
 
@@ -583,7 +560,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 			outputs[i] = be32_to_cpu(args->rets[i + 1]);
 	ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
 
-	unlock_rtas(s);
+	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 
 	if (buff_copy) {
 		log_error(buff_copy, ERR_TYPE_RTAS_LOG, 0);
@@ -1275,7 +1252,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	buff_copy = get_errorlog_buffer();
 
-	flags = lock_rtas();
+	raw_spin_lock_irqsave(&rtas_lock, flags);
 
 	rtas_args = args;
 	do_enter_rtas(__pa(&rtas_args));
@@ -1286,7 +1263,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	if (be32_to_cpu(args.rets[0]) == -1)
 		errbuf = __fetch_rtas_last_error(buff_copy);
 
-	unlock_rtas(flags);
+	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 
 	if (buff_copy) {
 		if (errbuf)
@@ -1408,19 +1385,18 @@ int __init early_init_dt_scan_rtas(unsigned long node,
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
@@ -1432,8 +1408,8 @@ void rtas_take_timebase(void)
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

