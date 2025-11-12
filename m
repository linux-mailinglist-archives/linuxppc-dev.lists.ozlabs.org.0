Return-Path: <linuxppc-dev+bounces-14121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C24C51D9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 12:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d611X2zCsz2yvT;
	Wed, 12 Nov 2025 22:11:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762945888;
	cv=none; b=THq2qZI6bDpIIoIYApSZSCTu29jGbYHQG6CctA9Yxn0fHwkpJdmjZHjPQkVAu/3Ksn8ljm/XbgYemy0wb6O6HshU4eCT11FnCwv0KpPxeER4HorL06W3U91dyb+KkG99tVS+5jWuN6ANJiuLl9tfW587gt3+Rkku09siFkbopjCnChL5QbP3QlIN0OL/pJRnZNclt66Fponh5f0cWFpjSIwuaDy+JRat8bySKaDQQ+2fbfZV1xsV03YJGqmz/aLKr9/zq7Is2bvLGy33THz/CVRs0MKXl0khzPbHfKJ9VyWQ5mZOjC36TLvckXOoYpY0JOJgP4M577CuVFcoNa16YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762945888; c=relaxed/relaxed;
	bh=J675kF1+i8HbvOkyOMSY/G/epZKwrIvGkqaObW2ihFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nn3dFhw+Ty0O+pYJ8CunABZwCx75tjk8R2OlYhRsMYVYHFVDsHRMCLBnbmGNXoDcBj/1HNd+gZU0FIbzPIjjwSu8ATgR9L36BPzxWv6mGcb9ibsuSqWXy87njkQi/NXloOKIT67z8km+yUIvIhN5RQ3HseKIJzVITv98Wv8aOelemOqhqiE49FiZkjc0GaQuc/E61KOlJFM1YeJFwPJxcHX58FcRqu0IUBLXIqISOU+kVLk4BmO/120RbhSN6N8aanUWVAcXQcs3Cur/2Xh1l98A8lC7AVqm62ehN2aQJvaR8WJwq1izQnJuu6Pm5JJhd+jKx5n30JJGL1O7OqpaMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFmkHmN2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFmkHmN2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d611W23hcz2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 22:11:26 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABMKGi7018118;
	Wed, 12 Nov 2025 11:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=J675kF1+i8HbvOkyO
	MSY/G/epZKwrIvGkqaObW2ihFI=; b=kFmkHmN2qV1Q5JxTfD3qL5yTjAgidUiYb
	XOmsILor30HMTtQNpNtuwZntwk92Jq499niddAHLSSDoDCv789dakqXsOMFWoFR+
	6tUO6mhCxNY3IXVHndt9hUDFpeRMXeyu/JIsNWStDkiCCwA/ke0EEvR3G3KCPeX6
	GJf/fUnKlnMW56rxVzn625oZii23jcXK9lGAXvljUfq+pDm8aidT7Fa4H2IVTngS
	VpNcmtrg4vvQ4wlTDvmCE6Lc8N7N+Jx/Vs5L4/Ipe3c9Ni9HH8Njgb8BYajVMlHA
	PCY6VaaLPcxUvzFDZlFCZq6YUUyUr27LJH3CU53/cpoKZBPOB4OFw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5cj8ur4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:11:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ACB5u3Q027549;
	Wed, 12 Nov 2025 11:11:16 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5cj8ur0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:11:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC9x2tX011600;
	Wed, 12 Nov 2025 11:11:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajw1fevh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:11:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ACBBCZo38666664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Nov 2025 11:11:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0554A20043;
	Wed, 12 Nov 2025 11:11:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE3B620040;
	Wed, 12 Nov 2025 11:11:09 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.124.211.234])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Nov 2025 11:11:09 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH 2/2] pseries/dtl: Remove locks held warning.
Date: Wed, 12 Nov 2025 16:40:51 +0530
Message-ID: <20251112111051.826922-2-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112111051.826922-1-srikar@linux.ibm.com>
References: <20251112111051.826922-1-srikar@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Ss+dKfO0 c=1 sm=1 tr=0 ts=69146b55 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=lZQN2uIWEMd1qkr_TYcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5NSBTYWx0ZWRfX4As0OvEi5a6c
 LqMFvdh98Na3GGM1UX/3cF8q9j72RUQMD6mD7vfyTpJ53AKSdObmL0kWDV6HXr8iu+2/mqsq2Lo
 BWgXfN5JQq6Hjz0KfavC/JHbaPhncPtke7QGDxUooMGUrs/0/J4Nt4fOpkDoRsYsCglI1HW1a9r
 /9jFGoBXd05lPqdymg/4CJOquiwzYchqIc4CFoY+/q7vL0tstowaCF121LoiNlHCD/2HrmRCmkK
 bw3V8xUwmp+VqrxPHj5wNw6wxdkcNE2usoOoItUHGa2U00rv16A1y6MMwOsrVfN6vFye/o4WUGz
 NraZyfep5myUj0e4Q1yZMJHQXpxPr5EJXWMiqSw25KjNo4rMSXwfOHbKEDGhxgoCjjsG3RrHU4T
 /8TKcMbPrBvimbq5fFB9XUsefOd+Ww==
X-Proofpoint-GUID: PcnPr3B_UN59DxQOrXE6r1JKfZhXm07R
X-Proofpoint-ORIG-GUID: 04ul50mpOKfTf9d8jYpZqhSFZEvFTG74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With CONFIG_LOCKDEP enabled, echo 1 | tee /proc/powerpc/vcpudispatch_stats
will result in the below splat.

WARNING: tee/6324 still has locks held!
6.18.0-rc5 Not tainted
------------------------------------
1 lock held by tee/6324:
 #0: c00000000293ddf8 (dtl_access_lock){....}-{3:3}, at: vcpudispatch_stats_write+0x2d8/0x4e8

stack backtrace:
CPU: 24 UID: 0 PID: 6324 Comm: tee Kdump: loaded Not tainted 6.18.0-rc5 #3 VOLUNTARY
Hardware name: IBM,9080-HEU Power11 (architected) 0x820200 0xf000007 of:IBM,FW1110.00 (OK1110_066) hv:phyp pSeries
Call Trace:
 dump_stack_lvl+0x138/0x150 (unreliable)
 debug_check_no_locks_held+0x130/0x14c
 do_exit+0x2e0/0x5dc
 do_group_exit+0x4c/0xc0
 pid_child_should_wake+0x0/0x84
 system_call_exception+0x134/0x340
 system_call_vectored_common+0x15c/0x2ec

Currently, rwsem is held from the time vcpudispatch_stats is enabled
till the vcpudispatch_stats is disabled.  Enabling and disabling of
vcpudispatch_stats may be done either by the same process or by two
different independent processes. If the enabling process exits before
disabling vcpudispatch_stats, this splat is seen. This lock will
eventually be released by the process disabling the
vcpudispatch_stats.

Currently enabling and disabling vcpudispatch_stats takes mutex lock to
synchronize between multiple tasks that may be trying to act at the same
time. Also a rwsem is used to synchronize between vcpudispatch_stats and
dtl.

With this change, rwsem is used along with the dtl_count to not only
synchronize between multiple vcpudispatch_stats and dtl requests.
Now, instead of holding the rwsem lock for the entire duration, rwsem
gets released after dtl_count gets set to -1.

dtl_count of -1 indicates vcpudispatch_stats is enabled.
dtl_count of 0 indicates not active user of dtl
dtl_count of 1 and above indicates active dtl users.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/include/asm/dtl.h        |  1 +
 arch/powerpc/platforms/pseries/dtl.c  | 13 ++++++++++++-
 arch/powerpc/platforms/pseries/lpar.c | 13 +++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/dtl.h b/arch/powerpc/include/asm/dtl.h
index a5c21bc623cb..78fddfc9314d 100644
--- a/arch/powerpc/include/asm/dtl.h
+++ b/arch/powerpc/include/asm/dtl.h
@@ -40,4 +40,5 @@ extern struct rw_semaphore dtl_access_lock;
 extern void register_dtl_buffer(int cpu);
 extern void alloc_dtl_buffers(unsigned long *time_limit);
 
+extern atomic_t dtl_count;
 #endif /* _ASM_POWERPC_DTL_H */
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 6c95781cafb7..e4b7b55ddadc 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -36,8 +36,14 @@ static u8 dtl_event_mask = DTL_LOG_ALL;
  * not cross a 4k boundary.
  */
 static int dtl_buf_entries = N_DISPATCH_LOG;
-static atomic_t dtl_count;
 
+/*
+ * dtl_count indicates the number and type of dtl users.
+ *  0 indicates no active users of dtl / vcpu_dispatchstats.
+ * -1 indicates vcpudispatch_stats user is active.
+ * 1 and above indicates active dtl users.
+ */
+atomic_t dtl_count;
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 
@@ -195,6 +201,11 @@ static int dtl_enable(struct dtl *dtl)
 	if (!down_read_trylock(&dtl_access_lock))
 		return -EBUSY;
 
+	if (atomic_read(&dtl_count) == -1) {
+		up_read(&dtl_access_lock);
+		return -EBUSY;
+	}
+
 	n_entries = dtl_buf_entries;
 	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, cpu_to_node(dtl->cpu));
 	if (!buf) {
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6a415febc53b..b210beefe67b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -175,7 +175,6 @@ static DEFINE_PER_CPU(struct vcpu_dispatch_data, vcpu_disp_data);
 static DEFINE_PER_CPU(u64, dtl_entry_ridx);
 static DEFINE_PER_CPU(struct dtl_worker, dtl_workers);
 static enum cpuhp_state dtl_worker_state;
-static DEFINE_MUTEX(dtl_enable_mutex);
 static int vcpudispatch_stats_on __read_mostly;
 static int vcpudispatch_stats_freq = 50;
 static __be32 *vcpu_associativity, *pcpu_associativity;
@@ -464,7 +463,8 @@ static int dtl_worker_enable(unsigned long *time_limit)
 {
 	int rc = 0, state;
 
-	if (!down_write_trylock(&dtl_access_lock)) {
+	/* Return if dtl is already active */
+	if (atomic_read(&dtl_count) != 0) {
 		rc = -EBUSY;
 		goto out;
 	}
@@ -480,11 +480,11 @@ static int dtl_worker_enable(unsigned long *time_limit)
 		pr_err("vcpudispatch_stats: unable to setup workqueue for DTL processing\n");
 		free_dtl_buffers(time_limit);
 		reset_global_dtl_mask();
-		up_write(&dtl_access_lock);
 		rc = -EINVAL;
 		goto out;
 	}
 	dtl_worker_state = state;
+	atomic_set(&dtl_count, -1);
 
 out:
 	return rc;
@@ -495,7 +495,7 @@ static void dtl_worker_disable(unsigned long *time_limit)
 	cpuhp_remove_state(dtl_worker_state);
 	free_dtl_buffers(time_limit);
 	reset_global_dtl_mask();
-	up_write(&dtl_access_lock);
+	atomic_set(&dtl_count, 0);
 }
 
 static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
@@ -519,7 +519,8 @@ static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 		return rc ? rc : -EINVAL;
 	}
 
-	mutex_lock(&dtl_enable_mutex);
+	if (!down_write_trylock(&dtl_access_lock))
+		return -EBUSY;
 
 	if ((cmd == 0 && !vcpudispatch_stats_on) ||
 			(cmd == 1 && vcpudispatch_stats_on))
@@ -551,7 +552,7 @@ static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 	vcpudispatch_stats_on = cmd;
 
 out:
-	mutex_unlock(&dtl_enable_mutex);
+	up_write(&dtl_access_lock);
 	if (rc)
 		return rc;
 	return count;
-- 
2.43.7


