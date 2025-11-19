Return-Path: <linuxppc-dev+bounces-14364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9BC6E91B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:47:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLp30SJsz3fLG;
	Wed, 19 Nov 2025 23:46:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556394;
	cv=none; b=CwYc+bqBr4U9fmjfDfr5anfzSmpmguAFLTwNdMa1Xu7ifYAlN0y9TYpNgOsE58a12a//6a6tXBQQB9UhpbDOZCSVP3KBFFx921ORWpFaWgK7VkqvbEwGR/vQdmu7alT3AAcZyGJDRHqyKH+jRGAcV5kkYAtjrcc3izofc82NBb3lzhR1vLAKfbSPfJWpYOT8rT2Gcax7zFz6ll6Z8oD+u7vLT/K3JCCzMW2IlmAQSy6UM6SuqKkDbNhNdL2qGc0cdH37T+Mv1WWd7/Uh3kQ7vB9CPKbZ+RjhZwnkrHok8OVFNFtQoa4pO4bVNNla0+bm0/mSOsjXv0cVoNlK8eFsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556394; c=relaxed/relaxed;
	bh=bC4FT0prtpxQxyi9xHnp6UaXiHLetQNiv/R773ks3pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKT33flJ3zpfvkXwAJfjrmvoiSW7yWB5rZb8OGx0POwLFYrOvw9cCvz9/RS86jpVucLchvx8tH13pgxL+gF93z2gG8XzPKFtW/LpxAGxmmTlXR876Dn6zliFq5SHjzs1wMwlC3kgr8BjECfjHLs+5ob+RTJTXojXw+rHM6vc8GBKcfg0giPpixkE2IOPvb4wuHm1C8A8ZhHtxjgBcUEZ/9shqhii1N6Tvx5LSeKmepvlARRbe2GQ9tqEpvoMpW7EWVB4oCZlF2LPXAPLv2OxDPWjSaOvcDmMgfKxsriIa1IigVJD8+TSV2JTxy2pVp2IXFYZD2MlcGhINHEvqi7ZTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAQ8dMzH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAQ8dMzH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLp21Xvvz3fKj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:34 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ0lHA0029377;
	Wed, 19 Nov 2025 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=bC4FT0prtpxQxyi9x
	Hnp6UaXiHLetQNiv/R773ks3pA=; b=OAQ8dMzHh1WG6JK0R4YRkNAM3xTM4OPLn
	9Y/wilICRxQ5795BLFHy2Lqb5Nn7tagppg/d68QmIybPr2hnr/VOCHA/pFZowBBe
	jhELgCVtXofOzr7R+a5K+zhJi1AmBTFdn1gFny8Z7YHjJe81Dxt0HciJYx7mwmwQ
	ooCFqaG5QKR3TGm2C10gPdSBT0nPa+oG0a3DVjvT8HYOvM/ax2c3ilx6J0Gp7Go+
	oNLSctcQY5cwaYUBhdvT7VFJB724uoGZLcut+FCnEkI4DiqlCgNkc+aBMGmdamWZ
	veNSqme6X/AbfefnvNi42deRlL20rk8QeqrTZAtPe7IcBCZxDo4sQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsqnwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:19 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCSd1U027798;
	Wed, 19 Nov 2025 12:46:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsqnw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJB5GMQ010399;
	Wed, 19 Nov 2025 12:46:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3us8t4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCkEFf53281208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:46:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 225FA20043;
	Wed, 19 Nov 2025 12:46:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 090FB20040;
	Wed, 19 Nov 2025 12:46:10 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:46:09 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 17/17] sysfs: disable arch handling if paravirt file being written
Date: Wed, 19 Nov 2025 18:14:49 +0530
Message-ID: <20251119124449.1149616-18-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: x5LJNu6Qbo1I_UYAOc7fPZpkHAYagJJo
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691dbc1b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=HHdVa3RH26sSkSPV0WkA:9
X-Proofpoint-GUID: AfLQ9MzG0B6_JDro4yvaQwjzqXTixpcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX26W1vF/5BC1G
 U8aD8TDAL37MEiZ1tWo9oyuo0S4RErF44lj/uC6ICo7DtGnsuT5i2ZkJjwjSlAShsVpsZvvpvOd
 iMZbl0l2fljWCGGM6HRFF/LRExO3vp8Fo2Ga9HdtPM5V3KrqlxXrUVTVYHWmoK2Yn4D3AnPlTux
 dLiEQy6kXLvfQDgqR6MMSkocCG1rABp0QCuzKXK4jiknyOGZgYSv3vWZWCTKp3VIdmob1jeU4Fp
 fLmF9QGJk81AJ7Z7ahYlaC52YuTnm9rgna6i5Nggve+3PUu0yfg4vNRC/24twyFnzBjR1qXbr9w
 aLqKAd8rQHqyDX9hZlfIgORqRQrvVdoX8SEJ5oGendonuBUe4E6Q9YTUvks7oYTYUHWbVraRnQ7
 wcEafw+8liXXScGfu1AVpswgA9Ahow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Arch specific code can update the mask based on the steal time. For
debugging it is desired to overwrite the arch logic. Do that with this
debug patch.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
This isn't meant to be merged. It is debug patch helping the previous
one for easier debugging.

 arch/powerpc/platforms/pseries/lpar.c | 3 +++
 drivers/base/cpu.c                    | 2 ++
 include/linux/sched.h                 | 4 ++++
 kernel/sched/core.c                   | 1 +
 4 files changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 090e5c48243b..04bc75e22e7b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -681,6 +681,9 @@ static void process_steal(int cpu)
 	unsigned long steal = 0;
 	unsigned int i;
 
+	if (static_branch_unlikely(&disable_arch_paravirt_handling))
+		return;
+
 	if (!should_cpu_process_steal(cpu))
 		return;
 
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 766584c85051..06a11a69b7c0 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -403,7 +403,9 @@ static ssize_t paravirt_store(struct device *dev,
 	/* No more paravirt cpus */
 	if (cpumask_empty(temp_mask)) {
 		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
+		static_branch_disable(&disable_arch_paravirt_handling);
 	} else {
+		static_branch_enable(&disable_arch_paravirt_handling);
 		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
 
 		/* Enable tick on nohz_full cpu */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 3628edd1468b..1afa5dd5b0ae 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2427,4 +2427,8 @@ extern void migrate_enable(void);
 
 DEFINE_LOCK_GUARD_0(migrate, migrate_disable(), migrate_enable())
 
+#ifdef CONFIG_PARAVIRT
+DECLARE_STATIC_KEY_FALSE(disable_arch_paravirt_handling);
+#endif
+
 #endif
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 65c247c24191..b65a9898c694 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10873,6 +10873,7 @@ void sched_change_end(struct sched_change_ctx *ctx)
 #ifdef CONFIG_PARAVIRT
 struct cpumask __cpu_paravirt_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_paravirt_mask);
+DEFINE_STATIC_KEY_FALSE(disable_arch_paravirt_handling);
 
 static DEFINE_PER_CPU(struct cpu_stop_work, pv_push_task_work);
 
-- 
2.47.3


