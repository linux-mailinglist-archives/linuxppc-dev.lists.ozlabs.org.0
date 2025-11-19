Return-Path: <linuxppc-dev+bounces-14360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A1C6E906
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnp1Vk7z3fHL;
	Wed, 19 Nov 2025 23:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556382;
	cv=none; b=cCXKySrq5P0QsE1OOTd2TWkz2sX8zL8LX/m5yBs68tBDENy3PfKP4fxUNdgDs2A83cVnZMbw4XNjGBHA9b/rvZifttYgksq9MdqtGRSN/Wf7veINZHZS2JNEZXTcLneUQOE5d8kWau02JgcSVgWmFE7WbqyxkR6exBiVdOMKHvSkQ5sKZkAn7vqy4sd9eMOOyH/1UOmNMXklcJYMdV9DwhVYF4yEih+EIYwmYiXJc4Wa/Qv4+zxvZxhmZHR+gAD50hXLAwD/zMeyFbKPuX5ThrObFVjQS5WI2+nQuPqX+dtmFZaespBZ7inb0sVSohLiyKiKBZhUgeSB0Hc9Mg41OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556382; c=relaxed/relaxed;
	bh=5J8B5BjCgcW7Mhruz5B4PQwUqSYdH0D4WBWeJo3om/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlMT8w5sNYmBfZEJtlBolGMUf0pXk0wjIpHWoDraO7q/4T1/9Lb8ge8SUAH0aO6skzWzqHxodWnvlLuLTpc7Te8fsry3m3c7n1g8Id5hAaYhj9OoFccp/PkOW66l0ptcppO0wZrxK04dq5WxgVhV0fxNsu8NiEOMFuD7S26SnygxW/YJVqfsu6RsfdFicK5rAMvvwncPFQJd3eFtUuPpNKyvISmbQQu4N+OxbzVtloaAxv7xUFPPnPPafiR7SJRKCL8jy1AUrQjFadOISBKrPlFjDvQ/hPvqH9/Q2Aos2SURQJ7tGCx6nRj8ZHMtkOw2jPxoAOGii63oOh6kzFDLvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I9kb7l9T; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I9kb7l9T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnn2n5dz3cbH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:21 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8YP4E018752;
	Wed, 19 Nov 2025 12:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5J8B5BjCgcW7Mhruz
	5B4PQwUqSYdH0D4WBWeJo3om/8=; b=I9kb7l9Tg/JmAzcZlElocub3lYpdK+Ww7
	UM8Z87913ZEG15mQ+rnWBxQlS9WhEb6rHFHhHVcS6bH+C74EzaD816fSb/TJp8SQ
	QgdWG+/pv4n8tkD4WiOaCoeEZD5hM1d3A+kZubFyxo6HI70BMqmDaHeCMrVf85py
	zs4OTef/lDdJrryt0PaizcGDTHPwqtIDiGodZ0SEYJnAmwnz8kMnrL8TYWVMMtRl
	rhYIcBek4NakwQTAYHCS9TYjInvNvUJNt1Q1sLgsH9LAAH69Fy4XiwZvjFAVUElb
	wWeVdrk6WZyGu3xespxhjJlbzrB8THRxmgFl7leOpwBYmFUIk9j+A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCbZF0030455;
	Wed, 19 Nov 2025 12:46:05 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:05 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCgYZg017335;
	Wed, 19 Nov 2025 12:46:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1rcf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:04 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCk02Q34734424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:46:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C52FB20043;
	Wed, 19 Nov 2025 12:46:00 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B134120040;
	Wed, 19 Nov 2025 12:45:56 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:56 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 14/17] powerpc: process steal values at fixed intervals
Date: Wed, 19 Nov 2025 18:14:46 +0530
Message-ID: <20251119124449.1149616-15-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691dbc0e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=Mwgd3rNTb8mxO3DA2-gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwPzSTHu6TiY/
 LgeWngBu52HSuCY95X6iUZ3qmYNWCsB2cffspEqXjYo20LHFE7t55VfXkP0dD0mmYioqJP49bqd
 Sjp7Fmq+dQrgQy4bpB2tdxIYTrsKhIsyInRo/LIYY7zvJg3+ND0uazvv4hakf1pDrYnI8gP7U/E
 Z03uihRlD55kfMhf2O4yLtUcViNcgjfGS8bPQ0U4dvgFSuDrDFeHjdgqfqtZpDbDqvWjEBSQlh+
 5FidER5X0NqQoRdDffVEzilxF9Lyb8os6hk1t+cCbWjahgdHkdp/R2B0bxamiqdQJdHRyuZ5USB
 aNBmCnq5x3xmOmbEoOjpqKZtRi4QOw9liOu4KO0Sfx9+/MsV1Gf7iTA27A7WZp/4E5+ELO0qqw/
 gWBO6L/fBTyqqEQXCna/KoGt2KBlIg==
X-Proofpoint-GUID: XOSyeBmPSa3EeIyM6zLJo6jih1qjXWGY
X-Proofpoint-ORIG-GUID: KX8JCnf3YAZj9vdKHwR0bK2EjEAyqr_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Process steal time at regular intervals. Sum of steal time across the
vCPUs is computed against the time to get the steal ratio.

Only first online CPU does this work. That reduces the racing issues.
This is done only on SPLPAR (non kvm guest). This assumes PowerVM being
the hypervisor.

Originally-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 825b5b4e2b43..c16d97e1a1fe 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -660,10 +660,58 @@ static int __init vcpudispatch_stats_procfs_init(void)
 machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+
+#define STEAL_MULTIPLE 10000
+#define PURR_UPDATE_TB NSEC_PER_SEC
+
+static bool should_cpu_process_steal(int cpu)
+{
+	if (cpu == cpumask_first(cpu_online_mask))
+		return true;
+
+	return false;
+}
+
+static void process_steal(int cpu)
+{
+	static unsigned long next_tb_ns, prev_steal;
+	unsigned long steal_ratio, delta_tb;
+	unsigned long tb_ns = tb_to_ns(mftb());
+	unsigned long steal = 0;
+	unsigned int i;
+
+	if (!should_cpu_process_steal(cpu))
+		return;
+
+	if (tb_ns < next_tb_ns)
+		return;
+
+	for_each_online_cpu(i) {
+		struct lppaca *lppaca = &lppaca_of(i);
+
+		steal += be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
+		steal += be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb));
+	}
+
+	steal = tb_to_ns(steal);
+
+	if (next_tb_ns && prev_steal) {
+		delta_tb = max(tb_ns - (next_tb_ns - PURR_UPDATE_TB), 1);
+		steal_ratio = (steal - prev_steal) * STEAL_MULTIPLE;
+		steal_ratio /= (delta_tb * num_online_cpus());
+		update_soft_entitlement(steal_ratio);
+	}
+
+	next_tb_ns = tb_ns + PURR_UPDATE_TB;
+	prev_steal = steal;
+}
+
 u64 pseries_paravirt_steal_clock(int cpu)
 {
 	struct lppaca *lppaca = &lppaca_of(cpu);
 
+	if (is_shared_processor() && !is_kvm_guest())
+		process_steal(cpu);
 	/*
 	 * VPA steal time counters are reported at TB frequency. Hence do a
 	 * conversion to ns before returning
@@ -2061,6 +2109,17 @@ void pseries_init_ec_vp_cores(void)
 #define STEAL_RATIO_HIGH 400
 #define STEAL_RATIO_LOW  150
 
+/*
+ * [0]<----------->[EC]---->{AC}-->[VP]
+ * EC == Entitled Cores. Guaranteed number of cores by hypervsior.
+ * VP == Virtual Processors. Total number of cores. When there is overcommit
+ * this will be higher than EC.
+ * AC == Available Cores Varies between EC <-> VP.
+ *
+ * If Steal time is high, then reduce Available Cores.
+ * If steal time is low, increase Available Cores
+ */
+
 void update_soft_entitlement(unsigned long steal_ratio)
 {
 	static int prev_direction;
-- 
2.47.3


