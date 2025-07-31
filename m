Return-Path: <linuxppc-dev+bounces-10480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44487B16BF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 08:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bszSj5qF1z2yLB;
	Thu, 31 Jul 2025 16:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753942773;
	cv=none; b=BWMg8Ey/HBClNiO/keJz7s5B7uB6IONrZoKxAZ4bkosZOGEIBvxjQIETmcRY85BPNbdmvbBQuid5Oq+W/ZZx3ODy1Vk/BzPohL0PQ0uM6QX2T+Xy4kaVMyrSciqHbmLhpxOpQaaie2v9VhEtR7ZPlG7dSAdwkZ+svSYdYRZfrKrrj9WLebYsJhb0GsnY/NRuhHBLs6mvlrRTcWssHYzfmc8WVXU+LG6BQOGgg1gmLiPKQhOIEojqLcF8osKdR+l3FW7jd7HUoAysmHWL7oqFIAGGjLjAWekLj5+xjstFR3B7P3IiIE4RNzz7b+AMWgIV2hQFumNPk46kYz8Wgd89Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753942773; c=relaxed/relaxed;
	bh=ooQjMt1rliXxV+2FSQqx4BvbFyPyaiCDN0IHCi9iTBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhwL5XJMRJlgk1Sci3CeswA1HZJT9f8u1WaxCHlrDCuzlmux6flOk3IvjS7OzYKDSdzXLYYa3z4g8wbkcLtWn6xmQKhkbiwr42hp84BeEG5Hf1KyUbDUes6BLhIoF8um5jIdebPlOFFpeFePwg+DZutvenpMNSBldhq8KUyFS33BQ4RanhyGmx2Y3lfcxyBwT3ecn23Rxu1n8yOrmzxRpUKwOLfTKk7vISZ40LNPN12Oa9S/6tjw3MvO1DlK68zjncOwWkPxoXIHj2ThnPbGA/Mkk24yNEkcvzA681b4KyRoeQcEJ+7RH925mbxIAcInAFSdgNBbIaqmGkYezh97lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BqxUPki/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BqxUPki/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bszSh1t1cz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 16:19:31 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V40TEb022189;
	Thu, 31 Jul 2025 06:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ooQjMt1rliXxV+2FS
	Qqx4BvbFyPyaiCDN0IHCi9iTBQ=; b=BqxUPki/hMoJatr9gXZjqpSVRpYj3m65B
	zxI6Z+z/e2zOcdc8WPcMg1bX0hR4iV8e9DI9gKyuDdA+oJb4uYsTFikpxO5kmRvB
	j6QDsnX9JhPDTLGfaWHEgUEJLRMMXa/xr4QDjX/zlRBwFQgSG8bhe4L39ow/r5t3
	6flC0w/2JrYpghKHCYo7510UU/nw+akcmjnyfXv3O4QFUfh5jNgLX5UDpr+15uXX
	+gPnXL1SX3SA+X+7HKg9hAoUaRlJXOMuNl3tMAe6JR9qNOh+bOvt8ROAEpm9RaTz
	h/4RibeVrQxdF6e1CrDDiFa4SJYmUNiQiYKaphuKYjYIbpVcYiB4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qen0vdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:19:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56V6JJss031301;
	Thu, 31 Jul 2025 06:19:20 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qen0vdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:19:19 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56V44GTt028728;
	Thu, 31 Jul 2025 06:19:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 485c22tunv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 06:19:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56V6JFJV48562440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Jul 2025 06:19:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CE4B20040;
	Thu, 31 Jul 2025 06:19:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A05A02004B;
	Thu, 31 Jul 2025 06:19:13 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.in.ibm.com (unknown [9.79.196.52])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 31 Jul 2025 06:19:13 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/qspinlock: Add spinlock contention tracepoint
Date: Thu, 31 Jul 2025 11:48:53 +0530
Message-ID: <20250731061856.1858898-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725081432.1254986-1-nysal@linux.ibm.com>
References: <20250725081432.1254986-1-nysal@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XEiFeDg0seTburUUD-u0matnynAQ6awk
X-Proofpoint-GUID: wnw1j7A0M4_MRdYENB0M2cj_60UTln6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA0MiBTYWx0ZWRfX24Zok5RtbS4C
 Zgubv+Mjerndci9r08tXRpC3qOLgGzDEe9i//pxztBIVncvMirVGqw/PAttXpykhYenOQrvRrzr
 cPGpYbvDM/j7/f2lJj+ywJFxBq7SgeCAqFNNfwo0Ib58CS90Q3djFMDOBEgxdS03I4PcuF0t3Wq
 x5TxW3nitkCIgrF5TkSVFZONjf2g1Z53zOdQXf0JmqNq1akkRsbse50DQ+9BjMOHFLQSMcL5VIL
 4jnoQW9uE5Cqak5WAy5fklNK0Jcsh4QZu/dakA4io0Ozw10yA9/s7zu4d5zInRwVlcrSQO9BxhA
 p7TMOOE1KAqSixbwBUbhDEN0x+ZTPzjhZeyLsdmapAQaMn7vqZEWQsn0kbt+ahVyzdp3AbMbJs7
 m8yG2NOEtaj4km6NEPGwTph9LUAQeeMXeGkSbC6h3TCzxC7bN0K+uubrq6rLK+kIlfyP+M0U
X-Authority-Analysis: v=2.4 cv=BJOzrEQG c=1 sm=1 tr=0 ts=688b0ae8 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=FRJ3dP_dh1OrdgN2pXUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310042
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a lock contention tracepoint in the queued spinlock slowpath.
Also add the __lockfunc annotation so that in_lock_functions()
works as expected.

Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
 arch/powerpc/lib/qspinlock.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index bcc7e4dff8c3..95ab4cdf582e 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 #include <asm/qspinlock.h>
 #include <asm/paravirt.h>
+#include <trace/events/lock.h>
 
 #define MAX_NODES	4
 
@@ -708,26 +709,26 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	qnodesp->count--;
 }
 
-void queued_spin_lock_slowpath(struct qspinlock *lock)
+void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock)
 {
+	trace_contention_begin(lock, LCB_F_SPIN);
 	/*
 	 * This looks funny, but it induces the compiler to inline both
 	 * sides of the branch rather than share code as when the condition
 	 * is passed as the paravirt argument to the functions.
 	 */
 	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
-		if (try_to_steal_lock(lock, true)) {
+		if (try_to_steal_lock(lock, true))
 			spec_barrier();
-			return;
-		}
-		queued_spin_lock_mcs_queue(lock, true);
+		else
+			queued_spin_lock_mcs_queue(lock, true);
 	} else {
-		if (try_to_steal_lock(lock, false)) {
+		if (try_to_steal_lock(lock, false))
 			spec_barrier();
-			return;
-		}
-		queued_spin_lock_mcs_queue(lock, false);
+		else
+			queued_spin_lock_mcs_queue(lock, false);
 	}
+	trace_contention_end(lock, 0);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
-- 
2.47.0


