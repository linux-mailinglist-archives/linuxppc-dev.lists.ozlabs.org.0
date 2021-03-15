Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FB33ACEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 09:02:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTRH1tCzz30KJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 19:02:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J/K+MdlW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J/K+MdlW; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTPk0tJZz2xYY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 19:00:57 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F7YFG5041746; Mon, 15 Mar 2021 04:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=S+JuA1/eiv949p3DGm0fUb3cIZSIV5zKoyKueAEcLyo=;
 b=J/K+MdlW7itut/wmZwFdphxAfETY3H82SIbpYjEZJQ30zKZOvveCvytPlsJ3Dpa9PlDO
 n8tmCawXL6EIVxeZ4zMS99GkDpy6GrgBXA/Bg9u0agG/u8J7w22NZGULVcy3e+nMI6VM
 RvO2WPY3SbIUeXKDPp4hPzhoXmgZUOJftKOkuwFC9oJaJYXGvhoBKeKYTykMU+Fz/458
 f6+EwL6qW3i59U/qPJ8DNRcx/WbZFE4BlKb1YibCSg87gE60BxHbDidv0UeIDctAgRbt
 bPg/4rSYuUdGcnY4riVO5m2ppgA+TAwkNFgeGTo3GvgzKcNkXlImqeULAi6rRjirkKUy bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yjcd3f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 04:00:51 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12F7YiY9045024;
 Mon, 15 Mar 2021 04:00:48 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yjcd3dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 04:00:48 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F7qfvS021204;
 Mon, 15 Mar 2021 08:00:47 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 378ubt3wpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 08:00:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12F80kWp30998808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 08:00:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A566D78068;
 Mon, 15 Mar 2021 08:00:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87AF378064;
 Mon, 15 Mar 2021 08:00:46 +0000 (GMT)
Received: from localhost (unknown [9.211.84.92])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 08:00:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries/mobility: handle premature return from
 H_JOIN
Date: Mon, 15 Mar 2021 03:00:45 -0500
Message-Id: <20210315080045.460331-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315080045.460331-1-nathanl@linux.ibm.com>
References: <20210315080045.460331-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150050
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pseries join/suspend sequence in its current form was written with
the assumption that it was the only user of H_PROD and that it needn't
handle spurious successful returns from H_JOIN. That's wrong;
powerpc's paravirt spinlock code uses H_PROD, and CPUs entering
do_join() can be woken prematurely from H_JOIN with a status of
H_SUCCESS as a result. This causes all CPUs to exit the sequence
early, preventing suspend from occurring at all.

Add a 'done' boolean flag to the pseries_suspend_info struct, and have
the waking thread set it before waking the other threads. Threads
which receive H_SUCCESS from H_JOIN retry if the 'done' flag is still
unset.

Fixes: 9327dc0aeef3 ("powerpc/pseries/mobility: use stop_machine for join/suspend")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index a6739ce9feac..e83e0891272d 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -458,9 +458,12 @@ static int do_suspend(void)
  *           or if an error is received from H_JOIN. The thread which performs
  *           the first increment (i.e. sets it to 1) is responsible for
  *           waking the other threads.
+ * @done: False if join/suspend is in progress. True if the operation is
+ *        complete (successful or not).
  */
 struct pseries_suspend_info {
 	atomic_t counter;
+	bool done;
 };
 
 static int do_join(void *arg)
@@ -470,6 +473,7 @@ static int do_join(void *arg)
 	long hvrc;
 	int ret;
 
+retry:
 	/* Must ensure MSR.EE off for H_JOIN. */
 	hard_irq_disable();
 	hvrc = plpar_hcall_norets(H_JOIN);
@@ -485,8 +489,20 @@ static int do_join(void *arg)
 	case H_SUCCESS:
 		/*
 		 * The suspend is complete and this cpu has received a
-		 * prod.
+		 * prod, or we've received a stray prod from unrelated
+		 * code (e.g. paravirt spinlocks) and we need to join
+		 * again.
+		 *
+		 * This barrier orders the return from H_JOIN above vs
+		 * the load of info->done. It pairs with the barrier
+		 * in the wakeup/prod path below.
 		 */
+		smp_mb();
+		if (READ_ONCE(info->done) == false) {
+			pr_info_ratelimited("premature return from H_JOIN on CPU %i, retrying",
+					    smp_processor_id());
+			goto retry;
+		}
 		ret = 0;
 		break;
 	case H_BAD_MODE:
@@ -500,6 +516,13 @@ static int do_join(void *arg)
 
 	if (atomic_inc_return(counter) == 1) {
 		pr_info("CPU %u waking all threads\n", smp_processor_id());
+		WRITE_ONCE(info->done, true);
+		/*
+		 * This barrier orders the store to info->done vs subsequent
+		 * H_PRODs to wake the other CPUs. It pairs with the barrier
+		 * in the H_SUCCESS case above.
+		 */
+		smp_mb();
 		prod_others();
 	}
 	/*
@@ -553,6 +576,7 @@ static int pseries_suspend(u64 handle)
 
 		info = (struct pseries_suspend_info) {
 			.counter = ATOMIC_INIT(0),
+			.done = false,
 		};
 
 		ret = stop_machine(do_join, &info, cpu_online_mask);
-- 
2.29.2

