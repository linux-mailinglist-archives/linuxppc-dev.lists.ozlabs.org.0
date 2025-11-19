Return-Path: <linuxppc-dev+bounces-14329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A63C6CE81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:24:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHh4hQ3z3dJn;
	Wed, 19 Nov 2025 17:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533392;
	cv=none; b=R2mcsZsXO6dBD+KNSoHcvG8SGCZCeeODH7ZgbBM1eOFcjk192p8Ho8P2/mAIc82oFhvk4nVDnap6a9scQz3UUBszKhQKgtBnLARC7JZMgvVXCmxW1YacWM42FLtkb62U6nqezXANxZG8BHEK5wQX6EthC3X/cY+2kPssASTFZRcTeF+hpsbRtpqqv2zJbSkf8U428HEJW7dfZ2zu34LiYgwvkyr8NgVqcQywCgQqUqRgGyhufrySnaA033Ic2NOvwejJd4jvfQgND74ZrjHgoQXSQka0h6dDSuUK2xsIxdjJ5tZFgDtwhcdfceV8oe1YwV8ZuNfHcS8skxGV3idnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533392; c=relaxed/relaxed;
	bh=wEtafgfGnQUfODf3t7EqYsR0pG+SaVAgu1cfS/eyVSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlYQtQul6rfTAqQXAdKb7G1zvDxaiHSF9JWft+FVIEHqUWAlwE7kYYVeH7mFOz6PJmzITE4Ugv2o5rnIMV8fVLZBMTrqvo8d/46plIF+jR34OYkEEV25mqfKSn124zb2Z9998uKpYlLcGZ7u/wAEBfqFyldojpuG9p6WtIkgv0zd6xJChG8F85C5Syeqt6HA2s86KyACroWLgYeiU8GCyZUAJJInkXp++yx1es+WXLzUASMDfhelZS8hBzbk536XUMemqc+K+0WEJk30rSkWwwC4mUczjhM3e5CiZTrqtAQ7OpyuGpJYXjPRx9b/zP+2zDe67RiI159uHK5rLt5+JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cgfo5m0R; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cgfo5m0R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHg5tX6z3dJq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:23:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ4tfiu022500;
	Wed, 19 Nov 2025 06:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wEtafgfGnQUfODf3t
	7EqYsR0pG+SaVAgu1cfS/eyVSY=; b=cgfo5m0R2xFCn1goFFORLA63dHYb+4Ki+
	Zo5Y9aLVyLGNXMNGZaENoKZhuLtkiNO3OA1TeIE3z+DFynGi2PvpzyPtnEvYE+iN
	d+i4yD9fODg3K8IKMN3pRlvl3jJYeRbWbQHEhwiJFfYZTkTVZBPdU1hHziCQDks5
	zC/8aFES9odWBCserHZ+lMYsJSWzV74cNw3OR2NvOLrbTU9wJ5DIcMMibAaN6MBZ
	KuuNyiY/jzMd1jImANojo8qWextx8rDemYXKEYzXu7G4eqvNM9wHSzzdh/U8IIQH
	TvT7UPoctROoF+W2zTQEvWs+EqNQcHUk1EG7UxPzb9SeXIFqdXdKA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwx5gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:49 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6Mn58000355;
	Wed, 19 Nov 2025 06:22:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwx5gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ3N13C005122;
	Wed, 19 Nov 2025 06:22:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk751g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6Mi2i58720690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:44 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 606A820043;
	Wed, 19 Nov 2025 06:22:44 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C7BD20040;
	Wed, 19 Nov 2025 06:22:40 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:40 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [HELPER PATCH 2] helper: disable arch handling if paravirt file being written
Date: Wed, 19 Nov 2025 11:51:00 +0530
Message-ID: <20251119062100.1112520-18-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: 566E-NdEMCyT0aZn6GFRw8QpsmanZnEV
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691d6239 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=HHdVa3RH26sSkSPV0WkA:9
X-Proofpoint-ORIG-GUID: UG-YUdVlBcyyIrC5I96OYqAM-4YEvxoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX01yexI9B0IqU
 YuSzdU0/YODhWmfAyQflLkG4GSN65CcDbH66ttQpUWu1uhOhTDOabk9cqMNRjLqRPwEpBUR6G32
 MtfY2OdYy5ZtgRF/wcNqafp+4uPHts6Xpgd1fYC+GpwYBC2n5SC3GvATP/JBAtDgLfsV3b0lupd
 TuKZEQIFuHXaAIvkmjXoNbugwUL4ji4pqxm1cNag6DcCL7g8LMNyzd3Vw326DqpRkvgdh8G3/4/
 xVtPP1j2wfRdh3wJByV72MP/9Had8uWUQdy865JMxvxiulzYnPtFm5kuSc5Xq5Vk0ELkLUGFUQz
 UUslSNlfSUY864r87auo5/r4JJXR1FAdvvzYWchQpe/iumXYaV4+Mpp046+1MnD7HYJpmlKuCOx
 nk/lY0vk4iYoWO/Ci6qHWxtzXde3jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Arch specific code can update the mask based on the steal time. For
debugging it is desired to overwrite the arch logic. Do that with this
helper script.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
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
index 043e4f4ce1a9..fbaddbfe0b01 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -402,7 +402,9 @@ static ssize_t store_paravirt_cpus(struct device *dev,
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


